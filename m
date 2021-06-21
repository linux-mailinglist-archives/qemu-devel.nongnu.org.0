Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DD83AF525
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 20:35:33 +0200 (CEST)
Received: from localhost ([::1]:50576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvOlg-0002yJ-Hf
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 14:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvOg7-00087c-4X
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:29:48 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvOg5-0007Ra-L9
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:29:46 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso360863wmc.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 11:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iUDvbN7A5Bx20uDycbvRQb11lDzZaBl4TSkDsmsZ07Q=;
 b=T9UVGfyB8ScXUZIcBXV2ig74NzDY81KQIDmWMyx7g+KrKMcC35pKzEtTxS1hX6MsFI
 qzdgJ70ORda73eIOxAFO4/kace30AK+PXWQybgBjIBt9r5XsSwuqXwQ19Mp3IU6YXYUv
 cwGRrdv2j8a3mfJKTXI0BY6eyjIIglS9HWuqhwuwukQXh2+up1PsoW8UTEEjFyhRTqvn
 TWZHXh7sslwyEqqRq69yvGYW+RmA6S9obsT7lyX+qThXzpyS8kwYW90dpujWgw13Zaq5
 xka+J4UdKh2FdCiL6slGDCckpLOk3x02lgxJcYQmHBNTIvYiWzEcC1ZVnTWrcmQmG0pX
 pp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iUDvbN7A5Bx20uDycbvRQb11lDzZaBl4TSkDsmsZ07Q=;
 b=ge9yDld5V/L5gTp6P+pftG8S/yr0JNL4ZvLDLkaRj+VBqrOq3jf4BagAwTJr7i8IUd
 Kj8j4KMC0qpBSz0U4G6ym93THG6pSPIqYDnqujwTIz6S1+EikXssh/3tK7wnpUGc9jqv
 jk9Si6Zd19FdwQyNwZuToHcUljEOaiCr+bphQqiGeK1DghrOHJQW3ySkneL9vDOz0VMB
 guk4gDdC9H4QFVwZ9lwLCbY/PxzmUuDUdUO+5vcfctzOGaE9SUg+RNs/SDzif028IRSd
 WCrNneARNvynp4sEyroPrMJvYEY0kK3PcjI1gUsOp9l63BOR/XUCXq/CxaukvltVQhj5
 F6sQ==
X-Gm-Message-State: AOAM531fT81OCCnwsFNrVaIRAaSpuxbG9kBhZMd4+ydgfeXjNvg1fFud
 sVbHjvSDj/5YkSilPReQX/Y=
X-Google-Smtp-Source: ABdhPJzOH2cK6Y1m126nuEuFx6JDj1bfUop7DR2OuhXU3IqH7WC4BOolm5TXcvATByMhzIRuyqfuvw==
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr18269212wmk.3.1624300184180; 
 Mon, 21 Jun 2021 11:29:44 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g17sm23518581wrh.72.2021.06.21.11.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 11:29:43 -0700 (PDT)
Subject: Re: [PATCH 04/15] accel/tcg: Don't test for watchpoints for code read
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210619172626.875885-1-richard.henderson@linaro.org>
 <20210619172626.875885-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <75b1f032-cb15-7e3c-dde1-21ff0fc957ae@amsat.org>
Date: Mon, 21 Jun 2021 20:29:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210619172626.875885-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/21 7:26 PM, Richard Henderson wrote:
> Data read watchpoints do not apply to code reads.
> Watchpoints for code are called breakpoints, and
> are handled by the translator.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

