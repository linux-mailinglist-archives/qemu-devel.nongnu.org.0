Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BC02DD05F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:32:03 +0100 (CET)
Received: from localhost ([::1]:46038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprVq-0001YJ-FW
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:32:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kprUD-0000yj-Gi
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:30:21 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:51229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kprUB-0004lq-Ld
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:30:21 -0500
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MkYg4-1kO07q0aH0-00m6VQ; Thu, 17 Dec 2020 12:30:16 +0100
Subject: Re: [PATCH v2 1/4] linux-user/sparc: Correct
 sparc64_get/set_context() FPU handling
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201106152738.26026-1-peter.maydell@linaro.org>
 <20201106152738.26026-2-peter.maydell@linaro.org>
 <29cf2911-b92a-ada5-fb03-18cd022fee14@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2adb6e94-e6a7-aa18-5c42-e8c53b27b40d@vivier.eu>
Date: Thu, 17 Dec 2020 12:30:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <29cf2911-b92a-ada5-fb03-18cd022fee14@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ifqQuXDHXJvcdIUz7veT+IErWW5RUTPfWyDq4GzpkA5AZgSc5Me
 GKR74V8r6MNP8GRFnGd9003MI+POPTgLu0Nnzvc1OQCLO4ia6IuElGHSgTO+BDJuS7c+pgk
 A05ZA0r+RYALwUrA+jfNdNG/KpAxF5sItCAg8XD9/jPTdJCr7AlLWu37QCcqbThlQp7wyas
 NVk4wHlnsDWfbHBkrxTDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:76YuvXm0y5M=:RpH935WOydeX7qmjd/ypK1
 8/90CWdWGL25/QeeRY+iw40uG0aGouD7wGa8iJoPX3SWdTx6ipQcPOX8giwip8vL4ynxD/Abe
 JEW07gvuZeSy4FgBLiKOdCGKQyWX6nrSaP6HUvbS7zHxXfgJGgK/2Icf8ilT2GuoQDB5+qECV
 CGSz69etQn3X7n7RKg73/wkZdu6yMM9tFxb2qBbPyx3GUAUfJvhXed7LJ6Z+eKVw4IkVdRaQg
 jfYg4miV3/lzw7VPoxZqarDgxUsay5ZyLPOvREJhMLV8qoLC96K9bFHLL9GAqiIoPlk1QALKJ
 o7aAWP+qdLq1ShKM36njiik7G4a7bqa67JY+a5Iudzi401zrplX8gco2i1uvbbVVYbQQjlqY7
 0UX8mcRmD7gw8sUn2vCJW7Yd8UscmlYB1IVwzhbW+XdEoyVwdZ537fcXtsgkV
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/11/2020 à 18:09, Richard Henderson a écrit :
> On 11/6/20 7:27 AM, Peter Maydell wrote:
>> +        if (fprs & FPRS_DU) {
>> +            for (i = 16; i < 31; i++) {
> 
> 32.
> 
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~
> 

Applied to my linux-user-for-6.0 branch with this change.

Thanks,
Laurent


