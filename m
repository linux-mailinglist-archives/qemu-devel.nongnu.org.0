Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B60D2C44A6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 17:07:29 +0100 (CET)
Received: from localhost ([::1]:39928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khxKK-0007tP-5w
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 11:07:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1khxI9-0006YY-Gj
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 11:05:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1khxI7-0007hm-Kl
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 11:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606320310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SWlfW+GKbKZgSCocaPNxCEln9yLMuh0C04QbBmkOCeQ=;
 b=ahzIlhUkkNTTePHcKgVwOlp1TrrKDgCnPpG1Kj5aIK9gtBSqq72fYLYWzbAzjYBQPK+mqn
 XAeDbI4wMuOAjL87Uzf3dGDxQCstGkxvVwilO2nrmJgviNs7eTDeuN1okoJe20WWMRadbf
 f8LYoZyaHv7bgPiTsOtuU3WQo79yua0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-0AzR_cibNAC25rErAWy6-w-1; Wed, 25 Nov 2020 11:05:05 -0500
X-MC-Unique: 0AzR_cibNAC25rErAWy6-w-1
Received: by mail-wm1-f72.google.com with SMTP id v5so954404wmj.0
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 08:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SWlfW+GKbKZgSCocaPNxCEln9yLMuh0C04QbBmkOCeQ=;
 b=s7sJMj0OAEhH3BmT7AILBT/USFa/l0c6Zb3EDzHTL4In6m2AsOrC/G4iVC8RbjiICt
 SmaudHA99LAIIWTPiVvspSWKo2XU12I08BE7FS6QhxLAaRMspx3NZbDPu4b7RQv1EYS5
 1/XqPPT1Psgv9g1cu+s/QCZd0VRc/7cIS4AyOLMDg/R8i0PfrhiPFeiGhOz+CdS+s3ga
 VsfC0KEc+9mxoD/JLk3UJ+Yo26w5KmclP9UkvzDDcDmBLf2c76HN3yoLpPaorSvGjVxv
 rLgjHi+LAlIYPYMoCmr1I1eqSV8eupf8Tqxy/xjt48xXWUVsFKVn3gO5pjwoyk+vp5KT
 ighQ==
X-Gm-Message-State: AOAM5335S1J0pk4Ga717u1OgZ+Tjikk/Dm0w9578IUNiWZOj/u9mdU19
 yoVPQMKHD5G1hC8e7cXo67Fp41xZ4fBXHMEeAFiJDJcOp+foJlLbiCsq6SYBr4OkugZB36MgT8A
 j7B5xhwrsNIEH0rQ=
X-Received: by 2002:adf:dd09:: with SMTP id a9mr4978748wrm.128.1606320302423; 
 Wed, 25 Nov 2020 08:05:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1FIaIwb8Hx+hMeXXRzuTnXQ/Iv9LQitxjkq8hIqLncTWgTKW1MKEV9wcGyo5UDOjScyfsWQ==
X-Received: by 2002:adf:dd09:: with SMTP id a9mr4978504wrm.128.1606320300105; 
 Wed, 25 Nov 2020 08:05:00 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id a191sm5467313wme.25.2020.11.25.08.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 08:04:58 -0800 (PST)
Date: Wed, 25 Nov 2020 11:04:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [DISCUSSION] Allow ACPI default OEM ID and OEM table ID fields
 to be set.
Message-ID: <20201125110221-mutt-send-email-mst@kernel.org>
References: <20201125132711.jqb7znxu5jpoanwi@tartarus>
 <20201125133251.GI30079@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201125133251.GI30079@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Antoine Damhet <antoine.damhet@blade-group.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 25, 2020 at 01:32:51PM +0000, Richard W.M. Jones wrote:
> On Wed, Nov 25, 2020 at 02:27:11PM +0100, Antoine Damhet wrote:
> > Hello,
> > 
> > We recently found out that some softwares are effectively crashing
> > when they detect qemu's `OEM ID` or `OEM table ID` in the ACPI tables.
> > 
> > I see no reason not to expose the setting to the user/command-line. A
> > previous patch has been submitted in 2015[1] but did not get through
> > because (if I understand correctly) using the IDs on the `SLIC`, `BXPC`
> > and `RSDT` tables were enough at the time.
> > 
> > If you agree, I am willing to forward port the patches of M. Jones but I
> > need to ask how it would work `Signed-Off`-wise ?
> 
> On this point, the patch I sent was actually written by
> Michael Tokarev, I was only trying to get them upstream.
> 
> Rich.

I think at least one of the issues is that e.g. UEFI at least
seems to assume unique OEM table IDs e.g. for SSDTs.

So let's try to be more specific please, which software
crashes, what does it want to see and in which table.


> > Thanks in advance for your time,
> > 
> > PS: the softwares will crash if the signature is found in any of the
> >     exposed tables.
> > 
> > [1]: https://lore.kernel.org/qemu-devel/1441220618-4750-1-git-send-email-rjones@redhat.com/
> > 
> > -- 
> > Antoine 'xdbob' Damhet
> 
> -- 
> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> virt-p2v converts physical machines to virtual machines.  Boot with a
> live CD or over the network (PXE) and turn machines into KVM guests.
> http://libguestfs.org/virt-v2v


