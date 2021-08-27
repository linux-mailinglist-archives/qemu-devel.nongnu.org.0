Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B503F9381
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 06:24:01 +0200 (CEST)
Received: from localhost ([::1]:37722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTPC-0004Xp-SE
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 00:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJTNg-0003oI-Eh
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:22:16 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJTNf-0001V5-2G
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:22:16 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so6605810wmh.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 21:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xXEWR9TdYq75A5D0RxZ/NPinfKhgRO3kGtuCnfimBgg=;
 b=ct5P2NH6T/DGKE+Gt/IfKZwzRZyQrK0Z6re0Pw9qqD4EqxD3565kJGDuw/eR/s7y1g
 l3IND0NKsiK+PXXCI1G/ZqXGNpsrDKEOjBR+Ilp1wAtIZJk7rtt34sBR1YvTUxUJb6QT
 3L24xi+zua9hx1E0RmP4LFG9DtjskNJnPYvzE2iLWTwpdYfhpftqXJoJTk4yZ6y2g7jK
 d3QvHk2Vuea2duZ87ZHgKXaUABFC3WMg6udAcctUK0Yl8sI3sIcFcDpt59fdu6chLw5F
 5nBqYXFWm79xG1PKlFOoGDC+2SkeHv6RXDO92lI3b7MwJZXa0tbyZmi2Zdj3PmLyn/cI
 P4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xXEWR9TdYq75A5D0RxZ/NPinfKhgRO3kGtuCnfimBgg=;
 b=MUjhD2Vuc3IsbFugGf7JK9Z2DSxlQeKKj0Unh1B1VH+t5Sb4AwEsuSY07vbl0OohRz
 0+PjBn/2bfWNqbbltjoTnCFiJdHz8Ap5kWGpLyJTGL9Yg5Mn+j48M4SoXhL/DDmOAGFd
 TUdAP3KsW686/5UISX87Pzu+7/vo5UBRt44vFWxW8vleD4YR1M7csebND7TFxCydQcge
 5Smpx4k6Sc3D3VP1zqyeQy8+9uYD6TCaYpIJ56L4WodFBcSPww7vafNbY2OO6hWIlEL1
 vLQDuqzO5sF75B1dBYPaSF8sBwkbFgfVCWYuzLwlZPIbxFsmKgHG3FNpQIJDigLocpxg
 KIVw==
X-Gm-Message-State: AOAM530uS2JIb3aON/CyODprURcKeVWzUMKWJEv06aJSQBO24AZglAur
 bL08W9IqK2H+RTh0mTcZmHU=
X-Google-Smtp-Source: ABdhPJw4i7Ae3ZAx/zNrLHxupt4kEsbXm+6tIajI+HEedaYgGd9/EAZnPu7jDYmBp2zZth/d38HcQQ==
X-Received: by 2002:a1c:27c5:: with SMTP id
 n188mr17424886wmn.126.1630038133509; 
 Thu, 26 Aug 2021 21:22:13 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id l15sm5118974wrv.84.2021.08.26.21.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 21:22:12 -0700 (PDT)
Subject: Re: [PATCH v2 08/43] bsd-user: pass the bsd_param into loader_exec
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-9-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cf21a360-0588-ab59-561d-0fb3bd5bb797@amsat.org>
Date: Fri, 27 Aug 2021 06:22:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826211201.98877-9-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 11:11 PM, imp@bsdimp.com wrote:
> From: Warner Losh <imp@bsdimp.com>
> 
> Pass the bsd_param into loader_exec, and adjust.

Missing the "why" justification.

Anyway,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/bsdload.c | 37 +++++++++++++++++++------------------
>  bsd-user/main.c    |  7 ++++++-
>  bsd-user/qemu.h    |  3 ++-
>  3 files changed, 27 insertions(+), 20 deletions(-)

