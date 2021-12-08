Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7220A46D1BE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 12:12:47 +0100 (CET)
Received: from localhost ([::1]:44404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muusO-000680-6E
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 06:12:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1muuqv-0005M2-O2
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 06:11:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1muuqt-0001Mk-1c
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 06:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638961870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n6Bke5lVz3hjEvzuvQT3LJBfMSO1DEQV7sTpmZmf2aU=;
 b=Bx2YzgSaHIhTavWbO43YbpCJwQ/5Xla0Z4lp+Mpaqfvkvg/bjW1xF+SazNesg6RJcDoZ7A
 rCGfzxwH32pK63XZDCfbDcpQsW1FgDP574OSLJsG4JvH9bQWH3UelkK2uaYNhHQub7F7zG
 ozwdo2iGnG1tS8pbSAVRe1OEY4strgY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-s9KC8FOyP3GIyEnZ2fRhbg-1; Wed, 08 Dec 2021 06:11:09 -0500
X-MC-Unique: s9KC8FOyP3GIyEnZ2fRhbg-1
Received: by mail-ed1-f71.google.com with SMTP id
 q17-20020aa7da91000000b003e7c0641b9cso1821369eds.12
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 03:11:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n6Bke5lVz3hjEvzuvQT3LJBfMSO1DEQV7sTpmZmf2aU=;
 b=08uZGrjyMZ+zqK5RRiqmMbHusaLsYwcG4ofjCQn9MSFo9X4dDU1q8upzRkNMK/o9Ad
 tZU9SprB2p5ovHmBDuxE8hVjruyhN/ZiV4wXPgNOqVBNJYHH8upXuWXcNEfFn/LmGpJW
 cWtTlkdiq6cOaZVgsc9eeYOhl9+VZcQKoQ/sBHF7wxjDd5xl7n/OqbVJZskIf6J2rpIa
 AiQw5JnCBJi3Elys4ul+3hdmdA2inkoBaKpNVmx9LdHFb9a4WzjljhDHqYLoVhn0vc1P
 ngj1bzr1wnrOraoCdyYF3svJTKViebpaU4s3XdaMob8P4zHb7XITVHCoB2dwlLHlmJ+A
 FH3A==
X-Gm-Message-State: AOAM5317nJeBIqx6XCyzqPpNEGKv8MmLP6qH9OfUmfk1qVUfYh+TPdII
 ovEv+JChhkXis7nJlHq7BqqSM60bBV0u8PFTRnd12qpvPe1HSnwQRY/kw36GlLZ1CxY/Bo5FRr/
 DT5R6CVsMS2avmDg=
X-Received: by 2002:a17:907:7ea6:: with SMTP id
 qb38mr6617918ejc.248.1638961867698; 
 Wed, 08 Dec 2021 03:11:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLvxaSwoRhNR+KkE8cPzsyMhGxUNhgP20MXGEZ/ZINFTf9nx7MrQF6D0CrdYJdEkAs1a8hpw==
X-Received: by 2002:a17:907:7ea6:: with SMTP id
 qb38mr6617888ejc.248.1638961867514; 
 Wed, 08 Dec 2021 03:11:07 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107e:ebdb:5cc6:c351:b05:514f])
 by smtp.gmail.com with ESMTPSA id c8sm1728822edu.60.2021.12.08.03.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 03:11:06 -0800 (PST)
Date: Wed, 8 Dec 2021 06:11:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v5 3/4] failover: fix unplug pending detection
Message-ID: <20211208061049-mutt-send-email-mst@kernel.org>
References: <20211119090718.440793-1-lvivier@redhat.com>
 <20211119090718.440793-4-lvivier@redhat.com>
 <20211208023603-mutt-send-email-mst@kernel.org>
 <6764b29d-3885-ec0e-0b90-f0c05a544571@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6764b29d-3885-ec0e-0b90-f0c05a544571@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 08, 2021 at 08:50:34AM +0100, Thomas Huth wrote:
> On 08/12/2021 08.36, Michael S. Tsirkin wrote:
> > On Fri, Nov 19, 2021 at 10:07:17AM +0100, Laurent Vivier wrote:
> > > Failover needs to detect the end of the PCI unplug to start migration
> > > after the VFIO card has been unplugged.
> > > 
> > > To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset in
> > > pcie_unplug_device().
> > > 
> > > But since
> > >      17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35")
> > > we have switched to ACPI unplug and these functions are not called anymore
> > > and the flag not set. So failover migration is not able to detect if card
> > > is really unplugged and acts as it's done as soon as it's started. So it
> > > doesn't wait the end of the unplug to start the migration. We don't see any
> > > problem when we test that because ACPI unplug is faster than PCIe native
> > > hotplug and when the migration really starts the unplug operation is
> > > already done.
> > > 
> > > See c000a9bd06ea ("pci: mark device having guest unplug request pending")
> > >      a99c4da9fc2a ("pci: mark devices partially unplugged")
> > > 
> > > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > > Reviewed-by: Ani Sinha <ani@anisinha.ca>
> > 
> > Hmm.  I think this one may be needed for this release actually.
> > Isolate from testing changes and repost?
> 
> You merged it already here:
> 
>  https://gitlab.com/qemu-project/qemu/-/commit/9323f892b39d133eb6

Oh, good. Forgot to drop the tag.

> so we should be fine :-)
> 
>  Thomas


