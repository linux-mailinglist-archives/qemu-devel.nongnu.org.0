Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF97E1EAFD2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 21:50:50 +0200 (CEST)
Received: from localhost ([::1]:33854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfqSP-0006eC-PX
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 15:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfqRT-0006CD-2E
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 15:49:51 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:38834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfqRR-0006KN-KN
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 15:49:50 -0400
Received: by mail-pg1-x541.google.com with SMTP id u5so3976120pgn.5
 for <qemu-devel@nongnu.org>; Mon, 01 Jun 2020 12:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KV/TnN/xEtaU7+BkeOdf4uIZtGmyTAsyvNxW/ewepaA=;
 b=UmBUe+XwdqvS3QRwSYSnM+2Wp4Wobw4qHucGXCcNBDYA+V0rStFcXk+aR8vEwiKw5G
 NNxQPfaWzJKDg9cvqvqGKp4YK6vxoz0YS2ZOQErg6fQ8+owPvRfyVC80M6OLMLlm4IyH
 OMwPoLI63YK7B0qo9Fuaoy+DcCOiYU2cAo3nb5srfwtO4DuuO7QHWG+TSA7Mxg8Jt9O+
 Wgm33JvnwmznQTDhhHd3iU76fMJCM3ScP9uMRB3JfWtvsH0geTbk4hnmfSfO8Nz00gXT
 jseviVYeD6wWff+D/3WdQUOz6uJqasPKkZIMvP6HZ2vj9oDXB7rZfOtvKSqdrs40Zj8f
 5ZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KV/TnN/xEtaU7+BkeOdf4uIZtGmyTAsyvNxW/ewepaA=;
 b=QcDciy0R2azm8AizaInZt552n1wY4l1waudJ2tWbwlk0n7pf4Y8wXGKc86zm0zdJJt
 clXrmQB3ta8cfeqNDP7nEakUYKucz2/hvBarHsGy0+F75uBFnvYo+6KWMa1uNuIyw2S0
 awDXzpbbDzZrXOqWyzQ/86SH+krb8D0d/rU12IblG6NrsbDm+bqSHsMRdJv2jaSN9n8z
 B2Uvjv0dmMhN24/DmAaB/VENks1xbDnzURGexmjAPlbi41v4/kUyMsYnsRFIb75wylrA
 hsKvgugkk9fMK8Jk+bWK7sinyy4B5PuI09hqOUe/bPBUxWZhcpJMZNX7WGcO26ZOYkbF
 sX1g==
X-Gm-Message-State: AOAM5308NOO+GchTsH8mdrthf8pABkx4cw0fm/5bcAZu/rh/oCqJHFSk
 4NsyWldw2v9LxMVuAnv6NOKeAA==
X-Google-Smtp-Source: ABdhPJwfUTXuXl5WyE0OgmGMmN3Ncwi2EniDP0SNsNUH0DhzxopkpZ0Pcdz1X9969znL24mmiIEV9g==
X-Received: by 2002:a63:40a:: with SMTP id 10mr21074664pge.310.1591040988349; 
 Mon, 01 Jun 2020 12:49:48 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id w186sm222232pff.83.2020.06.01.12.49.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 12:49:47 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] target/tricore: Move translate feature check to ctx
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
References: <20200529072148.284037-1-kbastian@mail.uni-paderborn.de>
 <20200529072148.284037-3-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7270b366-11ee-4763-7dc2-47cfb9b8388d@linaro.org>
Date: Mon, 1 Jun 2020 12:49:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200529072148.284037-3-kbastian@mail.uni-paderborn.de>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andreas Konopik <andreas.konopik@fau.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/29/20 12:21 AM, Bastian Koppelmann wrote:
> this allows us to remove the references to env from ctx. This also fixes
> a segfault that was due to the unititalized ctx->env ptr.
> 
> Reported-by: Andreas Konopik <andreas.konopik@fau.de>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
>  target/tricore/translate.c | 60 +++++++++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 27 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

