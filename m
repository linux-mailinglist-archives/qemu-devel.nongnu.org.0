Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4EB682C4D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 13:10:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpSe-0002XQ-HC; Tue, 31 Jan 2023 07:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMpSV-0002WC-Kl
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 07:10:01 -0500
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMpST-0007RZ-Mi
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 07:09:55 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MlwJv-1owsZj0qzD-00izKe; Tue, 31 Jan 2023 13:09:48 +0100
Message-ID: <294f40c1-7e4c-abf8-29a2-d20a59a25e35@vivier.eu>
Date: Tue, 31 Jan 2023 13:09:47 +0100
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
X-Provags-ID: V03:K1:ue1nRylsdmxELaZbau35+PVgrKVpm0IekM7eyTs/RUr8jkapkV9
 VD52KcRFPBXXHPEFTjc4ZYB4976uLxx3PjRlqMjybGAE2kwJi4j59rjHwaccnfA4C9gwhCc
 Y6k3nPRuC3bNftoXar+S6IatO5evbQJMT6psnG3dJCPPcRsKT39zAQYlGuKsNZFB42+zekL
 DDet06IRUWXnAgayVLsqQ==
UI-OutboundReport: notjunk:1;M01:P0:SD7dxzFSaME=;9fN4cuw2/E8W58bWDSVn6yAv+zl
 czp1OZBSygSmTBQfPJgBcHUDJeMvEP2ho8WCPy9gnh5Xo/yajL2WJ9T2UN7tFLlZj134Rnilq
 dTwJkUZnWK4zje37r1GZq+AgdQMu0KK1Sy4Lu4X8QxmVnX7WgKfM8oN+nKYrPtZiz+Ty8KfJ+
 n6HSO0Lep2KIIfkpvXoIg/sOToLXNG7HD7OejguhddVuyQgxDw2nA7lP9TuhVQpmDmELeWDL6
 R+OETOILPYdbm0ktnGjI9Xf/Yoh4cy8SjaDwu42rptcow2X1/xBJsQVAJKB1ledPD05XM13wP
 +W3Qp0dUfliQfyH1AU6KshfgqXT3cdAMSexBBTwRsYoAiEtlmfS/q3kf0B9a1/406vN6CLxdK
 XQcKWO2JPtFNF4YACzbO+lMznHzHpJ8lZ0BFXYo0wOgwenbw+L/DVWqIK6YAVk6ksRwHM9pxa
 MisaKRLYD6tpGjdmNIx4BKV2oXa+Hv1Ll1UtwA+mxaRHaOKEJ77rDHsjNSeMrWxRbP469NBb2
 VBPUi1997RV08TSqwoXIbH04LW690Xc9J9aKNYL7TqsQ72u+QNUjlVkix2mJ/zN198voLSIOk
 aIFQnK4n9PR9Bnxo1Y1347fgTkD2oZXaHkE6++b1uAbsgHbPUSXmZfkv5pUrC4mFzKUHL3ay/
 Jd7LITVAjAnwsZPYurohv2SrIOVJNtakgXJJtKW1iA==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


