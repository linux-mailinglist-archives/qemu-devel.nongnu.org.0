Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779433E496D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 18:06:31 +0200 (CEST)
Received: from localhost ([::1]:58590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD7nJ-0005br-Ul
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 12:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mD7hx-0006s6-SW
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 12:00:57 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mD7hw-0005VW-CF
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 12:00:57 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k29so9332743wrd.7
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 09:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6oI5Xxu8jDObgNb9WvpNIAJOzi2SqCxEauONag1jVhU=;
 b=MwDXdRmShcolnoDIdcS6hE9hk5oSS/lnivNfC2XhrCq0FqcpMo1VYlQ5nZ+EZyBbpH
 NnHpgxNUwqz3JFxjp+W5mFaY/4Uc41vjLoTFhUvzIb3BZmz198AUVEkFD5axgbaTj0kN
 RhvtXz808tlCWM68HnUJiEZsXHB73yNIN2v/a+wMzKLhxuSRvCTKGyN/2+PDQWtm1KdR
 F1apCVs1U9fzX4nOq7cpN+vyfqmjLP62XawuZI+An0bY9UxlgZ627Dc8dDjvxCkQVzaN
 n4GPhmaFMDaEZKpYqCnb9HNJBzIj9Tvusx+5aDbJycUwlTBRf0oDcOPAgIkaqUkHnbnZ
 bzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6oI5Xxu8jDObgNb9WvpNIAJOzi2SqCxEauONag1jVhU=;
 b=hlLZNunr64jMuYaCbX2lzlXpeRxKzyy2CcykCxVYZHGC8hgpnutzNIP9frjsp1/p46
 XRmVBVgG+sOpcsvHbHiaNJpOIquOqL5fY6v6IS6Z43iF/a3A+joEnAG/UAIWwlhGECLL
 83WTTunS1ztwOxxdokpSCRNjXSTAMhZYu3vCsiLLy00l1aYGA9qQedSUfq8Dzyigj+AH
 oiYLbgkSf1/yMA6Qir+CIUmxoAC09AbBmubK+GExrsA3JFcsMj1FMF7edgmpDCRoXpyu
 AMJGG9bLp5GeWg9vd7JuwYzXIFFFjydRhL0BUxSoNqwnfhgnS0wzYXsM19TfpeAwLiuf
 JufQ==
X-Gm-Message-State: AOAM532ePJ4WG5aL9phDq8PNpbiul1glPKcLIEEcjwUfivwUCwX9Yg01
 eagQNkInoxsM/pp/G1QfiyE=
X-Google-Smtp-Source: ABdhPJw8cFLjDockSPUOeTmO9YcT47LP5M/sL2QIa8/LsXY9yKSv2KFrsXktUMTdEHzD6jsr89zwHg==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr25908488wry.241.1628524855002; 
 Mon, 09 Aug 2021 09:00:55 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p2sm20451642wrr.21.2021.08.09.09.00.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 09:00:54 -0700 (PDT)
Subject: Re: [PATCH] linux-user: Check lock_user result for ip_mreq_source
 sockopts
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210809155424.30968-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6f65703d-9a95-53e4-572b-91d02334cc92@amsat.org>
Date: Mon, 9 Aug 2021 18:00:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809155424.30968-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 5:54 PM, Peter Maydell wrote:
> In do_setsockopt(), the code path for the options which take a struct
> ip_mreq_source (IP_BLOCK_SOURCE, IP_UNBLOCK_SOURCE,
> IP_ADD_SOURCE_MEMBERSHIP and IP_DROP_SOURCE_MEMBERSHIP) fails to
> check the return value from lock_user().  Handle this in the usual
> way by returning -TARGET_EFAULT.
> 
> (In practice this was probably harmless because we'd pass a NULL
> pointer to setsockopt() and the kernel would then return EFAULT.)
> 
> Fixes: Coverity CID 1459987
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Compile-tested only; I don't have a test case to hand that
> uses these socket options.
> 
>  linux-user/syscall.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

