Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F185EB42A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 00:09:16 +0200 (CEST)
Received: from localhost ([::1]:43906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocwHr-0005aL-4w
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 18:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocwFq-0002TP-74
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 18:07:10 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocwFo-0001Dv-Ce
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 18:07:09 -0400
Received: by mail-ej1-x630.google.com with SMTP id lc7so17116409ejb.0
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 15:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=A2s8n5PYK3ZaMy6+MNcDLHsBXyfzYG3pJKOuijb9LrI=;
 b=Te7p+3vXxrj1oavgx6Qi0QSolUPVebkMMjX/sx6ijkFN2QUVEgdbNz09CPYhSlQqFG
 DtuDbGNsOkotXvdZSi4bFk+ctXOfrKiWZvbVma+fzSyW9+a0pLser4KOT38nVCgesL1o
 eY6UO3ttb6wapWd4WbSoeoE+OV3qN5nwLiv8a+Sa/Oqu83Pkp65a2vrx+E/6xaR2BVoH
 hicrllfmcK04EOVeiKiQR9h+x4x3DTfxK/9vn2478CmXuVRqkW9hgf6S09KBQcvaOSJG
 VOz1vBIJVKDxvI32AZC24p1TXUeaXfdxKJQNNNNvlHEfwgBTu2tc9htc50Jl2cZEZXYi
 iVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=A2s8n5PYK3ZaMy6+MNcDLHsBXyfzYG3pJKOuijb9LrI=;
 b=ibxZr0jfDI4blBMONKc5fFoPygJq+jLyB9I6y1hF83KzhEXxKFQB8Hr3/YlyBS1gLm
 GGVOmmE8dJBrDqGcHedIOb1TM1sZmd3GPPuiE5a8omkDTQu4KvHSPwpSu6n7jpndNmyO
 SihIuHviwznjjkcq+mg/SnELuEJdPI5bwxx/u2JJuXvYxCrp2QiDEhydyJTR8knDNLMj
 5GyGCOxm+ocMnGjs7jQVYWUE6tcDLJvN54+NOn+8/zWbOhPLeL9MumO4BNVQMOwCpGnH
 JPoTcVDGBe+1VBhc0MJ8GmusrhZ4YM0cfr60wcJ9Lj8oPePkwIb0ULLgtXtJ73rZ7POF
 mcOw==
X-Gm-Message-State: ACrzQf30uGLZBnTFVxKOFZr22rAqMhukpqtdSz23vRg491PI22mlPIAm
 h84Inz/bFRRm6ordhxpr9Mt8xQ==
X-Google-Smtp-Source: AMsMyM58jr1etzMyNQUmnzQOYdUw0OknZzi2KCSPlPDP+MUwOkuDM6AZAQk/q8e2cRlv2rlB1bl4tQ==
X-Received: by 2002:a17:907:8a15:b0:782:e6da:f13d with SMTP id
 sc21-20020a1709078a1500b00782e6daf13dmr12432003ejc.152.1664230025973; 
 Mon, 26 Sep 2022 15:07:05 -0700 (PDT)
Received: from [192.168.190.227] ([31.209.146.210])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a05640203c400b00456df1907a1sm6744798edw.0.2022.09.26.15.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 15:07:05 -0700 (PDT)
Message-ID: <2322dc37-ddb5-b712-92ff-3fbc6f5c914d@linaro.org>
Date: Sun, 25 Sep 2022 10:18:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 9/9] gdbstub: move guest debug support check to ops
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
 <20220922145832.1934429-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220922145832.1934429-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/22/22 14:58, Alex Bennée wrote:
> This removes the final hard coding of kvm_enabled() in gdbstub and
> moves the check to an AccelOps.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Mads Ynddal<mads@ynddal.dk>
> ---
>   accel/kvm/kvm-cpus.h       | 1 +
>   gdbstub/internals.h        | 1 +
>   include/sysemu/accel-ops.h | 1 +
>   include/sysemu/kvm.h       | 7 -------
>   accel/kvm/kvm-accel-ops.c  | 1 +
>   accel/kvm/kvm-all.c        | 6 ++++++
>   accel/tcg/tcg-accel-ops.c  | 6 ++++++
>   gdbstub/gdbstub.c          | 5 ++---
>   gdbstub/softmmu.c          | 9 +++++++++
>   gdbstub/user.c             | 6 ++++++
>   10 files changed, 33 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

