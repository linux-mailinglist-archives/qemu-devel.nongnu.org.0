Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D542EA940
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 11:56:58 +0100 (CET)
Received: from localhost ([::1]:40276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwk1J-0007Jk-EY
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 05:56:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kwjyk-0006LX-E7
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 05:54:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kwjyf-0003QV-Oe
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 05:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609844050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AjlKt0DxN9q+o9e8Ldu72Sw2yeX451t2zxd2pH4mfKo=;
 b=PmX4EmLRzFFhiZHXRKQ9AsTBf+PIChnWaId2eWGJ2yPIjdhtJD+xacEpHuGlHaHj7M8FjX
 BF4yTJ516NqInFZZmnG2QPHDFzF9b1HI7NcOvlFzqzrmUe1R08fPRqOTRD7DJGnXwYdRAQ
 02Ir/zOE/pU21jv2u3B5hwb77AFDw2M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-9fnmCzh9PDmIb2mQGT7fQQ-1; Tue, 05 Jan 2021 05:54:08 -0500
X-MC-Unique: 9fnmCzh9PDmIb2mQGT7fQQ-1
Received: by mail-wm1-f70.google.com with SMTP id 137so224791wmb.5
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 02:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AjlKt0DxN9q+o9e8Ldu72Sw2yeX451t2zxd2pH4mfKo=;
 b=DXnne8QRbw+OSMsQBcFSufVUACLWqMj6/FjrtZs/xLFmxKPO+zT74dlSptQ5/cM7Hu
 MKZsCByNb6+/R4bIhE0xzmB+shRA/GFrxI9jIi4evjQ00p7rD5AUNzVcZakj9MIGOVaQ
 z7oipBzB115ofREYUHO2im6HxRxlFiBsmSTlBtOq4yEgVCMa4FtYutRXoFa++S7DNvP4
 JjjmGeHjih03PHymmiqa0Ouj6Q8XLsqCffDKDhJW1WrivL5V6ZLzee9wAVhQOm1RFAp5
 zw+trmb4cFYHFBWYipqaZQG2/Rb9EqKlbkGjOxJrUkeDM2V6xllID5xVKfzvlJrZdqm+
 kgiA==
X-Gm-Message-State: AOAM531eXERBATtzW8XF3wRsk9g5ToCWhxfXyU5VUkBj19UuiFa3GuNU
 CIihR170U/8XroKSwkhD+xbYmecNV5DXUbxYZZKltq2F2GwEFMaoDDiIWHjHYO/PGUTIchneCbn
 b/7tlLmmeBJqd8TA=
X-Received: by 2002:a1c:9d8b:: with SMTP id g133mr2931459wme.189.1609844047548; 
 Tue, 05 Jan 2021 02:54:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPljPEyNHtNxDBgXTvMJIzXQDWBC7vUT59PMwVqAzrYMOzg64H0PCa4ZZJ8lYNNqVm1I5BUQ==
X-Received: by 2002:a1c:9d8b:: with SMTP id g133mr2931440wme.189.1609844047362; 
 Tue, 05 Jan 2021 02:54:07 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id n16sm57453395wrj.26.2021.01.05.02.54.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 02:54:06 -0800 (PST)
Subject: Re: [PATCH v2 0/4] qemu-timer: Make timer_free() imply timer_del()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201215154107.3255-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1c27f158-a14b-ad6e-9170-0ecaa53a1f6a@redhat.com>
Date: Tue, 5 Jan 2021 11:54:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201215154107.3255-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 4:41 PM, Peter Maydell wrote:
> Currently timer_free() is a simple wrapper for g_free().  This means
> that the timer being freed must not be currently active, as otherwise
> QEMU might crash later when the active list is processed and still
> has a pointer to freed memory on it.  As a result almost all calls to
> timer_free() are preceded by a timer_del() call, as can be seen in
> the output of
>   git grep -B1 '\<timer_free\>'
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
> Patch 4 makes a by-hand cleanup of a bit of the Arm CPU code
> not caught by Coccinelle because it included a pointless
> timer_deinit() between timer_del() and timer_free().
> 
> I could split up patch 3, but for 58 deleted lines over 42 files
> created entirely automatedly, it seemed to me to be simpler as one
> patch.
> 
> Changes v1->v2:
>  * patch 1: unconditionally call timer_del() rather than trying
>    to be clever
>  * patch 4: new patch
> 
> thanks
> -- PMM
> 
> Peter Maydell (4):
>   util/qemu-timer: Make timer_free() imply timer_del()
>   scripts/coccinelle: New script to remove unnecessary timer_del() calls
>   Remove superfluous timer_del() calls
>   target/arm: Remove timer_del()/timer_deinit() before timer_free()
> 
>  scripts/coccinelle/timer-del-timer-free.cocci | 18 +++++++++++++
>  include/qemu/timer.h                          | 25 +++++++++++--------
>  block/iscsi.c                                 |  2 --
>  block/nbd.c                                   |  1 -
>  block/qcow2.c                                 |  1 -
>  hw/block/nvme.c                               |  2 --
>  hw/char/serial.c                              |  2 --
>  hw/char/virtio-serial-bus.c                   |  2 --
>  hw/ide/core.c                                 |  1 -
>  hw/input/hid.c                                |  1 -
>  hw/intc/apic.c                                |  1 -
>  hw/intc/ioapic.c                              |  1 -
>  hw/ipmi/ipmi_bmc_extern.c                     |  1 -
>  hw/net/e1000.c                                |  3 ---
>  hw/net/e1000e_core.c                          |  8 ------
>  hw/net/pcnet-pci.c                            |  1 -
>  hw/net/rtl8139.c                              |  1 -
>  hw/net/spapr_llan.c                           |  1 -
>  hw/net/virtio-net.c                           |  2 --
>  hw/s390x/s390-pci-inst.c                      |  1 -
>  hw/sd/sd.c                                    |  1 -
>  hw/sd/sdhci.c                                 |  2 --
>  hw/usb/dev-hub.c                              |  1 -
>  hw/usb/hcd-ehci.c                             |  1 -
>  hw/usb/hcd-ohci-pci.c                         |  1 -
>  hw/usb/hcd-uhci.c                             |  1 -
>  hw/usb/hcd-xhci.c                             |  1 -
>  hw/usb/redirect.c                             |  1 -
>  hw/vfio/display.c                             |  1 -
>  hw/virtio/vhost-vsock-common.c                |  1 -
>  hw/virtio/virtio-balloon.c                    |  1 -
>  hw/virtio/virtio-rng.c                        |  1 -
>  hw/watchdog/wdt_diag288.c                     |  1 -
>  hw/watchdog/wdt_i6300esb.c                    |  1 -
>  migration/colo.c                              |  1 -
>  monitor/hmp-cmds.c                            |  1 -
>  net/announce.c                                |  1 -
>  net/colo-compare.c                            |  1 -
>  net/slirp.c                                   |  1 -
>  replay/replay-debugging.c                     |  1 -
>  target/arm/cpu.c                              |  2 --
>  target/s390x/cpu.c                            |  2 --
>  ui/console.c                                  |  1 -
>  ui/spice-core.c                               |  1 -
>  util/throttle.c                               |  1 -
>  45 files changed, 32 insertions(+), 71 deletions(-)
>  create mode 100644 scripts/coccinelle/timer-del-timer-free.cocci
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


