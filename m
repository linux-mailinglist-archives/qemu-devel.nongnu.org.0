Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4FE3ADEFF
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 16:17:36 +0200 (CEST)
Received: from localhost ([::1]:43524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luyGV-0007wF-4J
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 10:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyFA-0007FP-Pf
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:16:12 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:54573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyF8-0003Ol-DK
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:16:12 -0400
Received: from [192.168.100.1] ([82.142.1.74]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MGi6m-1m7foj2P7i-00Dq4V; Sun, 20 Jun 2021 16:16:07 +0200
Subject: Re: [PATCH v2 02/11] linux-user: Fix the execfd case of
 /proc/self/exe open
To: YAMAMOTO Takashi <yamamoto@midokura.com>, qemu-devel@nongnu.org
References: <20210531055019.10149-1-yamamoto@midokura.com>
 <20210531055019.10149-3-yamamoto@midokura.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <465df811-e6d8-2bfd-5ebe-1ebf85fa5c99@vivier.eu>
Date: Sun, 20 Jun 2021 16:16:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210531055019.10149-3-yamamoto@midokura.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sKL6VI4roqgeP0KC3KTU0BP2wrml1PrmjRgKkuxO0x7BR3G0TCv
 +anQh2ulbr5q+uxv/hEraqbiu5Nh2UhwfvL7lv8XVd6aVO6fBKx26LlHbGZVPJ5u5oCMuk8
 slzrSoWvJecl7dGb/+vvjGE0DtK2PPFFfQ6o8bfjmuBjBL95K+WvNIcEWX6pUJ8zACRVJA6
 763ZX+fFjRAUDt36eDI6w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A82QDiAU5gE=:ewraNObEsxsCgh1xXMFe+p
 EdYQQtAJori7CXNHE7vciNbNCZoUACERuEopHakKBX0F+1shvMvcAevt+N0PLHhASafjdqP6c
 hDgUjYEeYeohxK3V8fZ4XIzw2QMg3WMJrWvbRChSfY6NCaLePZjXtzwb2SssxiD9TTg+P0lI/
 EqyTjxFeyQxxKhql50Yd5iFj3NQh5Tvy7CN4Hh14LsGKq8jB56/U21D51cMJHGy9Hur/u7vg7
 23pSWMZrZBAnSi1P+Fj8EwoDJXd/VmNeOfbR8/VrKfmRTJG9NW5F8RdqDfc7PacouESO2Qdco
 MuARIzxCjtmOOoR8ErBQpTgsTqhByGJo46uKyLTYwCoNVrbvwXSjUMja+wJgT+Ak3iWw1NP7t
 MbhOkLqmlF0caLRZwT860HsrBxO2RtnNW6rXupLb7ivTQbxXNliWJs/wOI/30NTqAXpW8hnnh
 crEzZQQFS3J5xOvYX5roA406MHrgJmZXpI70jAiqhtPqcXl19hwfSe0/SUWseptlU0ocdxWCK
 rjAAVxtNDoXrRnnSC5xJik=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 31/05/2021 à 07:50, YAMAMOTO Takashi a écrit :
> It's problematic to return AT_EXECFD as it is because the user app
> would close it.
> This patch opens it via /proc/self/fd instead.
> 
> Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
> ---
>  linux-user/syscall.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index a2b03ecb8b..14a63518e2 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8118,7 +8118,17 @@ static int do_openat(void *cpu_env, int dirfd, const char *pathname, int flags,
>  
>      if (is_proc_myself(pathname, "exe")) {
>          int execfd = qemu_getauxval(AT_EXECFD);
> -        return execfd ? execfd : safe_openat(dirfd, exec_path, flags, mode);
> +        if (execfd) {
> +            char filename[PATH_MAX];
> +            int ret;
> +
> +            snprintf(filename, sizeof(filename), "/proc/self/fd/%d", execfd);
> +            ret = safe_openat(dirfd, filename, flags, mode);
> +            if (ret != -1) {
> +                return ret;
> +            }
> +        }
> +        return safe_openat(dirfd, exec_path, flags, mode);
>      }
>  
>      for (fake_open = fakes; fake_open->filename; fake_open++) {
> 

I think a dup() would be more appropriate, or explain why not.

Thanks,
Laurent

