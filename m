Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5F050C118
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 23:35:15 +0200 (CEST)
Received: from localhost ([::1]:57376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ni0vq-00026K-GH
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 17:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ni0uM-0001NA-72
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 17:33:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ni0uJ-0005ts-4T
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 17:33:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650663216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OVdpySho78QxGwo+0KGsjIyCa6WEEXxXhaufuAQU1LY=;
 b=PL36tEhT0GV5jDbZbcsp7B1N+RjNT0UtEnH7zAFRtFflyCaoEBYVrpZpxhB9ZVGsrDM9sZ
 gkhESfwaMUWsl5EW9D+p2VLUMMUO3kodxmNl3m+S/MssY1ASPzzMuU0JlCl2jU1k9HdzEN
 Tv8ddakkImJg3DhV0wmOFVr2F1enCgg=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-v9JlKkSUN8O463y5k0dmNw-1; Fri, 22 Apr 2022 17:33:33 -0400
X-MC-Unique: v9JlKkSUN8O463y5k0dmNw-1
Received: by mail-io1-f72.google.com with SMTP id
 g20-20020a056602151400b00654afb7ec5dso6195585iow.11
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 14:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=OVdpySho78QxGwo+0KGsjIyCa6WEEXxXhaufuAQU1LY=;
 b=71Ka31W6cwrcSDdL8p9OvGynrkNzhr84a56hs2un+7jRFBFWUb0aaOFpJX82upcUN/
 JAhNGXF7eMpRu1Td1yVHhGWp5WgAq6kNIdmZVE5Ayq7EfGfcQPo8FiaIGWAoV+Cg9Qj4
 N9GZfX7fVJqqvP6edop9MaZ+IXvFYb3R5YMqKsJLgTeS0TkaiwysSjibRLzPOnu+0BJG
 pxMFq41+t1D8DysLOAjKCznYQalkCL+M6LTgcs7U8MDG0SD0DTm3TJStN2tv+I7bHKh+
 Td09ZtZaYYcXZ/kJyOd7cb8vPUr9Ssw2HydypWVgQOdYgqNnrPenA6e67mbN3syYZpEQ
 OU7A==
X-Gm-Message-State: AOAM533KbkMbXnRrpQb6omwnCTTRLT3NJRVFaH4KEBxPNg7Y9VRI8d1z
 wNPZjhHWgubsRS175psUyTaFhNp+5POY0HjFsNflIMBi4jWryimfZ3Hgw4pXpBmc7co9l6cVG0G
 /U/eWqvaFQ4rIaSA=
X-Received: by 2002:a6b:ce01:0:b0:64c:ad0b:9a65 with SMTP id
 p1-20020a6bce01000000b0064cad0b9a65mr2733056iob.147.1650663212444; 
 Fri, 22 Apr 2022 14:33:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHQuEJ/4+XIAxI8nDJGV2Ar3DbGZhR50PQUrjkKMeDChjKbDWeZkXiL8fKTuOT4FzFCDsVZg==
X-Received: by 2002:a6b:ce01:0:b0:64c:ad0b:9a65 with SMTP id
 p1-20020a6bce01000000b0064cad0b9a65mr2733044iob.147.1650663212250; 
 Fri, 22 Apr 2022 14:33:32 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 s7-20020a5eaa07000000b00654bf640320sm2210052ioe.55.2022.04.22.14.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 14:33:31 -0700 (PDT)
Date: Fri, 22 Apr 2022 15:33:30 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC 15/18] vfio/iommufd: Implement iommufd backend
Message-ID: <20220422153330.7e0a3956.alex.williamson@redhat.com>
In-Reply-To: <20220422145815.GK2120790@nvidia.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <20220414104710.28534-16-yi.l.liu@intel.com>
 <20220422145815.GK2120790@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, farman@linux.ibm.com,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org, mjrosato@linux.ibm.com,
 jasowang@redhat.com, cohuck@redhat.com, thuth@redhat.com, peterx@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, eric.auger@redhat.com,
 yi.y.sun@intel.com, chao.p.peng@intel.com, nicolinc@nvidia.com,
 kevin.tian@intel.com, eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Apr 2022 11:58:15 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> I don't see IOMMU_IOAS_IOVA_RANGES called at all, that seems like a
> problem..

Not as much as you might think.  Note that you also won't find QEMU
testing VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE in the QEMU vfio-pci
driver either.  The vfio-nvme driver does because it has control of the
address space it chooses to use, but for vfio-pci the address space is
dictated by the VM and there's not a lot of difference between knowing
in advance that a mapping conflicts with a reserved range or just
trying add the mapping and taking appropriate action if it fails.
Thanks,

Alex


