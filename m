Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2AC6FA6C2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 12:23:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvy0z-0007oF-Rc; Mon, 08 May 2023 06:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pvy0u-0007nk-QE
 for qemu-devel@nongnu.org; Mon, 08 May 2023 06:22:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pvy0r-0000xq-Fx
 for qemu-devel@nongnu.org; Mon, 08 May 2023 06:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683541356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nfqskQYslEXrwpAAf1cDzn32BjKtsVks0Tr9H0t/SyI=;
 b=WaZrSazibGBTZ7x90JcsABt5AQgeqpTNGuw9ETK4FWhdnAFkYORqYnMAolO3kUG+BIMuAl
 H7p40a1J4ImRCh3kcACdohRWvaDkYO6qjrznIzvKAwI+//KHvw2D1sWIHityzfz+I8UqiB
 ewq4bqm6o0W7xnxFNgKrxZE94Mxf/R4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-rgwbbMQdNw-YDM5FHfJiJQ-1; Mon, 08 May 2023 06:22:35 -0400
X-MC-Unique: rgwbbMQdNw-YDM5FHfJiJQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-306281812d6so1679232f8f.2
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 03:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683541354; x=1686133354;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nfqskQYslEXrwpAAf1cDzn32BjKtsVks0Tr9H0t/SyI=;
 b=eeFli9N0wBeIgpF+p/cXRSS9Gsn0SO915X1cg2CV787lakaXDdFm7TJoXYq78RVRj5
 A8ycYWbp1x8x4wDuWV0vokKvVfc3D5t2QpjI8HioYVCGvF1Hdxln6Rdl/Mc61wplmJCW
 345eBphk9pcpv5JRT44+RvYIIuAaQNS+UfhGS6NVegZB2Fje8jBF2gFXATN1dyaNy5qz
 MvHP+1iVYbuwpr6O+dMGRcJixskjaiwabNkh7HXvLiD03Wtz0dy5urX15B5VUPbMlyJS
 BhTUIduPP4jRmRAI5xS/pXgznsoJpk7a2BfjokJPFwr/Kt0QRug18APJdakK+w7o3pRZ
 UM4A==
X-Gm-Message-State: AC+VfDxp3WK19CZl16MRlTQn9qIcBnVz9zsu7y1eh/qKDSz7+9uYlRqh
 zQEP1i07LoCPdcoJ26utgHNrPWw0bynxj4u03/7wcRRyMhTxpAkX+mpQJpVjZB21EQ59YVuiBcg
 MT21dyuOn6gc/DVE=
X-Received: by 2002:a5d:528a:0:b0:307:9702:dfc3 with SMTP id
 c10-20020a5d528a000000b003079702dfc3mr1609210wrv.34.1683541354294; 
 Mon, 08 May 2023 03:22:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Cu7tX3m2xW+GXV3JYyArUkBpV7ZvKeWa7H6QofaG5xrZTOF9wMICGfsBn0ZG+vvN7XEWcFA==
X-Received: by 2002:a5d:528a:0:b0:307:9702:dfc3 with SMTP id
 c10-20020a5d528a000000b003079702dfc3mr1609191wrv.34.1683541354013; 
 Mon, 08 May 2023 03:22:34 -0700 (PDT)
Received: from redhat.com ([31.187.78.15]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d518f000000b003077a19cf75sm10810026wrv.60.2023.05.08.03.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 03:22:33 -0700 (PDT)
Date: Mon, 8 May 2023 06:22:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Jason Wang <jasowang@redhat.com>, Lei Yang <leiyang@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] virtio-net: not enable vq reset feature unconditionally
Message-ID: <20230508062210-mutt-send-email-mst@kernel.org>
References: <20230504101447.389398-1-eperezma@redhat.com>
 <1683339216.3364966-2-xuanzhuo@linux.alibaba.com>
 <CAJaqyWfzs00bi5qDHnyHVnf0vEK02hSiC15uJpGVi_eoRTmg7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWfzs00bi5qDHnyHVnf0vEK02hSiC15uJpGVi_eoRTmg7Q@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Mon, May 08, 2023 at 11:09:46AM +0200, Eugenio Perez Martin wrote:
> On Sat, May 6, 2023 at 4:25 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> >
> > On Thu,  4 May 2023 12:14:47 +0200, =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com> wrote:
> > > The commit 93a97dc5200a ("virtio-net: enable vq reset feature") enables
> > > unconditionally vq reset feature as long as the device is emulated.
> > > This makes impossible to actually disable the feature, and it causes
> > > migration problems from qemu version previous than 7.2.
> > >
> > > The entire final commit is unneeded as device system already enable or
> > > disable the feature properly.
> > >
> > > This reverts commit 93a97dc5200a95e63b99cb625f20b7ae802ba413.
> > > Fixes: 93a97dc5200a ("virtio-net: enable vq reset feature")
> > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > >
> > > ---
> > > Tested by checking feature bit at  /sys/devices/pci.../virtio0/features
> > > enabling and disabling queue_reset virtio-net feature and vhost=on/off
> > > on net device backend.
> >
> > Do you mean that this feature cannot be closed?
> >
> > I tried to close in the guest, it was successful.
> >
> 
> I'm not sure what you mean with close. If the device dataplane is
> emulated in qemu (vhost=off), I'm not able to make the device not
> offer it.
> 
> > In addition, in this case, could you try to repair the problem instead of
> > directly revert.
> >
> 
> I'm not following this. The revert is not to always disable the feature.
> 
> By default, the feature is enabled. If cmdline states queue_reset=on,
> the feature is enabled. That is true both before and after applying
> this patch.
> 
> However, in qemu master, queue_reset=off keeps enabling this feature
> on the device. It happens that there is a commit explicitly doing
> that, so I'm reverting it.
> 
> Let me know if that makes sense to you.
> 
> Thanks!


question is this:

    DEFINE_PROP_BIT64("queue_reset", _state, _field, \
                      VIRTIO_F_RING_RESET, true)



don't we need compat for 7.2 and back for this property?

-- 
MST


