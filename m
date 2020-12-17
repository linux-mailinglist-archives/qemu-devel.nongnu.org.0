Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2312DCEFB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 11:00:36 +0100 (CET)
Received: from localhost ([::1]:36474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpq5L-0007LD-9i
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 05:00:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kppnC-0005nf-Ki
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:50 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:39379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kppn9-00082t-RD
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:50 -0500
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N7hw4-1k34cw1JRa-014ns7; Thu, 17 Dec 2020 10:41:40 +0100
Subject: Re: [PATCH] linux-user/elfload: Fix handling of pure BSS segments
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20201118165206.2826-1-steplong@quicinc.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <564a4aca-4367-f3e8-1994-fe55ac4a3aa4@vivier.eu>
Date: Thu, 17 Dec 2020 10:41:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201118165206.2826-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QzyTjTkIu+GudLTZ8jOmem3gC7GLLiCAHuIUtkO84se25X2Rska
 HW0V004oOrYXyVebJ2YL5tClbSOkuNgjA27mAPMDSHFGA9UYclFv/PBSeAqCZnjYRPdAyEV
 LXe3NXihd+f3XtMs88ki82Ar2wFKLcZL/ZOv9q+FN07UEUy/Sh4T9As8nHW4N1VF1SNsKww
 BXrVbowVAHtzzCzHxPv1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lzMIDah8Glo=:1RjQ1CClrPplCS7mjZT60A
 YN8Gfoayl2PVmFwaGtwqCwbC3c39/VnXcQZ9POgdHmgeN0Zcaz6wiIK1Gp55o50SOtQwWaTTk
 7ECw5oiewI4MW/FjsNankFJlZjOZhh4l01edecXryKPz+U3sGZ47hnqjmgWDYZXgP+v+khjxL
 shHZ05aD6mdIubnENLrRejDFfbDzPOyKu8udsav5yDpTCpY0qUM6ADwnCtDTS7gJE6EjTTdOG
 i4blrrl9N7q9xFCYIYZmKf1Rr2+/M7WOaFQY1mMDYgD8+CN4CmL4Hj9wxVchiuItf8ZvfDqEJ
 0D5t8grjl86lxNlTjdM31E6BSqt4pGmc0FrWJ6YWQSxIq9pkwH8WcEEh9GbdAm0ZrAk/gnTeW
 k1tLqFE2mDPIeTsCPPaU6RBD9twfz/aLJX15pHm5INWoCyFZoImoTEp62+/tvVlemn1bmSOen
 i+alojp4lg==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
Cc: mjt@tls.msk.ru, richard.henderson@linaro.org,
 philippe.mathieu.daude@gmail.com, ben@decadent.org.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/11/2020 à 17:52, Stephen Long a écrit :
> qemu-user fails to load ELFs with only BSS and no data section
> 
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> ---
> 
> Submitting this on behalf of Ben Hutchings. Feel free to edit the commit
> msg.
> 
>  linux-user/elfload.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 0b02a92602..af16d94c61 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2783,7 +2783,7 @@ static void load_elf_image(const char *image_name, int image_fd,
>               * segment, in that case just let zero_bss allocate an empty buffer
>               * for it.
>               */
> -            if (eppnt->p_filesz != 0) {
> +            if (vaddr_len != 0) {
>                  error = target_mmap(vaddr_ps, vaddr_len, elf_prot,
>                                      MAP_PRIVATE | MAP_FIXED,
>                                      image_fd, eppnt->p_offset - vaddr_po);
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent


