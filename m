Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894F264A594
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 18:09:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4mHU-0005A1-89; Mon, 12 Dec 2022 12:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4mHM-00056X-U5
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:07:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4mHD-0006rk-AG
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:07:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670864849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4AjXTciYPqbJFGzgTjLG3LtGYQY2MCNMNpU1Q+b/wqU=;
 b=LCb9zDmWrDbCWgnTJEmnR+u/N8IUWifCwm/YRhP5eCtUcuNoZ2pI6alNsMitdTfwyUeQPv
 7w61LPSq3/XlCHvBFUJmTuQUI6CDYyOfMVX7KUd00yBtQpv+1EKesti54k16Gc8qOVl5kr
 +BJ/y4mEzXc5sTp/AC0Pf/H+LhbbyO0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-146-fFQAU9pyO0KSdS2dXOM_9g-1; Mon, 12 Dec 2022 12:07:27 -0500
X-MC-Unique: fFQAU9pyO0KSdS2dXOM_9g-1
Received: by mail-wm1-f70.google.com with SMTP id
 m38-20020a05600c3b2600b003d1fc5f1f80so4453883wms.1
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 09:07:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4AjXTciYPqbJFGzgTjLG3LtGYQY2MCNMNpU1Q+b/wqU=;
 b=2sgQRANAxkM5nLMJQ82R4cvPVJ5QeSkEhHiL9O5gkTtP+CikCMZv3SaYGt/oCrZtEs
 mVMeGEOwIBDon8YADKzra4n2dhVCXhEqPwceu60H+Q3SRjHpzojNI4EkPqa9mENqGVWX
 HxJ1JM7MK6+F8yPvjboV4yPokEmhvx//LHp0QcAOXnEjmBZLxv7bIzOIwptTQY1cmPsI
 A6VOmSrle+/ZGaoCzXVglbQ0remmLJ5AAEaz6zgZcmMZ6bCEBZmuPfRy2GPkm3JoXJZg
 uFhESp2QUvpbyGe2FwionnwuFdpV0UUq8czi7V5Km1uwHTVdgIjPt3I+gugXvLrTO0tr
 JuSQ==
X-Gm-Message-State: ANoB5pktnyDA+5622aNDncmNja2g9ciZNcaga9KdaIN0h4m/j9LZCb0Z
 qwdTtUjVGNYSpyxi/rmSmHXPrCf6IPe+5F16Vhoe6TkNWoxQwTOnjKE9H/7l++JoC9Pb1/kcJEV
 c5oRI7kZhDg7uL0E=
X-Received: by 2002:a1c:790f:0:b0:3d2:254d:62a7 with SMTP id
 l15-20020a1c790f000000b003d2254d62a7mr4321335wme.10.1670864846833; 
 Mon, 12 Dec 2022 09:07:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6U7ifcBBFJXbdpt1X/vK2CXLDC062zXQ9fGuUTc1dXtGoSwhngtNhQuS0tgvFmxW212Ih4ow==
X-Received: by 2002:a1c:790f:0:b0:3d2:254d:62a7 with SMTP id
 l15-20020a1c790f000000b003d2254d62a7mr4321318wme.10.1670864846636; 
 Mon, 12 Dec 2022 09:07:26 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 f18-20020a1cc912000000b003cf75213bb9sm9852961wmb.8.2022.12.12.09.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 09:07:26 -0800 (PST)
Message-ID: <77357500-5fa0-b8c0-9367-2355db6f6bfb@redhat.com>
Date: Mon, 12 Dec 2022 18:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 02/22] xen: add CONFIG_XENFV_MACHINE and
 CONFIG_XEN_EMU options for Xen emulation
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
 <20221209095612.689243-3-dwmw2@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221209095612.689243-3-dwmw2@infradead.org>
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
>   config KVM
>       bool
> +    imply XEN_EMU if (I386 || X86_64)

No need for the "imply", just make it "default y" below and it will have 
the same effect.

> 
> diff --git a/target/Kconfig b/target/Kconfig
> index 83da0bd293..e19c9d77b5 100644
> --- a/target/Kconfig
> +++ b/target/Kconfig
> @@ -18,3 +18,7 @@ source sh4/Kconfig
>  source sparc/Kconfig
>  source tricore/Kconfig
>  source xtensa/Kconfig
> +
> +config XEN_EMU
> +    bool
> +    depends on KVM && (I386 || X86_64)

Please place it in hw/xen/Kconfig.

Paolo


