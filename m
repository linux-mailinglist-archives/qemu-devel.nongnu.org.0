Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF24F49929C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:23:24 +0100 (CET)
Received: from localhost ([::1]:52714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC5s2-00036a-8i
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:23:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nC5gi-00010U-3v
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:11:40 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:57662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nC5ge-0002UX-NU
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:11:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1643055096; x=1643659896;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6tA6gaBANBs3/X5As+i48qGj64aI1M846C8e7VJqp5E=;
 b=xpltwmXFzOqLMAff9Diny6srmpBMybl54McMXNq//PIhca7p10Ho3ds8
 CHaLleYUuhZNUKmRpEyccIXbAWr5jkZBH1bFIJECsYFloQom/okbF9foV
 bYrz5oTuJM0IukcrI76K+7ckbEO77wR5XW2uGN1rJP1qaqLHi4VjP7jMB A=;
Received: from mail-bn1nam07lp2043.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.43])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 20:11:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BN+iD2RH7KzvctR16kxpZCC72tOkdkdGQgmrHfXtYQY1axO+kD2cfuE/vbZ3/RWzYA2Zh9phj5HFvK4MJAsvoEzRspwmlu9O1pjHsPo8mXG6SYq0wPofBAtH4I+LgiB6THUl8LeHNeGJyexRITrCKrhKs28X5m87eCK+BxqnXjg9GPGN53oFGzNYFDRbeQse+WQ39riY6xQ/56zek2SsGw8zVoFesMkTYN8ixeVT6a2Aen3C355U7Q3LekqrqblbIHly3oQ/f2qGwHcdRGyeW/hY+JMm66QLqRng4gpl3ymnf5hUEh8dvBVV2/GKkiFBplvRKWUMWURRiln26dMpuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tA6gaBANBs3/X5As+i48qGj64aI1M846C8e7VJqp5E=;
 b=FB81uV+8KFYQahXfoBqAG1G8JeSXb8yY+JFCwbunsIyQAXAPDgRaXR/pEVNKzlJOD6ty6Zlg6Cx/xo56LdEUpXgl1gG/WD2SXJx/E+QllqvM48bGCII4JruQFf7qjnda2PCbxEblCfq+k08ACkH/9acGutdC4ZcIhU8kFIErB4M0xyOjKPGeR5diQxmYACXfMc+QliBl2d+tjqOmOeLwy3vL95N2/xQVKpEW+GtOvduepSQ8RZGW+wsOLQVHxKEhtY6SNb4IMvYrtBOI42UFD5uNWZzCAfKM1112HsdjH/DMFX2xxDmaTirunHXWRo86sOg2wQPgAo3TffJQXwlFJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN4PR0201MB8806.namprd02.prod.outlook.com
 (2603:10b6:806:201::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Mon, 24 Jan
 2022 20:11:26 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 20:11:26 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Zongyuan Li <zongyuan.li@smartx.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] target/hexagon: remove unused variable
Thread-Topic: [PATCH] target/hexagon: remove unused variable
Thread-Index: AQHYEO3FqnC5S2AGKEiv+gvIlPziNKxymxFQ
Date: Mon, 24 Jan 2022 20:11:26 +0000
Message-ID: <SN4PR0201MB8808BFD6E82313862A45D180DE5E9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220124064339.56027-1-zongyuan.li@smartx.com>
In-Reply-To: <20220124064339.56027-1-zongyuan.li@smartx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d52f610-62fe-4275-444e-08d9df75b3a6
x-ms-traffictypediagnostic: SN4PR0201MB8806:EE_
x-microsoft-antispam-prvs: <SN4PR0201MB88065B5B7CA8F9C3CDD5C7B6DE5E9@SN4PR0201MB8806.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:486;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y0SnDAnzHTgZWk9+3uHh+W6PVAITg3bVqO1tB6kWFhZEOP0VSmUrlUQbtiOHzMw0aLNqGCHg+Xk2FjS80QcXuvt8TGJfUa00hwk3WhAvrbf3AcaLp6tG2qO7aXXiQUCmM6Gf3OZp9E8s42NqWATMZpPfycpit/9/9faJDtruVhnHSUpk0YkPzyCHatXN/WCXVqrYTnjM+ZBwHC9rRHEUGW0vttSVyvxYX1RSWRfpCx0LaSDRkKVc1cZhgPuxARFdf7ZPP4tpS0hCNgjFfKFm2iZq34ULdb63F6Ftos92uSIDhJnoB2NRUHMkkRu/qdbWDZ7p7xE3YyHdkKTK71kdfP403tEYHX0BYzN1HBEGkx8Fone/mgLKs0312gWi2UzXIfHCIFG6y4ZKhatkIqKUL3FX085SDlCSq5bEVF7eeIA5md/BBQyUW/jetnhRzmTw3PYI2xmrEj5hGwCKxXJGF47DuCeqHurFcBrUQE27KaCYHrAUzT0lSzmipZBxQOUrJ+rg0l3HWQkI0BHf5Xw2OZvaiy2p5fgpIXLabI53rT8Lxl9JOoqq7NEVjlXt8kNexKFy1rzlm58ydLeNgVkRauGjTY6sbkPlGH91IRzQAL5V54q7jCk/7laPRD2D6M6DD5zfW2Wcu1GZToYgaFJxGkihopjLS3cFtP0xvS5kJ6a28U2pgtsW78v5+u5GoY3TVVQ3yTzeUmCgNISwvtY1Yafpfdi6jfrI+b9nVm5OoVjFwSDu4Wdrp15gJ/TFDKV/Q3yL11KHeIfva025Afa4PLhzwgmq9REURfFKVeqYYsg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(966005)(110136005)(8936002)(8676002)(66476007)(508600001)(66556008)(64756008)(76116006)(186003)(66446008)(316002)(9686003)(33656002)(7696005)(53546011)(6506007)(86362001)(38100700002)(5660300002)(52536014)(71200400001)(2906002)(38070700005)(122000001)(26005)(83380400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oJZnNhQf/NbzLbkyxu7IqYWey62rNT9z9g4FEbpM9nXeZCw9OedPxC9/RMlf?=
 =?us-ascii?Q?TgXjbH6oeMWHp5oQ7aTX/HwpDeu0ns1UX48x1SBhKrKpiY0TSMmuR4T46djf?=
 =?us-ascii?Q?Y4DTdsQHeEYRtYvB0fZagGJJIw7rfvG0Z5CmvpzTKVTQl0b+Q9VFOiMOpCPv?=
 =?us-ascii?Q?+UXYEZ7haPbn5eXRvF2YuhMpRiMWnJPxAhDlDRkKUJUrqtZCScSN8UvmIejv?=
 =?us-ascii?Q?SBpIOj6qF3y7LaC0HZ55XCb+hwtl/YQgjgnAo3TTcoft6dKuJZZ6JKr2fNpS?=
 =?us-ascii?Q?cXcNK61SaZZ2cwQsAhDwoGi5jjV7f9yzNqbT+8HtLn0FpAm8mvt2pOP6H1yS?=
 =?us-ascii?Q?EmBoMJkQxpN1rm7KjtAsRVSGGfQGSHiiPNMq4Z3kIuCtqg4WdEEE0uCG0ta1?=
 =?us-ascii?Q?qltv5fuplm88Vb3ytz3uiz+ri4EyKbLN8NVb60JIoNL1sj3nYESoQr0lI5Ni?=
 =?us-ascii?Q?MgtRDhOzrCQqLWYE0JkOwHXono1W8mFWSn9F25zzhzUyGxlXp1kNd7TtJ1Em?=
 =?us-ascii?Q?BuKfnmvXZ9rsDaYhsaYoNsQAlkLVe07W3CsxRfAtuOGZXnA+rwZ6ANYDCmuS?=
 =?us-ascii?Q?LNrGcNfLKn/PPoyVCbb/rm0vEDFzvumTp10QoW8aimg+QSd8JsYkv9C2BcTe?=
 =?us-ascii?Q?kRerF6wTal5C8yly8Ce6FZmrgln/HGTXBpVzHI+ZwJssLVH4UYOXvdKj55kD?=
 =?us-ascii?Q?xfB5WkZacSPEcvo3eSR6p8s1N6bR7gbd00bKI/NF3rmWRIlkgfBTLUUUWp/X?=
 =?us-ascii?Q?1z8T3Cs/gEMMt6lBhUwirHt7GPiPZlBhacuuYgglqpuhR63v3ZKyluREye9M?=
 =?us-ascii?Q?5iqP9Y4RMoaN5GYdNY/MKr9+GFFPW1kCNPItXpUibrM8WF+4Dmmt2sAV0hV2?=
 =?us-ascii?Q?AVyE7pUanvTdys+Hsl/aAp7MbnlsaLkyj79XfQuKUoG8/Ngdl4WqKAFWgCQS?=
 =?us-ascii?Q?c9uLGdHd5SjvSmQ4kL4LYPgwvUQBa/H9cYw/fUyrBPZcA8psfrpr4ae1ZFNA?=
 =?us-ascii?Q?l4yAdoP4SSYcI9EeFIXPr4WVNP4d8z6YFn2lOmRLAVe8vCSVxDKt2VJoArI7?=
 =?us-ascii?Q?gEfVdPoUmB0Xbt7q5Ozjx5nY4snV/15RV3YXe4yMrWpt/U6U/lqLSLr8xoW0?=
 =?us-ascii?Q?tGkrIijealuKYxQTlh0sMmkGvqF7Ms5/1ff2iqe7NDfzchGI31GYUwoM5s8c?=
 =?us-ascii?Q?sffwgZpujYkMYFi1xDQt2UsvZeSK/q3f5/B+QQ12HVRWwtjqnM223ivyJJey?=
 =?us-ascii?Q?FslhNuf1OEcLK/OceDJp+pc6INy8cpFlhV6GsoWeifdsUJRqZvfmCueZSBNa?=
 =?us-ascii?Q?BKRz3HIVaK15GqtxxR+R1US0F12OSTS3ygx0JiwsVQDiZAl3LcBw27Gm3TSM?=
 =?us-ascii?Q?WtC0LxvCj1saw9zT073jy2P8RCD/XB3jnhBOWfqXVkjnQTCsqp+wX9pZ1y6z?=
 =?us-ascii?Q?I5jpoOaNQyDTLqzAEI3u+FuWc4nKK1Q/yk8Isa8bk8TyG/BSTmN9zDJhtuh2?=
 =?us-ascii?Q?DKjavvs8ADaDuz2GZbMhAHB4HXQdJ5ogSZIXpFUArzgEx5Xcyn3fJX0MyggM?=
 =?us-ascii?Q?gDiDBv41sfep3zhQE+xrpeWMsSUCJdYbxIumnCptUU1Xz8HRCJX/wyysUgqJ?=
 =?us-ascii?Q?wejxQM6Ni7T+etrnFNE0lv4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d52f610-62fe-4275-444e-08d9df75b3a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2022 20:11:26.7040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: orqvp6QI7o6XkBpfj5t2f5c52qvqlLONcxhSgTcs5/lg0eQvI0rpVV8KXvRasXXbV7M4Q2LaeV61VjTWrHTyJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8806
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Zongyuan Li <zongyuan.li@smartx.com>
> Sent: Monday, January 24, 2022 12:44 AM
> To: qemu-devel@nongnu.org
> Cc: Zongyuan Li <zongyuan.li@smartx.com>; Taylor Simpson
> <tsimpson@quicinc.com>
> Subject: [PATCH] target/hexagon: remove unused variable
>=20
> When building with clang version 13.0.0 (eg. Fedora 13.0.0-3.fc35), two
> unused variables introduced by macro GATHER_FUNCTION and
> SCATTER_FUNCTION will cause building process failure due to [-Werror -
> Wunused-variable].
>=20
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/831
> ---
>  target/hexagon/mmvec/macros.h | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/target/hexagon/mmvec/macros.h
> b/target/hexagon/mmvec/macros.h index 10f4630364..44781cfb4a 100644
> --- a/target/hexagon/mmvec/macros.h
> +++ b/target/hexagon/mmvec/macros.h
> @@ -164,11 +164,9 @@
>          target_ulong va =3D EA; \
>          target_ulong va_high =3D EA + LEN; \
>          uintptr_t ra =3D GETPC(); \
> -        int log_bank =3D 0; \
>          int log_byte =3D 0; \
>          for (i0 =3D 0; i0 < ELEMENT_SIZE; i0++) { \
>              log_byte =3D ((va + i0) <=3D va_high) && QVAL; \
> -            log_bank |=3D (log_byte << i0); \
>              uint8_t B; \
>              B =3D cpu_ldub_data_ra(env, EA + i0, ra); \
>              env->tmp_VRegs[0].ub[ELEMENT_SIZE * IDX + i0] =3D B; \ @@ -2=
43,11
> +241,9 @@
>          int i0; \
>          target_ulong va =3D EA; \
>          target_ulong va_high =3D EA + LEN; \
> -        int log_bank =3D 0; \
>          int log_byte =3D 0; \
>          for (i0 =3D 0; i0 < ELEM_SIZE; i0++) { \
>              log_byte =3D ((va + i0) <=3D va_high) && QVAL; \
> -            log_bank |=3D (log_byte << i0); \
>              LOG_VTCM_BYTE(va + i0, log_byte, IN.ub[ELEM_SIZE * IDX + i0]=
, \
>                            ELEM_SIZE * IDX + i0); \
>          } \
> --
> 2.34.1

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>



