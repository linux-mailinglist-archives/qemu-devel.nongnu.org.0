Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBE14B87D0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 13:36:54 +0100 (CET)
Received: from localhost ([::1]:38772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKJYD-0006FN-9j
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 07:36:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nKJUC-000479-HL
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 07:32:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nKJU9-0008SZ-Lf
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 07:32:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645014760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9HRFsEkKQj2Q60eEVsVfv9HiYxBdd5zO+uv7qAlp8BI=;
 b=DXs9+ImMD8FBN12jL/wBSaWr8G6EwSRPCJcxCpUorYJIoGZXR6tuX9fKBqJFI6Qs/KJLoW
 N7Q0lvZP2Mcwmb5THmSdflowfVEWorMb6LjM+vkm/U6KqrJtKOy2pqXb8G+VhLNqkj6z4L
 wpz43LeUniL2yD15U7Y2euuT87zb78w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-C5kNtewwO-y9z4be20mCIQ-1; Wed, 16 Feb 2022 07:32:39 -0500
X-MC-Unique: C5kNtewwO-y9z4be20mCIQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56F571006AA0;
 Wed, 16 Feb 2022 12:32:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B9A36FB02;
 Wed, 16 Feb 2022 12:32:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EC3F11800617; Wed, 16 Feb 2022 13:32:14 +0100 (CET)
Date: Wed, 16 Feb 2022 13:32:14 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where
 applicable
Message-ID: <20220216123214.vwmbkgdjlhvsje45@sirius.home.kraxel.org>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-3-joao.m.martins@oracle.com>
 <20220214155318.3ce80da0@redhat.com>
 <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
 <20220214163158.4c4b210b@redhat.com>
 <20220215095358.5qcrgwlasheu63uj@sirius.home.kraxel.org>
 <8a0bcebf-117e-fe41-a477-4769ca94472c@oracle.com>
 <20220216081917.sqc5jdikaoxjbciv@sirius.home.kraxel.org>
 <df167baf-c21f-75e2-ed4b-5b53ab4ac2aa@oracle.com>
MIME-Version: 1.0
In-Reply-To: <df167baf-c21f-75e2-ed4b-5b53ab4ac2aa@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> What I overlooked was the emphasis you had on desktops (qemu default bigger than
> host-advertised), where I am thinking mostly in servers.

Yep, on servers you have the reverse problem that phys-bits=40 might be
too small for very large guests.

> > To make things even worse:  The default
> > value (phys-bits=40) is larger than what many intel boxes support.
> > 
> > host-phys-bits=on fixes that.  It makes guest-phys-bits == host-phys-bits
> > by default, and also enforces guest-phys-bits <= host-phys-bits.
> > So with host-phys-bits=on the guest can actually use CPUID.80000008.EAX
> > to figure how big the guest physical address space is.
> > 
> Your 2 paragraphs sound like it's two different things, but +host-phys-bits
> just sets CPUID.80000008.EAX with the host CPUID equivalent leaf/register
> value. Which yes, it makes it reliable, but the way to convey is still the
> same. That is regardless, of phys-bits=bogus-bigger-than-host-number,
> host-phys-bits=on or host-phys-bits-limit=N.

Yep, it's CPUID.80000008.EAX in all cases.

> > Problem is the guest doesn't know whenever host-phys-bits is enabled or
> > not ...
> > 
> > So the options to fix that are:
> > 
> >   (1) Make the host-phys-bits option visible to the guest (as suggested
> >       above), or
> >   (2) Advertise a _reliable_ phys-bits value to the guest somehow.
> 
> What I am not enterily sure from (1) is the value on having a 'guest phys-bits'
> and a 'host phys-bits' *exposed to the guest* when it seems we are picking the wrong
> value for guests.

Well, the guest can read CPUID.80000008.EAX but as of today the guest
just doesn't know whenever it's bogus or not.

> It seems unnecessary redirection (compared to real hw) unless
> there's a use-case in keeping both that I am probably missing.

Well, the use case is backward compatibility.  If we want make better
use of the guest physical address space on newer qemu without breaking
compatibility with older qemu versions the firmware needs to do
something along the lines of:

    if (i-can-trust-phys-bits) {
        // new qemu
        read CPUID.80000008.EAX and go with that
    } else {
        // old qemu
        use current heuristic, placing stuff as low as possible.
    }

And for that to actually work new qemu needs to expose something to the
guest which can be used to evaluate the "i-can-trust-phys-bits"
expression.  A guest-readable bit somewhere which is 1 for
host-phys-bits=on and 0 otherwise would do the trick, but there are
surely other ways to solve the problem.

take care,
  Gerd


