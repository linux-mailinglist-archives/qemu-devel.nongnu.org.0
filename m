Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E45D32748B
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 22:14:18 +0100 (CET)
Received: from localhost ([::1]:51456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGTOJ-0003KX-Tb
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 16:14:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lGT00-0006xu-ES
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 15:49:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lGSwd-0000Pn-4Z
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 15:45:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614545131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VSS4P8rDO2rjORqhPBW8iHDPy+7Elg36kNFquHVJu48=;
 b=U3iyZJC/daDNmi3vvXHBL8TnA6OAZLFIdVCVSuZtT0OyPFun7A8q9LWlmtei24Z+HyRpTA
 p9Qy/v2rUbFLfQqq5/6bnl6xIeooLDAeEs8OGcjohZJrzsKXQ296sKuC0iCAgpXyghH25L
 xeijGTsEwFcEMoUe9s0SoIYRJpTNBow=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-GrWufKETOIaEe7F0IBVvzQ-1; Sun, 28 Feb 2021 15:45:29 -0500
X-MC-Unique: GrWufKETOIaEe7F0IBVvzQ-1
Received: by mail-ed1-f70.google.com with SMTP id n20so2420177edr.8
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 12:45:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VSS4P8rDO2rjORqhPBW8iHDPy+7Elg36kNFquHVJu48=;
 b=hHaw3AoQ6PMHq/jFXJSalthj8QBvlbsMKCbx+I4YpI5pHZFSO8VDsrycYGlRQak5n5
 B2MSa0vPPNuJVJluOtdCPR+qBBNrA+BNSVNqZ2dGGcXbp4G5XItQe9cU/+KtfpGKWyKT
 6tqnoxWiaUtQAJmKZZeeXpqgQL7JZH/gbXUkCpdpsxlGPsgo1628GZMWC/FJNpu2UXwG
 Iu6pfuNVNN0mnNaytddh/kobgCs+cCsFb0RiTCrxiupzoKmIoJKfeVmKzsyhdOg+e1fR
 1C9AnQ8REEufz2lhRgS4nRt/PvKYYImk+KQl3Dexh0C5aAZ2Jew34D8xy/z8Ydn47Dh+
 DjbA==
X-Gm-Message-State: AOAM531JAdq6soeIZ26vPgNBf2+6DZ/6Ty3+IzlSa+92MHODyY+/0H9S
 ODHhykEmcs1qcybWygOFEqvC23Un2X1xbZXg3WyL39UiXE8mgOs3aO8CX8cVZ5Od8xBH/yb7n8i
 WSEYoiEeq4GKhJvU=
X-Received: by 2002:a17:907:d86:: with SMTP id
 go6mr12522626ejc.337.1614545127999; 
 Sun, 28 Feb 2021 12:45:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFeKw4aHr6q5avMapTyLRnGw72EIqBrp9nUmI5tlr+ufyzZkJPbm+oHzD1NQJeYkpw1MZraA==
X-Received: by 2002:a17:907:d86:: with SMTP id
 go6mr12522612ejc.337.1614545127847; 
 Sun, 28 Feb 2021 12:45:27 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id u14sm10534492ejx.60.2021.02.28.12.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 12:45:27 -0800 (PST)
Date: Sun, 28 Feb 2021 15:45:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: Re: [PATCH 1/2] i386/acpi: fix inconsistent QEMU/OVMF device paths
Message-ID: <20210228154404-mutt-send-email-mst@kernel.org>
References: <20200730155755.188845-1-mst@redhat.com>
 <5b40e1ac-03ca-7954-4d50-f5f96c339772@proxmox.com>
 <1D984D1D-0DFB-49FC-BD7F-1AAF9B862A5D@protonmail.com>
 <e36b3025-d709-1a6c-6b5a-a08bc6de819f@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <e36b3025-d709-1a6c-6b5a-a08bc6de819f@proxmox.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: vit9696 <vit9696@protonmail.com>, Stefan Reiter <s.reiter@proxmox.com>,
 qemu devel list <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 28, 2021 at 11:43:55AM +0100, Thomas Lamprecht wrote:
> Hi Vitaly,
> 
> On 28.02.21 10:11, vit9696 wrote:
> > For us this breaks the ability to control the boot options between the operating system and the OVMF. It happens because the operating system builds the DPs based on ACPI (in fact the only source available to it), while OVMF uses another source. The previous behaviour also violates the specification, so I do not believe there is room for reverting it. I believe it is also not possible to update QEMU to internally use the 1 UID, since it may conflict with the case when there are multiple PCI bus.
> 
> I think you may have misunderstood me a little bit, I did not ask for this to
> be reverted in upstream QEMU, it's quite clear to me that this should be the
> new default behaviour and should have been since ever.

We do make an effort to avoid guest visible changes within machine
version though. this is what we should do here I think.

-- 
MST


