Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5571FCC69
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 13:32:59 +0200 (CEST)
Received: from localhost ([::1]:36460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlWJO-00030X-8t
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 07:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jlWIC-0002FB-BA
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 07:31:44 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42386
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jlWIA-0001H2-5K
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 07:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592393500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Y1lN38VxVQkYcV7EjqkfAvk9jTWiAWTBCGdx6z1MYk=;
 b=UXBzhxqaeeNaTM43RpNcL8Jy4a6NAxdVWITOPDAP6/oDDDrqGlHf/u+xKqJ1sc+gicCv6J
 s/ULBka67QdzDX9W1KEmfs7KsHwXHiPym1Wq67RCqMvRzT/UGf1GoPl713WblLsKzx5X5c
 MYKo2J6BVIBjozUMrIQCL31LCoovjZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-D_9DC3-QPauRfSSe52prPA-1; Wed, 17 Jun 2020 07:31:36 -0400
X-MC-Unique: D_9DC3-QPauRfSSe52prPA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB2615AECB;
 Wed, 17 Jun 2020 11:31:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF75A61981;
 Wed, 17 Jun 2020 11:31:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 95A1016E16; Wed, 17 Jun 2020 13:31:28 +0200 (CEST)
Date: Wed, 17 Jun 2020 13:31:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v9 02/10] acpi: move aml builder code for floppy device
Message-ID: <20200617113128.qs4l4rxewfelofbk@sirius.home.kraxel.org>
References: <20200617071138.11159-1-kraxel@redhat.com>
 <20200617071138.11159-3-kraxel@redhat.com>
 <62ad00f7-c7f2-ed80-01a3-8d8c6aa9fba9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <62ad00f7-c7f2-ed80-01a3-8d8c6aa9fba9@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 02:02:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 17, 2020 at 10:40:24AM +0200, Thomas Huth wrote:
> On 17/06/2020 09.11, Gerd Hoffmann wrote:
> > DSDT change: isa device order changes in case MI1 (ipmi) is present.
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  hw/block/fdc.c                  |  83 ++++++++++++++++++++++++++++++++
> >  hw/i386/acpi-build.c            |  83 --------------------------------
> >  stubs/cmos.c                    |   7 +++
> >  stubs/Makefile.objs             |   1 +
> >  tests/data/acpi/pc/DSDT.ipmikcs | Bin 5086 -> 5086 bytes
> >  5 files changed, 91 insertions(+), 83 deletions(-)
> >  create mode 100644 stubs/cmos.c
> 
> Hmm, not all targets that use CONFIG_FDC also have ACPI ... would it be
> possible to move the ACPI-related code into a new file, say fdc-acpi.c,
> instead and only compile that if both, CONFIG_FDC and CONFIG_ACPI are
> enabled?

Possible sure, but is that really worth it?  It isn't that much
(possibly dead) code, and we have stubs for the aml_*() functions so it
builds just fine with CONFIG_ACPI=n ...

cheers,
  Gerd


