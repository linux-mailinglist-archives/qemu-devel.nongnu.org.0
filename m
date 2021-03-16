Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DB633E1A4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:47:38 +0100 (CET)
Received: from localhost ([::1]:36022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMITR-0006X5-N2
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIQk-0004iN-Qp
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:44:50 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIQj-0003AO-Du
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:44:50 -0400
Received: by mail-wr1-x432.google.com with SMTP id a18so11291096wrc.13
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 15:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oUK/mZvJk4EpxkCJz8cqQGMWC9ndKr9Mawh072sig5g=;
 b=jYFgGg2DsQBwaepvRv9YPeOAqoGu22VwhGjWr87FhGoTgxOzco91fWIqlBQNUSyMG/
 jS/mjBsac/GWhEakh86J0ogoXYIZmoRCUolzsajXseFdeuDXLSwp9Izi9GFslsFVlfKf
 /5tSG/I1Hv58H35YBC3/xbDgJWE2alK8/IokakfLS7/j+12NNHUtXazyHNjrx3oIJtPs
 srZWpExLTS4qxEe766M4OGTXHfNszKCgDvilhm3y7sQbybbtbVVBwKf/jKwt5RVfwkBJ
 jw6QdfYhp4qC4AQCI+wRDbZIso1hNvE+x8boc4xKeMYcMhc5S8aLp76zy7HmY2kfilOt
 IREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oUK/mZvJk4EpxkCJz8cqQGMWC9ndKr9Mawh072sig5g=;
 b=HBsGOu/UXuVW7cW25VMMWOtgQgu0+1QHaYagldUVVaT7jg3YTjK5mvlsPuYEEzCBLV
 gxd5C68JDvAEfkn0DiXAXVH1dcDSNkWjt2svFkC6RDLXREZOq1xosYyWKxuETkUW+SRc
 SR2XlHOoqCt+eBgRyjUbrAFdr+bYRPkS0j1TTS8phxDR10NEhXlBGnW1E+M+93OauOgq
 249INAnU5ZTlknzWIismRUUT6fWOuUtzJND6VKBqRJX0Epl3Vz+Yk+wQKbw/3L/IewlV
 qyeHaHI8mSkk+AtOhOyQL67mmVLLlzhj5YCwTu3JMmLV+GR8W+zCBeM+tEn7jvgPvRdQ
 vcOg==
X-Gm-Message-State: AOAM530Nnl/TyOoDauJzRcbNEMrvntRdeXLwki7N6Ut1ewn61KMYATqQ
 ZZyEzYAwG+vwdMUAwLR+Z4w=
X-Google-Smtp-Source: ABdhPJxR1sbzKVqr2Krp2+TQYxS+BSMJJuqB2/0i7/BAw+JSSKX8s5whKfsjY9j99Y56HV2SfBqJDQ==
X-Received: by 2002:adf:fe01:: with SMTP id n1mr1175414wrr.341.1615934685305; 
 Tue, 16 Mar 2021 15:44:45 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b15sm726240wmd.41.2021.03.16.15.44.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 15:44:44 -0700 (PDT)
Subject: Re: [PATCH v5 52/57] tcg/tci: Implement mulu2, muls2
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-53-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <aa78b831-d433-eeba-06a0-3504f6053475@amsat.org>
Date: Tue, 16 Mar 2021 23:44:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-53-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> We already had mulu2_i32 for a 32-bit host; expand this to 64-bit
> hosts as well.  The muls2_i32 and the 64-bit opcodes are new.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.h     |  8 ++++----
>  tcg/tci.c                | 35 +++++++++++++++++++++++++++++------
>  tcg/tci/tcg-target.c.inc | 16 ++++++++++------
>  3 files changed, 43 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

