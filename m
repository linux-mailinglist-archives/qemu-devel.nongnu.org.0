Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4447A47D86D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:58:22 +0100 (CET)
Received: from localhost ([::1]:37848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n08gm-0005ai-T1
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:58:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n08fR-0004Vm-QK
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 15:56:57 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:60989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n08fQ-0000RV-74
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 15:56:57 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MyseA-1mD6oQ3jXu-00w0Se; Wed, 22 Dec 2021 21:56:53 +0100
Message-ID: <129332ea-4149-1c01-2a88-217998d8ab53@vivier.eu>
Date: Wed, 22 Dec 2021 21:56:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/6] linux-user: Add code for PR_GET/SET_UNALIGN
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211220214135.189157-1-richard.henderson@linaro.org>
 <20211220214135.189157-4-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211220214135.189157-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VH7N9eYxy5UzHBDUg7nuTv+jPfIZBsB3dCnvXqHCoPJAofhqvL/
 dCpSq2lfAAVtBgEyTWs2j14aAqjqUK0ZzYSA7tEZBFRJgT+VRDFfl0yIwoV2yi+RpblRxc0
 k0u7tFx46ryxrAX6F5ijIv9v41rMbg1gRU07ULXuiFpbg+vh7iCtfdVpT1a99Mt95t6hsgY
 k11S1GQB2OovAtDe+dtug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IBQhQuctcuw=:mbQse68iBm0YshYo4Vub9L
 fW+tCkV4kfKa6pusAiLY0bsxzJG8xvNOMf27MarG+hqr34Kqz5BPRYVHxmbTJ/Va7w7hK9N6D
 Y4EzlilzNUSPoN1TKTdH/OGved466lvauWGqpSx+6wvSdAW5aUaf7tMn9ZoLweiOI4CoKv3+C
 FHU5XMI0LQNypIkJN2S9CNB9Owcy36olXLZezRRdVvX15ljD9+IvJdQMwsEoY/0vP9GsiaAtO
 Nqrdmmevg226bc8GbS2+4YCR/2wsZxvfnB2MiEciPDI0swg6d0TYtDbU8091EWeM1Ik5Y7MGv
 04P64hANzKusmRrDsHYPGg4ALLA4Od/x86v7Q0uTHfKtlCwDre/zWZ2x9waUxk8oOPV96HUQK
 PcH6suBBZFIp3vDi3MmZB7b89mnsjzgdhAMXR0JBLufb4VdIjVtP/8U3kVYoThTsleMQW6yKS
 iKNMY3z16a3/JJCFNOHMuPyAp2wXhCQCtaGKBn/Ejj6GsQCr3BmrIooFSox+csP3Q3VUDUkWy
 Cg8k0j/VkBxJh7DRdw8xCtO3i6WTXCnN99sy8OL7kSAIDEQPNu8ig29zlA/yir0jExlu+4Ml3
 3d8B7bSskex2N10eTpvqHYxWO1PU0nhufx60I2Ul+lj0jxNazcl3bl7yfAmkxPJpEoalL36Yj
 E8z0KnHNVw502nhPJdpr3xvqnk5HM1PW1U1r87p0GecJDahQN4apSjEsyJXrF//dI2kw=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.694,
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
Cc: Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 20/12/2021 à 22:41, Richard Henderson a écrit :
> This requires extra work for each target, but adds the
> common syscall code, and the necessary flag in CPUState.
> 
> Reviewed-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/hw/core/cpu.h                     |  3 +++
>   linux-user/generic/target_prctl_unalign.h | 27 +++++++++++++++++++++++
>   cpu.c                                     | 20 ++++++++++++-----
>   linux-user/syscall.c                      | 13 +++++++++--
>   4 files changed, 56 insertions(+), 7 deletions(-)
>   create mode 100644 linux-user/generic/target_prctl_unalign.h
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


