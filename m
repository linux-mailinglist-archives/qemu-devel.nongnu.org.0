Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D063A733A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 03:08:35 +0200 (CEST)
Received: from localhost ([::1]:37710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsxZC-0000do-DA
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 21:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jose.ziviani@suse.com>)
 id 1lsuvs-00032m-R6
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:19:49 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:57641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jose.ziviani@suse.com>)
 id 1lsuvg-00022d-JE
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1623709172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RCgxOkMzy6U5wF9E7maXrIAsRGMl5ZNv1/QXGoWrrmg=;
 b=lXEgieDE+lOKiWmUjlmyuHp7C2QsKZk3FwjbKheSvQWG8CCxaQjWze+57W53Kp4FsIe15b
 DqMp+KEYJBdXgZ0YWfXs1dplC4UhU9g0wCW7K384DbYpbjS7rbEDEr00j7RHfJHi9H8KPx
 xYepBAC5t6ehOfasPQuv40ZuGdWuET4=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-vuuqXBrPPHuzGwzb504e0g-1; Tue, 15 Jun 2021 00:19:29 +0200
X-MC-Unique: vuuqXBrPPHuzGwzb504e0g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XR/eWq9MV6jen6RVMFbWVlLAGsbFKx3np34p5QwXSjmms+I3aaZtJA+S/jmOIB9vDwKtVbEIW/sjogKjzt+F7m65LEbrly8zeXWzywAd1tBMKI+wYMfL3NDM0GRVJodY7abpZ6gaKiyVR/9DZcRjEq6zeBlZpbosuF2XlNApvozFAPUR7GaqvMxNgHF3bqFYj8hlmwtWJGbTA+UJLvnzHXRoLypi3lMqdGnAjHlX3jQVSdNmQUxict8OwiPKGwuikhkY+XYA5ZGTM4FGD77s98VAIjqKncewxr835OAsEP6Yz7zRizE2ebLRW8KSg9jXIzzVlS0o1bv0LqNJlMc/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCgxOkMzy6U5wF9E7maXrIAsRGMl5ZNv1/QXGoWrrmg=;
 b=UaggFxTILU6Us8deIYmu1ckyo1hy8kbkQSjv3RcE2seY5bm4sKS0qjBfdR6ksukGjIAm511yGt6/kDbsHD7VdgfjbFIp8JpDENWajFDe2Log2sTfWUZxf7LGBnc16GIr28j7hwbGT4AK2NugTW1mtWQJ5nFlUFCLcoFQcve5cjd6dhFueKV3jRrtH2p28SfaR9KzffCtdNX2RWFTppiU0xy4yfV/cpgpeHyNBhGDh91H4Fe2wtQ/lNRXUi/b4hDlvP2C1RLaFP/6zBfU5gRcDgLUl60BPA06L0jav8Gp2fanYa+oNbpzU1npV0NJSU3kHOHpmlPGw6kyCyLxUij1Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from AM8PR04MB7427.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::8)
 by AM0PR0402MB3923.eurprd04.prod.outlook.com (2603:10a6:208:e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 22:19:28 +0000
Received: from AM8PR04MB7427.eurprd04.prod.outlook.com
 ([fe80::c1ad:50a9:d174:e21f]) by AM8PR04MB7427.eurprd04.prod.outlook.com
 ([fe80::c1ad:50a9:d174:e21f%4]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 22:19:27 +0000
From: =?iso-8859-1?Q?Jos=E9_Ricardo_Ziviani?= <jose.ziviani@suse.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Christian Schoenebeck
 <qemu_oss@crudebyte.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>, Claudio Fontana <cfontana@suse.de>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
Thread-Topic: [PATCH 0/4] modules: add support for target-specific modules.
Thread-Index: AQHXXeGn89H1mgIER06yMUSx0ZLpCKsNDI0AgAAeaYCAAA27gIABNE8AgAAPAoCAAEyJgIAFUlMA
Date: Mon, 14 Jun 2021 22:19:27 +0000
Message-ID: <5953598.eXybCX72BP@pizza>
References: <20210610101553.943689-1-kraxel@redhat.com>
 <20210611082925.7wkppsrj7hywquns@sirius.home.kraxel.org>
 <20210611130321.rp4gnnja7z22p6zl@sirius.home.kraxel.org>
In-Reply-To: <20210611130321.rp4gnnja7z22p6zl@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
x-originating-ip: [2804:431:c7cb:4e79:8602:9cd2:43a4:4ef]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 849d29c7-0f07-49b3-f486-08d92f827977
x-ms-traffictypediagnostic: AM0PR0402MB3923:
x-microsoft-antispam-prvs: <AM0PR0402MB392369E72609C9A12EE46521F2319@AM0PR0402MB3923.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wGJbH2B3NCWvRm7Ge0o3uVQleB247huLt2beovluMX6rsvAVUC9bw6O/SZ/RiODSJ7iXHF5yPL0EX+LMsEhbuOVfxfHdWSxdHBgDMDRrHhTnH0ElLhJfmMtESnY8SuHbWQ41G1GPOeI29vgdacbHlZilIakIk9yYiBWYNd6or05Qx45LJTRRUdwhe4ujshFnD7NeiJxSCK2Rn7251oDj1FriyC9Xtj6xHgtTWomlfE6vENUDkRP/TMmpMUb9YxMYWct2Yoi0HCRIbs0DqpVLZ5L4yZDhmE7fyVGPZ99M+PhdHO3ACfymWiVO2C2LlL8x+hBafPmP4twUbsdy5kh+i9q6kRFfwdoGRllIg1IHG6Xtml8eidB+CbhALKkK8FZGIoypSQ2IRWGW4AmMifPe/tfEK/dQz/s2wh6xFWX5tpahSkvDy7SmRxLijnK/cBtOgni3VicHfyOSqkPTie+NnXb6rTEicWwaAvbXTPmAFL1sNanbo5pZwb3ChF6pkUZwJyhpw5picZOnk/9pkTxmdoZpCo381u49/5ISMeWn5tdjVXJXSxy0NzH8TGYLpdwWQzrIInIqQp4UQ7voGVOUu1NUfs8jhliHn890VUqJieTnDiBsb7tOzP1HYvuUZA5wnhI1G6ufKPMxbuekQEFFDSBCd+/aMsF4n3rXelWlMGaSFupnnl2gl8xlqD7s+jPC3556AzgEMPl7FQsVKayDcfKdpIlvmMNT8noIbnM97byVxyRDS18VtzGU3rBUD3+dVxO7xY1iKqck0aOCHN4p5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7427.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(396003)(376002)(136003)(346002)(39850400004)(366004)(316002)(6512007)(110136005)(9686003)(4326008)(122000001)(99936003)(38100700002)(8676002)(54906003)(2906002)(478600001)(186003)(66616009)(83380400001)(6506007)(966005)(5660300002)(33716001)(86362001)(91956017)(76116006)(71200400001)(6486002)(66476007)(64756008)(66556008)(8936002)(66446008)(66946007)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1h4WsutGtqFft7Acq9Xau/nQsomA4+4N9l8/IzYJzZGOT3LeFup0Ddf0vG?=
 =?iso-8859-1?Q?dk/AL7ZTC/IRKfon1Za8cuhZSp4kTu9r/7nBKPw+ur2s5/znCHd43mCbFQ?=
 =?iso-8859-1?Q?IpxwWPgSjs6TCDfNwMKmFyJy86BgQkQmjObkHgaSDV6LUBzSVVAAw58Xi3?=
 =?iso-8859-1?Q?f9FwoSnCsfixgIGM1eo45BlgK/XAS8/NkeG6uE7paIiS15wap9vtA/fsJY?=
 =?iso-8859-1?Q?dgNyanCOlbcP9O8kZwidXwJMHuv6gMlm3ZlYkfFQL8/9bBxVvXfTo9ZssL?=
 =?iso-8859-1?Q?UBEPpxmxWZF9dhPiXfzylHJyqiRrwl1Zq0aJaZmiGrHwuoLhwOzf0gKfiR?=
 =?iso-8859-1?Q?fp8TEUUpWoRLwLu8pLaHizrQhYjbSX8q3DXx1mYcLREndM+Y1uBVfzoMRM?=
 =?iso-8859-1?Q?czLuIrEni8pyhzv7Rbb1PI8R75PM5vN47S9y+KYIf76/j3dfrJm9Y9u45+?=
 =?iso-8859-1?Q?GemKpkz6SvoKilQkfjPLTGLzvTEQ1M7lLEhsupxbj0jk6LCFEYgaNoI7Sz?=
 =?iso-8859-1?Q?2unkjjFjrm1GYo8op16Xe2+3Ed7jOa1sJ/KIJCRuEpHq+2UeYtkbK+YwAN?=
 =?iso-8859-1?Q?UUyPQUArzXY9/NpAkRrqjw8XSB4p7aPkttY6xJ+9q3soSjnV/Q8k/w964M?=
 =?iso-8859-1?Q?24p9UJKCQ0uWdMv3j3QczcACbC5yD5xzLpN5Zk01LDlTNOkUUOTUYYdUPd?=
 =?iso-8859-1?Q?4ymzJ6LK3cN5g3NxM/3cmatOrIystICiZMB+ZfLfxDZdZ35+1kVuusLZR7?=
 =?iso-8859-1?Q?tNvamj742PEkBD4abPCs/9/T97xl4iu1vjPhOZ785yfs+daP6X13hkC7La?=
 =?iso-8859-1?Q?Hui4RLlXF9WoEnG8M0RFwJWMFXBVrIHRd1N3PCRwP9KCsCdbpCgECEzmT2?=
 =?iso-8859-1?Q?7n5JNggec58F8wqQKDPp7Oe46RrZqX5t1pZOXeY2Qo3fe+NFCENXZso6gb?=
 =?iso-8859-1?Q?20D7c3dwcfq09/L7gEWNj/vCrjSlesMAg6ENfbV33kYvKWa5o3ACydFbPh?=
 =?iso-8859-1?Q?9lx+CRqrlRtU+/5dcMx4AZ+Qfh6A36jQNMtr1/01fdYYeT5BrW1AhU00eK?=
 =?iso-8859-1?Q?7yOStUXRFnydoJDjEkdAa/8x5cc5VthHQa6a9nC404E4AYk8h6Amw70PX4?=
 =?iso-8859-1?Q?SA7VuWkyiBxJ6fkDqmadhKc97om8fm5hqvTvKiHqFte7C+MjJB4YqJAK24?=
 =?iso-8859-1?Q?hGSaWtixnNdTwLXurEY38j3QKVRFTVvSKJxisVpcnAMkqy1mykI0ELjl2X?=
 =?iso-8859-1?Q?MgePmd8ENvU5LkeZYmckfRoS1yah0eR/o4sWm4+SnWgo4liBdjAY9fZBJx?=
 =?iso-8859-1?Q?qU3PwRd5i+9/kw9xkBHQsmtCt7YC9m4Vp66xU436CvxtueQaRd5/zcjkSJ?=
 =?iso-8859-1?Q?q6FBbyMFjdN1Zy+HNBbkJGbhh1BHc7U2bylxSbsyupdkc6UCkpt8AaVUUm?=
 =?iso-8859-1?Q?Mib8YLAwiB+FexKy?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/signed; boundary="nextPart10688243.M9R1QaG9rU";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7427.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849d29c7-0f07-49b3-f486-08d92f827977
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2021 22:19:27.8728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uqcUPNFhPQtLBke33K2l1eNTxXOLnpF/wleyMR01TYi7Pr1KKQs9gTjD9JmzVzsltzctLZh75sxE/GHj8GpBtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3923
Received-SPF: pass client-ip=194.104.109.102;
 envelope-from=jose.ziviani@suse.com; helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_BAD_THREAD_QP_64=0.998, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 14 Jun 2021 21:07:07 -0400
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

--nextPart10688243.M9R1QaG9rU
Content-Type: multipart/mixed; boundary="nextPart2698664.SJiOLoNGaQ"; protected-headers="v1"
Content-Transfer-Encoding: base64
From: Jose Ricardo Ziviani <jose.ziviani@suse.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, Claudio Fontana <cfontana@suse.de>, Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
Date: Mon, 14 Jun 2021 19:19:18 -0300
Message-ID: <5953598.eXybCX72BP@pizza>
Organization: SUSE
In-Reply-To: <20210611130321.rp4gnnja7z22p6zl@sirius.home.kraxel.org>
References: <20210610101553.943689-1-kraxel@redhat.com> <20210611082925.7wkppsrj7hywquns@sirius.home.kraxel.org> <20210611130321.rp4gnnja7z22p6zl@sirius.home.kraxel.org>

This is a multi-part message in MIME format.

--nextPart2698664.SJiOLoNGaQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hello Gerd,

On sexta-feira, 11 de junho de 2021 10:03:21 -03 Gerd Hoffmann wrote:
>   Hi,
>=20
> > Are there any pending patches to handle the remaining tcg dependencies
> > in qemu?  When trying to build tcg modular (more than only
> > tcg-accel-ops*) I get lots of unresolved symbols to tcg bits which are
> > referenced directly (in cpu.c, gdbstub.c, monitor, ...).
> >=20
> > The CONFIG_TCG=3Dn case is handled either with stubs or with #ifdef
> > CONFIG_TCG, which doesn't fly for modular tcg ...
>=20
> So, enough for today, to be continued next week.
> Work branch pushed to
>     https://git.kraxel.org/cgit/qemu/log/?h=3Dsirius/modinfo-playground
>=20
> Topmost patch doesn't compile but shows the build changes.

I cloned your 'sirius/modinfo-playground-good' and started playing with the=
=20
command line options to build these modules. I would like to suggest to cha=
nge=20
the current "--enable-X" with "--X=3D[enabled,disabled,module]", that seems=
 to=20
make more sense for these modules. For instance:

$ ../configure --target-list=3Dx86_64-softmmu --tcg=3Dmodule
=2E..
Targets and accelerators
              ...
              TCG support: YES
              TCG backend: module (x86_64)
        TCG debug enabled: NO
              target list: x86_64-softmmu
              ...

$ ../configure --target-list=3Dx86_64-softmmu --tcg=3Ddisabled
=2E..
Targets and accelerators
              ...
              TCG support: NO
              target list: x86_64-softmmu
              ...

$ ../configure --target-list=3Dx86_64-softmmu --tcg=3Denabled # (default)
=2E..
Targets and accelerators
              ...
              TCG support: YES
              TCG backend: native (x86_64)
        TCG debug enabled: NO
              target list: x86_64-softmmu
              ...

I attached a small patch here, just to illustrate what I'm saying. If you l=
ike=20
the suggestion I can start implementing it for those modules you're current=
ly=20
working on. What do you think?

Thank you,

Jos=E9 R. Ziviani

>=20
> take care,
>   Gerd


--nextPart2698664.SJiOLoNGaQ
Content-Disposition: attachment; filename="0001-Add-tcg-option-to-the-build-system.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="0001-Add-tcg-option-to-the-build-system.patch"

From 8e4cc80aae337ab8064f3ab55d3e5916186a0b19 Mon Sep 17 00:00:00 2001
From: "Jose R. Ziviani" <jziviani@suse.de>
Date: Mon, 14 Jun 2021 18:56:49 -0300
Subject: [PATCH] Add --tcg option to the build system

---
 configure            |  8 ++++++--
 meson.build          | 36 +++++++++++++++++++++++-------------
 meson_options.txt    |  3 ++-
 scripts/minikconf.py | 22 ++++++++++++++--------
 tests/meson.build    |  2 +-
 5 files changed, 46 insertions(+), 25 deletions(-)

diff --git a/configure b/configure
index 8dcb9965b2..95ed0c25c1 100755
--- a/configure
+++ b/configure
@@ -1105,7 +1105,7 @@ for opt do
   ;;
   --disable-tcg) tcg="disabled"
   ;;
-  --enable-tcg) tcg="enabled"
+  --tcg=*) tcg="$optarg"
   ;;
   --disable-malloc-trim) malloc_trim="disabled"
   ;;
@@ -1792,6 +1792,7 @@ Advanced options (experts only):
                            Default:trace-<pid>
   --disable-slirp          disable SLIRP userspace network connectivity
   --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter, experimental and slow)
+  --tcg=OPTION             configure TCG accelerator [enabled|disabled|module]
   --enable-malloc-trim     enable libc malloc_trim() for memory optimization
   --oss-lib                path to OSS library
   --cpu=CPU                Build for host CPU [$cpu]
@@ -2288,7 +2289,10 @@ if test "$solaris" = "yes" ; then
   fi
 fi
 
-if test "$tcg" = "enabled"; then
+if test "$tcg" = "disabled"; then
+    debug_tcg="no"
+    tcg_interpreter="false"
+else
     git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
     git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
 fi
diff --git a/meson.build b/meson.build
index 46ebc07dbb..c372f6363e 100644
--- a/meson.build
+++ b/meson.build
@@ -195,7 +195,7 @@ elif targetos == 'haiku'
             cc.find_library('network'),
             cc.find_library('bsd')]
 elif targetos == 'openbsd'
-  if not get_option('tcg').disabled() and target_dirs.length() > 0
+  if get_option('tcg') != 'disabled' and target_dirs.length() > 0
     # Disable OpenBSD W^X if available
     emulator_link_args = cc.get_supported_link_arguments('-Wl,-z,wxneeded')
   endif
@@ -241,7 +241,7 @@ if targetos == 'netbsd'
 endif
 
 tcg_arch = config_host['ARCH']
-if not get_option('tcg').disabled()
+if get_option('tcg') != 'disabled'
   if cpu not in supported_cpus
     if get_option('tcg_interpreter')
       warning('Unsupported CPU @0@, will use TCG with TCI (experimental and slow)'.format(cpu))
@@ -273,7 +273,11 @@ if not get_option('tcg').disabled()
                         language: ['c', 'cpp', 'objc'])
 
   accelerators += 'CONFIG_TCG'
-  config_host += { 'CONFIG_TCG': 'y' }
+  if get_option('tcg') == 'module'
+    config_host += { 'CONFIG_TCG': 'm' }
+  else
+    config_host += { 'CONFIG_TCG': 'y' }
+  endif
 endif
 
 if 'CONFIG_KVM' not in accelerators and get_option('kvm').enabled()
@@ -1306,19 +1310,20 @@ foreach target : target_dirs
   accel_kconfig = []
   foreach sym: accelerators
     if sym == 'CONFIG_TCG' or target in accelerator_targets.get(sym, [])
-      config_target += { sym: 'y' }
-      config_all += { sym: 'y' }
+      if sym == 'CONFIG_TCG' and get_option('tcg') == 'module'
+        config_target += { sym: 'm' }
+        config_all += { sym: 'm' }
+        accel_kconfig += [ sym + '=m' ]
+      else
+        config_target += { sym: 'y' }
+        config_all += { sym: 'y' }
+        accel_kconfig += [ sym + '=y' ]
+      endif
       if sym == 'CONFIG_TCG' and tcg_arch == 'tci'
         config_target += { 'CONFIG_TCG_INTERPRETER': 'y' }
       elif sym == 'CONFIG_XEN' and have_xen_pci_passthrough
         config_target += { 'CONFIG_XEN_PCI_PASSTHROUGH': 'y' }
       endif
-      if target in modular_tcg
-        config_target += { 'CONFIG_TCG_MODULAR': 'y' }
-      else
-        config_target += { 'CONFIG_TCG_BUILTIN': 'y' }
-      endif
-      accel_kconfig += [ sym + '=y' ]
     endif
   endforeach
   if accel_kconfig.length() == 0
@@ -2039,8 +2044,11 @@ subdir('tests/qtest/fuzz')
 
 # accel modules
 tcg_real_module_ss = ss.source_set()
-tcg_real_module_ss.add_all(when: 'CONFIG_TCG_MODULAR', if_true: tcg_module_ss)
-specific_ss.add_all(when: 'CONFIG_TCG_BUILTIN', if_true: tcg_module_ss)
+if get_option('tcg') == 'module'
+  tcg_real_module_ss.add_all(when: 'CONFIG_TCG_MODULAR', if_true: tcg_module_ss)
+else
+  specific_ss.add_all(when: 'CONFIG_TCG_BUILTIN', if_true: tcg_module_ss)
+endif
 target_modules += { 'accel' : { 'qtest': qtest_module_ss,
                                 'tcg': tcg_real_module_ss }}
 
@@ -2689,6 +2697,8 @@ summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
 if config_all.has_key('CONFIG_TCG')
   if get_option('tcg_interpreter')
     summary_info += {'TCG backend':   'TCI (TCG with bytecode interpreter, experimental and slow)'}
+  elif get_option('tcg') == 'module'
+    summary_info += {'TCG backend':   'module (@0@)'.format(cpu)}
   else
     summary_info += {'TCG backend':   'native (@0@)'.format(cpu)}
   endif
diff --git a/meson_options.txt b/meson_options.txt
index 3d304cac96..332dacd8ec 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -39,7 +39,8 @@ option('xen', type: 'feature', value: 'auto',
        description: 'Xen backend support')
 option('xen_pci_passthrough', type: 'feature', value: 'auto',
        description: 'Xen PCI passthrough support')
-option('tcg', type: 'feature', value: 'auto',
+option('tcg', type: 'combo', value: 'enabled',
+       choices: ['enabled', 'disabled', 'module'],
        description: 'TCG support')
 option('tcg_interpreter', type: 'boolean', value: false,
        description: 'TCG with bytecode interpreter (experimental and slow)')
diff --git a/scripts/minikconf.py b/scripts/minikconf.py
index bcd91015d3..2db0c3661f 100644
--- a/scripts/minikconf.py
+++ b/scripts/minikconf.py
@@ -323,6 +323,7 @@ def do_imply(self, var, symbol, cond=None):
 TOK_IF = 16;      TOKENS[TOK_IF] = '"if"';
 TOK_ID = 17;      TOKENS[TOK_ID] = 'identifier';
 TOK_EOF = 18;     TOKENS[TOK_EOF] = 'end of file';
+TOK_M = 19;       TOKENS[TOK_M] = '"m"';
 
 class KconfigParserError(Exception):
     def __init__(self, parser, msg, tok=None):
@@ -415,15 +416,18 @@ def do_include(self, include):
 
     # recursive descent parser -----
 
-    # y_or_n: Y | N
-    def parse_y_or_n(self):
+    # y_or_n_or_m: Y | N | M
+    def parse_y_or_n_or_m(self):
         if self.tok == TOK_Y:
             self.get_token()
             return True
         if self.tok == TOK_N:
             self.get_token()
             return False
-        raise KconfigParserError(self, 'Expected "y" or "n"')
+        if self.tok == TOK_M:
+            self.get_token()
+            return True
+        raise KconfigParserError(self, 'Expected "y", "n", or "m"')
 
     # var: ID
     def parse_var(self):
@@ -446,13 +450,13 @@ def parse_assignment_var(self):
         else:
             raise KconfigParserError(self, 'Expected identifier')
 
-    # assignment: var EQUAL y_or_n
+    # assignment: var EQUAL y_or_n_or_m
     def parse_assignment(self):
         var = self.parse_assignment_var()
         if self.tok != TOK_EQUAL:
             raise KconfigParserError(self, 'Expected "="')
         self.get_token()
-        self.data.do_assignment(var, self.parse_y_or_n())
+        self.data.do_assignment(var, self.parse_y_or_n_or_m())
 
     # primary: NOT primary
     #       | LPAREN expr RPAREN
@@ -505,7 +509,7 @@ def parse_condition(self):
     def parse_property(self, var):
         if self.tok == TOK_DEFAULT:
             self.get_token()
-            val = self.parse_y_or_n()
+            val = self.parse_y_or_n_or_m()
             cond = self.parse_condition()
             self.data.do_default(var, val, cond)
         elif self.tok == TOK_DEPENDS:
@@ -635,6 +639,8 @@ def scan_token(self):
             return TOK_Y
         elif self.tok == 'n' and self.check_keyword(""):
             return TOK_N
+        elif self.tok == 'm' and self.check_keyword(""):
+            return TOK_M
         elif (self.tok == 's' and self.check_keyword("ource")) or \
               self.tok == 'i' and self.check_keyword("nclude"):
             # source FILENAME
@@ -690,10 +696,10 @@ def scan_token(self):
     parser = KconfigParser(data)
     external_vars = set()
     for arg in argv[3:]:
-        m = re.match(r'^(CONFIG_[A-Z0-9_]+)=([yn]?)$', arg)
+        m = re.match(r'^(CONFIG_[A-Z0-9_]+)=([ynm]?)$', arg)
         if m is not None:
             name, value = m.groups()
-            parser.do_assignment(name, value == 'y')
+            parser.do_assignment(name, value == 'y' or value == 'm')
             external_vars.add(name[7:])
         else:
             fp = open(arg, 'rt', encoding='utf-8')
diff --git a/tests/meson.build b/tests/meson.build
index 55a7b08275..d3800989ee 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -80,7 +80,7 @@ if 'CONFIG_TCG' in config_all
   subdir('fp')
 endif
 
-if not get_option('tcg').disabled()
+if get_option('tcg') != 'disabled'
   if 'CONFIG_PLUGIN' in config_host
     subdir('plugin')
   endif
-- 
2.32.0


--nextPart2698664.SJiOLoNGaQ--

--nextPart10688243.M9R1QaG9rU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUFCQ0FBZEZpRUVWUUIrRHdMR1Z5
djgxNXNCYUo0d2RDS0tGNVlGQW1ESDFlWUFDZ2tRYUo0d2RDS0sKRjVibjRnLytOejNsNEZiYlJh
L3Rxcnh6MGMwdGp0dnRjTkZpdWZINGkrelc2SUtPVjRSaDQ4RmdGalNJNnVaQgpTY0FCV0Z3a1Bq
RTFoM1BxZGYrN2RxdEFvVFNDY3Q0cXdsRUZjWUk2ZktJNlFidzZtclJCS0lsTmxZUGpxb3NQCmM3
RjNxaWdOcml1VW1jM3J4U0RRZ2NmVkRPYVdJVDdpcVVRS1JDaTJuM0dtZXd3N2JxMklpRlhTTS9l
Z3N4ZngKeFljb1VobGxkWm9abnZBQlVlN3hqeEM3RStyRWF6dC9QMmtiVm5sSW5NK0ZYZ3JrV3hv
MXlpQ0xIOHovRXAxUQplVnFuSUp6YnVORHY4UWJTY0RHbUt0V1pkZmV0QWc0THpJRWg1czBVSmM1
dStJbEdwYjlBM2JuYzd5aDROY1RDCmxBanlFTGFhWHJBYjhSM1lqQ0ZHbWFBbkpuNUw4cmc2NFYy
YmJFMDJsQ2VxMFBleWh0WFIvTmtQRWkwb3pNRkYKS2x3Skl1UTF3ajJXVzJQcHBHV2FMbTZiQnZR
YWxXRnFYTjY0RmJSNVBYNytxWDlMeC9NaVB0c3dzUzNLak9xNApKeDV2MGV0M3V1M0RaTmdQOSs1
d0FIS2Y0Ni9GZTdyTXFPbnc2SHoyekE0OTh0VnF1V3J4QTN5YXZDbEsxbnVrCnorRkZncCtSMFQw
YzZYWS9xM1JoR2lOMjZRNW9VeHZ4cGdRYzBHMGxKTWxuUXl6aDlWR3hheDVmK1ppemR4dWEKWG92
NW55aUswWGtBVVh0N3BjaFpnTklVb1BuTFRMWUZyZy9GbzJYeFZEUEpXTERlQjh2elRxZFBMQTJI
czdobQpTNXVxMG5rck1IMlJlVkVqQ1RNNnBpNlM2d2Yza1FGcFNZakQxNy9rbkVrYXVJdzdQUTg9
Cj1UT0ZKCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--nextPart10688243.M9R1QaG9rU--


