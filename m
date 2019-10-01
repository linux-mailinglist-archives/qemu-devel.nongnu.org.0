Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98604C42F5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 23:49:49 +0200 (CEST)
Received: from localhost ([::1]:48549 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFQ1k-0001CC-2I
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 17:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35547)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iFPMs-0006Nt-9x
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 17:07:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iFPMp-0001dB-CF
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 17:07:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54306)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iFPMp-0001ci-3g
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 17:07:31 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 44E7C8A1C8D;
 Tue,  1 Oct 2019 21:07:30 +0000 (UTC)
Received: from [10.3.116.201] (ovpn-116-201.phx2.redhat.com [10.3.116.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE1E25D6D0;
 Tue,  1 Oct 2019 21:07:29 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] qapi: Allow introspecting fix for savevm's
 cooperation with blockdev
To: Markus Armbruster <armbru@redhat.com>, Peter Krempa <pkrempa@redhat.com>
References: <cover.1568989362.git.pkrempa@redhat.com>
 <992ea9ca130b4fb6dbf82726aa3b1d8040c16944.1568989362.git.pkrempa@redhat.com>
 <87r23w2rbp.fsf@dusky.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b15fdae1-1e70-fe13-701e-48a04d56c93f@redhat.com>
Date: Tue, 1 Oct 2019 16:07:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <87r23w2rbp.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Tue, 01 Oct 2019 21:07:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/19 2:34 PM, Markus Armbruster wrote:
> Peter Krempa <pkrempa@redhat.com> writes:
> 
>> savevm was buggy as it considered all monitor owned block device nodes
> 
> Recommend "monitor-owned block device nodes" or "block device nodes
> owned by a monitor"
> 
>> for snapshot. With introduction of -blockdev the common usage made all
>> nodes including protocol nodes monitor owned and thus considered for
>> snapshot.
> 
> What exactly is / was the problem?


Old way: using QMP add_device, you create a drive backend with two BDS 
(format and protocol) assigned to it; the drive backend has your given 
name, and both BDS have a generated name (beginning with '#').  The two 
BDS are not monitor-owned, rather, the drive is.

New way: using QMP blockdev_add, you create the two BDS manually with 
names of your choice, then plug that blockdev into an unnamed 
blockbackend (the drive no longer needs a name, because you can get at 
everything through the BDS name).  You _could_ do this in one step (the 
QAPI allows self-recursion where you can define both the format and 
protocol in one step), but it is easier to do in two steps (define the 
protocol BDS first, then define the format BDS using a "string" name of 
the protocol BDS instead of a { "driver":..., args... } object of the 
protocol layer.  But by making two calls,  now both BDS are monitor-owned.

At snapshot-time, the code currently looks for all monitor-owned nodes 
when deciding what to snapshot.  In the old way, this finds the named 
drive, picks up its associated top-most node, and snapshots the format 
layer.  In the new way, the drive is unnamed so it is skipped, while 
there are two named BDS, but we don't want a snapshot of the protocol layer.


> 
>>            This was fixed but clients need to be able to detect whether
>> this fix is present.
> 
> Fixed where?  Commit hash, if possible.

Pull request: 
https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg04773.html
(assuming it doesn't need a respin before landing, 8ec72832)

> 
>>
>> Since savevm does not have an QMP alternative add the feature for the
> 
> Comma after alternative.
> 
>> 'human-monitor-command' backdoor which is used to call this command in
>> modern use.
> 
> Eww.  I don't have better ideas short of "design and implement a sane
> QMP interface to internal snapshots", which is too much work.
> 
>> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
>> ---
>>   qapi/misc.json | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

