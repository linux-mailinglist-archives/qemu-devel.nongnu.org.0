Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692EF25AC97
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 16:09:41 +0200 (CEST)
Received: from localhost ([::1]:45970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDTSG-0001in-H9
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 10:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kDTRV-0001J7-Nz
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 10:08:53 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:51879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kDTRT-0007PM-MT
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 10:08:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Lf5+rmnNl66+zGxGDZ9WPhqrELDK3F+HXlQ1n1+ROc0=; b=GelGX89yW/ttSGPkGQlphSgZ8d
 moRhRnH0nuF+vTxJQA1Dh+T1a8LwSg6N9lzcIHRhG2rBK+bdWptnWtXuNu+Vs0jDeue56nkFaFGpa
 vgMCGkZxgKCybGkfK03+EmWURDvF3QbbYLSI4CgHXMV7sY5YcnKaenWx9bk0ouzC/kEa9C2KTEPuN
 02MOxaz/PBl1RzI7zAtcngtEZT8nsRy9TjJn1Eh4ckhajIz7Xep+CF0Eh1+LTscAe21HWtosraTrv
 IFAjIl/8Q4kYHyUGmJimgXH0Un/At49MhI9lnLWorvSapYOlF0T/mo6BHhlSCgZuNNjwSa/j3JK5L
 uOdTWeUg==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] 9pfs: log warning if msize <= 8192
Date: Wed, 02 Sep 2020 16:08:48 +0200
Message-ID: <2812056.Ea3xXQFrjv@silver>
In-Reply-To: <20200902134503.GJ403297@redhat.com>
References: <E1kDR8W-0001s4-Sr@lizzy.crudebyte.com>
 <20200902153934.5a2d7f86@bahia.lan> <20200902134503.GJ403297@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 07:41:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 2. September 2020 15:45:03 CEST Daniel P. Berrang=E9 wrote:
> To be clear, I'm not objecting to warning - just that the proposed warning
> doesn't give any useful information about what is considered to be a
> sensible alternative size, and nor does the commit message.
>=20
> Just like to see the commit message provide the background info above,
> and ideally have the warning message at least give the user a suggestion
> that is in the sensible order of magnitude they should be looking at.
>=20
> eg tell them to aim for 1 MB (or whatever value) as a starting point to
> tuning.

Yeah, I know, but the problem is I don't see how I would squeeze the releva=
nt=20
information into only one log message; and even "what's a good starting poi=
nt"=20
is already questionable.

=46or that reason my plan was:

	- logging this warning

	- describing the 'msize' issue in detail on the QEMU wiki (what's the=20
	  point, how would you benchmark it)

So my idea was: user sees the message, "what is 'msize?'" -> Google "msize=
=20
qemu" -> click 'QEMU wiki' -> read all the details.

But how about this: I put a QEMU wiki link directly into the log message?

P.S. I don't have a QEMU wiki account yet BTW, so if somebody could hook me=
=20
up, very much appreciated!

Best regards,
Christian Schoenebeck



