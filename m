Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21A4432512
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 19:31:29 +0200 (CEST)
Received: from localhost ([::1]:43030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcWTw-0003Fg-R0
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 13:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcWRk-0002b0-MT
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 13:29:12 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcWRi-0007Ic-Dn
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 13:29:12 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 75so16927475pga.3
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 10:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mV7CwN//PRE/3dzokbqYg9hTfkxjYHysQdOpfFIC9Mk=;
 b=diX2p9xXTd2wLE06OqWmIIrEJyTgm2bc0Wi4K8bN5KRQ9ZiFbJVAgwqvSa0Ju9zmZx
 MDiNjl7TL+IIy+P/cmREs28zNvh917FLMprF131KlI1Hc91uXAScjNmGlz7j3r7493aC
 CY38gwhPhxsNer2jdLaadkAGcpuQ2bjZ5H5HrFhP9YzNnwHOglw3nyhGsxhXW8zWWYDD
 v04tBVNEeRDC1v7wCc9M3aFAn44zJVlOCrRz+OJ/wB6rqT7gMXO2czgBbz+mqUPTul60
 5I12dZ6HW8rDYZHYeRvfA/WUy2sdWfCmFhy2DgHmXBNKccTqv+rIhXdkVCxLHvAzZPYU
 EsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mV7CwN//PRE/3dzokbqYg9hTfkxjYHysQdOpfFIC9Mk=;
 b=tfxOX9hBm/8XrzGD06+HgSkfzpVaW35axJ64nPgUenoEBUZscNYyvmTSNi1JQcvjqx
 8DLoaxpsB0JvPrzXL2gUATR66HnVb5+FXXhSzLxfqJ5QSKlGF1fuz5APsoKljRxE/4fm
 CVoeny5yUD2d5u3nTaKHQREDrrz3XdGNhdQO1xouahDEPDAj0GenA/a94tNJx8fea8Pm
 hUpG52JfFZzZttkQ4cCj9pyQsvouOH82UipVjq36Ypsr35MSNeeZokgrp0Jg5GTECn/7
 5E7bTEtSVNPY6NYLo1HHkUD1iV+4O9dYovrhdDrjbyS/zl/hjRg2sPd5IJJbbMmgC6LP
 AoLg==
X-Gm-Message-State: AOAM530rAqftuYF/nJ0oDywU5cO2Qy7nE6pAL7b+RgvWBGq58fe5g/Fz
 FrA8rrJJwBQ4axhmVPj7hlls1g==
X-Google-Smtp-Source: ABdhPJz51vcaNzz8xJSJvkk8M1UiWU14vvHd+Qhj5trnYB8DA6SBSh5eC5YlNvl1Cg+oT7dYoWhzXw==
X-Received: by 2002:a63:7:: with SMTP id 7mr25025629pga.127.1634578148753;
 Mon, 18 Oct 2021 10:29:08 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k3sm37949pjg.43.2021.10.18.10.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 10:29:08 -0700 (PDT)
Subject: Re: [PATCH v7 16/21] target/loongarch: Add disassembler
To: WANG Xuerui <i.qemu@xen0n.name>, Song Gao <gaosong@loongson.cn>,
 qemu-devel@nongnu.org
References: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
 <1634561247-25499-17-git-send-email-gaosong@loongson.cn>
 <f55bffde-64ec-d390-2942-4ec4b2bbedbc@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9ba04d0a-44bb-1ebd-31f4-35c282842b4a@linaro.org>
Date: Mon, 18 Oct 2021 10:29:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f55bffde-64ec-d390-2942-4ec4b2bbedbc@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn, laurent@vivier.eu, peterx@redhat.com,
 f4bug@amsat.org, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, philmd@redhat.com,
 chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 8:38 AM, WANG Xuerui wrote:
> 
> For now any implementation would suffice, and I already saw one or two bugs in the output 
> during my TCG host work, but it surely would be nice to switch to generated decoder in the 
> future. The loongarch-opcodes tables could be extended to support peculiarities as 
> exhibited in the v1.00 ISA manual and binutils implementation, via additional attributes, 
> and I'm open to such contributions.

Perhaps it would be easiest to re-use the decodetree description?
See e.g. target/openrisc/disas.c.


r~

