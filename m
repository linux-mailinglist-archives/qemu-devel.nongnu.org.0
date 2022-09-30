Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A065F0D30
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 16:14:31 +0200 (CEST)
Received: from localhost ([::1]:58094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGmc-0001Ho-N4
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 10:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeGZZ-0006qv-Mf
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:01:03 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:33624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeGZX-0003GB-MZ
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:01:01 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 bu5-20020a17090aee4500b00202e9ca2182so7366488pjb.0
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 07:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=W7fMm3sijk2IpTNyxvCCdY2IO7aZ1NGEz6j4O5jK+d0=;
 b=POAE8SWa4TsbI/vVswpvI0lElaTg/nVWW+/9uzlb25hX2Ual6EWaGKEJoI6GvQ8jhX
 gXV97Vr3Dwrq7Qjt0mY8+9Wf7sRDQVEXtz1M06ifydJq0JkXOYjkspDsce50QTF0LNgA
 qwQUsyhFY0TrWOm3+tIKNVZOys0U5MiUyKEv7kH8Ktik2IqP+RyU6/+R1z7nbvAIu3HH
 8zv+J+kHu+MYioUCyogQaWpNBz4kwU22kflmI0XZVqtD82o6I3di4aKJS84KHBfEBG7Y
 MsrxuwAV2cpa3fstKwi2/yRv92FtYjWw+ErbQv65LLU3uZlpCgbgd8U5jnBIhxmQimXx
 oq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=W7fMm3sijk2IpTNyxvCCdY2IO7aZ1NGEz6j4O5jK+d0=;
 b=Pemfjs95mI8cZliiQkm+QYwZLUzPgqLUYS9EDDqp31WQy8/sp0LX9i2KEeRNpkDRyK
 pTQtv5h0kzVpJQoyMAzWaHmyi7hds/m2yo5ey9LMmZ+hX9C7wzgnbF5pFTcXVOxKhfWn
 yTgGeakMPrwJjQ0phPTKRGTHwKLkvMGAFthbaEGCxdrtBiNPheEmli3DNI9p050sPnQQ
 dox4m4QGc+iiVR0YI9hGVbFKMxQE486ywO6VMpEUDQlZz8JwEpD9BfmFEHMvNFumEok9
 r2AS75Ap6fgzQVCszhOqznD4rbXaKpp8paWrn0g1X4ExLO/tOrd6/pai6CBqbPQKWTbn
 43zA==
X-Gm-Message-State: ACrzQf2U1L/X6Lw9GbN4avjv1+NT4C6n24S066zYFBWDEsJiqVKvgSyN
 Xx6GClRWHRxOyHjYOoNm2fiacQ==
X-Google-Smtp-Source: AMsMyM5Pwn/ZqXgE21UqLDZWbxaD9nWnCekbAcz2XhPVmhm9AgEiS56w81uYW+QMxjQHdQlBtPTHBA==
X-Received: by 2002:a17:90b:1d08:b0:200:823f:9745 with SMTP id
 on8-20020a17090b1d0800b00200823f9745mr9753582pjb.84.1664546457878; 
 Fri, 30 Sep 2022 07:00:57 -0700 (PDT)
Received: from [192.168.74.154] ([50.200.230.211])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a656393000000b0042c0ffa0e62sm1739090pgv.47.2022.09.30.07.00.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 07:00:57 -0700 (PDT)
Message-ID: <68c87f3a-6868-af5b-0167-14d79e2a1677@linaro.org>
Date: Fri, 30 Sep 2022 07:00:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] win32: set threads name
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: bin.meng@windriver.com, Stefan Weil <sw@weilnetz.de>
References: <20220930135701.1681390-1-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220930135701.1681390-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.583,
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

On 9/30/22 06:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> As described in:
> https://learn.microsoft.com/en-us/visualstudio/debugger/how-to-set-a-thread-name-in-native-code?view=vs-2022
> 
> SetThreadDescription() is available since Windows 10, version 1607 and
> in some versions only by "Run Time Dynamic Linking". Its declaration is
> not yet in mingw, so we lookup the function the same way glib does.
> 
> Tested with Visual Studio Community 2022 debugger.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   util/qemu-thread-win32.c | 56 ++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 54 insertions(+), 2 deletions(-)
> 
> diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
> index a2d5a6e825..e2d681fe7d 100644
> --- a/util/qemu-thread-win32.c
> +++ b/util/qemu-thread-win32.c
> @@ -19,12 +19,40 @@
>   
>   static bool name_threads;
>   
> +typedef HRESULT (WINAPI *pSetThreadDescription) (HANDLE hThread,
> +                                                 PCWSTR lpThreadDescription);
> +static pSetThreadDescription SetThreadDescriptionFunc = NULL;
> +static HMODULE kernel32_module = NULL;
> +
> +static bool
> +load_set_thread_description(void)
> +{
> +  static gsize _init_once = 0;
> +
> +  if (g_once_init_enter(&_init_once)) {
> +      kernel32_module = LoadLibraryW(L"kernel32.dll");
> +      if (kernel32_module) {
> +          SetThreadDescriptionFunc =
> +              (pSetThreadDescription)GetProcAddress(kernel32_module,
> +                                                    "SetThreadDescription");
> +          if (!SetThreadDescriptionFunc) {
> +              FreeLibrary(kernel32_module);
> +          }
> +      }
> +      g_once_init_leave(&_init_once, 1);
> +  }
> +
> +  return !!SetThreadDescriptionFunc;
> +}
> +
>   void qemu_thread_naming(bool enable)
>   {
> -    /* But note we don't actually name them on Windows yet */
>       name_threads = enable;
>   
> -    fprintf(stderr, "qemu: thread naming not supported on this host\n");
> +    if (enable && !load_set_thread_description()) {
> +        fprintf(stderr, "qemu: thread naming not supported on this host\n");
> +        name_threads = false;
> +    }

Excellent.

> +static bool
> +set_thread_description(HANDLE h, const char *name)
> +{
> +  HRESULT hr;
> +  g_autofree wchar_t *namew = NULL;
> +
> +  if (!load_set_thread_description() || !name) {

You no longer need this call.  And !name is not...

> @@ -423,7 +471,11 @@ void qemu_thread_create(QemuThread *thread, const char *name,
>       if (!hThread) {
>           error_exit(GetLastError(), __func__);
>       }
> +    if (name_threads && !set_thread_description(hThread, name)) {
> +        fprintf(stderr, "Failed to set thread description: %s\n", name);
> +    }

... an error.  If you want to log an error, you should:

    if (name_threads && name && !set_thread_description(...)) {
    }


r~

