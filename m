Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293CE683143
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:20:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMsQP-0007CA-Lz; Tue, 31 Jan 2023 10:19:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMsQG-000779-SK
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:19:48 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMsQF-0005nk-Ba
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:19:48 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M2w0K-1pLn1o3VqG-003PfG; Tue, 31 Jan 2023 16:19:44 +0100
Message-ID: <314f9cdc-da08-cc08-4c54-fe4101d4165a@vivier.eu>
Date: Tue, 31 Jan 2023 16:19:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] linux-user: Implement SOL_ALG encryption support
Content-Language: fr
To: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221212173416.90590-1-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221212173416.90590-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BE5n8raPtg84iyKSwelU5ds8svKzpVYLO9JCIKqX9lKiFGwc9GP
 Y2yU/dLmogKHuSTaaean2aWaXa6mtgejGsvBk9NUMDrDWi0FdELbhvT807pcTKsjNY2vzcz
 2n9vl03JuZH2S3rXU6fB4aGmS6zORee6/RAbSC6xR5xNUs3FnpUNcHph1DskUgDoS5fIP7+
 slA5/oSkRTGxVOlKuZj2g==
UI-OutboundReport: notjunk:1;M01:P0:S7rzRbhbr58=;ZQjDnJ2S07C6HmPXqwi1jjE8dvR
 113Ob4Zg8YoIgyOWRvkXDisiocp8YEhRE+EfQfwFC4ilYiTnb1aa4tf5Do3QOlFY9f/ScgMDi
 PRqCb+aak73Mfo156d9v3lyFVqLFd86NmMXy9W7V0DIDissbyK7pHLZNZknUG5c/HQUN5VAE8
 7J9guR5PEXOA+4fKMl3Lrq9Dg8PpemPkzATTuIs2f7zyRZh9oRd6K0aAxV9qUtlXquEsnV+a0
 kCUupynMBb/1Hdurjwjj5LNX7fm1hmJt1A2VUDOKp81bY+dCUaA5JYWhvL5U0GiOy7lNpmeYU
 Bqgz5fQaYAPF2t5mAzjwhqS0uf0dEOX2gKtGZRHB0AnTLfrg1IM/4SazNu4LOIxZAWi8HaUu5
 8vxmfr7BOvwDvrwPnCkGjnEZvxqUmHi7ncjWN6RvqmJNEQ0Y92PKVfym0roHDNqPY0Sl5/qPW
 Bhx8xJUNcHSedfLOWWFfK+7M3iHEgsLopmppL9mDNTHitskyvxEuQPPnfb5afUDXKkWmlQ9oQ
 4OBzN/QTWmhRG2wCrHFwmYFshXDGaekDEY+pfDB7mNiFQwNGmIkBdCcTiyxZtmdrj1Ifds1j5
 rE3SwNoBpLbZwxQSI4ilqMHuibG0ZsJ+UNEVzJoKFskFtVy/9FNkUz3A53Zvvhjk00Virc30a
 W8j15+gXhkqKCGdpTog4v2TAUMYfKYHPuwImEX61ug==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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

Le 12/12/2022 à 18:34, Helge Deller a écrit :
> Add suport to handle SOL_ALG packets via sendmsg() and recvmsg().
> This allows emulated userspace to use encryption functionality.
> 
> Tested with the debian ell package with hppa guest on x86_64 host.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/syscall.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 71ae867024..a365903a3a 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1871,6 +1871,14 @@ static inline abi_long target_to_host_cmsg(struct msghdr *msgh,
>               __get_user(cred->pid, &target_cred->pid);
>               __get_user(cred->uid, &target_cred->uid);
>               __get_user(cred->gid, &target_cred->gid);
> +        } else if (cmsg->cmsg_level == SOL_ALG) {
> +            uint32_t *dst = (uint32_t *)data;
> +
> +            memcpy(dst, target_data, len);
> +            /* fix endianess of first 32-bit word */
> +            if (len >= sizeof(uint32_t)) {
> +                *dst = tswap32(*dst);
> +            }
>           } else {
>               qemu_log_mask(LOG_UNIMP, "Unsupported ancillary data: %d/%d\n",
>                             cmsg->cmsg_level, cmsg->cmsg_type);
> --
> 2.38.1
> 
> 

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


