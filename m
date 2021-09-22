Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C827B414F03
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 19:26:54 +0200 (CEST)
Received: from localhost ([::1]:54220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT61F-0000ZI-OH
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 13:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT5y2-0006Fl-JU
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:23:35 -0400
Received: from [115.28.160.31] (port=39750 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT5y1-0001Pu-0Z
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:23:34 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 928B6633F2;
 Thu, 23 Sep 2021 01:23:28 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632331408; bh=jKsJ80w75FefNPHD6jfIE12QntCbueYaRtpESoKYS7s=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=tQRNsTlphSh9bt/zcA0oGG13Ylmh5eqmD+8JW+og3MQGqG6mPwQ9vgZY0/crdZDmv
 4EM/dXgM9WlaDJro4eU8reqbv1wlZ9/urI+Jy8siWjAEgqeUzzaOyUE3OLWu5Dn8fd
 T0bH5qf4AFkReyGKGnHjlhQKr32CcWpK34OYjqZM=
Message-ID: <3f5d0a19-ba9a-8328-f8f0-229a96597c87@xen0n.name>
Date: Thu, 23 Sep 2021 01:23:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v2 12/30] tcg/loongarch64: Implement
 not/and/or/xor/nor/andc/orc/eqv ops
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-13-git@xen0n.name>
 <90820738-c1f4-398c-308d-ec89be2d985f@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <90820738-c1f4-398c-308d-ec89be2d985f@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 9/22/21 12:35, Richard Henderson wrote:
> On 9/21/21 1:18 PM, WANG Xuerui wrote:
>> +    case INDEX_op_eqv_i32:
>> +    case INDEX_op_eqv_i64:
>> +        if (c2) {
>> +            /* guaranteed to fit due to constraint */
>> +            tcg_out_opc_xori(s, a0, a1, ~a2);
>> +        } else {
>> +            tcg_out_opc_nor(s, a0, a2, TCG_REG_ZERO);
>> +            tcg_out_opc_xor(s, a0, a1, a0);
>> +        }
>> +        break;
>
> You don't actually have eqv (xnor), so don't pretend that you do. The 
> middle-end will expand this as xor + not on its own.
Sure; I'll remove support for eqv in v3.
>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~

