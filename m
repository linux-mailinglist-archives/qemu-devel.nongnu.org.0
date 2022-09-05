Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B98A5AD1DF
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:55:14 +0200 (CEST)
Received: from localhost ([::1]:60648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAh2-0000sX-EQ
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVA47-0002e8-LZ
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:14:55 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVA45-0006iV-Oj
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:14:55 -0400
Received: by mail-wr1-x432.google.com with SMTP id b16so10892421wru.7
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=TSFTzTDwhPJITAYVKeUqh58L49PoK4H1kFWk5mbB+I8=;
 b=p7r2nWB2Am1XZFQaSuJCyG+jO+jfa1/NgMdqiPvbRJxO20NesA8PqgxsJ+M6UxM6Y3
 H4wa+H/1j9icVjW/Qx5uXHek+5iwhbR/Eew1jJwPpLIPpXbY/okoxqI7J6uYNg5bwcdS
 26H6R0k7msrzc3owSg3h4ahMUk62TZ/ZYQpuGbh2rI/I0veTp/tdLA0RIlpxCRIBMiuW
 kT33qJYzFZ2sSmByxNJ/u3vxPdzK7PRkbMVcZ23cQg6PGN10lhnmZuBjRD9X4+e+lRu4
 8u8eTmWeTW0n/xWT8aRFeZKMAyl6VKUOXLHhO0QfhL4DTU1wikzWs6+cF5OoKZ+8xkz2
 5brQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=TSFTzTDwhPJITAYVKeUqh58L49PoK4H1kFWk5mbB+I8=;
 b=mynyUISaHmzcsQX9Rl7J9tad7sHTjYH667/AJCKqKQw7vT7xPhE/uujqB1lguXMAQB
 svx1zOlMmb+JPg4kcZuaLOcKWkx/WYuLsxurds7JAmIxTxprVthJctlSDM7CIefrJ6RN
 Q4Mm3FXhBlEVQbTLfyc6d2vAhVE71CgnAB7SJZVBMzIXu285plrMB5JBKwyE4qfOQdqi
 sOk/+gdVb/0hrF7ORhqSJ1vwiREomLnxJWOFxxWWpFRJlpashJ27XO7V+L/wq369FA2a
 fW3PbN4qGRIIOlc19RYRAox7XugGjSV8oq60t0XJe72aV5wPTC0c1JYK+gp1+60EzJdD
 vqWA==
X-Gm-Message-State: ACgBeo2kIcJUff6QfOdMa3fNFymaAlrZvXlqJYhb1czj2IwntHBSSgxo
 RspK9mI0boz0oJJ2uuMZf5gvig==
X-Google-Smtp-Source: AA6agR63hTETqcbsiWLnj1gazXKuSf1uAnEmbHShbzQouJx2gOOkzVJ11zA7aRu16vT4ASp8G6HZLg==
X-Received: by 2002:adf:f484:0:b0:228:6489:5da3 with SMTP id
 l4-20020adff484000000b0022864895da3mr3754037wro.193.1662376492378; 
 Mon, 05 Sep 2022 04:14:52 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a7bcb8f000000b003a83b066401sm16409938wmi.31.2022.09.05.04.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:14:51 -0700 (PDT)
Message-ID: <1e073a1b-c470-db73-d245-d9faae29f0b2@linaro.org>
Date: Mon, 5 Sep 2022 12:14:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 11/20] disas/nanomips: Remove #inlcude <sstream>
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-12-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-12-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/5/22 10:55, Milica Lazarevic wrote:
> <sstream> is a C++ library and it's not used by disassembler.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> ---
>   disas/nanomips.cpp | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

