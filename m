Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CD65F8A3E
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Oct 2022 10:56:40 +0200 (CEST)
Received: from localhost ([::1]:45632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohS6x-0002zJ-G2
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 04:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1ohS5f-0001YT-42
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 04:55:19 -0400
Received: from mout.gmx.net ([212.227.15.19]:50083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1ohS5d-00037b-CT
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 04:55:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1665305713;
 bh=tnmfyZA+Z8LelPZ3FU0dGzNpzaT4JeTaccrHxSPAuZc=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
 b=id8JzKVdX8Vss+65isAN7vkOKlEMvGhslgxMn3cDnmTgJA+oqk91S00djE+fO3du1
 zm6U9kXBAjYNyvDy/+R/sazo0LRhPwL5zZn02/7Z+P/lQjUsfUi+wnQEDfz2pY1Shu
 8JKAduwPzXir/MO1sO+8pScakY8zcJocujF/rJ+8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.161.163]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMXQ5-1oQkHm3N03-00Jefz; Sun, 09
 Oct 2022 10:55:13 +0200
Message-ID: <71552d05-d8be-5161-e476-a55ac80844b5@gmx.de>
Date: Sun, 9 Oct 2022 10:55:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3] linux-user: Add close_range() syscall
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <YzLXsPYR2OjfKWy6@p100>
In-Reply-To: <YzLXsPYR2OjfKWy6@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/W+c/zZAkAvgO3CyvvZRb089bTgFwpryImvVu3h9xpLLYTtCEWJ
 oG8s9CX5OUF4Dth0tRPz0JJV3Be7oPtivjjWfZqQOo5vBAATW46KAQqcsWnMY9TN4YGpXjo
 kdyBcu9LVz5C9dHaIqzurfyDcvs344v3fLTRg7FWBZYKkf6UMMRYrXHd9NKKqVcrjpHexQd
 rjuU8pvXg4rPIVWjzFhQQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:K1C6J5k7llM=:HCuxgcZ2hGMxZ5y6Ny4TH2
 m2nnMvUrc8SyVvfK7cBhatronJYMJas5JHjfXdBJpia8zHm4HZ7d9J0A9MnaLNiVUsmfKmVxe
 F7oaFJS5kIjIUf/8evWraPXXbyMvv8bjSmkOJv+f6I2D+48jYN1FOLTLr0U6VsS86YI9WvYkO
 oZX130iunZQxwkFj7Eg1GDTDUWVpBIYtCffMbCCV+Sn0JuXbmmEG0i5pY76XgaJMcZTVkTWoR
 grgWBMIV7LoGjJRxmlVRfEQmUceZBauLeYQF88I55QAV6SCqE5ovYAJX5q/mAw0MGzVYv1vOK
 WiBQGI0CVUml9yPQWlrFaaHu0a/KG4C8+eKOSSJsNePgXTVlpDIasHM7gNpFsApn9fojhdezV
 ZyPU5rD3iS78Cq6NDE55nULbxbvgWoo65qQvUj8cMAfghvic8sJingf53oQciY6fViTLAJ6XY
 tcgAvhgAytNjQqetSUBd6r6TAl6Cq1Y/yfQPVom+T3xjYDbGTRSDXtTw8tjgD6RH8gzHe389F
 gkBvXsDIMudbMEEvlGcT5dVszXj/D1VpCSXpLQfEiH2W1KOE5iR5e6yTLzj8iamUQzwwzqBhu
 8NRDBq8IHmNYZNFJV6/Y4iGvVGmxZ8+jg+bMP490sZVp3n1q4xGjwVepP98nF5xyZynPiTg9y
 bB+6ram4aT91g05RYkfQ2Gcja4VYQ25vcwY1eSLP2H+ZOi3jpMCJBBTc7G/Ot2S3dvh7oPada
 yZQ6/vVUO6832Eosy+crJX5h3Tgp6AldJFR6qx1H/mZz3icu5Y3jiibc8vOTAZMNufupn341S
 S3JpU8J+Qm6ETzvxENInq22b1Y7lcB7l+LY46I1KBxNfzfbs6dcFkaacTh37UY0oSywhvhWSw
 kzkUetJIfmAmAQCrWqdYfvY6HR40utXuxRVAFGr50abVQiCRWlqSns2uno1vr/aFYwncu733k
 wyXjLr5Sd9EqnznR76ezXZRBW6DjYqFhMcd4UhSlZf5W8nl+4F0rBPrRYtvu2k9m5znoG46q/
 woB0HqI6rYnjHXmyTDpaeIIX7/ySpbO+2AQbxthpBE5sJ5a6qQAbPmy0tVK7yj008mr++Rxx/
 4Et31O0IEdxzmkL26nWxJqoQyn2YOdlPDCeENiP3WXK4Tbpp9b5RFWLKDfsCgSVa7a3ak3xxl
 bIBgraSWNXvBysFEGfct7dJK5F/6KxgRXF5N62Y/Nevi/iw5zJkqVP2GmHObzY7neAmEUq97D
 a+VoY68JLIwXRxdzrJ0MOnVjGxjDYpEihReto1HsbxN7FBNGhiqI3dN5iMdMbV3XeD5yaO4F5
 PaIeslaA+89yD0NuN++NygyZlApKTDHIyrnVM0l1pwo58ylHbBBL8u13vwokuLwOoFxZZQIJj
 AWOk7F4LEr0+womItKi6CLcaib8EnqVTrnJylOVJb5ylPqpZLyiJiEJ6vW0QH0Ivm5ewcHp0l
 bOwd00a/yaoS+GDVGpFiXa+kJieTs781Bs6rBl4/TF18s384Nb2GhGhpeLM7kSotzEpSPCzWz
 p8/xIFJ7jLWHgqF9487H5KqTKFuM0+I+sEO0dz7pwnVvT
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.588,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/27/22 13:00, Helge Deller wrote:
> Signed-off-by: Helge Deller <deller@gmx.de>
>

> +#if defined(__NR_close_range) && defined(TARGET_NR_close_range)
> +    case TARGET_NR_close_range:
> +        ret =3D get_errno(sys_close_range(arg1, arg2, arg3));
> +        if (ret =3D=3D 0 && !(arg3 & CLOSE_RANGE_CLOEXEC)) {
> +            abi_long fd;
> +            abi_long maxfd =3D (arg2 =3D=3D (abi_long)-1) ? target_fd_m=
ax : arg2;

This check against "-1" is wrong.
Please ignore this patch - I'll resend a fixed patch.

Helge


