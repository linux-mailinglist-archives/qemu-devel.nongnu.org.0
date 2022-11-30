Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D56C63E55B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 00:21:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0WMU-00072y-9S; Wed, 30 Nov 2022 18:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0WMH-00072R-Nn
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 18:19:18 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0WMF-0004z6-Fd
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 18:19:16 -0500
Received: by mail-pl1-x632.google.com with SMTP id p24so14479908plw.1
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 15:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xB1tq0KXaSSHM++8jaalmq45cX6yvG7VOtjtR7ORi/Q=;
 b=rnTqUpDE5vvSHcgW4ueFgCBmYSfaoZ5u+8NPsz9g/40xNDzgSHcM94TPlZGzqkR9a7
 W2ZOa5qG5rxHUVuT/uJfIwpPHypa5KxMIxxONb++FGe8MEfr2vBOJfPYqVP+BxlR/fXl
 e6D2K8+33JC8cbUBNO741ogjF9MffHgeqog8vznlrVNG20Ji6fYFuYkUh4tjb7wD4T3v
 rqKBNCYp4umJ1ZhHNWM3miBw0P5jUiPlrk0BdStROzEAKT0Hu9Wx4M+oHKMRZPMMJq5Q
 l9gVAlP/TQyy2+jbC+TI3LT9HcWlRG0kk5wdilw2ylnrCCrM/TppT8CSI9DBXoe8170N
 K63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xB1tq0KXaSSHM++8jaalmq45cX6yvG7VOtjtR7ORi/Q=;
 b=OSsjkd+ZUkY1Jy7deZ+ENEJp47IfSERycsQTv/XxPcF6F6Eh7v0kfVmvHP0edcohxF
 R5e6wzCLcMwUibXPUMxz+5jRUqRaT1VyEl3idcvyUCYw6KVFYxUzdI91Q8IPjrdg0tTI
 Or7dyJkzRpPePOiRANy7WSdMjI9MQ3htOnsbxN4bnnmOo5Ccrj1zfTKpa+jUlMdVyU5Z
 RPz9cYZg3TVCNLE7w+L+DTFRO4zjWlvCK4UoPY3vIoUmk2WiW8P7Ki1CjDQL3xeE53jZ
 OWmhIsfkaeUYA9NpTnDx1FgJbxORXYFbdWuxWgFtsqlUrgYivJlOhMxrNlCdcX//wBYM
 OECQ==
X-Gm-Message-State: ANoB5pmJyo1QquOvT4jawhVJSvj9md7QErO5bCuKHLCuk3J0+N9TWts+
 n83Eq830fAjwujA8CgbdbQThdQ==
X-Google-Smtp-Source: AA0mqf4rtk2uM/DwpVZMybKN+x41ZB8B4AnPpiVorPLX9XmxoaSvV0XiTpUDAXnenq2VwbthuAxloA==
X-Received: by 2002:a17:902:e983:b0:189:651c:efb4 with SMTP id
 f3-20020a170902e98300b00189651cefb4mr29881559plb.89.1669850353725; 
 Wed, 30 Nov 2022 15:19:13 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:7dfe:6c55:976b:754?
 ([2602:47:d48a:1201:7dfe:6c55:976b:754])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902714a00b0018963b8e131sm2012030plm.290.2022.11.30.15.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 15:19:13 -0800 (PST)
Message-ID: <8c714f63-39e3-51c4-64d3-ff926953a78b@linaro.org>
Date: Wed, 30 Nov 2022 15:19:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Question about CPUTLBEntry
Content-Language: en-US
To: Nada Lachtar <nlachtar@umich.edu>, qemu-devel@nongnu.org
References: <73A7E42B-E0AD-4321-8D46-754B363178C7@umich.edu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <73A7E42B-E0AD-4321-8D46-754B363178C7@umich.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/30/22 14:50, Nada Lachtar wrote:
> Hello,
> 
> 
> I’m trying to understand the structure of TLB in QEMU/tcg, in order to extract the physical address from the CPUTLBEntry. Would this be possible without having the virtual address and use tlb_lookup? For example, I would like to read all the physical addresses that are recorded in the TLB table without the need for a virtual address to translate the entry.
> 
> I would appreciate your help in directing me to what functions/structures to use to achieve this.

The virtual address of the CPUTLBEntry is recorded as the page-address bits in each of the 
three comparators: addr_read, addr_write, addr_code.  This is documented in the comment 
right there with CPUTLBEntry (TARGET_LONG_BITS to TARGET_PAGE_BITS).

Bits below TARGET_PAGE_BITS are TLB flags, e.g. TLB_MMIO.

If TLB_INVALID_MASK is set in addr_{read,write,code}, the entry is not 
readable/writable/executable.  If TLB_INVALID_MASK is set in all three, the entry is unused.

If CPUTLBEntry is valid, there is also a CPUTLBEntryFull structure in parallel, which 
contains (among other things), CPUTLBEntryFull.phys_addr, containing the cpu-side physical 
address for the address space given by CPUTLBEntryFull.attrs.


r~

