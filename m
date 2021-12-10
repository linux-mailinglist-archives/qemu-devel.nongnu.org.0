Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E4C47040D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 16:41:07 +0100 (CET)
Received: from localhost ([::1]:52812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvi1C-0003Bz-DH
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 10:41:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mvhyP-0007Rq-N2
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:38:14 -0500
Received: from [2a00:1450:4864:20::52e] (port=40665
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mvhyN-00027C-Fs
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:38:12 -0500
Received: by mail-ed1-x52e.google.com with SMTP id r25so30728540edq.7
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 07:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kDcfDfzNSjS6NbKwVULw814kgFJ/zitlP1xt5pdqtX0=;
 b=bYuwxjq58BkIj0DyhGVZGzcOrZGmg52vwpkJpQ6WUmC6HXcwqeRidSsjBhfNoTUpmV
 tOVIk0ZayFEKO2qughxDyfe9choLeJmF7lKsS3Eyv3eZ24eikivP4HWkNOtH/H5pveeM
 7PBlmW81ZqJKVq4JagV60UI+G3XIfNjJbsPe+7So3iJVK+e2IE8Ak6fzHG8F6dWRxTtM
 IrjiW3QKWX9OA0lBnNLnv10PIp1Y6OzUJqUmnT1pxFxagZJjshExCtoCOmLbf1IdpHck
 enOPF/SUsm/6ExtZxgAaNMWEuIiGHi17kj8O09/+cs5YhA4PAfw7rdXB9ibGLFBMviDt
 hGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kDcfDfzNSjS6NbKwVULw814kgFJ/zitlP1xt5pdqtX0=;
 b=G9DcmvfwFQw7s9sCPrrEP+V1CwHH72M6809k+WQlU5jwMDg453pu+zZnzMay/tV0wu
 2jmMCoK4Pa+lq0WFjxIlabqYmLr94ZZzgHrieeFb5rWeJ/LR4BVOXYI39Kh71GBy3yVn
 pddh42ya2JaGvBFMWrBzN74IKFBNBZjyjMVtU7Fs8d7+cIUXl6d7DyBQNJRyKFAR4SPJ
 8qQOMOb2qv/lRGLBepgBM88O0NJIacCs+s1NbkaKJnuJmLDWPLND1YCfjnMPZe33XRtn
 Dk9fOSAWT/FJfisipRia6g6tRdBLmH++xhy+oV0supM9Ldy43ZWhk4ys3a20oesVtNGD
 7pCQ==
X-Gm-Message-State: AOAM531OfIeLNwgAT9F1h34Ay2x78oNDONLXcIsnsIywhKbF0CK4gPum
 FPrhNDlGr3Nh11g4dAJxolwFoH1SeR0=
X-Google-Smtp-Source: ABdhPJyHy9+0fIzXuyEeUPabtp68LgDzWcQKVCXsaWAYZj56MH04Y3rAKF4HGibDKLhdKng0k78QZA==
X-Received: by 2002:a17:906:d550:: with SMTP id
 cr16mr24797343ejc.544.1639150690029; 
 Fri, 10 Dec 2021 07:38:10 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:48f9:bea:a04c:3dfe?
 ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.googlemail.com with ESMTPSA id d18sm1617435edj.23.2021.12.10.07.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 07:38:09 -0800 (PST)
Message-ID: <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
Date: Fri, 10 Dec 2021 16:38:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Redesign of QEMU startup & initial configuration
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87mtl88t0j.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.317,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 14:54, Markus Armbruster wrote:
> I want an open path to a single binary.  Taking years to get there is
> fine.

The single binary is a distraction in my opinion.  Imagine
instead of vl.c you have this in your second binary:

/*
  * This copyright line means that at some point the below actually compiled
  * in my tree (though it was only a stub); I am not fully making it up.
  *
  * Copyright (c) 2020 Red Hat, Inc.
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */

#include "qemu/osdep.h"
#include "qemu/rcu.h"
#include "qemu-common.h"
#include "chardev/char.h"
#include "monitor/monitor.h"
#include "qapi/error.h"
#include "qapi/qapi-commands-misc.h"
#include "qapi/qapi-commands-ui.h"
#include "qemu/systemd.h"
#include "sysemu/cpu-timers.h"
#include "sysemu/sysemu.h"
#include "ui/console.h"
#include "hw/qdev-core.h"

static void open_socket_and_monitor(void)
{
     int nfds = check_socket_activation();
     Chardev *chardev;
     if (nfds > 1) {
         error_report("QEMU only supports listening on one socket");
         exit(1);
     }
     if (!nfds) {
         ChardevBackend backend = {
             .type = CHARDEV_BACKEND_KIND_STDIO,
             .u.stdio.data = &(ChardevStdio) {
                 .has_signal = true,
                 .signal = false
             }
         };
         chardev = qemu_chardev_new("#qmp0", TYPE_CHARDEV_STDIO, &backend, NULL, &error_fatal);
     } else {
         ChardevBackend backend = {
            .type = CHARDEV_BACKEND_KIND_SOCKET,
            .u.socket.data = &(ChardevSocket) {
                .addr = &(SocketAddressLegacy) {
                    .type = SOCKET_ADDRESS_LEGACY_KIND_FD,
                    .u.fd.data = &(String){
                        .str = (char *) stringify(FIRST_SOCKET_ACTIVATION_FD)
                    }
                }
            }
         };
         chardev = qemu_chardev_new("#qmp0", TYPE_CHARDEV_SOCKET, &backend, NULL, &error_fatal);
     }
     monitor_init_qmp(chardev, true, &error_fatal);
}

void qemu_init(int argc, char **argv, char **envp)
{
     error_init(argv[0]);
     qemu_init_exec_dir(argv[0]);
     qemu_init_subsystems();

     /* Missing: parse -name, -sandbox, -trace, -L */

     loc_set_none();
     rcu_disable_atfork();
     qemu_init_main_loop(&error_fatal);
     cpu_timers_init();
     open_socket_and_monitor();
     init_displaystate();
     os_setup_signal_handling();
}

This is the ultimate QEMU startup code.  If we can get this code to
actually build a machine, you've reached the point where you don't care
about what is in the command line parser; and consequently you don't care
if there is one binary or two.

Paolo

