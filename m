Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A612467E91
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 21:01:07 +0100 (CET)
Received: from localhost ([::1]:45060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtEjy-0001HF-3A
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 15:01:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mtEhr-0008T8-JO
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 14:58:55 -0500
Received: from [2607:f8b0:4864:20::633] (port=44973
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mtEho-0005E8-R2
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 14:58:54 -0500
Received: by mail-pl1-x633.google.com with SMTP id q17so2816436plr.11
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 11:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VQGWPY3qT/vSkbvTHOIx9k76RleBqNi3dNkmrXN7bkc=;
 b=IrJkCod2BArhKNgOfDrxXcKXaA4sEI13Vmse93G6cyla+1pPTEQ1wjndh8NqOzvJQi
 DyYhfmIswEax983unKQntHY1QIeuRlMA/3BbE7CaHIg94RLnpp+H0rVLRnB3GUqdwz0c
 JglbxxnKkr42ZkO4AqJYbmdWf+j49fj1SKYnlVSmEUVf792g/gS927CIrY7mUKJbQhak
 YZchsIppnsxp+kt/bmwmanABt1OHbowxGeRrORM8mVJxgTm1l+sK5I80fvKwCtPYI05B
 IJqc5Jsp/XQtEuzrO2gcXwY+pVCrG7onFjYHiWwu0KpM7bjvTU2DWbiapyIHuYqmJi0d
 yaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VQGWPY3qT/vSkbvTHOIx9k76RleBqNi3dNkmrXN7bkc=;
 b=4gjsQTK/DZL3L2W7vVUuB0LmfIpu79ZiztpHch9ft7+GjsXfJBXu54U1mVEW+S8U2N
 Gsacm56p4Cm8p1BrNsOXDITH2sPAiMS4/M/WZNAXSHVz5Q+jxiKQw32wQwvcb594NaXQ
 9kWjvjMKgZ8lvRLq90lfCDB+iwKJ1ZS8URkV6g7YJIanUdgg3O6derHnEMRdq2KkyAI1
 y587LWQIOcsBj0sU1ccKivhZc7Wdag8LQPiNwwg3PAJ7rI1bX+XEPRUug1/etSXqo2pY
 FWlbzaYcjHVBUq0VgtkQXAtbmkTqVSly4uur48fWEmChlisPszHl4of//lp5Y4CeAxCx
 FS/w==
X-Gm-Message-State: AOAM533GTM60A3UjKEVnXKsxyUk2HX5qe7r1e+PfuMX98raWtokn/ZgY
 GEPJXMwajaDl123Om0mu1Avk3A==
X-Google-Smtp-Source: ABdhPJyGpL36SSvcqMPSvmC0LbApQe+4u2WKawuNW1D5ttNprL/AhanByC1NI75g3+qx2YLWrx8ZHw==
X-Received: by 2002:a17:90b:4c44:: with SMTP id
 np4mr16709343pjb.195.1638561531220; 
 Fri, 03 Dec 2021 11:58:51 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm4223618pff.6.2021.12.03.11.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 11:58:50 -0800 (PST)
Subject: Re: [PATCH v3 2/3] target/ppc: Implement Vector Extract Mask
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211203194229.746275-1-matheus.ferst@eldorado.org.br>
 <20211203194229.746275-3-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fede01a2-8d88-b8e5-39d7-fce5e2de46f6@linaro.org>
Date: Fri, 3 Dec 2021 11:58:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211203194229.746275-3-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.938,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/21 11:42 AM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> vextractbm: Vector Extract Byte Mask
> vextracthm: Vector Extract Halfword Mask
> vextractwm: Vector Extract Word Mask
> vextractdm: Vector Extract Doubleword Mask
> vextractqm: Vector Extract Quadword Mask
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  6 +++
>   target/ppc/translate/vmx-impl.c.inc | 82 +++++++++++++++++++++++++++++
>   2 files changed, 88 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

