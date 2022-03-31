Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75D54EDBAD
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 16:28:28 +0200 (CEST)
Received: from localhost ([::1]:43654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZvml-0001Ok-C3
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 10:28:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZvlI-00005W-Uq
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 10:26:57 -0400
Received: from [2a00:1450:4864:20::32c] (port=40810
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZvlG-0008W1-JZ
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 10:26:55 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso1803875wme.5
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 07:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=9kF+sQQ2UN4n4GuqrXgGfRk/H/QGIIlSKqDeXZHjcV8=;
 b=fHH2oiohStNkifIcNZFKI7QFtkkWNc004cgiWqLH4tysG7Svd149vSYyfSXJYfwJj+
 z4dUZl2g7It2Rv/ZxpmgEBKBfKwKvJG0hiwrDvLP5QEDXEkOaNy656lfhcDFDDnwmE0B
 sVkQMeteSliYLEYNQbi7+rliebfwjCm+wiW7NhLgRTKuF6pudtcfy3+yZqh0Kp3BMhC9
 BHEgQRczs01SddC/9oyy2JV/ZRnIM1I79JSmBXmcG0dPxi13Jp5t/gkPFLxQ9Jjku1EV
 z6XHxc2PPyUuvfYLJOMrhdT5g3CGNSDSXTBTTZJWadn8olxJEIbiRWnc0cx0kpIFavaN
 JwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9kF+sQQ2UN4n4GuqrXgGfRk/H/QGIIlSKqDeXZHjcV8=;
 b=UN2XAY0FfeDlwkmJmPOTB909TCF7JKhrAxB1JWeunYlhuYH4wTCDZygRxkbq+e9rEd
 Aeh8w9qiPUgTJUFX92EcJC//b5CixepXzxaJSMx3ATdf1AMHDGsssKGoUukXWj9+RRGd
 E9wnrJ3dQIfdVJv4zxYKGQaCrbfLNzMfTTvzspLuNirSEwB1uqw1Vlg5VFqHS6+8OROO
 u97GQHvKbQ9vP8Palse3spNE9ImN+j1i/8UhYX4hQ9kF5iF6Wg4+wxef4iyxrfRbpTUv
 tRuwNY0s+dYXX4DnTl1VLW2wiEC59yjFryCXGy8tiUnNWZnmN0IwOnwvVuQG4c2fIQLv
 n2BA==
X-Gm-Message-State: AOAM532WpaHRikxyEmhHXanWu+INAQ2ZDCt973WFqXsGCymwvNexdFKP
 3ullhIqLLBiNxJ9K+8s/714=
X-Google-Smtp-Source: ABdhPJzzIDwhPk0/Jgk0kyg6qATr8giPQflvqi7TyJDjuqM96BoH5LTEYkM/1yVx3CbVFwO8YDWceA==
X-Received: by 2002:a05:600c:6004:b0:38c:6c00:4316 with SMTP id
 az4-20020a05600c600400b0038c6c004316mr5075708wmb.6.1648736811766; 
 Thu, 31 Mar 2022 07:26:51 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:f49c:562:b5cb:b2b5?
 ([2600:70ff:f07f:0:f49c:562:b5cb:b2b5])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a5d5445000000b00203f8c96bcesm19330638wrv.49.2022.03.31.07.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 07:26:51 -0700 (PDT)
Message-ID: <25b0553f-cd39-e0fa-f4b9-a6e486f536b7@gmail.com>
Date: Thu, 31 Mar 2022 16:26:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] doc/style: CLang -> Clang
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220331135647.1686375-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220331135647.1686375-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/3/22 15:56, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> It's not the way it is usually written (see https://clang.llvm.org/).
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   docs/devel/style.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

