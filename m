Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181FA5F0DD0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 16:44:26 +0200 (CEST)
Received: from localhost ([::1]:60152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeHFQ-0005dI-DR
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 10:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oeHDh-0002t4-ES
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:42:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oeHDb-0001an-8O
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664548941;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QlfNTnhykoc0+MO02oM1j8UWszN5FTMHq24MUArf96M=;
 b=TXm1flxn/0lvuhfolL8At8LMxfmj2aZME/McUtBnxymKa3/PaV+VvV7Bwm6FpzFqyvX0ej
 IfvTO5P70TUYLFM7OITOkBRdIQ7ZovyqtFVDbVFZ5sWtU2XNxJbA7EA/TgunhA9aAldwEn
 CsKDs98ewPK2DbeoYqJIN3dNGGU7iEE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-UmL07cMbOVSGS8J9mSoO6w-1; Fri, 30 Sep 2022 10:42:18 -0400
X-MC-Unique: UmL07cMbOVSGS8J9mSoO6w-1
Received: by mail-wm1-f72.google.com with SMTP id
 k21-20020a7bc415000000b003b4fac53006so1327979wmi.3
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 07:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=QlfNTnhykoc0+MO02oM1j8UWszN5FTMHq24MUArf96M=;
 b=XDHeMVMam5v0X1s6mHEvVAEGie60YBWhztqH+G2dr1R10hN66lLLVRW4Bv3cWTkSmQ
 ouveNXQFXxz3kLW/PsC6BRzDs/Nowx1lBI3ghg1U+3tqVZCvLWS89W/a1qBr5W21U2zp
 ex95VOB4uDxXRXXW+u5jlTHFPoTBlnGXXWu1nSgopJziWtMYKjc2EwldmzVRlrubjEnW
 cXWTvOv0B8lOyGLYLzygK+akI4GI5UGQpptcs4C7Vp1xvZWaxnxhP9mTVh2U5AX9Df7E
 0P4rP+cX27SGuEzwB7Acg4K0VHm7GHRDRa4Yo/rcMjzGt7ZQsiz2vPIvfjpQMPOrw5tn
 DFog==
X-Gm-Message-State: ACrzQf1K2m4TEz78o0JFVdiRDyBwNHMyjQa+fEk4OCePoJFrdPPFA4Qj
 nfO5h7sMYDCc4O05D4LzmAQWgDI0ZWJJ4BGnpwKpIGsOO5rEFdQzy9s1rSJkuHP0xUQvuSBzX9E
 iqCsXzAohNKyH/lo=
X-Received: by 2002:a7b:c845:0:b0:3b5:5e45:b266 with SMTP id
 c5-20020a7bc845000000b003b55e45b266mr6170679wml.82.1664548937424; 
 Fri, 30 Sep 2022 07:42:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5qGOBrNqS3zK+IHVdj6U9ivBTiOOv+O+/tn1D284WCL4aJZ5p12Wnmyp27h3zjPyLSwYjV/w==
X-Received: by 2002:a7b:c845:0:b0:3b5:5e45:b266 with SMTP id
 c5-20020a7bc845000000b003b55e45b266mr6170671wml.82.1664548937237; 
 Fri, 30 Sep 2022 07:42:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b003b47e8a5d22sm7325090wmh.23.2022.09.30.07.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 07:42:16 -0700 (PDT)
Message-ID: <d7dc4775-8876-aeb3-2f2a-1d641080ce67@redhat.com>
Date: Fri, 30 Sep 2022 16:42:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/5] pci-ids: drop list of modern virtio devices
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, peter.maydell@linaro.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220930135810.1892149-1-kraxel@redhat.com>
 <20220930135810.1892149-6-kraxel@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220930135810.1892149-6-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.583, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/30/22 15:58, Gerd Hoffmann wrote:
> Drop the list of modern virtio devices and explain how they
> are calculated instead.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  docs/specs/pci-ids.txt | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
> index dd6859d039d0..a289d2de6521 100644
> --- a/docs/specs/pci-ids.txt
> +++ b/docs/specs/pci-ids.txt
> @@ -23,15 +23,12 @@ maintained as part of the virtio specification.
>  1af4:1005  entropy generator device (legacy)
>  1af4:1009  9p filesystem device (legacy)
>  
> -1af4:1041  network device (modern)
> -1af4:1042  block device (modern)
> -1af4:1043  console device (modern)
> -1af4:1044  entropy generator device (modern)
> -1af4:1045  balloon device (modern)
> -1af4:1048  SCSI host bus adapter device (modern)
> -1af4:1049  9p filesystem device (modern)
> -1af4:1050  virtio gpu device (modern)
> -1af4:1052  virtio input device (modern)
> +1af4:1040  Start of ID range for modern virtio devices.  The PCI device
> +   to      ID is calculated from the virtio device ID by adding the
> +1af4:10ef  0x1040 offset.  The virtio IDs are defined in the virtio
> +           specification.  The Linux kernel has a header file with
> +           defines for all virtio IDs (linux/virtio_ids.h), qemu has a
> +           copy in include/standard-headers/.
>  
>  1af4:10f0  Available for experimental usage without registration.  Must get
>     to      official ID when the code leaves the test lab (i.e. when seeking


