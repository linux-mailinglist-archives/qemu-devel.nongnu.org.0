Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FC32DAA9C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 11:08:34 +0100 (CET)
Received: from localhost ([::1]:38542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp7Fx-00067P-TP
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 05:08:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kp7Ee-0005gd-3s
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:07:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kp7Ea-0007ny-UI
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:07:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608026827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iPzhgAuaJaUAESckIWnWLiaGwxY53l8B1qCDaF2BD3Q=;
 b=I2aF7H+xR0PN4hDSk7zyQ5hhuyu9Y4RHBiVFp1+23QEb+UmtFHr2A1ZXx8pMlbYlxDaNCL
 tpb957HQNqqPUmFoy5CkFN6N5AxG2p/C9eu8zJgjEI+jvRNoEOm4VY8OzWQcfHeWIRmaOO
 0r/56j9SrEsxhr7icp2578uNasJKqKw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-IXEjvchFOuCJllW7nf-JOA-1; Tue, 15 Dec 2020 05:07:05 -0500
X-MC-Unique: IXEjvchFOuCJllW7nf-JOA-1
Received: by mail-ej1-f70.google.com with SMTP id gs3so3410883ejb.5
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 02:07:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iPzhgAuaJaUAESckIWnWLiaGwxY53l8B1qCDaF2BD3Q=;
 b=ifLcoDFxUcKh3dxSj5O3cJ8weXFkQ9XTKOVav1pXZOb0Kf2ztOcr6BrZlh8kjICYkp
 7KZPhVP3T4FEhWTc2/Pj6ehPSIg4ADU2litbiDuSyIu5hmQq23ydQxrDqkr/c/yTWOW2
 1fquPTyQgZDoUuc2XwpmHu5AATGM0I0xce/QnONT/XUzR8nR3b3/VDZywtljuDxMuGK2
 IqD5EdXsfzEspOLqI5C0w+EiZxdMYdQXrZeXsLO9gnkFh9wdqRsYY0H34OCh7F5qtnWd
 zFXwlxOgi4JgywP2ApZ8/RoRmNxFkVWdYIaIzhQWw4blDM+RyI7OClLA7bLO6vDQMyzS
 A4TQ==
X-Gm-Message-State: AOAM533kMET1wtYPRGkqtz1simBe/ZZAcacgXHrBkf8Qo8XG1rgtIx3k
 LmWgcVKuEO4pR5AG9fRLrr5S3wYgxnLWd1cIgn1q9Yc3B73MNGUgI5Ld1fBd0Q2sF9UV8oOCOUY
 QNS9PrT1QUDWo/f8=
X-Received: by 2002:a17:906:81d6:: with SMTP id
 e22mr9163953ejx.476.1608026824541; 
 Tue, 15 Dec 2020 02:07:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxL2qetUny8y7JAzRohWN70gros5XyXISjbwd/nzCtNPPm5OBg3Vy/ZD2ZVPlgmEKEC5udQpw==
X-Received: by 2002:a17:906:81d6:: with SMTP id
 e22mr9163927ejx.476.1608026824315; 
 Tue, 15 Dec 2020 02:07:04 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s24sm998452ejb.20.2020.12.15.02.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 02:07:03 -0800 (PST)
Subject: Re: [PATCH 0/3] qemu-timer: Make timer_free() imply timer_del()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201214203050.6993-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <444e7d74-e487-0811-4856-baf39c41af0e@redhat.com>
Date: Tue, 15 Dec 2020 11:07:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201214203050.6993-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/12/20 21:30, Peter Maydell wrote:
> Currently timer_free() is a simple wrapper for g_free().  This means
> that the timer being freed must not be currently active, as otherwise
> QEMU might crash later when the active list is processed and still
> has a pointer to freed memory on it.  As a result almost all calls to
> timer_free() are preceded by a timer_del() call, as can be seen in
> the output of
>    git grep -B1 '\<timer_free\>'
> 
> This is unfortunate API design as it makes it easy to accidentally
> misuse (by forgetting the timer_del()), and the correct use is
> annoyingly verbose.
> 
> Patch 1 makes timer_free() call timer_del() if the timer is active.
> Patch 2 is a Coccinelle script to remove any timer_del() calls
> that are immediately before the timer_free().
> Patch 3 is the result of running the Coccinelle script on the
> whole tree.
> 
> I could split up patch 3, but for 58 deleted lines over 42 files
> created entirely automatedly, it seemed to me to be simpler as one
> patch.

Looks good.  Even better would be to make timers embedded in structs 
rather than heap-allocated, but this patch makes things a little bit 
better in that respect since we have a 1:1 correspondence 
(timer_{new->init} and timer_{free->del}) between the APIs.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> 
> Peter Maydell (3):
>    util/qemu-timer: Make timer_free() imply timer_del()
>    scripts/coccinelle: New script to remove unnecessary timer_del() calls
>    Remove superfluous timer_del() calls
> 
>   scripts/coccinelle/timer-del-timer-free.cocci | 18 +++++++++++++
>   include/qemu/timer.h                          | 27 +++++++++++--------
>   block/iscsi.c                                 |  2 --
>   block/nbd.c                                   |  1 -
>   block/qcow2.c                                 |  1 -
>   hw/block/nvme.c                               |  2 --
>   hw/char/serial.c                              |  2 --
>   hw/char/virtio-serial-bus.c                   |  2 --
>   hw/ide/core.c                                 |  1 -
>   hw/input/hid.c                                |  1 -
>   hw/intc/apic.c                                |  1 -
>   hw/intc/ioapic.c                              |  1 -
>   hw/ipmi/ipmi_bmc_extern.c                     |  1 -
>   hw/net/e1000.c                                |  3 ---
>   hw/net/e1000e_core.c                          |  8 ------
>   hw/net/pcnet-pci.c                            |  1 -
>   hw/net/rtl8139.c                              |  1 -
>   hw/net/spapr_llan.c                           |  1 -
>   hw/net/virtio-net.c                           |  2 --
>   hw/s390x/s390-pci-inst.c                      |  1 -
>   hw/sd/sd.c                                    |  1 -
>   hw/sd/sdhci.c                                 |  2 --
>   hw/usb/dev-hub.c                              |  1 -
>   hw/usb/hcd-ehci.c                             |  1 -
>   hw/usb/hcd-ohci-pci.c                         |  1 -
>   hw/usb/hcd-uhci.c                             |  1 -
>   hw/usb/hcd-xhci.c                             |  1 -
>   hw/usb/redirect.c                             |  1 -
>   hw/vfio/display.c                             |  1 -
>   hw/virtio/vhost-vsock-common.c                |  1 -
>   hw/virtio/virtio-balloon.c                    |  1 -
>   hw/virtio/virtio-rng.c                        |  1 -
>   hw/watchdog/wdt_diag288.c                     |  1 -
>   hw/watchdog/wdt_i6300esb.c                    |  1 -
>   migration/colo.c                              |  1 -
>   monitor/hmp-cmds.c                            |  1 -
>   net/announce.c                                |  1 -
>   net/colo-compare.c                            |  1 -
>   net/slirp.c                                   |  1 -
>   replay/replay-debugging.c                     |  1 -
>   target/s390x/cpu.c                            |  2 --
>   ui/console.c                                  |  1 -
>   ui/spice-core.c                               |  1 -
>   util/throttle.c                               |  1 -
>   44 files changed, 34 insertions(+), 69 deletions(-)
>   create mode 100644 scripts/coccinelle/timer-del-timer-free.cocci
> 


