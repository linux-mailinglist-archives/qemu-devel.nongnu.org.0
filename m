Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5E231ADAC
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 20:08:17 +0100 (CET)
Received: from localhost ([::1]:58466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB0HA-0003mU-Ub
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 14:08:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB0GM-0003GV-EG; Sat, 13 Feb 2021 14:07:26 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:32987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB0GK-0002oD-Po; Sat, 13 Feb 2021 14:07:26 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MQuPJ-1lZ0tq04DX-00O0Pc; Sat, 13 Feb 2021 20:07:21 +0100
Subject: Re: [PATCH 1/1] linux-user/syscall: Fix do_ioctl_ifconf() for 64 bit
 targets.
To: Stefan <stefan-guix@vodafonemail.de>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <60AA0765-53DD-43D1-A3D2-75F1778526F6@vodafonemail.de>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <41550866-9e87-3738-2ad5-7ee22b488cf5@vivier.eu>
Date: Sat, 13 Feb 2021 20:07:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <60AA0765-53DD-43D1-A3D2-75F1778526F6@vodafonemail.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:U3Ex93LVd6ywYVGbNDYAlzppaIjgfdG4e1QRHEpG369E9dgJoTq
 Xi1ME1voAvA7U4SlqCGddhaYYs6/SeJXCqmTnJpG/vTzCLJn6tm0Sr3xvf2mcUkA1z5FcCb
 1TDaOXskX0nBDnRdpe6r72ocnBGAAVksGmUSbWm93DB7FYzF0C5anplFugUvnBO77YVj8Ea
 AjGY8uL2QBU4nLjip/0ag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vtT8nLUUEyU=:dJ1/Uy+juQdsucBJ6f5Ce4
 ll4JT9uYbuI+ChOaWwz+IeGUSLC8uBei2eNudhKf0n3ZOMwFTfkPtTiEJsilZMVctN6KvtOPL
 RckshaFAI8D7zgwbBmIJstiHXobKlpM4l4Kzpw3gJ0izO+pB2sb/fSc4QM18fUSMpp7rNNpMQ
 0Pcl0OR9FxWP8lvuzl4dkloTNiryoaneRmVCrgYk/JV6FpE8uBuHkOZV56mpTaxG1MCuNjV5v
 VpglZ0Rb+j5BrDsCTqoJ5z63b1vrfXeTdcY2SNeaoJTw9cehujtXR3nktwJ1JmcVSQOmiLA9U
 RULgVONRKnVoB2xCS3hsKoDIDsUfGQfkpX3maTo+YvIGGmizBBbPJMS/P9NtfGxbgQDHzIUhM
 qChbDwfSvCK51aUP7274OK+we4Gwt0w1ZYcVhJ+VWMJ6diFeYyo2VMGh7yDcnVWh9vwmVOCld
 +fHpYaplEQ==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

