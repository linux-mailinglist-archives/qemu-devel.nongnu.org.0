Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05165EE1AE
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 18:20:22 +0200 (CEST)
Received: from localhost ([::1]:49616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odZnJ-0003SB-C3
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 12:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odZ8X-0006fH-IS
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:38:13 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odZ8V-0002Ms-Hq
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:38:13 -0400
Received: by mail-pf1-x42d.google.com with SMTP id d82so12834431pfd.10
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 08:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=o2r95DYU204w4yb9qCRRLd//HbGixJlmlmPTLo+69Ig=;
 b=BedMn+a+se9GsUM7PsEuEjGYSHMGlb0GZdULtYJHl26Luao6nfC4HajrvDhNG4RjVF
 wclWpVWB9xBSDTUBTAawSYpPtYMGfnu9+J/8f56rFy8Ytsv74MgSTfr24dDJU5sN9yS2
 zmyd/QyZfGUa6aXbMw7MsoK6jUA/wTlxRBeFc0FqkSXANT8F2guCUY4GyHE9DQWiSbGp
 p3//PS/V4wyliGAIzA9FYkobIwQ+MOo9KuyTQSntue8hzhxVnUwAwU9QUPIXeNKLTvU5
 uQ8l/ZFhMYoJ9p/FkrOk4VsttSTEmh/HuyG6E8HEkVuZz0Wy+ttsNEQYxSMJf20aZHeD
 NWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=o2r95DYU204w4yb9qCRRLd//HbGixJlmlmPTLo+69Ig=;
 b=jdDAi2IyL9XMM6ToLXvWZOzL/D7gErlgescRRy4NSEsHep4N1hkltIFKeTYoHSEUEN
 H3CNqOPgzY4r9Hss9EVaxRxMT12cClmv7iAr8IqsUVlLQD4QZIMiKYXcanVmXShkJm+9
 seBKRbRNCayO5Rwb+0zGIzPX734laYzLk29GnvKy5rdWps94X8i9sQeaozTwZAzoMa7X
 hzfW6mQwCrhV9x1g4gMad9PXObM+F4dCKuDXTCUp4qL+txDdMRWlLPkyeYuui6kCbTIi
 CngRU5XY1HWCiHRwQUYsDv8IygKZ5u86wXMwLM8xv1c+gJrRVGw+/MlVY5r0u3vPaXb+
 oyPg==
X-Gm-Message-State: ACrzQf3sHRk0hNVR3AGPFWVXiQUrjDgP9tOZgbm345E3JORvTj+AYZsr
 JTvZ/ap1GBG507Um8Wxwo92/OA==
X-Google-Smtp-Source: AMsMyM6CooKbrqhhnbmpJ9ScUJWs+jjv8m2DfzH7KbFdYpQUFvdXxI0VsZRWeJmAhBXV7Bhgzp0p3Q==
X-Received: by 2002:a63:4e16:0:b0:43f:3554:ff9c with SMTP id
 c22-20020a634e16000000b0043f3554ff9cmr7316920pgb.578.1664379488335; 
 Wed, 28 Sep 2022 08:38:08 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a17090332d100b00176b5035045sm3961301plr.202.2022.09.28.08.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 08:38:07 -0700 (PDT)
Message-ID: <69681de5-b14d-0f20-6049-5cd2f8529b7a@linaro.org>
Date: Wed, 28 Sep 2022 08:38:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 3/5] module: add Error arguments to module_load and
 module_load_qom
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220928122959.16679-1-cfontana@suse.de>
 <20220928122959.16679-4-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220928122959.16679-4-cfontana@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/28/22 05:29, Claudio Fontana wrote:
> improve error handling during module load, by changing:
> 
> bool module_load(const char *prefix, const char *lib_name);
> void module_load_qom(const char *type);
> 
> to:
> 
> int module_load(const char *prefix, const char *name, Error **errp);
> int module_load_qom(const char *type, Error **errp);
> 
> where the return value is:
> 
>   -1 on module load error, and errp is set with the error
>    0 on module or one of its dependencies are not installed
>    1 on module load success
>    2 on module load success (module already loaded or built-in)
> 
> module_load_qom_one has been introduced in:
> 
> commit 28457744c345 ("module: qom module support"), which built on top of
> module_load_one, but discarded the bool return value. Restore it.
> 
> Adapt all callers to emit errors, or ignore them, or fail hard,
> as appropriate in each context.
> 
> Replace the previous emission of errors via fprintf in_some_  error
> conditions with Error and error_report, so as to emit to the appropriate
> target.
> 
> A memory leak is also fixed as part of the module_load changes.
> 
> audio: when attempting to load an audio module, report module load errors.
> Note that still for some callers, a single issue may generate multiple
> error reports, and this could be improved further.
> Regarding the audio code itself, audio_add() seems to ignore errors,
> and this should probably be improved.
> 
> block: when attempting to load a block module, report module load errors.
> For the code paths that already use the Error API, take advantage of those
> to report module load errors into the Error parameter.
> For the other code paths, we currently emit the error, but this could be
> improved further by adding Error parameters to all possible code paths.
> 
> console: when attempting to load a display module, report module load errors.
> 
> qdev: when creating a new qdev Device object (DeviceState), report load errors.
>        If a module cannot be loaded to create that device, now abort execution
>        (if no CONFIG_MODULE) or exit (if CONFIG_MODULE).
> 
> qom/object.c: when initializing a QOM object, or looking up class_by_name,
>                report module load errors.
> 
> qtest: when processing the "module_load" qtest command, report errors
>         in the load of the module.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   audio/audio.c         |  16 ++--
>   block.c               |  20 +++-
>   block/dmg.c           |  14 ++-
>   hw/core/qdev.c        |  17 +++-
>   include/qemu/module.h |  37 +++++++-
>   qom/object.c          |  18 +++-
>   softmmu/qtest.c       |   8 +-
>   ui/console.c          |  18 +++-
>   util/module.c         | 209 +++++++++++++++++++++++-------------------
>   9 files changed, 234 insertions(+), 123 deletions(-)

LGTM,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

