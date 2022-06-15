Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1A554D194
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 21:27:22 +0200 (CEST)
Received: from localhost ([::1]:43530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Yfh-0006dS-UP
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 15:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1Ydg-0004u7-Vb
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 15:25:17 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:43575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1Yde-0003B8-FK
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 15:25:16 -0400
Received: by mail-ed1-x533.google.com with SMTP id x62so17593886ede.10
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 12:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Pet/E+YHK8Va+f+GuvBDwuN3mMYCvCrl+UAS+Z6XLbE=;
 b=VCk9HP53+9dBwwgJotEidMWffUZLC8Jfsdd5Om7RT6S2C7YiCRd7S/SPcPKbjN4pzJ
 ALraAAw0bfz/yKm//PgPqlZAh+PQ+htnkijxjxkFoKpCcE4ysFx9URWNvU4MvwHWncUf
 llMaliSx6/8v/hh0W+67FFi34WYoONIuJX6aVGXFfwKIarppR2v3hcExy3ibXZVEc3bC
 Nb6zkDux7/scJ+xTrVLIO06LBRy9IX1n0AvgIa5N7rMRwSbNg9Ny/vCP5IsVzdNGO0Oz
 9CMD1Xu665R8+CqMjSwkmUXLxdbS3VBj0lJr3e1YxoiUI6/c+tkhxi/IRhQyafXhY9lQ
 QlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Pet/E+YHK8Va+f+GuvBDwuN3mMYCvCrl+UAS+Z6XLbE=;
 b=dJIuHYJ+ZjfJQa6czO7fUIQEXCgR/tStxLAhWJ256do6f/Hpn+6kcg+ZXZQuDcAR63
 EZIwURbr17G4uDTU4Gdx97bEm0cqo6QccaKPizxBhz39wW3clj1K5xkt8npFOnnC1eku
 dStitRouM15d/bImjEca4dBdhUze7Y7vfyf/rKf8cYPDnZh7V7aH80QQRZ6ooTya8i1K
 RakkCqwHt/GqY12DdCUekKocnOowxxCcpS0uPNXvY43eEPw8O/l+sfUqJKNgQ4MkoG0B
 aQOwuyT0MKLvJKY0QKZcM1xooDkmsv0w1Dr+WFemo3DYO0G6vKWHHahFfs19LKl5HDUq
 ndBw==
X-Gm-Message-State: AJIora8k9Cs1icFqgsTa7NSTWmgHlIX782Jxyvh/iHi1pZ3v429KbIpb
 I4HfDXbUrHqOs7xbRTojZM4=
X-Google-Smtp-Source: AGRyM1uSS7tEgytGoiWIi9pdasz8BA0k/VFJ5ILCp5G9F/J0dnBXaVJ76MT6rqV7lXrPmv4yBD4D3w==
X-Received: by 2002:a05:6402:35d0:b0:42e:1a76:67ae with SMTP id
 z16-20020a05640235d000b0042e1a7667aemr1626989edc.311.1655321111916; 
 Wed, 15 Jun 2022 12:25:11 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 g3-20020a056402424300b0042bd75c53casm10285679edb.83.2022.06.15.12.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 12:25:11 -0700 (PDT)
Message-ID: <2d3b3efb-a70a-954b-bf85-1d5718cbf731@redhat.com>
Date: Wed, 15 Jun 2022 21:25:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 3/7] Remove prefixes from path configuration macros
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20220615155634.578-1-akihiko.odaki@gmail.com>
 <20220615155634.578-4-akihiko.odaki@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220615155634.578-4-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/22 17:56, Akihiko Odaki wrote:
> The path configuration macros are often supplied to
> get_relocated_path(), and the function had some logics to remove the
> prefixes.
> 
> With this change, the prefixes are removed from those macros and
> get_relocated_path() is also simplified.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

This doesn't work if somebody configures with --prefix=/usr 
--libexecdir=/usr/libexec.  Adding the prefixes in meson.build was done 
as a canonicalization step so that the C code has less cases to care about.

Paolo

> ---
>   include/qemu/cutils.h |  2 +-
>   meson.build           | 21 ++++++++++-----------
>   qemu-options.hx       | 11 +++++------
>   util/cutils.c         | 34 +++++++---------------------------
>   4 files changed, 23 insertions(+), 45 deletions(-)
> 
> diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
> index 40e10e19a7e..57de1da5c95 100644
> --- a/include/qemu/cutils.h
> +++ b/include/qemu/cutils.h
> @@ -207,7 +207,7 @@ const char *qemu_get_exec_dir(void);
>    *
>    * Returns a path for @dir that uses the directory of the running executable
>    * as the prefix.  For example, if `bindir` is `/usr/bin` and @dir is
> - * `/usr/share/qemu`, the function will append `../share/qemu` to the
> + * `share/qemu`, the function will append `../share/qemu` to the
>    * directory that contains the running executable and return the result.
>    * The returned string should be freed by the caller.
>    */
> diff --git a/meson.build b/meson.build
> index 0c2e11ff071..01d5e32615e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1679,18 +1679,17 @@ config_host_data.set_quoted('CONFIG_TLS_PRIORITY', get_option('tls_priority'))
>   if iasl.found()
>     config_host_data.set_quoted('CONFIG_IASL', iasl.full_path())
>   endif
> -config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') / get_option('bindir'))
> +config_host_data.set_quoted('CONFIG_BINDIR', get_option('bindir'))
>   config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
> -config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_confdir)
> -config_host_data.set_quoted('CONFIG_QEMU_DATADIR', get_option('prefix') / qemu_datadir)
> -config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
> -config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('prefix') / get_option('qemu_firmwarepath'))
> -config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('prefix') / get_option('libexecdir'))
> -config_host_data.set_quoted('CONFIG_QEMU_ICONDIR', get_option('prefix') / qemu_icondir)
> -config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', get_option('prefix') / get_option('localedir'))
> -config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') / get_option('localstatedir'))
> -config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') / qemu_moddir)
> -config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') / get_option('sysconfdir'))
> +config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', qemu_confdir)
> +config_host_data.set_quoted('CONFIG_QEMU_DATADIR', qemu_datadir)
> +config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('qemu_firmwarepath'))
> +config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('libexecdir'))
> +config_host_data.set_quoted('CONFIG_QEMU_ICONDIR', qemu_icondir)
> +config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', get_option('localedir'))
> +config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('localstatedir'))
> +config_host_data.set_quoted('CONFIG_QEMU_MODDIR', qemu_moddir)
> +config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('sysconfdir'))
>   
>   if config_host.has_key('CONFIG_MODULES')
>     config_host_data.set('CONFIG_STAMP', run_command(
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 377d22fbd82..f0ae8f44ff2 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2661,12 +2661,11 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>       "         [,poll-us=n]\n"
>       "                configure a host TAP network backend with ID 'str'\n"
>       "                connected to a bridge (default=" DEFAULT_BRIDGE_INTERFACE ")\n"
> -    "                use network scripts 'file' (default=" DEFAULT_NETWORK_SCRIPT ")\n"
> -    "                to configure it and 'dfile' (default=" DEFAULT_NETWORK_DOWN_SCRIPT ")\n"
> -    "                to deconfigure it\n"
> +    "                use custom network script 'file' to configure it (optional)\n"
> +    "                use custom network script 'dfile' to deconfigure it (optional)\n"
>       "                use '[down]script=no' to disable script execution\n"
> -    "                use network helper 'helper' (default=" DEFAULT_BRIDGE_HELPER ") to\n"
> -    "                configure it\n"
> +    "                use custom network helper 'helper' to\n"
> +    "                configure it (optional)\n"
>       "                use 'fd=h' to connect to an already opened TAP interface\n"
>       "                use 'fds=x:y:...:z' to connect to already opened multiqueue capable TAP interfaces\n"
>       "                use 'sndbuf=nbytes' to limit the size of the send buffer (the\n"
> @@ -2684,7 +2683,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>       "-netdev bridge,id=str[,br=bridge][,helper=helper]\n"
>       "                configure a host TAP network backend with ID 'str' that is\n"
>       "                connected to a bridge (default=" DEFAULT_BRIDGE_INTERFACE ")\n"
> -    "                using the program 'helper (default=" DEFAULT_BRIDGE_HELPER ")\n"
> +    "                using the custom program 'helper' (optional)\n"
>   #endif
>   #ifdef __linux__
>       "-netdev l2tpv3,id=str,src=srcaddr,dst=dstaddr[,srcport=srcport][,dstport=dstport]\n"
> diff --git a/util/cutils.c b/util/cutils.c
> index a58bcfd80e7..983db97b4df 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -917,13 +917,6 @@ int qemu_pstrcmp0(const char **str1, const char **str2)
>       return g_strcmp0(*str1, *str2);
>   }
>   
> -static inline bool starts_with_prefix(const char *dir)
> -{
> -    size_t prefix_len = strlen(CONFIG_PREFIX);
> -    return !memcmp(dir, CONFIG_PREFIX, prefix_len) &&
> -        (!dir[prefix_len] || G_IS_DIR_SEPARATOR(dir[prefix_len]));
> -}
> -
>   /* Return the next path component in dir, and store its length in *p_len.  */
>   static inline const char *next_component(const char *dir, int *p_len)
>   {
> @@ -967,7 +960,7 @@ void qemu_init_exec_dir(const char *argv0)
>       if (access(buf, R_OK) == 0) {
>           exec_dir = g_strdup(buf);
>       } else {
> -        exec_dir = CONFIG_BINDIR;
> +        exec_dir = CONFIG_PREFIX G_DIR_SEPARATOR_S CONFIG_BINDIR;
>       }
>   #else
>       char *p = NULL;
> @@ -1038,7 +1031,7 @@ void qemu_init_exec_dir(const char *argv0)
>       if (p) {
>           exec_dir = g_path_get_dirname(p);
>       } else {
> -        exec_dir = CONFIG_BINDIR;
> +        exec_dir = CONFIG_PREFIX G_DIR_SEPARATOR_S CONFIG_BINDIR;
>       }
>   #endif
>   }
> @@ -1050,39 +1043,26 @@ const char *qemu_get_exec_dir(void)
>   
>   char *get_relocated_path(const char *dir)
>   {
> -    size_t prefix_len = strlen(CONFIG_PREFIX);
>       const char *bindir = CONFIG_BINDIR;
>       const char *exec_dir = qemu_get_exec_dir();
>       GString *result;
> -    int len_dir, len_bindir;
> +    int len_bindir;
>   
>       /* Fail if qemu_init_exec_dir was not called.  */
>       assert(exec_dir[0]);
> -    if (!starts_with_prefix(dir) || !starts_with_prefix(bindir)) {
> -        return g_strdup(dir);
> -    }
>   
>       result = g_string_new(exec_dir);
>   
> -    /* Advance over common components.  */
> -    len_dir = len_bindir = prefix_len;
> -    do {
> -        dir += len_dir;
> -        bindir += len_bindir;
> -        dir = next_component(dir, &len_dir);
> -        bindir = next_component(bindir, &len_bindir);
> -    } while (len_dir && len_dir == len_bindir && !memcmp(dir, bindir, len_dir));
> -
>       /* Ascend from bindir to the common prefix with dir.  */
> +    len_bindir = 0;
>       while (len_bindir) {
>           bindir += len_bindir;
>           g_string_append(result, "/..");
>           bindir = next_component(bindir, &len_bindir);
>       }
>   
> -    if (*dir) {
> -        assert(G_IS_DIR_SEPARATOR(dir[-1]));
> -        g_string_append(result, dir - 1);
> -    }
> +    g_string_append_c(result, G_DIR_SEPARATOR);
> +    g_string_append(result, dir);
> +
>       return g_string_free(result, false);
>   }


