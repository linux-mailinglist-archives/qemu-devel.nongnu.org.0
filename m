Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B3D50E6FA
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 19:22:18 +0200 (CEST)
Received: from localhost ([::1]:48486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj2Ph-0002bn-4f
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 13:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj2Oa-0001qT-Of
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 13:21:08 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj2OY-0000Pg-Tq
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 13:21:08 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so1803960pjq.0
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 10:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8QeAmgoHh4ckUm2PyCzHqZjxVP8AaEKhGx/cDD36owk=;
 b=nN+XGbGmJMoHkOzYO5HHjGwpCHCstuoaUpdJjyCQ5uvzbjNX5Aa2eFHrzOzpD3xavv
 LGXT44KkF70Yg34Xwf4Ry40CLpqhJOgtaj0sqYuZYToI5bthfL7MsP0WUaXbzkYMFGRA
 XExjYri6J6Hkhfq0cfCoV74UcyQzHHBR+oJRrKrVVs59UNB20WLMbo7mFXNWoToOcaR/
 nMhxSVei1ONUS+csocL3eQvaDxv1rejZYzXZv7Edt22frYfEzlEvzBXurKSGm8nxVtlP
 NNxOzVey02lvsRv2a6NYy7IUkPGKBlGiW7TqGWRQl3KM5jnaoaO9WKbTfBnAFjuAtRVV
 fPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8QeAmgoHh4ckUm2PyCzHqZjxVP8AaEKhGx/cDD36owk=;
 b=SmsxKom9dSbVbgsH485PGPM9ePafvJoScxefoC0v4bRYUaRbAuNUD+YsXOcdbq3IZ0
 JJvzUZBTTD2Cx+ZDisHwKGySgvbgFMmdJ6KZ4mMaU+pLYSgtlCUQoYmSOSIihfChqVQm
 fdNnzR0n1aFiL+o3cDWToaXm/4zXV09cyY6YNvVGS8iINoBm8ULEQXmK+XwCoDSwRssh
 oOvEpTmn2cC76fWpmrigA3Z8Dllg7igCUKMTDKxFydMBFnxlMkl1//nbtupYmUSUrXwe
 t6zLP1jfuX7WFYMa8os5tukY2WWUEFEO3eOrreGoYkFkKekinbusLfNtUD1HX/r372Ke
 Ga5Q==
X-Gm-Message-State: AOAM533DbFKgb/tUPlxBqCmRIbK67SF0FvMQGoSKBbSVb7jvKmPZee+g
 mTEMv5zwPpNr4w/QuHOjIpr/ww==
X-Google-Smtp-Source: ABdhPJwrJnpL6EbK0wPsfmT1CuQpnbGynf2HQuaSAzfacLtMCmt+jmsgYNAb++vk/CBMpI8EDa1Qcw==
X-Received: by 2002:a17:902:b48a:b0:158:e38d:ca23 with SMTP id
 y10-20020a170902b48a00b00158e38dca23mr18715276plr.115.1650907265280; 
 Mon, 25 Apr 2022 10:21:05 -0700 (PDT)
Received: from ?IPV6:2607:fb90:27d3:42c2:9c7a:9323:2295:e9c6?
 ([2607:fb90:27d3:42c2:9c7a:9323:2295:e9c6])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a056a001a0c00b004e1307b249csm12868630pfv.69.2022.04.25.10.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 10:21:04 -0700 (PDT)
Message-ID: <4f3017ea-3f6b-dd43-275a-5012cf0f412a@linaro.org>
Date: Mon, 25 Apr 2022 10:21:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/6] Kraxel 20220425 patches
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20220425061029.3932731-1-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220425061029.3932731-1-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/22 23:10, Gerd Hoffmann wrote:
> The following changes since commit a74782936dc6e979ce371dabda4b1c05624ea87f:
> 
>    Merge tag 'pull-migration-20220421a' of https://gitlab.com/dagrh/qemu into staging (2022-04-21 18:48:18 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kraxel.org/qemu tags/kraxel-20220425-pull-request
> 
> for you to fetch changes up to ef798418a3037434951002d0afc5f3d919e294db:
> 
>    avocado/vnc: add test_change_listen (2022-04-22 13:43:28 +0200)
> 
> ----------------------------------------------------------------
> vnc: add display-update monitor command.
> screendump: add png support.
> vmsvga: screen update fix.
> 
> ----------------------------------------------------------------
> 
> Carwyn Ellis (1):
>    hw/display/vmware_vga: do not discard screen updates
> 
> Kshitij Suri (2):
>    Replacing CONFIG_VNC_PNG with CONFIG_PNG
>    Added parameter to take screenshot with screendump as PNG
> 
> Vladimir Sementsov-Ogievskiy (3):
>    ui/vnc: refactor arrays of addresses to SocketAddressList
>    qapi/ui: add 'display-update' command for changing listen address
>    avocado/vnc: add test_change_listen


Fails testing with

   ERROR: unknown option --disable-vnc-png

See https://gitlab.com/qemu-project/qemu/-/jobs/2374050341


r~


> 
>   meson_options.txt               |   4 +-
>   tests/avocado/vnc.py            |  63 +++++++++++++
>   include/ui/console.h            |   1 +
>   ui/vnc.h                        |   2 +-
>   hw/display/vmware_vga.c         |  45 +++++----
>   monitor/hmp-cmds.c              |  12 ++-
>   monitor/qmp-cmds.c              |  15 +++
>   ui/console.c                    | 101 ++++++++++++++++++++-
>   ui/vnc-enc-tight.c              |  18 ++--
>   ui/vnc.c                        | 156 ++++++++++++++++----------------
>   docs/about/removed-features.rst |   3 +-
>   hmp-commands.hx                 |  11 ++-
>   hw/display/trace-events         |   1 +
>   meson.build                     |  12 ++-
>   qapi/ui.json                    |  89 +++++++++++++++++-
>   scripts/meson-buildoptions.sh   |   6 +-
>   16 files changed, 406 insertions(+), 133 deletions(-)
> 


