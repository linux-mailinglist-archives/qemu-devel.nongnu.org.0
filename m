Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF591EFC4D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 17:15:40 +0200 (CEST)
Received: from localhost ([::1]:59376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhE4J-0003Jp-Tm
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 11:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jhE2y-0002ed-82
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 11:14:16 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59409
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jhE2x-0003yt-IH
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 11:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591370055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rBUE4Rc2xW2YkHT89DQqH41ZWIR50L2snAOH6z/pCfg=;
 b=Nsxw35t3yMrqAe4zqk16uQulijs23pNX3XJoxQr0yFIMndSvSYgL9MSXx3/RT2FEnYO4Ph
 Ti9yr1kZ1xypLAHkaT1OQsfAmY2YBwUp9nuBHAiqJoX6VcmlELNnUizS/bgaz99/S2BXmz
 TwejRErOyg4vqonp2mcwjcWbQvRpWyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-L0GqOtD4OhyaN4jqZR3cYw-1; Fri, 05 Jun 2020 11:14:11 -0400
X-MC-Unique: L0GqOtD4OhyaN4jqZR3cYw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92CD719057AB;
 Fri,  5 Jun 2020 15:14:09 +0000 (UTC)
Received: from gondolin (ovpn-113-2.ams2.redhat.com [10.36.113.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 648A75DA77;
 Fri,  5 Jun 2020 15:13:59 +0000 (UTC)
Date: Fri, 5 Jun 2020 17:13:56 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 0/7] exec/cpu: Cleanups around "exec/hwaddr.h"
 (reserved to system-mode)
Message-ID: <20200605171356.68475d8d.cohuck@redhat.com>
In-Reply-To: <2c5a04c3-0c3b-5acb-d03a-a4649c9222a2@redhat.com>
References: <20200526172427.17460-1-f4bug@amsat.org>
 <525ebf16-1265-e403-54b6-e1168d84e4f4@redhat.com>
 <20200605161801.4bba0d0e.cohuck@redhat.com>
 <2c5a04c3-0c3b-5acb-d03a-a4649c9222a2@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:40:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Jun 2020 17:00:32 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 05/06/20 16:18, Cornelia Huck wrote:
> > On Thu, 4 Jun 2020 20:11:38 +0200
> > Paolo Bonzini <pbonzini@redhat.com> wrote:
> >  =20
> >> On 26/05/20 19:24, Philippe Mathieu-Daud=C3=A9 wrote: =20
> >>> The 'hwaddr' type declared in "exec/hwaddr.h" is meant for
> >>> system-mode emulation only.
> >>> This series is a preparatory cleanup to allow later poisoning
> >>> it in user-mode code.
> >>>
> >>> Missing review: patche 7
> >>> - target/s390x: Restrict system-mode declarations
> >>>
> >>> Maybe PPC/S390X maintainers can take their patches and let
> >>> the rest to Paolo, or he can take all the series. They are
> >>> not dependents.
> >>>
> >>> Since v1:
> >>> - Do not poison hwaddr type
> >>> - Addressed Cornelia & David review comments
> >>> - Added R-b/A-b
> >>>
> >>> $ git backport-diff -u v1
> >>> Key:
> >>> [----] : patches are identical
> >>> [####] : number of functional differences between upstream/downstream=
 patch
> >>> [down] : patch is downstream-only
> >>> The flags [FC] indicate (F)unctional and (C)ontextual differences, re=
spectively
> >>>
> >>> 001/7:[----] [--] 'sysemu/accel: Restrict machine methods to system-m=
ode'
> >>> 002/7:[----] [--] 'sysemu/tcg: Only declare tcg_allowed when TCG is a=
vailable'
> >>> 003/7:[----] [--] 'sysemu/hvf: Only declare hvf_allowed when HVF is a=
vailable'
> >>> 004/7:[----] [--] 'target/ppc: Restrict PPCVirtualHypervisorClass to =
system-mode'
> >>> 005/7:[----] [--] 'target/s390x: Only compile decode_basedisp() on sy=
stem-mode'
> >>> 006/7:[0002] [FC] 'target/s390x/helper: Clean ifdef'ry'
> >>> 007/7:[0005] [FC] 'target/s390x: Restrict system-mode declarations'
> >>>
> >>> Supersedes: <20200509130910.26335-1-f4bug@amsat.org>
> >>>
> >>> Philippe Mathieu-Daud=C3=A9 (7):
> >>>   sysemu/accel: Restrict machine methods to system-mode
> >>>   sysemu/tcg: Only declare tcg_allowed when TCG is available
> >>>   sysemu/hvf: Only declare hvf_allowed when HVF is available
> >>>   target/ppc: Restrict PPCVirtualHypervisorClass to system-mode
> >>>   target/s390x: Only compile decode_basedisp() on system-mode
> >>>   target/s390x/helper: Clean ifdef'ry
> >>>   target/s390x: Restrict system-mode declarations
> >>>
> >>>  include/sysemu/accel.h          |  2 ++
> >>>  include/sysemu/hvf.h            |  6 +++---
> >>>  include/sysemu/tcg.h            |  2 +-
> >>>  target/ppc/cpu.h                |  4 ++--
> >>>  target/ppc/kvm_ppc.h            | 22 +++++++++++-----------
> >>>  target/s390x/internal.h         | 16 +++++++++++-----
> >>>  target/ppc/translate_init.inc.c |  4 ++++
> >>>  target/s390x/helper.c           |  5 -----
> >>>  8 files changed, 34 insertions(+), 27 deletions(-)
> >>>    =20
> >>
> >> Queued all, thanks. =20
> >=20
> > So, I guess I should unqueue patch 5-7 from s390-next again? =20
>=20
> I can unqueue them too, no problem.

Would probably be easiest, then I can send a pull req in a few minutes.


