Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D751E456C61
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:34:00 +0100 (CET)
Received: from localhost ([::1]:38780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0HQ-0004qh-12
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:34:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo054-0003ao-6H
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:21:15 -0500
Received: from [2a00:1450:4864:20::32c] (port=33406
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo052-0006Li-Dk
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:21:13 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso7342507wmh.0
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 01:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ehmV/pLY/uCqoPHpBc3mPPY1GKsiUveliUn2UjIx5l8=;
 b=HTYwRs4qEatPWStxw3uscpX+EpcyueAVdrpIVZXm+pjvS20T0szFSNn/HCJbz30QYS
 VHooWw0RmKwgOAlFSMnHCruMc6hZxyl/mQFJYkZVeIVWCTeI2RGrCw7MVMey38hWSKgs
 FjVub4M7P3b1uVdg5FMUo/InHXm6Hqm6fQvH1BYZnYb5WhBNExDNad3Xia1gjjw8qIPM
 2ydJYZUbuVpFoPvobMbAaP55nbX88fjJi88bPN4BzAhiQg/O4N7tcUXfH4VxVDGCTsMD
 d9fLORKhHsbM4koGUbDufaQ2h5F+B+zadsFVbAemodESYbIpZI/UqCGY2NwN5rRYsMBF
 Usog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ehmV/pLY/uCqoPHpBc3mPPY1GKsiUveliUn2UjIx5l8=;
 b=ugiGjNgbHC5VFEDiloYBs62sL7osQ6StaXCVRubxmbngIR9JVh4sZnGZa43289rBHv
 m+a/8BrqI7tJ8ZaHR66m1Jqx/UfGxgMyxNhiphgSZmQ8WDAf/++bnI5DhqXI0J9zqeEU
 u2R8tLRaWpQeE+bSqmyK4oepnxLsB+NqG84/jpJeDdjOSdMxMmBnc5QSBiBTeO6yxkNi
 PxDRxx1++7mPCW+zu1d68t5x6aFKYELsRuIx/NL2wIpQ/O0lVcoCzLJrztXaMbrNfckY
 23Vm/AErdhkJQ6iW9Ii22+QJfzrUlsVUVT4l7TuwmJONt0jwQtlp4JzM3Iwifj6WoJQK
 RW5Q==
X-Gm-Message-State: AOAM533ARnzIxcdhGKOArttL2pC8I2ze7dozvCBfQXlYVLDC5yCkWdQi
 AioUUFOtWttv9n4aHW582rGr6g==
X-Google-Smtp-Source: ABdhPJyQGb+xdqyZZkOlHdHid95fi2T4SThsKPW9aYUpHBRJIO5ETbv4lnVcjTU2BDIpvTCbRyx53g==
X-Received: by 2002:a05:600c:3494:: with SMTP id
 a20mr4924574wmq.195.1637313670960; 
 Fri, 19 Nov 2021 01:21:10 -0800 (PST)
Received: from [192.168.8.105] (165.red-37-158-79.dynamicip.rima-tde.net.
 [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id b6sm12472303wmq.45.2021.11.19.01.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 01:21:10 -0800 (PST)
Subject: Re: [PATCH v2 2/3] target/ppc: ppc_store_fpscr doesn't update bit 52
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211118132502.984059-1-lucas.araujo@eldorado.org.br>
 <20211118132502.984059-3-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3e8865b6-df3e-9b0c-aea9-810d96052255@linaro.org>
Date: Fri, 19 Nov 2021 10:21:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211118132502.984059-3-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.727,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, mark.cave-ayland@ilande.co.uk, pc@us.ibm.com,
 david@gibson.dropbear.id.au, matheus.ferst@eldorado.org.br, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/21 2:25 PM, Lucas Mateus Castro (alqotel) wrote:
> +/* FPSCR bits that can be set by mtfsf, mtfsfi and mtfsb1 */
> +#define FPSCR_MTFS_MASK (~((1ull << 11) | FP_VX | FP_FEX))

If you're going to make the reserved bit 52 read-as-zero-writes-ignored, you should do the 
same for reserved bits 0-31.  Otherwise drop this and let the bits be read-write with no 
effect.


r~

