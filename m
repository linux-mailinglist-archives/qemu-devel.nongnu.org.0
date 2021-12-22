Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CE647D903
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 22:54:35 +0100 (CET)
Received: from localhost ([::1]:53930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n09ZC-0002al-5s
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 16:54:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1n09Y8-0001QQ-HC
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 16:53:29 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:17124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1n09Y4-0001Pe-8K
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 16:53:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1640210004; x=1640814804;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XgrhekhDWMT/oPTOGOkVlOhiW/o8lT5U0htU0eifINk=;
 b=nNfd5mhQBQzfY7svruEBOX96OC+RqIo5cfEltSUNIC6az8s4r7rs61id
 qOTLnL8MC1ujkVrW5Fzr2Bmqhd8Q2Lf2jgykUoqPkd7G+j8QEstn8jVAO
 CkgUswiUBCthbZoLjHjDxwpQK0Ieg5zheTg4L9r/tBGK7vLNElzeteSbZ E=;
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 21:53:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZe1iyeZ8GCmP/z4jq+J5zgWkCqzDW/dGwK7FX2yFWMMT4wS9FNMsQclUwD77rHrEg+QI/1CNeGxZSjBFl4xyXa3XVqSTp8HFSjBzAQfufsy2yD/nZxxGDVCZM2k6FCtjjC7zonRIi7dOq893x2o9CKHkPg3BElJoMpsHqs58BqGuuKJYWvzi/NTP8n8cci8Nd020b+2UwMW3LpJPzAbt2Suvk5icyZNx0wqQC/V5Z3u1+Dc9zU8yQGhSRhMESRLUoEmdLEDpFR5dmRBUkdMmaAQMnS06PPayEU3q9ByyrFjtanBrTURWknzOJW3Hnv5PnjXLUltZmG+ZF1pYI1InA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgrhekhDWMT/oPTOGOkVlOhiW/o8lT5U0htU0eifINk=;
 b=P+zxYhSJrBTxTxdAaxC6cReSo0ptrUfitjTSTIO5tt0lMyTQEGUs9G3EES/GmBq4s5bxahpdIyMC9ey6HhoxmzMVqhZIJDCI1ofwJQ17TjGxEPIzg+C1/l6iC2agOAVRr0GkQoZOZdAbhT3lbzAPChk+YyVuMfO5m3RiRQe5yX/ork7bK3i0OhEXkezIz7YkjAMCJZe3eNCR7e41DxXi6kxfqhbShDpEe/djBBTnjfcBasH6LWgNcfMugFXxxyb+cqwZlNVY6Xb0OyWViz0TdH//q51Ka41zJ0Damuv56XLMUSqO6PWRLKtwr2ki/9Dk6x3AwtduUanCs8hzNjW+LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SA0PR02MB7370.namprd02.prod.outlook.com
 (2603:10b6:806:e0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 22 Dec
 2021 21:53:15 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 21:53:15 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Anton Johansson <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v7 07/13] target/hexagon: prepare input for the idef-parser
Thread-Topic: [PATCH v7 07/13] target/hexagon: prepare input for the
 idef-parser
Thread-Index: AQHX8yS7Dh4yXJEjiEq4R3I13TRLHaw/CSHA
Date: Wed, 22 Dec 2021 21:53:15 +0000
Message-ID: <SN4PR0201MB880880962C7DA481F5066978DE7D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211217090129.23242-1-anjo@rev.ng>
 <20211217090129.23242-8-anjo@rev.ng>
In-Reply-To: <20211217090129.23242-8-anjo@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32192c62-29d5-419d-2a41-08d9c5957558
x-ms-traffictypediagnostic: SA0PR02MB7370:EE_
x-microsoft-antispam-prvs: <SA0PR02MB737064835527DEB66B2341DADE7D9@SA0PR02MB7370.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JQb6KeO36t1pl8MD5MPhp6taxFtfP37PAij7143CwW1G2sY32qe4MazlvbG9C7bKwhZg5AWTqhClD2QPGTrSrGbztTXvQrB8C8Ox5gCAUk0LQfJFtI3sJZUUd7YlSPoalTUSldQYRdC9GlkGdVdMVsqx5pRhrJeh+Dz+wNNYpSpXM9KqonhDxSM3ALlIVTc0qWQqBQ8iBypg0s68jM2eBDNJ4wHlTFSWEbDZ8TGjMLIXjbenNgqkgEHGYCo9HUocoxaefXXN74AxbrSvgsSfuEz7sZWFV2WKdF6lrxY+7zjn62CTZwfcdzD5dlnOPV2NTfeMAmm5Cqzs/VTg/kGLxqTtspnc813fBsvK+Njg2/mOcj6Cc9o0zWX20PchZ1gflGVwLO5o54g3XQNKjR+rS5NOUDR6pk93KbtDa7vPSn/Vp9OcFUvVU2k3a4PmHNpaHVK+xrZhfcWgooy+bB8NOTfXYN9a/EYfn8nPnmeMqnYTClhlECbpZm/ztqZC2xtPnu/8anrK2o9DpDB0EUYPEhxW44lE17qhcgntAvN7j7Sv/pZpeDz/SZ27P+Z3eYw/uXEV5RmOurlUK/EahuJ0ZYMkn5USmxES/Sjb8SjBrQFCFLYWAoPqhXxPLyJBfb27ioVMHabywNxjb0HEEtMda9S2QjMe7O3Bs2asZRsoXeCwGTP/e8A7JDflBnw1Q3UlEVdT6DbwTbmTeLcadfp4ZsKVThMWNkQiXNg+NknwEG24fmw9NhKAY95jq00Q5JOuK2xZrke6rrgX1nr97CWfCNJwaNIeCbjsFGLxJQuHf4C2a6zcVPAvQpWmLgwNG0C8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(7696005)(53546011)(508600001)(86362001)(55016003)(38100700002)(38070700005)(26005)(4326008)(8936002)(71200400001)(76116006)(54906003)(110136005)(2906002)(122000001)(33656002)(186003)(8676002)(64756008)(5660300002)(316002)(66446008)(66946007)(66556008)(9686003)(66476007)(6506007)(52536014)(2004002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gjJcnJkstgzImbPwan8CPUxQe7LWY59hMeV/dtHYlMGUnM6IwKF3BwS8E1NF?=
 =?us-ascii?Q?h2l55UtRDBOM59gPrwerdJIjN/LqGviYc9t871r8VYpPL+eh6cm9yrf3Y0GE?=
 =?us-ascii?Q?zXIWedesooCqiMraCJ1+RYDRjMkRR/F4rKTD/eeteDiiJoehnpTfwqGudgL+?=
 =?us-ascii?Q?O63nchW6q+yZRq9jXHsEli1QZ/9gXi358aad0e33Wh3dFrowd76MYi5clEnl?=
 =?us-ascii?Q?FY01KIZbKkZVlsZLDO3ja4RwDJJxEvrrKMDYQEcDDewdcIWzOxenjqY4UysO?=
 =?us-ascii?Q?pHUqwEP2Ccp2MB9ANAY7gPhiZCYnamAOLDaUsUucsler6nOpYxBIVq3/n9Id?=
 =?us-ascii?Q?AebSPmt2xkekECJPgqeh3qBHmtBanw4V0IVXubaTb86JKUgx7jWL+ZeVDNcI?=
 =?us-ascii?Q?hlymznGcO5zDv7ofeASlPpZmWxVQjE6EsbA3M9So/+gC+IynmdJz1oWvOhBB?=
 =?us-ascii?Q?XjGlJiAJJevAup3AScio0861NGt3syBwb7qvu1GDBx+T5yUcjyVWsdU6ayi4?=
 =?us-ascii?Q?Yg8Y3RTW0ch/HL4T9KTCHxm4sxWkoManCuV+i2qe83VgWyLhHKz1uCUjIzkR?=
 =?us-ascii?Q?9M+df/vr00kuO+RwE9CHYUwbOQzHt8s3CScCMkolCq2wuIuyuDIFWWlbf8iK?=
 =?us-ascii?Q?h5NS+GpQml2z6lLOvQn4Hms8SGC0zA3GwScAey3vDDSUHytQTfacsnAN+2uS?=
 =?us-ascii?Q?eQ5JlFXema73/m4To7G7/cKhv3uIVXqPn3doVZ6m+nG/6nmFfKZBYyrWskcH?=
 =?us-ascii?Q?SSEpu+QPDkjH5Dw9Gfa6Yox9734+cXHM//FFH13Z7k2DKBf4CP2M25di9t8R?=
 =?us-ascii?Q?XpFbpEgE7Ttakuvm59RiIWUoU8uDVSigY78ToCQ2Ggve/N38KzeO7HKPm1XL?=
 =?us-ascii?Q?CeAvhyFKY9ymIFvBxIeXou6teJiHnQN4ZBiqFADlD4hQxsRIAHudldM0cg1v?=
 =?us-ascii?Q?aeoDfboLZIRx4psbj1NTVxM8u9VN7gljHoicFyKRGwY3igv1FgHrdQPpKf08?=
 =?us-ascii?Q?Z3xELUx6d+HuYneObfzwHN6VyVorpDTSkHd3UexRmGkTqKYLzLyfGqW9jq2g?=
 =?us-ascii?Q?TFSTIBrFkTnBLMWWuk/LyzCGPeBK/XLNqxQDLlz5jp3u7i/CjLUUEhgInm1i?=
 =?us-ascii?Q?1HICJY6DPKWGhNxz2Ezx16d024MZUvRYNRlB91K7vI6OxLLH+bKGT3JgM2Pb?=
 =?us-ascii?Q?ZaapNtqhDJhwG3yLjcoD3oMg8+6nKlhAGpHAvKYUVFHptfn+bkepehFDj9Mz?=
 =?us-ascii?Q?CH2m4/XQNykhp1F8QPoNsF/vbs7YLSlAKAvnYCUyNOHyGJp+jy3XR+meHTkH?=
 =?us-ascii?Q?df2FVxHpQzKfgMNWP9F/A3Y8i4QP/aM1mNVg50utnj6Ht+rsMhPn1+I5ninj?=
 =?us-ascii?Q?aU5OKS7/Rb/gjRX/XlbS61u77PNJrQegoZNUTGIl1Se+1lQjrxN0st+2a8QN?=
 =?us-ascii?Q?I78FvrgMcFZGxVsUdrE4k+QUM5Sjb9eaD6XWz+nC7tvWQlR9RNJpixMweCLA?=
 =?us-ascii?Q?vjEWEDXLVekK1RuRjKH62PjrNMiObkjCeJ7477o3ojCOP0tp1FiZ1fuMZ/j7?=
 =?us-ascii?Q?UZUCYZNjwQimBsQ9sBoXwyrfHIm5q5siFsRRAx175nQ94qpwpGSA2eGllJEb?=
 =?us-ascii?Q?DiZ+PlVSRv15KFk54QXxxUo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32192c62-29d5-419d-2a41-08d9c5957558
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 21:53:15.8209 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0WNGVp8NqgEi9CY8H0Fty4xgV0kQnQmkvf709EkwnEpiDTbDp8/ZX5IK/+9jxBCNlfhuiTYBtRTsO+N6KyiiYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7370
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Anton Johansson <anjo@rev.ng>
> Sent: Friday, December 17, 2021 2:01 AM
> To: qemu-devel@nongnu.org
> Cc: ale@rev.ng; Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; babush@rev.ng; nizzo@rev.ng;
> richard.henderson@linaro.org
> Subject: [PATCH v7 07/13] target/hexagon: prepare input for the idef-pars=
er
>=20
> From: Alessandro Di Federico <ale@rev.ng>
>=20
> Introduce infrastructure necessary to produce a file suitable for being p=
arsed
> by the idef-parser.
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/hexagon/gen_idef_parser_funcs.py | 123
> +++++++++++++++++++++
>  target/hexagon/idef-parser/macros.inc   | 140
> ++++++++++++++++++++++++
>  target/hexagon/idef-parser/prepare      |  24 ++++
>  target/hexagon/meson.build              |  16 +++
>  4 files changed, 303 insertions(+)
>  create mode 100644 target/hexagon/gen_idef_parser_funcs.py
>  create mode 100644 target/hexagon/idef-parser/macros.inc
>  create mode 100755 target/hexagon/idef-parser/prepare
>=20
> diff --git a/target/hexagon/gen_idef_parser_funcs.py
> +            ## Skip other unsupported instructions
> +            if ( tag.startswith('S2_cabacdecbin') ) :
> +                continue
> +            if ( tag.startswith('A5_ACS') ) :
> +                continue

Not startswith, just
            if (tag =3D=3D 'S2_cabacdecbin' or tag =3D=3D 'A5_ACS'):
                continue

> +            if ( tag.startswith('Y') ) :
> +                continue
> +            if ( tag.startswith('V6_') ) :
> +                continue
> +            if ( tag.startswith('F') ) :
> +                continue
> +            if ( tag.endswith('_locked') ) :
> +                continue
> +
> +            regs =3D tagregs[tag]
> +            imms =3D tagimms[tag]
> +
> +            arguments =3D []
> +            if hex_common.need_ea(tag):
> +                arguments.append("EA")

It's a hack to add EA to the arguments list and then have special handling =
for it in the parser
                  /*
                   * The effective address EA is the only variable passed t=
o
                   * function which needs to be "created".
                   */
                  if (c->inst.EA) {
                      gen_varid_allocate(c, &@1, c->inst.EA, 32, SIGNED);
                  }
Instead, put in a declaration inside the body - see below.


> +            for regtype,regid,toss,numregs in regs:
> +                prefix =3D "in " if hex_common.is_read(regid) else ""
> +
> +                is_pair =3D hex_common.is_pair(regid)
> +                is_single_old =3D (hex_common.is_single(regid)
> +                                 and hex_common.is_old_val(regtype, regi=
d, tag))
> +                is_single_new =3D (hex_common.is_single(regid)
> +                                 and hex_common.is_new_val(regtype,
> + regid, tag))
> +
> +                if is_pair or is_single_old:
> +                    arguments.append("%s%s%sV" % (prefix, regtype, regid=
))
> +                elif is_single_new:
> +                    arguments.append("%s%s%sN" % (prefix, regtype, regid=
))
> +                else:
> +                    print("Bad register parse:
> + ",regtype,regid,toss,numregs)
> +
> +            for immlett,bits,immshift in imms:
> +                arguments.append(hex_common.imm_name(immlett))
> +
> +            f.write("%s(%s) {\n" % (tag, ", ".join(arguments)))

Put the declaration here inside the body.
            if hex_common.need_ea(tag):
                f.write("    size4u_t EA;\n")

> +            f.write("    %s\n" % hex_common.semdict[tag])
> +            f.write("}\n\n")
> +
> +if __name__ =3D=3D "__main__":
> +    main()



> diff --git a/target/hexagon/idef-parser/prepare b/target/hexagon/idef-
> parser/prepare
> new file mode 100755
> index 0000000000..6377513dc5
> --- /dev/null
> +++ b/target/hexagon/idef-parser/prepare
> @@ -0,0 +1,24 @@
> +#!/bin/bash
> +
> +#
> +# Copyright(c) 2019-2021 rev.ng Labs Srl. All Rights Reserved.
> +#
> +# This library is free software; you can redistribute it and/or #
> +modify it under the terms of the GNU Lesser General Public # License as
> +published by the Free Software Foundation; either # version 2 of the
> +License, or (at your option) any later version.
> +#
> +# This library is distributed in the hope that it will be useful, # but
> +WITHOUT ANY WARRANTY; without even the implied warranty of #
> +MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> #
> +Lesser General Public License for more details.
> +#
> +# You should have received a copy of the GNU Lesser General Public #
> +License along with this library; if not, see <http://www.gnu.org/license=
s/>.
> +#

I'm not a lawyer, but why are you marking this with LGPL?

> +
> +set -e
> +set -o pipefail
> +
> +# Run the preprocessor and drop comments cpp "$@"


> diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
> index b61243103f..236c3a3ffa 100644
> --- a/target/hexagon/meson.build
> +++ b/target/hexagon/meson.build
> @@ -21,6 +21,7 @@ hex_common_py =3D 'hex_common.py'
>  attribs_def =3D meson.current_source_dir() / 'attribs_def.h.inc'
>  gen_tcg_h =3D meson.current_source_dir() / 'gen_tcg.h'
>  gen_tcg_hvx_h =3D meson.current_source_dir() / 'gen_tcg_hvx.h'
> +idef_parser_dir =3D meson.current_source_dir() / 'idef-parser'
>=20
>  #
>  #  Step 1
> @@ -179,4 +180,19 @@ hexagon_ss.add(files(
>      'mmvec/system_ext_mmvec.c',
>  ))
>=20
> +idef_parser_input_generated =3D custom_target(
> +    'idef_parser_input.h.inc',
> +    output: 'idef_parser_input.h.inc',
> +    depends: [semantics_generated],
> +    depend_files: [hex_common_py],
> +    command: [python, files('gen_idef_parser_funcs.py'),
> +semantics_generated, attribs_def, '@OUTPUT@'],
> +)
> +
> +idef_parser_input_generated_prep =3D custom_target(
> +    'idef_parser_input.preprocessed.h.inc',
> +    output: 'idef_parser_input.preprocessed.h.inc',
> +    input: idef_parser_input_generated,
> +    command: [idef_parser_dir / 'prepare', '@INPUT@', '-I' +
> +idef_parser_dir, '-o', '@OUTPUT@'],
> +)
> +
>  target_arch +=3D {'hexagon': hexagon_ss}
> --
> 2.33.1


