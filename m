Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD722C4FAA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 08:45:52 +0100 (CET)
Received: from localhost ([::1]:58722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiByQ-0007Nc-P6
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 02:45:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kiBwu-0006vq-Vl
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 02:44:16 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:37819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kiBwl-00027q-QT
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 02:44:16 -0500
Received: from [192.168.100.1] ([82.252.158.14]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MNwXA-1kt61y3kiG-00OEqb; Thu, 26 Nov 2020 08:44:03 +0100
Subject: Re: [PATCH] linux-user/mmap.c: check range of mremap result in target
 address space
To: Tobias Koch <tobias.koch@nonterra.com>, qemu-devel@nongnu.org
References: <20201028213833.26592-1-tobias.koch@nonterra.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <bb5a2731-f699-9c08-3636-b648fc76b8ce@vivier.eu>
Date: Thu, 26 Nov 2020 08:44:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201028213833.26592-1-tobias.koch@nonterra.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Y7nBuM/nvCzHua+h00E7XQmsgWl+ko052SeSUdlVxPASFRXyttM
 WGHnMBYxRIhTjf3seq+6hyUA4PfnDhpRLXcyDQUqJJ9TRzw1xGqADVSB++NVijTTCsYtLLM
 k6nZcjjT8+8uwUNMgYPLTzKYK1CMqvbFT4gWbBmG1w9rOh48y5T35IvwMWj51hbh7Pj84Sy
 /O8zPRv5ZR4hpcZfv4OSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UKwC2S1T7h0=:HC8Br/i7iwaUPcoj/mHNGp
 4uvapdW7qRFKe7kCydgZONumhVM7SoiKLUoh3OQecZcOzR3sqLTWP2gNcBT1SIIVdVTSNup+4
 cv3F68RBQgcnJOJK4NwbC5W1GxH+bFPrMbTCb2ULV58F7H6gcQB4FBoUyZYF0EKuuqs2cOVZh
 Fp7yGxhthbAsix1e8XaHrb1HVEytiMWneoyi5JI0YDy7nnxKV5YcTpkppDndxTsa2Y0YSNA9J
 DudryWajhjtjoSPsex2+JgoXuAqF96GXoLJzH7EGHmo1kL0BQelrBXRJzMSPzMPjPxRgXETZU
 beFcrAJy4QobsVsLtksslOGk05OyHV7wEfxifdWTlhIZx7tdNKKma2dFcmTqbQhktGGGmNgOL
 pykcJZ6PNVrR0h9VWmwNYr01ewa3EFIfYtHhnIj7XUINEd3RjW1R8bieoFiyJ
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

Le 28/10/2020 à 22:38, Tobias Koch a écrit :
> If mremap succeeds, an additional check is performed to ensure that the
> new address range fits into the target address space. This check was
> previously perfomed in host address space, with the upper bound fixed to
> abi_ulong.
> 
> This patch replaces the static check with a call to `guest_range_valid`,
> performing the range check against the actual size of the target address
> space. It also moves the corresponding block to prevent it from being
> called incorrectly when the mapping itself fails.
> 
> Signed-off-by: Tobias Koch <tobias.koch@nonterra.com>
> ---
>  linux-user/mmap.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index f261563420..101bd013a1 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -751,20 +751,23 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
>          }
>          if (prot == 0) {
>              host_addr = mremap(g2h(old_addr), old_size, new_size, flags);
> -            if (host_addr != MAP_FAILED && reserved_va && old_size > new_size) {
> -                mmap_reserve(old_addr + old_size, old_size - new_size);
> +
> +            if (host_addr != MAP_FAILED) {
> +                /* Check if address fits target address space */
> +                if (!guest_range_valid(h2g(host_addr), new_size)) {
> +                    /* Revert mremap() changes */
> +                    host_addr = mremap(g2h(old_addr), new_size, old_size,
> +                                       flags);
> +                    errno = ENOMEM;
> +                    host_addr = MAP_FAILED;
> +                } else if (reserved_va && old_size > new_size) {
> +                    mmap_reserve(old_addr + old_size, old_size - new_size);
> +                }
>              }
>          } else {
>              errno = ENOMEM;
>              host_addr = MAP_FAILED;
>          }
> -        /* Check if address fits target address space */
> -        if ((unsigned long)host_addr + new_size > (abi_ulong)-1) {
> -            /* Revert mremap() changes */
> -            host_addr = mremap(g2h(old_addr), new_size, old_size, flags);
> -            errno = ENOMEM;
> -            host_addr = MAP_FAILED;
> -        }
>      }
>  
>      if (host_addr == MAP_FAILED) {
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

