Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD8A383947
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:11:50 +0200 (CEST)
Received: from localhost ([::1]:32900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lifqP-0007Z5-Ig
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lifmZ-00034x-KD
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:07:51 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a]:42810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lifmW-0004FL-JX
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:07:51 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id 66so3366625vsk.9
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+tZEI1UBTq4YAzJytTMrv/T5a5YHm1GJvQC0FbQvAHg=;
 b=k+BzFFY0QclBLQRnc7mryhtq9OieOm1qc1ddVRN7KMdnRbMY2zbS2SvvOIJeKB0A6n
 2B1uMrnB1Lxk8q8NN+nokwl9ZiF5SCEhyoEE6vCMZ4M8lLdReWLQQBgfSvYVSAQ1Mmt5
 Bq+Qs7CJIfrwdW/3DJtCWwnMN541KiVR/TD7ECkr5vmqO7puHT4c8basm4fTuStpvj2b
 hK2+YMMe9ylGeVe/XONo++JCHUCmTsJmXAdvDuIFDNCTPiU1BfD2wPK2x11pJfq/i/DW
 R5MJ19EjtqVZOp9q1UWHxpcEbPM2asLZtXP50P7z7uSUwqXDB3og5h++NqQyAryPy8Gj
 NLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+tZEI1UBTq4YAzJytTMrv/T5a5YHm1GJvQC0FbQvAHg=;
 b=ouF2WVS4fSqdJ5laX4gDtCLSMvNrDx2WKzO5ugAhOZTnCHZhMxaEXarS+fHoA5F0AG
 YGexg4u8IFC8tkNkW/kdMugOI09gx/XLxYHHZeQZ/D5MMKVrJqAqkoMFDLneEl647klp
 SBsV9g44CPhmDaJW5I4POGFPyQtJK6r4RRKC8FbYYm6jE+crE54YjOtb+x6Kyt69+IAR
 tcQSjBTeb+dY5so3tB4hdOQUmyxtbkp+UskeP9E4T16xG1U+DtUNTJ+ZXmaA38D0H0Ix
 FOxr7GvQjbP1RzyOAqGoI7TSMRMbJnMdCS8bYpdEnOFWoTeMg9rJmf5O67wvib0Vk62X
 bsKw==
X-Gm-Message-State: AOAM530Qez9noLCatCcUR/ZA7BDpwTjdlPq5+q/wzfBoXlUU3z14WCAD
 ZGksafVmbjcpQMQ8tbVQ+9bSWA==
X-Google-Smtp-Source: ABdhPJz42PpJ/BtagreatIsv0X3awOpDeVRUSn5ccpfG4qwyX5yAiUxHPjRjOBRzhtOhPG/YsgqY5Q==
X-Received: by 2002:a05:6102:321b:: with SMTP id
 r27mr514396vsf.13.1621267667585; 
 Mon, 17 May 2021 09:07:47 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id v24sm2318013vsk.11.2021.05.17.09.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 09:07:47 -0700 (PDT)
Subject: Re: [RFC PATCH 08/11] target/ppc: wrapped some TCG only logic with
 ifdefs
To: David Gibson <david@gibson.dropbear.id.au>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-9-bruno.larsen@eldorado.org.br>
 <40d53a3b-ca4b-0656-0b64-15ded89b3315@linaro.org>
 <4aab8498-580c-cdb3-9c87-b47d5e1ff33d@eldorado.org.br>
 <b5d3e93f-8324-c21f-4ec3-feb162be455b@eldorado.org.br>
 <81666d8f-e261-d13d-3f10-af52ea0edfa9@linaro.org>
 <b32575a0-07b6-1819-1dec-525277c98cb1@eldorado.org.br>
 <YKHsmsdJx2MKKLe/@yekko>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7e9a8bcf-f59a-c992-24d2-92aee98bc28c@linaro.org>
Date: Mon, 17 May 2021 11:07:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKHsmsdJx2MKKLe/@yekko>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe2a.google.com
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/16/21 11:10 PM, David Gibson wrote:
>> Removing excp_helper.c gives linker errors for the functions:
>>
>> * ppc_cpu_do_system_reset, on hw/ppc/pnv.c and hw/ppc/spapr.c
> 
> Oof, that's a bit tricky.  We definitely do need this system reset
> injection for KVM as well as TCG.  Unfortunately it calls into
> powerpc_excp() which I think has a bunch of TCG specific stuff as
> well.
> 
> Long term, I think the thing would be to remove the giant ugly
> multiplexer in powerpc_excp() in favour of different entry points.
> But that's a big job.
> 
> Short term, littering it with ifdefs might be the least worst we can
> do.  Richard, any better ideas?

Nope, no better ideas here.


r~

