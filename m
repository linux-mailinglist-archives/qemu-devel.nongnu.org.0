Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34D466A160
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 19:00:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGOIw-0005L5-7H; Fri, 13 Jan 2023 12:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pGOIi-00057K-Bq
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:57:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pGOId-0002RB-2d
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673632625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2B4GrlrTmpI4TDGM83iNXYy67ugCQEuIm74bY5oa+bo=;
 b=P2Y8A5XGZDYC1iKkPvggnxrf/H6MrfX3s7I44VrLc8COFpFQAvKWnr5hOmn7eugCXkN7lz
 MS4/sJdX5ada7kcTyVtTskLMVGxbRpDdslUW3MElrY4cwHffA0TUG5HhFsrzmw+BPNO676
 SDbn0A4CkGU3NaEBqSbSgIAb/nfduQA=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-6cW86wMCODahV27FprXwBg-1; Fri, 13 Jan 2023 12:57:04 -0500
X-MC-Unique: 6cW86wMCODahV27FprXwBg-1
Received: by mail-il1-f199.google.com with SMTP id
 a7-20020a056e0208a700b0030ecfd5d4cdso4406536ilt.9
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 09:57:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2B4GrlrTmpI4TDGM83iNXYy67ugCQEuIm74bY5oa+bo=;
 b=jc8UUMNz3Izl3HtGBqmJmxkqZQadx00kdZLoIaXj8RELwaR+X5QpzLomPnaQ+vvBTT
 2TCUwlkWWbNxR7gDq4SNV/TsHTFQTd4f2iHyExWYlV5otcrK9qxI3/XYNLVNS2gTWwEw
 odmbBO2wEJcLKo9tEe4Z4TSR5Vu1f6sa4FSW1R2ULNm/HsfZWkChyaruHsRC4WNrTCjF
 L4Lp4zpWPEpvTgDFKSGbrd2yeRZB3JyJnhQ7Jk8dYdQTbXM59xlR79cjwYPjCRVs938f
 zBkcy/h9b8yJsfabM6xiNMWiztrDAbykQP2YJgVHv2YToRnT5d5Ic2zMsJ0D+o2+vc2i
 QapA==
X-Gm-Message-State: AFqh2kpt4WX9F1mu3BRptlr60rlPlEWHuXbMUDBueymoLb04Cnl0cgm/
 CwVxSIPeHj2kWT4OF6Bu1Jc5c2hK7wDzqhgmLoZbPz/teOLI2nKp6Kdf/vVxNbEe81sa1GydIJn
 /hf/5WXF5Vsuq3c0=
X-Received: by 2002:a6b:8fd3:0:b0:704:8852:abf3 with SMTP id
 r202-20020a6b8fd3000000b007048852abf3mr1739424iod.16.1673632623384; 
 Fri, 13 Jan 2023 09:57:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvvKIFfAhHdqgs/BRwsa8yzwxy5oe9S4oLNGrFKdZ5asI56xyRoSSeXvzjO0yGVwKdf7esrBw==
X-Received: by 2002:a6b:8fd3:0:b0:704:8852:abf3 with SMTP id
 r202-20020a6b8fd3000000b007048852abf3mr1739408iod.16.1673632623016; 
 Fri, 13 Jan 2023 09:57:03 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 m23-20020a026d17000000b003585ff0233asm6273907jac.150.2023.01.13.09.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 09:57:02 -0800 (PST)
Date: Fri, 13 Jan 2023 10:57:00 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Eric Auger <eauger@redhat.com>, qemu list <qemu-devel@nongnu.org>, Peter
 Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Subject: Re: virtio-iommu issue with VFIO device downstream to a PCIe-to-PCI
 bridge: VFIO devices are not assigned any iommu group
Message-ID: <20230113105700.2d860fbe.alex.williamson@redhat.com>
In-Reply-To: <Y8FQ9li7gQ+bPiRe@myrica>
References: <0bc2f2e5-630e-e721-254d-f224d1a3bdcd@redhat.com>
 <0eb96eb5-703d-dacd-49ff-f61e02d98eb9@redhat.com>
 <Y8FQ9li7gQ+bPiRe@myrica>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 13 Jan 2023 12:39:18 +0000
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> Hi,
> 
> On Mon, Jan 09, 2023 at 10:11:19PM +0100, Eric Auger wrote:
> > > Jean, do you have any idea about how to fix that? Do you think we have a
> > > trouble in the acpi/viot setup or virtio-iommu probe sequence. It looks
> > > like virtio probe and attach commands are called too early, before the
> > > bus is actually correctly numbered.  
> > 
> > So after further investigations looks this is not a problem of bus
> > number, which is good at the time of the virtio cmd calls but rather a
> > problem related to the devfn (0 was used when creating the IOMMU MR)
> > whereas the virtio-iommu cmds looks for the non aliased devfn. With that
> > fixed, the probe and attach at least succeeds. The device still does not
> > work for me but I will continue my investigations and send a tentative fix.  
> 
> If I remember correctly VIOT can deal with bus numbers because bridges are
> assigned a range by QEMU, but I haven't tested that in detail, and I don't
> know how it holds with conventional PCI bridges.

In my reading of the virtio-iommu spec, I noted that it specifies the
bus numbers *at the time of OS handoff*, so it essentially washes its
hands of the OS renumbering buses while leaving subtle dependencies on
initial numbering in the guest and QEMU implementations.

On bare metal, a conventional bridge aliases the devices downstream of
it.  We reflect that in QEMU by aliasing those devices to the
AddressSpace of the bridge.  IIRC, Linux guests will use a
for-each-dma-alias function when programming IOMMU translation tables
to populate the bridge alias, where a physical IOMMU would essentially
only see that bridge RID.  Thanks,

Alex


