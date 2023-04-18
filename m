Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A566E6A18
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:47:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pooT7-00031l-Q6; Tue, 18 Apr 2023 12:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pooT5-00030j-SF
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:46:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pooT4-0006DP-4T
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681836368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vmqQzLTMR4LdPnDs4HZ/YQ4kVcRUb8ezypvKhBpI+I0=;
 b=ir9yzZUg3/8hTmTSLjUt27SKoUrlqk/0DtJVqpXsgvRKM2Zp9DCbCwLc9cCYAvSXCWXinz
 TKald2J7qVJi2l82ZqzAr5WloxR6R4/+sz0HfxAjckJBayZ25Ol3uHlfTBmiQiARhY8g5c
 9U72jVGph+U+gcr5K08XPiHDlKimuQI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-5x0csZgbM6CAhpnzXBH4yQ-1; Tue, 18 Apr 2023 12:46:07 -0400
X-MC-Unique: 5x0csZgbM6CAhpnzXBH4yQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg10-20020a05600c3c8a00b003ef7b61e2fdso87673wmb.4
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 09:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681836366; x=1684428366;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vmqQzLTMR4LdPnDs4HZ/YQ4kVcRUb8ezypvKhBpI+I0=;
 b=NyhTbA+9yRhlaiY/LDgscWyDKrHZ3X/72buvHS43EkzazEKncXgMRbIhN4s8qZa5Lw
 rVqrXKSK2BiMOERAJ18WJ8QomaOZttTIqhsPpN48gj/my5S2fI71DmfDenllKcJDOMti
 r78wUGycffGgjXTxlUt8XltzFOjszQz+hemWF8kmnQoHrcj1b4h2fi3DHbVq2M7dZIoU
 ODlp0CdeHFkIzoe6ZPdqKkspU+CXB6msL44cDxrRocz9UNJzCzlunYjeOM8IIxuUaWvS
 Jc76JBxBwiPNL5u1zRrw3RJQjfcq6yUd0LcCoykNOWNfbdJB6830rYlsui5bKpVQk1/K
 jATg==
X-Gm-Message-State: AAQBX9fkqJBSTUWJ5ilaxSi+6alqS9bPKmRKTUm6U7/9EJ8dxSw9GG8H
 QijyBCmPcFklOy+nQbDm0z7wRwUTG31WtvkwQ2wDdoUImitGAKSfVD0vd1bRA/oSbf6XOH4MJGM
 VJGWQkCdfozCXmzc=
X-Received: by 2002:a05:600c:210b:b0:3f0:4428:9444 with SMTP id
 u11-20020a05600c210b00b003f044289444mr14159228wml.10.1681836366141; 
 Tue, 18 Apr 2023 09:46:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350bwEYkU7j1TEk8YUzOeXA6fKVKdah+xBiMKdMg7qJrLfXjW2fBksBCzV1JoX80w+Iv9GRzFiw==
X-Received: by 2002:a05:600c:210b:b0:3f0:4428:9444 with SMTP id
 u11-20020a05600c210b00b003f044289444mr14159202wml.10.1681836365843; 
 Tue, 18 Apr 2023 09:46:05 -0700 (PDT)
Received: from redhat.com ([2.52.4.37]) by smtp.gmail.com with ESMTPSA id
 e2-20020a5d65c2000000b002ceacff44c7sm13449325wrw.83.2023.04.18.09.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 09:46:05 -0700 (PDT)
Date: Tue, 18 Apr 2023 12:46:01 -0400
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
Message-ID: <20230418124519-mutt-send-email-mst@kernel.org>
References: <20230410083509.3311-1-arbn@yandex-team.com>
 <fcc6073f-280b-580e-b6f7-bc176a64e810@yandex-team.com>
 <A73B3DE0-41D0-4EDC-B589-2647158AD2D4@nutanix.com>
 <03b8f48d-b4a0-ca8f-064b-5fd937e376cc@yandex-team.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03b8f48d-b4a0-ca8f-064b-5fd937e376cc@yandex-team.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Apr 18, 2023 at 06:37:04PM +0200, Andrey Ryabinin wrote:
> On 4/18/23 07:13, Raphael Norwitz wrote:
> > Hey Andrey - apologies for the late reply here.
> > 
> > It sounds like you are dealing with a buggy guest, rather than a QEMU issue.
> 
> No arguing here, the guest is buggy.
> However, the issue with QEMU is that virtio-blk tolerate such buggy guest
> while vhost-user-blk is not.
> We've been using virtio-blk in our cloud for a while and recently started switching to vhost-user-blk
> which led us to discover this problem.
> 
> >> On Apr 10, 2023, at 11:39 AM, Andrey Ryabinin <arbn@yandex-team.com> wrote:
> >>
> >>
> >>
> >> On 4/10/23 10:35, Andrey Ryabinin wrote:
> >>> Some guests hang on boot when using the vhost-user-blk-pci device,
> >>> but boot normally when using the virtio-blk device. The problem occurs
> >>> because the guest advertises VIRTIO_F_VERSION_1 but kicks the virtqueue
> >>> before setting VIRTIO_CONFIG_S_DRIVER_OK, causing vdev->start_on_kick to
> > 
> > Virtio 1.1 Section 3.1.1, says during setup “[t]he driver MUST NOT notify the device before setting DRIVER_OK.”
> > 
> > Therefore what you are describing is buggy guest behavior. Sounds like the driver should be made to either
> > - not advertise VIRTIO_F_VERSION_1
> > - not kick before setting VIRTIO_CONFIG_S_DRIVER_OK
> > 
> > If anything, the virtio-blk virtio_blk_handle_output() function should probably check start_on_kick?
> > 
> 
> Ideally this should have been done from the start. But if we do it now we'll just break these guests.

The problem with hacks like this is the problem proliferates.  What are
those guests and how hard are they to fix?

-- 
MST


