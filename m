Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4673421745
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 21:19:00 +0200 (CEST)
Received: from localhost ([::1]:40900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXTUJ-0003fV-8w
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 15:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXTTA-0002VP-IP
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 15:17:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXTT6-0007jO-Sz
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 15:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633375063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dnrMZKgYsa9zV3N6XQLhjXsAPJjau0Q+eDXogTmvyUM=;
 b=Squ8rML2ZTCjJAOMJUlKXcvUjXP54EpzpV9lJUJXnWJMJVoTxC+vHm5pgju98l1Gl4WH7o
 3tRltSyABv4LXiFP1ItvVnJUd8triGGn65GFTZszUAKLMFCzDBNVXckNuFHQBGVFUqTq3n
 ggLzHXd89Y9oiS0q27/wor8ENSmRITk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-O8WUFcMTN12rIAvcR-9l1w-1; Mon, 04 Oct 2021 15:17:42 -0400
X-MC-Unique: O8WUFcMTN12rIAvcR-9l1w-1
Received: by mail-ed1-f70.google.com with SMTP id
 c7-20020a05640227c700b003d27f41f1d4so18165931ede.16
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 12:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dnrMZKgYsa9zV3N6XQLhjXsAPJjau0Q+eDXogTmvyUM=;
 b=2L3uOYqy0uFh26Kn45x0puxaxxqb8WAQd+Pfn2yeMYC77kF6SKQBbbGQtUzBqsreUb
 ORtjqblB1ACdqgXWByKO3MD71AwPOzcCoZSCmGnVBAIIuya1QF5ZPQgECFYXBgOcdY7Y
 oux8SC4wG45rXEDR+V1W6KgSm9UzrtwmnR4FZSXYFMD8Ye815H57tW+7TmPSaqhrb5og
 sS3LR0oJS94k+dl/Xl88VgMVqNnkCHdw2dmQXHlprNPNvuEUVoFR43EBeqXyOlvizzbt
 VjiZtEl9bUMT8I8ZYlfQp7R32HRYzRGgkz5Jy+EqP/t/AQvu9+6oZE3qgInTD1XeH5CM
 Bt8g==
X-Gm-Message-State: AOAM530+KxY0gj6WY8YHPYbTl1f0B+exDvUTk8ZTV3VitMWi7wX960TW
 qZHWFsLGqOI9DYY7oexT+9p2oV+Vee8Ahc+ujGhHcovL9ubJBQT4+sZ757IhYjHYSxPs9iI1Vht
 3fcrXy+4m2yF0kLM=
X-Received: by 2002:a17:906:e2cf:: with SMTP id
 gr15mr19049432ejb.468.1633375061011; 
 Mon, 04 Oct 2021 12:17:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCcdDaBL4+0xApN30GKptZMox4I6k3d/U5sfhai9+VR+XWMkZ5SQ/aYkIFBgB630xlyuuMdg==
X-Received: by 2002:a17:906:e2cf:: with SMTP id
 gr15mr19049399ejb.468.1633375060739; 
 Mon, 04 Oct 2021 12:17:40 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id t15sm5652453edq.93.2021.10.04.12.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 12:17:39 -0700 (PDT)
Date: Mon, 4 Oct 2021 15:17:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH 1/1] virtio: write back features before verify
Message-ID: <20211004151408-mutt-send-email-mst@kernel.org>
References: <20210930012049.3780865-1-pasic@linux.ibm.com>
 <20210930070444-mutt-send-email-mst@kernel.org>
 <20211001092125.64fef348.pasic@linux.ibm.com>
 <20211002055605-mutt-send-email-mst@kernel.org>
 <87bl452d90.fsf@redhat.com>
 <20211004090018-mutt-send-email-mst@kernel.org>
 <875yuc3ln2.fsf@redhat.com>
 <20211004110537-mutt-send-email-mst@kernel.org>
 <87wnms23hn.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87wnms23hn.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
 Xie Yongji <xieyongji@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 04, 2021 at 05:50:44PM +0200, Cornelia Huck wrote:
> On Mon, Oct 04 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Mon, Oct 04, 2021 at 04:33:21PM +0200, Cornelia Huck wrote:
> >> On Mon, Oct 04 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >> 
> >> > On Mon, Oct 04, 2021 at 02:19:55PM +0200, Cornelia Huck wrote:
> >> >> 
> >> >> [cc:qemu-devel]
> >> >> 
> >> >> On Sat, Oct 02 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >> >> 
> >> >> > On Fri, Oct 01, 2021 at 09:21:25AM +0200, Halil Pasic wrote:
> >> >> >> On Thu, 30 Sep 2021 07:12:21 -0400
> >> >> >> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >> >> >> 
> >> >> >> > On Thu, Sep 30, 2021 at 03:20:49AM +0200, Halil Pasic wrote:
> >> >> >> > > This patch fixes a regression introduced by commit 82e89ea077b9
> >> >> >> > > ("virtio-blk: Add validation for block size in config space") and
> >> >> >> > > enables similar checks in verify() on big endian platforms.
> >> >> >> > > 
> >> >> >> > > The problem with checking multi-byte config fields in the verify
> >> >> >> > > callback, on big endian platforms, and with a possibly transitional
> >> >> >> > > device is the following. The verify() callback is called between
> >> >> >> > > config->get_features() and virtio_finalize_features(). That we have a
> >> >> >> > > device that offered F_VERSION_1 then we have the following options
> >> >> >> > > either the device is transitional, and then it has to present the legacy
> >> >> >> > > interface, i.e. a big endian config space until F_VERSION_1 is
> >> >> >> > > negotiated, or we have a non-transitional device, which makes
> >> >> >> > > F_VERSION_1 mandatory, and only implements the non-legacy interface and
> >> >> >> > > thus presents a little endian config space. Because at this point we
> >> >> >> > > can't know if the device is transitional or non-transitional, we can't
> >> >> >> > > know do we need to byte swap or not.  
> >> >> >> > 
> >> >> >> > Hmm which transport does this refer to?
> >> >> >> 
> >> >> >> It is the same with virtio-ccw and virtio-pci. I see the same problem
> >> >> >> with both on s390x. I didn't try with virtio-blk-pci-non-transitional
> >> >> >> yet (have to figure out how to do that with libvirt) for pci I used
> >> >> >> virtio-blk-pci.
> >> >> >> 
> >> >> >> > Distinguishing between legacy and modern drivers is transport
> >> >> >> > specific.  PCI presents
> >> >> >> > legacy and modern at separate addresses so distinguishing
> >> >> >> > between these two should be no trouble.
> >> >> >> 
> >> >> >> You mean the device id? Yes that is bolted down in the spec, but
> >> >> >> currently we don't exploit that information. Furthermore there
> >> >> >> is a fat chance that with QEMU even the allegedly non-transitional
> >> >> >> devices only present a little endian config space after VERSION_1
> >> >> >> was negotiated. Namely get_config for virtio-blk is implemented in
> >> >> >> virtio_blk_update_config() which does virtio_stl_p(vdev,
> >> >> >> &blkcfg.blk_size, blk_size) and in there we don't care
> >> >> >> about transitional or not:
> >> >> >> 
> >> >> >> static inline bool virtio_access_is_big_endian(VirtIODevice *vdev)
> >> >> >> {
> >> >> >> #if defined(LEGACY_VIRTIO_IS_BIENDIAN)
> >> >> >>     return virtio_is_big_endian(vdev);
> >> >> >> #elif defined(TARGET_WORDS_BIGENDIAN)
> >> >> >>     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> >> >> >>         /* Devices conforming to VIRTIO 1.0 or later are always LE. */
> >> >> >>         return false;
> >> >> >>     }
> >> >> >>     return true;
> >> >> >> #else
> >> >> >>     return false;
> >> >> >> #endif
> >> >> >> }
> >> >> >> 
> >> >> >
> >> >> > ok so that's a QEMU bug. Any virtio 1.0 and up
> >> >> > compatible device must use LE.
> >> >> > It can also present a legacy config space where the
> >> >> > endian depends on the guest.
> >> >> 
> >> >> So, how is the virtio core supposed to determine this? A
> >> >> transport-specific callback?
> >> >
> >> > I'd say a field in VirtIODevice is easiest.
> >> 
> >> The transport needs to set this as soon as it has figured out whether
> >> we're using legacy or not.
> >
> > Basically on each device config access?
> 
> Prior to the first one, I think. It should not change again, should it?

Well yes but we never prohibited someone from poking at both ..
Doing it on each access means we don't have state to migrate.

> >
> >> I guess we also need to fence off any
> >> accesses respectively error out the device if the driver tries any
> >> read/write operations that would depend on that knowledge?
> >> 
> >> And using a field in VirtIODevice would probably need some care when
> >> migrating. Hm...
> >
> > It's just a shorthand to minimize changes. No need to migrate I think.
> 
> If we migrate in from an older QEMU, we don't know whether we are
> dealing with legacy or not, until feature negotiation is already
> done... don't we have to ask the transport?

Right but the only thing that can happen is config access.
Well and for legacy a kick I guess.

-- 
MST


