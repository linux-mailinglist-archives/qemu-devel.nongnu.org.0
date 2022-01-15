Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601DF48F7BF
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 17:11:35 +0100 (CET)
Received: from localhost ([::1]:42592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8leQ-0005mA-Gc
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 11:11:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n8lZg-0002rz-7W
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 11:06:41 -0500
Received: from [2a00:1450:4864:20::333] (port=42770
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n8lZe-00048Y-7i
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 11:06:39 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 ay4-20020a05600c1e0400b0034a81a94607so10764371wmb.1
 for <qemu-devel@nongnu.org>; Sat, 15 Jan 2022 08:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XGRaFmOkGeFXTDHL1wbJOj0w7ZZj1PDikzBa5UYGTyQ=;
 b=bGdH6GpHiuTnIfcD04L4mlovqeBUtwR/BNSc5OdPFstH3vXMDubg7jffEkfFXTDe72
 CtDU1FSBEQ4ARhDzdqJ2VrIudnmGiycy6hm7SSUJ0vrxVcMzMuZ2t7NREdsqFsMEXqy9
 Bf+8MVyD1YiYXvsM9VigMPxZbSklziM1xBV1a8YdzIeYne8Y0BCahh+N4MIAIXZ7PnU2
 OESGvcb8wLIdIPq7vqSn1RFVaG7/hWZr0fVNmz4hn9FTl/wsnFkx0dOge2k95POKyYmz
 LnyLSBtXBJpOlsdSNMxhkTj9pOC+ZboYL/B0HBURJOzd+uzX58YNEnnj/tXAJns/za3G
 C+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XGRaFmOkGeFXTDHL1wbJOj0w7ZZj1PDikzBa5UYGTyQ=;
 b=NpHj9Ndev1FeWAe4rb/HV3BRvLQZa+QcT9ocNW9yusqqtztMAk+GeLjch/59jsyeth
 8XAF81+GSmLdcA9aKRgOcJFHuo+hgadxFg4LEORbCxfSHJUm6Mn8Lr4i0Gud+MpYFp3v
 OQLqL8osg9WVyL6ahJGfROUpMyqQik08fDrZl1N03JSvpTuAj/lnCvTmsw/WRwxCUh+H
 8GTR7zkpYly71sG/bg5WeoHGsZkWjfuUcVIrdqQgmb5GqH8ROphrXXWAxiGXYudJwwBW
 GlOdFMisZgPEdrnI9rB6lUIECeqlLjXuQBYcWnNUYFP1BPbThoKGI7Y6rq7mutbQXgdx
 T/aQ==
X-Gm-Message-State: AOAM532OPnXwZkmzr06imr2Jmt/Qapm4EybauvOv0dhWfab56W6+jOJp
 BcN5Lybxnnu1Z8wrG4ofjOw=
X-Google-Smtp-Source: ABdhPJwDqd2rssltRD2yZl/7L7sDrd4OmRRkfiN/Ixe5r2wKtY70Gaa4JG+lJnqDbgRt/34Hx8Sayw==
X-Received: by 2002:a05:6000:1786:: with SMTP id
 e6mr12351556wrg.432.1642262783477; 
 Sat, 15 Jan 2022 08:06:23 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id 9sm6059546wrb.77.2022.01.15.08.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Jan 2022 08:06:23 -0800 (PST)
Message-ID: <65664282-01a8-c75f-3762-5348a48fba7a@redhat.com>
Date: Sat, 15 Jan 2022 17:06:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] build-sys: fix a meson deprecation warning
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220113162148.3621818-1-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220113162148.3621818-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/22 17:21, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> WARNING: Deprecated features used:
>   * 0.56.0: {'meson.source_root'}
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/qtest/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 37e1eaa4498e..2f6687576757 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -103,7 +103,7 @@ if dbus_daemon.found() and config_host.has_key('GDBUS_CODEGEN')
>     #qtests_i386 += ['dbus-vmstate-test']
>     dbus_vmstate1 = custom_target('dbus-vmstate description',
>                                   output: ['dbus-vmstate1.h', 'dbus-vmstate1.c'],
> -                                input: meson.source_root() / 'backends/dbus-vmstate1.xml',
> +                                input: meson.project_source_root() / 'backends/dbus-vmstate1.xml',
>                                   command: [config_host['GDBUS_CODEGEN'],
>                                             '@INPUT@',
>                                             '--interface-prefix', 'org.qemu',

Queued, thanks.

Paolo

