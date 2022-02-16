Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CC94B844C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:31:28 +0100 (CET)
Received: from localhost ([::1]:60678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGel-0006b4-If
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:31:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nKFXe-0000bV-4H
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:20:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nKFXa-0003Rl-1i
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:20:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644999596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+hVtNAlimHxJZ7QteAS+uNEizAXGL88rT0Fz1sgCpL8=;
 b=OUVJBLHbVwuugnR2XVFiKLYeTOsvmovTeLyVMaDE4VNFu26G494WKAUmszFIiUR0hZZ2Lv
 n5/Km+AhxoFt3ODXUzhEbU4v9dS3ub9WiYX2LL7v8RJRBh3EsarPCCp809efw2FdZbN2dZ
 QwPPwakZFE3NjVTN3AYezlaN0Ap5QtI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-Sd7aT-SuMtGMeH0Fp5dITQ-1; Wed, 16 Feb 2022 03:19:53 -0500
X-MC-Unique: Sd7aT-SuMtGMeH0Fp5dITQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E424818460E5;
 Wed, 16 Feb 2022 08:19:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 026C95E488;
 Wed, 16 Feb 2022 08:19:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6C67118000B2; Wed, 16 Feb 2022 09:19:17 +0100 (CET)
Date: Wed, 16 Feb 2022 09:19:17 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where
 applicable
Message-ID: <20220216081917.sqc5jdikaoxjbciv@sirius.home.kraxel.org>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-3-joao.m.martins@oracle.com>
 <20220214155318.3ce80da0@redhat.com>
 <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
 <20220214163158.4c4b210b@redhat.com>
 <20220215095358.5qcrgwlasheu63uj@sirius.home.kraxel.org>
 <8a0bcebf-117e-fe41-a477-4769ca94472c@oracle.com>
MIME-Version: 1.0
In-Reply-To: <8a0bcebf-117e-fe41-a477-4769ca94472c@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 07:37:40PM +0000, Joao Martins wrote:
> On 2/15/22 09:53, Gerd Hoffmann wrote:
> > What is missing:
> > 
> >  * Some way for the firmware to get a phys-bits value it can actually
> >    use.  One possible way would be to have a paravirtual bit somewhere
> >    telling whenever host-phys-bits is enabled or not.
> > 
> If we are not talking about *very old* processors... isn't what already
> advertised in CPUID.80000008 EAX enough? That's the maxphysaddr width
> on x86, which on qemu we do set it with the phys-bits value;

Sigh.  Nope.  Did you read the complete reply?

Problem is this is not reliable.  With host-phys-bits=off (default) qemu
allows to set phys-bits to whatever value you want, including values
larger than what the host actually supports.  Which renders
CPUID.80000008.EAX unusable.  To make things even worse:  The default
value (phys-bits=40) is larger than what many intel boxes support.

host-phys-bits=on fixes that.  It makes guest-phys-bits == host-phys-bits
by default, and also enforces guest-phys-bits <= host-phys-bits.
So with host-phys-bits=on the guest can actually use CPUID.80000008.EAX
to figure how big the guest physical address space is.

Problem is the guest doesn't know whenever host-phys-bits is enabled or
not ...

So the options to fix that are:

  (1) Make the host-phys-bits option visible to the guest (as suggested
      above), or
  (2) Advertise a _reliable_ phys-bits value to the guest somehow.

take care,
  Gerd


