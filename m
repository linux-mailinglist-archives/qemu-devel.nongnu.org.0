Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE42B402E38
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 20:13:37 +0200 (CEST)
Received: from localhost ([::1]:49658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNfbE-0005pZ-Ry
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 14:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mNfWt-0000F9-Bs
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:09:07 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:26479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mNfWr-0003PH-6y
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1631038145; x=1631642945;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S9942ko55E0NYmVLgw+mne0IIHO0Ld3li6fTIPWfzdA=;
 b=DcxZmSfyjDgeWHoCyAtFqDZ0ylSGAZ7cq4pbz8vzxuMAYoFVzwfnHik2
 tF158d6TKaHTJzoiFx7Yy7p9tITRCkkT6/ZWCFIPSudH3b/ILYfdxPeOU
 rQyx3lgtBN4ptFm60PotTKhaKL317K6/If3X+pBILExYJvHmp854K71pK s=;
Received: from mail-sn1anam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.48])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 18:09:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQGV4Rwk20coBdg5IK2P+3B56TnHCKFlc+cIX0ULfso3NARyQnagPu4e9P6Im/KyLOVqR5MjoJaBJrMHQGkRWqcDkLO2qje3IdwdSoUnigmCJbuJCOz1Nb/cZEN+4+y160lku9TZdZibSQ844Y4Q2GGTyawYPoliq/CbQhtapKqpXtpP4MUUKpSV9heq8glHxvShQizsGZJLuEmICs+i8gkHO5WpQJNOJINXz9RaIf0SLG2HoOhVY7u473FkbW9bBONOYtkQAiqcrnGWrNZBqka7xT4wp/xd9ukxm//Nb1QtaqkvZxw0euJXDHfHLZtXPMnNh3D0//YcALlMB5wl8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=S9942ko55E0NYmVLgw+mne0IIHO0Ld3li6fTIPWfzdA=;
 b=WyYAyQ588Ngwy8bV5t/Z9uJJ0JS1m1o9uOUCDBcqpykpqeTpzUnR8q2l6svtKSmD+7BhE+5fIzowoEkYNuZTbbup2xynGOfNh2Gve1jkbnruFm8p7/5ZTC7eGyaqN5JT6hd4VsdtstcpGOlP5cA1jjneAbbPEY6Oso2M/Gv1kzP+FHj1xefGg56aN++kFaT0ekAKWVF7d2KnLmrKOBPSXO7oy9o+t2O7TLeNWMJV56q9l1zoxq7dCAjegCq8Aw760scoaZKETW+zic8BNM/xAU/JsJMLqfruEYFjcg37YD9Qe+Sq9gYFl6pAiEdX28TGgU84vGTl2/tN/b01FouOyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6324.namprd02.prod.outlook.com (2603:10b6:a03:1f6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 18:09:01 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5%6]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 18:09:01 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v6 07/12] target/hexagon: prepare input for the idef-parser
Thread-Topic: [PATCH v6 07/12] target/hexagon: prepare input for the
 idef-parser
Thread-Index: AQHXfWMas7KbARSe5UKIfHOyHXBG76uXuL2w
Date: Tue, 7 Sep 2021 18:09:01 +0000
Message-ID: <BYAPR02MB48869CA040DC32F2244A1952DED39@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210720123031.1101682-1-ale.qemu@rev.ng>
 <20210720123031.1101682-8-ale.qemu@rev.ng>
In-Reply-To: <20210720123031.1101682-8-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a4dc505-a636-4a7e-275d-08d9722a9252
x-ms-traffictypediagnostic: BY5PR02MB6324:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB6324ED195E4AC8F8C0618E10DED39@BY5PR02MB6324.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:901;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XZFcUhkpokauFUehMJ73WhRhOv9Tnw/ZPC2eBqiUUbJouswXzCy6PUopvwPHz54bo33TIUTmtBwNhHn1ban18QoNVqYF6DIFXBAKKGMmkJHneAOBh1/JPZUED+R0L/m7o6O3ztfhmeKcy37i7QIq2j/fmAwtn6mgpvhA3hhgHIpmftHIahmjFXb8wkVjYrlNBt6vaZP/bGSn/I8fr+/+f/YkUmE/62pyvqbF3H/N7AD6ebuQQfsvdeqW6TPNwrjC8nVP2tHFairrEhsu63T78PNfvgeHH0RVH1W2AzDa5rRcC26iZC1XPg62KOpwEYTaIJDvxOQJNk+sVxD3Jkv4AbYl4cT834M465eA2nV2tdsWvRsBJMyjElMz1gisvgiY7t2Ra40HJxzfJ7Lq314aGyE+8+hC4JBG5AHZqcpzKIVYFsRUZUmhXFVLXPOoA0kHgHfY9gEcOxLfMwQATwjm8zBrNwuEQD2Qqk9Hzc3yl+bifoYlyB2MSMHt7CJ/f6IOpGf/qtCLNNfITzOrzY0P0gn7yP0+r7mzmDzm6jDlhMhTUQskPCpCh6/JxNwq8c4uMQWOW57vFExAoLs5O2jRFwJAaqPS4Pnv3bBAMipihalE2Mb/wFcCv+vAplV/cEHepKQcixZ6B4QcOLtZPRU2qt5Vsl0V9PighzIYASbvmxkAYl5QitUULGMpfLFVnLf4sguUDF1eRu36WkkPzWkydg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(8936002)(4326008)(186003)(66946007)(33656002)(83380400001)(64756008)(122000001)(26005)(55016002)(5660300002)(9686003)(2906002)(316002)(110136005)(508600001)(6506007)(53546011)(54906003)(7696005)(71200400001)(86362001)(8676002)(66446008)(52536014)(38070700005)(66476007)(66556008)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ie77psQOT4KDecYRHNW0tAx2lQ+NFxmX4mfo64rvr7cw2fiFcHWcfgeWJHUI?=
 =?us-ascii?Q?LpCJ1IrzE+lcFbQGaUU9AvjabJCaFi89Djg43+vUU4YalOXq1y9QxuUumRDX?=
 =?us-ascii?Q?uNWGVI2bB9DlH980Qjoyqw8t9n86JD22g1D5utfnGmonj+O/iLRHiVuH49yq?=
 =?us-ascii?Q?nYiG1H8FVA1KwejXK/s+2mBezWy5S13NDOtqp6elpi3WRQlfmUOA6oK3V0kM?=
 =?us-ascii?Q?uOwL+EEe3nj1GpXIHw0GnRjQYluNrENFSBHn8yeH2+TijugWLGOf17Ctel0l?=
 =?us-ascii?Q?IpTRs/xGKyRV0wuBWG+mJa+QznRBKVD9r3QBaWjxODuBuf/3S0ymJniZ+3gE?=
 =?us-ascii?Q?gwztbbnsFjnGUrSLTdJi0K1alXkVnfcqG63Ppi+gPVzm4eoldHaxE1j7K1gB?=
 =?us-ascii?Q?k29IGepMTyEVJx+wZj/W5tSV5p8Nuc2OEU3O6FJmyehY4QnBkXhQegXHAilp?=
 =?us-ascii?Q?Sv+98lOls4RvUIFdhm7cbbF8dxPnwpb620qT8k8YENiE7ZAvg/KZ08fnqZtP?=
 =?us-ascii?Q?jWS74Cqgx7D6oIz3leDHy0ycgIByOVWqQMW2y4gFl8Ni/l3F8yzPFhZhO1tK?=
 =?us-ascii?Q?ncSQww3r0HcXzbitgXoOTqG/mN3imns9bx7FEcG8WBybhmkjWxe/K/5pTUtD?=
 =?us-ascii?Q?TcBkIgwP2EyRdX6upnqcOACnHkAuw41V+dHXcitalI1FMgVSJPFRpkx7fbr5?=
 =?us-ascii?Q?sttTTtI2HbMfbH1GGd7DKlyJcOXU0WCH8ZTEKQrYmoE8uj7JUp5zuvdACLlN?=
 =?us-ascii?Q?bX+ARDjqOfT8WYse2wTyTLDZN9qja1n+zl3WnOoGhrXnbBEHUxX3N6Gd7SYG?=
 =?us-ascii?Q?U/nTId4nLQXa1zWOzR3zDYhFNB4ysIbBYpt3GXr/kl6GaaAubJuzoVj+Hqqj?=
 =?us-ascii?Q?A6B5nMbQACHBFoQUV8L6AAv1zA95P8xg5EL36LIPU90OuXu+WXb+9MfG7P1A?=
 =?us-ascii?Q?TAUj9FPQklD8/+FaK8c+l2IKxm2bOaI6RL0WqcDdUtb3fl/VNifnlYxrfYOP?=
 =?us-ascii?Q?Rc/umGDG04K4zfqbgMuq+isW+PfS2hypioDbcfg02WuOPbvLKPU4CCLU4hJo?=
 =?us-ascii?Q?I3YsW6qGG3MpDd1Zn3mNFH6+suWQF0teUT7HAml7UsrxdbxLyFqbRO0JHJMb?=
 =?us-ascii?Q?4V24ZHcoiTDy1exRym69Q8C8X6KP88jCQ0Blyye9NzSxUskGhqfJP9O66Wxo?=
 =?us-ascii?Q?db5azlNlPxWdAgU3QBr1XKkFVIUCWQq0fxQdOIB/HuFQfr13RghqyZLrTZtN?=
 =?us-ascii?Q?Nb74mORJXFoAznWGsYY1KjFKkHE01/0+Bflf6pdxx0+Ru9c5fDJRrqIugR8j?=
 =?us-ascii?Q?PpQZVrV7Wk4FJWHKqEY8OBfD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4dc505-a636-4a7e-275d-08d9722a9252
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 18:09:01.7596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EwIIb2uJUpFAzPnJpSw/pkmUTLmo3426S7fu8ljYbJWGy9IgEOLxlvn6IGQUUHaooielUJcbrEL1XL6WwUbbGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6324
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
Cc: "babush@rev.ng" <babush@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "nizzo@rev.ng" <nizzo@rev.ng>, Alessandro Di Federico <ale@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Alessandro Di Federico <ale.qemu@rev.ng>
> Sent: Tuesday, July 20, 2021 7:30 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; babush@rev.ng; nizzo@rev.ng;
> richard.henderson@linaro.org; Alessandro Di Federico <ale@rev.ng>
> Subject: [PATCH v6 07/12] target/hexagon: prepare input for the idef-pars=
er
>=20
> From: Alessandro Di Federico <ale@rev.ng>
>=20
> Introduce infrastructure necessary to produce a file suitable for being p=
arsed
> by the idef-parser.
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>


> diff --git a/target/hexagon/gen_idef_parser_funcs.py
> b/target/hexagon/gen_idef_parser_funcs.py
> new file mode 100644
> index 0000000000..7b8e0f6981
> --- /dev/null
> +++ b/target/hexagon/gen_idef_parser_funcs.py
> +def main():
> +    hex_common.read_semantics_file(sys.argv[1])
> +    hex_common.read_attribs_file(sys.argv[2])
> +    hex_common.read_overrides_file(sys.argv[3])

Do you really need the overrides file?


> diff --git a/target/hexagon/idef-parser/macros.inc b/target/hexagon/idef-
> parser/macros.inc
> new file mode 100644
> index 0000000000..20535691e8
> --- /dev/null
> +++ b/target/hexagon/idef-parser/macros.inc


> +/* Ease parsing */

> +#define fADDSAT64(DST, A, B)                                            =
\
> +    __a =3D fCAST8u(A);                                                 =
  \
> +    __b =3D fCAST8u(B);                                                 =
  \
> +    __sum =3D __a + __b;                                                =
  \
> +    __xor =3D __a ^ __b;                                                =
  \
> +    __mask =3D fCAST8s(0x8000000000000000ULL);                          =
  \
> +    if (((__a ^ __b) | ~(__a ^ __sum)) & __mask) {                      =
\
> +        DST =3D __sum;                                                  =
  \
> +    } else {                                                            =
\
> +        DST =3D ((__sum & __mask) >> 63) + __mask;                      =
  \
> +        fSET_OVERFLOW();                                                =
\
> +    }

There are a bunch of these with pretty complex semantics.  Wouldn't it be e=
asier to recognize them in the parser and call a hand-written helper?

> +/* Assignments */
> +#define fPCALIGN(IMM) (IMM =3D IMM & ~3)
> +#define fWRITE_LR(A) (LR =3D A)
> +#define fWRITE_FP(A) (FP =3D A)
> +#define fWRITE_SP(A) (SP =3D A)
> +#define fBRANCH(LOC, TYPE) (PC =3D LOC)
> +#define fJUMPR(REGNO, TARGET, TYPE) (PC =3D TARGET)

This should invoke write_new_pc because there may be more than one in the s=
ame packet.

> +fWRITE_NPC(VAL) (PC =3D VAL)

Ditto

> +/* Binary operators */
> +#define fADD128(A, B) (A + B)
> +#define fSUB128(A, B) (A - B)
> +#define fSHIFTR128(A, B) (size8s_t) (A >> B)
> +#define fSHIFTL128(A, B) (A << B)
> +#define fAND128(A, B) (A & B)

Will these operate on 128 bit numbers?


