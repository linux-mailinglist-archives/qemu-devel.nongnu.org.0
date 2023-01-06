Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508C5660A25
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 00:16:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDvvO-0007nB-8u; Fri, 06 Jan 2023 18:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDvvE-0007mk-Sp
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:14:48 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDvvD-0001P9-9f
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:14:48 -0500
Received: by mail-pl1-x62c.google.com with SMTP id b2so3278854pld.7
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 15:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UnFWVo0TmZmIBS3ZwUuWBQENi/M1Uhego9XCXoNlXxU=;
 b=SW0xzLM+fwHluKZNGVOYswv5ejC0DHeGb2xHbX/5j7+GIZF0XhPLVMnlCBrSGzp5sD
 haBW2o1ae+gqXmdJciC2SiSCDRTUIWeAxkT8Izs/Gj4uvl1kUjpNrZee34hWZ2W+V+i5
 fThXNgh1K4FO58XdTZfByjce8eRTc39CWuOfraeX/TE6/ltAy+Fqd15KqZSXmvaGa0Ch
 K3zxcSLS3aX5QjgKe+4aAdMmXpSyMAoUkRJ5h6lu371S+XClNWhIEXHPo2SAt22Pb2be
 9k0R4vUz9C7hfFXXsRJE55rtZk8SpGUb4FNvPCN4Jk5hnZUCs2WsDWlBI0jEG8VZSKDX
 4oJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UnFWVo0TmZmIBS3ZwUuWBQENi/M1Uhego9XCXoNlXxU=;
 b=XTgUW7cgNcyKn+LznOdloS3OM/mv6FTDy/d+BanIigoCZcG3378pmH92mmXsvai8WU
 hn1O6usfwsN2YtxxCLShkb72X9NC8dmv0Qzeh6dBLuQ4PwGZVg0tqnhlmlPyTOvLP3n1
 cMclHNsrrouI9OTe31YMa0yD0c7cidz7anDDDqi9Dfl1ielSpOquxaCHdXQBrQ0RDIfv
 umVVjx9km8eQLcJFvj8Lsm/AehzKr3JzcB+9CBS6NEGGJRnrsKnDDmh/OXqlabOb+O/V
 DVTq6AA/YuX+91mf/4wgNslOEck0MXhdb3dZiQtOCt9LVxSkQR3qYcQ8XqlRZCHLo5NL
 pzOA==
X-Gm-Message-State: AFqh2krswCGN2FLauR3yBRfMlfObJCknn2cW4w/1994gCSBMYxBftG3U
 nT8vcZ/PDzFKqNmtN9KABi+bVw==
X-Google-Smtp-Source: AMrXdXsBdkRAvvLBIldl7gT+nQizncRkcIUkejxym/itO3Cv6PXlf3ktDu3Vv8CNDUx/LNF4/MFT5w==
X-Received: by 2002:a17:902:efcb:b0:192:72f3:1d18 with SMTP id
 ja11-20020a170902efcb00b0019272f31d18mr43800769plb.47.1673046879456; 
 Fri, 06 Jan 2023 15:14:39 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a17090322c300b0017f8094a52asm1491450plg.29.2023.01.06.15.14.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 15:14:38 -0800 (PST)
Message-ID: <94159795-925e-2e89-3cb6-b6fec198eca1@linaro.org>
Date: Fri, 6 Jan 2023 15:14:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 14/21] gdbstub: specialise target_memory_rw_debug
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-15-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/5/23 08:43, Alex Bennée wrote:
> The two implementations are different enough to encourage having a
> specialisation and we can move some of the softmmu only stuff out of
> gdbstub.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h | 19 ++++++++++++
>   gdbstub/gdbstub.c   | 73 +++++++--------------------------------------
>   gdbstub/softmmu.c   | 51 +++++++++++++++++++++++++++++++
>   gdbstub/user.c      | 15 ++++++++++
>   4 files changed, 96 insertions(+), 62 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

