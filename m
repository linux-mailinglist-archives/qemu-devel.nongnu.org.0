Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A5343D5D6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 23:33:59 +0200 (CEST)
Received: from localhost ([::1]:59014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfqYX-0003av-Tl
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 17:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfqWW-0002tw-GR
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:31:52 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfqWU-0005g9-Qf
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:31:52 -0400
Received: by mail-pg1-x532.google.com with SMTP id e65so4264723pgc.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 14:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vucCDKB2zI+gQbyBWCphEyV2+X2LLDgzW/yQZNzn1PM=;
 b=cMEbjwFyNqhKcrHlM1U3R91jZYOKXXo4zv6wkK/G85WZgnXOWLS/wfKJm0e8+ONzyy
 rwENsBt11O3Hlekdl7GlNf8wyRBSfLoPUmA3aHSgaFW0J2G0T7skS043VO3KA6VCAWyW
 Y2RJaSsaODJUaROXQy+hjy1wn9sSaBeMs7YtE9bz66bz0HqwaV8NBq+c7WEi+AekT0Ed
 mSNw34YmO0IDXnFKkXajED24N/M36Rb99/JZKgSxHaP3At4QJCRQKGTFmhqn8Y4XL8tD
 mLGt18U/7jPc2CtZKCLWoM2eOgjKsCwBVzx6H7+C9dAXn+RIV1J3nQAZPW+B93OwOKsX
 7i1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vucCDKB2zI+gQbyBWCphEyV2+X2LLDgzW/yQZNzn1PM=;
 b=QkADxqzHmHwbd5vqHhEPPnee//m1SgfPwmrNJ1kfEsvGEsmj15faAjuL2RWEPpz4An
 j/4CS1RngyJ4JhazZdiDD7LGwDLOmTZc9ZDqwwvmo3WsIyrNnJtvrg0vRqAjTu3OjsyD
 Vvabru07j6EJwata1d1pljaB8x++VLbHONb4QkUlwAW7GVy7ZLfV/tgs/Av8/YMEL5B3
 WPK802NpyUdwxNQNZy3daAXYyLMTKhNBkh8fyheDrfbDzndxnD6hoDJQ+Vcntz72gns9
 GL6y8SARUp/lcIOyBoiTR2J3PMEkq4XOvDWtHkeeDwHXd9H/ytCm2Lourx0haQcTQQnb
 b5cg==
X-Gm-Message-State: AOAM530ZlIi7NSdDG5c2RqlhnpIJPBQlBObPQc23EakbpM9lcMVkilp2
 oNV8gKfZgAuxoa/OAAAD0k7qhQ==
X-Google-Smtp-Source: ABdhPJwk6X6VYK3jIee+KevzTAxXJm/qVDJPOC0ZI+jUqqK+YGGv9lAmorld+Yw0vM/tjBFdih5vmg==
X-Received: by 2002:a05:6a00:24c4:b0:47c:354e:b19 with SMTP id
 d4-20020a056a0024c400b0047c354e0b19mr169414pfv.33.1635370309206; 
 Wed, 27 Oct 2021 14:31:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id oc12sm645773pjb.17.2021.10.27.14.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 14:31:48 -0700 (PDT)
Subject: Re: [PATCH v2 12/32] target/mips: Convert MSA I8 instruction format
 to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <589c5ddd-2787-f682-9bd9-cd78623c11d4@linaro.org>
Date: Wed, 27 Oct 2021 14:31:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027180730.1551932-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 11:07 AM, Philippe Mathieu-Daudé wrote:
> Convert instructions with an 8-bit immediate value and either
> implicit data format or data format df to decodetree.
> 
> Reviewed-by: Jiaxun Yang<jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v2: TCG timm is constant
> ---
>   target/mips/tcg/msa.decode      |  8 ++++
>   target/mips/tcg/msa_translate.c | 73 ++++++++-------------------------
>   2 files changed, 24 insertions(+), 57 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Though of course it would be affected by any adjustment to TRANS_MSA.

r~

