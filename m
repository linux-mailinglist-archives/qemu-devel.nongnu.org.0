Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5515087BC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 14:07:23 +0200 (CEST)
Received: from localhost ([::1]:54182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh97C-0007Qg-So
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 08:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nh931-00016H-KI
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:03:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nh92v-00058v-EV
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650456176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DnlX5R06QcjgypdpTLCL6iW8S0UG/qM1MSeunC4Ul2w=;
 b=QKcDsaO+RIsMW4cZ2qfwPfnUcBh82gpR/0EMjeo/J+Lr91yWle3EhZOL6vfXZiiLlQdYDV
 or8vmpbfG6xaj84FQbGpmEduaaBKFC6kcGHsrcBLg+uj+qdmURHrRKxyxCzM9jKIQeJgU5
 yxJ0cw8Y3VtwoK/ILXfpiQDHsGDHL3U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-YYG1uAD7OR6WxI9q5BWQOg-1; Wed, 20 Apr 2022 08:02:55 -0400
X-MC-Unique: YYG1uAD7OR6WxI9q5BWQOg-1
Received: by mail-wr1-f70.google.com with SMTP id
 f2-20020a056000036200b00207a14a1f96so333800wrf.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 05:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DnlX5R06QcjgypdpTLCL6iW8S0UG/qM1MSeunC4Ul2w=;
 b=p4M5Cx1L7KW5mFRbaHNhjxeoS64c/BRovjt+gEs/61r6qaF73iSdbUp6jJ7xcUqBNL
 7XKK8kIKr11wYPV9nGmmuwbaDPvt3tv8CDFCFoz5TvofJA/hLrqBepOd6Vqic5vWOAdm
 ajd2DlZDRuPGJTEV4ecxQo3nMoNpQlu6dHNKlIiIRT9Hal4G6LsKGnERIQgLZRSGyfwM
 Bqw6NbYOvyG85kuaK+ehxK69rqr+SGtUyYZq/LRVg6/J9chPACWVypd83W7f8dMpdZEU
 MSIZRp+Y34nHFluxLr5Nze+ZEbiK/BGlPp2t2Y7XQvnlC3XepLQRtIiWjsNEIAZo1BOU
 vTUw==
X-Gm-Message-State: AOAM531hzUgv3cMlwt7UEVXIuQTlvBZ5l+W0N+ntO/6kYPtx/QBbWz3E
 1jI0K9x6xUWYvpi5w5BsJymbLs0vwYYB/sbEwxWfmbor/NhNwew8uCHUOcIW/YqgM9MEpqoxpBu
 QqTfsvmYk8OQh8AY=
X-Received: by 2002:a05:600c:1c93:b0:38e:c558:10db with SMTP id
 k19-20020a05600c1c9300b0038ec55810dbmr3279002wms.121.1650456173969; 
 Wed, 20 Apr 2022 05:02:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBwj+TycgaRD3lE16/kCQPdhBYwyr6+EGMv9n0zreLQdalQtW0QGLa8T/HDnbbdlgnZLevog==
X-Received: by 2002:a05:600c:1c93:b0:38e:c558:10db with SMTP id
 k19-20020a05600c1c9300b0038ec55810dbmr3278901wms.121.1650456173062; 
 Wed, 20 Apr 2022 05:02:53 -0700 (PDT)
Received: from redhat.com ([2.53.17.80]) by smtp.gmail.com with ESMTPSA id
 p3-20020a5d59a3000000b0020a83f00487sm13578096wrr.9.2022.04.20.05.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 05:02:52 -0700 (PDT)
Date: Wed, 20 Apr 2022 08:02:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v7 00/12] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <20220420080053-mutt-send-email-mst@kernel.org>
References: <20220318191819.1711831-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220318191819.1711831-1-lukasz.maniak@linux.intel.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, stefanha@redhat.com,
 qemu-block@nongnu.org, armbru@redhat.com, lukasz.gieryk@linux.intel.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, kbusch@kernel.org, its@irrelevant.dk,
 hreitz@redhat.com, xypron.glpk@gmx.de, k.jensen@samsung.com, ani@anisinha.ca,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 08:18:07PM +0100, Lukasz Maniak wrote:
> Resubmitting v6 as v7 since Patchew got lost with my sophisticated CC of
> all maintainers just for the cover letter.
> 
> Changes since v5:
> - Fixed PCI hotplug issue related to deleting VF twice
> - Corrected error messages for SR-IOV parameters
> - Rebased on master, patches for PCI got pulled into the tree
> - Added Reviewed-by labels
> 
> Lukasz Maniak (4):
>   hw/nvme: Add support for SR-IOV
>   hw/nvme: Add support for Primary Controller Capabilities
>   hw/nvme: Add support for Secondary Controller List
>   docs: Add documentation for SR-IOV and Virtualization Enhancements
> 
> Łukasz Gieryk (8):
>   hw/nvme: Implement the Function Level Reset
>   hw/nvme: Make max_ioqpairs and msix_qsize configurable in runtime
>   hw/nvme: Remove reg_size variable and update BAR0 size calculation
>   hw/nvme: Calculate BAR attributes in a function
>   hw/nvme: Initialize capability structures for primary/secondary
>     controllers
>   hw/nvme: Add support for the Virtualization Management command
>   hw/nvme: Update the initalization place for the AER queue
>   hw/acpi: Make the PCI hot-plug aware of SR-IOV

the right people to review and merge this would be storage/nvme
maintainers.
I did take a quick look though.

Acked-by: Michael S. Tsirkin <mst@redhat.com>



>  docs/system/devices/nvme.rst |  82 +++++
>  hw/acpi/pcihp.c              |   6 +-
>  hw/nvme/ctrl.c               | 673 ++++++++++++++++++++++++++++++++---
>  hw/nvme/ns.c                 |   2 +-
>  hw/nvme/nvme.h               |  55 ++-
>  hw/nvme/subsys.c             |  75 +++-
>  hw/nvme/trace-events         |   6 +
>  include/block/nvme.h         |  65 ++++
>  include/hw/pci/pci_ids.h     |   1 +
>  9 files changed, 909 insertions(+), 56 deletions(-)
> 
> -- 
> 2.25.1


