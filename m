Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53B8467B13
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 17:13:22 +0100 (CET)
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtBBZ-0004QR-Ed
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 11:13:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mtB9P-0003G9-Qh; Fri, 03 Dec 2021 11:11:07 -0500
Received: from [201.28.113.2] (port=47586 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mtB9L-0004QH-Qx; Fri, 03 Dec 2021 11:11:07 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 3 Dec 2021 13:10:58 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 71CE0800A5A;
 Fri,  3 Dec 2021 13:10:58 -0300 (-03)
Subject: Re: [RFC PATCH for-7.0 00/35] target/ppc fpu fixes and cleanups
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211119160502.17432-1-richard.henderson@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <a9ebc842-8457-757b-3bd1-48d9c985af0c@eldorado.org.br>
Date: Fri, 3 Dec 2021 13:10:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 03 Dec 2021 16:10:58.0708 (UTC)
 FILETIME=[5BE6DD40:01D7E860]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.938,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/11/2021 13:04, Richard Henderson wrote:
> This is a partial patch set showing the direction I believe
> the cleanups should go, as opposed to a complete conversion.
> 
> I add a bunch of float_flag_* bits that diagnose the reason
> for most float_flag_invalid, as guided by the requirements
> of the PowerPC VX* bits.  I have converted some helpers to
> use these new flags but not all.  A good signal for unconverted
> routines is the use of float*_is_signalling_nan, which should
> now be using float_flag_invalid_snan.
> 
> I added float64x32_* arithmetic routines, which take float64
> arguments and round the result to the range and precision of
> float32, while giving the result in float64 form.  This is
> exactly what PowerPC requires for its single-precision math.
> This fixes double-rounding problems that exist in the current
> code, and are visible in the float_madds test.
> 
> I add test reference files for float_madds and float_convs
> after fixing the bugs required to make the tests pass.

With this series and few other VSX instructions[1], QEMU now passes the 
GLibc math test suite.

Tested-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

[1] https://github.com/PPC64/qemu/tree/ferst-tcg-xsmaddqp (WIP)

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

