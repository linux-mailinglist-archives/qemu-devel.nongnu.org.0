Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8106EA590
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 10:08:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pplnE-0006ae-QY; Fri, 21 Apr 2023 04:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pplnD-0006aQ-F6
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:06:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pplnB-0004SI-Mz
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682064413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3JzMloE6eykL1Id7czMi9Pp8e3MzNIGvKNiSOb7YLY=;
 b=A2GOgtW4uZfALMo7FH1PW1JBGdUgIbpUTQmIOEYJYWOmiPaXVlKvEQhA3TiuHb5Khio3tB
 MXLNasoTmgLR/TG7pV3gjugXjkzvlnDlX0eiiYS7Dva0zUBvxCkEppkQ9TD+bDHEp7YFIn
 n03aqM6eaQzz8mwmOHaB6wk7KexsZUE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-XRMJ2eyIOlSfi345pv-s-A-1; Fri, 21 Apr 2023 04:06:51 -0400
X-MC-Unique: XRMJ2eyIOlSfi345pv-s-A-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2f43679bcf5so872674f8f.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 01:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682064409; x=1684656409;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h3JzMloE6eykL1Id7czMi9Pp8e3MzNIGvKNiSOb7YLY=;
 b=BKOJeJnLrm2LxtID91HuT77KMgzAiA/T13qYOPtq9Y7RbSFbc7uC8pDI7Nwmnvdfn4
 Mli5bCLi3LTzu+pKRaH19lGWdfody2f5yIGQqThTcvSkNHIyuxnh7Mr2N1l0XElkKMbd
 A6vPSMtfhXsMw1XRvTXNnHzVxazv5Z+tMBWnl1MOhTZadU/7nB9usINdoh7ri9RENX2s
 RW0dwHGo8iLhBMppNGDY1MvtzMXUp8LtFaAzQIy55cybpYmlBPS+wr30WBF3kkQznCoI
 /3hCZo4InFYNpEzbWY01br/Qjv5dtG0FjG3IBgw+hVQqXaJWmTnxdAkLctIHsjNdWTTz
 BiEQ==
X-Gm-Message-State: AAQBX9f0lmXXOI6uNBjw9oB0kOukpO28jNYEeK8tyjkuebv/bs8Qy+Dp
 vyzMfTmb+I7MdeU2MLj0Aof7nGMNHa68TiCZaoJhPaH5MylLMwQCSndCnfBAXTdTCR03/FBELru
 iloHpvnZAr35pQBM=
X-Received: by 2002:a5d:498c:0:b0:301:5615:26e4 with SMTP id
 r12-20020a5d498c000000b00301561526e4mr2687586wrq.32.1682064409626; 
 Fri, 21 Apr 2023 01:06:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350bS6VMF7B96JCDlQ/54FMg57M6K4eisW7Fa1diipd/py56B/KcIypPM0WYKDr12nN1a1RWEKg==
X-Received: by 2002:a5d:498c:0:b0:301:5615:26e4 with SMTP id
 r12-20020a5d498c000000b00301561526e4mr2687567wrq.32.1682064409297; 
 Fri, 21 Apr 2023 01:06:49 -0700 (PDT)
Received: from redhat.com ([2.55.62.70]) by smtp.gmail.com with ESMTPSA id
 m4-20020adffa04000000b002fe96f0b3acsm3823890wrr.63.2023.04.21.01.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 01:06:48 -0700 (PDT)
Date: Fri, 21 Apr 2023 04:06:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Yongji Xie <xieyongji@baidu.com>, Chai Wen <chaiwen@baidu.com>,
 Ni Xun <nixun@baidu.com>,
 "d-tatianin@yandex-team.com" <d-tatianin@yandex-team.com>,
 "yc-core@yandex-team.com" <yc-core@yandex-team.com>,
 "vsementsov@yandex-team.com" <vsementsov@yandex-team.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>
Subject: Re: [PATCH] block/vhost-user-blk: Fix hang on boot for some odd guests
Message-ID: <20230421040200-mutt-send-email-mst@kernel.org>
References: <20230410083509.3311-1-arbn@yandex-team.com>
 <fcc6073f-280b-580e-b6f7-bc176a64e810@yandex-team.com>
 <A73B3DE0-41D0-4EDC-B589-2647158AD2D4@nutanix.com>
 <20230418020505-mutt-send-email-mst@kernel.org>
 <017e139d-211f-7917-0461-71ab57eefbbe@yandex-team.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <017e139d-211f-7917-0461-71ab57eefbbe@yandex-team.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Apr 18, 2023 at 07:20:29PM +0200, Andrey Ryabinin wrote:
> 
> 
> On 4/18/23 08:17, Michael S. Tsirkin wrote:
> > On Tue, Apr 18, 2023 at 05:13:11AM +0000, Raphael Norwitz wrote:
> >> Hey Andrey - apologies for the late reply here.
> >>
> >> It sounds like you are dealing with a buggy guest, rather than a QEMU issue.
> >>
> >>> On Apr 10, 2023, at 11:39 AM, Andrey Ryabinin <arbn@yandex-team.com> wrote:
> >>>
> >>>
> >>>
> >>> On 4/10/23 10:35, Andrey Ryabinin wrote:
> >>>> Some guests hang on boot when using the vhost-user-blk-pci device,
> >>>> but boot normally when using the virtio-blk device. The problem occurs
> >>>> because the guest advertises VIRTIO_F_VERSION_1 but kicks the virtqueue
> >>>> before setting VIRTIO_CONFIG_S_DRIVER_OK, causing vdev->start_on_kick to
> >>
> >> Virtio 1.1 Section 3.1.1, says during setup “[t]he driver MUST NOT notify the device before setting DRIVER_OK.”
> >>
> >> Therefore what you are describing is buggy guest behavior. Sounds like the driver should be made to either
> >> - not advertise VIRTIO_F_VERSION_1
> >> - not kick before setting VIRTIO_CONFIG_S_DRIVER_OK
> >>
> >> If anything, the virtio-blk virtio_blk_handle_output() function should probably check start_on_kick?
> > 
> > Question is, how easy is this guest to fix.
> > 
> 
> I wouldn't count on that.
> 
> In this case the guest is Foritgate firewall, apparently from this guys https://www.fortinet.com/
> It seems that the kernel they use claims itself as 3.2.16 Linux kernel, however it looks like
> it's not vanilla kernel, but modified with some backports. I'm guessing that they backported
> the patches introducing VIRTIO_F_VERSTION_1, but they didn't add this patch https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7a11370e5e6c26566904bb7f08281093a3002ff2
> 
> I've tried to look the sources of the kernel they use but failed to find any.
> Found only some news about gpl voilation from 2005 )

All I remember is this is a can of worms, the change seems risky
frankly. If you like, I'm open to an unstable property
(starting with "x-") that forces start on kick.
Will be handy for debugging too.


-- 
MST


