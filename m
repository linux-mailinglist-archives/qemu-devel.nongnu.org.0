Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC013458A66
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 09:17:44 +0100 (CET)
Received: from localhost ([::1]:38402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp4WF-0004z2-EJ
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 03:17:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mp4Um-0003hk-44
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:16:12 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:35765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mp4Uk-0002A9-4G
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:16:11 -0500
Received: from [192.168.100.1] ([82.142.2.234]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MqZE0-1mKQaN1ojA-00mf60; Mon, 22 Nov 2021 09:16:07 +0100
Message-ID: <9f523c4d-c716-6b42-77f3-b916ce1b1b10@vivier.eu>
Date: Mon, 22 Nov 2021 09:16:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 0/4] linux-user: Fix getdents alignment issues (#704)
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211114103539.298686-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211114103539.298686-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LbGBmZeZ4zxHPQdY6DbSSSjZ53NuS/QIBRgCsyXkxmr9K5VP8Fq
 Y9I6id22jMmQKpXfDF0C3zhouK38njVhorUKBrTS1vPE/3J0H421H7n1idZP7DJe5duxvP8
 YbU8bzA8zzwiiKuGf7dAKR3fF7mwKJeQFacBbioRG0WNOYtsnfozCjnnad87pHDWb1B1hm6
 B0jdpxXQpvQ1aZRoTnvjQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TVepY5BC5P8=:N9+asyirCaSaL54aSme1L+
 spammH3CEP2Bka081DAfjDrNtFuHtCoXCj0hPs3Xm4bnEh4afe58VSR4gMfEFfS1F/s3gaY7v
 XyBJons3AzofiCEGMhpIDoSQG9ID0BX/8wMKECsL8kQ6PRRsVIcD2e96cXRby7QeI9IelhYbm
 A0ouTMwMWR/Nrf8W2OI0AjaO/CKzk5JLF/yRO2ffb/b3RUy5yAZP9JS1O+O0jsr5Td+nryvwP
 qjSLP1N384hdm+w2xVnCmB5yP2T69DsekEfvYPsCPFgh+PYaxxDV0zQ5jwpNB52vAWlQQrF8U
 qL9qJAw/55m/MeMwEuXg7689DRdXtB11JDGw0m0ZfT2nCz9GAJTnHYXhUquOUPeuLgugX/tLe
 +nzKTvY8Rn7Qt5jgPmx/+eHB6rFeNjwlwlEAcH0mAu/O8MLkmVCia/pzJMCDzwpLyh7L8bDxs
 x2LVi9NVvrDpOkD4vlTK2uD2tpHvtRRQaAFMrwvXaryP1EWZ1ccrTbbuBgZ8lG9b3nesJSI+M
 Fxmguuny5DxmTwyzSJglqieLEayeWDwdBRrYqw8vHf/Zl1VISCytUxIAlxr+ehWZHcY+4NoPM
 x2CgntBMKvWKDLzjCiKMVYAgS5TC3Xf4cXdAHsO24jDhz0+ZnA+UXUl7A0ho4hVALPabn44e+
 g9Mz4MtrprgxmqXtq+fT3XTaKcb/BG3MclOSvAfu0WTQBJX9TpXc295gPI/EH8dGqqg8=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/11/2021 à 11:35, Richard Henderson a écrit :
> There are a number of alignement issues flagged up by clang,
> this attempts to fix only one of them: getdents.
> 
> Changes for v2:
>    * Do not QEMU_BUILD_BUG_ON for size mismatch,
>      as this triggers for i386 host.
> 
> 
> r~
> 
> Richard Henderson (4):
>    linux-user: Split out do_getdents, do_getdents64
>    linux-user: Always use flexible arrays for dirent d_name
>    linux-user: Fix member types of target_dirent64
>    linux-user: Rewrite do_getdents, do_getdents64
> 
>   linux-user/syscall_defs.h |  12 +-
>   linux-user/syscall.c      | 314 +++++++++++++++++++-------------------
>   2 files changed, 165 insertions(+), 161 deletions(-)
> 


Applied to my linux-user-for-6.2 branch.

Thanks,
Laurent

