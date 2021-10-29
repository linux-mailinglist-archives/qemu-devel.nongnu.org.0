Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4123440308
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:19:21 +0200 (CEST)
Received: from localhost ([::1]:40462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXPM-0001AW-Ve
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgX5w-0002AT-IP
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:59:18 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgX5v-0000wg-4y
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:59:16 -0400
Received: by mail-pf1-x42b.google.com with SMTP id t184so10105823pfd.0
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 11:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=135du4ahnccHJvHzqJbvve2ix4C5z9Sk4m6ak2+YkUQ=;
 b=Z+Rim5YOx5VBAgwg/XUCwgT+6NJzTzMhFx6iBO9o/K9Z1/FWcBp7X7R6Z5pHTz5iJJ
 Rv7+ISusMOo/J27xZGUub6cPaKjhvVsvD8FGWbgmbqnbNEGRedq2VoIY9bRnY/uxDQ7z
 pZB20nMwKezx0k3ViPdjV0YmKj54s0FLXep4l85ZdlmD2M4iafWZl5hCvvw/3ML3pVTM
 3pc5wr7ggjLnc1VW8WfPXX08AMm3IZoAoZfPpC2/m24lg/nNNQu6a2u3j9m8B2r9tQ9a
 mw/wknrGq8ephyz/vCid6f7pwbE4CvdrQUv17MIKO6wwgF4kf55fijAHhIjJd0wmIaT4
 PtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=135du4ahnccHJvHzqJbvve2ix4C5z9Sk4m6ak2+YkUQ=;
 b=RRDaE9QK51uc7xA2g2H+Dxx5HAl/y+Nqa7SXw2DJLrLpZSsjGfh4E7vuOC78CJxn4N
 FSw51lUzebrDcQKrwF8FIxPLZJNDorF8Ou/3bx1PbrTbJZheuN2CmODDuZa1Y8mUe/44
 bE1KOvOEjnnVMDSXmM4dHat9rN8qV36Ro8AjUBoUUKp+4gSZjuumoTi6dHjrqTZdu9Zm
 CkJTw6Cknr6W3D1+Xxg2Fg5m6SLwcv55oIuAe7azXpe6VDDVNi4wVObZO/TVITXNphpW
 n8bWA53emSVqzK8cgTkYQ8O0VBDSb9+Ei4tzW22XGlR0IS5p4R/30Wlmai+YVrQYEmFJ
 eOjA==
X-Gm-Message-State: AOAM5318slmm3tRi+2bvQ8kF06yLi3Ddcta68f5fw+yTc7MhRnTGTd8n
 RSObvZjXwdekZSxzGdUETr76GQ==
X-Google-Smtp-Source: ABdhPJxtgwZ16vQJ3OGRMf9dLlmMReSjdvOUGfeociMApaaCB8Z6GvQw9eZEoxYPMtl4xITdzDCbug==
X-Received: by 2002:a05:6a00:15d3:b0:47c:1c91:93d with SMTP id
 o19-20020a056a0015d300b0047c1c91093dmr12748916pfu.80.1635533953635; 
 Fri, 29 Oct 2021 11:59:13 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id np17sm12026697pjb.7.2021.10.29.11.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 11:59:13 -0700 (PDT)
Subject: Re: [PATCH v4 12/30] Hexagon HVX (target/hexagon) TCG generation
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
 <1634033468-23566-13-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <18a78591-f956-fe36-c085-504a1bb59958@linaro.org>
Date: Fri, 29 Oct 2021 11:59:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634033468-23566-13-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 3:10 AM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/translate.h |  61 ++++++++++++
>   target/hexagon/genptr.c    |  15 +++
>   target/hexagon/translate.c | 243 ++++++++++++++++++++++++++++++++++++++++++++-
>   3 files changed, 315 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

