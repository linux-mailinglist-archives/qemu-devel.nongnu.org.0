Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEA75EB356
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 23:41:58 +0200 (CEST)
Received: from localhost ([::1]:51814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocvrR-0002qe-Cs
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 17:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1ocvnX-0005Uh-5P
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:37:56 -0400
Received: from outgoing-exchange-3.mit.edu ([18.9.28.13]:50604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1ocvnU-0005aF-SU
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:37:54 -0400
Received: from w92exedge4.exchange.mit.edu (W92EXEDGE4.EXCHANGE.MIT.EDU
 [18.7.73.16])
 by outgoing-exchange-3.mit.edu (8.14.7/8.12.4) with ESMTP id 28QLbZAi009484;
 Mon, 26 Sep 2022 17:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1664228262; bh=jJ3bZE7VOGxMs4cBKxQMsEaMhT3UJ6KAuG48Ep0He6s=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=HkwY5PS4GzdTdnMEdiasIWDQ+Z/52g2hdnw/oW6I92JKAJw2frkd8W22RyeoE4mR/
 AbmDZoZmWDG9Nnj9Z91VFHwubqjzfUojAkD2p5/lNXEbhcxkcCM1UMgJOOSNj1ps/P
 gfw8GqnDbG13CdPdQxED4r2WOw1FllXuSGaC2cJeRflCmYzq+G5TX7Ph1ECH/0nREz
 fupWvpOg5f8F9KjFmNeR4o71zQ0ajeqgrElfvmGnNk8jpUtTn/bwKlWDV4KF2Z6bwb
 RYfITTp8kfZfBmIhCPQDTD5AbjXgyxH4wHPQJ+0CZyibyPubqg4IQV13Uw4OXV2hx3
 gGfbfsfZRFV0Q==
Received: from w92expo31.exchange.mit.edu (18.7.74.43) by
 w92exedge4.exchange.mit.edu (18.7.73.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.38; Mon, 26 Sep 2022 17:37:13 -0400
Received: from oc11expo31.exchange.mit.edu (18.9.4.104) by
 w92expo31.exchange.mit.edu (18.7.74.43) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 26 Sep 2022 17:37:36 -0400
Received: from oc11expo31.exchange.mit.edu ([18.9.4.104]) by
 oc11expo31.exchange.mit.edu ([18.9.4.104]) with mapi id 15.00.1497.023; Mon,
 26 Sep 2022 17:37:36 -0400
From: "Andrew S. Fasano" <fasano@mit.edu>
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "erdnaxe@crans.org"
 <erdnaxe@crans.org>, "ma.mandourr@gmail.com" <ma.mandourr@gmail.com>
Subject: Re: [RFC 2/4] tcg/plugins: Automatically define CURRENT_PLUGIN
Thread-Topic: [RFC 2/4] tcg/plugins: Automatically define CURRENT_PLUGIN
Thread-Index: AQHYvjCpAHlOBlyDK0aCcXL+3Wlo5q3qS6MAgAgYQoc=
Date: Mon, 26 Sep 2022 21:37:36 +0000
Message-ID: <1664228255927.51065@mit.edu>
References: <20220901182734.2987337-1-fasano@mit.edu>
 <20220901182734.2987337-3-fasano@mit.edu>,<87a66s7rmo.fsf@linaro.org>
In-Reply-To: <87a66s7rmo.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [129.55.200.20]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=18.9.28.13; envelope-from=fasano@mit.edu;
 helo=outgoing-exchange-3.mit.edu
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alex Benn=E9e <alex.bennee@linaro.org>=0A=
> Andrew Fasano <fasano@mit.edu> writes:=0A=
> =0A=
> > Use plugin filenames to set the preprocessor variable CURRENT_PLUGIN=0A=
> > as a string during plugin compilation.=0A=
> >=0A=
> > Signed-off-by: Andrew Fasano <fasano@mit.edu>=0A=
> > ---=0A=
> >  contrib/plugins/Makefile | 2 +-=0A=
> >  1 file changed, 1 insertion(+), 1 deletion(-)=0A=
> >=0A=
> > diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile=0A=
> > index df3499f4f2..b7720fea0f 100644=0A=
> > --- a/contrib/plugins/Makefile=0A=
> > +++ b/contrib/plugins/Makefile=0A=
> > @@ -34,7 +34,7 @@ CFLAGS +=3D -I$(SRC_PATH)/include/qemu=0A=
> >  all: $(SONAMES)=0A=
> > =0A=
> >  %.o: %.c=0A=
> > -     $(CC) $(CFLAGS) -c -o $@ $<=0A=
> > +     $(CC) $(CFLAGS) -DCURRENT_PLUGIN=3D\"$(basename $@)\" -c -o $@ $<=
=0A=
> =0A=
> While all plugins are currently single files this seems a little clumsy.=
=0A=
> =0A=
> We can already check exported plugin symbols in loader.c (see=0A=
> qemu_plugin_version) so maybe it would be better to declare an API=0A=
> update and mandate any plugin object also needs to define a=0A=
> qemu_plugin_name with a null terminated string?=0A=
=0A=
That design sounds good to me and would be good for multi-file plugins. Per=
haps=0A=
plugins could also (optionally?) specify their own API versioning here.=0A=
=0A=
> =0A=
> > =0A=
> >  lib%.so: %.o=0A=
> >        $(CC) -shared -Wl,-soname,$@ -o $@ $^ $(LDLIBS)=0A=
> =0A=
> =0A=
> --=0A=
> Alex Benn=E9e=0A=

