Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA7B529C48
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 10:23:49 +0200 (CEST)
Received: from localhost ([::1]:34724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqsUe-0007tT-Ao
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 04:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nqsP1-0004NW-V9
 for qemu-devel@nongnu.org; Tue, 17 May 2022 04:17:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nqsP0-000062-Aj
 for qemu-devel@nongnu.org; Tue, 17 May 2022 04:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652775477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L6sxQXtoGKGMPI28Tr8nAW3mzwjYDS+tyfCIYM50FcA=;
 b=YSBXCoc9YryPV+UcgrEwdN0bzdibQ2KqMCg85AcwKBFNRO0UCtBojyvlT8MLrBDkAetxwA
 re/hSAoAeDSVyJXDks43YJNpbc6CTdL65OViIoA8Nm4koEUaJjxfwx+Que9EBw0wx5tBxX
 AqSqnRDH91CezDQCuBg8QXgZJpvp2rY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-qAUmgdRAOCyNzIgK3UqujA-1; Tue, 17 May 2022 04:17:54 -0400
X-MC-Unique: qAUmgdRAOCyNzIgK3UqujA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9222185A794;
 Tue, 17 May 2022 08:17:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B780240CF8F0;
 Tue, 17 May 2022 08:17:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1ABC118003A2; Tue, 17 May 2022 10:17:52 +0200 (CEST)
Date: Tue, 17 May 2022 10:17:52 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, ani@anisinha.ca, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com
Subject: Re: [PATCH 00/35] pc/q35: refactor ISA and SMBUS AML generation
Message-ID: <20220517081752.rojqzrsgd2j2lnzz@sirius.home.kraxel.org>
References: <20220516152610.1963435-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516152610.1963435-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 16, 2022 at 11:25:35AM -0400, Igor Mammedov wrote:
> 
> Series is excerpt form larger refactoring that does
> the same for PCI devices, but it's too large at this
> point, so I've split off a relatively self-contained
> ISA/SMBUS patches into a smaller separate series, and
> PCI refactoring will follow up on top of this series
> using the same AcpiDevAmlIf interface.
> 
> Series consolidates and unifies how pc/q35 machine
> generates AML for ISA and SMBUS devices. It adds
> a new more generic interface 'AcpiDevAmlIf' that
> replaces ISA specific ISADeviceClass::build_aml
> hook and should allow to use the same approach
> (i.e. ask a device to provide its own AML) but
> not limited to ISA bus.
> Series applies AcpiDevAmlIf interface to a few
> ISA devices that were already using
> ISADeviceClass::build_aml and to devices /tpm,
> applesmc,pvpanic,ipmi/ that were generated in
> custom way. The AML generation for the later
> class is normalized to behave like any other
> ISA device that were using ISADeviceClass::build_aml
> and converted to interface 'AcpiDevAmlIf'.
> It simplifies process of building DSDT and
> eliminates custom probing/wiring for those devices
> as AML for them is generated at the time ISA/SMBUS
> is enumerated.
> 
> Changes to DSDT tables QEMU generates are mostly
> contextual where devices scattered across DSDT
> are consolidated under respective device that
> hosts bus they are attached to.

Promoting the ISADeviceClass::build_aml idea to a more general approach
certainly makes sense.  ISA update is fine.  Skimmed the other updates
too, looks all sane to me.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


