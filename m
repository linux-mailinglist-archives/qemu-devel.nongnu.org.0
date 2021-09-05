Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69068400F2E
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 12:53:42 +0200 (CEST)
Received: from localhost ([::1]:40974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMpmP-0007CQ-1S
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 06:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMpgU-0005dn-Vb
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:47:44 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:47018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMpgR-0007U8-Vk
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:47:34 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x6so5225388wrv.13
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 03:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J7pkNgcpVFN5SBwtZ0lXmpTcZKdsdligMRzbP+8je1s=;
 b=E4/PTr/hFo05iXHNU2cZM/6XREmWYsSkbZ+CXUMOmtI+RMeB3GEF1On4wIdd0C8scq
 5TjhruidNJniRuVokYR/MMQXidsMvHjqdSOuv1AsP4SC13KNEkUR77M+6LQpyigyFWG3
 0a3OTMP8xY8qBmpbLk7p9KhwpRun7g2txiAipMYA4fRZBc09Lh53/vxBehlLKW+ka0O5
 FWhQsyVeXD2Z1k/zJCePIvI14ubvoUfEEsG0M2+kTGxEqPt/yCWLI8QydkZ5b+4e8hAs
 gGzYwiOxDJa9zJKBfQoCiYICv1L5cEjD3bC/r0Tg7sLbW53fix/V7T1Fa7ULH4S00bOt
 uSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J7pkNgcpVFN5SBwtZ0lXmpTcZKdsdligMRzbP+8je1s=;
 b=Ag+dJXs2rkvXhpR4UZShyh0sxL8L++NEX3Y14rvSZWYmWe+hQBE6hqRY89vFFbFxex
 16VkxWzdJy5/nAqvBv08GUskPoMXdiCZ5dHCQwo/w12vAqXs0cS0/64eZtqH2PgZiCIY
 xTJfHTFIzaNAByMsrBVNeIs2UC2iTn0K4T4Xkh9pfbFRu3SMkRKOhEhH9MlBMctF4geQ
 VuMT6njxuXRdcsXrmXYz/yM0k8c6mfddgC8KFCpCOXU7gbR+CqpnrKoJqwFmVV0z+8FB
 TU8+ihiFeIj43RaJr10vW94UUVzNeIF7YE9lkKoYdGr7uwFB2weSA+rk2Cg8WzSBe3Ui
 lVXQ==
X-Gm-Message-State: AOAM530IfcQJxqMLBhRYUeoina6odEXxz/35k0B5A6Vp+aAmGlqSS/8W
 8XcyoQn8xr6JKtNsRXpTpcLDKQ==
X-Google-Smtp-Source: ABdhPJziYYjpZSejXoBIk7RkJVm572qrtovq6Sdt8plVQAKlmantbFYPpb+1lxVnvoLkimBasWputw==
X-Received: by 2002:a5d:4564:: with SMTP id a4mr7933049wrc.81.1630838849210;
 Sun, 05 Sep 2021 03:47:29 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id d29sm3838267wrc.6.2021.09.05.03.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 03:47:28 -0700 (PDT)
Subject: Re: [PATCH] target/ppc: fix setting of CR flags in bcdcfsq
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210823150235.35759-1-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4dfb5ffb-faac-a160-250c-4d9dfca1cb01@linaro.org>
Date: Sun, 5 Sep 2021 12:47:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210823150235.35759-1-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 5:02 PM, Luis Pires wrote:
> According to the ISA, CR should be set based on the source value, and
> not on the packed decimal result.
> The way this was implemented would cause GT, LT and EQ to be set
> incorrectly when the source value was too large and the 31 least
> significant digits of the packed decimal result ended up being all zero.
> This would happen for source values of +/-10^31, +/-10^32, etc.
> 
> The new implementation fixes this and also skips the result calculation
> altogether in case of src overflow.
> 
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> ---
>   target/ppc/int_helper.c | 61 ++++++++++++++++++++++++++++++++---------
>   1 file changed, 48 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

