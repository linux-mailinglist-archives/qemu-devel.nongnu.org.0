Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF802D2E9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 02:41:47 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44870 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVmf4-0002xo-FX
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 20:41:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hVme8-0002cT-1N
	for qemu-devel@nongnu.org; Tue, 28 May 2019 20:40:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hVme7-0004ms-6B
	for qemu-devel@nongnu.org; Tue, 28 May 2019 20:40:47 -0400
Received: from mga12.intel.com ([192.55.52.136]:62204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hVme6-0004j2-U0
	for qemu-devel@nongnu.org; Tue, 28 May 2019 20:40:47 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 May 2019 17:40:44 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga006.jf.intel.com with ESMTP; 28 May 2019 17:40:44 -0700
Date: Wed, 29 May 2019 08:40:15 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Juan Quintela <quintela@redhat.com>
Message-ID: <20190529004015.GD24428@richard>
References: <20190528014703.21030-1-richardw.yang@linux.intel.com>
	<20190528014703.21030-4-richardw.yang@linux.intel.com>
	<87ef4j8055.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ef4j8055.fsf@trasno.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.136
Subject: Re: [Qemu-devel] [PATCH 3/4] migration/ram.c:
 MultiFDSendParams.sem_sync is not really used
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>, dgilbert@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 28, 2019 at 10:16:06AM +0200, Juan Quintela wrote:
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>> Besides init and destroy, MultiFDSendParams.sem_sync is not really used.
>>
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>
>Reviewed-by: Juan Quintela <quintela@redhat.com>
>
>I mad SendParamas and RecvParams identical, but they are different.  You
>are right.

Thanks.

BTW, I found some interesting thing about multifd_send_state->channels_ready.
By checking the value of this semaphore, it grows far beyond what we really
have.

For example, we have default 2 channels which means
multifd_send_state->channels_ready's value is no more than 2. But the actual
value could go to more than 30.

The behavior sounds not right.

-- 
Wei Yang
Help you, Help me

