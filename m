Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE2233E1BA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:52:28 +0100 (CET)
Received: from localhost ([::1]:44724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMIY7-0001s9-Np
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIXD-000167-O4
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:51:31 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIXB-0006AY-TE
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:51:31 -0400
Received: by mail-wr1-x433.google.com with SMTP id b9so8269925wrt.8
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 15:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5C/ePfitazplkG88FhjrwYWjRkIoNIWyewwxUg2mSZ8=;
 b=g+AQQjKQUKaU0joGBuU03ZiXqAO/BuMsJ8Q6vWuTV87zc2ADFFQHASAjnrN172tyZI
 /R7PXmpeumtHk/kZd8ZIwybSc//UtibcgPvA/RhuNyJ/SiICUP1QKOmDb2kXQu4HTOTZ
 QDKUiV/wg2abEVqsxbVNgd26SHMa4Yy6zye8Ty2oTBn5vr/KcdEWnIjQiDrgxIZl/dr2
 8DLzAy9EsS1ymZjFbc0RdW0j+a1iEvkQVA3kiwyILp0/yBDUZlIFyKWX1uSFItlBp3uN
 +ktQi9Z5yz89JkkL9xbvYuj5v6Q2wzKJ0rxXlwvGGo9plgjX1sr6mkv8Jw/mA7Khda8o
 UDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5C/ePfitazplkG88FhjrwYWjRkIoNIWyewwxUg2mSZ8=;
 b=oKGlKSW4hduf7kqdEpPJnO5y/PdmL/M10hENmgeZWOEog4U+X8Xu0D7ejg6YSh4cWn
 dVPYf9c/C8oaS710716BBU0NZJeRfPp7v+ZjtsiPA4uLOOYkqX/UAc3Pt1O3ESXoe28A
 QO4d362WnmBifJf/o7JIxJSSvCkARqMLIJucs5dnTNarTKRLU+5OqJRjf47HdkESZ7QE
 wYFHeiJSB+GhBYYVkj32vzNYX6Wpgn7rAYuFR5ITZOT05aiuTqu8aQhlFeDELzZd9692
 jBwo38TnmnSFerDaO+1ZN4aHX+8SYWF33txZXsUZYjIkIA2uPRicxUtyn0arJL6ChRlh
 Hwbg==
X-Gm-Message-State: AOAM532qPDnFRSSDyHVPkd67qIs7Y+LFc/Enry+0p4N+Oy6C2HIASk12
 HiGe1FfE4KUevkTIR9WPUKI=
X-Google-Smtp-Source: ABdhPJwJ4yODtDSpLLq2hVuek9fJJY0IoMeHi7AxvZcBExxX+57CTqYgxanusjHcLFoM2/A1jhNVEg==
X-Received: by 2002:adf:84e6:: with SMTP id 93mr1175397wrg.376.1615935088587; 
 Tue, 16 Mar 2021 15:51:28 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 91sm24648069wrl.20.2021.03.16.15.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 15:51:28 -0700 (PDT)
Subject: Re: [PATCH v5 04/57] tcg/tci: Split out tci_args_rr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <26de5370-854d-fa86-4d59-ab64e4a0f958@amsat.org>
Date: Tue, 16 Mar 2021 23:51:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 67 +++++++++++++++++++++++++------------------------------
>  1 file changed, 31 insertions(+), 36 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

