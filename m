Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC6957CB63
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 15:07:35 +0200 (CEST)
Received: from localhost ([::1]:35656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEVtu-0003el-Lt
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 09:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oEVnU-0005fs-KP
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 09:00:59 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oEVnO-0002oK-GP
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 09:00:56 -0400
Received: by mail-ej1-x62f.google.com with SMTP id oy13so3064787ejb.1
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 06:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GktTuaL+5l+pkhSlt+t6BusBHwUozEKjvQjMZt+El74=;
 b=LcayB/kJnAonWLOVDDVAbHZ76P3tOdJEgDxXgsGhzgTP3d9x0pratRMmW9JjGyrjvq
 hVD9CwtaVPNL+OsVHrEdZe91xArl23aLbdI4QqPB3WqZlJnLw86lh9boumvVNdYqEyFa
 Ou/X5BjM4Uax/MesF7FLxcAODXeEHQiwRQbCSL2KNXYyiyuKGXVerixUAMY+EYI2wWjs
 PU9681ZJOMP/WjL41uL/1DqGqLnsafV1PRVaaSnmDwtrzleEu+8y/ssAB3TRMVdE/LjM
 0r8jYDVvk3rgYlJqUwitPLYaVVKEP5BJT0rVsNJdgQUeyl0X4VUGhWGTIATh1fpm+JLo
 +G4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GktTuaL+5l+pkhSlt+t6BusBHwUozEKjvQjMZt+El74=;
 b=f84ziDmFVuwwtGKLhTXpLfkBuVh+yspSNx+Qh2mCkLqD6whdgSN1pqfxxo68fDZMWj
 9Ggt6i/Q29WoKxeTvX/EkGuxdBlANOeouzqBmBYsbO56vCzGeEBJCEy7N854yz+SIkTM
 D+xh+2JHccZ9ED0FVzog5dTpk0aOGmi2v7MZpZdbjgvSj/5BAvWyRTfln3m8uo+vUI3M
 ebh3VETZkzYTVE097yjSNNogNFlS8RWXoKg/Y1BCn1bBB0y7FQTT2QRf+Nl2lgZPubyk
 WYTbWG1CUSbgEhH1xs4d359X8qoA8b3E+QrmJcypAunAaaGc1eRvnGPo4jivPvRBBRhn
 hFVQ==
X-Gm-Message-State: AJIora9zrAWT7FiAGlnK6cFi9Yb919lQcla5vOpYMN157CWeCkI8gBZz
 BCjzE7o4/y54vzlutecZ7CU=
X-Google-Smtp-Source: AGRyM1vf0T3mNhJ3GjEYFAERKpbXMvbyM/SDHZ0aCATMHMBxsge1Glw+entalxOR7CKiQYiHyNrSdw==
X-Received: by 2002:a17:907:2dab:b0:72f:f7:bdd6 with SMTP id
 gt43-20020a1709072dab00b0072f00f7bdd6mr29671343ejc.330.1658408447092; 
 Thu, 21 Jul 2022 06:00:47 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 jz15-20020a170906bb0f00b0072637b9c8c0sm817622ejb.219.2022.07.21.06.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 06:00:46 -0700 (PDT)
Message-ID: <50f168a6-1351-dd5d-67f0-e222f9547071@redhat.com>
Date: Thu, 21 Jul 2022 15:00:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7] hw/i386: pass RNG seed via setup_data entry
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <CAHmME9r8F4-ji6--PikVzSjT-rPiwqkUrK0rBtxtbYNnr8x0Lw@mail.gmail.com>
 <20220721125636.446842-1-Jason@zx2c4.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220721125636.446842-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/22 14:56, Jason A. Donenfeld wrote:
> Tiny machines optimized for fast boot time generally don't use EFI,
> which means a random seed has to be supplied some other way. For this
> purpose, Linux (≥5.20) supports passing a seed in the setup_data table
> with SETUP_RNG_SEED, specially intended for hypervisors, kexec, and
> specialized bootloaders. The linked commit shows the upstream kernel
> implementation.
> 
> At Paolo's request, we don't pass these to versioned machine types ≤7.0.
> 
> Link: https://git.kernel.org/tip/tip/c/68b8e9713c8
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

LGTM.

Paolo

