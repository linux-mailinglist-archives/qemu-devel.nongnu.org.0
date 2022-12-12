Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D62364A5E9
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 18:32:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4mdP-0000CG-OW; Mon, 12 Dec 2022 12:30:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4mdK-0000Bt-24
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:30:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4mdH-0005Hm-Rk
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670866226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xVIwTaUPKkbOrt1I7iMBsC1gRbPPhaCpkWXdoZgHc44=;
 b=cxSP6+rWar5VmyYZjxjg/VCOsVMsPWV3QzoE8lSoCbz90U+3kMPMUZFZ5jlJOKhpFqOjb9
 jQ/RwzK3hi17L4BPQkCyBUYYrRqSbUJJYNCfm2mdwLZs8+XXh4RbJsh+o5vvo3pilAFnac
 dn3Hmne/QwMcjprUOnxbyAGc2xwxjSQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-426-PNcDCwBuOWWVkZXc22hq9w-1; Mon, 12 Dec 2022 12:30:24 -0500
X-MC-Unique: PNcDCwBuOWWVkZXc22hq9w-1
Received: by mail-wr1-f71.google.com with SMTP id
 x1-20020adfbb41000000b002426b33b618so2417133wrg.7
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 09:30:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xVIwTaUPKkbOrt1I7iMBsC1gRbPPhaCpkWXdoZgHc44=;
 b=SfLHmx3jXjzg3L3FPvecLejEFnI8LnC91wGt5za1uVlxElF2YNycFdjd5sI5DquKRa
 8fgKz/wlChfGohYdtuKZrNQQT2MTT+UicXfU9xobntOyNsVzLoO1/3FV83KYgmLIBHhl
 C8faMfeYsYaSG9M5cvrCl9huBd2hnPINqlSecVvMpHkwB2u4R6EA8apGrxLXVGk+SFM5
 CvaYN/lA3Yvsr1tdZ2NoeMqyFcItoGY4niWC5jerBXjch3zASxkILXAH5qeVSkgwwNC9
 Xam/G3lePQRyfnlqcOMMZXd5EEpkk8ciGMiVn3J56HMH/MiE6MVCz+rfiI2WhAyhyLEx
 bEMQ==
X-Gm-Message-State: ANoB5pnJ395xzDD36xdCVsTbPuMvLcv8BKd3ju5mRxqI9kf5Zn0vgpb2
 X+aE/Qao1ASzw2Tu6XWUcinyyXYDeE3rNFxqYTdUFSyu4jA4vQRywHhs0uZA7HOabwCob2Ks5OF
 YNnqRcsKcY4kYXIY=
X-Received: by 2002:a05:600c:3b84:b0:3cf:8762:22c2 with SMTP id
 n4-20020a05600c3b8400b003cf876222c2mr13451391wms.38.1670866222979; 
 Mon, 12 Dec 2022 09:30:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf57Q4Dr1zIN3x448Z1jqbpwASVpEML8rJyYieZZEbuP4+EfIISgXS2qogt5gmgDDWd/or9mfw==
X-Received: by 2002:a05:600c:3b84:b0:3cf:8762:22c2 with SMTP id
 n4-20020a05600c3b8400b003cf876222c2mr13451373wms.38.1670866222745; 
 Mon, 12 Dec 2022 09:30:22 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 o17-20020a05600c511100b003cfa3a12660sm29932396wms.1.2022.12.12.09.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 09:30:22 -0800 (PST)
Message-ID: <8495140d-3301-7693-b804-0554166802da@redhat.com>
Date: Mon, 12 Dec 2022 18:30:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 03/22] i386/xen: Add xen-version machine property
 and init KVM Xen support
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-4-dwmw2@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221209095612.689243-4-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On 12/9/22 10:55, David Woodhouse wrote:
> -    m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
> +    if (xen_enabled())
> +            m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
> +    else
> +            m->default_machine_opts = "accel=kvm,xen-version=0x30001";

Please do not modify pc_xen_hvm_init().

"-M xenfv" should be the same as "-M pc-i440fx-...,suppress-vmdesc=on 
-accel xen -device xen-platform".  It must work *without* "-accel xen", 
while here you're basically requiring it.  For now, please make 
KVM-emulated Xen use "-M pc -device xen-platform".  We can figure out 
"-M xenfv" later.

You can instead have:

- a check in xen_init() that checks that xen_mode is XEN_ATTACH.  If 
not, fail.

- an extra enum value for xen_mode, XEN_DISABLED, which is the default 
instead of XEN_EMULATE;

- an accelerator property "-accel kvm,xen-version=...", added in 
kvm_accel_class_init() instead of the machine property.  The property, 
when set to a nonzero value, flips xen_mode from XEN_DISABLED to 
XEN_EMULATE.

The Xen overlay device can be created using the mc->kvm_type function 
(which you can set in DEFINE_PC_MACHINE); at that point, xen_mode has 
switched from XEN_DISABLED to XEN_EMULATE.  Those xen_enabled() checks 
that apply to KVM then become xen_mode != XEN_DISABLED, as long as they 
run during mc->kvm_type or afterwards.

The platform device can be created either in mc->kvm_type or manually 
(not sure if it makes sense to have a "XenVMMXenVMM" CPUID + emulated 
hypercalls but no platform device---would it still use pvclock for 
example?).

Paolo


