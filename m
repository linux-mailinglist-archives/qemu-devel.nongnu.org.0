Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C1D672635
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 19:03:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pICmV-00037K-Am; Wed, 18 Jan 2023 13:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pICmQ-00035T-HY
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 13:03:23 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pICmN-0006ec-EA
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 13:03:21 -0500
Received: by mail-wr1-x434.google.com with SMTP id t5so30378747wrq.1
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 10:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Q0ssKHYhVDrzeP5wFL1rFlPcE7pMkznO/lgXzAq0w3Q=;
 b=a8v8RNjhDLwiOwjLZFYlSGEYYTXUy/XmqKdMmIpPf07MwC8qlNwg9FnLb5wLYQbuhi
 w87Xcoy5R4g043R7Goa0EwOSfNi5hTW12vr2788RICA7P9CwFjvTZ7Nl9rbbSNz6xDBY
 d9LfvcY61kpQaDB/8VSCUPoi7JoyQEZq2UfLtUO17tmjOckCRiOjFe5cfKtGIm4o1rSH
 2Kz0CCwxh3+ORRSb9ecpF1GPnE2/sYmzn4ybHN4tPzvqPZChrD1ct67XhUEOpbYxlv70
 Kkv6HVtnqSWQWoWEqQ3BjrjjvHkEzdGJb2qm4sEVj7cAk4c/Vb96SnMuGWxfwuAZCFTA
 MDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q0ssKHYhVDrzeP5wFL1rFlPcE7pMkznO/lgXzAq0w3Q=;
 b=uJi2RkwMfMD/q7qo8VqUYYSU8DD/tln2/RS1SFhS0otwrJLs3hq56IqZXrWUjzZcna
 zZHvwYwMUIkFrKlf8acGw69PyZSOTEuuA/ymDaFVEvDFxwPqL+I0gLPqSMadhZtufHHI
 ga1+h7FVXnrLFp/Rw1OtX0iaxggadequmtWHv5HspJICjdSPQWKl2eRxlelvQugnEqDr
 CS/2Qbe9aNtzCyB0pif3cjCCKycM0GN2VASNyQOGW1W4v8Z6FV/C3ulA8CDId5yYeisb
 uNF3O3rmhFQLVld0K5F0Qk8CCyHGqLTeFzcOktNfE6J9xfYjRmBrY5JxOBh5cK8GBpZX
 jNjQ==
X-Gm-Message-State: AFqh2koBKAgqsgxBSivJdtL+1UaOeTG9iP0cj33qj+J+h50jluY61iMo
 3HjK1XTota812xvjJFFB2S0IWQ==
X-Google-Smtp-Source: AMrXdXuGksHPGSAhf8vCK5Bs9oAeEgPRS/TpQmstjR/wQVsMKcMp0QzCmqIi/+ExaN/+RgHHJr/umA==
X-Received: by 2002:a05:6000:1186:b0:2bb:e8b8:c057 with SMTP id
 g6-20020a056000118600b002bbe8b8c057mr15802421wrx.68.1674064997396; 
 Wed, 18 Jan 2023 10:03:17 -0800 (PST)
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
 by smtp.gmail.com with ESMTPSA id
 q12-20020adff50c000000b002be25db0b7bsm3811322wro.10.2023.01.18.10.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 10:03:16 -0800 (PST)
Date: Wed, 18 Jan 2023 18:03:13 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Eric Auger <eauger@redhat.com>, qemu list <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Subject: Re: virtio-iommu issue with VFIO device downstream to a PCIe-to-PCI
 bridge: VFIO devices are not assigned any iommu group
Message-ID: <Y8g0YQ4NylOUzeUW@myrica>
References: <0bc2f2e5-630e-e721-254d-f224d1a3bdcd@redhat.com>
 <0eb96eb5-703d-dacd-49ff-f61e02d98eb9@redhat.com>
 <Y8FQ9li7gQ+bPiRe@myrica>
 <20230113105700.2d860fbe.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113105700.2d860fbe.alex.williamson@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, Jan 13, 2023 at 10:57:00AM -0700, Alex Williamson wrote:
> On Fri, 13 Jan 2023 12:39:18 +0000
> Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
> 
> > Hi,
> > 
> > On Mon, Jan 09, 2023 at 10:11:19PM +0100, Eric Auger wrote:
> > > > Jean, do you have any idea about how to fix that? Do you think we have a
> > > > trouble in the acpi/viot setup or virtio-iommu probe sequence. It looks
> > > > like virtio probe and attach commands are called too early, before the
> > > > bus is actually correctly numbered.  
> > > 
> > > So after further investigations looks this is not a problem of bus
> > > number, which is good at the time of the virtio cmd calls but rather a
> > > problem related to the devfn (0 was used when creating the IOMMU MR)
> > > whereas the virtio-iommu cmds looks for the non aliased devfn. With that
> > > fixed, the probe and attach at least succeeds. The device still does not
> > > work for me but I will continue my investigations and send a tentative fix.  
> > 
> > If I remember correctly VIOT can deal with bus numbers because bridges are
> > assigned a range by QEMU, but I haven't tested that in detail, and I don't
> > know how it holds with conventional PCI bridges.
> 
> In my reading of the virtio-iommu spec,

Hm, is that the virtio-iommu spec or ACPI VIOT/device tree spec?
The virtio-iommu spec shouldn't refer to PCI buses at the moment. The
intent is that for PCI, the "endpoint ID" passed in an ATTACH request
corresponds to PCI segment and RID of PCI devices at the time of the
request (so after the OS renumbered the buses). If you found something in
the spec that contradicts this, it should be fixed. Note that "endpoint"
is a misnomer, it can refer to PCI bridges as well, anything that can
issue DMA transactions.

> I noted that it specifies the
> bus numbers *at the time of OS handoff*, so it essentially washes its
> hands of the OS renumbering buses while leaving subtle dependencies on
> initial numbering in the guest and QEMU implementations.

Yes we needed to describe in the firmware tables (device-tree and ACPI
VIOT) which devices the IOMMU manages. And at the time we generate the
tables, if we want to refer to PCI devices behind bridges, we can either
use catch-all ranges for any possible bus numbers they will get, or
initialize bus numbers in bridges and pass those to the OS.

But that's only to communicate the IOMMU topology to the OS, because we
couldn't come up with anything better. After it sets up PCI the OS should
be able to use its own configuration of the PCI topology in virtio-iommu
requests.


> On bare metal, a conventional bridge aliases the devices downstream of
> it.  We reflect that in QEMU by aliasing those devices to the
> AddressSpace of the bridge.  IIRC, Linux guests will use a
> for-each-dma-alias function when programming IOMMU translation tables
> to populate the bridge alias, where a physical IOMMU would essentially
> only see that bridge RID.  Thanks,

Yes there might be something missing in the Linux driver, I'll have a look

Thanks,
Jean

