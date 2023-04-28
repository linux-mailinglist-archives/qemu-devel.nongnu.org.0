Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0CD6F1FE7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 23:00:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psVBX-0003KZ-06; Fri, 28 Apr 2023 16:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psVBQ-0003Jj-PM
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 16:59:17 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psVBL-0005yL-Vw
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 16:59:09 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f55ffdbaedso109705f8f.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 13:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682715545; x=1685307545;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5RZ/v+3s/Gutu0uNA/cR3SlZkRU+GlqHGEYUcahF0lk=;
 b=BZJvlPxEGOqUOPFLGvWCFQeEDmT13a6S0i1nW+AF1c9V9UsnOr2SzaWwIpmUOSsesJ
 Z8BGShvkBYlq+aKPlS6xzINznp8ZEVFDBSZs8Ak1dR91ht3X/Ws6UNYbZlRaGAZrcSVz
 vux6Pd2xvyiaGhBwKDGPiO7pMs0TVnSRJ/scCUMOYihrXENw9GOVrmbxyCzOsM6sKzrW
 ePf6vdMZNsXKy8ycq825a+hWzMIAuyAzliiwOCUTofUyE7J7S79+yxtSwcgvTg5ggn9U
 7oqjkyp5StdzQW0H+FFl5e+5d7YTDwylGGwzIQRAoI9qTDE1769MqUohCVKBBy0uLb14
 IY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682715545; x=1685307545;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5RZ/v+3s/Gutu0uNA/cR3SlZkRU+GlqHGEYUcahF0lk=;
 b=TWW3inefuaT/niKAAcP+H/Pv9lCkWLbNBbqUBh4UlHstzr1vdpM2ZTRDtSyZ4mgpI8
 159MuMhWVTY8Fr9XrX3BbT1wgO2y7Aq3gMoBMen9/lrZS16+h1lBrec/UIDolAnYMVSi
 iTV7nk8ZOmZMPkyywJ9Kj53ms60a+ya7O24zy74SxZIM19xOoXravPJ30JRBs38WA9U5
 CmgYbA1JqUw0gr6+/4B8GsXAJ13WoPekl+J3O95iqAX5+7+Nsv9lfOdCFHITyYQLMX8j
 SREa9+Wexy2DAYmT86Jkc2PNJDItsu6MY2PgsSVhflE/Gc2EAMnqY43MMeTTQKSX8FdF
 my3A==
X-Gm-Message-State: AC+VfDxVM7oIU5paekVgKuC7fLrSaUOc1NLPX5nwHlD4UschvG2hzhc5
 stl6do3/KsWJkJd02piQOwnQjw==
X-Google-Smtp-Source: ACHHUZ4U9hAuUCKd5ZeZjDxt1b+m1LYqWO5YMoc+SZHlWuIgqBW+AwVHRJZbCE8TXrQF0djpt9xhVQ==
X-Received: by 2002:a05:6000:509:b0:2fb:87f7:3812 with SMTP id
 a9-20020a056000050900b002fb87f73812mr5009545wrf.1.1682715545401; 
 Fri, 28 Apr 2023 13:59:05 -0700 (PDT)
Received: from [192.168.1.17] (78-141-23-110.xdsl.murphx.net. [78.141.23.110])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c358e00b003f188f608b9sm26199639wmq.8.2023.04.28.13.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 13:59:05 -0700 (PDT)
Message-ID: <4e12aad9-109b-9168-eb80-074e2b58a8bb@linaro.org>
Date: Fri, 28 Apr 2023 21:59:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/13] DMA reentrancy fixes and other misc patches
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>
References: <20230428094346.1292054-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230428094346.1292054-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/28/23 10:43, Thomas Huth wrote:
>   Hi Richard!
> 
> The following changes since commit cc5ee50fff9dbac0aac32cd892a7163c7babcca1:
> 
>    Merge tag 'pull-testing-docs-270423-1' ofhttps://gitlab.com/stsquad/qemu  into staging (2023-04-27 16:46:17 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git  tags/pull-request-2023-04-28
> 
> for you to fetch changes up to 50795ee051a342c681a9b45671c552fbd6274db8:
> 
>    apic: disable reentrancy detection for apic-msi (2023-04-28 11:31:54 +0200)
> 
> ----------------------------------------------------------------
> * Prevent reentrant DMA accesses by default
> * Only compile hw/rdma code when necessary
> * Fix a potential locking issue in the vhost-user-test
> * Offer more registers in GDB for s390x TCG

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


