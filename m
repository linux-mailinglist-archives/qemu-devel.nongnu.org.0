Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF7333E23A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:36:08 +0100 (CET)
Received: from localhost ([::1]:32828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJEN-0007tn-Ki
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJ9L-00024d-QL
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:30:55 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJ9K-0007AA-Ax
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:30:55 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so2369846wmy.5
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E4p20Cm5EiS3yYS4JdjYlyDmCZmOWuWcKZUt4NXiiqs=;
 b=ZvvS2LwyeQxGpJF/L1ovJVURjbLbmNbfVDlVqJ8Tun0OYjlnhVM/yJdxhA51oiW3+f
 tvNV2nDQhm73fGjVx6emS8QT0ahIK+CVGgLHXoenRXqTA31W3tNjkgPhX9u0/h3OnSnd
 A7AUmI8vFvaucj81bn5Gia1g1Wd0UqB2Ka4zanVrBe7XI5r4johXpGYALtqwqQ/dqxVt
 kOH1e8lsCq3zDYp/kYnSPHg02orjFmvMOw3bfc+tpM+265lLi2rMle/TLi/1vrWLs4hw
 qKMttJXHlpPO9nVmxEosaEGImCTyXj+BVKv5a/itIdGZl81KkeMuljWFJ1YuBPv13DxQ
 gw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E4p20Cm5EiS3yYS4JdjYlyDmCZmOWuWcKZUt4NXiiqs=;
 b=ptmQsRWvvWJyExNwOQm5gUH9wsDsBgshG1gQBKO9Vmn8Pi0l+D7sMFxzRHhBOU5G1Z
 h2JPa0L9xNQvOxoPIpu0IL7uzLC6sBUjkG7Psrev8OhaWSwO6hbKQjlqJPIF5cGrErsP
 8IttrO8640Lw3uLEG7MaVE6NxIli800AifOMGY5r7M+3TfIIgF7Zg+FeP1cwJF3rMeXA
 UyDiqGF+IX68J6cQrQbQlPYmWLqXhJGk+yAAR/Px1gVHZq65W7PLBerInizw2sQGjvLu
 876QbRsXKbOr9P8n9s9PSsUNLLisMhl8hkzjNXzvFglLDdQkzRUQYddyBXAp9QWNVtdm
 EJqw==
X-Gm-Message-State: AOAM532cFf/Po6VuUzLz4lADcd8P9HW/D2PRp+2pdsWLrfB1WjrnLN4I
 KCT89HIPSF0FB43S5W2Ltok=
X-Google-Smtp-Source: ABdhPJyckcrnGAU2c8NoeO4G+y+N3S2+W/GuxYr3ONuYUedH5W8Q3dwBTj+CDnlG59zjjKA7dUAhyw==
X-Received: by 2002:a05:600c:4f55:: with SMTP id
 m21mr982852wmq.11.1615937452982; 
 Tue, 16 Mar 2021 16:30:52 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q4sm710808wma.20.2021.03.16.16.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:30:52 -0700 (PDT)
Subject: Re: [PATCH v5 36/57] tcg/tci: Split out tcg_out_op_rrrrrr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-37-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dcb8977f-6144-63c5-9256-a0ff61f1304e@amsat.org>
Date: Wed, 17 Mar 2021 00:30:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-37-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
>  tcg/tci/tcg-target.c.inc | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

