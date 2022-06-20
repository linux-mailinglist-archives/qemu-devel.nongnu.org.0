Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361EB5524D9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 21:54:06 +0200 (CEST)
Received: from localhost ([::1]:36366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3NTJ-0003Dw-9d
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 15:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3Muh-00080y-KV
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 15:18:21 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:40674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3Mug-0006il-7k
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 15:18:19 -0400
Received: by mail-pl1-x631.google.com with SMTP id k7so10566106plg.7
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 12:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=X1aX2Rx7dXTPF7aFNcDvrUtOG9AS6HsoyFJfrMCqZhk=;
 b=d+9tJrsSJMjhsxGa82gKYrxIvuZWGZGca5N6loWZvnRd/Fr5myqMs01hSlCHm7ZCBd
 pa8I7pKaOdjAgp5TkyyFEoXh7DARSXgVV4+mSThXdzCCOStNZcQHJ9Ynjju4Pceu4j//
 mAzK7+KzTFBE9705G1TYlnmLticMU5G5K7Iwo3RUM7+3rNiUbUSEhQcnmC08aUIbIjZb
 NmjS1WENh3/66WlssQvzXQSCe9wtSbUp0AdpeezK1JCJdPPKZTTxR3oA1nj072ijtw0B
 fqsxcWk0FcFo8Lb+GuavETRWnl5Pj3h6MQnleuRxpFtaY7XEth1gnK18we8gyMnLgwkm
 L0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X1aX2Rx7dXTPF7aFNcDvrUtOG9AS6HsoyFJfrMCqZhk=;
 b=Xd0g2QHP6H/UsVy+pnax0/HDLxOfujVostKpzAGIJkR2K232BAbSOFK3TzqqRT5Vno
 cux/ghFLFGiDKPyDBepjdbV6WNx94im8VpswCyCYjWMwEDYCLo8Xfj4UKt+84qyabryJ
 EQ9jnyZvfXiJVylWh4c8awyRNw690S1SJwK4LVG91fhhmysaBKf5gaKdRFgEK75OSz+B
 ZIie93u6wRWFd7UkSDg6eavDL5LkbgDUYRTrKo/vBmAJNATaPzsLjxTDVLB+0ECtJiqG
 o7rYE1QY8bxu/fyuOekzJt/Cbb3xUs5ZGbgZhFl2xdS1iqS9w1VYi9GWx6ReK2LKep6w
 Nqog==
X-Gm-Message-State: AJIora86U95Y8GJLa3/kXVno3wyxcQHWLQz7ESMzkbViAXcGz6d557Va
 kRthZEYNG4fdb2gBHa/Pz7GxSw==
X-Google-Smtp-Source: AGRyM1sntRdigE+kXXshg3KYAbtSSKlDq+bM0BNsr1eUBgCwHVAEHqf2c2h1NSsDRY/xoHZz80K81A==
X-Received: by 2002:a17:902:ab87:b0:162:26cf:bf7a with SMTP id
 f7-20020a170902ab8700b0016226cfbf7amr24703023plr.168.1655752696691; 
 Mon, 20 Jun 2022 12:18:16 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a63a00a000000b003fd9e4911f9sm456356pge.31.2022.06.20.12.18.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 12:18:16 -0700 (PDT)
Message-ID: <f5318754-8131-5b1b-9def-08f8d06927fa@linaro.org>
Date: Mon, 20 Jun 2022 12:18:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 05/10] bsd-user: Implement chown, fchown, lchown and
 fchownat
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
References: <20220620174220.22179-1-imp@bsdimp.com>
 <20220620174220.22179-6-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220620174220.22179-6-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/20/22 10:42, Warner Losh wrote:
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h           | 48 +++++++++++++++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c | 16 ++++++++++++
>   2 files changed, 64 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

