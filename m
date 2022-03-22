Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C444E3D90
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 12:27:58 +0100 (CET)
Received: from localhost ([::1]:37338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWcg9-0003PY-Ty
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 07:27:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nWcew-00021j-K1
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:26:43 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:43311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nWceu-00023k-JU
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:26:42 -0400
Received: from [192.168.100.1] ([82.142.12.150]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Ma1sQ-1nc8wk0XrQ-00W0km; Tue, 22 Mar 2022 12:26:38 +0100
Message-ID: <9f575b84-2d68-6fa2-5913-38189d60b481@vivier.eu>
Date: Tue, 22 Mar 2022 12:26:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/5] linux-user: Properly handle sigset arg to pselect
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220315084308.433109-1-richard.henderson@linaro.org>
 <20220315084308.433109-4-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220315084308.433109-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vKSVQGF3W4GCZvlEjqwYWfvEmazxmdhr50VjWMr0kCCTdz5nDOI
 2cIFUQdZYsucEMpTaejsysNS8hkOC+YxKrlhHTw3Z1phKbuCMixSQ7Xnn1DiBEDNHZw9QdJ
 ky9JqbpFQH784/Jon38I8Btnekoi8SEQf9v45TNzuWeuA8ma3mJ90EEIJKb3t+jLzXzTrj7
 NrVhpSxcN2A3ZBD6c6NyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jsCxrHPzIC4=:svrPavbv7zkVCW6syrjw0b
 +SkLQEi55x411widg3Zj79lh4yppmNStfCeO+GuNqgWOFbP1h42veLrozHdwVg1L9gZwr9fv7
 A+h4nSvfLSPlDB4qiNLyps15cCBC+bEfEZHPIhNp8OpMVaIIdYA15y0sHJ63VCVvq5n5hHEJJ
 lqu/UGIjD9eVjkeqnJoDMExz4Hrt37KTPeIPLnvK9KNSeFQf0ES0Mi0snRnbihVUgy5noCYiO
 geuSEhp1Ahdbn7kwD6q7tgCuixwVqLwvXSy9nKr65zBKxjozew4CdMTtcFftyV54Nkq3OfxOw
 aMsRzMXzowaBrwdP/lTZfWkz4APDNBAo0gp6v8pVwW4yTyDnJeg+O0bbI74iH56oJ00ypvxD/
 AKMeaLMvPmsmiXhFStNrWaFz3jwVfA61bVPpoYSax+HIrCeUDOWVAeoWEqBQww7x/MD+eZXYn
 XJnQngV++ym19dGOlYr+D8JVrvBxKkiFeiKhznuZNdtr74VIaGKLSZ3fytyNr41UXRymGqIhW
 ym4gfngdDmA+grjJo9DTZ9FTPbcFiRd147vM7w4cGbRjZXfs18D499t0S2lo6CNYZ9Z+pDxE6
 9Ci3ApIDmZhpis3Zqa/V42ehoHDtExhyyY/blmjIEOgiMvnPME20HMiUEqGLhyN+NE3z7QyDF
 8eSGBLTYRcDGta/bh8v5mp1dUQNXlxMCSJUBxkxBvLUkVv0VXdNmLQvmK5p/wQU+/PUk=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 15/03/2022 à 09:43, Richard Henderson a écrit :
> Unblocked signals are never delivered, because we
> didn't record the new mask for process_pending_signals.
> Handle this with the same mechanism as sigsuspend.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/834
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/syscall.c | 30 ++++++++++--------------------
>   1 file changed, 10 insertions(+), 20 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

