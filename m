Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA4C4321DA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 17:06:33 +0200 (CEST)
Received: from localhost ([::1]:50062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcUDg-0002v4-EB
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 11:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcUBY-0002EH-1i
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 11:04:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcUBV-0002th-Dn
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 11:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634569456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tFTvMahSXYzeUCh7H6LkY5OMfqXONPvCh3WgNgqKsks=;
 b=eKE8MahKUhz0uHRARMej4B4LYCDGVJ6pLuv8eECt0uIWVNsFWGKAw/L7OF+UWshZpo0nHB
 w6Je46pqFfkmFpw8u//6kJ27u+scgt8BP4nvIzR8MWOD475mGEcGZn+SRDy5WKIQDolTOk
 JpxDZHLUTGMmYK5S5FzjGVZBGqxBf/A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-taVxXdK9NfaMWfvitKGsKQ-1; Mon, 18 Oct 2021 11:04:15 -0400
X-MC-Unique: taVxXdK9NfaMWfvitKGsKQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k9-20020a7bc409000000b0030d978403e9so2167428wmi.7
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 08:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tFTvMahSXYzeUCh7H6LkY5OMfqXONPvCh3WgNgqKsks=;
 b=NMbNJAQjGO/AtHVTd/aN1thYoBPt59HFo7GZRfpkNtQf8y2Ay63mwhEGE+CUETTewm
 H+hhrc4pYedPQiBFut1KO3WBDtFppP4JOprfkJKasMt8DeeV7KSuEMT33L6Jd5SbGE5M
 A4SSFeSP7wV5SCwzU443xhhgCiZKNlvadL3jAUrjYXKnee4d8IME/zSeSdzzVpBGXGAP
 IDWGYmFaUJ3CLX+rJDkeFi+QPx+F41fYUEGTRoJ+fKYlb1sHaHXQCTzPTb+RECikHSpY
 hHBiHQyN30MJwvjtGiIuS0/g7WJ9q+XYNx9TXm8yObQWfebliDaE3fn81IblqNg5P4q0
 7i+g==
X-Gm-Message-State: AOAM533rWhbnmvoGcppDVykpPpP5LytxPF3mkJK8De9F8+qApQ9ap8aO
 4Zfx53x21UvQtOGs/KSqT92mM1nullH4FWNHnhU9WtJJyPsAhnWIEetauGLvlVk4Fx/cBGNmz7b
 2AcoWLvne6zymWn4=
X-Received: by 2002:adf:a2d4:: with SMTP id t20mr35595520wra.229.1634569453802; 
 Mon, 18 Oct 2021 08:04:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbZ2ATJxK32oozjy4lIjsuF3b3MDTCkkLDKFXzkBr/b753yRLMgymycp3P8aX3+njMWqu1iw==
X-Received: by 2002:adf:a2d4:: with SMTP id t20mr35595475wra.229.1634569453540; 
 Mon, 18 Oct 2021 08:04:13 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id h8sm14534406wrm.27.2021.10.18.08.04.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 08:04:13 -0700 (PDT)
Message-ID: <c40b635d-bfb9-8360-0151-4ea683eac402@redhat.com>
Date: Mon, 18 Oct 2021 17:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] chardev: don't exit() straight away on C-a x
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20211018140226.838137-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211018140226.838137-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.junger@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 16:02, Alex Bennée wrote:
> While there are a number of uses in the code-base of the exit(0)
> pattern it gets in the way of clean exit which can do all of it's
> house-keeping. In particular it was reported that you can crash
> plugins this way because TCG can still be running on other threads
> when the atexit callback is called.
> 
> Use qemu_system_shutdown_request() instead. I did a gentle rename of
> the runstate stub seeing as it now contains two functions.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reported-by: Lukas Jünger <lukas.junger@greensocs.com>
> ---
>  chardev/char-mux.c                     | 3 ++-
>  stubs/{runstate-check.c => runstate.c} | 5 +++++
>  stubs/meson.build                      | 2 +-
>  3 files changed, 8 insertions(+), 2 deletions(-)
>  rename stubs/{runstate-check.c => runstate.c} (64%)
> 
> diff --git a/chardev/char-mux.c b/chardev/char-mux.c
> index ada0c6866f..a46897fcd5 100644
> --- a/chardev/char-mux.c
> +++ b/chardev/char-mux.c
> @@ -28,6 +28,7 @@
>  #include "qemu/option.h"
>  #include "chardev/char.h"
>  #include "sysemu/block-backend.h"
> +#include "sysemu/runstate.h"
>  #include "chardev-internal.h"
>  
>  /* MUX driver for serial I/O splitting */
> @@ -157,7 +158,7 @@ static int mux_proc_byte(Chardev *chr, MuxChardev *d, int ch)
>              {
>                   const char *term =  "QEMU: Terminated\n\r";
>                   qemu_chr_write_all(chr, (uint8_t *)term, strlen(term));
> -                 exit(0);
> +                 qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>                   break;
>              }
>          case 's':
> diff --git a/stubs/runstate-check.c b/stubs/runstate.c
> similarity index 64%
> rename from stubs/runstate-check.c
> rename to stubs/runstate.c
> index 2ccda2b70f..f47dbcd3e0 100644
> --- a/stubs/runstate-check.c
> +++ b/stubs/runstate.c
> @@ -5,3 +5,8 @@ bool runstate_check(RunState state)
>  {
>      return state == RUN_STATE_PRELAUNCH;
>  }
> +
> +void qemu_system_shutdown_request(ShutdownCause reason)
> +{
> +    return;
> +}

Hmm this isn't a stub anymore, this is the user-mode implementation.

I'd rather have some shared user/ or meanwhile duplicate it in
both bsd-user/linux-user (even if the implementation is empty)
instead of a stub.

> diff --git a/stubs/meson.build b/stubs/meson.build
> index f6aa3aa94f..8f6a9f17e5 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -35,7 +35,7 @@ stub_ss.add(files('qtest.c'))
>  stub_ss.add(files('ram-block.c'))
>  stub_ss.add(files('ramfb.c'))
>  stub_ss.add(files('replay.c'))
> -stub_ss.add(files('runstate-check.c'))
> +stub_ss.add(files('runstate.c'))
>  stub_ss.add(files('sysbus.c'))
>  stub_ss.add(files('target-get-monitor-def.c'))
>  stub_ss.add(files('target-monitor-defs.c'))
> 


