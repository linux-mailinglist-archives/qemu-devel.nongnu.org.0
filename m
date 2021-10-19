Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD315433D31
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:16:38 +0200 (CEST)
Received: from localhost ([::1]:42458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsj7-0005KZ-Ts
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcrk3-0002vs-CT
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:13:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcrjz-0004QU-OG
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:13:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634660005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qwz8bY5J2F/YBrh+euMSyKJiZFgydVc7g7t4Ycg2dZE=;
 b=anbN2pOBEgLahozZBe7S+YSyfYK8advuZJz2q7LnCoSBhOeeotICjWj7durTX0yz3+puVO
 wL+6FBrCAaB7IepI6nuQTQ17wwmvS87Vdan7189d2gC7TERpmyLJYLTshZ6+9bdwd+1xmw
 quAOFWbKIlO/a0HwAIcFvoC23A4/hlo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-w1yfIL8RMrukp794ZLIBWA-1; Tue, 19 Oct 2021 12:13:24 -0400
X-MC-Unique: w1yfIL8RMrukp794ZLIBWA-1
Received: by mail-ed1-f70.google.com with SMTP id
 p20-20020a50cd94000000b003db23619472so18137622edi.19
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qwz8bY5J2F/YBrh+euMSyKJiZFgydVc7g7t4Ycg2dZE=;
 b=Tl6Omhap8ik9B9Xs2sFge5QzFGUq5kBztfYkomOau6jCrolXMI/Ono915Ul/MKH9h+
 5vJDHag/XiRi0N0DjtNqAz2M4S3Z+e+JCC6iGi/Fe/NxE2Onj6I2oR3/h8iDBCXmMFWN
 T04C6Zwn/iNxubQC9E6c8RacLOJshtRh0lEIfsOh6Ou61Zm6i/u1pH+D6gHl1Ib65pGo
 kOoLUnypder1utunJqLMsobi+JMFOp0DJJFz2s7pdd+Q9x9hRzlEaxG1wW5MJSk33vQA
 KNZGuVdl8GSFsBOiEx1pZ3FKj4oW4dB1JwIRTi6eRV4MiHoNpE+vq1PQ5diJrCPoVQd6
 fgMg==
X-Gm-Message-State: AOAM531lYqxypvG468PX2qCiYlQFikn1sJ73v8mrXhjHIToB9yYT8+/y
 qchFUcVoDS9UnPu9T4eApiG1BT9qVeR6clTL2nzN8t9Dz8UIPnT7bXDMyKYFPTtdBEmBbp7WjGD
 YVpkKXs8XCS9sq6Y=
X-Received: by 2002:a17:906:eda6:: with SMTP id
 sa6mr38131768ejb.443.1634660003171; 
 Tue, 19 Oct 2021 09:13:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6U/0xly58hl0LE0Wuvawn2z3od8pDHljS5EnOZNjTy8n6vxNl/HwulT8QnS+rhfc0TgnevQ==
X-Received: by 2002:a17:906:eda6:: with SMTP id
 sa6mr38131742ejb.443.1634660002910; 
 Tue, 19 Oct 2021 09:13:22 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id r22sm10373074ejd.109.2021.10.19.09.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:13:20 -0700 (PDT)
Date: Tue, 19 Oct 2021 12:13:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH] hw/qdev-core: Add compatibility for (non)-transitional
 devs
Message-ID: <20211019120619-mutt-send-email-mst@kernel.org>
References: <20211012082428.16222-1-jean-louis@dupond.be>
 <a9b2ff3a-0bba-216c-eeda-50821be4940e@dupond.be>
 <YW6h+YcNEgyzh5zw@stefanha-x1.localdomain>
 <20211019065850-mutt-send-email-mst@kernel.org>
 <20211019152913.wjipmv6trjx6k7xa@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20211019152913.wjipmv6trjx6k7xa@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: berrange@redhat.com, Stefan Hajnoczi <stefanha@gmail.com>,
 jasowang@redhat.com, qemu-devel@nongnu.org,
 Jean-Louis Dupond <jean-louis@dupond.be>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 11:29:13AM -0400, Eduardo Habkost wrote:
> On Tue, Oct 19, 2021 at 06:59:09AM -0400, Michael S. Tsirkin wrote:
> > On Tue, Oct 19, 2021 at 11:46:17AM +0100, Stefan Hajnoczi wrote:
> > > On Tue, Oct 12, 2021 at 10:36:01AM +0200, Jean-Louis Dupond wrote:
> > > > Forgot to CC maintainers.
> > > 
> > > Also CCing Jason Wang and Michael Tsirkin for VIRTIO.
> > > 
> > > Stefan
> > 
> > OMG
> > where all compat properties broken all the time?
> 
> Compat properties that existed when commit f6e501a28ef9 ("virtio:
> Provide version-specific variants of virtio PCI devices") was
> merged are not broken, because virtio-*-transitional and
> virtio-*-non-transitional were brand new QOM types (so there's no
> compatibility to be kept with old QEMU versions).
> 
> Compat properties referencing "virtio-*-pci" instead of
> "virtio-*-pci-base" added after commit f6e501a28ef9 are probably
> broken, yes.
> 
> -- 
> Eduardo

Oh. So just this one:
    { "virtio-net-pci", "vectors", "3"},

right?

about the patch: how do people feel about virtio specific
stuff in qdev core? Ok by everyone?

-- 
MST


