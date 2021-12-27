Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6423E480042
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 16:44:17 +0100 (CET)
Received: from localhost ([::1]:34264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1sAa-0008N4-HS
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 10:44:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n1s6f-0004Gg-EQ
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 10:40:16 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:59553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n1s6b-0007AX-As
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 10:40:11 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M5Qhx-1n2h3C2501-001Oue; Mon, 27 Dec 2021 16:40:07 +0100
Message-ID: <282abb4c-bffa-5a01-f9ca-f01fec45abd3@vivier.eu>
Date: Mon, 27 Dec 2021 16:40:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 6/6] target/sh4: Implement prctl_unalign_sigbus
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211227150127.2659293-1-richard.henderson@linaro.org>
 <20211227150127.2659293-7-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211227150127.2659293-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tGqsIlGx+a+86xmY0ydmQFQN822Evh8WHtZE4Ak4NSFJhcLhHQS
 gKZJ5dheMZJKzoXJN4hYqw6/Elretel5E1+2R3w4RLjZE/PKVqWWT5wUGNU201wEw7zSDFP
 gTuKgFMa3vBJUBkv+bLQ8WHlPnPpFeUl/zmqR26FwlVCPNcJZQ5GmVNshXzUhJPxOL/ZOG2
 N2io4kv1A7VQGpXm7TH4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SCeNxoVDnMg=:bQXJ5wPbtlO3E03kAuByzG
 /EzQx5jouWosYd7C0TwdzhT+yQGBt4viPDx2ouO8uSV50acQjY8xAaoqK5N7e0LBE10BsxBa/
 BAo+ZNrYLwDaQdKhv6kPaK0Bh/1jb0CsXiI/5tNyqyPzt1x39N6mtlDQa6ECnXkqea6xhZ95Q
 M/mWntOA/57SjrM68UbL7fWse6s5P8QvvQFeYhdw6c5tTZwB77iIbdNAgKZRnA0wtkZl4I2Sy
 +AiJ079gzx9N13ym344AGp8MoBeyRgHKCnVBYHkXR6vEb89B+/0OryqRda3BdewxX+PNM5+kQ
 oO19FxNGU8VFqgKJe4931mhJu14mfpvxLYa+CYozV/kz9/rJj//ZoyXqHC2GSx+2hTjz245ND
 JDfAyYWCkU28wmYrbwtUrljbEu02JsdIr2U84bE4kYw/u4zoAiqcVGcv94ijZh1TvWcmuWoJw
 DNBONfrKmR+xUQ1KZAk/3iiwYwP9/JjIBS9DJJrHwRAov3RQaTQPdBEw9Atsb47r489Ob2OCh
 422MBq521I84jrUbyLo8nkg/zXnbx4vXpvWYrG+IMgsZvox8cM8Ytp/2hIINGub8WrHxrXcQr
 3GNNEUEayI+Syf5BQSgXDkH/RjYZffrt5xCTRD8l/PsZ/MnWzPtgHHWuwvBQNba6sGpM5Nn9/
 0E16QenZKJuUPOWPo80eybB6c4lbc3c9E0O4hveO9BLOqoVtlUXp7TcqJTtBzsgMyvEo=
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
> The Linux kernel does not handle all memory operations: no
> floating-point and no MAC.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/sh4/target_prctl.h |  2 +-
>   target/sh4/cpu.h              |  4 +++
>   target/sh4/translate.c        | 50 ++++++++++++++++++++++++-----------
>   3 files changed, 39 insertions(+), 17 deletions(-)


Reviewed-by: Laurent Vivier <laurent@vivier.eu>

