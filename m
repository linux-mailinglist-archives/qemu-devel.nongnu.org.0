Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11A21E8D2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 May 2019 09:17:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQoAe-0002AI-Dt
	for lists+qemu-devel@lfdr.de; Wed, 15 May 2019 03:17:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hQo8m-00010d-3F
	for qemu-devel@nongnu.org; Wed, 15 May 2019 03:15:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hQnxa-0005n7-P8
	for qemu-devel@nongnu.org; Wed, 15 May 2019 03:04:20 -0400
Received: from mga04.intel.com ([192.55.52.120]:23934)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hQnxZ-0005f3-A3
	for qemu-devel@nongnu.org; Wed, 15 May 2019 03:04:17 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2019 00:04:14 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga005.jf.intel.com with ESMTP; 15 May 2019 00:04:13 -0700
Date: Wed, 15 May 2019 15:03:41 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190515070341.GA24741@richard>
References: <20190424004700.12766-1-richardw.yang@linux.intel.com>
	<20190424004700.12766-3-richardw.yang@linux.intel.com>
	<0eb5e5a5-593e-f4a2-7e2d-a9fed481ab6c@gmail.com>
	<20190426005133.GB25513@richard> <20190514151813.GL2753@work-vm>
	<20190515063827.GB11845@richard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190515063827.GB11845@richard>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
Subject: Re: [Qemu-devel] [PATCH 2/4] migration/savevm: use
 migration_is_blocked to validate
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
Cc: quintela@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 15, 2019 at 02:38:27PM +0800, Wei Yang wrote:
>On Tue, May 14, 2019 at 04:18:14PM +0100, Dr. David Alan Gilbert wrote:
>>* Wei Yang (richardw.yang@linux.intel.com) wrote:
>>> 
>>> Well, when you look into the source side of migration:
>>> 
>>> qmp_migrate
>>>   migrate_prepare
>>>     migration_is_blocked
>>> 
>>> This means if migration_is_blocked fails, the source will not start migration.
>>> And it is the same as save_snapshot.
>>> 
>>> From my understanding, when we load a vm, it should check the same
>>> requirement.
>>
>>I've been thinking about this, and I think I agree with Daniel on this.
>>The 'migration_blockers' list tells you that something about the
>>*current* state of a device means that it can't be migrated - e.g.
>>a 9pfs with a mounted filesystem can't be migrated.
>>
>>If we're about to reload the state from a snapshot, then the saved
>>snapshot's state must have been migratable, so that's OK.
>>
>
>The situation is on a vm with 'migration_blockers' still could reload from a
>snapshot.
>
>This sounds reasonable. Thanks :-)
>

Well, this is still a little strange. The means source vm and destination vm
could have different configuration. Is this common?

-- 
Wei Yang
Help you, Help me

