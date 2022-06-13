Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F54B549E1C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 21:52:00 +0200 (CEST)
Received: from localhost ([::1]:40336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0q6R-0005bt-Iu
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 15:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q2o-0003eB-AS
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:48:14 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:38750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q2m-0004oj-L7
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:48:14 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso9780997pjl.3
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 12:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Fg7BQW6q7SxvlJW2v7m1a0X8rqzF0xpyQmB2CPDVMEc=;
 b=WMIIaKtAWz9KcVhZKczyJWHIReGqWuv803zzsA29l66GP4mzWt++HNFsRLtVmpEEHe
 WxH/FuS6b/1ztJ9EihlIqFHWjfp6pT6cozOrRT4Rc3/ffuNqjc/7xrGwLIwgGgotgTOA
 Zsb/S8OYuObCs1HvkPy9PQdQ95qLb29wmcavREfJuFK91+DHB5Wl/AHiyVus3FXjpukv
 3hIkfe1MmiiDGw7nOSF+LMJlcUABx8xfFIVm5qUh07fMIlyQHiWIdvXdoyQa0g5kkZOs
 ZEouK+UBpnIyDhB/d7BN+uUPvIHEOl4+/8RSXmvtQdjd9dmRz1F4mFUfm80Z7GL0Tzap
 1oeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fg7BQW6q7SxvlJW2v7m1a0X8rqzF0xpyQmB2CPDVMEc=;
 b=fIKsO9PJndH+Xv24Ha8J0+wBYpx/yOzWv7xuas8ktuZ5OtzpuFNmhQPo0BvvPMbbvj
 LyAMNRrQf4q3VLA7B+sCLkx7+W+h0kWHgJnwBu/sfm3qovao3uJn53cFYuNkIvacjKjU
 Axwn/Suz5C4lAkBox7zJ0Lk0mu1CujfA6ht+lIVBk2yUFZtrLJT0nYKuKAYGaz9Sj/hd
 jM+ECPMgRC72zhgzuhyW42p5lXVUkjE7cUcL8o/oLUqXXTQCNha4DUBN6FRkP1zaGktr
 utgL1k3hjNtIjW2ePzJFTC3eallB/wxWfqNS8ikx0DUDOpdcaiTWtscjADrta24rDC6D
 cgDQ==
X-Gm-Message-State: AJIora8f8JNnXoHgIihOopJdEzr52a1YhoucvnfbPfgPmjdIIEAGduHt
 7es0fkxVsYQ04pPzfpKC75vJ9A==
X-Google-Smtp-Source: AGRyM1ulcRJzWfF+CBuXpta83uJf7Aufskf2NDOLUTbpaoFr1ksWDB2rl+/hiKNdV9dBdPDUkyMI8A==
X-Received: by 2002:a17:90a:9f04:b0:1e3:2d77:3eae with SMTP id
 n4-20020a17090a9f0400b001e32d773eaemr337083pjp.243.1655149691234; 
 Mon, 13 Jun 2022 12:48:11 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a170902714600b00168eab11f67sm124131plm.94.2022.06.13.12.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 12:48:10 -0700 (PDT)
Message-ID: <ff48991c-2715-346e-7bbb-6f9d016e63f6@linaro.org>
Date: Mon, 13 Jun 2022 12:48:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 04/11] bsd-user: Implement chdir and fchdir
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@FreeBSD.org, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
References: <20220612204851.19914-1-imp@bsdimp.com>
 <20220612204851.19914-5-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220612204851.19914-5-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 6/12/22 13:48, Warner Losh wrote:
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h           | 20 ++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c |  8 ++++++++
>   2 files changed, 28 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

