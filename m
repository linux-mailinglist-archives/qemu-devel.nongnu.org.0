Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC748480004
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 16:42:34 +0100 (CET)
Received: from localhost ([::1]:58294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1s8v-0005Z1-OS
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 10:42:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n1s6O-0003xf-9w
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 10:39:56 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:37301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n1s6M-00079Z-SR
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 10:39:56 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N8VkX-1mNoNt2O2b-014WlR; Mon, 27 Dec 2021 16:39:52 +0100
Message-ID: <00aabac6-4889-9a7c-e0d6-f117bfe54d0c@vivier.eu>
Date: Mon, 27 Dec 2021 16:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 5/6] target/hppa: Implement prctl_unalign_sigbus
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211227150127.2659293-1-richard.henderson@linaro.org>
 <20211227150127.2659293-6-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211227150127.2659293-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gsKhGWg2d9K0JUFI9muae2e8oLM6VkUIUMkmy5V57YO6MpCk3E/
 dNwgFPsfj0oZuG4M35zaPf6LmxktCNL7PblGWWyALMYCOFR9Y/3cSmqwnBrNVCgLcbMssvc
 kx0TIyOQe18+xRPF0HWTXE/H4K6GtnhI5k6w4jE4zrhIEI44LhpA7zn+zEOsh3IzEtuZKao
 8xXahtTHKqyX+A4IPRNdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IVCXT49IdfA=:Rj7gANuuB3geKcjqy9RZdw
 hr4N58oN94UoEsKlKmYYM16cV0hsohNbmxJafUyF3gMesHhzFjLDe+Q6JhdKV0I7zKOJwR4Cd
 yTtFFbWT/qEHsaT/rSbds6H+nr8iwQTIe1vds6ie93ccCUZZYNx4a28o4j5Eg686LbAsOppdi
 qxjEz4u86he/g9p5C4zBs1U8vv4evjjrFhBG1pRQNRFR9oUOzuCBAVyEwpSL7g/eO5Bd6v9Zb
 fV+ENZzEtJUk6j0zhce3Fau+neruvrF+v6L5ZroY6hMF7ZwtAtTtrLzhppLkwJKZeOwqZDBNQ
 /HZ5DZSnF1hwpZBCnGuum6mhIAaJ7zE1Mvlreub/DArzcVrr05JtL7LIU9LAivxsufQoln7mE
 hNaiaEZt8ouh+Dlf6ROl8+rH9WyVskEZjz3zxKOsB3B8ubjMkFWkrAVYgGtxQrOzUPXz1bbaL
 RofwYyz26X7H2XNzz8+i4cIrgn9jF3ynyfYiLYn3glVqtLotWKWichpVsaxbZwGPl/1JthrJp
 MGOHxReZ0xjFvD3Fiab9YENaxYWO+gxCLE+aWGbhpvlLH1x7oS3apS8aK7j9xOmU9PWBeJznd
 EWK3UTNKxpQMZbzNFk9Q4NyuTNqIgPbdFdU83X8g/SfGDM4z0Wt38p19aHU2F4SBB4V742cgF
 VUitQuZl/zBmMFJJNOEdpK5r89Yf26VsofiAcY8XY/v/PJpsURaXWjbJ4oeW2vlnFRp8=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.363,
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

Le 27/12/2021 à 16:01, Richard Henderson a écrit :
> Leave TARGET_ALIGNED_ONLY set, but use the new CPUState
> flag to set MO_UNALN for the instructions that the kernel
> handles in the unaligned trap.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/hppa/target_prctl.h |  2 +-
>   target/hppa/cpu.h              |  5 ++++-
>   target/hppa/translate.c        | 19 +++++++++++++++----
>   3 files changed, 20 insertions(+), 6 deletions(-)
> 


Reviewed-by: Laurent Vivier <laurent@vivier.eu>

