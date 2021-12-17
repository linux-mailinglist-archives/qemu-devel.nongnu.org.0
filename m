Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BF1479611
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 22:15:20 +0100 (CET)
Received: from localhost ([::1]:52304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myKZT-00079v-Gx
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 16:15:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myKYP-0006U2-9L
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 16:14:13 -0500
Received: from [2607:f8b0:4864:20::62d] (port=42995
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myKYN-000853-49
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 16:14:12 -0500
Received: by mail-pl1-x62d.google.com with SMTP id u17so2898126plg.9
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 13:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PgqXcFm3n698VbB0iZOflQ/zxbXAJwU45I1cjc2ZCVU=;
 b=B7irTtBO6EEpEyDfSg9n6iQJGRFOMRFmIvC2K/5G4SaSTJmIDnjZZdT5+Zq6xVKwM9
 pkXsaO7lgs8pzWsqm/CF7iIVfBm572QWVuRRk5I9EM/+dzsnekNFMAOcZcqa9RYvg0Kn
 7Sjqoo3Uo75JGSaPlm+A90vjblVB9u5dKWHjV82IA8kClrp5tInVMco7YdNQnBD5WKU9
 3cL574J4DOtehPXJ3bo1JGPTXIDF3ls3XXQVexeJsHUY0hE/NcwsSC8tQGvqeV3wcgv6
 ToIEJaQUg5+s7u6KfNCNeAckjYMSfgARLTOUpU54MY/A9k9ObvrnU6lU3rFVSlsztIg/
 boug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PgqXcFm3n698VbB0iZOflQ/zxbXAJwU45I1cjc2ZCVU=;
 b=78ii0Nj1kZw+90AtR5J5y2VjzxkJc2MU77Ly9oQYKe1bleJ05ySecHPinQM4185qiC
 ZlzZzdEdvSRN/QbKwItqjzCyYe62KbrXcE0GWfWtFGlpi9EFoWxx8YWfwGiS0YhKDRqY
 Xt8QToxsAHPKFspXHyErMsz/O5+r5F8KSebN4k2AysHIsKQnHOdavpj6WK6m629JtSxL
 vV2V4awswgV4/JKDhKYd+lqdfAIdgZr2syEGOJRrR4+qwE/fswr0iUmDKF8GoOx6AvrP
 Ptz2WwvF7XoaNZuY6s1JcYZoRKGgga42xsrqbqrosm0kxoaUDJ1Zn9miSKD/SnAMR3q0
 7nbQ==
X-Gm-Message-State: AOAM533gdoCPjHwluQlX9EoxqMC0NvbCfDJwdGLk3qcEzPUNjzmiuN4E
 fvxpj5az3MklUCl17I4aHzFegg==
X-Google-Smtp-Source: ABdhPJymSaO9EbFXClM2cuMlWA4GcGpL5gE8xXT8kQUUVBcQGYz1ynAu3b+LU+WTxggNHcQjBSG+3g==
X-Received: by 2002:a17:902:c7cc:b0:148:b8ab:cee3 with SMTP id
 r12-20020a170902c7cc00b00148b8abcee3mr5025962pla.126.1639775649686; 
 Fri, 17 Dec 2021 13:14:09 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv12sm10265470pjb.49.2021.12.17.13.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 13:14:09 -0800 (PST)
Subject: Re: [PULL 09/36] ui: do not delay further remote resize
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
 <20211217143756.1831099-10-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0b913e24-de44-66db-43c2-2eb745eb8686@linaro.org>
Date: Fri, 17 Dec 2021 13:14:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211217143756.1831099-10-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 6:37 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> A remote client, such as Spice, will already avoid flooding the stream
> by delaying the resize requests.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> Acked-by: Gerd Hoffmann<kraxel@redhat.com>
> ---
>   include/ui/console.h | 2 +-
>   ui/console.c         | 5 +++--
>   ui/gtk.c             | 2 +-
>   ui/sdl2.c            | 2 +-
>   ui/spice-display.c   | 2 +-
>   ui/vnc.c             | 2 +-
>   6 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/include/ui/console.h b/include/ui/console.h
> index 6d678924f6fd..65e6bbcab8ae 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -292,7 +292,7 @@ void unregister_displaychangelistener(DisplayChangeListener *dcl);
>   
>   bool dpy_ui_info_supported(QemuConsole *con);
>   const QemuUIInfo *dpy_get_ui_info(const QemuConsole *con);
> -int dpy_set_ui_info(QemuConsole *con, QemuUIInfo *info);
> +int dpy_set_ui_info(QemuConsole *con, QemuUIInfo *info, bool delay);
>   

You have failed to update cocoa.m, so the macos build fails.

../ui/cocoa.m:555:35: error: too few arguments to function call, expected 3, have 2
     dpy_set_ui_info(dcl.con, &info);
     ~~~~~~~~~~~~~~~               ^
/private/var/folders/tn/f_9sf1xx5t14qm_6f83q3b840000gn/T/cirrus-ci-build/include/ui/console.h:333:5: 
note: 'dpy_set_ui_info' declared here
int dpy_set_ui_info(QemuConsole *con, QemuUIInfo *info, bool delay);
     ^
../ui/cocoa.m:1836:21: error: no member named 'event' in 'struct QemuClipboardNotify'
     switch (notify->event) {
             ~~~~~~  ^

https://gitlab.com/qemu-project/qemu/-/jobs/1898442461


r~

