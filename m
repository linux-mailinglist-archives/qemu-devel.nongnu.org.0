Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5187B459136
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 16:22:59 +0100 (CET)
Received: from localhost ([::1]:45772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpB9m-0001AS-Fo
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 10:22:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mpB8Z-0000VC-T5
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:21:45 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:34619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mpB8R-0003bW-VI
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:21:38 -0500
Received: from [192.168.100.1] ([82.142.2.234]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MMoOy-1n7wRK2uA8-00Iij3; Mon, 22 Nov 2021 16:21:30 +0100
Message-ID: <290f4df5-fe4a-6665-89f8-69f958cf452c@vivier.eu>
Date: Mon, 22 Nov 2021 16:21:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] linux-user: implement more loop ioctls
Content-Language: fr
To: Andreas Schwab <schwab@suse.de>
References: <mvmzgpwmfxs.fsf@suse.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <mvmzgpwmfxs.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/nIPkWiApvhu1QJqh1dOwbhGCgnHKdEpEOMDTHrdXfEd3D51+Dc
 HEc4VOAymgvofMSk5jhoe+rvwCAVj4x2Sds7Hm2xAHXM9GZn5J6cVnlc25aPrhIrdcua9qO
 hl5Q4gOj03Pnk3h5EFSUFWwrELRk4LnUot02Lh7O3t50umArNnY53uB6oHJFc2Gv5NST7ri
 GJTcKyWMvc6lw5kE37CoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dJ/oonHWJME=:TWwdmMJHmiT7spCd0bhzpW
 he1ELM/+eobOpStarqXJbt5QS3a/dLDLQX51939Ns0tWQ68NbNwO8B7jQl/GHskfAV+yyY/vq
 4ZUKvseoMABUEVjF6AtqNMXKM1lhD/zET74XwzYFbd0SqDFNHa9xftToZrsH/5y80HR00Qy0c
 KkRkcsnPCr82YcYavs3Z1aFmhW13zGrQWbUnn1Fr2sgroKw6L6VMOc7Jwi9IQIz+/u7v/FDsI
 JjzPGDg7zWupn52JiXZNUt0pPvJsdOhjB5/dmlSXpi2TnVMm5APhmFbgxgArM2kYFK1enjEZE
 ezM9TdTPdC3wX6U1ePK7oEiR+goiy+hrOWcLX07p4zfsoR6G8bEmJYqTBUTrzvZZJLuwu0XTZ
 ydLNy0wNvl0s1YKRcvIDl/Ps37/rcPdBEvx49Sg/HYmL2Hai7LT3Z9FLSuub5s0YdSx7gPbyU
 rDvKP4efRYR2I+YzLVDIHuuzsYdLyp20m/6CstoAo+qqUXBRUO5Ovf2kUJo3RXG18f64flRvV
 5HY/pdLiRf3FFR/mUNTl1IIofzZdXAgCLm61WesOTxn3B+hx76FI8/FsaleXsHMgJW+ZezDTO
 YMhvFEYvyagKXhdGpZxbgz4adhtSI02UwxmG7yN0uS1Zr0JRJEx5Wjyk1vV3PPeENlrw9G2pu
 tP6yWaq0xMdzjn3KPz2BB713XWCRI5NZI2mkggXv6sxDWSAFBad/Xdr4z9no37stw9qY=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 22/11/2021 à 15:18, Andreas Schwab a écrit :
> LOOP_CONFIGURE is now used by losetup, and it cannot cope with ENOSYS.
> 
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>   linux-user/ioctls.h        | 4 ++++
>   linux-user/linux_loop.h    | 2 ++
>   linux-user/syscall_defs.h  | 4 ++++
>   linux-user/syscall_types.h | 6 ++++++
>   4 files changed, 16 insertions(+)
> 
> diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> index 7193c3b226..5ac5efc8aa 100644
> --- a/linux-user/ioctls.h
> +++ b/linux-user/ioctls.h
> @@ -637,6 +637,10 @@
>     IOCTL(LOOP_SET_STATUS64, IOC_W, MK_PTR(MK_STRUCT(STRUCT_loop_info64)))
>     IOCTL(LOOP_GET_STATUS64, IOC_R, MK_PTR(MK_STRUCT(STRUCT_loop_info64)))
>     IOCTL(LOOP_CHANGE_FD, 0, TYPE_INT)
> +  IOCTL(LOOP_SET_CAPACITY, 0, TYPE_INT)
> +  IOCTL(LOOP_SET_DIRECT_IO, 0, TYPE_INT)
> +  IOCTL(LOOP_SET_BLOCK_SIZE, 0, TYPE_INT)
> +  IOCTL(LOOP_CONFIGURE, IOC_W, MK_PTR(MK_STRUCT(STRUCT_loop_configure)))
>   
>     IOCTL(LOOP_CTL_ADD, 0, TYPE_INT)
>     IOCTL(LOOP_CTL_REMOVE, 0, TYPE_INT)
> diff --git a/linux-user/linux_loop.h b/linux-user/linux_loop.h
> index c69fea11e4..f80b96f1ff 100644
> --- a/linux-user/linux_loop.h
> +++ b/linux-user/linux_loop.h
> @@ -96,6 +96,8 @@ struct loop_info64 {
>   #define LOOP_CHANGE_FD		0x4C06
>   #define LOOP_SET_CAPACITY       0x4C07
>   #define LOOP_SET_DIRECT_IO      0x4C08
> +#define LOOP_SET_BLOCK_SIZE     0x4C09
> +#define LOOP_CONFIGURE          0x4C0A
>   
>   /* /dev/loop-control interface */
>   #define LOOP_CTL_ADD            0x4C80
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index a5ce487dcc..560a29afd8 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -1219,6 +1219,10 @@ struct target_rtc_pll_info {
>   #define TARGET_LOOP_SET_STATUS64      0x4C04
>   #define TARGET_LOOP_GET_STATUS64      0x4C05
>   #define TARGET_LOOP_CHANGE_FD         0x4C06
> +#define TARGET_LOOP_SET_CAPACITY      0x4C07
> +#define TARGET_LOOP_SET_DIRECT_IO     0x4C08
> +#define TARGET_LOOP_SET_BLOCK_SIZE    0x4C09
> +#define TARGET_LOOP_CONFIGURE         0x4C0A
>   
>   #define TARGET_LOOP_CTL_ADD           0x4C80
>   #define TARGET_LOOP_CTL_REMOVE        0x4C81
> diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
> index ba2c1518eb..7c46e4fb25 100644
> --- a/linux-user/syscall_types.h
> +++ b/linux-user/syscall_types.h
> @@ -201,6 +201,12 @@ STRUCT(loop_info64,
>          MK_ARRAY(TYPE_CHAR, 32),  /* lo_encrypt_key */
>          MK_ARRAY(TYPE_ULONGLONG, 2))  /* lo_init */
>   
> +STRUCT(loop_configure,

It should be named "loop_config", like int he kernel.

Except that:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

> +       TYPE_INT,                 /* fd */
> +       TYPE_INT,                 /* block_size */
> +       MK_STRUCT(STRUCT_loop_info64), /* info */
> +       MK_ARRAY(TYPE_ULONGLONG, 8)) /* __reserved */
> +
>   /* mag tape ioctls */
>   STRUCT(mtop, TYPE_SHORT, TYPE_INT)
>   STRUCT(mtget, TYPE_LONG, TYPE_LONG, TYPE_LONG, TYPE_LONG, TYPE_LONG,
> 


