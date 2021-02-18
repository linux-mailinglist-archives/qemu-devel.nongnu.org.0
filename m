Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF43731F2F6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:20:46 +0100 (CET)
Received: from localhost ([::1]:59780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCsbF-0006DT-Rl
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:20:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsYK-0004vo-Vh
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:17:44 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsYI-0006RA-Nj
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:17:44 -0500
Received: by mail-wr1-x434.google.com with SMTP id v14so4752430wro.7
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 15:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E/zwWhDMFzkSyjy3mEj5+p3mZbRrIHHbXuuCYmQnRlg=;
 b=AryHgmwTDJb1niGyQW7qiumtuUlUK38cTBL0MEqlLA0ZsnS//ZBjRJWRQsBY+DXAJB
 y1NVlSGFuT6UEBCtygh/rwrXmyMA0G+HOsTO776Ih3VLh+MivRzGhqkn+woW+LWmU49y
 qDOpLzRbKRrAH1BFKkTKRjmM3uP39RilCvwGrWJNPQJOAJU2y3L+gxMXvv7lgT8l+dhk
 COExhexKF1dSC9jqIFhIz7enWF43GJE9dUISrdIjcJyVLHtijRJjNR9QEe9P3jSf2M6O
 PXR0oa0bBzlBIXAOeEd0mA0RWBbmGxD4rgYevkAQ+C6TzCZfSc0lpY/Cll2hiX6H2047
 iq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E/zwWhDMFzkSyjy3mEj5+p3mZbRrIHHbXuuCYmQnRlg=;
 b=q6+JCIHDo2/72/sIqO6gk5GWr1kcB0QNTbmc1doDgMF3jHKFwnGpbYye6ObeJw0Aok
 N3IGp7Jk+sbLHljwm45vO9k+/rDsjTO7fgW4jtdaJqOCLWabztz+wKSho0F10abb2E4N
 cTjpUGE5jWh0mzRqo/4ahgwGLa+b7rDwMyjW65Fh7/Z2JkdjQ4Qyj0kx9eRs/c612+PJ
 bvWBHFykckeDFcpQIYFlbI2zSbNiddHLwZ+9USWhUDGnHP1RSYyFFwgmqCU6eaY1Lxfo
 fMUnFhCfxVZiZ16WTpmqhyxUY5w8w+Wxe1yJxAssA94qrAr5t/5in1+gEW8XSlCJj77V
 6zsQ==
X-Gm-Message-State: AOAM533Hmt+SySINsvp+sUgGJZmUl+X9QVfW8AL9TqbErO7ye+GhE661
 GNegUm2bEwX958bcbIpaFNU=
X-Google-Smtp-Source: ABdhPJx2nIF3Mb9E9LBpg8nJ56Gb/HERpYcrnRAAMZgFXxoLm+miDBkcj5HlbKof4bCROkgLd0Igsw==
X-Received: by 2002:a5d:6148:: with SMTP id y8mr6301124wrt.238.1613690260843; 
 Thu, 18 Feb 2021 15:17:40 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b72sm10007892wmd.4.2021.02.18.15.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 15:17:40 -0800 (PST)
Subject: Re: [PATCH v4 12/71] tcg/tci: Merge basic arithmetic operations
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1f050c38-d939-86ac-196c-ef8ea0201e45@amsat.org>
Date: Fri, 19 Feb 2021 00:17:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217202036.1724901-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 2/17/21 9:19 PM, Richard Henderson wrote:
> This includes add, sub, mul, and, or, xor.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 83 +++++++++++++++++--------------------------------------
>  1 file changed, 25 insertions(+), 58 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

