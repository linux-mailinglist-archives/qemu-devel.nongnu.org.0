Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8054E423D95
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 14:18:54 +0200 (CEST)
Received: from localhost ([::1]:36890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY5sr-0002M0-3E
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 08:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mY5pU-0000CB-Rm
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 08:15:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mY5pQ-0004Xp-GR
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 08:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633522518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qnmDIGptsktOkioDWWXCssVddVdWstmqHBWueCna4kc=;
 b=e8boHo6aeTdfkgaawTFi9qs10EDRfbhsKQt8pM8ywQACN3avn3WuFkrxc1fJEF6alhJGT8
 1Rd9BRvb2fYrKylioJRnRmqEJR51WZX+G60GZMbB3GyzcGzlKh9FwVm/L+gLcyXMfeGA90
 GDiMgaU5erzW7Sx6oON45P+Q08q36VY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-ZlcQyQ4mNeiak3p0-XPREA-1; Wed, 06 Oct 2021 08:15:15 -0400
X-MC-Unique: ZlcQyQ4mNeiak3p0-XPREA-1
Received: by mail-ed1-f69.google.com with SMTP id
 w6-20020a50d786000000b003dabc563406so2413391edi.17
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 05:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qnmDIGptsktOkioDWWXCssVddVdWstmqHBWueCna4kc=;
 b=E0OfR1N7pSuN/yKeDwx7qhg13Yt35mIC9HAGUZv/dPk35xhwriHLrCsgsuQ39r+Yvs
 36y9z1dM0SM2epcDMxKJQl/+GzftMp4BaR/w/GvLjyzRSB8YjEshP+WlekDVqUdFh6Na
 Ps3aMtmRgN+LQVgy5pxFr9qbo3ifvVzxPCsErT5jqkD7vhVNAHamIPvCzwZ4V6iTFr/V
 XSYGGOFCh8clZ+zrWz/oI8+WpMhY56cXuiALjd9++wPX5+uJ6ufBNesY/Zh50eF+V4fY
 +ZwgZe6VvAn64vgE2cDOf9hZAmX+oABoF34ZfXlmhVbIXFWZa4J/lIDC/GjgcTsysRZi
 DmuQ==
X-Gm-Message-State: AOAM530qn6CxtEVT1gVdKh2Hrb1411+H4zneviFzIweovaeWDvj8maJi
 wCXYjHYfRqer+fHm9n8oZ4D37zOrEjsB/EdWqHB+UJIh/mijTliW9tWtGY7MWcjS5KDPUn5byOa
 bgef4JZTp65rEGOU=
X-Received: by 2002:a17:906:f208:: with SMTP id
 gt8mr21806751ejb.522.1633522513832; 
 Wed, 06 Oct 2021 05:15:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG9wllx9y16DQrS76uUlfwpX+3oqTEzh8ajeSft32BLV8/8AcXlKmgVAU0xygywoNNmIYASA==
X-Received: by 2002:a17:906:f208:: with SMTP id
 gt8mr21806715ejb.522.1633522513589; 
 Wed, 06 Oct 2021 05:15:13 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id k20sm8795905ejd.33.2021.10.06.05.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 05:15:12 -0700 (PDT)
Date: Wed, 6 Oct 2021 08:15:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH 1/1] virtio: write back features before verify
Message-ID: <20211006081430-mutt-send-email-mst@kernel.org>
References: <20210930070444-mutt-send-email-mst@kernel.org>
 <20211001092125.64fef348.pasic@linux.ibm.com>
 <20211002055605-mutt-send-email-mst@kernel.org>
 <87bl452d90.fsf@redhat.com>
 <20211004090018-mutt-send-email-mst@kernel.org>
 <875yuc3ln2.fsf@redhat.com>
 <20211004110537-mutt-send-email-mst@kernel.org>
 <87wnms23hn.fsf@redhat.com>
 <20211004151408-mutt-send-email-mst@kernel.org>
 <87sfxezcjp.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87sfxezcjp.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Oct 06, 2021 at 12:13:14PM +0200, Cornelia Huck wrote:
> On Mon, Oct 04 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Mon, Oct 04, 2021 at 05:50:44PM +0200, Cornelia Huck wrote:
> >> On Mon, Oct 04 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >> 
> >> > On Mon, Oct 04, 2021 at 04:33:21PM +0200, Cornelia Huck wrote:
> >> >> On Mon, Oct 04 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >> >> 
> >> >> > On Mon, Oct 04, 2021 at 02:19:55PM +0200, Cornelia Huck wrote:
> >> >> >> 
> >> >> >> [cc:qemu-devel]
> >> >> >> 
> >> >> >> On Sat, Oct 02 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >> >> >> 
> >> >> >> > ok so that's a QEMU bug. Any virtio 1.0 and up
> >> >> >> > compatible device must use LE.
> >> >> >> > It can also present a legacy config space where the
> >> >> >> > endian depends on the guest.
> >> >> >> 
> >> >> >> So, how is the virtio core supposed to determine this? A
> >> >> >> transport-specific callback?
> >> >> >
> >> >> > I'd say a field in VirtIODevice is easiest.
> >> >> 
> >> >> The transport needs to set this as soon as it has figured out whether
> >> >> we're using legacy or not.
> >> >
> >> > Basically on each device config access?
> >> 
> >> Prior to the first one, I think. It should not change again, should it?
> >
> > Well yes but we never prohibited someone from poking at both ..
> > Doing it on each access means we don't have state to migrate.
> 
> Yes; if it isn't too high overhead, that's probably the safest way to
> handle it.
> 
> >
> >> >
> >> >> I guess we also need to fence off any
> >> >> accesses respectively error out the device if the driver tries any
> >> >> read/write operations that would depend on that knowledge?
> >> >> 
> >> >> And using a field in VirtIODevice would probably need some care when
> >> >> migrating. Hm...
> >> >
> >> > It's just a shorthand to minimize changes. No need to migrate I think.
> >> 
> >> If we migrate in from an older QEMU, we don't know whether we are
> >> dealing with legacy or not, until feature negotiation is already
> >> done... don't we have to ask the transport?
> >
> > Right but the only thing that can happen is config access.
> 
> Checking on each config space access would be enough then.
> 
> > Well and for legacy a kick I guess.
> 
> I think any driver that does something that is not config space access,
> status access, or feature bit handling without VERSION_1 being set is
> neccessarily legacy? Does that really need special handling?

Likely not, I just wanted to be exact.

-- 
MST


