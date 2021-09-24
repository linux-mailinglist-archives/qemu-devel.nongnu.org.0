Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1EC41776A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 17:22:00 +0200 (CEST)
Received: from localhost ([::1]:46268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTn1T-0003VE-FJ
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 11:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mTmzV-0001yL-IP
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 11:19:57 -0400
Received: from [115.28.160.31] (port=39914 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mTmzS-0003hQ-Cv
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 11:19:57 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id BD88E60B0C;
 Fri, 24 Sep 2021 23:19:44 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632496784; bh=udsG0PujSf0SnolUdCgzUjGUkHK7mv/MKE1BdBvnVFk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ep8xIOfTPBZAQUYSVgTeHCRiBChWxaogGuFp0OfF6QTcBAdz4LbOMGn0z01HP9WnS
 effrfhq1+fqGRs2X25lxHYezJUMI1Y7CEA9Kc7G0hAwA+ZHSqSc9Y7D/HoZSVGkU2+
 t5X6tXaridtLdRWDqLXG4I7gELoJ21AsjIJ9CdHU=
Message-ID: <56a365fa-dbca-5595-390b-a0bf0bf35561@xen0n.name>
Date: Fri, 24 Sep 2021 23:19:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v4 23/30] tcg/loongarch64: Add softmmu load/store helpers, 
 implement qemu_ld/qemu_st ops
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210923165939.729081-1-git@xen0n.name>
 <20210923165939.729081-24-git@xen0n.name>
 <8cb68dfe-42d3-46ae-da7a-b89eff31ade2@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <8cb68dfe-42d3-46ae-da7a-b89eff31ade2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 9/24/21 22:56, Richard Henderson wrote:
> On 9/23/21 12:59 PM, WANG Xuerui wrote:
>> +    if (USE_GUEST_BASE) {
>> +        tcg_out_opc_add_d(s, base, TCG_GUEST_BASE_REG, addr_regl);
>> +    } else {
>> +        base = addr_regl;
>> +    }
>> +    tcg_out_qemu_ld_direct(s, data_regl, base, opc, type);
>> +#endif
>> +}
>
> My last messages against v3 came too late:
> Missing zero-extend of addr_regl for TARGET_LONG_BITS == 32.
>
Actually that message arrived similarly late; no worries, I'll of course 
fix everything in v5.
>
> r~

