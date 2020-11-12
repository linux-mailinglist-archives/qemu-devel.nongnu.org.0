Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 539E52B0AE4
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 18:01:33 +0100 (CET)
Received: from localhost ([::1]:36140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdFyV-0002jo-T1
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 12:01:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kdFwN-0001uD-Ky
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 11:59:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kdFwJ-0004kN-TH
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 11:59:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605200352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J+wdFWqJjfPzXxHr/zADcSXQU8aV029RaKND5smBvlI=;
 b=gtG/T/C8inj+KA+Yo/VcHuryLTm5xtTlHkV2u/YUaLt7ycTLzzgMhKnYOT7Tkx9ojg6c4u
 a2e5Ld3MG3vgk6232EFk1Hzf9tz87FB4/nVLQz1uiu242dXGg0GhzSYw79QaSnoIwbgatq
 hNGIJ+1ED3vwnNGe7ht1dmeh9n/CdSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-7Zfbh6n9PNG0gkwjto_pOQ-1; Thu, 12 Nov 2020 11:59:10 -0500
X-MC-Unique: 7Zfbh6n9PNG0gkwjto_pOQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 350001016CE2;
 Thu, 12 Nov 2020 16:59:09 +0000 (UTC)
Received: from w520.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FB3128559;
 Thu, 12 Nov 2020 16:59:08 +0000 (UTC)
Date: Thu, 12 Nov 2020 09:59:08 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 1/1] Fix use after free in vfio_migration_probe
Message-ID: <20201112095908.77d711e7@w520.home>
In-Reply-To: <CAFEAcA8orN-NPghL+LW1jmQ0bjjQbGYctCc2_1S1q+Mcy=rEtA@mail.gmail.com>
References: <1604685744-25125-1-git-send-email-kwankhede@nvidia.com>
 <CAFEAcA8orN-NPghL+LW1jmQ0bjjQbGYctCc2_1S1q+Mcy=rEtA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mcrossley@nvidia.com, Kirti Wankhede <kwankhede@nvidia.com>,
 Neo Jia <cjia@nvidia.com>, QEMU Developers <qemu-devel@nongnu.org>,
 dnigam@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Nov 2020 15:57:46 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Fri, 6 Nov 2020 at 18:35, Kirti Wankhede <kwankhede@nvidia.com> wrote:
> >
> > Fixes Coverity issue:
> > CID 1436126:  Memory - illegal accesses  (USE_AFTER_FREE)
> >
> > Fixes: a9e271ec9b36 ("vfio: Add migration region initialization and fin=
alize
> > function")
> >
> > Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> > Reviewed-by: David Edmondson <dme@dme.org>
> > Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > --- =20
>=20
> Hi Alex -- this is a fix for a Coverity issue, are you planning
> a pullreq with it in? It would be nice to have it in rc2 next week.

Hi Peter,

Yes, I was planning to send a pull request.  It's a trivial and obvious
fix, so if by chance you'd like to grab it separately, you're also more
than welcome.

Acked-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Alex Williamson <alex.williamson@redhat.com>

Thanks,
Alex


