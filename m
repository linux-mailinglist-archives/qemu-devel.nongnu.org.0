Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A31418332
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:22:34 +0200 (CEST)
Received: from localhost ([::1]:56898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9VZ-0002rL-Mk
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mU9Tq-0008Um-MG
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 11:20:46 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:38565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mU9To-0002yh-KT
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 11:20:46 -0400
Received: by mail-qk1-x72e.google.com with SMTP id q81so28005514qke.5
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 08:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q1mp5bfcOE4tYJtlkfQExh71H7UjAyVQ4UuEct1pjmg=;
 b=VpPCq3Xn2Hw/a7fbfG21SswwQDtF5dsBvtF90QA3uGXeTkvLR8Gqebbtz2L4a6KVI2
 X25lV3U+/Vn2EhhuJSLyQCDsoso6oe4+7YpmwlOWwnZFbI3eFpGJImTGdj98AgfVw8rG
 Wv9oZpiwy95RNXPJQGiZnMrjbzFxPgwTpflbJ3acZDBLsLdy2W+Go0rdH/Ed1CpoaYBT
 ZGIORcTnbGMKuJWNvzWsY+3QkpZfXLSZc0DIkivxxgcsXhmGZzpAYKFY4WlZffPMjFks
 VJ62wkt8qylkoVq54wAHeFISGLfbxOkhsmjlqu7nMTkCnivoWOXmFxhPMtvxilyc85U+
 kdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q1mp5bfcOE4tYJtlkfQExh71H7UjAyVQ4UuEct1pjmg=;
 b=Wt7QoWTWhlV4PNeCy+yBuQ6hriRumkGITqj+tokGC7vdaoeEp+cfvc4AIn41ZM15AK
 KshjEPbOzQobjRKSz8+bgBL8emkZl9HLD3E29EYthynOHvR2re4F+FN2VSluh1LYE5UY
 1tk2rGEhqxlRGun6VvC5es14AkDm8ChoPCOYvznlFCSnb5jUKfSA2PT4L1OfDPx4B6az
 905XwEwGUf3pxstiK58b/bfH/nvFsepmjHWsyfwGJenVqnXQdDwUGQVivSwnM4bsCiEb
 NnNIHHWT2MwebtqC0Ega68+/0cy21UwhN9AI9pS2HjxqHYemXNt9fn/HrE7bdfPq4bbi
 JpdQ==
X-Gm-Message-State: AOAM531udI4jnJOb/rnHwRb5zDvRbuoUzsG8FfgFvlV/JFGH4nWynZmh
 b2hx+goA0DQskj60tizn2Pc9FA==
X-Google-Smtp-Source: ABdhPJw6lTyH0D8UZGQrdqm4faTK2+W5+NfufmIdyfBJWlzeHAZa+KeZsznCpFrt/llnsmKDzXWOiQ==
X-Received: by 2002:a37:a557:: with SMTP id o84mr16222088qke.330.1632583243438; 
 Sat, 25 Sep 2021 08:20:43 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id i18sm2539643qtx.60.2021.09.25.08.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 08:20:43 -0700 (PDT)
Subject: Re: [PATCH v5 04/30] tcg/loongarch64: Add generated instruction
 opcodes and encoding helpers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 WANG Xuerui <i.qemu@xen0n.name>, Yunqiang Su <syq@debian.org>,
 Huacai Chen <chenhuacai@kernel.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-5-git@xen0n.name>
 <313df1b0-9edf-7333-da46-7342ca308dfb@xen0n.name>
 <6bc47454-7475-7b02-3621-54d064a975e7@linaro.org>
 <9c7adce3-6e51-10cb-9935-4857f822c332@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cab11f59-c90d-8228-2226-1e3d1a727196@linaro.org>
Date: Sat, 25 Sep 2021 11:20:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9c7adce3-6e51-10cb-9935-4857f822c332@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding Alex to the Cc list re docker testing.

On 9/25/21 10:31 AM, Philippe Mathieu-Daudé wrote:
> Xuerui said on the cover 1/ we can buy a board on Taobao and 2/ Loongson
> might help the community with hardware.
> 
> I tried 1/, spend more than 2h to read a translated version of the EULA,
> succeeded at the SMS verification, but then when I tried to log in to
> search for boards my account got banned with no explanation. This
> doesn't seem easy to use outside of China, so I guess we're back on 2/.
> 
> Cc'ing other QEMU Loongson contributors in case they might give us ideas
> about how to add this arch into our CI.

It does seem like a good idea to have some sort of testing in place.

Perhaps build upon debian-hexagon-cross.docker to set up a cross-build environment for 
loongarch.  Add just enough more that it's good for a full cross-build of qemu (glib and 
pixman?).

Like the hexagon docker image, the build time would be substantial, so we'd push a golden 
copy to the qemu-project repo.


r~

