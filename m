Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC2C58482B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 00:21:30 +0200 (CEST)
Received: from localhost ([::1]:51194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHBsn-0000NS-9H
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 18:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oHBqh-0006wV-7t
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 18:19:19 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oHBqf-0000xE-MH
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 18:19:18 -0400
Received: by mail-wm1-x335.google.com with SMTP id id17so1712157wmb.1
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 15:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cu/wk1tJrX6hhS0STWJo91yqRMhvA82H6r0n+GMeWBM=;
 b=mjj4hNLfmPbL+WU7epl+Xh3LDCq35NBL/3vyys69cQF3i/c2vW+eUqzXZmTsgqwp/Z
 xoagqLgcpOEG/OTwK/Pa9QtqYGg6aeiHibAtk7thg0E1qZmkvZZI3fBkvpCeTmgCB+i2
 xtK2Kiq6GaPkUSyqr58M5+DP0KAnpH7gcooTn3hYF9a2e/23iAPS9zqRH8h3+bi9VlWv
 DxGESoaHld7INsYMCCLQ5GAUIFNC42+ALz0lYbbT/6Q2UwgED8FkmdjU+Irz2JgMhrSy
 +rO35KFLy3dnwKX6VoFX2b8e6fwvr0JkjFfxbZ7VlY0fS7hZA+Oz2OddAcBLVDG08zwd
 xPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cu/wk1tJrX6hhS0STWJo91yqRMhvA82H6r0n+GMeWBM=;
 b=fZeW/oHQhtmIPh37x5jTH6wU4grRL4+1bdpbn2/bliyAsoM0N8eEBHIOQREZuj1cOP
 jmsN4npvYEf/y18VJ1R0+jPBmrq75BkvOG78K7adGiRWmHNIRGZk4TS4uEn5sIS6TF2X
 3C4X0zjqDI2PGuCBAUWlBye/YT7DgsngsLwGPje8NHCTRKczL581oVUEexxGMxtWKMSS
 cNKjcU+MXKhD3646M9LE6xQTPf+r+g4roIX8DdStTKsRg3PW9c1jSY82SeQ2lE6AB/qy
 ZQtig8P6YafJJDWa1Lk6sfuCXM7gZqmu6qfsmvRo7F9J8zf9pDgFfJ5evXmor93bgG+Z
 0Thg==
X-Gm-Message-State: AJIora/x6nczsRDd+sMS7igSLc+Gr2p+dR+H7kcgCCe/qQ0v0gecKZK4
 2HALMQ5rsGrVy/xPSlOO65I=
X-Google-Smtp-Source: AGRyM1sW3wgd63T9i9ojoQQ6O7pqJM5MD5btyECWPXkUa+eirO5HzeDAToNezu/P9ZmeZJi0B6PMDg==
X-Received: by 2002:a05:600c:1c96:b0:3a3:10b6:e84f with SMTP id
 k22-20020a05600c1c9600b003a310b6e84fmr829749wms.175.1659046755433; 
 Thu, 28 Jul 2022 15:19:15 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 p5-20020a5d48c5000000b0020e6ce4dabdsm156014wrs.103.2022.07.28.15.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 15:19:14 -0700 (PDT)
Message-ID: <d1417e91-1fb6-5f25-8c4a-2340b3da9f9b@redhat.com>
Date: Fri, 29 Jul 2022 00:19:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Hexagon (tests/tcg/hexagon) add compiler options to
 EXTRA_CFLAGS
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, f4bug@amsat.org, ale@rev.ng, anjo@rev.ng,
 bcain@quicinc.com, mlambert@quicinc.com
References: <20220726191757.30104-1-tsimpson@quicinc.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220726191757.30104-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 7/26/22 21:17, Taylor Simpson wrote:
> The cross_cc_cflags_hexagon in configure are not getting passed to
> the Hexagon cross compiler.  Set EXTRA_CFLAGS in
> tests/tcg/hexagon/Makefile.target.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---

The bug applies to all targets, I am going to post a patch to fix it.

Paolo

