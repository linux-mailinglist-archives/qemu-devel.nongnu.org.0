Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08A6432689
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 20:36:49 +0200 (CEST)
Received: from localhost ([::1]:55616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcXVA-0000yT-Pf
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 14:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcXSX-00008r-5x
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:34:05 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:39567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcXSU-0003OO-HW
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:34:04 -0400
Received: by mail-pg1-x533.google.com with SMTP id g184so17050189pgc.6
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 11:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6PxlhRf5Tt3Yu6cBKS7YZtGi+8+PQxu4mFEmDP7zyYk=;
 b=fb8z+qgPzo0PjCCcmTV58MJLUPLO/0fUX8Rkb+SPNiURAS3ypuZZZFiDn+/pHVzAnI
 cOWpoBB5lXnYIttN+fCL5b9URsqs8A8XPwOAXX45ty70k3exiFVqNSJyg+LGN9GYfUxD
 tgL4dN/yw9dyWnkK967B9cGIqLT7xjvEFXVAW3NMAbeVCuFhvUfE94IxQ2ZYvEvLo5sM
 xskzhWPsOvtEFFC9t/ljAs6TO/tRS4CX1oUAyKHmBx2EgAh39MTwMb8aUisRuoBlJhmG
 d/3cISAcFoM8JT5PkcAtsQeBainb2W+p/Zu0gHncz9/IDd7cZosvoR9/HfAxrv+lqPBy
 L/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6PxlhRf5Tt3Yu6cBKS7YZtGi+8+PQxu4mFEmDP7zyYk=;
 b=ToFET+qHlUpjwfhqMSOrs20ZUvVy1ccuPhtgmZ3Xb970PFq9IT5WEDB/rRIdT4xAr4
 35kY3f0N9dgF99lUpU3+cmnxT8zFh8Vc10UnK+4MXhjgxmj5lfpvduzT6km8HwFtPVAY
 OxgKuSAoaKyLqlkDQysD6tYVF4DMSPZimNNzN14eZRLmVAakec0vzaRyG7vU9e6b8fas
 lNevEcBjXOhfUYimp5cOBb6MhERrcK12TiW+fAJc4+Pwr5is9fqMPd3WaeqQ7a9r083/
 IA4oKPbnfg+CNs5ZrnuQPZzme9Rg1+xNWP9KfDjN+uCCyuWPYqEHOtrk7NyOD3svBc81
 jlug==
X-Gm-Message-State: AOAM533lllALYeIK2Mf2W4dARZlYG92QXe96HPqqL6PQBLQ2z6rNZdQw
 U2+oAqobM82BU7I2D2mAKX6XUQ==
X-Google-Smtp-Source: ABdhPJwWfhnF4AU2pQ2EgFXYJoF2+Znk1JHlIxlsz7qheauK7k0focXX32UAf3In0V6cDdajkywkeA==
X-Received: by 2002:a05:6a00:1142:b0:44d:d43a:ac5d with SMTP id
 b2-20020a056a00114200b0044dd43aac5dmr7542031pfm.30.1634582040085; 
 Mon, 18 Oct 2021 11:34:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u24sm13536034pfm.85.2021.10.18.11.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 11:33:59 -0700 (PDT)
Subject: Re: [PATCH v7 16/21] target/loongarch: Add disassembler
To: WANG Xuerui <i.qemu@xen0n.name>, Song Gao <gaosong@loongson.cn>,
 qemu-devel@nongnu.org
References: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
 <1634561247-25499-17-git-send-email-gaosong@loongson.cn>
 <f55bffde-64ec-d390-2942-4ec4b2bbedbc@xen0n.name>
 <9ba04d0a-44bb-1ebd-31f4-35c282842b4a@linaro.org>
 <75f4be9c-47b7-415f-4468-093b74130481@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8e1da0c0-5f24-abca-78de-2304c1453904@linaro.org>
Date: Mon, 18 Oct 2021 11:33:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <75f4be9c-47b7-415f-4468-093b74130481@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, yangxiaojuan@loongson.cn, peterx@redhat.com,
 laurent@vivier.eu, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 11:18 AM, WANG Xuerui wrote:
> 
> On 10/19/21 01:29, Richard Henderson wrote:
>> On 10/18/21 8:38 AM, WANG Xuerui wrote:
>>>
>>> For now any implementation would suffice, and I already saw one or two bugs in the 
>>> output during my TCG host work, but it surely would be nice to switch to generated 
>>> decoder in the future. The loongarch-opcodes tables could be extended to support 
>>> peculiarities as exhibited in the v1.00 ISA manual and binutils implementation, via 
>>> additional attributes, and I'm open to such contributions.
>>
>> Perhaps it would be easiest to re-use the decodetree description?
>> See e.g. target/openrisc/disas.c.
>>
> Indeed; I didn't thought of disassemblers in target/ instead of disas/. That would be the 
> most elegant way forward!


The one quirk will be that so far using decodetree for disas is limited to the target, 
whereas you'll want this for host as well.  It shouldn't be a big deal, just a small 
matter of the correct build rules.


r~


