Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E094401A4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 20:01:50 +0200 (CEST)
Received: from localhost ([::1]:41864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgWCL-0005Bn-GJ
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 14:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgVqE-0007h3-Ic
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:38:58 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgVqC-0002Fd-KQ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:38:57 -0400
Received: by mail-pf1-x429.google.com with SMTP id p40so5053255pfh.8
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 10:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P0OGxbvxe4ZkTEG920KyhDCkpIXz0mqacbCKySWG1xg=;
 b=JNzgX0cFeU9P1xoR5IbY4KlPipCueKaHKJef45Gmk0rb2xIY30Djmv2JRUXgAnsN6s
 u2U4ADVSsNxWySJRD3kYqQMRb2QErIUf2ZWeq8cuqQ3yxQLyqimrSZ1veTKkTXUMAmTi
 pyIHfgoAuz0VYGRnKdPK1WN4RncmbA47CwJ0CB+eb5+QJI8ZlmYH+X4tqDd3zyub16Ed
 alR5Ly0vCwaqTHbZjoLOWWfFaVjmHkR3rCR6shKxUE5QTbjHj8sdYBjrqRjR7CiRELfK
 U9rKvi789DRnnuNlvcu1Kzgg30P8FwD/8vlMsLJbDHrSis15XAAwonRiIHBGtqOT4IwO
 uVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P0OGxbvxe4ZkTEG920KyhDCkpIXz0mqacbCKySWG1xg=;
 b=i2BnoJnnilKrj4k/roBdMVQ3mKepjxn/5bIS+FgG7pu7YFB+voLwDulqcpoqe1B5/F
 /+1UnCW+yEsWoUqMkYA2T9mo4YeKxh6hI71laSXbb0oiQDVXKEQ9zKbwObZcXzGih7O3
 VhLAFzNuSk3wiG86NZB/0ievKMGf1M63BwMo+TF0q1/Y9tSyz6beuwYs8y56kBCVCrQW
 alSH/mzbGU609k2LF1DlEGSuG5fZcieIS85+fdIFcONHYuNwWljhrHQZgqsH576B4p2k
 XvQSH+gTxIEtE0HwEw5kI18Ltu3Ju599Ml2oaHX1xz5tT7KgUAvi6/JvhhjsZXrguBxR
 dzUg==
X-Gm-Message-State: AOAM533EKYD3gxR6Pf6zw46G3PIbk+Ku3qEWsCp/vw4BFLte1s0AmlfN
 cJHk+ZBmHjWjkcxHPZRP0M6hlw==
X-Google-Smtp-Source: ABdhPJzSh33ybADfSIlfDCCkgq0+iDYu5PQ5Lq4cj2MwLANHF6NO+UH5fDewg0iCegtKsBbevO2HUA==
X-Received: by 2002:a65:6ab5:: with SMTP id x21mr9175403pgu.256.1635529133874; 
 Fri, 29 Oct 2021 10:38:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id m12sm4819733pjr.14.2021.10.29.10.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 10:38:53 -0700 (PDT)
Subject: Re: [PATCH 07/31] target/loongarch: Add loongarch csr/iocsr
 instruction support
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
 <1634628917-10031-8-git-send-email-yangxiaojuan@loongson.cn>
 <cb33aeb0-3a82-1300-cbbc-3e260cee8a5f@linaro.org>
 <75e6250e-6cb5-6557-b9dd-ea3fdb0436e2@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4cc6e69b-56ca-4439-d88c-46ae1b5c2a6c@linaro.org>
Date: Fri, 29 Oct 2021 10:38:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <75e6250e-6cb5-6557-b9dd-ea3fdb0436e2@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, mark.cave-ayland@ilande.co.uk, laurent@vivier.eu,
 peterx@redhat.com, f4bug@amsat.org, alistair.francis@wdc.com,
 maobibo@loongson.cn, gaosong@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 11:26 PM, yangxiaojuan wrote:
> (1) For the iocsr registers, most of them act on the interrupt controller, the read and write will go to interrupt's mmio read/write.
> So I modified the addr to their mmio range. The ext interrupt controller use the sysbus's function to handle the interrupt cascade and
> sysbus_mmio_map to map the address which use the system memory region. So if I use a different address space, I realize a different
> sysbus_mmio_map function use a different address space, is it feasible ?

You shouldn't need a different function at all.  All of the difference will be in how you 
construct the mmio region: create a new address space, and add the mmio region to that 
address space at the correct base address.

> (2)Can you help me review the remaining patches? Thanks.

The remaining patches are harder for me to review, because I'm not as familiar with the 
fine details in hw/, but I'll try.


r~

