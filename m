Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8CE48C7D9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 17:08:36 +0100 (CET)
Received: from localhost ([::1]:43400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7gAu-0002sy-1E
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 11:08:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n7fYb-0000HE-O0
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:29:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n7fYY-0002Ry-8Z
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:29:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642001336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x3FULkbs8U5a4jwXVYYm08abImJHp/BKLlb0d+3s8R8=;
 b=cZx418rEc1KzKKbdG3xOOMw6J01A47Ck2p/MF4dllu3CLCYWfqLoANIY1rqJqVxZQtR7n6
 k6yxCK0s6rKfXYk9FrrUnWOtFeUxhkh6oQkw7b3RYq/6ViASMAc6f3oGpv/cezw1rxjQwG
 lD2jK3aHxoln750r4589SXxILpO74Jc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-lxQK8-S9MhORSJL80VfskA-1; Wed, 12 Jan 2022 10:28:55 -0500
X-MC-Unique: lxQK8-S9MhORSJL80VfskA-1
Received: by mail-ed1-f72.google.com with SMTP id
 h1-20020aa7cdc1000000b0040042dd2fe4so1296163edw.17
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 07:28:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x3FULkbs8U5a4jwXVYYm08abImJHp/BKLlb0d+3s8R8=;
 b=gawK8pHIPsRklhNhgP4dB95pNpZlAWMbOmRSdDwUeEk4mQOg71l1o7bJI56ZA7VzC8
 JoV+l6z1I44iKHqphPhOC6SdIz86aPfFSLe3ULTJA+sBU3aESFF+bE4qpsIYhn5FLkzH
 Rd5N7ktGF4wOPGdSjYaIEImDpQNnDQNewygPmscvMGpr+fbInjX00srZIBbNfB3T5VPa
 cidEhBf2mhF05A6yZN4OQU7R0QBZRx+TdwzPlmmwVxVQ372fxOxfJyCTCWiP6mD82zsq
 L9x12bDZzAJ8vQs5CWpBt/uy45fXopOfMtGz2Ik7bGuGLigFMKmSrUVIYzu76P1Jr0iS
 gclA==
X-Gm-Message-State: AOAM533Lo7tngronq5+DDywhIeYr+VZttptPyLLBBXeXE/qHYQFNAnz3
 tQ26hY669RZmj1JzJ5MqPfrQpaBd5WuCGxFoTQDIrmf0Hvpi9wZrtxxhTexJ1n/dw1jXONQ7WTW
 ZcCjcM5uMgTBjeSQ=
X-Received: by 2002:a17:906:175b:: with SMTP id
 d27mr216620eje.476.1642001334140; 
 Wed, 12 Jan 2022 07:28:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzv9DdXobu9/GWKq4Mgo1AtN1ydGB16OIcNG5F3fqwuoL4il2qdnaqDMEJB9+LsxSs/9Cw4Fw==
X-Received: by 2002:a17:906:175b:: with SMTP id
 d27mr216597eje.476.1642001333857; 
 Wed, 12 Jan 2022 07:28:53 -0800 (PST)
Received: from redhat.com ([2.55.132.148])
 by smtp.gmail.com with ESMTPSA id v8sm58475edt.10.2022.01.12.07.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 07:28:53 -0800 (PST)
Date: Wed, 12 Jan 2022 10:28:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 3/4] acpi: fix OEM ID/OEM Table ID padding
Message-ID: <20220112102814-mutt-send-email-mst@kernel.org>
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220112130332.1648664-4-imammedo@redhat.com>
 <20220112083938-mutt-send-email-mst@kernel.org>
 <alpine.OSX.2.20.2201122045140.60839@athabasca.local>
MIME-Version: 1.0
In-Reply-To: <alpine.OSX.2.20.2201122045140.60839@athabasca.local>
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
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, "Dmitry V . Orekhov" <dima.orekhov@gmail.com>,
 Marian Postevca <posteuca@mutex.one>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 08:46:16PM +0530, Ani Sinha wrote:
> 
> 
> On Wed, 12 Jan 2022, Michael S. Tsirkin wrote:
> 
> > On Wed, Jan 12, 2022 at 08:03:31AM -0500, Igor Mammedov wrote:
> > > Commit [2] broke original '\0' padding of OEM ID and OEM Table ID
> > > fields in headers of ACPI tables. While it doesn't have impact on
> > > default values since QEMU uses 6 and 8 characters long values
> > > respectively, it broke usecase where IDs are provided on QEMU CLI.
> > > It shouldn't affect guest (but may cause licensing verification
> > > issues in guest OS).
> > > One of the broken usecases is user supplied SLIC table with IDs
> > > shorter than max possible length, where [2] mangles IDs with extra
> > > spaces in RSDT and FADT tables whereas guest OS expects those to
> > > mirror the respective values of the used SLIC table.
> > >
> > > Fix it by replacing whitespace padding with '\0' padding in
> > > accordance with [1] and expectations of guest OS
> > >
> > > 1) ACPI spec, v2.0b
> > >        17.2 AML Grammar Definition
> > >        ...
> > >        //OEM ID of up to 6 characters. If the OEM ID is
> > >        //shorter than 6 characters, it can be terminated
> > >        //with a NULL character.
> > >
> > > 2)
> > > Fixes: 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
> >
> >
> > and add:
> >
> > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/707
> 
> He did that already with the "Resolves:" line below.

oh sorry

> >
> > ?
> >
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/707
> > > Reported-by: Dmitry V. Orekhov <dima.orekhov@gmail.com>
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > Cc: qemu-stable@nongnu.org
> > > ---
> > >  hw/acpi/aml-build.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > > index b3b3310df3..65148d5b9d 100644
> > > --- a/hw/acpi/aml-build.c
> > > +++ b/hw/acpi/aml-build.c
> > > @@ -1724,9 +1724,9 @@ void acpi_table_begin(AcpiTable *desc, GArray *array)
> > >      build_append_int_noprefix(array, 0, 4); /* Length */
> > >      build_append_int_noprefix(array, desc->rev, 1); /* Revision */
> > >      build_append_int_noprefix(array, 0, 1); /* Checksum */
> > > -    build_append_padded_str(array, desc->oem_id, 6, ' '); /* OEMID */
> > > +    build_append_padded_str(array, desc->oem_id, 6, '\0'); /* OEMID */
> > >      /* OEM Table ID */
> > > -    build_append_padded_str(array, desc->oem_table_id, 8, ' ');
> > > +    build_append_padded_str(array, desc->oem_table_id, 8, '\0');
> > >      build_append_int_noprefix(array, 1, 4); /* OEM Revision */
> > >      g_array_append_vals(array, ACPI_BUILD_APPNAME8, 4); /* Creator ID */
> > >      build_append_int_noprefix(array, 1, 4); /* Creator Revision */
> > > --
> > > 2.31.1
> >
> >


