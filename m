Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17622330425
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 20:11:10 +0100 (CET)
Received: from localhost ([::1]:60200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIyo0-0006Od-MR
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 14:11:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lIylX-0005AY-ND
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 14:08:35 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:51625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lIylV-0002Ll-QJ
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 14:08:35 -0500
Received: from [192.168.100.1] ([82.252.159.174]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MJEAX-1l3w5F2N8F-00Kcgn; Sun, 07 Mar 2021 20:08:30 +0100
Subject: Re: [PATCH v2] target/m68k: implement rtr instruction
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210307182210.473111-1-laurent@vivier.eu>
 <f83aa053-76d8-5076-9f93-63eb4e489f18@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8fb7faeb-f805-4ce8-d202-8613f3ea2aed@vivier.eu>
Date: Sun, 7 Mar 2021 20:08:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <f83aa053-76d8-5076-9f93-63eb4e489f18@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VaE4J9ZIvw15D665ZGcNLJxc93X6Mlja2dBrtmCa6aLTt1F5/i8
 cqTemj83mtbk907ZyhBF16WsUjgeLvTn8uEc/PNPSCh2YeyZBD2WTtm8wj6buhQFBhTggVm
 8vLWTmqwHUstnq6GSyPOG4rJ2SWli+BqWSI9Gn4FwzS6EP1g/kIIfVVTz/y1iNKBwfDS9jn
 64bTVHktbBR2n8YxttBEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qlrpj/qIpgc=:dmHQUc1iAJklu8nujnOPkb
 2OLRmUAJuQAPJuM1tgsPIzrl0vUpZpD+Qft3iDSOjQVKXC8m7f+T0vdTHhCuxAhOEjA5l/oDp
 CShuIRetcUZETaMwzkGQnlusD/MWVth4Ck/NvlgvJSRN0+e97Qaazqd7ifw+eVc9mv5rQdQVR
 jf6E4q/P0ksQPr5ltvW8a6xSmLV6mXM7WETH1EB9H6tiXG26PMoElmQu4EmM/gBa9hfi0CtaB
 RmLw3NZ0LsA7iryiOThiHi+Lr6Bh1F/s89PuHj+SUdA/xaWibToEniq5VocCtgok5xaHOGwch
 3467kb9FxDefRvnqL1tOmUqpexJ5CTPFvvjTQt6PQ/KST9G/7K4m8MXGk8hJBtgE/CNvyNMz3
 Y4RAkPy8Lgl9NWTXV3Qemv4jDP1QTezbGEd2yxH6ueXDmrsyAm+3D9IIz+h16
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/03/2021 à 19:45, Richard Henderson a écrit :
> On 3/7/21 10:22 AM, Laurent Vivier wrote:
>> +    ccr = gen_load(s, OS_WORD, QREG_SP, 0, IS_USER(s));
>> +    gen_set_sr(s, ccr, true);
>> +    tcg_temp_free(ccr);
>> +    tcg_gen_addi_i32(QREG_SP, QREG_SP, 2);
>> +    tmp = gen_load(s, OS_LONG, QREG_SP, 0, IS_USER(s));
>> +    tcg_gen_addi_i32(QREG_SP, QREG_SP, 4);
>> +    gen_jmp(s, tmp);
> 
> Both loads should happen (and thus exceptions recognized) before any other state writeback.

Something like that?

    ccr = gen_load(s, OS_WORD, QREG_SP, 0, IS_USER(s));
    tcg_gen_addi_i32(QREG_SP, QREG_SP, 2);
    tmp = gen_load(s, OS_LONG, QREG_SP, 0, IS_USER(s));
    tcg_gen_addi_i32(QREG_SP, QREG_SP, 4);

    gen_set_sr(s, ccr, true);
    tcg_temp_free(ccr);

    gen_jmp(s, tmp);

Thanks,
Laurent

