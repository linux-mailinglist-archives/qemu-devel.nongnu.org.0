Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F21464399
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 00:45:21 +0100 (CET)
Received: from localhost ([::1]:40324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msCoK-0007P5-Lh
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 18:45:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1msCnD-0006jx-R1
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 18:44:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1msCnA-0005eh-Sn
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 18:44:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638315847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F4BwN45ejS6jyx4B0LGyNo2LPSTUoZg6cxYKKBRBS/c=;
 b=bUAJx0Q7LJuCbyvVxYs9OHJyx2ueNpDSHae4z0RPa6JVe3mqNMranjV7y3SL0ReTFR2EHx
 1Ap80l2LKwLgaKfcZFdeoI1p+QyMtQWUcInAw6gmEG3nxmhGZGhIHKm5VxEjfodM7Bqp7a
 Gal0+69xKsy4nI8ND9LrWW80N4oE3P0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-XMQ4NpDCPvWgYb9f45JW3Q-1; Tue, 30 Nov 2021 18:44:05 -0500
X-MC-Unique: XMQ4NpDCPvWgYb9f45JW3Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 i19-20020a05640242d300b003e7d13ebeedso18391534edc.7
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 15:44:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F4BwN45ejS6jyx4B0LGyNo2LPSTUoZg6cxYKKBRBS/c=;
 b=3gIaiMli4DhPdgSQi2IGmOBeGUPO4HFE204uaLrTqSnMqVIUmSS38PEByn4J+G3UdK
 ZZc47ipf8Vt1Hh9MZ/CSU4DKwJhOlsu1pZ2yAiy9H981cQcZdgylCkh7AB2TIAbDtu72
 6SET1XtjJIRnD/COwMX2r3tkSn8P7dorWA9jvdoY71chSRRlu7UGs+CJWOBN98ueIDc4
 N+TTthjcxVbbRQHzR9lvKCXkJ6/mLCW5/csDjiXDGtRsZ6qWHRBQpgI3CeqGZo4ZNK75
 jT9pzFFyMjlWXQXSGcRVWb1rcfk6HMzSlnqSnV2liIRXiRDMLJlIEpVc8TmOol7LZQEL
 gVQw==
X-Gm-Message-State: AOAM530bFHO2i/ZOFMPmaIxVfeIyhqeNCiCtNOPFXgw31WGkiW8rqwWu
 TLiPy000puzNHZbVQ6NSiqICwTOul17wRerl/WtJIuCcBjQXdiZkyjHkDRAYRLeQVQjBw9j2HVq
 oYq0TAA5cR7U+7vU=
X-Received: by 2002:a17:907:7ea4:: with SMTP id
 qb36mr2771613ejc.146.1638315844567; 
 Tue, 30 Nov 2021 15:44:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLdio0tKF3ZTnZbyh4nO/MrMQ3bl4DEdCaWiwnz+jG16OkWpQeS9ULjLK/sC2UqHCF5oCR3w==
X-Received: by 2002:a17:907:7ea4:: with SMTP id
 qb36mr2771586ejc.146.1638315844376; 
 Tue, 30 Nov 2021 15:44:04 -0800 (PST)
Received: from redhat.com ([2.53.15.215])
 by smtp.gmail.com with ESMTPSA id sb19sm10421807ejc.120.2021.11.30.15.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:44:03 -0800 (PST)
Date: Tue, 30 Nov 2021 18:44:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: why is iommu_platform set to off by default?
Message-ID: <20211130184126-mutt-send-email-mst@kernel.org>
References: <CAFEAcA-Fb15x7hAe-g8hP8HL1xB14iGnYi5=ZJM=0G0_hbBjTw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Fb15x7hAe-g8hP8HL1xB14iGnYi5=ZJM=0G0_hbBjTw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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
Cc: Eric Auger <eric.auger@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 30, 2021 at 02:32:49PM +0000, Peter Maydell wrote:
> I've just spent a day or so trying to track down why PCI passthrough
> of a virtio-blk-pci device wasn't working. The problem turns out to be
> that by default virtio pci devices don't use the IOMMU, even when the
> machine model has created an IOMMU and arranged for the PCI bus to
> be underneath it. So when the L2 guest tries to program the virtio device,
> the virtio device treats the IPAs it writes as if they were PAs and
> of course the data structures it's looking for aren't there.

Because this is what legacy guests expect, and legacy configs are
much more common than nested.

> Why do we default this to 'off'? It seems pretty unhelpful not to
> honour the existence of the IOMMU, and the failure mode is pretty
> opaque (L2 guest just hangs)...
> 
> thanks
> -- PMM

This should be handled by VFIO in L1 really, it can check for a
device quirk and refuse binding if the feature bit
is disabled.


-- 
MST


