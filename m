Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9080354334
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 17:12:15 +0200 (CEST)
Received: from localhost ([::1]:51712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQti-0002Iu-Q3
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 11:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQXb-000750-EL
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:49:23 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQXZ-0002RB-Uy
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:49:23 -0400
Received: by mail-pl1-x632.google.com with SMTP id t20so5753383plr.13
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vOUnIx/w2vTKRslhDX6pdDbsE0hWP8Qsj4TET3aIXCQ=;
 b=VGOXxADUbotEbUrjgU5V8em0PiWJH4ZqihCTu/akCu5Hz1p42JV09KoKDmzcY/UCN2
 cTQrJwoGlN+DkB67MlWqlspmih0LwsrjTkgHlq7l7IosgbRzfbLenqGYgjOs7Z6IwqnT
 6AExNjg7TR6IYztWk8cWErSVKVA9I8vp03JvwXcVRfjdD2h7PwzK2Eol6VvaeJMzgIjM
 X4eEQYKcBXy/F1jQgOjb0nl0Oe499P8DzimZ9SphD0kulyNB6U9WG+rdognsCoMGcoJm
 OHxD3FihYd+Hsm/OkreibzoJFVww9Blbl2DArjX6RNrihlrjFmnUl4HKBpUdT9T96I+r
 276A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vOUnIx/w2vTKRslhDX6pdDbsE0hWP8Qsj4TET3aIXCQ=;
 b=N5/2SP1LN7cdsfARNXQg9GwlCFqQdlLsibqzjbBLPjv6t/u6r9IIG8pPA30k5+Q+xI
 MMQ6ISijXmkoPbeFOPVhWTB1ZW7MFC7HlCZO/UzDOK3yykVthiv0SRm1TcdxwERmybAd
 MvQgvYw7zqb304q24qtNVHjnlsB45Wt5tMPN9SrrzSHzmtqc2bccrNmiQF0W5tO+kMYx
 /O/JgvmIpB9QCjWsny5YA3WaFa3Yh27SRtxvbK039Ba3xy0NnGp4dMtr/42+MiiJPGwY
 ro2YuFTDFtcvE8LTaa+mxEHsu/A38EwNCQJ9u3Z6zZPV399PjsAeM+pVj6/2QpYQMset
 I3Cg==
X-Gm-Message-State: AOAM532ub81bhybRAbCzdJm8ynbn+AOsOzUkyArz/uQDr2PIfirEPk/t
 ZqeYcoy4FVYiaq9GWCAVWg1l3w==
X-Google-Smtp-Source: ABdhPJxbmYuATtizIPflZHTj9YjPeYD/DZrbcq/BO8IYmKkYNbMx2k0fOHCzZqiYGk0FG25+zk8JYg==
X-Received: by 2002:a17:902:d3ca:b029:e9:1f35:ce78 with SMTP id
 w10-20020a170902d3cab02900e91f35ce78mr3081336plb.20.1617634160615; 
 Mon, 05 Apr 2021 07:49:20 -0700 (PDT)
Received: from [192.168.73.67] (50-200-230-211-static.hfc.comcastbusiness.net.
 [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id h6sm16454755pfh.13.2021.04.05.07.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Apr 2021 07:49:20 -0700 (PDT)
Subject: Re: [PATCH v1 2/8] target/riscv: Remove the hardcoded SSTATUS_SD macro
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1617393702.git.alistair.francis@wdc.com>
 <4b26392f1626590ee9064d43df4aef590472b72d.1617393702.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fd5301a8-9bc8-a9c8-4a82-1d1e3d5d1506@linaro.org>
Date: Mon, 5 Apr 2021 07:49:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4b26392f1626590ee9064d43df4aef590472b72d.1617393702.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/2/21 1:02 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/cpu_bits.h | 6 ------
>   target/riscv/csr.c      | 9 ++++++++-
>   2 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


