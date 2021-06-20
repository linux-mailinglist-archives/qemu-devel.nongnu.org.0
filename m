Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCC43ADEFB
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 16:15:21 +0200 (CEST)
Received: from localhost ([::1]:40794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luyEK-0005zb-BZ
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 10:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyDN-0005JT-JI
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:14:21 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:53393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyDK-0002EG-F1
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:14:21 -0400
Received: from [192.168.100.1] ([82.142.1.74]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MGQzj-1m4dFC0BXJ-00Gsed; Sun, 20 Jun 2021 16:14:15 +0200
To: YAMAMOTO Takashi <yamamoto@midokura.com>, qemu-devel@nongnu.org
References: <20210531055019.10149-1-yamamoto@midokura.com>
 <20210531055019.10149-2-yamamoto@midokura.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 01/11] linux-user: handle /proc/self/exe for execve
Message-ID: <5c344989-6b77-5cb7-4e2d-953350fe9834@vivier.eu>
Date: Sun, 20 Jun 2021 16:14:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210531055019.10149-2-yamamoto@midokura.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JaGJre09R2Ck8xEFvaokV1sxp1ijkjVwJNsLl2f0Pi91Lvxrtoo
 YJqzQAQRpPMovOJyQb3l7wVD9I2ASI0iQ1MZj42D9klQ3cAFFiSLPVUHYHp+cZG8V2AMm3c
 iLDASoxkleZ1Juc6N9TIHT4L9j/s3KGszo1dlReXiChw7+/d34UtrhRuDdEUPnrJmRxN4WG
 3m/yjghuzfM765hV6mdug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:d1n/KJpBsgc=:U1falFVHoiehw9i7J2t6yY
 d9odasO1aZN1FcqsrTnuz+acAEW+j+7TmmH2KVC9xPx2jO1u3TUlW8kVSxJFJpcrTdmUjbOKa
 gtxK0xqq4kJ5QBXH8ixFj34cKlNDhVBnnhI+sW/mcBd+UgRgwkLHH0PejtED2pD+1QqfNv77c
 akWl7kLaZvcrYZ1CuAjko8H5iRoH79cw5l3ICW2ozUqJMbbMQytGjA8SRjsAt6j+VkJFgrsOf
 xhlIqTbhnC+2TxWjy9DV7YY2F68rUHlGbUOgdA0VazYFHLDXYDGoD2p+wVPgcDESI9NSr8a+G
 2uI7lr5zB87kCNZhAUh39GRe+BxcFF46UUjJBuPL9RvYsJDq+N3wG1AoUYeBc4/ByDqK/MRHE
 K6KDXvYbaeDPSdxhJ6lBfz2t77DfMF8SHiDQk2G2gH6UOcuF1kNdmvlVBQcOJQEQLoCuqpdbp
 4B00HFGSPL95dSFKn44T7nlTdaQGpHyLDfehjZTyqflbRsZa4os3IgAlNrd/8wOlaVk/KNp78
 Kuwe75Q6lA2ZZOa+iB8OM8=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Le 31/05/2021 à 07:50, YAMAMOTO Takashi a écrit :
> It seems somehow common to execve /proc/self/exe in docker
> or golang community these days.
> At least, moby "reexec" and runc "libcontainer" do that.
> 
> Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
> ---
>  linux-user/syscall.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index c9f812091c..a2b03ecb8b 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8470,6 +8470,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>  #endif
>      case TARGET_NR_execve:
>          {
> +            const char *path;
>              char **argp, **envp;
>              int argc, envc;
>              abi_ulong gp;
> @@ -8537,7 +8538,11 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>               * before the execve completes and makes it the other
>               * program's problem.
>               */
> -            ret = get_errno(safe_execve(p, argp, envp));
> +            path = p;
> +            if (is_proc_myself(path, "exe")) {
> +                path = exec_path;
> +            }
> +            ret = get_errno(safe_execve(path, argp, envp));
>              unlock_user(p, arg1, 0);
>  
>              goto execve_end;
> 

The problem here is QEMU can fail to execute the file directly.

The binary can be launched with binfmt_misc and the 'O' flag:

     ``O`` - open-binary
            Legacy behavior of binfmt_misc is to pass the full path
            of the binary to the interpreter as an argument. When this flag is
            included, binfmt_misc will open the file for reading and pass its
            descriptor as an argument, instead of the full path, thus allowing
            the interpreter to execute non-readable binaries. This feature
            should be used with care - the interpreter has to be trusted not to
            emit the contents of the non-readable binary.

You should use do_openat() (that resolves the /proc/self/exe path) and fexecve().

Thanks,
Laurent

