Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730E9460247
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Nov 2021 00:13:44 +0100 (CET)
Received: from localhost ([::1]:54490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mr6t5-0005MB-5p
	for lists+qemu-devel@lfdr.de; Sat, 27 Nov 2021 18:13:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mr6rx-0004gO-Ex
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 18:12:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mr6rt-00085U-5f
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 18:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638054747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ttm+71qkVb8BeBeZzYK1F3gWfjU34kgblWWl36AlFW8=;
 b=QGOUwiTDkOTqKqoJiNu+qD8T80N09+RRjdH/jrp4wmhacZ7QlL7fnExXXiN2f2PzHs4STs
 ufKBBXbFE4pZoJw8ZJv3EJeAYLp0tyTHtA3Mx76h4cOqg8ixDxcRS2SncDv2Z6DvqGPaab
 4GDIbp05maiWPSQBdJBfiO9r7KyLQ4c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-555-FQCRO4pbMvqOmbcUtwo-KA-1; Sat, 27 Nov 2021 18:12:26 -0500
X-MC-Unique: FQCRO4pbMvqOmbcUtwo-KA-1
Received: by mail-wm1-f72.google.com with SMTP id
 a64-20020a1c7f43000000b003335e5dc26bso7162521wmd.8
 for <qemu-devel@nongnu.org>; Sat, 27 Nov 2021 15:12:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ttm+71qkVb8BeBeZzYK1F3gWfjU34kgblWWl36AlFW8=;
 b=ijEadOKIbce0xz552huBP9X2oBSXWz/uNA+IY4E5wrCrs5qtxcb+dyfhzavIcP22B3
 YzuEydOQg/KOxQ85VwIooI/UP1vEfsHrWTPYbEfp7Zkz7keGsJjiStDoeSPRUUMO1r9s
 kBtgN/6tl0bnm8prXcBdw4ZLYdaQA426w9HI64xC2/TmIqGFED3Dm00w9XNRtNPqTN/R
 TlxGchjrGr1sQ7Q50ZtM2ZEKuSIG7NP/QSQ1lQWHYceiWijf7ObJJPz/fwzaJAlITb3P
 XPjZ+otG36IGwtkuEloVdeiNJkr46+OKjaKc5kUIVXKqHfPUzPg8joY+urgabubzaRVo
 02mA==
X-Gm-Message-State: AOAM530vCY2ruDD2ADcmXb0jkN5Mp4Thzdom5UH1uQgtCia5XO5IYSgr
 1gGyuVfo56+IGi08G+PtSiiKYUKwPKmbC1OH1XSEmAjLSEnKescfH43Ixg5NIPE5o8DEbh0iXzZ
 CWjFrBtcqZ3nd1AI=
X-Received: by 2002:a5d:59a2:: with SMTP id p2mr23380811wrr.252.1638054745379; 
 Sat, 27 Nov 2021 15:12:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxtExPcoM4brbRJ0bg4aXJRlCqEur/Zf6ufQ8ZS+lOVsbZ4YrHsuw80WnN+hmc/bbNLYosgw==
X-Received: by 2002:a5d:59a2:: with SMTP id p2mr23380795wrr.252.1638054745176; 
 Sat, 27 Nov 2021 15:12:25 -0800 (PST)
Received: from redhat.com ([2.55.9.9])
 by smtp.gmail.com with ESMTPSA id z14sm10176031wrp.70.2021.11.27.15.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 15:12:24 -0800 (PST)
Date: Sat, 27 Nov 2021 18:12:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v3 0/3] tpm: Add missing ACPI device identification objects
Message-ID: <20211127181148-mutt-send-email-mst@kernel.org>
References: <20211110133559.3370990-1-stefanb@linux.ibm.com>
 <f100e9ad-d55d-0d8b-83b2-3420beb5e892@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <f100e9ad-d55d-0d8b-83b2-3420beb5e892@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 26, 2021 at 11:15:40PM -0500, Stefan Berger wrote:
> Is this series now acceptable for 'after 6.2'?

Sure. Tagged. Pls ping me aftre release to help make sure I don't lose
it.

> 
> On 11/10/21 08:35, Stefan Berger wrote:
> > This series of patches adds missing ACPI device identification objects _STR
> > and _UID to TPM 1.2 and TPM 2 ACPI tables.
> > 
> >     Stefan
> > 
> > v3:
> >   - Dropped replacement of ACPI tables with empty files in 1/3.
> >   - Reduced ignored files
> > 
> > Stefan Berger (3):
> >    tests: acpi: prepare for updated TPM related tables
> >    acpi: tpm: Add missing device identification objects
> >    tests: acpi: Add updated TPM related tables
> > 
> >   hw/arm/virt-acpi-build.c           |   1 +
> >   hw/i386/acpi-build.c               |   8 ++++++++
> >   tests/data/acpi/q35/DSDT.tis.tpm12 | Bin 8894 -> 8900 bytes
> >   tests/data/acpi/q35/DSDT.tis.tpm2  | Bin 8894 -> 8921 bytes
> >   4 files changed, 9 insertions(+)
> > 


