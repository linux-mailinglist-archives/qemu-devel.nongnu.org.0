Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445C4421320
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 17:54:13 +0200 (CEST)
Received: from localhost ([::1]:34756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXQI8-0008BI-0z
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 11:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mXQF6-00061i-El
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:51:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mXQF4-0005jg-HF
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633362661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wnNQLEGYyuqtuWKutOrdKZyTyV/siDKuhdgiO+cXLTs=;
 b=MvuVqhcxHVI+Dt9Tu7yVilrRmKA72wNkKX3htNSeMVd4jqwwA4swdnw+gGU2H8rbN3kYwF
 VodTbb7UK8m/BvcOEgc92POr4sSA6t/RbT0qT7XkxU4YqX58ax1sdpwb0oNkGUjh9HYwKM
 WU0nxSv8zdZPi1TBAQpazpKR8JRiZ00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-c0t_ZGP3Pt2ItEdpb_iEag-1; Mon, 04 Oct 2021 11:50:58 -0400
X-MC-Unique: c0t_ZGP3Pt2ItEdpb_iEag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F25A3824FA6;
 Mon,  4 Oct 2021 15:50:56 +0000 (UTC)
Received: from localhost (unknown [10.39.193.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C9BB10016FB;
 Mon,  4 Oct 2021 15:50:45 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH 1/1] virtio: write back features before verify
In-Reply-To: <20211004110537-mutt-send-email-mst@kernel.org>
Organization: Red Hat GmbH
References: <20210930012049.3780865-1-pasic@linux.ibm.com>
 <20210930070444-mutt-send-email-mst@kernel.org>
 <20211001092125.64fef348.pasic@linux.ibm.com>
 <20211002055605-mutt-send-email-mst@kernel.org>
 <87bl452d90.fsf@redhat.com>
 <20211004090018-mutt-send-email-mst@kernel.org>
 <875yuc3ln2.fsf@redhat.com>
 <20211004110537-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 04 Oct 2021 17:50:44 +0200
Message-ID: <87wnms23hn.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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

On Mon, Oct 04 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Oct 04, 2021 at 04:33:21PM +0200, Cornelia Huck wrote:
>> On Mon, Oct 04 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> 
>> > On Mon, Oct 04, 2021 at 02:19:55PM +0200, Cornelia Huck wrote:
>> >> 
>> >> [cc:qemu-devel]
>> >> 
>> >> On Sat, Oct 02 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> >> 
>> >> > On Fri, Oct 01, 2021 at 09:21:25AM +0200, Halil Pasic wrote:
>> >> >> On Thu, 30 Sep 2021 07:12:21 -0400
>> >> >> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> >> >> 
>> >> >> > On Thu, Sep 30, 2021 at 03:20:49AM +0200, Halil Pasic wrote:
>> >> >> > > This patch fixes a regression introduced by commit 82e89ea077b9
>> >> >> > > ("virtio-blk: Add validation for block size in config space") and
>> >> >> > > enables similar checks in verify() on big endian platforms.
>> >> >> > > 
>> >> >> > > The problem with checking multi-byte config fields in the verify
>> >> >> > > callback, on big endian platforms, and with a possibly transitional
>> >> >> > > device is the following. The verify() callback is called between
>> >> >> > > config->get_features() and virtio_finalize_features(). That we have a
>> >> >> > > device that offered F_VERSION_1 then we have the following options
>> >> >> > > either the device is transitional, and then it has to present the legacy
>> >> >> > > interface, i.e. a big endian config space until F_VERSION_1 is
>> >> >> > > negotiated, or we have a non-transitional device, which makes
>> >> >> > > F_VERSION_1 mandatory, and only implements the non-legacy interface and
>> >> >> > > thus presents a little endian config space. Because at this point we
>> >> >> > > can't know if the device is transitional or non-transitional, we can't
>> >> >> > > know do we need to byte swap or not.  
>> >> >> > 
>> >> >> > Hmm which transport does this refer to?
>> >> >> 
>> >> >> It is the same with virtio-ccw and virtio-pci. I see the same problem
>> >> >> with both on s390x. I didn't try with virtio-blk-pci-non-transitional
>> >> >> yet (have to figure out how to do that with libvirt) for pci I used
>> >> >> virtio-blk-pci.
>> >> >> 
>> >> >> > Distinguishing between legacy and modern drivers is transport
>> >> >> > specific.  PCI presents
>> >> >> > legacy and modern at separate addresses so distinguishing
>> >> >> > between these two should be no trouble.
>> >> >> 
>> >> >> You mean the device id? Yes that is bolted down in the spec, but
>> >> >> currently we don't exploit that information. Furthermore there
>> >> >> is a fat chance that with QEMU even the allegedly non-transitional
>> >> >> devices only present a little endian config space after VERSION_1
>> >> >> was negotiated. Namely get_config for virtio-blk is implemented in
>> >> >> virtio_blk_update_config() which does virtio_stl_p(vdev,
>> >> >> &blkcfg.blk_size, blk_size) and in there we don't care
>> >> >> about transitional or not:
>> >> >> 
>> >> >> static inline bool virtio_access_is_big_endian(VirtIODevice *vdev)
>> >> >> {
>> >> >> #if defined(LEGACY_VIRTIO_IS_BIENDIAN)
>> >> >>     return virtio_is_big_endian(vdev);
>> >> >> #elif defined(TARGET_WORDS_BIGENDIAN)
>> >> >>     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
>> >> >>         /* Devices conforming to VIRTIO 1.0 or later are always LE. */
>> >> >>         return false;
>> >> >>     }
>> >> >>     return true;
>> >> >> #else
>> >> >>     return false;
>> >> >> #endif
>> >> >> }
>> >> >> 
>> >> >
>> >> > ok so that's a QEMU bug. Any virtio 1.0 and up
>> >> > compatible device must use LE.
>> >> > It can also present a legacy config space where the
>> >> > endian depends on the guest.
>> >> 
>> >> So, how is the virtio core supposed to determine this? A
>> >> transport-specific callback?
>> >
>> > I'd say a field in VirtIODevice is easiest.
>> 
>> The transport needs to set this as soon as it has figured out whether
>> we're using legacy or not.
>
> Basically on each device config access?

Prior to the first one, I think. It should not change again, should it?

>
>> I guess we also need to fence off any
>> accesses respectively error out the device if the driver tries any
>> read/write operations that would depend on that knowledge?
>> 
>> And using a field in VirtIODevice would probably need some care when
>> migrating. Hm...
>
> It's just a shorthand to minimize changes. No need to migrate I think.

If we migrate in from an older QEMU, we don't know whether we are
dealing with legacy or not, until feature negotiation is already
done... don't we have to ask the transport?


