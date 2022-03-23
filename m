Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E047A4E5A80
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 22:12:56 +0100 (CET)
Received: from localhost ([::1]:38336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX8Hn-0002yy-Iq
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 17:12:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX8Gy-0002Iq-5C
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 17:12:04 -0400
Received: from [2607:f8b0:4864:20::102a] (port=35356
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX8Gw-0001q1-Hz
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 17:12:03 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 mj15-20020a17090b368f00b001c637aa358eso7639044pjb.0
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 14:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x7XuOxtxUFegqKS/fRJPhw+dRsNHRbfBZ5omnv76mAw=;
 b=dA9QpeBlFWBtLbEClT73VHd8JVok9mosvk/NCa2iAs4ZKNJ1xkfBCrNr0/msmTmflD
 OPM0DGY9o8MbNw9EfBzKHVHPq37in7fId4dFk9iK565Ipi9YBba6jA8VcJrXUelaZtuJ
 O2DPBfrm/F+NUymkSqHy75GN8jnR4zBsThsaBNmMW1zeKiHjDNms7dOJZnzrOsNwDKD4
 QbfwuhsLfOOajrwTvapxGLF4RZCI1f1g+Rztr/Qw0T6Rv5XG9fwvyeB6yXUTv3mz8qzl
 OO/IhM04CrAJO2AHDvt4FrhwSDAEESw1cNRC7t7e1Mp9YE9ys8QsAAvsmZGJ+CzIus2W
 mdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x7XuOxtxUFegqKS/fRJPhw+dRsNHRbfBZ5omnv76mAw=;
 b=qjq75K4QghEZ70YMARlDx/X7HpfdrrPBjZR3ZHKglTEWbTzJ8is4F+hEhZSoVvqXxA
 m6fSwn3tQ/+gvxJQKHYVTgqBC28k9S38I/zmd7usrWxu6wo2R7V8JAcToi9USTDf1cdx
 ZotkMHb/mIjgAwG/8YGzBvBZenUed/95+vKnQ3lEdgKfqUJD0DEVXXApP06TyrvhCBGh
 YoF/TfmXRLXwQ8sefrDODNWhKkQcnH1mXDoH6VW20pvYQNv6FG1WHMEqbSZgIIHy4gnA
 DeibE7dv3BejDNUyQ2iBXC06km+d2ocUis7JenyECecySg3OE6LWAwZCxuUC71EftZQw
 LP1Q==
X-Gm-Message-State: AOAM533cDwarPREPNDkDYP7LZ5+sG/YhO2yYH2T3AR8RJQgkY0ZH7wS6
 DmBeAc8NRG1YmA7VSSsD/Ug=
X-Google-Smtp-Source: ABdhPJwR5z/W8bsN+RBWCAzZVlgahqNvWkGoDh65/mT4/CPGj6HHV7KSP3UDbImaDz1Up5/8iVctnQ==
X-Received: by 2002:a17:90b:4f8c:b0:1c7:2217:e980 with SMTP id
 qe12-20020a17090b4f8c00b001c72217e980mr1874430pjb.17.1648069921057; 
 Wed, 23 Mar 2022 14:12:01 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 gk13-20020a17090b118d00b001c6b2472576sm561669pjb.19.2022.03.23.14.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 14:12:00 -0700 (PDT)
Message-ID: <20ea5898-1531-8238-0fbf-35cbf6647f10@gmail.com>
Date: Wed, 23 Mar 2022 22:11:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 26/32] include: move os_*() to os-foo.h
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-27-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220323155743.1585078-27-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/3/22 16:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> For consistency with other os_ functions that do not have POSIX
> implementation, declare an inline function for the stub in os-win32.h.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/qemu-common.h     | 4 ----
>   include/sysemu/os-posix.h | 2 ++
>   include/sysemu/os-win32.h | 4 +++-
>   os-win32.c                | 9 ---------
>   4 files changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index 1fbc20e4bcf7..a271cac66a1b 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -24,10 +24,6 @@
>   int qemu_main(int argc, char **argv, char **envp);
>   #endif
>   
> -/* OS specific functions */
> -void os_setup_early_signal_handling(void);
> -int os_parse_cmd_args(int index, const char *optarg);
> -
>   void page_size_init(void);
>   
>   #endif
> diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
> index dd64fb401dfb..a49c6848ff1a 100644
> --- a/include/sysemu/os-posix.h
> +++ b/include/sysemu/os-posix.h
> @@ -42,7 +42,9 @@
>   extern "C" {
>   #endif
>   
> +int os_parse_cmd_args(int index, const char *optarg);
>   void os_set_line_buffering(void);
> +void os_setup_early_signal_handling(void);
>   void os_set_proc_name(const char *s);
>   void os_setup_signal_handling(void);
>   void os_daemonize(void);
> diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
> index 770752222ae3..c0ba65389986 100644
> --- a/include/sysemu/os-win32.h
> +++ b/include/sysemu/os-win32.h
> @@ -62,8 +62,10 @@ struct tm *localtime_r(const time_t *timep, struct tm *result);
>   static inline void os_setup_signal_handling(void) {}
>   static inline void os_daemonize(void) {}
>   static inline void os_setup_post(void) {}
> -void os_set_line_buffering(void);
>   static inline void os_set_proc_name(const char *dummy) {}
> +static inline int os_parse_cmd_args(int index, const char *optarg) { return -1; }
> +void os_set_line_buffering(void);
> +void os_setup_early_signal_handling(void);

By declaring the same prototype in various headers, we risk someone
update only one implementation. Maybe we need a "os-common.h" header?

