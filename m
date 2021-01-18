Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7090A2FA272
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 15:05:04 +0100 (CET)
Received: from localhost ([::1]:42166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1V9T-0003km-GZ
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 09:05:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1V83-0002uj-Hl; Mon, 18 Jan 2021 09:03:35 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:49583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1V7y-0000ua-HN; Mon, 18 Jan 2021 09:03:35 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MN4ux-1lHmxM3Ebl-00J4WB; Mon, 18 Jan 2021 15:03:25 +0100
Subject: Re: [PATCH 1/1] linux-user/syscall: Fix do_ioctl_ifconf() for 64 bit
 targets.
To: Stefan <stefan-guix@vodafonemail.de>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <60AA0765-53DD-43D1-A3D2-75F1778526F6@vodafonemail.de>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <57408fa3-8201-b8b5-aa8d-50448a010f43@vivier.eu>
Date: Mon, 18 Jan 2021 15:03:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <60AA0765-53DD-43D1-A3D2-75F1778526F6@vodafonemail.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5JOWgh5VSgf59pRBkIIxIqCsIbVBxh3f1FstNrxe0qV6GJ4STHQ
 24rOe2LJLYPafqbHg0G1HVgkQwLVhuYDP3REjXft44IC1i+kIJDE/5BlzgRqBbyuuhpVsVP
 K/NVnUEELQra8kDRKIDyhakNVhQAf7Hretr659TnQBFy3Cp9JeI/3yCirX9MXh6k8oSPg/u
 fnj2/tJOZcNjeEJwfEeUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:W6pa453V+vw=:TlwS8fpOfVChEY3SXU/GLR
 SkPjJzMQ77gR6jfzn7uAK+Gzc7RC5WE9r4P/YkSAa0bHjJxrKNQThWqq3Zs4jwX2sc2OeAVPG
 fnT0qdzB+bws5YWgsjU9fVjYrTITTvI6s9Q+SnXyHDUbn4rnaf7gBHQWGfIkvHdL9fvJ1vb6r
 xRjpzJ/+obUVAULQXIMlxkjOwaer6Js6DP/t36+iczzQgzCQapdxQfa2ciIB9suI32lBbcFZf
 bKRmYtHd8OHqLCsr6FbkYGvm1wQ8JFU0EqItNpMc4m1bnKAourP+Lw6ad9Y6IczSztm88fwew
 JV8jqv0331Y6NSIIevf1auudTLgaR0ZSIIsrTO4tnrCilOo/nH4wdI20Vm8U4M+NkfmMG4Tm3
 RKr7UN3MsEYJOCgOGWJLB+ITArxrRK48Uh0PE9udTOTZyzElqPLrxXV66Nbl4uuWPv9Xs137w
 INcjrRd3Pw==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.194,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/01/2021 à 19:59, Stefan a écrit :
> The sizeof(struct ifreq) is 40 for 64 bit and 32 for 32 bit architectures.
> This structure contains a union of other structures, of which struct ifmap
> is the biggest for 64 bit architectures. Calling ioclt(…, SIOCGIFCONF, …)
> fills a struct sockaddr of that union, and do_ioctl_ifconf() only considered
> that struct sockaddr for the size of the union, which has the same size as
> struct ifmap on 32 bit architectures. So do_ioctl_ifconf() assumed a wrong
> size of 32 for struct ifreq instead of the correct size of 40 on 64 bit
> architectures.
> 
> The fix makes do_ioctl_ifconf() handle struct ifmap as the biggest part of
> the union, treating struct ifreq with the correct size.
> 
> Signed-off-by: Stefan <stefan-guix@vodafonemail.de>
> ---
>   linux-user/syscall.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index d182890ff0..15a6abadc1 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -4902,6 +4902,7 @@ static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
>       struct ifconf *host_ifconf;
>       uint32_t outbufsz;
>       const argtype ifreq_arg_type[] = { MK_STRUCT(STRUCT_sockaddr_ifreq) };
> +    const argtype ifreq_max_type[] = { MK_STRUCT(STRUCT_ifmap_ifreq) };

Why don't you simply replace STRUCT_sockaddr_ifreq by STRUCT_ifmap_ifreq rather than introducing a
new constant?

>       int target_ifreq_size;
>       int nb_ifreq;
>       int free_buf = 0;
> @@ -4925,7 +4926,7 @@ static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
>   
>       host_ifconf = (struct ifconf *)(unsigned long)buf_temp;
>       target_ifc_buf = (abi_long)(unsigned long)host_ifconf->ifc_buf;
> -    target_ifreq_size = thunk_type_size(ifreq_arg_type, 0);
> +    target_ifreq_size = thunk_type_size(ifreq_max_type, 0);
>   
>       if (target_ifc_buf != 0) {
>           target_ifc_len = host_ifconf->ifc_len;
> 

In the "if (!is_error(ret))", why don't you use the same size with the part that copies back the
values to the user?

Thanks,
Laurent


