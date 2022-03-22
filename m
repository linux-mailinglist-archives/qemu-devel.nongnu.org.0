Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DB34E3C44
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 11:14:51 +0100 (CET)
Received: from localhost ([::1]:60370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbXN-00081n-QM
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 06:14:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nWbVZ-0007LK-5w
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:12:57 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:40939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nWbVU-0006ME-7w
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:12:53 -0400
Received: from [192.168.100.1] ([82.142.12.150]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M5fUy-1nQaAV1MaI-007Azi; Tue, 22 Mar 2022 11:12:49 +0100
Message-ID: <04c5229f-7255-b30f-80a0-93165ea982a2@vivier.eu>
Date: Tue, 22 Mar 2022 11:12:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/5] linux-user: Split out helpers for sigsuspend
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220315084308.433109-1-richard.henderson@linaro.org>
 <20220315084308.433109-3-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220315084308.433109-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SFR3l1WwgraCbBo72rCHXaa1shkzXBl//m1X/5StvIGYX4sTihl
 GeCbKcMapQZjQIVYvi5K3j/uIGkCmDLkT/cauGJwB+dV2/dTvtxEVMYN+IoDoMex91sjaJX
 /L7Ukjewojq8qTLkkCHMCtZEt5jXTYGTdS4Cg7xzzjcF2ToN8IafjYv5/bb+S36p9miMVnz
 /7cIFbyzo3Wb7CWpIqCmQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:P2G5l/mfUAE=:JnzmWXYkR05nuEUaZ4AEmS
 dFyohSIAY2aRPCGP9sML+K/O2LVeaNGOzIE9nW6lFE0eWunmxSnMCTwthfhfbkDjSVEyyq5jk
 KhSrZPzKa+Af+ffoa/jndXuP9UnaY/e6fYPFZYLEcQ+n4oWG92Gtc8P8GqPfF9+48pnJ3bFnf
 1eFR80dBu4IYK3/END8K4Cgyf/blhcp9Z1P08RaIA9w4SWVfSHO9W56fPpqNA0yVGsF7G68dR
 /bDkxtA77nJsD/UYLBF0KG2Vjtgytb+IHTAPDoXSQFPxyjUUugQh6fc6z1fj7BLe40kqpNojL
 orMLhoSvXnKgnG+YYnuuA/UDzCG5T9UxKfrOy/yGA7N1W9WatNCKYvQeXiRePYKRiNnA25sAy
 ANAiskaXtIRpSC1pyrZB3wxDBZMYn7vHcbFnrlF5xUEbzrVmBkI0liE7+lBVhtM373WUzHIP1
 oJJPf+EKoz0zTo6ihEw/3SJ1ymvs2o/Q2LBp21YN0Y36mLgpgZP5khpApO8tNqU1BPj6ehuLS
 W2h7NghmF3XckUe8Ril7YPaVC55SerY8pmUh06YkldeD4p6QhbVVHAbcx7jDQtnbTJme3u48Z
 bAq9U+xf87NWGJL4CYuyRPexgdxI9+BO+Qh9V4bble6DjmqNvlhcuBinefk+tq4MbCD3xDTXG
 gzEA6db9W91xdYx1GpRQxs2w6/kTHzMX30OLWNk5QLasSGFIImXzKwnPrzhGsgRR5/c4=
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
> Two new functions: process_sigsuspend_mask and finish_sigsuspend_mask.
> Move the size check and copy-from-user code.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/signal-common.h | 26 +++++++++++++++++++++++++
>   linux-user/signal.c        | 23 ++++++++++++++++++++++
>   linux-user/syscall.c       | 40 ++++++++++++++++----------------------
>   3 files changed, 66 insertions(+), 23 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

