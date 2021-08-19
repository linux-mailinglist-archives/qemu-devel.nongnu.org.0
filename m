Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BFB3F1C79
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 17:17:07 +0200 (CEST)
Received: from localhost ([::1]:34188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGjn0-0002Aj-8E
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 11:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGjkd-0008Rz-Mi
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:14:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGjka-0002QD-Ir
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:14:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629386074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bn+XgnDAn1rfbbaMWYJL5Nn6zeKRtsy5TjWJMdobqcg=;
 b=Q1xeKgQ0wS9Dvu/+dlgGfCSWjjR6r9Xs5pj58Xy48MjJ9ra7Gij3Ls5/nvBtDXBiUuMI2K
 J7usUBYfRdDS2WT2ZOFCeicop6jEF3Z7PeDijDHsjZN2zk7XGn9h0gAV0ZqI4YcrXUqBCP
 QzdZTdMfjrq2CxDdR9I4xUwrY6bGssA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-EKRrJblbNSWbb0FLvhSK7A-1; Thu, 19 Aug 2021 11:14:33 -0400
X-MC-Unique: EKRrJblbNSWbb0FLvhSK7A-1
Received: by mail-wr1-f69.google.com with SMTP id
 p10-20020a5d68ca000000b001552bf8b9daso1792162wrw.22
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 08:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bn+XgnDAn1rfbbaMWYJL5Nn6zeKRtsy5TjWJMdobqcg=;
 b=kn50UnLTG96Yr83xfGknB0sWkZ3uRWL3MVFMIX1AZ6wqy92Ce2G+hC2yKiJtf+CCg/
 6A5+2d2pDxHNLw8aaTOHVpghcv1UBdV+Pnbs3NkgJ90OiMPRGnhN6FlzHvREQwf0z09/
 fy5yv1OlMs9FB+kPHVqEfJqDe2J2cM/LJqRomPXxjgUfle0oK4sQ0kvl/Iy0i7g3XgaK
 BGIGLqxN8pv9xkM6W8B7U2iz3zAbwpt35Fp/ORRdm5rghR9dWav5ZTxgqrzcsU4Mwdze
 +vRqFPaXHeb0TE11sth3zyzvktn0ZSqbK9s5KU6ZWHGBzcXNCC9oWS2KyiadSQovTYXx
 aaQA==
X-Gm-Message-State: AOAM530gvdzBmGU8vJ4dELuL/fko4TK4nLi+aB0xcv1pCPEhZEbV+tHs
 ikPljcBCzY02tTLCMG4dSc187rA4yTAOelr0LYETj9EsS9Rv0jXMMsSVlyo8VbWZJgOk84STwdT
 uDNyOP+Chk53mpV4=
X-Received: by 2002:adf:db07:: with SMTP id s7mr4674217wri.106.1629386071945; 
 Thu, 19 Aug 2021 08:14:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwteHj+Y5rKUvJATY86qBydd17UtZXQGc2+VVO4kkqVlCJW4UHmUHAEjwEE8nzwaz1K7QY5xA==
X-Received: by 2002:adf:db07:: with SMTP id s7mr4674188wri.106.1629386071691; 
 Thu, 19 Aug 2021 08:14:31 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 h11sm9265809wmc.23.2021.08.19.08.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 08:14:31 -0700 (PDT)
Subject: Re: [PATCH] qemu-img: Allow target be aligned to sector size
To: "Jose R. Ziviani" <jziviani@suse.de>
References: <20210819101200.64235-1-hreitz@redhat.com> <YR5rWv4h+8QuyQGI@pizza>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <15930d90-ef66-103a-5ed5-549a08d7a559@redhat.com>
Date: Thu, 19 Aug 2021 17:14:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR5rWv4h+8QuyQGI@pizza>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.08.21 16:31, Jose R. Ziviani wrote:
> Hello Hanna,
>
> On Thu, Aug 19, 2021 at 12:12:00PM +0200, Hanna Reitz wrote:
>> We cannot write to images opened with O_DIRECT unless we allow them to
>> be resized so they are aligned to the sector size: Since 9c60a5d1978,
>> bdrv_node_refresh_perm() ensures that for nodes whose length is not
>> aligned to the request alignment and where someone has taken a WRITE
>> permission, the RESIZE permission is taken, too).
>>
>> Let qemu-img convert pass the BDRV_O_RESIZE flag (which causes
>> blk_new_open() to take the RESIZE permission) when using cache=none for
>> the target, so that when writing to it, it can be aligned to the target
>> sector size.
>>
>> Without this patch, an error is returned:
>>
>> $ qemu-img convert -f raw -O raw -t none foo.img /mnt/tmp/foo.img
>> qemu-img: Could not open '/mnt/tmp/foo.img': Cannot get 'write'
>> permission without 'resize': Image size is not a multiple of request
>> alignment
>>
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1994266
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>> As I have written in the BZ linked above, I am not sure what behavior we
>> want.  It can be argued that the current behavior is perfectly OK
>> because we want the target to have the same size as the source, so if
>> this cannot be done, we should just print the above error (which I think
>> explains the problem well enough that users can figure out they need to
>> resize the source image).
>>
>> OTOH, it is difficult for me to imagine a case where the user would
>> prefer the above error to just having qemu-img align the target image's
>> length.
> This is timely convenient because I'm currently investigating an issue detected
> by a libvirt-tck test:
>
> https://gitlab.com/libvirt/libvirt-tck/-/blob/master/scripts/qemu/200-qcow2-single-backing-file.t
>
> It fails with the same message:
> qemu-system-x86_64: -device virtio-blk-pci,bus=pci.0,addr=0x3,drive=libvirt-1-format,id=virtio-disk1,write-cache=on: Cannot get 'write' permission without 'resize': Image size is not a multiple of request alignment
>
> Libvirt-tck basically wants to make sure that libvirt won't pass a 'backing'
> argument if we force a QCOW2 image to be interpreted as a RAW image. But, the
> actual size of a (not preallocated) QCOW2 is usually unaligned so we ended up
> failing at that requirement.
>
> I crafted a reproducer (tck-main is a QCOW2 image):
>   $ ./qemu-system-x86_64 \
>    -machine pc-i440fx-6.0,accel=kvm -m 1024 -display none -no-user-config -nodefaults \
>    -kernel vmlinuz -initrd initrd \
>    -blockdev driver=file,filename=/var/cache/libvirt-tck/storage-fs/tck/tck-main,node-name=a,cache.direct=on \
>    -blockdev node-name=name,driver=raw,file=a \
>    -device virtio-blk-pci,drive=name
>
> And if I remove 'cache.direct=on' OR if I remove the device virtio-blk-pci I
> don't hit the failure.
>
> In order to fix the libvirt-tck test case, I think that creating a preallocated
> QCOW2 image is the best approach, considering their test case goal. But, if you
> don't mind, could you explain why cache.direct=on doesn't set resize permission
> with virtio-blk-pci?

Well, users only take the permissions they need.  Because the device 
doesn’t actively want to resize the disk, it doesn’t take the permission 
(because other simultaneous users might not share that permission, and 
so taking more permissions than you need may cause problems).

So the decision whether to take the permission or not is a tradeoff.  I 
mean, there’s always a work-around: The error message tells you that the 
image is not aligned to the request alignment, so you can align the 
image size manually.  The question is whether taking the permissions may 
be problematic, and whether the user can be expected to align the image 
size.

(And we also need to keep in mind that this case is extremely rare. I 
don’t think that users in practice will ever have images that are not 
4k-aligned.  What the test is doing is of course something that would 
never happen in a practical set-up, in fact, I believe attaching a qcow2 
image as a raw image to a VM is something that would usually be 
considered dangerous from a security perspective.[1])

For qemu-img convert (i.e. for this patch), I decided that it is 
extremely unlikely there are concurrent users for the target, so I can’t 
imagine taking more permissions would cause problems.  The only downside 
I could see is that the target image would be larger than the source 
image, but I think that is still the outcome that users want.

On the other side, applying the work-around may be problematic for 
users: The source image of qemu-img convert shouldn’t have to be 
writable.  So resizing it (just so it can be converted to be stored on a 
medium with 4k sector size) may actually be impossible for the user.

Now, for the virtio-blk case, that is different.  If you’re willing to 
apply the work-around, then you don’t have to do so on an “innocent 
bystander” image.  You have to resize the very image you want to use, 
i.e. one that must be writable anyway.  So resizing the image outside of 
qemu to match the alignment is feasible.

OTOH, because this is a live and complete image, it’s entirely possible 
that there are concurrent users that would block virtio-blk from taking 
the RESIZE permission, so I don’t think we should take it lightly.

So I think for the virtio-blk case the weight of pro and contra is very 
different than for qemu-img.  I’m not sure we should take the RESIZE 
permission in that case, especially considering that the example is not 
a real-world one.

I think if we really want to improve something for the virtio-blk case, 
it would be to have the error message tell what the request alignment 
is, and to add an error hint like

“Try resizing the image using `qemu-img resize -f {bs->drv->format_name} 
+{ROUND_UP(length, aligment) - length}`.”

Hanna

[1] Just to have it mentioned: Attaching a qcow2 image as a qcow2 image 
should work perfectly fine, because the qcow2 driver takes the RESIZE 
permission.


