Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28370625947
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 12:25:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otS9U-0007IR-CZ; Fri, 11 Nov 2022 06:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1otS9T-0007ID-1q
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:24:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1otS9Q-0004Ee-LN
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668165888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJeJ6kNOCV1VC+/cqRS1aguTl7e/FQ5+wtTFc/BbRjg=;
 b=QgSyknWv8dqE3RTk+7SvZW6VxYqUMoAQsRaO03AsjDlWMRGmr3J+QxuQE3SwEgpR9Lc+nl
 RdToWd2ebhPxHfsldkzLFYrI1scbrg13fkWzHXRGn9ypvnzjJq14YFdLsz1a1AMlCeNUYq
 IP16gWZXDJW4tvWmV97pC0pwjSN9BgM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-321-jYL_TloKM7GQBmbwDuiK1g-1; Fri, 11 Nov 2022 06:24:46 -0500
X-MC-Unique: jYL_TloKM7GQBmbwDuiK1g-1
Received: by mail-wr1-f72.google.com with SMTP id
 u20-20020adfc654000000b0022cc05e9119so934047wrg.16
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 03:24:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qJeJ6kNOCV1VC+/cqRS1aguTl7e/FQ5+wtTFc/BbRjg=;
 b=660u+Pr8MpgyuZAXRWibB6Y0BqqUfG54dnRnz7PBI5dyBOzuAXVv9IV/M8DjSFdXJ8
 CKxeA0si0KMcbCNrNmGxLHn1NCq0L8PsUEe6Lj/J1AxAw+TGZb1MwwE7kO6FOVr3LKKx
 s+54Yz14N08umcq6k0FpzoTPl+ew6BIAXYZ+dy2j2vxsvikttOpDlEZEmR2wxYGME4ZI
 hDBl/MWb2Ta+g3QUHPg/spIZ7yWiErREPoCFr8OulR6iOCmdC+Gi9My+r8zOP6EGqnq1
 3i9AuxfAFnwJeBoivySlqozIGWgnTIsrf2GxA7b/ulUHC0TxgQHn5Q52BDqxY7NBNK5V
 9Duw==
X-Gm-Message-State: ANoB5plQX4i6gMbSiV21HLSYSAdEWvNOct25I7lYH782U3Y86wb2TEHR
 y6x5hXpB2DmmqlTx0G5XzQDWOcUaOxBuIQi7auariR9Urf9S/o/pkR2yaz+O+O4fAUVTyCYlv1H
 DIep/yo5qIOkgg60=
X-Received: by 2002:a05:600c:11:b0:3c6:7abb:9d2b with SMTP id
 g17-20020a05600c001100b003c67abb9d2bmr885518wmc.182.1668165885656; 
 Fri, 11 Nov 2022 03:24:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf67wzPPGVrRbeECDkdJd5ecFrsIRlmyDkVdGqzHwBjYsJrkosH18hCNe4ziYCTdVDAZ9Qno+w==
X-Received: by 2002:a05:600c:11:b0:3c6:7abb:9d2b with SMTP id
 g17-20020a05600c001100b003c67abb9d2bmr885511wmc.182.1668165885380; 
 Fri, 11 Nov 2022 03:24:45 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 p16-20020a5d48d0000000b00236c1f2cecesm1968658wrs.81.2022.11.11.03.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 03:24:44 -0800 (PST)
Message-ID: <d9c073ea-7379-7f51-f55b-b9c70d3daabf@redhat.com>
Date: Fri, 11 Nov 2022 12:24:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] Add missing pixman dependecy
Content-Language: en-US
To: mrezanin@redhat.com, qemu-devel@nongnu.org
Cc: imammedo@redhat.com
References: <20221109153417.49132-1-mrezanin@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221109153417.49132-1-mrezanin@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/9/22 16:34, mrezanin@redhat.com wrote:
> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> Commit cfead31326 'acpi: pc: vga: use AcpiDevAmlIf interface to build VGA device descriptors' added
> a new file - acpi-vga.c. This file (indirectly) includes pixman.h file so we need to ensure pixman
> is available when file is compiled.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>

The patch is fine, but I think the new file does not need vga_int.h and 
therefore does not need to include pixman.h.  Can you try?

Paolo

> ---
>   hw/display/meson.build | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/display/meson.build b/hw/display/meson.build
> index 7a725ed80e..c8e84e9707 100644
> --- a/hw/display/meson.build
> +++ b/hw/display/meson.build
> @@ -43,7 +43,7 @@ if (config_all_devices.has_key('CONFIG_VGA_CIRRUS') or
>       config_all_devices.has_key('CONFIG_VMWARE_VGA') or
>       config_all_devices.has_key('CONFIG_ATI_VGA')
>      )
> -  softmmu_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> +  softmmu_ss.add(when: 'CONFIG_ACPI', if_true: [files('acpi-vga.c'), pixman],
>                                         if_false: files('acpi-vga-stub.c'))
>   endif
>   
> @@ -51,7 +51,7 @@ if config_all_devices.has_key('CONFIG_QXL')
>     qxl_ss = ss.source_set()
>     qxl_ss.add(when: 'CONFIG_QXL', if_true: [files('qxl.c', 'qxl-logger.c', 'qxl-render.c'),
>                                              pixman, spice])
> -  qxl_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> +  qxl_ss.add(when: 'CONFIG_ACPI', if_true: [files('acpi-vga.c'), pixman],
>                                     if_false: files('acpi-vga-stub.c'))
>     hw_display_modules += {'qxl': qxl_ss}
>   endif
> @@ -99,14 +99,14 @@ if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
>                       if_true: [files('virtio-vga.c'), pixman])
>     virtio_vga_ss.add(when: 'CONFIG_VHOST_USER_VGA',
>                       if_true: files('vhost-user-vga.c'))
> -  virtio_vga_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> +  virtio_vga_ss.add(when: 'CONFIG_ACPI', if_true: [files('acpi-vga.c'), pixman],
>                                            if_false: files('acpi-vga-stub.c'))
>     hw_display_modules += {'virtio-vga': virtio_vga_ss}
>   
>     virtio_vga_gl_ss = ss.source_set()
>     virtio_vga_gl_ss.add(when: ['CONFIG_VIRTIO_VGA', virgl, opengl],
>                          if_true: [files('virtio-vga-gl.c'), pixman])
> -  virtio_vga_gl_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> +  virtio_vga_gl_ss.add(when: 'CONFIG_ACPI', if_true: [files('acpi-vga.c'), pixman],
>                                               if_false: files('acpi-vga-stub.c'))
>     hw_display_modules += {'virtio-vga-gl': virtio_vga_gl_ss}
>   endif


