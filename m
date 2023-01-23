Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BA867761F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 09:12:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJrue-0007TA-AG; Mon, 23 Jan 2023 03:10:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pJrua-0007SF-CA
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:10:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pJruW-0008DC-Ux
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:10:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674461435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAU0RYKSqDv3e45CVMn7RCXctAKXTPpPnmNhUZwYElI=;
 b=JSIQCreBGskyjB5pum2XGytiTpifWNmJT9hz8fUK8sYgaPycmytpLwxrqZexmvHObFmPH3
 lSuROVkdr4R3oAt6tE0SH2PGxxolvUel/+MQHnoBPACEjpszkQGXFbd2RxaVVrhX0v/KP0
 AP7FG8pnQKVpmI4KX2FxBPVp3ye6hEg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-508-si3dy9izOZ6BJ_OTPR8ysg-1; Mon, 23 Jan 2023 03:10:33 -0500
X-MC-Unique: si3dy9izOZ6BJ_OTPR8ysg-1
Received: by mail-qv1-f69.google.com with SMTP id
 e5-20020a056214110500b0053547681552so5589336qvs.8
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 00:10:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FAU0RYKSqDv3e45CVMn7RCXctAKXTPpPnmNhUZwYElI=;
 b=dauyTVDCBW2boEX434ySCdD1FivbS3yLGrgGefVr4w5EASvwM0d7siK3JhDYJnsRAV
 kXV+VOqJ4Sx/DlPlHCZDfgHuM9pFBUiW2nAf3CCHjjwFLaMmttOShgBD33zRkBBv0lbC
 srqBb7qhXxtJkUxCMZVK+xjFupVGnRj3PcGwMYo7U4jshhe9NBJ5oy9R5AAt9pwl8ov6
 ziiE/Svl09SFt9TecELBz0b3RzOrVsKZpw1TR0ZKq478biV2A8hOqkPIKVIyBXUhwGV/
 50VhPCNDodR12FuK0flrV1JPB8vrS5+4BHRMBzbufP6NWVi3ousA8xxlV2rAsxdcHB5G
 XN0g==
X-Gm-Message-State: AFqh2kpvplvhS9fm/wbHT+xxiR72xl6ivKavRsOnTD5WGiMzjM4VIE4k
 MPwoFiPouzx41oQk6tC12a4zkUubOLHWy0rI3yhUcosbbJLGrKfJCVW9Gs3OIohTm0CgTP0Gca9
 nZ52ZxHBFIE2suKo=
X-Received: by 2002:a05:6214:11a6:b0:535:666b:b83f with SMTP id
 u6-20020a05621411a600b00535666bb83fmr17745197qvv.20.1674461433155; 
 Mon, 23 Jan 2023 00:10:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtbxdDEkRrGhEY6HnEdOsEFwI2Nec3lCjQyyD6dn1zphjEuWqVTe4onJPYSchtfQdplllEy0w==
X-Received: by 2002:a05:6214:11a6:b0:535:666b:b83f with SMTP id
 u6-20020a05621411a600b00535666bb83fmr17745178qvv.20.1674461432911; 
 Mon, 23 Jan 2023 00:10:32 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-90.web.vodafone.de.
 [109.43.178.90]) by smtp.gmail.com with ESMTPSA id
 m8-20020a05620a290800b006fb8239db65sm31602475qkp.43.2023.01.23.00.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 00:10:32 -0800 (PST)
Message-ID: <e356ac89-e19f-11a9-141a-0fbfa8dca4f4@redhat.com>
Date: Mon, 23 Jan 2023 09:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v5 3/9] target/arm: Use "max" as default cpu for the
 virt machine with KVM
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230120184825.31626-1-farosas@suse.de>
 <20230120184825.31626-4-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230120184825.31626-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 20/01/2023 19.48, Fabiano Rosas wrote:
> Now that the cortex-a15 is under CONFIG_TCG, use as default CPU for a
> KVM-only build the 'max' cpu.
> 
> Note that we cannot use 'host' here because the qtests can run without
> any other accelerator (than qtest) and 'host' depends on KVM being
> enabled.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> ---
>   hw/arm/virt.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b5c711c919..8091c74e3d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3005,7 +3005,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>       mc->minimum_page_bits = 12;
>       mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
>       mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
> +#ifdef CONFIG_TCG
>       mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
> +#else
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
> +#endif
>       mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
>       mc->kvm_type = virt_kvm_type;
>       assert(!mc->get_hotplug_handler);

Thanks for the update, this sounds like the best option to me.

Reviewed-by: Thomas Huth <thuth@redhat.com>


