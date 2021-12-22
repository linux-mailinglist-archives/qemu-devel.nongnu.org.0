Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B4E47D843
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:23:54 +0100 (CET)
Received: from localhost ([::1]:36686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n089R-0001Hz-5U
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:23:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n086I-0007dS-ET
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 15:20:39 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:40133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n086G-0006ZE-TY
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 15:20:38 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N9dkD-1mNLSW468D-015cgX; Wed, 22 Dec 2021 21:20:34 +0100
Message-ID: <5596c81a-4fb3-84ef-6973-df78688f788d@vivier.eu>
Date: Wed, 22 Dec 2021 21:20:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 5/7] linux-user/nios2: Fix EA vs PC confusion
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211221025012.1057923-1-richard.henderson@linaro.org>
 <20211221025012.1057923-6-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211221025012.1057923-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4DleJtLK1Jyz7WyrRchGXohXJjXOU06r1OS3jFTIVBZ+lWWyrHH
 FcGBjk9xgX9iIzGIp1fqD3gRsId5mFx/f+6eGjnfP6Gz/yJHvOdG5ZVi/k7Lcm573Cr5hto
 ZamGEM0rxSpVsfyR+h8efXYkj2o2FaUh/ReZfjeU+sfaFPXUjjJ7FvvHyqQD8C5hMNekxcy
 KetW9y6Yngl/WT0YhGNrw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V6eROHZxz+A=:8NwOGv1Snfk3uwxSKmTTgB
 slUuWOgTrMJ38MeWow6AyjhOX1WC977GtwyRhVsZhRbBes9HkCIgg5cGHDu15I0DwjCYj/HE2
 LsG5XH1m0kSFSuXsOVweM7LupUY+DBEDvDQg+zhY1/dReRLCjIHbAgDrOHpJPR+OSrbqPIsNr
 WckVrKNZoiXKZYlFRNlwwkHqEJ2v88vJHQWLOy/I5/hsvGe5LSRUAPpdApEad4wOm1cJI8OVk
 df/GhpFpcXP2CqS/ymodfnGiSdcjg4Nj9IIXWcPpxs9+onfexqhZcnsA9OQVfelC50tr6EIsK
 j7gmF62ltnQ6xb6xwDCvphfuCMmOfDR8J1KyruwQJ5quaXf1Qu2fivL/xascv3YZXAkiPKdtZ
 t73wzeGpDo28PA54l6DJNJEDDodyM5o336cyQM/EmUDmmeV1YD2GUfGNyuIjsXai4gQStPxBm
 Rk0auF6LvB2nTKvR2+tLjzuHPrQurlgJDERyQYoiXdatn0DUQN8TSlqAWg2pDAI9Cgcg0FbII
 OrTOBOJmxjiYkF1JLNmnqKU1SBmOXr5VyJPFw6x08QVo0U/RGyRJhaVsCzI7I/FFnoGeAFUCZ
 YaB1Z96tVky19P3sijXfn485mlgWiGWOVRCHjCHAL70wvu3+JCwGJlDSZJ9+/8V/QOEan8yeP
 k+JwaW9mf3FMDty9a+HBXHy9PsT7whtxQhKv0OB59M7Wfx8ca8vYGCDK+aOtwfsZdMIs=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.694,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 21/12/2021 à 03:50, Richard Henderson a écrit :
> The real kernel will talk about the user PC as EA,
> because that's where the hardware will have copied it,
> and where it expects to put it to then use ERET.
> But qemu does not emulate all of the exception stuff
> while emulating user-only.  Manipulate PC directly.
> 
> This fixes signal entry and return, and eliminates
> some slight confusion from target_cpu_copy_regs.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/nios2/cpu_loop.c | 5 +----
>   linux-user/nios2/signal.c   | 6 +++---
>   2 files changed, 4 insertions(+), 7 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


