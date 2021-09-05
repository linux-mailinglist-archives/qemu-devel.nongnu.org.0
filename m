Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D24400EDD
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 11:47:38 +0200 (CEST)
Received: from localhost ([::1]:44192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMokT-0001EL-J7
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 05:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMojG-0000U3-A1
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 05:46:22 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMojE-0006O1-Na
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 05:46:21 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so2600572wml.3
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 02:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gYRJV1u8w1zfxw7mFhOJX56e8WP6iJD4snIYpj1lw1g=;
 b=Zlb18SG1Gwjlux+qD17scviRFzYLpw8o1BPnVaqAHA0wrP5jfGdK1dz/QOPObOxcWK
 RCBE10XRyWGraTVOwQ10IAsi2yhz+yEPUWdZPk50xd80i5UDpVi8BfsrYfg2qvBVLUQ+
 6oy+v8kO2P2/FnTH1pzSap2EiqJUP7V++fU4K+DL02u4eHqeDI6tVsGyqDif2y0AqRDF
 HmzWcKsLQfvsY0+jReegmhcqzC7FRUgySU/AeTm9QapE/GJRCujslEwrmzBRYEOsqmUm
 pq3pRR9USdasJX3+kjKODD3+Yuk2DFrR2dsWtQT0b+uhEwvyKNRn8FUZi9Q9y3bn7DZC
 duMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gYRJV1u8w1zfxw7mFhOJX56e8WP6iJD4snIYpj1lw1g=;
 b=LnKVHo/lWGyBN8TOBaTxuSQY81PIk0Yd0D9d4Lj5cP2Iur6U04S3+mpRJJf1UZOiHZ
 7HG54NQ9f6qR1uqAmuvgx0gFB+I5JNw5YkFaJGZPgDgRF7/dqfEe/Z/7vhl+o8dGrhrf
 DxDPP+3YNeqz0j3Rp5mE/GJJV6in53LG1uTGJMMaBaEEJqLH5dFkcXFUTdRlPxxDjLTB
 yJc1bDZogzq3j1duot7l5De51akNnUabUH0emvj9D9ZZn6lPoSMcZTGGAzhIbY2yhGiS
 6LRUH4ftPQoHwvP8wGzeov59vTYzFLHLH9iZVNqC50OlRz/mxMUNA3UKKauCdjILa9Zt
 UG7A==
X-Gm-Message-State: AOAM530dGG1uwcjfu8eGLaGJk1gwGoPSwSa0ILhFq//cqGsVW6XXt+hn
 lKC8HdJ2kDPrUdiQ8Z+MymaqCA==
X-Google-Smtp-Source: ABdhPJytF2hQjZFRo9Bd3D0LlsTMzPGJ+URzG+RCFYePRAmsiZqeLJQs0jZO2P8pEzXOhnhClvWYog==
X-Received: by 2002:a05:600c:4b92:: with SMTP id
 e18mr6340876wmp.156.1630835178725; 
 Sun, 05 Sep 2021 02:46:18 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id n3sm4133748wmi.0.2021.09.05.02.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 02:46:18 -0700 (PDT)
Subject: Re: [PATCH v4 13/21] target/loongarch: Add floating point move
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-14-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ccb9236c-c1f2-4130-c349-489df7508757@linaro.org>
Date: Sun, 5 Sep 2021 11:45:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-14-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 groug@kaod.org, maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 2:40 PM, Song Gao wrote:
> +TRANS(fmov_s, gen_mov, tcg_gen_mov_tl)

Hmm.  The spec says only the low 32-bits are modified?  But is also says that if the 
source is not in the single-precision format the result is uncertain?

I'm not sure how to reconcile these two statements.

Ideally the language would allow the result to be nanboxed...


r~

