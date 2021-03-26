Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7022434A80B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 14:24:49 +0100 (CET)
Received: from localhost ([::1]:53548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPmSG-0007fl-0A
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 09:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lPmRT-0007Et-Hy
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:23:59 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:49831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lPmRR-0007DF-S8
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:23:59 -0400
Received: from [192.168.100.1] ([82.142.25.162]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MIdaF-1lSnF61PK1-00EdMa; Fri, 26 Mar 2021 14:23:53 +0100
Subject: Re: [PATCH] linux-user: allow NULL msg in recvfrom
To: Zach Reizner <zachr@google.com>, qemu-devel@nongnu.org
References: <CAFNex=Ddc_9Sta2W+_a90Qg7hCidMhxuqmGuggygfWWCzZdBhQ@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <74ee406f-f503-a66e-80d6-989b2c8ed4aa@vivier.eu>
Date: Fri, 26 Mar 2021 14:23:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFNex=Ddc_9Sta2W+_a90Qg7hCidMhxuqmGuggygfWWCzZdBhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:c83KEI2EViwfhsxCdcTHhTJ1ZwAL4z5Phh+ftc7kiwdc7PgVYAh
 vKiUj2MGnPu59nTMMN6gPpckBdJrTog7fOFynI3cv6k/a2gxahdgiDwb+KIxosOZmAVK2kf
 VVrmP5VjZdNSZhwBMlqhj/GkIr5zY75MuSBNzvNHEAO9Js2ZseSWSwspetkzJXtX8OIZ5xv
 tXgAfHUIGcwO4amFgCgbw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G1ZqF2+TgNo=:cMEquW55t+Wq/M4cM8E7va
 JWo8YpRs7ty72l9G1Gx/jb4JsaYaKTL9oV2NSCkx13mXKY1xjzuN+ht8syNlf29ZeazHE9LLu
 /NXQsH5TA2NzJ482xhyZ72Gymj5JkFWgSXhLS00rnguWrfXFeAfRyN09RLdpqLwJzdCUMXc7B
 AlZnP+2V6XHyyT4ljk6fBOnSV6w93aXoBc8MBrjX/fBR4OzTU8vSZQhVoNL5Zke8V6LQWZRUk
 BleQh3djGjoQx1hSpSegQvPoZHFuRyLCQAso2jepjbIZ9EvyxSZTuMkeLuR0fvIRcjE+tolNY
 5aMp2NIdWFDURjHvX93Tj02FU0UyWj0IbXwIbLLd6zlyiec98JvFhtK9Wuq3hMzE3WOf1EwSF
 loI3HCBmcANRRvVvn6uMz4M1y83pVaLdAwPkBjGpgHAscCdpZtDcfSscs9KN3V8HGSCD5MIEi
 cImoSNRhOPGI5qhQlUf7M++ZfVFdklflSn6MJL+ht/6Twtd9viuS
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Le 26/03/2021 à 05:05, Zach Reizner a écrit :
> The kernel allows a NULL msg in recvfrom so that he size of the next
> message may be queried before allocating a correctly sized buffer. This
> change allows the syscall translator to pass along the NULL msg pointer
> instead of returning early with EFAULT.
> 
> Signed-off-by: Zach Reizner <zachr@google.com>
> ---
>  linux-user/syscall.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 1e508576c7..332544b43c 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -3680,8 +3680,6 @@ static abi_long do_recvfrom(int fd, abi_ulong
> msg, size_t len, int flags,
>      abi_long ret;
> 
>      host_msg = lock_user(VERIFY_WRITE, msg, len, 0);
> -    if (!host_msg)
> -        return -TARGET_EFAULT;
>      if (target_addr) {
>          if (get_user_u32(addrlen, target_addrlen)) {
>              ret = -TARGET_EFAULT;
> 

Applied to my linux-user-for-6.0 branch

Thanks,
Laurent

