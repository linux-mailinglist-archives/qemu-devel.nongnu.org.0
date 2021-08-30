Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AB83FBEAB
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 00:02:37 +0200 (CEST)
Received: from localhost ([::1]:58606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKpMS-0005uR-4h
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 18:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpGV-00023N-Qc
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:56:27 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpGU-0004yO-9F
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:56:27 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso448746wmc.5
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 14:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q9cNu9mEnpcxjpMI6J8YqGl0PBCYyN8oQs/Hk7ifc5E=;
 b=c5ySCKn9Z4biGJjVLCiuyuiB+jeCRJ/AWfUek6GYEUPLVaPEFTsR18hME8rfBDkvFy
 GWfSBQMLm0YzZB4CVsSEhWJ5QQwOG9xcmV2tcWIYG0OzGMJGpp7tCOkxY30y6oKLXrVl
 0cE27aPkjVnsNr052Vwr8Cn46O9meoj6Fc3W681GzcfkIkVuSgLBY67nlEE2qqVaNSLq
 m9szndXUj94N2maznmj4dHG1GW0xiTKItMb3w8QAlI3Y8MGT4Rz4Hk2g5SFtNrM8T2Q2
 Lfd8jerYRDwLuBoph1wKymrbiWAITol+2z2YXpFTDP8D6rMPGuaNEIWjcF/bf6kvp9Wy
 37Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q9cNu9mEnpcxjpMI6J8YqGl0PBCYyN8oQs/Hk7ifc5E=;
 b=M4IynEtd4OmaX+UX7aBbbYWbayPBhC06O6qc/rxjz4G/PsDFL2YwQUSAoiw82ILtZH
 leqFtC1hgBSAznxJLRr6P4YbBcjgruzNAv1ZwBOyNvte6c4pbo+H/9KSGSACDaHx/yzU
 2mdvf6I/2lMsMphnwcnCIARNe89YvSVaHZoewjtKGVcRdCmA2Duf+7G6kdxuxVqN/DY8
 RlgD6/gK+cfQup3nJxShlgPZLa0LrYec8BIkEmZGKHk6NqdXY0gfshdg8Hk4D1EimCdB
 aFNJycEqIOyvbby6p0rxeQRW0/GdcQAo6i0rffxE955Bnu8H5s6eE0r4ck1lkKDqylB3
 uiZQ==
X-Gm-Message-State: AOAM533SiS3stax8v+oQtydCj3ZOZbKOC5XK1bZbuD9n/S4ovHk2+M/+
 yzauaVUXXphll+Ovr8Apo/Uv3k48l5o=
X-Google-Smtp-Source: ABdhPJxZRAKF3NO3s/zj/ewCBip3iKEnbjSirNmRL3OroWv4tJEPEr2TCcC9H2+ZqKcfvQgZLZYAMw==
X-Received: by 2002:a05:600c:4b88:: with SMTP id
 e8mr1021584wmp.164.1630360584727; 
 Mon, 30 Aug 2021 14:56:24 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n4sm19585522wro.81.2021.08.30.14.56.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:56:23 -0700 (PDT)
Subject: Re: [PATCH 30/48] tcg/optimize: Split out fold_xx_to_i
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210830062451.639572-1-richard.henderson@linaro.org>
 <20210830062451.639572-31-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3eb6936a-91c1-17a4-7544-b7409ccb449f@amsat.org>
Date: Mon, 30 Aug 2021 23:56:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830062451.639572-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.932,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 8:24 AM, Richard Henderson wrote:
> Pull the "op r, a, a => movi r, 0" optimization into a function,
> and use it in the outer opcode fold functions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 41 ++++++++++++++++++++++++-----------------
>  1 file changed, 24 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

