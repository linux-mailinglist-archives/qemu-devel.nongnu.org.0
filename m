Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2131F44603C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 08:43:49 +0100 (CET)
Received: from localhost ([::1]:41130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mitt6-0000bZ-7z
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 03:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mits5-0007dw-IN
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 03:42:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mits2-0007qR-LJ
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 03:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636098160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UU4xxbT+gkFhcoXrzXkhqP+1kjJopGVfUcWo5hVG6bw=;
 b=ZEqTBVsAxFc690Wrp7LTcMAQS0N/GFKeNn6/xZ+zAsyfjakDNyQbNfn7Vi+p9KotDgp6VG
 aVULp44b85uE1JlhKQcwl5HyXyEc1LXQOzBq2QEGI3Pm0pDqf8g8OjgMWiO2H0NBH2cDCs
 VqsUzeGPFJEfaHq0GF89UEQGj84nUNM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-9_0oWZUNMZy1BpmfSzhn3A-1; Fri, 05 Nov 2021 03:42:39 -0400
X-MC-Unique: 9_0oWZUNMZy1BpmfSzhn3A-1
Received: by mail-wr1-f71.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so2008613wrc.22
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 00:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UU4xxbT+gkFhcoXrzXkhqP+1kjJopGVfUcWo5hVG6bw=;
 b=XM2qu0E5Danif45p7kYMYBVgzWamaA5g0goPlZMImqWukf0jxYvuRAE7Y5xtIPr1+2
 6q0t+N6y0Pyh4tTch6W0XrwJDbXyPpA3liid/MO7sPLSReiHYdEDYFBgspTvQrbeE+BB
 86tClSBE+9YhKhnBNCbqFkQTPhJCJFgVEd75QU+pYW6hQPBifriBUBIFuWfzcJGlr2o4
 z+YOuppnZucuRVQUlhmDiUC3bqHo7mQeJSCwdoTu/Z7njcpP+pr7QJliUebx0tkpFzZu
 e7laP83UpI90aHWh6y/iAxVvAg7oES7gNpeOp8DGgLwgWtsM3tVTKBhpzjcNIC+KYN2H
 3o6g==
X-Gm-Message-State: AOAM530pTF9gdRvpZIucfjoruPrjChNhPAXcj1Aj4Ws/x2x4LUZTj0Fc
 tlgcIKNJaIIBM1c2GlEKLVel4sjxm1vCPvcPVy3EfBUtQYv9K9QeZiwsrf/fozubt9e535Rs/14
 ZXBi4EhXhrG3jETs=
X-Received: by 2002:a05:600c:1549:: with SMTP id
 f9mr5941024wmg.118.1636098158513; 
 Fri, 05 Nov 2021 00:42:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmjRnVICPPCGy2jmmPtHtfNW/My0qo3DRoFvP7cPEKwoeyfwTh1CQGTvwIuNX4RO2YmwRq3A==
X-Received: by 2002:a05:600c:1549:: with SMTP id
 f9mr5941005wmg.118.1636098158205; 
 Fri, 05 Nov 2021 00:42:38 -0700 (PDT)
Received: from redhat.com ([2.55.13.185])
 by smtp.gmail.com with ESMTPSA id w17sm7379424wrp.79.2021.11.05.00.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 00:42:37 -0700 (PDT)
Date: Fri, 5 Nov 2021 03:42:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [RFC PATCH v1 0/3]  virtio: early detect 'modern' virtio
Message-ID: <20211105034053-mutt-send-email-mst@kernel.org>
References: <20211028220017.930806-1-pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211028220017.930806-1-pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 29, 2021 at 12:00:14AM +0200, Halil Pasic wrote:
> This is an early RFC for a transport specific early detecton of
> modern virtio, which is most relevant for transitional devices on big
> endian platforms, when drivers access the config space before
> FEATURES_OK is set.
> 
> The most important part that is missing here is fixing the problems that
> arrise in the situation described in the previous paragraph, when the
> config is managed by a vhost device (and thus outside QEMU).
> 
> This series was only lightly tested. 

I think it's a good enough approach, and we are getting close
to release. For vhost - a new callback just for that? Would be ok.
Or just invoke set features - if this works.


> Halil Pasic (3):
>   virtio: introduce virtio_force_modern()
>   virtio-ccw: use virtio_force_modern
>   virtio-pci: use virtio_force_modern()
> 
>  hw/s390x/virtio-ccw.c      |  3 +++
>  hw/virtio/virtio-pci.c     |  1 +
>  hw/virtio/virtio.c         | 12 ++++++++++++
>  include/hw/virtio/virtio.h |  1 +
>  4 files changed, 17 insertions(+)
> 
> 
> base-commit: 2c3e83f92d93fbab071b8a96b8ab769b01902475
> -- 
> 2.25.1


