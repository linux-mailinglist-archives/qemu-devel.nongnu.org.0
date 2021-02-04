Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD2B30FEB1
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 21:46:57 +0100 (CET)
Received: from localhost ([::1]:49094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7lWi-0002zJ-2S
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 15:46:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7lU6-00019N-86
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:44:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7lU2-0000f7-Cj
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:44:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612471448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d1YGT76Y3flsh8qeWPyv5iNTj+/KnXlwuTzvQrajzyo=;
 b=e1U4OfahsxcRswZOyAta7QaGliZM2MuhN2vD2sIh7wM9GcmNAHLcvuSmWMVbfd8YhcLPdS
 qxHWwc0GXXjAfKZW0tSLcnsDoJoJYRb7eLmji+dY3NYQ8MbPoqcyc8QurLxyO5cCp8dZCo
 at3UFUEgjt9vTogu0L18uB/njeWD60g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-8HgSTvndOPKHyWdd7YP_JQ-1; Thu, 04 Feb 2021 15:44:05 -0500
X-MC-Unique: 8HgSTvndOPKHyWdd7YP_JQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B66F3C2A9;
 Thu,  4 Feb 2021 20:44:04 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21C1D5B695;
 Thu,  4 Feb 2021 20:44:04 +0000 (UTC)
To: Peter Lieven <pl@kamp.de>, qemu-block@nongnu.org
References: <20210128140704.6547-1-pl@kamp.de>
 <99982043-ed89-5fbe-afe2-691a9c19280d@redhat.com>
 <567ab8bb-b452-d6c2-dec7-bc2cf1e34ec8@kamp.de>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH] qemu-img: add seek and -n option to dd command
Message-ID: <3dff97ae-5172-d9ca-509f-2a520c2841b5@redhat.com>
Date: Thu, 4 Feb 2021 14:44:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <567ab8bb-b452-d6c2-dec7-bc2cf1e34ec8@kamp.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, "Richard W.M. Jones" <rjones@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 2:09 PM, Peter Lieven wrote:
> Am 02.02.21 um 16:51 schrieb Eric Blake:
>> On 1/28/21 8:07 AM, Peter Lieven wrote:
>>> Signed-off-by: Peter Lieven <pl@kamp.de>
>> Your commit message says 'what', but not 'why'.  Generally, the one-line
>> 'what' works well as the subject line, but you want the commit body to
>> give an argument why your patch should be applied, rather than blank.
>>
>> Here's the last time we tried to improve qemu-img dd:
>> https://lists.gnu.org/archive/html/qemu-devel/2018-08/msg02618.html
> 
> 
> I was not aware of that story. My use case is that I want to be
> 
> able to "patch" an image that Qemu is able to handle by overwriting
> 
> certain sectors. And I especially do not want to "mount" that image
> 
> via qemu-nbd because I might not trust it. I totally want to avoid that the host
> 
> system tries to analyse that image in terms of scanning the bootsector, partprobe,
> 
> lvm etc. pp.

qemu-nbd does not have to mount an image (yes, one use of qemu-nbd is to
use -c /dev/nbdX to get the kernel to mount it; but other uses are to
expose the NBD image in user-space only with no kernel involvement, and
therefore no system mount efforts).

Another thing you might try is libnbd, which now includes a utility
nbdcopy.  It should make it easier to overwrite a portion of an NBD
image using only user-space actions.  I'm not sure if Rich has got it
doing partial file overwrites yet (.../me goes and compiles the latest
git checkout... nope, still a TODO item to implement subsetting), but it
may be possible to combine nbdkit's --filter=offset with the full NBD
image in order to then easily point nbdcopy to only the subset you care
about.  Definitely some ideas worthy of implementation.

> 
>>
>> where I also proposed adding seek=, and fixing skip= with count=.  Your
>> patch does not do the latter.  But the bigger complaint back then was
>> that 'qemu-img copy' should be able to do everything, and that qemu-img
>> dd should then just be a thin shim around 'qemu-img copy', rather than
>> having two parallel projects that diverge in their implementations.
> 
> 
> understood. I was not aware of an issue with skip and count.
> 
> The patch works for me and I wanted to share it. But when I read
> 
> the thread it seems that it would be a difficult task to get it merged.

Just because we're reluctant to improve qemu-img dd without also
improving qemu-img copy does not mean that your improvements are
unwanted.  And hacking on nbdcopy may be faster than waiting for
qemu-img to catch up to where we want it to go.


> 
> 
>>
>> Your patch does not have the typical '---' divider and diffstat between
>> the commit message and the patch proper; this may be a factor of which
>> git packages you have installed, but having the diffstat present makes
>> it easier to see at a glance what your patch touches without reading the
>> entire email.  I had to go hunting to learn if you added iotest coverage
>> of this new feature...
>>
>> ...and the answer was no, you didn't.  You'll need to add that in v2
>> (see the link to my earlier attempt at modifying dd for an example).
> 
> 
> I did not. Maybe I accidently killed the '---' divider. If I will make a V2 I will add
> 
> an I/O test.
> 
> 
> Thanks for your suggestions,

Good luck!

> 
> Peter
> 
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


