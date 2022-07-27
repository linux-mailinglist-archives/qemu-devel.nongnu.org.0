Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D58D582761
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 15:10:44 +0200 (CEST)
Received: from localhost ([::1]:56744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGgoE-0001BZ-OF
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 09:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oGgkb-00067n-Uc
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:07:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oGgkY-0007JO-Ls
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658927212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4XejCrChvZSYE2VxOUDJ3jksFKFezBbn1sw+B8wRr2E=;
 b=SMKL1B1f/BaJTlOLAZKyJDI6FCIMhfWRYumYLXk4aWLbQBW6AjEj/n1ViP+FwY3DvOGRiM
 3GvR6I0hm6KLE/j0iLQjuCpTUUY7Vk6PjfWXiHd7O1UBu3N3PzVne0Yil13cu0bYOROtmS
 enklut2R6WqpIitKwFt0GWJtE1rGPbg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-hD75e8EzMru58AQWaeCxPQ-1; Wed, 27 Jul 2022 09:06:51 -0400
X-MC-Unique: hD75e8EzMru58AQWaeCxPQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 k27-20020a05600c1c9b00b003a2fee19a80so1151660wms.1
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 06:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4XejCrChvZSYE2VxOUDJ3jksFKFezBbn1sw+B8wRr2E=;
 b=gYLhgZFPyuYTKNPWVzEi+B0aDC0k3OLis2iLsWWe/RUbM8W36mf1MZdETPsfW8jEvF
 SqXJ/MUGQsBfAP82bRNbD15yocuNP8UcLRctjj3Ee3NEP6yNGAFDzHAeRTVONuxCg7T0
 1qj7MpOfD6S02bcXtwF93fCJwVevE4NCf36RYNm07Q3CHvOlQIAn5jI3kMIG3G78aH/e
 i3IEs9m9PciNgPgkZP5ocTWpkGHeqzxEA/V7lWWB4dP12Tsg0zSBhH5Xl/uNiswRzxj8
 fsrquDYLIbZqwFgkk76awSTyRI1Qxth4yYY+Oad+i7Kgg70TNfDG517X3Kic6WApJ2kw
 KeFQ==
X-Gm-Message-State: AJIora9mKM9LfC5onumzkTMR9X2AXThcogeWDt5uOWZTFnRqIYEDd51e
 +gvj69YaBmeouKRmupXe11J3/Hn+q/JfTCjR6XDtVpjRFKFx5m8iVlvsgW4raOptVwzkUcfrkce
 88xlpnfuTkeVRmDg=
X-Received: by 2002:a05:6000:2cf:b0:21e:8036:1d0b with SMTP id
 o15-20020a05600002cf00b0021e80361d0bmr12202253wry.94.1658927209768; 
 Wed, 27 Jul 2022 06:06:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t67gpjAQJwh0PAkibf/oQB5ELnI1Upw5px82QK7VqcoTUa7HpHLFIDa14/csg8ciQoo+yyCg==
X-Received: by 2002:a05:6000:2cf:b0:21e:8036:1d0b with SMTP id
 o15-20020a05600002cf00b0021e80361d0bmr12202216wry.94.1658927209231; 
 Wed, 27 Jul 2022 06:06:49 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-178.retail.telecomitalia.it.
 [79.46.200.178]) by smtp.gmail.com with ESMTPSA id
 k22-20020a5d5256000000b0021d6a520ce9sm17470844wrc.47.2022.07.27.06.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 06:06:47 -0700 (PDT)
Date: Wed, 27 Jul 2022 15:06:44 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Denis V. Lunev" <den@virtuozzo.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 hreitz@redhat.com, stefanha@redhat.com
Subject: Re: [RFC patch 0/1] block: vhost-blk backend
Message-ID: <20220727130644.wspwadl5645gfdpr@sgarzare-redhat>
References: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
 <20220726094740-mutt-send-email-mst@kernel.org>
 <94e5b188-8489-9f75-a481-015667bc0ba4@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <94e5b188-8489-9f75-a481-015667bc0ba4@virtuozzo.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 26, 2022 at 04:15:48PM +0200, Denis V. Lunev wrote:
>On 26.07.2022 15:51, Michael S. Tsirkin wrote:
>>On Mon, Jul 25, 2022 at 11:55:26PM +0300, Andrey Zhadchenko wrote:
>>>Although QEMU virtio-blk is quite fast, there is still some room for
>>>improvements. Disk latency can be reduced if we handle virito-blk requests
>>>in host kernel so we avoid a lot of syscalls and context switches.
>>>
>>>The biggest disadvantage of this vhost-blk flavor is raw format.
>>>Luckily Kirill Thai proposed device mapper driver for QCOW2 format to attach
>>>files as block devices: https://www.spinics.net/lists/kernel/msg4292965.html
>>That one seems stalled. Do you plan to work on that too?
>We have too. The difference in numbers, as you seen below is quite too
>much. We have waited for this patch to be sent to keep pushing.
>
>It should be noted that may be talk on OSS this year could also push a bit.

Cool, the results are similar of what I saw when I compared vhost-blk 
and io_uring passthrough with NVMe (Slide 7 here: [1]).

About QEMU block layer support, we recently started to work on libblkio 
[2]. Stefan also sent an RFC [3] to implement the QEMU BlockDriver.
Currently it supports virtio-blk devices using vhost-vdpa and 
vhost-user.
We could add support for vhost (kernel) as well, though, we were 
thinking of leveraging vDPA to implement in-kernel software device as 
well.

That way we could reuse a lot of the code to support both hardware and 
software accelerators.

In the talk [1] I describe the idea a little bit, and a few months ago I 
did a PoC (unsubmitted RFC) to see if it was feasible and the numbers 
were in line with vhost-blk.

Do you think we could join forces and just have an in-kernel vdpa-blk 
software device?

Of course we could have both vhost-blk and vdpa-blk, but with vDPA 
perhaps we can have one software stack to maintain for both HW and 
software accelerators.

Thanks,
Stefano

[1] 
https://kvmforum2021.sched.com/event/ke3a/vdpa-blk-unified-hardware-and-software-offload-for-virtio-blk-stefano-garzarella-red-hat
[2] https://gitlab.com/libblkio/libblkio
[3] 
https://lore.kernel.org/qemu-devel/20220708041737.1768521-1-stefanha@redhat.com/


