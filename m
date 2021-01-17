Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C13B2F9404
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 17:49:56 +0100 (CET)
Received: from localhost ([::1]:49760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1BFT-0004nd-NL
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 11:49:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l1BDj-0003Ps-Ds; Sun, 17 Jan 2021 11:48:07 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l1BDh-0001iB-LG; Sun, 17 Jan 2021 11:48:07 -0500
Received: by mail-ej1-x62b.google.com with SMTP id by1so13947959ejc.0;
 Sun, 17 Jan 2021 08:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/s0DFF8WaXFbtUAbsxf7ZL3LlLs/rE2wcWl3kwPmFTk=;
 b=Q9i9kEYPM95GNf3JxaX2Zmr0LaX9fvwOv+8Qg0zMC88ieSCSq9Bqz3XCpJL+Nz4jAY
 pEswPcbcJu7jPnobiGaP4nkg3cYyXwE6pseRAZWSh9iuM7NtItrcWRAb3sl49ysAMesB
 boHPSsRHsT5vaYfZuKBxfFjhkfngXvLCHLQt4uh96fgyn2Kh/AbL/sXuYe7pHRpMVl6e
 8tbTEo8MLrRF5vRVfWAbt8Lvzlrd1rhNcmcq8+BYw0kwQVAAv6ogTYlbiFZq76Vhk3BM
 l5cIMbmtBK5gpnR1ckf4d0GkL0h6vkE83jhnrRDQEY2h4wc7vlVBefHhq6vpoPEMVhpS
 GNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/s0DFF8WaXFbtUAbsxf7ZL3LlLs/rE2wcWl3kwPmFTk=;
 b=soQ0gBvnk1OWaeKNI3aE1o1SJgWm653JKzMgPvSNb6RIsyHuvoaVFh9jNgop8QZrX8
 +8MnED4kUGSmE+TkmMQmkXSAK7aJrfhAuAs9c0pqyt2xh0WdYEuppR65scHKCB21FbFS
 J72HsQDr0gq84zsq0gDx+0qETOXmZIWfAaA4zn9UO8j14UcnlSghUaWYcS1ICChoJmto
 pKa3rNcuOdl0jplPM2fsNnxmTBiHs2XdAhynNdKxtfkxl47Tj+xlxeN0DSaB5Zk/OR/C
 7uQrJoJLGZYfXXCtLVaWxAXpGPlKXCu0yvbMfvH48eXM/oBpQ/xTjf1elrvebUX3AYzr
 vp3g==
X-Gm-Message-State: AOAM530saS0TL8nQ++Ads9mIutEOOL7CT8tRrVPQONHvc4yy5vhesXRm
 2v9CKC6sb0HDI3JqtFZ4A/EG+0Ho0Cnsww==
X-Google-Smtp-Source: ABdhPJxD5VzMBq4cfzexEN3Rjmn8/zngDNIFqmoZrtDO+P1M3qibDXr8ImKghxNT2YJGfTp/Kfb2Mw==
X-Received: by 2002:a17:906:c045:: with SMTP id
 bm5mr15098287ejb.190.1610902083504; 
 Sun, 17 Jan 2021 08:48:03 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id j9sm9415618eds.66.2021.01.17.08.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 08:48:02 -0800 (PST)
Subject: Re: [PATCH 00/28] qemu-option, keyval, vl: switch -object/-M/-accel
 to keyval parsing
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
References: <20201202090305.4129317-1-pbonzini@redhat.com>
Message-ID: <de8c073c-471b-8149-1200-8c7f061aae37@redhat.com>
Date: Sun, 17 Jan 2021 17:48:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201202090305.4129317-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.252,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/12/20 10:02, Paolo Bonzini wrote:
> This series switches -object, -M and -accel from QemuOpts to keyval.
> Monitor commands device_add and netdev_add are also switched to keyval,
> though -device and -netdev for now are not.
> 
> Along the way, the syntax of keyval and QemuOpts becomes more consistent
> and support for keyval-based options is added to -readconfig.  -writeconfig
> instead is removed (see patch 13 for rationale).
> 
> The reason to do this is:
> 
> - to make qemu-io, qemu-nbd, qemu-img and QEMU's parsing of -object
>    consistent with qemu-storage-daemon's
> 
> - to allow using compound properties in -object, -M and -accel
> 
> Patch 1-5: make QemuOpts parsing a bit more restrictive, warning for
> short-form boolean options and removing weird ways to request help
> such as "help=foo" or "no?".
> 
> Patch 6-12: let keyval accept escaped commas in implied options,
> switch comma-separated syntax for HMP from QemuOpts to keyval,
> add help support to object_add
> 
> Patch 13-18: plumbing for reading keyval-based options in vl.c,
> including -set and -readconfig.
> 
> Patch 19-23: switch -object to keyval everywhere
> 
> Patch 24-28: switch -M and -accel to keyval
> 
> Paolo Bonzini (28):
>    qemu-option: simplify search for end of key
>    qemu-option: pass QemuOptsList to opts_accepts_any
>    qemu-option: clean up id vs. list->merge_lists
>    qemu-option: move help handling to get_opt_name_value
>    qemu-option: warn for short-form boolean options
>    keyval: accept escaped commas in implied option
>    keyval: simplify keyval_parse_one
>    tests: convert check-qom-proplist to keyval
>    keyval: introduce keyval_parse_into
>    hmp: replace "O" parser with keyval
>    qom: use qemu_printf to print help for user-creatable objects
>    hmp: special case help options for object_add
>    remove -writeconfig
>    qemu-config: add error propagation to qemu_config_parse
>    qemu-option: support accept-any QemuOptsList in qemu_opts_absorb_qdict
>    qemu-config: parse configuration files to a QDict
>    vl: plumb keyval-based options into -set and -readconfig
>    qom: do not modify QDict argument in user_creatable_add_dict
>    qemu-io: use keyval for -object parsing
>    qemu-nbd: use keyval for -object parsing
>    qemu-img: use keyval for -object parsing
>    qemu: use keyval for -object parsing
>    storage-daemon: do not register the "object" group with QemuOpts
>    qom: export more functions for use with non-UserCreatable objects
>    vl: rename local variable in configure_accelerators
>    vl: switch -M parsing to keyval
>    qemu-option: remove now-dead code
>    vl: switch -accel parsing to keyval
> 
>   accel/accel.c                        |   6 +
>   block/blkdebug.c                     |   3 +-
>   docs/system/deprecated.rst           |   6 +
>   hmp-commands.hx                      |   6 +-
>   include/block/qdict.h                |   2 -
>   include/qapi/qmp/qdict.h             |   3 +
>   include/qemu/config-file.h           |   9 +-
>   include/qemu/help_option.h           |  11 -
>   include/qemu/option.h                |   6 +-
>   include/qom/object.h                 |  21 +
>   include/qom/object_interfaces.h      |  68 +--
>   include/sysemu/accel.h               |   1 +
>   monitor/hmp-cmds.c                   |  22 +-
>   monitor/hmp.c                        |  20 +-
>   qemu-img.c                           | 258 ++--------
>   qemu-io.c                            |  42 +-
>   qemu-nbd.c                           |  42 +-
>   qemu-options.hx                      |  13 +-
>   qom/object_interfaces.c              | 152 ++----
>   softmmu/vl.c                         | 687 ++++++++++++++-------------
>   storage-daemon/qemu-storage-daemon.c |  10 -
>   tests/check-qom-proplist.c           |  58 ++-
>   tests/test-keyval.c                  |  53 ++-
>   tests/test-qemu-opts.c               |  37 +-
>   util/keyval.c                        | 230 +++++----
>   util/qemu-config.c                   | 141 +++---
>   util/qemu-option.c                   | 184 ++++---
>   27 files changed, 946 insertions(+), 1145 deletions(-)
> 

Ping?  It's been over a month (even if with the Christmas vacation).

Patches 1-2 were already reviewed so I have included them already.  I 
would like at least the next 14 patches to go in as soon as possible. 
(The rest can be routed through maintainer trees or I can post them 
together with the softmmu/vl.c cleanups).

Paolo

