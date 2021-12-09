Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8691F46F292
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 18:56:17 +0100 (CET)
Received: from localhost ([::1]:56144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNeS-0004WH-M6
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 12:56:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mvNd3-00038O-Nd
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:54:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mvNct-0001i6-W7
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:54:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639072478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7QFXA2Wvcqku9f8sx5e5vLHbXIC9rbIvqCiwyowtrDA=;
 b=Hgl01ZjyDWi4ltVbgFw9Q/GLUC7RRX04UEZaX3BPCf8eUfvB8BxWAqg0D9lNZjfUzM9ams
 zSaoLH8W9jmRZAd2xP4EtK+z07KGsrTuSFEZuu4ENB8ebC4QoJ72nUynPtuKNasxdsTpFz
 Qrir4kwyK4wRP5kkRPdFrgWtPWQOb0E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-415-it6dQIYeOwmS3vRQNfiSTg-1; Thu, 09 Dec 2021 12:54:37 -0500
X-MC-Unique: it6dQIYeOwmS3vRQNfiSTg-1
Received: by mail-wr1-f69.google.com with SMTP id
 h13-20020adfa4cd000000b001883fd029e8so1659533wrb.11
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 09:54:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7QFXA2Wvcqku9f8sx5e5vLHbXIC9rbIvqCiwyowtrDA=;
 b=mTBKWWusCbFCcYq2v/hQ67F7B9T/BpBpSszrH8Q0VeZ+v3m2anfLbSJyuESkKSUgY1
 7zVIfAJlt35j1ZBs5k6Re3+7nQdevPzBOQ6sqkEpykcmyxRdMuF0cUiDuhNjHPnH9lkG
 2eINEP9b2qsaCbq9+1nLrSKfn98XvlEk0jaX71RKcbZTdSL7a5HhPcjql2omwGqjz0Q7
 eyg7qRNKTc/KcTXXIEVjJZa2pM4ALSoY2vi0Z/4urK5E2gyx7E20R4raVga8aooJ9CoD
 JpLc5SxDxv/sz+W3M8OreLKpzFsHPSFIP4OUsYgy1maDegKnE0eIi6JAvFz1hxwspmHi
 Op6g==
X-Gm-Message-State: AOAM531F2vt2lVqG5r+yi9lo67r+btCUq5lkVauAB9i2hiA9pwufUums
 MCW+sufSOoepANtoe+K/94oQ5WsVwxNNT1vO551qPRF0GU/CoSZw32AoXk/vo3tz4kRMNSyjZRn
 WH+r9M069PzGzP8c=
X-Received: by 2002:a05:600c:3505:: with SMTP id
 h5mr9132115wmq.22.1639072476049; 
 Thu, 09 Dec 2021 09:54:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnCxVxM9C0ckSGLyuO9FTPQivI6XoWYlUZ2dd5anUbCHvmCdmiITVTqR5BAaZ76ZtJTHa1Mw==
X-Received: by 2002:a05:600c:3505:: with SMTP id
 h5mr9132079wmq.22.1639072475828; 
 Thu, 09 Dec 2021 09:54:35 -0800 (PST)
Received: from redhat.com ([2.55.18.120])
 by smtp.gmail.com with ESMTPSA id f7sm463213wri.74.2021.12.09.09.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 09:54:35 -0800 (PST)
Date: Thu, 9 Dec 2021 12:54:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [RFC PATCH v2 0/5] virtio: early detect 'modern' virtio
Message-ID: <20211209125419-mutt-send-email-mst@kernel.org>
References: <20211112145749.618157-1-pasic@linux.ibm.com>
 <20211208135456-mutt-send-email-mst@kernel.org>
 <20211209142925.0decf425.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211209142925.0decf425.pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Dec 09, 2021 at 02:29:25PM +0100, Halil Pasic wrote:
> On Wed, 8 Dec 2021 13:56:19 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Fri, Nov 12, 2021 at 03:57:44PM +0100, Halil Pasic wrote:
> > > This is an early RFC for a transport specific early detecton of
> > > modern virtio, which is most relevant for transitional devices on big
> > > endian platforms, when drivers access the config space before
> > > FEATURES_OK is set.
> > > 
> > > The most important part that is missing here is fixing all the problems
> > > that arise in the situation described in the previous paragraph, when
> > > the config is managed by a vhost device (and thus outside QEMU. This
> > > series tackles this problem only for virtio_net+vhost as an example. If
> > > this approach is deemed good, we need to do something very similar for
> > > every single affected device.
> > > 
> > > This series was only lightly tested. The vhost stuff is entirely
> > > untested, unfortunately I don't have a working setup where this
> > > handling would be needed (because the config space is handled in the
> > > device). DPDK is not supported on s390x so at the moment I can't test
> > > DPDK based setups.   
> > 
> > So this looks sane to me. Cornelia requested some name tweaks and we
> > need to add vhost-user things and more devices, but otherwise we are
> > good.
> 
> Thanks for your feedback! There were several points where I could
> not reach agreement with Cornelia. From your response I recon that:
> 
> 1) I should rename virtio_force_modern() to virtio_indicate_modern()
> (per maintainer request).
> 2) Keep the call to virtio_set_features()?
> 
> Is that right?
> 
> Regards,
> Halil

that's my take, yes.

-- 
MST


