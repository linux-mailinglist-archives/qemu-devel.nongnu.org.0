Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DFD46CE6D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 08:37:53 +0100 (CET)
Received: from localhost ([::1]:58984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1murWS-0004PC-KQ
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 02:37:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1murTs-0002wd-8O
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:35:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1murTp-0007GL-RX
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638948908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Bm0+iEM4AlCPIyz/dCN+v9i/ptynz5o7jh+5n68H5o=;
 b=h74fOhfhdp+aoISmk+oSzB9M1TPNEtnjKvDl8lBqyxs4a1QQuX/iatFL9Z1qeDsZc9OecD
 ZiBe++HgLMCji3K0MFV53RhhEQuxkTXDUKp0sU6i3QHS21nPUvvXcULx2ufeBdCs43EfVY
 OkQLC4hSuDJyo7j14cJ453DeN5sCQqY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-48iAK89hPz6meqJVrMMjjg-1; Wed, 08 Dec 2021 02:35:05 -0500
X-MC-Unique: 48iAK89hPz6meqJVrMMjjg-1
Received: by mail-ed1-f69.google.com with SMTP id
 c1-20020aa7c741000000b003e7bf1da4bcso1328018eds.21
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 23:35:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/Bm0+iEM4AlCPIyz/dCN+v9i/ptynz5o7jh+5n68H5o=;
 b=eRTT5D4zXcV057n5gKTB3pPXvBN81Q9hhE2rgIWxVg6KwcFb704DjbrjgKWrSSszGd
 ux6vh5y0kvnJBtKzV6fPv+hyjDOU2Vy9XbsObrPvtiHygE9wxSsX9Y+FOXbI5RPeEW57
 yKAl3YG4XuS++WTopJUx63zYScsvOFeHBR1Xo0CVoviizuITUI+0+j861f43OvSlvGXh
 GZe3+9jx7XUYSGhncbWENWfAAUXwAa2NJkFrp34b0kTsP4b9CGT/NBX/mU/O/95tPrAm
 yKX9CwVDETw0fUVkF3V6FjTq+ik1W/zE/TjDqONuM7+yBHzj86TkD0jWc1ml2lkCXxtZ
 AMHQ==
X-Gm-Message-State: AOAM533rer/u0Q6549134OR9iJX29PYUBzkmX97+PUtjpAMfJeOyza4y
 rB4AqBfVRN6oKIMGIT/GXDGtowi5w8upysEyTjrne4a6qQt8JFVv4w0FWIySreJOs+f/tHI8gcS
 gd2RL/2lRtqmEbUs=
X-Received: by 2002:a05:6402:5194:: with SMTP id
 q20mr16968548edd.123.1638948904069; 
 Tue, 07 Dec 2021 23:35:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCy8Mi5Ms4bJJA3Xjk/6mnsFsJHis5vdY6sEGQYcH1w1U4mplXBEH6IwSBCWgJR3AfIBY/oQ==
X-Received: by 2002:a05:6402:5194:: with SMTP id
 q20mr16968519edd.123.1638948903838; 
 Tue, 07 Dec 2021 23:35:03 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107e:ebdb:5cc6:c351:b05:514f])
 by smtp.gmail.com with ESMTPSA id w18sm1389798edx.55.2021.12.07.23.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 23:35:03 -0800 (PST)
Date: Wed, 8 Dec 2021 02:34:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v5 0/4] tests/qtest: add some tests for virtio-net failover
Message-ID: <20211208023448-mutt-send-email-mst@kernel.org>
References: <20211119090718.440793-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211119090718.440793-1-lvivier@redhat.com>
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
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 10:07:14AM +0100, Laurent Vivier wrote:
> This series adds a qtest entry to test virtio-net failover feature.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


> We check following error cases:
> 
> - check missing id on device with failover_pair_id triggers an error
> - check a primary device plugged on a bus that doesn't support hotplug
>   triggers an error
> 
> We check the status of the machine before and after hotplugging cards and
> feature negotiation:
> 
> - check we don't see the primary device at boot if failover is on
> - check we see the primary device at boot if failover is off
> - check we don't see the primary device if failover is on
>   but failover_pair_id is not the one with on (I think this should be changed)
> - check the primary device is plugged after the feature negotiation
> - check the result if the primary device is plugged before standby device and
>   vice-versa
> - check the if the primary device is coldplugged and the standy device
>   hotplugged and vice-versa
> - check the migration triggers the unplug and the hotplug
> 
> There is one preliminary patch in the series:
> 
> - PATCH 1 introduces a function to enable PCI bridge.
>   Failover needs to be plugged on a pcie-root-port and while
>   the root port is not configured the cards behind it are not
>   available
> 
> v5:
> - re-add the wait-unplug test that has been removed from v4 by mistake.
> 
> v4:
> - rely on query-migrate status to know the migration state rather than
>   to wait the STOP event.
> - remove the patch to add time out to qtest_qmp_eventwait()
> 
> v3:
> - fix a bug with ACPI unplug and add the related test
> 
> v2:
> - remove PATCH 1 that introduced a function that can be replaced by
>   qobject_to_json_pretty() (Markus)
> - Add migration to a file and from the file to check the card is
>   correctly unplugged on the source, and hotplugged on the dest
> - Add an ACPI call to eject the card as the kernel would do
> 
> Laurent Vivier (4):
>   qtest/libqos: add a function to initialize secondary PCI buses
>   tests/qtest: add some tests for virtio-net failover
>   failover: fix unplug pending detection
>   tests/libqtest: update virtio-net failover test
> 
>  hw/acpi/pcihp.c                   |  30 +-
>  include/hw/pci/pci_bridge.h       |   8 +
>  tests/qtest/libqos/pci.c          | 118 ++++++
>  tests/qtest/libqos/pci.h          |   1 +
>  tests/qtest/meson.build           |   3 +
>  tests/qtest/virtio-net-failover.c | 681 ++++++++++++++++++++++++++++++
>  6 files changed, 838 insertions(+), 3 deletions(-)
>  create mode 100644 tests/qtest/virtio-net-failover.c
> 
> -- 
> 2.33.1
> 


