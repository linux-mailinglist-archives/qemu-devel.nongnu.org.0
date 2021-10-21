Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A71435AD3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 08:22:49 +0200 (CEST)
Received: from localhost ([::1]:48876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdRTT-0006OE-1S
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 02:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdRQG-0005Kb-CY
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 02:19:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdRQC-0006Fj-Pl
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 02:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634797162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RnDOPY7ZkXvDa5y6ElYrTKzwDTyc17IpX0cbqXHbZJk=;
 b=P6ZEYn6Wd7dmlrmwzlV9YEnTY2QlOshnq/ZTrelePmrbNJIULUbVqqfW8gEL8Q26N2VZYP
 VCZJ91M0OlKE31mC6ouogPDvltaQzHqTC0PjORbYWWnuzUY6KjwXEA+HKKpiCVg+ZRcVAX
 K3dqyLY7PhNFGFTPNH0l2KmBKKJCNwU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-CyzuvMuqOwamnOHEE7qqaw-1; Thu, 21 Oct 2021 02:19:21 -0400
X-MC-Unique: CyzuvMuqOwamnOHEE7qqaw-1
Received: by mail-wr1-f72.google.com with SMTP id
 f1-20020a5d64c1000000b001611832aefeso10964512wri.17
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 23:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RnDOPY7ZkXvDa5y6ElYrTKzwDTyc17IpX0cbqXHbZJk=;
 b=LONbxQ+EKPE4eALf/SDuG9s7uKHo6vOCcggEcjrBrhWRrsnKerjmVhpCShFl8cyh2T
 x37asAaK3xjFNmLVoDd6jQoEj9I+noHH/lv0MAgEDXxS4BgKDg6SfmMnoZ36p9F8IQHM
 wiMBaE0dXYs9jgwLiNOJQzKai9t95GgfmStQM39zTo47Rp3dJMxXYJUvtUV2kSTNK+Qf
 kKREOCW2pAkWKzTUvdkG2UxI7wT2utSPKh60tJxZe5vDYtloxLAIvCLWGU+90xha6W66
 hGpcvXsvSUWNU1f/PIDkrRRi2RRyjRmFVdrN+QbLSyAa13beO7qm0y7KdbubsTpfb0Pt
 tDrg==
X-Gm-Message-State: AOAM531XS4xxImoSISQSCf3jH/poBBye/+OAHFBwS+E41Jq6aheAJShI
 8edB3HbViHo/n+hyztPGRxec66mIsxQQHnxS1DHauzX6BB7EfDGlKYx1cLqUnbMdlzJiI3HjeLs
 dFOZ/C6ZlLI6kzow=
X-Received: by 2002:a1c:4b08:: with SMTP id y8mr4595530wma.98.1634797160307;
 Wed, 20 Oct 2021 23:19:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysfq6+xiWLOziJGQy3jJd+Cc6C1uc5S8x6lLIh8e6DJwy7KHg6Oj3cG+85DWHRmqAjLVHJRg==
X-Received: by 2002:a1c:4b08:: with SMTP id y8mr4595511wma.98.1634797160028;
 Wed, 20 Oct 2021 23:19:20 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id c18sm3949829wrr.60.2021.10.20.23.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 23:19:18 -0700 (PDT)
Date: Thu, 21 Oct 2021 02:19:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3 0/3] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
Message-ID: <20211021021635-mutt-send-email-mst@kernel.org>
References: <20211007135750.1277213-1-ani@anisinha.ca>
 <20211020043845-mutt-send-email-mst@kernel.org>
 <CAARzgwxh6g=p7UNsKnwPw9EKf+5kAv4Z0s2Bw8qvmX1Lc38wxQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAARzgwxh6g=p7UNsKnwPw9EKf+5kAv4Z0s2Bw8qvmX1Lc38wxQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 21, 2021 at 07:18:43AM +0530, Ani Sinha wrote:
> 
> 
> On Wed, Oct 20, 2021 at 2:09 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> 
>     On Thu, Oct 07, 2021 at 07:27:47PM +0530, Ani Sinha wrote:
>     > changelist:
>     > v3: removed "nodefaults" from the command line and rebased the patchset.
>     > v2: incorporated some of the feedbacks from Igor.
>     > v1 : initial RFC patch.
> 
>     This seems to break on s390 hosts for people. Likely an
>     endian-ness bug somewhere. Dropped for now - care tracking that down
>     and fixing so I can pick up the test again?
> 
>     Thanks!
> 
> 
> So I take it this patch wasn't causing the issue since this has been merged to
> master now?
> 
> 

Yes, we knew the bug is in the tested functionality not the test of
course. With help from Thomas I was able to fix the original bug.
The fix with more detail is here:

commit 0e464f7d993113119f0fd17b890831440734ce15
Author: Michael S. Tsirkin <mst@redhat.com>
Date:   Wed Oct 20 05:48:54 2021 -0400

    pci: fix PCI resource reserve capability on BE



> 
>     > This patchset adds a unit test to exercize acpi hotplug support for
>     multifunction
>     > bridges on q35 machines. This support was added with the commit:
>     >
>     > d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction
>     bridges")
>     >
>     > Ani Sinha (3):
>     >   tests/acpi/bios-tables-test: add and allow changes to a new q35 DSDT
>     >     table blob
>     >   tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges
>     >     for q35
>     >   tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge
>     >     test
>     >
>     >  tests/data/acpi/q35/DSDT.multi-bridge | Bin 0 -> 8583 bytes
>     >  tests/qtest/bios-tables-test.c        |  18 ++++++++++++++++++
>     >  2 files changed, 18 insertions(+)
>     >  create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge
>     >
>     > --
>     > 2.25.1
> 
> 


