Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 261AC2DE3BE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 15:12:49 +0100 (CET)
Received: from localhost ([::1]:48040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGUy-0001VV-5T
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 09:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqGSl-0000Eg-1u
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 09:10:31 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:43996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqGSj-0008DG-DC
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 09:10:30 -0500
Received: by mail-lf1-x12c.google.com with SMTP id 23so5687984lfg.10
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 06:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9g93bjJxbJqVwaeAzDTF0cLaPS87LT1hVcbDYM+HoG0=;
 b=E9cF8t+oqILgC5Jtb9gPA8RWQoul7l2ERepRA5VoG59Px4TcQEEM6MwxDtSmrJu8XS
 bYpqA7XNJpRnfZCFW5+Q1cF+1tmzFhrl4LEKm67hC1oxTmk7pHgbFCaAyoCEnHsHb1+t
 G6ckIWltCqGw4lmO227ZquZpjtUhZ7VHTJpPHICndx5iMFF1IOPRYsVPi5n2W2m715Ak
 Ytp+fT9v4tdNM0T2Jo2GHuRtfo0rh2SlzHmUaSOlRz1ukb3X6Dx/OIooeYWMPFRxOCCO
 ILMlJtLNki7j5sdex+fMF5nG3wJ91KB4XtKaWR2FSoDUzoFCYJ9BUpAQt1s7eExjw05T
 XhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9g93bjJxbJqVwaeAzDTF0cLaPS87LT1hVcbDYM+HoG0=;
 b=iY3z3PmFaPXzGTqmNJStysNFZ1CtbeeCkDwF+3V31KXF7XRn1zwE3vFz2N7yIW/wuf
 GWrLy0vEktNIqRQSI44Y8w+bb/lOqRLLElvY3YPyCr4HVyd7wG5/zBLoBhjDQIUC5RqK
 uEKVZ2L/xAVB9GhtMbEgNEIN1URxsOprNsA9Rj7UtEdheUlsqgKSYw5a43eiY4vqhp8c
 vG7/FGp+mQCOlQfN+aF4e0W5FG0heVHvLBaIc2YScjxFAt25a1uRHmFEQMChi1MbyMWD
 zSVTuCSswr24hhf9ZQU601VcoG30HnLdSxy5r16h1DT7c5yjm93ksFqVAxBU1LGL8u+F
 KBvA==
X-Gm-Message-State: AOAM530DwDhahwUuLuMgy+Zd+k6YEh51ijJcRgSBJp2+3YL7tbl7rcXu
 HYcn8nYWeYVn66Apb09kN1g=
X-Google-Smtp-Source: ABdhPJzYc0ptGLrWBEGCZ4FSjr11qe7mQucGHUPWAgtRy9Th6iyCFSeVcltnEZg6LoNudZZkqgV6ow==
X-Received: by 2002:a2e:b891:: with SMTP id r17mr1849769ljp.130.1608300624470; 
 Fri, 18 Dec 2020 06:10:24 -0800 (PST)
Received: from [10.101.1.184] ([185.224.57.162])
 by smtp.gmail.com with ESMTPSA id n14sm936433lfe.95.2020.12.18.06.10.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 06:10:23 -0800 (PST)
Subject: Re: [PATCH v2 7/9] gdbstub: drop gdbserver_cleanup in favour of
 gdb_exit
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201218112707.28348-1-alex.bennee@linaro.org>
 <20201218112707.28348-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <53786f12-fd14-5a1b-a870-3726b1f78fad@amsat.org>
Date: Fri, 18 Dec 2020 15:10:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201218112707.28348-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-lf1-x12c.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 12:27 PM, Alex Bennée wrote:
> Despite it's name it didn't actually clean-up so let us document
> gdb_exit() better and use that.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20201214153012.12723-6-alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/exec/gdbstub.h | 14 +++++++++++---
>  gdbstub.c              |  7 -------
>  softmmu/runstate.c     |  2 +-
>  3 files changed, 12 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

