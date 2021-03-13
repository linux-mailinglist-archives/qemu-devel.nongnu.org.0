Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D15339F94
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:40:38 +0100 (CET)
Received: from localhost ([::1]:42062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL8Fh-0007G1-IF
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL8D0-0005V6-Lv
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:37:51 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:33574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL8Cy-0007HG-Iv
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:37:49 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so595018wma.0
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 09:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=waNCM4FdEE4WcI5M7zhhcwgSGHj0bkpuxnP+/Q8MpWY=;
 b=sJAe3vo2MXPPlhdus++zLTEK86yM1Kk1YiVJZrFBw67Hl7jgEc5BSykLciQ++JOwPW
 9/m1IkafJGjWP+QbDrBtORXOTKl7EDpLa7yhRXKHJ7JgoAT2wL1nJS1WNUl3Yo4Be3eG
 ffImx9s1B7sd6FInyZFo+JVYs6U1dhFcQ+FJZ9DWfTyMsdqmN0dgaIqBf11q5uRXiAIX
 bPMbdKQjNx+cz2fcjJyI3wjwkWIXeH1VfzsdC6wXSyusULUpQRB7NF1Crr2XOdBQuTkH
 DBJ+LAj/RGvdQJ8wqvFBFQ7AIeX09G93v+8Wf5Ct91iPmx0VN7cca/ZdfjnUPhvXBXWb
 3SxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=waNCM4FdEE4WcI5M7zhhcwgSGHj0bkpuxnP+/Q8MpWY=;
 b=b4AwVVibLN9re9AvPuQe2UQgJfqMa1Qlhd/QpM7TgfmUQxcevvGYlw8bxxKp4+V54j
 jXniqX7NTDQMaBGXGE67mYQTeTeHaKVxCiVQVItH9cD5AuSkmMwbZsTebc4PpO9w8aA6
 Ksej76703Y3CPiUtUcAWflCpOx88o4LdSMsRzpnh3mXsI9iOoxS8WmdiUFDe3Vv3bBKE
 XhcU3JsjmSmtLA4h5IKdAq3LywpL+DHjjJQ6g8yPctfo3PMTvmojJ2p8hHfDAYdhl91N
 FqH2knTiFt/GMmSj+qGDLzIF8hAcKS70zqEh/cLrf8V2RTAZ0irErr7cR2m+k3eYgQDt
 tZ7w==
X-Gm-Message-State: AOAM532XvK1j1cyhsiUro9Q3e86gFrbxy47eSZWYvSoQYMss76wXLitw
 +tYlGL4QEbDHw22vfekDhpU=
X-Google-Smtp-Source: ABdhPJxwBROffVoyiAAMrR+mcCFWbxRk5DGc7vg5pNLdMcdIqPq2ffmMLonNSPGYrRikMMKztGQoFA==
X-Received: by 2002:a1c:2390:: with SMTP id j138mr18382241wmj.72.1615657067182; 
 Sat, 13 Mar 2021 09:37:47 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y18sm12618230wrq.61.2021.03.13.09.37.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 09:37:46 -0800 (PST)
Subject: Re: [PATCH 05/26] tcg: Remove error return from
 tcg_region_initial_alloc__locked
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311002156.253711-1-richard.henderson@linaro.org>
 <20210311002156.253711-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <70408ec7-6d90-61e3-58ba-91e3b5a0348e@amsat.org>
Date: Sat, 13 Mar 2021 18:37:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311002156.253711-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 1:21 AM, Richard Henderson wrote:
> All callers immediately assert on error, so move the assert
> into the function itself.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

