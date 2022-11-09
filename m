Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CBE62363A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 22:58:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ost4F-0005mt-IU; Wed, 09 Nov 2022 16:57:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ost4B-0005mF-9M
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 16:57:03 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ost47-00016f-PN
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 16:57:02 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 t25-20020a1c7719000000b003cfa34ea516so3164111wmi.1
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 13:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rHXZIaE29nYOF5EyFZCXz8u1hwobcwLMEfjofPvO06g=;
 b=aqY4j2aXWbKGg4e1cscj6z5kawS8oMt/MiZb1Hhyuk7sUjA10M6MyFMmqZHkeZOHH7
 XWHJwKaHHkjGiLu3/iI6ZiJvj+P4zu4YoKXprKXnnRh3gQ57FHXPmWhgKHY0vNwwrK/R
 PPekffax6mM4e7EvCHIJDe8yk7PPyR7P2HUDguBWlup1rbbpyx5YPWlgUGBSfSm4HieN
 BEM6ozcBZuyE3LV6uEzKmYeC88zi/6m0SjAgRoDj9cxw9f/GCF5pfQPd2ctKXP5W+BNB
 VpLKDxHycRoQYjD1ikC5Y4oNgGlqjEe41X+MtiTaBZ/HX61fLYMVqNJl425GVncIGdch
 ECug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rHXZIaE29nYOF5EyFZCXz8u1hwobcwLMEfjofPvO06g=;
 b=yUFLH/HT/WsxS0aEK63tx9FOhOJJogBhuHxn4Gz5QF0xctQJg+Y2K1M2xftH6/WtkN
 IBxXtV4tlaysCDzCdT8HIEdIduHIwbj9JS4DI11+Hx9eaCsQRyln8eaqPUL0d+4Gw7/t
 KpZdKsYFV8itZKBF6HqbKl5GKs5nWbCc43pOf/KCJK0ZHqYfxVjTGHMx2AObUVkV1pV/
 RG/6YUpvSyVwRlxCk7LPZseUG9u5cyU2m5+hk6WPlo99hEGN6Pj806loXqRQno0YiEmP
 3X1Ea9q4GUEN/NLCScTNVif02NCZo344AQsA0etoXFbcVEXYPHogamMnk6IPH/wgrZEE
 gp9Q==
X-Gm-Message-State: ANoB5plVBAyPxHC+Vf0l7JgxTmAAYdg0OXQCGcE/KWNfwfg5KudBDfA4
 ef+o8XV16O0O4wdxw78Wxz1qQw==
X-Google-Smtp-Source: AA0mqf4J0WKClfVKZK8wx6rldeoVnCQtGxHkycBNjLbZJA1szha8QGqd/uRPqmW/OKWjlDpzrwZa8A==
X-Received: by 2002:a05:600c:4f0f:b0:3cf:b73f:bf86 with SMTP id
 l15-20020a05600c4f0f00b003cfb73fbf86mr7513116wmq.137.1668031017986; 
 Wed, 09 Nov 2022 13:56:57 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a5d6409000000b00228d67db06esm14118889wru.21.2022.11.09.13.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 13:56:57 -0800 (PST)
Message-ID: <b81930e5-9df7-a80a-5db4-09290a3b71f3@linaro.org>
Date: Wed, 9 Nov 2022 22:56:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] qga: Allow building of the guest agent without system
 emulators or tools
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221109173750.201615-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109173750.201615-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/11/22 18:37, Thomas Huth wrote:
> If configuring with "--disable-system --disable-user --enable-guest-agent"
> the linking currently fails with:
> 
> qga/qemu-ga.p/commands.c.o: In function `qmp_command_info':
> build/../../home/thuth/devel/qemu/qga/commands.c:70: undefined reference to `qmp_command_name'
> build/../../home/thuth/devel/qemu/qga/commands.c:71: undefined reference to `qmp_command_is_enabled'
> build/../../home/thuth/devel/qemu/qga/commands.c:72: undefined reference to `qmp_has_success_response'
> qga/qemu-ga.p/commands.c.o: In function `qmp_guest_info':
> build/../../home/thuth/devel/qemu/qga/commands.c:82: undefined reference to `qmp_for_each_command'
> qga/qemu-ga.p/commands.c.o: In function `qmp_guest_exec':
> build/../../home/thuth/devel/qemu/qga/commands.c:410: undefined reference to `qbase64_decode'
> qga/qemu-ga.p/channel-posix.c.o: In function `ga_channel_open':
> build/../../home/thuth/devel/qemu/qga/channel-posix.c:214: undefined reference to `unix_listen'
> build/../../home/thuth/devel/qemu/qga/channel-posix.c:228: undefined reference to `socket_parse'
> build/../../home/thuth/devel/qemu/qga/channel-posix.c:234: undefined reference to `socket_listen'
> qga/qemu-ga.p/commands-posix.c.o: In function `qmp_guest_file_write':
> build/../../home/thuth/devel/qemu/qga/commands-posix.c:527: undefined reference to `qbase64_decode'
> 
> Let's make sure that we also compile and link the required files if
> the system emulators have not been enabled.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   qapi/meson.build  | 2 +-
>   stubs/meson.build | 2 +-
>   util/meson.build  | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)

> diff --git a/util/meson.build b/util/meson.build
> index 59c1f467bb..b260539bd5 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -68,7 +68,7 @@ if have_system
>     util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
>   endif
>   
> -if have_block
> +if have_block or have_ga
>     util_ss.add(files('aiocb.c', 'async.c', 'aio-wait.c'))
>     util_ss.add(files('base64.c'))
>     util_ss.add(files('buffer.c'))

This can be eventually reduced for 'have_ga':

-- 8< --
diff --git a/util/meson.build b/util/meson.build
index 59c1f467bbe..690e8be903e 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -68,28 +68,30 @@
    util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
  endif

-if have_block
+if have_block or have_ga
    util_ss.add(files('aiocb.c', 'async.c', 'aio-wait.c'))
    util_ss.add(files('base64.c'))
+ 
util_ss.add(files('coroutine-@0@.c'.format(config_host['CONFIG_COROUTINE_BACKEND'])))
+  util_ss.add(files('lockcnt.c'))
+  util_ss.add(files('main-loop.c'))
+  util_ss.add(files('qemu-coroutine.c', 'qemu-coroutine-lock.c', 
'qemu-coroutine-io.c'))
+  util_ss.add(files('qemu-coroutine-sleep.c'))
+  util_ss.add(files('qemu-co-shared-resource.c'))
+  util_ss.add(files('qemu-co-timeout.c'))
+  util_ss.add(files('iov.c', 'qemu-sockets.c', 'uri.c'))
+  util_ss.add(files('thread-pool.c', 'qemu-timer.c'))
+endif
+if have_block
    util_ss.add(files('buffer.c'))
    util_ss.add(files('bufferiszero.c'))
- 
util_ss.add(files('coroutine-@0@.c'.format(config_host['CONFIG_COROUTINE_BACKEND'])))
    util_ss.add(files('hbitmap.c'))
    util_ss.add(files('hexdump.c'))
    util_ss.add(files('iova-tree.c'))
-  util_ss.add(files('iov.c', 'qemu-sockets.c', 'uri.c'))
-  util_ss.add(files('lockcnt.c'))
-  util_ss.add(files('main-loop.c'))
    util_ss.add(files('nvdimm-utils.c'))
-  util_ss.add(files('qemu-coroutine.c', 'qemu-coroutine-lock.c', 
'qemu-coroutine-io.c'))
    util_ss.add(when: 'CONFIG_LINUX', if_true: [
      files('vhost-user-server.c'), vhost_user
    ])
    util_ss.add(files('block-helpers.c'))
-  util_ss.add(files('qemu-coroutine-sleep.c'))
-  util_ss.add(files('qemu-co-shared-resource.c'))
-  util_ss.add(files('qemu-co-timeout.c'))
-  util_ss.add(files('thread-pool.c', 'qemu-timer.c'))
    util_ss.add(files('readline.c'))
    util_ss.add(files('throttle.c'))
    util_ss.add(files('timed-average.c'))
---

Regardless:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


