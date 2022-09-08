Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235445B16AE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 10:15:51 +0200 (CEST)
Received: from localhost ([::1]:53566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWChJ-0002ia-At
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 04:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWCdS-000846-M7
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:11:42 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWCdQ-0006sl-IC
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:11:42 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 z14-20020a7bc7ce000000b003a5db0388a8so1656620wmk.1
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 01:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=wdxZ/aYo0rlePf4IGECeYj9PqT/T/hHSg8nCwteYICU=;
 b=mizKCr5TFIl4xGAK72XWxf9s1iEvgi03x9YYqhGFGUOPnwJ8C+oyWomS/Zhdv3hw/d
 Wi/ASIW044B5nZPXhHzP48O9k//kBdxPErG3tVZhlWQ9Obs0vq3NKvCjewAHnoLmFCqR
 dY6VbGNNZpp8woRBRfSK3HZUJ8kbgcDeGoQO9XimhJsjIqScSlevfvbdm5zmOvBf5qfe
 1qHtjDoD7JTrj6Yg5AX64VUk0r8rbVCqsfXsu3PntS060OaLRx27N4jcLPVgDTgNnInA
 2H3jtafgAPPGnIs9eLgMAfhA/fOrbHcTPUicx3Mwpjb1+juJeQIXrs7En0gJjt74wI4N
 rlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=wdxZ/aYo0rlePf4IGECeYj9PqT/T/hHSg8nCwteYICU=;
 b=8FvanMEeHNqHNwF0W74DSWZYfto7I6TEv3l12RjwBoKF0+/9lAGyuTXLZD7/3UvAVP
 P36DOHuO+3u94MZ/1yJduTcoXGBACM5+JxDOBjaTWjKoBnA8qLo1vXFsTbgxY2u/GpWn
 ElJZkD22fbin6tUTp8JOfVYqh7SobvdKUgMO8XToymAecNj0z9qqwZY6K8OWhSf4G2K0
 FepKYSezLJ3ymGK6JhrNRGyJbCaYl5A0Td8czE5SAW/uG7EaxssXuuQfuOm7bGeR3/nK
 l3YgSX8zjYh4N1pvuxa4E7KVSn6XeKoo3bfqxbrrBjacQiu81gH1r+l0+aBAqnmpW53u
 3PfA==
X-Gm-Message-State: ACgBeo3h1F6wiF+YBBZ/ymoaCWhGaJ2ESsbWw9emT/kDGzQE9tz9OFdn
 okCxZXA3H7wdasXyd4d2EuJeKA==
X-Google-Smtp-Source: AA6agR7SNlsF4z8GJReD3vMuIBaIhzatvuMezqSoies0reYgYkEcjGqXyVfDNkF3ubpLiXLJrf52Tw==
X-Received: by 2002:a05:600c:3205:b0:3b3:3813:ae3f with SMTP id
 r5-20020a05600c320500b003b33813ae3fmr61632wmp.158.1662624698713; 
 Thu, 08 Sep 2022 01:11:38 -0700 (PDT)
Received: from [192.168.1.87] ([109.78.97.14])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a7bc387000000b003b3307fb98fsm829762wmj.24.2022.09.08.01.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 01:11:37 -0700 (PDT)
Message-ID: <1d5db132-08e3-0767-c672-df99a7aa9f3e@linaro.org>
Date: Thu, 8 Sep 2022 09:11:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20220906115501.28581-1-cfontana@suse.de>
 <20220906115501.28581-3-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220906115501.28581-3-cfontana@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/6/22 12:55, Claudio Fontana wrote:
> improve error handling during module load, by changing:
> 
> bool module_load_one(const char *prefix, const char *lib_name);
> void module_load_qom_one(const char *type);
> 
> to:
> 
> bool module_load_one(const char *prefix, const char *name, Error **errp);
> bool module_load_qom_one(const char *type, Error **errp);
> 
> module_load_qom_one has been introduced in:
> 
> commit 28457744c345 ("module: qom module support"), which built on top of
> module_load_one, but discarded the bool return value. Restore it.
> 
> Adapt all callers to emit errors, or ignore them, or fail hard,
> as appropriate in each context.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>   audio/audio.c         |   6 +-
>   block.c               |  12 +++-
>   block/dmg.c           |  10 ++-
>   hw/core/qdev.c        |  10 ++-
>   include/qemu/module.h |  10 +--
>   qom/object.c          |  15 +++-
>   softmmu/qtest.c       |   6 +-
>   ui/console.c          |  19 +++++-
>   util/module.c         | 155 ++++++++++++++++++++++++++++++------------
>   9 files changed, 182 insertions(+), 61 deletions(-)
> 
> diff --git a/audio/audio.c b/audio/audio.c
> index 76b8735b44..4f4bb10cce 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -72,6 +72,7 @@ void audio_driver_register(audio_driver *drv)
>   audio_driver *audio_driver_lookup(const char *name)
>   {
>       struct audio_driver *d;
> +    Error *local_err = NULL;
>   
>       QLIST_FOREACH(d, &audio_drivers, next) {
>           if (strcmp(name, d->name) == 0) {
> @@ -79,7 +80,10 @@ audio_driver *audio_driver_lookup(const char *name)
>           }
>       }
>   
> -    audio_module_load_one(name);
> +    if (!audio_module_load_one(name, &local_err) && local_err) {
> +        error_report_err(local_err);
> +    }

Why would local_err not be set on failure?  Is this the NOTDIR thing?  I guess this is 
sufficient to distinguish the two cases...  The urge to bikeshed the return value is 
strong.  :-)

> +bool module_load_one(const char *prefix, const char *name, Error **errp);
> +bool module_load_qom_one(const char *type, Error **errp);

Doc comments go in the header file.

> +/*
> + * module_load_file: attempt to load a dso file
> + *
> + * fname:          full pathname of the file to load
> + * export_symbols: if true, add the symbols to the global name space
> + * errp:           error to set.
> + *
> + * Return value:   0 on success (found and loaded), < 0 on failure.
> + *                 A return value of -ENOENT or -ENOTDIR means 'not found'.
> + *                 -EINVAL is used as the generic error condition.
> + *
> + * Error:          If fname is found, but could not be loaded, errp is set
> + *                 with the error encountered during load.
> + */
> +static int module_load_file(const char *fname, bool export_symbols,
> +                            Error **errp)
>   {
>       GModule *g_module;
>       void (*sym)(void);
> @@ -152,16 +168,19 @@ static int module_load_file(const char *fname, bool export_symbols)
>       int len = strlen(fname);
>       int suf_len = strlen(dsosuf);
>       ModuleEntry *e, *next;
> -    int ret, flags;
> +    int flags;
>   
>       if (len <= suf_len || strcmp(&fname[len - suf_len], dsosuf)) {
> -        /* wrong suffix */
> -        ret = -EINVAL;
> -        goto out;
> +        error_setg(errp, "wrong filename, missing suffix %s", dsosuf);
> +        return -EINVAL;
>       }
> -    if (access(fname, F_OK)) {
> -        ret = -ENOENT;
> -        goto out;
> +    if (access(fname, F_OK) != 0) {
> +        int ret = errno;
> +        if (ret != ENOENT && ret != ENOTDIR) {
> +            error_setg_errno(errp, ret, "error trying to access %s", fname);
> +        }
> +        /* most likely is EACCES here */
> +        return -ret;
>       }

I looked at this a couple of days ago and came to the conclusion that the split between 
this function and its caller is wrong.

The directory path probe loop is currently split between the two functions.  I think the 
probe loop should be in the caller (i.e. the access call here moved out).  I think 
module_load_file should only be called once the file is known to exist.  Which then 
simplifies the set of errors to be returned from here.

(I might even go so far as to say module_load_file should be moved into module_load_one, 
because there's not really much here, and it would reduce ifdefs.)


r~

