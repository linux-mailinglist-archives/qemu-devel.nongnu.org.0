Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C44A363AE1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 07:08:41 +0200 (CEST)
Received: from localhost ([::1]:45438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYM9I-0000bi-CP
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 01:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYM7q-0008K4-VZ
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 01:07:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYM7m-0003Rb-Kl
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 01:07:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618808823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dCXi/9Ne1907gtNExh54CFdUc6BngJFqQeopOpu3B4A=;
 b=efjZYP3sOSEEa2hQb0mvtVGCsxKwqMpT55j2YoMVUe0PRqE0b5O4UopIPZ2S/USlMRsnUX
 jzu6/8nedVFjoeI8mGvaa0kIvkfyIRVK8B3B53S/5vhz5CTVMwDxNxOjAVV2BgPfInD7uC
 Idxdycp5/yInmoSg8R8ymfLi+ThCpVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-MV-L5i-mOkCACOR1sEfqRg-1; Mon, 19 Apr 2021 01:06:59 -0400
X-MC-Unique: MV-L5i-mOkCACOR1sEfqRg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 207451006701;
 Mon, 19 Apr 2021 05:06:58 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 226896E6F5;
 Mon, 19 Apr 2021 05:06:54 +0000 (UTC)
To: Nir Soffer <nsoffer@redhat.com>
References: <20210416052333.1548853-1-thuth@redhat.com>
 <CAMRbyytmcZHggOtxJ09Lu4QEke-B=Hz_+cf_HLqRV9joQWaG=Q@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] block/file-posix: Fix problem with fallocate(PUNCH_HOLE)
 on GPFS
Message-ID: <0b9b354c-c708-af16-105a-0e738eafa69e@redhat.com>
Date: Mon, 19 Apr 2021 07:06:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAMRbyytmcZHggOtxJ09Lu4QEke-B=Hz_+cf_HLqRV9joQWaG=Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Richard Jones <rjones@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/04/2021 22.34, Nir Soffer wrote:
> On Fri, Apr 16, 2021 at 8:23 AM Thomas Huth <thuth@redhat.com> wrote:
>>
>> A customer reported that running
>>
>>   qemu-img convert -t none -O qcow2 -f qcow2 input.qcow2 output.qcow2
>>
>> fails for them with the following error message when the images are
>> stored on a GPFS file system:
>>
>>   qemu-img: error while writing sector 0: Invalid argument
>>
>> After analyzing the strace output, it seems like the problem is in
>> handle_aiocb_write_zeroes(): The call to fallocate(FALLOC_FL_PUNCH_HOLE)
>> returns EINVAL, which can apparently happen if the file system has
>> a different idea of the granularity of the operation. It's arguably
>> a bug in GPFS, since the PUNCH_HOLE mode should not result in EINVAL
>> according to the man-page of fallocate(), but the file system is out
>> there in production and so we have to deal with it. In commit 294682cc3a
>> ("block: workaround for unaligned byte range in fallocate()") we also
>> already applied the a work-around for the same problem to the earlier
>> fallocate(FALLOC_FL_ZERO_RANGE) call, so do it now similar with the
>> PUNCH_HOLE call.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   block/file-posix.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/block/file-posix.c b/block/file-posix.c
>> index 20e14f8e96..7a40428d52 100644
>> --- a/block/file-posix.c
>> +++ b/block/file-posix.c
>> @@ -1675,6 +1675,13 @@ static int handle_aiocb_write_zeroes(void *opaque)
>>               }
>>               s->has_fallocate = false;
>>           } else if (ret != -ENOTSUP) {
>> +            if (ret == -EINVAL) {
>> +                /*
>> +                 * File systems like GPFS do not like unaligned byte ranges,
>> +                 * treat it like unsupported (so caller falls back to pwrite)
>> +                 */
>> +                return -ENOTSUP;
> 
> This skips the next fallback, using plain fallocate(0) if we write
> after the end of the file. Is this intended?
> 
> We can treat the buggy EINVAL return value as "filesystem is buggy,
> let's not try other options", or "let's try the next option". Since falling
> back to actually writing zeroes is so much slower, I think it is better to
> try the next option.

I just did the same work-around as in commit 294682cc3a7 ... so if we agree 
to try the other options, too, we should change that spot, too...

However, what is not clear to me, how would you handle s->has_write_zeroes 
and s->has_discard in such a case? Set them to "false"? ... but it could 
still work for some blocks with different alignment ... but if we keep them 
set to "true", the code tries again and again to call these ioctls, maybe 
wasting other precious cycles for this?

Maybe we should do a different approach instead: In case we hit a EINVAL 
here, print an error a la:

  error_report_once("You are running on a buggy file system, please complain 
to the file system vendor");

and return -ENOTSUP ... then it's hopefully clear to the users why they are 
getting a bad performance, and that they should complain to the file system 
vendor instead to get their problem fixed.

> This issue affects also libnbd (nbdcopy file backend).
> 
> Do we have a bug for GFS?

The GPFS-related bug is:
https://bugzilla.redhat.com/show_bug.cgi?id=1944861

  Thomas


