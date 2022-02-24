Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB7C4C2DDC
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 15:07:06 +0100 (CET)
Received: from localhost ([::1]:33578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNElt-0000nx-KK
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 09:07:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nNEiv-00070o-C0
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:04:01 -0500
Received: from [2a00:1450:4864:20::52a] (port=39850
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nNEii-0006Gr-DD
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:04:00 -0500
Received: by mail-ed1-x52a.google.com with SMTP id g20so2986699edw.6
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 06:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jOzFJwFw8ZyJmI6ISCn+gHQqKOR6WfycOan2OJqhacI=;
 b=C0V2f40UQcJwZg2w5cd3ELFxyooFPcq6O6bnBkrfxVGgKM66CAB8tYXliX7gpwfpVH
 Oi9GPOJ+2VzKpsnW14IpAEqQtUVKVbSpfhUX39VIhLvauHQtggQuBM59n/Rb9EAEAXa4
 U1lI2J8JlU3BCTFPd+rj1RSXoo/J9y37XmeUN1RPsBrnyVmlTBYKkdSnlDzr6mg7RUVe
 Bl2IU0o+t0xbCiV4DlDs+8VH1wUCme1Wtjx4vAarXKodj8KpAjQgJ+fM02fVP333klNW
 jQZnLEyHaQBxqa9qKfzvHtdF0MuYUo/uqC87jQCZ4tSofR1lTyIW4+lD5JFk6pkWOwTf
 bYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jOzFJwFw8ZyJmI6ISCn+gHQqKOR6WfycOan2OJqhacI=;
 b=TOe9hHHpmZXtRIg6g7g0uv1NSyyxwDO0TwzLbHhtJNNAKojRhGM0v1um1P1h/8aT9H
 zKvu3PUS3o/EAlicko9jXeHEyT18te4T40IrF36woH0r95eIhorxWLdeArGv65sedTtJ
 XRghJufo9G68dz5WUwhv3pwjwP8MpOc0Gbv2F/bJ2+dwxhodLCAZwEV4bkdlDn4ffND5
 XJO7VCd34UDMU3mQCjTOCVvUxC7xUE57vRVx3dZvR/TbRPQJH42T1sy0oRlz+bz/2X2i
 4mOQhqxSeFElKnw6ZnxYZkUQrV4l1ofMVfXSLuzirvwmJ6kRqVED9N8yOjxESyYd6aQw
 Zspw==
X-Gm-Message-State: AOAM53388eelEl+sPqtVLmmd++TZdRG+LLTIsglXMdB7vB82EneokVsr
 Cqpvmrqn0yxtrE9abnk4cEQ=
X-Google-Smtp-Source: ABdhPJwmFxozD3Fv+9piE3Vvukd34Gem3NcOUf1piIuW8fRhp+FmtoV2tjU1I0FibFJP21WfLWvsrw==
X-Received: by 2002:a50:8d4e:0:b0:408:3655:812f with SMTP id
 t14-20020a508d4e000000b004083655812fmr2465706edt.108.1645711427007; 
 Thu, 24 Feb 2022 06:03:47 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id fd21sm1360904ejc.44.2022.02.24.06.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 06:03:45 -0800 (PST)
Message-ID: <c25cc1fb-e896-3588-6a27-2b9ce81aef99@redhat.com>
Date: Thu, 24 Feb 2022 15:03:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/8] Misc build fixes and cleanups
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220222194008.610377-1-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220222194008.610377-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 20:40, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Hi,
> 
> A small collection of patches gleaned while working on different things.

Queued all except patch 4.

Paolo

> Marc-André Lureau (8):
>    meson: fix generic location of vss headers
>    qga/vss-win32: check old VSS SDK headers
>    qga/vss: update informative message about MinGW
>    meson: drop the .fa library suffix
>    meson: use chardev_ss dependencies
>    char: move qemu_openpty_raw from util/ to char/
>    Drop qemu_foo() socket API wrapper
>    Replace GCC_FMT_ATTR with G_GNUC_PRINTF
> 
>   docs/devel/build-system.rst             |   5 -
>   meson.build                             |  25 ++---
>   audio/audio.h                           |   4 +-
>   block/qcow2.h                           |   2 +-
>   bsd-user/qemu.h                         |   2 +-
>   hw/display/qxl.h                        |   2 +-
>   hw/net/rocker/rocker.h                  |   2 +-
>   hw/xen/xen_pt.h                         |   2 +-
>   include/chardev/char-fe.h               |   2 +-
>   include/disas/dis-asm.h                 |   2 +-
>   include/hw/acpi/aml-build.h             |  12 +-
>   include/hw/core/cpu.h                   |   2 +-
>   include/hw/hw.h                         |   2 +-
>   include/hw/virtio/virtio.h              |   2 +-
>   include/hw/xen/xen-bus-helper.h         |   4 +-
>   include/hw/xen/xen-bus.h                |   4 +-
>   include/hw/xen/xen_common.h             |   2 +-
>   include/hw/xen/xen_pvdev.h              |   2 +-
>   include/monitor/monitor.h               |   4 +-
>   include/qapi/error.h                    |  20 ++--
>   include/qapi/qmp/qjson.h                |   8 +-
>   include/qemu-common.h                   |  21 ----
>   include/qemu/buffer.h                   |   2 +-
>   include/qemu/compiler.h                 |  11 +-
>   include/qemu/error-report.h             |  24 ++--
>   include/qemu/log-for-trace.h            |   2 +-
>   include/qemu/log.h                      |   2 +-
>   include/qemu/qemu-print.h               |   8 +-
>   include/qemu/readline.h                 |   2 +-
>   qga/guest-agent-core.h                  |   2 +-
>   qga/vss-win32/requester.h               |   2 +-
>   qga/vss-win32/vss-common.h              |   3 +-
>   scripts/cocci-macro-file.h              |   2 +-
>   tests/qtest/libqos/libqtest.h           |  42 +++----
>   tests/qtest/libqtest-single.h           |   2 +-
>   tests/qtest/migration-helpers.h         |   6 +-
>   audio/alsaaudio.c                       |   4 +-
>   audio/coreaudio.c                       |   4 +-
>   audio/dsoundaudio.c                     |   4 +-
>   audio/ossaudio.c                        |   4 +-
>   audio/paaudio.c                         |   2 +-
>   audio/sdlaudio.c                        |   2 +-
>   block/blkverify.c                       |   2 +-
>   block/ssh.c                             |   4 +-
>   chardev/char-pty.c                      | 104 ++++++++++++++++++
>   crypto/cipher-afalg.c                   |   4 +-
>   crypto/hash-afalg.c                     |   4 +-
>   fsdev/9p-marshal.c                      |   2 +-
>   fsdev/virtfs-proxy-helper.c             |   2 +-
>   gdbstub.c                               |   2 +-
>   hw/9pfs/9p.c                            |   2 +-
>   hw/acpi/aml-build.c                     |   4 +-
>   hw/mips/fuloong2e.c                     |   2 +-
>   hw/mips/malta.c                         |   2 +-
>   hw/net/rtl8139.c                        |   2 +-
>   hw/virtio/virtio.c                      |   2 +-
>   io/channel-socket.c                     |   6 +-
>   io/channel-websock.c                    |   2 +-
>   monitor/hmp.c                           |   4 +-
>   nbd/server.c                            |  10 +-
>   net/socket.c                            |  24 ++--
>   qemu-img.c                              |   4 +-
>   qemu-io.c                               |   2 +-
>   qobject/json-parser.c                   |   2 +-
>   softmmu/qtest.c                         |   4 +-
>   tests/qtest/e1000e-test.c               |   4 +-
>   tests/qtest/libqtest.c                  |   6 +-
>   tests/qtest/npcm7xx_emc-test.c          |   4 +-
>   tests/qtest/test-filter-mirror.c        |   4 +-
>   tests/qtest/test-filter-redirector.c    |   8 +-
>   tests/qtest/virtio-net-test.c           |  10 +-
>   tests/unit/socket-helpers.c             |   2 +-
>   tests/unit/test-qobject-input-visitor.c |   4 +-
>   util/osdep.c                            |   4 +-
>   util/qemu-openpty.c                     | 139 ------------------------
>   util/qemu-sockets.c                     |  10 +-
>   chardev/meson.build                     |   4 +-
>   qga/meson.build                         |   2 +-
>   qga/vss-win32/install.cpp               |   4 +
>   qga/vss-win32/provider.cpp              |   4 +
>   scripts/checkpatch.pl                   |   2 +-
>   tests/qtest/libqos/meson.build          |   1 -
>   util/meson.build                        |   1 -
>   83 files changed, 300 insertions(+), 370 deletions(-)
>   delete mode 100644 util/qemu-openpty.c
> 


