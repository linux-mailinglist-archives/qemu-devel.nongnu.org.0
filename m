Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4739547E91E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:36:37 +0100 (CET)
Received: from localhost ([::1]:42538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0VlM-0004MY-DU
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:36:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0Vdd-0000OL-1b
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:28:37 -0500
Received: from [2607:f8b0:4864:20::1034] (port=34775
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0Vdb-00021n-Gq
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:28:36 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 v13-20020a17090a088d00b001b0e3a74cf7so6947190pjc.1
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 13:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vEsWNYkRSARjunOOYlKyxpN9o8JNs8CIGuLa0vPrIxI=;
 b=qI4EHnBxDgsYv49+QSO7cixEX2s4I/ZfSVpXJogS1H9bMDToMgo4euWV47i/k8CsYk
 kAnKoh+BnEItd8HrH9uKjbRyBFYHbl1HaNJr/w7uC9u1zZSzFOPiDoEKwNiayCcImOdc
 iFXRWwVuwXpnb+uMHjyAwuxx9ZWh7uCLk/44J/uzW7c7KQoVxicIV4Dc/BMdtyWi39Lr
 ja1Af+qHXYnS/JDgEb3UF+FbgQZ0F3wuXSsPCUWPxPP2YNbd+18PVtaOICubh3A99Hk7
 cd5/dD0hEJtEijU+QwKbucQLNzrZt7hCczMTKk7YX+VMjwJodrgYL1moa3tJVM84MRqZ
 OaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vEsWNYkRSARjunOOYlKyxpN9o8JNs8CIGuLa0vPrIxI=;
 b=nTUwpYtuU2VHydFK6a/6ZiP6jW/Sh/+/nNEAq2l7Ov07I3xVL38lnCscVMf8yRaQlq
 wMBqHL7jkf6C10zGoboKbbGx4P3V1UrNH8RyaSN8JdEApFpJzM3149DsFsdXjcLoj2vz
 zr5LzsP04G2wK/5yonuyc2Q5Od6yNCY1Bxvjpea1lIFBeEjSLW5URua7FiEKVaGA4P7h
 qG21UmfHr+IzLe6EG5htAYT8lM1Bs29jxcydK8dZp0fheHJP1ML5i+gnf3zX4l2amud6
 LPCLFwtAmGB1nPpHBs8q1JxBoMU7BnFNW37EqEl1Cg/NDsbNSsu1phH62Rai9ZyDlm9Q
 R85Q==
X-Gm-Message-State: AOAM530zIhedPfQYxGKTau8RJ19bX8gOJNEURlUW4/MO44uEpK51gN23
 tz2bFPajs+EdkV/9MMU8WfwPD4zjc2Cthw==
X-Google-Smtp-Source: ABdhPJzJ2qk/+D9ZuTfDoER5NmxPkLs/dD2gZX4gTqa8aEaeThXnliRMVCogIc9HFtaPnMe4CYtU+g==
X-Received: by 2002:a17:902:c407:b0:149:2ef4:b6b2 with SMTP id
 k7-20020a170902c40700b001492ef4b6b2mr4079668plk.112.1640294896556; 
 Thu, 23 Dec 2021 13:28:16 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id z23sm6700811pfr.189.2021.12.23.13.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 13:28:16 -0800 (PST)
Subject: Re: [PATCH 6/6] target/sh4: Implement prctl_unalign_sigbus
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211220214135.189157-1-richard.henderson@linaro.org>
 <20211220214135.189157-7-richard.henderson@linaro.org>
 <7bdd9dc1-4116-dab8-a300-9ea8241675b3@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <911209e1-5b04-1b64-0929-c09e825aa37e@linaro.org>
Date: Thu, 23 Dec 2021 13:27:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7bdd9dc1-4116-dab8-a300-9ea8241675b3@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

On 12/23/21 1:22 PM, Laurent Vivier wrote:
>> +#define UNALIGN(C)   (ctx->tbflags & TB_FLAG_UNALIGN ? MO_UNALN : 0)
> 
> Why isn't it like the other targets: "ctx->tb_flags & TB_FLAG_UNALIGN ? MO_UNALN : 
> MO_ALIGN)"?

It should be; not using 0 was a late revision and I missed this one.


r~

