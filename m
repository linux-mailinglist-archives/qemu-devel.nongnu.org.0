Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E66E21E0D0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 21:33:32 +0200 (CEST)
Received: from localhost ([::1]:35814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv4Ch-0007ap-Ax
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 15:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jv4BD-0006EJ-Rb
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 15:31:59 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:40304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jv4BC-0007m5-55
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 15:31:59 -0400
Received: by mail-pg1-x541.google.com with SMTP id e18so6468876pgn.7
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 12:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w6i5hVoOyHjvxFLItb4ie5QHkJsy6FaHB02eCSQQRPs=;
 b=YdxPp2O7b+Mx4Foa1E44yZdvXcpnXtXsEvPX3i+X4v6H8ZYlhOhdvTZS1zlDj4jE41
 hS9Gu409fMr8vcYgIvI3XpP0k2gtLXbU3wwF2QErCmJ7Ll6ZCQOgIQ/Xbf5M5BWudC6X
 albk33ieU5UMKeNxCT6fd3Q0i8V7BR3vH1gO+xLySZpfEAcJ2TlJ+YySDXSiclBdYe3S
 hee1gMD+9l2ukLAKS64lxAXpcdaN62lPUTf1Te5vLwqvsJJf2WtxZVSI0YcbyXpO5lGx
 wylv8b++AqngSrTegVDyvudhLNmEVkcoMUOS/ds3B3dzx4TmQ8GifqOfxLvO0tlpKWpq
 dlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w6i5hVoOyHjvxFLItb4ie5QHkJsy6FaHB02eCSQQRPs=;
 b=KSS8GZJodlP0oWP7aLmVfxORoU6fWLz1u2rOsr2EJDpTyNRYMZEuS0NK3WbYb/PDzz
 1L2wvBIIag5/Uhr6ZdtM3Wmt6f3vyZ3wNMaO0p2uM4w1aVm3KTNYgDewu/TjKCQhGQdx
 zRVYqn1XRTd5tWyuSMez3M4+HbhKWOczHkOSlgi3rDlAfhh2v+bfd4gHQ9TK7XtmuDal
 YqVjmvJXUTKjJM4otX5j6q24wFPHkePg7mq6ynY3GhHu/x7hcIqd6sqJzpTnRh5tB4bo
 FoUEep36tTfWonplQII1juxNyxOFgFZrxiw6Jxf/imiFspDnIIHfpNzrp7xJP1S8qscx
 hiig==
X-Gm-Message-State: AOAM531fDZnD4aJqbhu9T5SmbUN3TCvYjbhn87RkgxYFCl3zOjznOX9K
 q3t/e96Xx2TTP1FHkO+IJFx4MQ==
X-Google-Smtp-Source: ABdhPJwJxskLokCB1qPk0VreSqTnnU92Olv/QG79QSThJdJM/9f9U16PBVpKPFKUthocJj/1boacYQ==
X-Received: by 2002:a62:15c3:: with SMTP id 186mr1302355pfv.30.1594668716621; 
 Mon, 13 Jul 2020 12:31:56 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id w4sm15278787pfd.39.2020.07.13.12.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 12:31:56 -0700 (PDT)
Subject: Re: [RFC PATCH 6/8] fpu/softfloat: define operation for bfloat16
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20200712234521.3972-1-zhiwei_liu@c-sky.com>
 <20200712234521.3972-7-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac4ccac7-e3f6-5b1a-ff6d-1e460acc90ae@linaro.org>
Date: Mon, 13 Jul 2020 12:31:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200712234521.3972-7-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: wenmeng_zhang@c-sky.com, alex.bennee@linaro.org, wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/20 4:45 PM, LIU Zhiwei wrote:
> @@ -3039,7 +3143,7 @@ static FloatParts scalbn_decomposed
>          return return_nan(a, s);
>      }
>      if (a.cls == float_class_normal) {
> -        /* The largest float type (even though not supported by FloatParts)
> +        /* The largest float type (even though nt supported by FloatParts)

Oops.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

