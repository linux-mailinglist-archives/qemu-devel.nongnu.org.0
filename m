Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D81457CB2
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 10:42:13 +0100 (CET)
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moMsu-0007wK-Ic
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 04:42:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moMqh-00071p-UZ
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 04:39:55 -0500
Received: from [2a00:1450:4864:20::32d] (port=44689
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moMqg-0003EX-4G
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 04:39:55 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso9330210wme.3
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 01:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IkfTJ2hJgIwdudeQfcN2fBZrHkf2Cy8IIs3mALMP8PA=;
 b=HjwceWsj2T9RHohJtm0uSlqeJYzAKn+QayVXsOmu9pLjTjkpjkTK06uuQznQE2lh2S
 eBcxoYHTEMkgUdSTdxlXsphLOo2HJkIbvHkoUfKOsLyYOBSAJJiOPyU5d9AQhNitPJHn
 OW4qsuNZpwsC9RNaypscI6QaL2kd/Z3ZtLuG0giHF+FZBtiidWY+gO9e412pg049BVah
 /vQ2CmM/X03XGE0E4cHl3FDMMGO/jCOZ9ncPfQJUe7mp/2ZAOeeZR7NZMOC53VfuR1Qy
 /NtxXWQM8cz1fHBu0FLKkucPFGiUWLrjBzwc5zOgaE8AW6Jodryc2aIdFXmWH1Kjg5rh
 4CFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IkfTJ2hJgIwdudeQfcN2fBZrHkf2Cy8IIs3mALMP8PA=;
 b=O4dhRXM0K0w5ryq8MgrOZtiPS/a24CjaUeOQEn+initbvvYVE/PpFgCr7Nl4/Fd3D3
 /CFvF9BL1YSGNW8wALsFLuKGi+IC7JMJLnGULPSnLSkas+wVe1pe5DWtNc9v6XTi8Itj
 jkfhr8GYatqUU6WfVwkcrwv+zrxhiPcaIeg1+KZ+i0SW2Us6KjthEZ9VgX+hNb9a+YF5
 6agKPDZWWR324EmbA1AIRHmiBBBazGJ+DgwzaJbKwnkvFhzM4F1URczd4A1aj+6KDoZv
 GVRUbQ12mkORu4dQC41hQ5WjN2boLN9xRVV5ia+2HtzjSbV6jYHIzgL+WaDx6/KzbqTy
 vnFA==
X-Gm-Message-State: AOAM531WRTt78fomyHj8drC28Nmsy9aiALZh4do9ge8M6QL6orY98i4P
 op7ezgI8tVnZd2nuyod/EZ7fFg==
X-Google-Smtp-Source: ABdhPJxD9aDG4jrqaTS7L5FyWBrTk9/HPebDBHbMa6E6ZBLaZr/4TQXl7vid9H20f5Ya877hxIXThA==
X-Received: by 2002:a05:600c:4f8a:: with SMTP id
 n10mr8403336wmq.54.1637401192751; 
 Sat, 20 Nov 2021 01:39:52 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id z6sm2885517wmp.1.2021.11.20.01.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 01:39:52 -0800 (PST)
Subject: Re: [PATCH v11 07/26] target/loongarch: Add fixed point load/store
 instruction translation
From: Richard Henderson <richard.henderson@linaro.org>
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-8-git-send-email-gaosong@loongson.cn>
 <52e99aaa-1fa3-7b54-76e8-2ba4df4853fa@linaro.org>
Message-ID: <2b66f19e-6556-3d15-7c06-45c0869928d8@linaro.org>
Date: Sat, 20 Nov 2021 10:39:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <52e99aaa-1fa3-7b54-76e8-2ba4df4853fa@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/21 9:20 AM, Richard Henderson wrote:
> %i14s2      10:s14 !function=shl_2

Of course you have a times_4 function introduced later which could be used for this.


r~

