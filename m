Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402F765AAC8
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Jan 2023 18:22:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pC21X-00047S-4m; Sun, 01 Jan 2023 12:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pC21R-000477-SO
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 12:21:21 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pC21Q-0007LO-1o
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 12:21:21 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MvryJ-1ovbjN2YDf-00syTV; Sun, 01 Jan 2023 18:21:18 +0100
Message-ID: <2a3187a0-883c-db2f-3f18-bc4fb6b158f8@vivier.eu>
Date: Sun, 1 Jan 2023 18:21:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/4] target/m68k: fix FPSR quotient byte for fmod
 instruction
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20230101144339.60307-1-mark.cave-ayland@ilande.co.uk>
 <20230101144339.60307-4-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230101144339.60307-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Z17hHtBI74dWpSD0lJJtCfBqgFkp8Llnypo/5077JciPrfqqCYJ
 KkcR8c6EVHZ1NrLtMIuTwjktJL3yaSEz4oKNuZWMnQrG0rJtg/gaeShnWe+8jbAgkl5BDY7
 iQxC0a105lJnPtYSBGY5OjPsYDddBz09oMnFN8DpVq8KN5oxU4u5kvKes3p4BbpX8CGnUs8
 NyYSgPv9JuFeq0/SnPIMA==
UI-OutboundReport: notjunk:1;M01:P0:6IEl2hqPir4=;ELL/QO6Igm+mlCYIOCMPRxDd8Fu
 WF93ba5La2p7Ni+IWkmMXEFjtyqwsWx50ywtLoW35uVZhXaLd0BWx2tN4g73FtAAf1+OVq7S+
 S/ciMqKmMtmpKITpP7+hZuXsx+a+VXdS86RIA6P/toNzhhExwIdYNDTHf0kIrj+A8KxWn8j0V
 KFaC0kgQRbEUHNcaXaNRqLAy7zyMRtJRLb0A3HMBlXCvjRWI+RQJpDKaYxvwwp3nVLayXZ7S1
 00CAfwvD7TNmcfLQgqGGqoa2Bfanyem1xcyYYunnbM5JMEi28RJRRGCa9HbyQxPlyYzYTJ5MR
 0NsU7a167n74TM5W6LLwRFbDiqFRDrnGF0fE2/CiNBHN6jJ7+rylJoXiHvXhnXDGuRkCPnEvn
 9CeNtxrSuPTEIaeOHyccbVcSodK+nmTjI3CYyvcE4+hR2TUPpKG+blj2VUPzOVzpuQbyE9SOi
 Q15wmrrHUdvEIbSxVhz4mpoJw5AkbnZFJD1TBcVBxkqmxS9GThcLCYUw7XO8zzqNXkEpN/WX9
 pa0oDnKNO/k8mPPBQuzqS7AGAprJ9XnFVMxfdTD3Tfa/sOGs02Zq/nQqHQUdCZ0puvsflBGwX
 9R9aVRN15ErBxkJ80qqIU8/QtmyYt9ITThG+GGFlU+wOU8fxGVooxRHhiXxaku0N3n0vxBFMG
 4uIQnQ7YgG9FYA8ym7/gLHDGleG0hgTnNVU5xJikyg==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.802,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 01/01/2023 à 15:43, Mark Cave-Ayland a écrit :
> The FPSR quotient byte should be set to the value of the quotient and not the
> result. Switch from using floatx80_mod() to floatx80_modrem() which returns
> the quotient as a uint64_t which can be used for the quotient byte.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   target/m68k/fpu_helper.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


