Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2274C32B646
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:44:07 +0100 (CET)
Received: from localhost ([::1]:51068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHO34-0000cV-75
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lHO1r-00008Y-Kh
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:42:51 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lHO1p-0007uV-P0
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:42:51 -0500
Received: by mail-wr1-x432.google.com with SMTP id h98so22882121wrh.11
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 01:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=CAawF1Jxq1imqathnHo4YEfZLXQaPGD4YcbbRgx23MM=;
 b=b4lPYoaq2RDan+q9e7/unR+rmapFepKXCML/6kUYhaRUnTLr4hOVFqjGpEgjO3HKc4
 Mabywi65wcy0JS4H7c2kue6pCnPjBWbLj5p/Uy3XaBN9WYdAcqLKR3mIlphcaBsUVgIl
 xejG3rymYQVrL/5MfxbVBpYO0rdo6r20ato66n41+CaxEujsjB8FMoAayWeP2WXLSd4e
 +s4AI0HbU6NpwaahO83umCcWoD4QV4/ZOGG9xZvrY6jckNEFqNhxrAGOK4c5pRMyfWzV
 rCzt2wJHIk/MrIimajpa/ZyLbMI60v6TANbhdoGKOVaC1IX85TchRDaf4YrEdbiyofs8
 QAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=CAawF1Jxq1imqathnHo4YEfZLXQaPGD4YcbbRgx23MM=;
 b=U/f7+KkGIKnFQwocfxGzm8+JUzDMy/cAxdeo2U/dwQjo8oYSkhPuOxQ5dnqNLJHN8d
 K4daklKIw7h5dFK2ZpJm2aJnxESPlBF7xLN/tBix4EbTw/bzukJbIMv9qLd6xjG/AlNL
 Q1zsub5Bs9fSHdx2bSwAi3tc9AxOY+oRJDjYlOQLIe/ja2+jFR0zhlc5iov4tuKPLw4h
 Q2eVPo0v/kc94DZa2GfKkLAmTedgNcivOouVLhlDSO95n/T0UaJ4Hu1x5WmCb7+3CTos
 dig3pCQ7IOZXhOESLNzUIdYEoeU+bU7iD2T139g4IAP2ue0CQPIXrj5GwfxQfcTTkEeX
 fB3g==
X-Gm-Message-State: AOAM533Qo3P4wSTy9g/T0pPAXItyKs+BYXLDhYojdnU35Ur8S3mChO1J
 nvlOE7S6eKesAvF4SL4hgfv/bw==
X-Google-Smtp-Source: ABdhPJwaOLkK1o+tag5bEdRtPUof9/8gg81Jc7YTx1I8KuAWTjV/tIVSOdHcQztTVYcbtG75JZiSuA==
X-Received: by 2002:a5d:640b:: with SMTP id z11mr25813522wru.327.1614764567848; 
 Wed, 03 Mar 2021 01:42:47 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id u4sm24434857wrm.24.2021.03.03.01.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 01:42:47 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id e6cff948;
 Wed, 3 Mar 2021 09:42:46 +0000 (UTC)
To: Babu Moger <babu.moger@amd.com>, pbonzini@redhat.com,
 richard.henderson@linaro.org, ehabkost@redhat.com
Subject: Re: [PATCH] i386: Add missing cpu feature bits in EPYC-Rome model
In-Reply-To: <161472000062.17527.13517059335871466534.stgit@bmoger-ubuntu>
References: <161472000062.17527.13517059335871466534.stgit@bmoger-ubuntu>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Wed, 03 Mar 2021 09:42:46 +0000
Message-ID: <m2h7lslgix.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::432;
 envelope-from=dme@dme.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: babu.moger@amd.com, pankaj.gupta@cloud.ionos.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-03-02 at 15:20:00 -06, Babu Moger wrote:

> Found the following cpu feature bits missing from EPYC-Rome model.
> ibrs    : Indirect Branch Restricted Speculation
> ssbd    : Speculative Store Bypass Disable
>
> These new features will be added in EPYC-Rome-v2. The -cpu help output
> after the change.
>
> x86 EPYC-Rome             (alias configured by machine type)
> x86 EPYC-Rome-v1          AMD EPYC-Rome Processor
> x86 EPYC-Rome-v2          AMD EPYC-Rome Processor
>
> Reported-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> Signed-off-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
> ---
>  target/i386/cpu.c |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 6a53446e6a..9b5a31783d 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4179,6 +4179,20 @@ static X86CPUDefinition builtin_x86_defs[] = {
>          .xlevel = 0x8000001E,
>          .model_id = "AMD EPYC-Rome Processor",
>          .cache_info = &epyc_rome_cache_info,
> +        .versions = (X86CPUVersionDefinition[]) {
> +            { .version = 1 },
> +            {
> +                .version = 2,
> +                .props = (PropValue[]) {
> +                    { "ibrs", "on" },
> +                    { "amd-ssbd", "on" },
> +                    { "model-id",
> +                      "AMD EPYC-Rome Processor" },

If the model-id isn't changing, is there any need to specify it?

> +                    { /* end of list */ }
> +                }
> +            },
> +            { /* end of list */ }
> +        }
>      },
>      {
>          .name = "EPYC-Milan",

dme.
-- 
In heaven there is no beer, that's why we drink it here.

