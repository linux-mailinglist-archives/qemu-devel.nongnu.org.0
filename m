Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ACDD13EE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 18:23:16 +0200 (CEST)
Received: from localhost ([::1]:52176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIEk6-0001xJ-LC
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 12:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57080)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iI4Cw-0002cl-Mt
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 01:08:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iI4Cv-00059i-Fl
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 01:08:18 -0400
Received: from mga01.intel.com ([192.55.52.88]:31200)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iI4Cv-00052l-5z
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 01:08:17 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Oct 2019 22:08:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,273,1566889200"; d="scan'208";a="394905421"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga006.fm.intel.com with ESMTP; 08 Oct 2019 22:08:13 -0700
Date: Wed, 9 Oct 2019 13:07:56 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 3/3] migration/postcopy: handle POSTCOPY_INCOMING_RUNNING
 corner case properly
Message-ID: <20191009050756.GA9616@richard>
References: <20191001100122.17730-1-richardw.yang@linux.intel.com>
 <20191001100122.17730-4-richardw.yang@linux.intel.com>
 <20191008164046.GF3441@work-vm> <20191009010204.GC26203@richard>
 <20191009041225.GF10750@xz-x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009041225.GF10750@xz-x1>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.88
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com,
 Wei Yang <richardw.yang@linux.intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 09, 2019 at 12:12:25PM +0800, Peter Xu wrote:
>On Wed, Oct 09, 2019 at 09:02:04AM +0800, Wei Yang wrote:
>> On Tue, Oct 08, 2019 at 05:40:46PM +0100, Dr. David Alan Gilbert wrote:
>> >* Wei Yang (richardw.yang@linux.intel.com) wrote:
>> >> Currently, we set PostcopyState blindly to RUNNING, even we found the
>> >> previous state is not LISTENING. This will lead to a corner case.
>> >> 
>> >> First let's look at the code flow:
>> >> 
>> >> qemu_loadvm_state_main()
>> >>     ret = loadvm_process_command()
>> >>         loadvm_postcopy_handle_run()
>> >>             return -1;
>> >>     if (ret < 0) {
>> >>         if (postcopy_state_get() == POSTCOPY_INCOMING_RUNNING)
>> >>             ...
>> >>     }
>> >> 
>> >> From above snippet, the corner case is loadvm_postcopy_handle_run()
>> >> always sets state to RUNNING. And then it checks the previous state. If
>> >> the previous state is not LISTENING, it will return -1. But at this
>> >> moment, PostcopyState is already been set to RUNNING.
>> >> 
>> >> Then ret is checked in qemu_loadvm_state_main(), when it is -1
>> >> PostcopyState is checked. Current logic would pause postcopy and retry
>> >> if PostcopyState is RUNNING. This is not what we expect, because
>> >> postcopy is not active yet.
>> >> 
>> >> This patch makes sure state is set to RUNNING only previous state is
>> >> LISTENING by introducing an old_state parameter in postcopy_state_set().
>> >> New state only would be set when current state equals to old_state.
>> >> 
>> >> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> >
>> >OK, it's a shame to use a pointer there, but it works.
>> 
>> You mean second parameter of postcopy_state_set()?
>> 
>> I don't have a better idea. Or we introduce a new state
>> POSTCOPY_INCOMING_NOCHECK. Do you feel better with this?
>
>Maybe simply fix loadvm_postcopy_handle_run() to set the state after
>the POSTCOPY_INCOMING_LISTENING check?
>

Set state back to ps if ps is not POSTCOPY_INCOMING_LISTENING?

Sounds like another option.


-- 
Wei Yang
Help you, Help me

