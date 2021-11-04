Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C257D445C25
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 23:34:14 +0100 (CET)
Received: from localhost ([::1]:54028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1milJF-0000Hr-G5
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 18:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1milHo-0007ve-47
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 18:32:44 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:29570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1milHi-0006So-JT
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 18:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1636065158; x=1636669958;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W5kSHHTC0Uh7tdAeLvr9XzR95fploCELtVXwCW8bTqs=;
 b=lkLsYHv6tHKYsFcDKw7M14l3OetOJJe7E9gEHmYrsiWZdn4cpW1/p1oT
 P6eHJMjH9IbbQupzglyr2cm42JDqJoAly5qTpPXJim39nZH1boU9dYKee
 5atPYpY6D65+IPTrc9dzo+n6D1cXmjgBxbLJp2F/Nt7wjynqGAB/VBHXu Q=;
Received: from mail-bn8nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.172])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 22:32:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcvnIpcKD5iFpiTb1oxG9uAAWYitVl7lmKgVpGZTtvUWen/vz2coJgga1Wirb11wgucVDapP4pXR4DYzn0MqxwgP/lDbEyavBjN/2YLSVZUy39Cm0pkKHtQgpoq09R1Gy50Yr81BePnx5UZDcR6TXM5IwJGwRsDziq1yAsTLq5OP33M0Pz9XhD154JpnqrVow/EePWZKtjfnYY/pzutHim0UZ21ZNDfJt+AoCSAHLVoper79d24tz6gD8ylYnBszMM4a8NG592xUhNPv9qUFjI2yAYrzs+i9uEi11NEoURNKYRYaTKQ6C0uf+/LQERGrtNNa/gcgoU22NbBkEJYiHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5kSHHTC0Uh7tdAeLvr9XzR95fploCELtVXwCW8bTqs=;
 b=B6n0agzea6eHzjP6FjQlPMgsMvasM7HvtOofIj+rp5rhApBnaNHKs6qRq2JH/Vtwo8UaOitlvjjLfmxianrbGbY5ePoBSFWVoo9ySf1kYTgMIgmulkBS1r+adYGJf4hQllkyfHbR+W+jnrdtpga+QCsjBTXvc6zTXAjJ64p13i7st2loThLK7M8CBJMTv59h2uMATvaz5Qf49ifezADySR9nIJF1Ct+oYfkvbiUnib0fviBUt2Fy6QIu6l6+N9vvyNB3hF90oR+UVBx2oJ/CMEsPNusrSNySRydLFsYI1cR3cmkw4aaWzkq90DSPb07OCKADu3GaoTLU3mDAEOpqyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SA2PR02MB7531.namprd02.prod.outlook.com
 (2603:10b6:806:14c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Thu, 4 Nov
 2021 22:32:21 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04%5]) with mapi id 15.20.4649.018; Thu, 4 Nov 2021
 22:32:20 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: FW: New Defects reported by Coverity Scan for QEMU
Thread-Topic: New Defects reported by Coverity Scan for QEMU
Thread-Index: AQHX0cAWbMVPCCcpC0y2OB7zGEg5CKvz8p6g
Date: Thu, 4 Nov 2021 22:32:20 +0000
Message-ID: <SN4PR0201MB880836A27E0A0E93CDF7308CDE8D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <61844bb6ced54_21aa5f2b09742af98856497@prd-scan-dashboard-0.mail>
In-Reply-To: <61844bb6ced54_21aa5f2b09742af98856497@prd-scan-dashboard-0.mail>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76dc3b76-9e67-4277-8658-08d99fe2f740
x-ms-traffictypediagnostic: SA2PR02MB7531:
x-microsoft-antispam-prvs: <SA2PR02MB7531F9902A577B81F845FA69DE8D9@SA2PR02MB7531.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lPh7m8/RR0Afe1wXwvQRwOhkU4VFUvS/iZDS7Tg9/g8iXdakPlU1n1OaLD+GuXoXy1HuVpFVTaXTYUexNDTfpKJOwT/qY4muxbb+mC0/RF6ztEhxjKvyzbqELQLpPUXlj78sDHpe1enjKOYIjFMiIgERPs70Y13URfreII96T/cMuGuqON6d/0e7vAqxECiat4NbVg+k12uJ3CFWLAKu5yMtkCmzH23UkVlz3vr0SMRpVDxvvMdxuWOhEeLf15+xZdJVKBjDmpcYkKyp7lFWqjcnqwGZehO/uo+yYwrT1MB/3EDDHKMV+mc0S4nAbF4jnwrs+WgDF4PgPNtuokjeznohj6euqwzAGh19z507HJihs5bPA8ohOyHPC3dizEd0yaphh0x8O8YnpPM3pIJtFXw+xGXAfEY0hXpO9NOKYR1tUms+osJNXj+v2Dg7ekFgey5mSgCJxbMetR6sCREpKI2JeBrUb8zmjgubpFnElQdlcCp7m/3pZlwBUVoovmejpfYi+PHoIgD2+piT/XWz9VnjN8q6fRZw8CjW9ezR9Q30RO4lGvAgFHzNJRyIByROatc6ldMWSq5AD2WZWATMv5JXZBCpwCngz8fY7LbQ6bM9/4vm7v/2Z0LFRRYIIAa4Ubbp6wPBE4MTm+uYGXbFu5NS/wxRUD2t2cZ9Y950rB1IgFZotzMDkXqMK3EmqwcZd9gV3A0jD+ewVk3OuXslKAp/7wrlnqtq5bxClX0Nu+TAS5Uee0UIxnuwhcCq4F7all6U7JMnTIxKLlyAbu0VdVdEPyVn49dXuMwW3BwXYDE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(38070700005)(52536014)(66476007)(66446008)(64756008)(66556008)(26005)(66946007)(55016002)(186003)(83380400001)(7696005)(508600001)(71200400001)(53546011)(6506007)(8936002)(4326008)(76116006)(54906003)(5660300002)(38100700002)(316002)(9686003)(6916009)(33656002)(2906002)(122000001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?O0Auu7hPgtSWxz1PHsWS7vJ+nLiC+nNYiLvmKQlLH+kmlNnctbpi6rKgcf?=
 =?iso-8859-1?Q?G02LaSNoEgajv69lGI16w62fKGZR8d2OiiadNCDeSBhbsdhxQYAYKkpVT+?=
 =?iso-8859-1?Q?4GjDK1RVpaU7JDk+ySapxHDYro8Q9TeSwV1oFznWl3v6OucB2pR5cWBxJZ?=
 =?iso-8859-1?Q?3GUzyYO6vCDJ0VGT//uMixjXF2i3T5qusnpVPJe3HbEUxEhTT8FCfNVe1B?=
 =?iso-8859-1?Q?0eN+KJ7aS6NVpTjAJYWDmGCRTvXxLAOtHChOf/bf8iIBYdTrOqllDhukZj?=
 =?iso-8859-1?Q?PqXxZxM/AkMc0EV/1XvK2X6UMzqpJNRhHbPuTKe5y6Edr1Yqhh2sqkhxt4?=
 =?iso-8859-1?Q?/s+Ou3xXZt6Ou/hn3FgoXpqko8KL1EQnGnGkcEaENU9TjpzxNORjmXl3Cg?=
 =?iso-8859-1?Q?pCWgZxkPv88L3KYl+r8Q1H2P2yOl+tl49t2F3gPudqGa/u/q9TBJnXbICt?=
 =?iso-8859-1?Q?h2qtZp3fd0A5LTSuJKkYvut/GhZZJGvqQG/aTTpa90EvPd+cZh85AAB0D/?=
 =?iso-8859-1?Q?osFvY5gZSmRjFvP5ZmodA8r8R1eCfTAbdu40kW2CEiGZr6LbHZ55eOZWVW?=
 =?iso-8859-1?Q?qQMxVUuGxaAWXO2l1OOFSamDvyYFMWdadYKlEQ6NKkqy9k5BYLoyjq99Nz?=
 =?iso-8859-1?Q?E/NJFyqVaVXkTgKL1K/kFRA2lW7ZiiOzLtkQNXEQ2tvp5Ij6GAwhrRbdas?=
 =?iso-8859-1?Q?ykBDPIHg+VTeFHXsCCE0c7S4zED8COVaqK3iKqKID2Vr3NY0w1nh++6b3B?=
 =?iso-8859-1?Q?tpv5vQgmXWYBoHrs/b7rlLRzVzjoYVyYIrXvsDCdK5jYnm1X41clMOdEZv?=
 =?iso-8859-1?Q?jScNdLE6ff0idHsoFPGF15bximTwG94UJA6OpRt5CCtLmnV9Cot03IvNpM?=
 =?iso-8859-1?Q?wkeHAMTMKzBtdh882hPXODlw2JT5Jv7BwbUW+7DVWsXZqcoEoP8DlNepXc?=
 =?iso-8859-1?Q?T6J1+ogw2xsos5zJknAVZsRma04Rk4IkwPS/Jkd3SXxzHTVgDAe1eMKymE?=
 =?iso-8859-1?Q?HPFLxucrt8vGHE42m2lxAubpFETEntWJn8LaBzjUKu+PomQMg26pAdnAWG?=
 =?iso-8859-1?Q?n04cipWk10UNFZ1eZRL9YWI6/c7IcAioq6lnKDQcrhI40PHciImWOvzyLw?=
 =?iso-8859-1?Q?Wvn+sp95Zs5WkCcyai7HHEM8zhtnmAVvYcG7a0Rpp2f+q9PoBI1Of1L4Jg?=
 =?iso-8859-1?Q?l9cNBRbex2ll+tD1WFijKkU+iaNqaM9mhJfx6LTNxZoJarQV/6KmbXOa/k?=
 =?iso-8859-1?Q?cJyp5xDkLBI5ANMVCVRM+wfmkRSPmB83eTsr8+6Q6xxKdoFW6pFGpWp+Lb?=
 =?iso-8859-1?Q?GzLeipJU/Y6BlwF4MC1Rp+KrJYZvp5JzXDVgc2VtwMf+lSehKua+8UfAZe?=
 =?iso-8859-1?Q?JTDVnd1uRzqaphSndAOXM8hj5f0kcPRo6c9/xSIQmWlCoqtydwnNpnW1SI?=
 =?iso-8859-1?Q?jVny9/8TH/5cXBMulGWsHY9WrNxs2pF0H2UN/6xkRzcbv3fc4S9QsxNdHh?=
 =?iso-8859-1?Q?GKolpxvQulTRVwoW0K9csY/qq7YjQzXiFdoULDme8k42st1ek1JLhZ/m6C?=
 =?iso-8859-1?Q?HTTRDXg/MxgkxH55RfsR+ps95Ixfwt8fkQf1Luwrk7lviiHdmgmThKHZ5/?=
 =?iso-8859-1?Q?X5NwFPVozgwUDY9t0q/vA65dQKrI/0EnkDbIgOElxS2eoB7aa/ggSGoJnv?=
 =?iso-8859-1?Q?o0+NPxg9p2Ws6woLvoI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76dc3b76-9e67-4277-8658-08d99fe2f740
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2021 22:32:20.8784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vtz5rXzr+Vn/qkEO4+wseegIqVztU/Or35WMRwszsG+XckCRoQQCHPWDXSA3y2nek2L2wAl67jg40w25wvXC3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7531
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SENDGRID_REDIR=0.001, SPF_HELO_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity is getting confused here.  The index can never actually overflow. =
 Does Coverity have a pragma or something to tell it it's OK?

The loop nest in question is (the index must be < 128)
    for (int offset =3D 1; offset < 128; offset <<=3D 1) {
        for (int k =3D 0; k < 128; k++) {
            if (!(k & offset)) {
                swap(vector1.ub[k], vector0.ub[k + offset]);
            }
        }
    }
Basically, it's looking for elements to swap, and the "if (!(k & offset))" =
prevents "k + offset" from overflowing.

Thanks,
Taylor

-----Original Message-----
From: scan-admin@coverity.com <scan-admin@coverity.com>=20
Sent: Thursday, November 4, 2021 4:08 PM
To: Taylor Simpson <tsimpson@quicinc.com>
Subject: New Defects reported by Coverity Scan for QEMU

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

Hi,

Please find the latest report on new defect(s) introduced to QEMU found wit=
h Coverity Scan.

4 new defect(s) introduced to QEMU found with Coverity Scan.


New defect(s) Reported-by: Coverity Scan Showing 4 of 4 defect(s)


** CID 1465283:    (OVERRUN)
/target/hexagon/helper_funcs_generated.c.inc: 12539 in helper_V6_vshuffvdd(=
)
/target/hexagon/helper_funcs_generated.c.inc: 12539 in helper_V6_vshuffvdd(=
)


___________________________________________________________________________=
_____________________________
*** CID 1465283:    (OVERRUN)
/target/hexagon/helper_funcs_generated.c.inc: 12539 in helper_V6_vshuffvdd(=
)
12533     void HELPER(V6_vshuffvdd)(CPUHexagonState *env, void *VddV_void, =
void *VuV_void, void *VvV_void, int32_t RtV)
12534     {
12535         uint32_t slot __attribute__((unused)) =3D 4;
12536         /* VddV is *(MMVectorPair *))VddV_void) */
12537         /* VuV is *(MMVector *)(VuV_void) */
12538         /* VvV is *(MMVector *)(VvV_void) */
>>>     CID 1465283:    (OVERRUN)
>>>     Overrunning array "((MMVectorPair *)VddV_void)->v[0].ub" of 128 byt=
es at byte offset 128 using index "k + offset" (which evaluates to 128).
12539         { fHIDE(int offset;) VddV.v[0] =3D VvV; VddV.v[1] =3D VuV; fo=
r (offset=3D1; offset<fVBYTES(); offset<<=3D1) { if ( RtV & offset) { fHIDE=
(int k;) fVFOREACH(8, k) { if (!( k & offset)) { fSWAPB(VddV.v[1].ub[k], Vd=
dV.v[0].ub[k+offset]); } } } } }
12540     }
12541
12542     void HELPER(V6_vdeal)(CPUHexagonState *env, void *VyV_void, void =
*VxV_void, int32_t RtV)
12543     {
12544         uint32_t slot __attribute__((unused)) =3D 4;
/target/hexagon/helper_funcs_generated.c.inc: 12539 in helper_V6_vshuffvdd(=
)
12533     void HELPER(V6_vshuffvdd)(CPUHexagonState *env, void *VddV_void, =
void *VuV_void, void *VvV_void, int32_t RtV)
12534     {
12535         uint32_t slot __attribute__((unused)) =3D 4;
12536         /* VddV is *(MMVectorPair *))VddV_void) */
12537         /* VuV is *(MMVector *)(VuV_void) */
12538         /* VvV is *(MMVector *)(VvV_void) */
>>>     CID 1465283:    (OVERRUN)
>>>     Overrunning array "((MMVectorPair *)VddV_void)->v[0].ub" of 128 byt=
es at byte offset 128 using index "k + offset" (which evaluates to 128).
12539         { fHIDE(int offset;) VddV.v[0] =3D VvV; VddV.v[1] =3D VuV; fo=
r (offset=3D1; offset<fVBYTES(); offset<<=3D1) { if ( RtV & offset) { fHIDE=
(int k;) fVFOREACH(8, k) { if (!( k & offset)) { fSWAPB(VddV.v[1].ub[k], Vd=
dV.v[0].ub[k+offset]); } } } } }
12540     }
12541
12542     void HELPER(V6_vdeal)(CPUHexagonState *env, void *VyV_void, void =
*VxV_void, int32_t RtV)
12543     {
12544         uint32_t slot __attribute__((unused)) =3D 4;

** CID 1465282:    (OVERRUN)
/target/hexagon/helper_funcs_generated.c.inc: 12547 in helper_V6_vdeal()
/target/hexagon/helper_funcs_generated.c.inc: 12547 in helper_V6_vdeal()


___________________________________________________________________________=
_____________________________
*** CID 1465282:    (OVERRUN)
/target/hexagon/helper_funcs_generated.c.inc: 12547 in helper_V6_vdeal()
12541
12542     void HELPER(V6_vdeal)(CPUHexagonState *env, void *VyV_void, void =
*VxV_void, int32_t RtV)
12543     {
12544         uint32_t slot __attribute__((unused)) =3D 4;
12545         /* VyV is *(MMVector *)(VyV_void) */
12546         /* VxV is *(MMVector *)(VxV_void) */
>>>     CID 1465282:    (OVERRUN)
>>>     Overrunning array "((MMVector *)VxV_void)->ub" of 128 bytes at byte=
 offset 191 using index "k + offset" (which evaluates to 191).
12547         { fHIDE(int offset;) for (offset=3DfVBYTES()>>1; offset>0; of=
fset>>=3D1) { if ( RtV & offset) { fHIDE(int k;) fVFOREACH(8, k) { if (!( k=
 & offset)) { fSWAPB(VyV.ub[k], VxV.ub[k+offset]); } } } } }
12548     }
12549
12550     void HELPER(V6_vdealvdd)(CPUHexagonState *env, void *VddV_void, v=
oid *VuV_void, void *VvV_void, int32_t RtV)
12551     {
12552         uint32_t slot __attribute__((unused)) =3D 4;
/target/hexagon/helper_funcs_generated.c.inc: 12547 in helper_V6_vdeal()
12541
12542     void HELPER(V6_vdeal)(CPUHexagonState *env, void *VyV_void, void =
*VxV_void, int32_t RtV)
12543     {
12544         uint32_t slot __attribute__((unused)) =3D 4;
12545         /* VyV is *(MMVector *)(VyV_void) */
12546         /* VxV is *(MMVector *)(VxV_void) */
>>>     CID 1465282:    (OVERRUN)
>>>     Overrunning array "((MMVector *)VxV_void)->ub" of 128 bytes at byte=
 offset 191 using index "k + offset" (which evaluates to 191).
12547         { fHIDE(int offset;) for (offset=3DfVBYTES()>>1; offset>0; of=
fset>>=3D1) { if ( RtV & offset) { fHIDE(int k;) fVFOREACH(8, k) { if (!( k=
 & offset)) { fSWAPB(VyV.ub[k], VxV.ub[k+offset]); } } } } }
12548     }
12549
12550     void HELPER(V6_vdealvdd)(CPUHexagonState *env, void *VddV_void, v=
oid *VuV_void, void *VvV_void, int32_t RtV)
12551     {
12552         uint32_t slot __attribute__((unused)) =3D 4;

** CID 1465281:    (OVERRUN)
/target/hexagon/helper_funcs_generated.c.inc: 12556 in helper_V6_vdealvdd()
/target/hexagon/helper_funcs_generated.c.inc: 12556 in helper_V6_vdealvdd()


___________________________________________________________________________=
_____________________________
*** CID 1465281:    (OVERRUN)
/target/hexagon/helper_funcs_generated.c.inc: 12556 in helper_V6_vdealvdd()
12550     void HELPER(V6_vdealvdd)(CPUHexagonState *env, void *VddV_void, v=
oid *VuV_void, void *VvV_void, int32_t RtV)
12551     {
12552         uint32_t slot __attribute__((unused)) =3D 4;
12553         /* VddV is *(MMVectorPair *))VddV_void) */
12554         /* VuV is *(MMVector *)(VuV_void) */
12555         /* VvV is *(MMVector *)(VvV_void) */
>>>     CID 1465281:    (OVERRUN)
>>>     Overrunning array "((MMVectorPair *)VddV_void)->v[0].ub" of 128 byt=
es at byte offset 191 using index "k + offset" (which evaluates to 191).
12556         { fHIDE(int offset;) VddV.v[0] =3D VvV; VddV.v[1] =3D VuV; fo=
r (offset=3DfVBYTES()>>1; offset>0; offset>>=3D1) { if ( RtV & offset) { fH=
IDE(int k;) fVFOREACH(8, k) { if (!( k & offset)) { fSWAPB(VddV.v[1].ub[k],=
 VddV.v[0].ub[k+offset]); } } } } }
12557     }
12558
12559     void HELPER(V6_vshufoeh)(CPUHexagonState *env, void *VddV_void, v=
oid *VuV_void, void *VvV_void)
12560     {
12561         uint32_t slot __attribute__((unused)) =3D 4;
/target/hexagon/helper_funcs_generated.c.inc: 12556 in helper_V6_vdealvdd()
12550     void HELPER(V6_vdealvdd)(CPUHexagonState *env, void *VddV_void, v=
oid *VuV_void, void *VvV_void, int32_t RtV)
12551     {
12552         uint32_t slot __attribute__((unused)) =3D 4;
12553         /* VddV is *(MMVectorPair *))VddV_void) */
12554         /* VuV is *(MMVector *)(VuV_void) */
12555         /* VvV is *(MMVector *)(VvV_void) */
>>>     CID 1465281:    (OVERRUN)
>>>     Overrunning array "((MMVectorPair *)VddV_void)->v[0].ub" of 128 byt=
es at byte offset 191 using index "k + offset" (which evaluates to 191).
12556         { fHIDE(int offset;) VddV.v[0] =3D VvV; VddV.v[1] =3D VuV; fo=
r (offset=3DfVBYTES()>>1; offset>0; offset>>=3D1) { if ( RtV & offset) { fH=
IDE(int k;) fVFOREACH(8, k) { if (!( k & offset)) { fSWAPB(VddV.v[1].ub[k],=
 VddV.v[0].ub[k+offset]); } } } } }
12557     }
12558
12559     void HELPER(V6_vshufoeh)(CPUHexagonState *env, void *VddV_void, v=
oid *VuV_void, void *VvV_void)
12560     {
12561         uint32_t slot __attribute__((unused)) =3D 4;

** CID 1465280:    (OVERRUN)
/target/hexagon/helper_funcs_generated.c.inc: 12530 in helper_V6_vshuff()
/target/hexagon/helper_funcs_generated.c.inc: 12530 in helper_V6_vshuff()


___________________________________________________________________________=
_____________________________
*** CID 1465280:    (OVERRUN)
/target/hexagon/helper_funcs_generated.c.inc: 12530 in helper_V6_vshuff()
12524
12525     void HELPER(V6_vshuff)(CPUHexagonState *env, void *VyV_void, void=
 *VxV_void, int32_t RtV)
12526     {
12527         uint32_t slot __attribute__((unused)) =3D 4;
12528         /* VyV is *(MMVector *)(VyV_void) */
12529         /* VxV is *(MMVector *)(VxV_void) */
>>>     CID 1465280:    (OVERRUN)
>>>     Overrunning array "((MMVector *)VxV_void)->ub" of 128 bytes at byte=
 offset 128 using index "k + offset" (which evaluates to 128).
12530         { fHIDE(int offset;) for (offset=3D1; offset<fVBYTES(); offse=
t<<=3D1) { if ( RtV & offset) { fHIDE(int k;) fVFOREACH(8, k) { if (!( k & =
offset)) { fSWAPB(VyV.ub[k], VxV.ub[k+offset]); } } } } }
12531     }
12532
12533     void HELPER(V6_vshuffvdd)(CPUHexagonState *env, void *VddV_void, =
void *VuV_void, void *VvV_void, int32_t RtV)
12534     {
12535         uint32_t slot __attribute__((unused)) =3D 4;
/target/hexagon/helper_funcs_generated.c.inc: 12530 in helper_V6_vshuff()
12524
12525     void HELPER(V6_vshuff)(CPUHexagonState *env, void *VyV_void, void=
 *VxV_void, int32_t RtV)
12526     {
12527         uint32_t slot __attribute__((unused)) =3D 4;
12528         /* VyV is *(MMVector *)(VyV_void) */
12529         /* VxV is *(MMVector *)(VxV_void) */
>>>     CID 1465280:    (OVERRUN)
>>>     Overrunning array "((MMVector *)VxV_void)->ub" of 128 bytes at byte=
 offset 128 using index "k + offset" (which evaluates to 128).
12530         { fHIDE(int offset;) for (offset=3D1; offset<fVBYTES(); offse=
t<<=3D1) { if ( RtV & offset) { fHIDE(int k;) fVFOREACH(8, k) { if (!( k & =
offset)) { fSWAPB(VyV.ub[k], VxV.ub[k+offset]); } } } } }
12531     }
12532
12533     void HELPER(V6_vshuffvdd)(CPUHexagonState *env, void *VddV_void, =
void *VuV_void, void *VvV_void, int32_t RtV)
12534     {
12535         uint32_t slot __attribute__((unused)) =3D 4;


___________________________________________________________________________=
_____________________________
To view the defects in Coverity Scan visit, https://u15810271.ct.sendgrid.n=
et/ls/click?upn=3DHRESupC-2F2Czv4BOaCWWCy7my0P0qcxCbhZ31OYv50yrzEQNXe51mg-2=
FlKoEnRoarMq5nOxxfhqLUuo8HvG2S4Ew-3D-3DWlA7_8inUyGh-2BW1HT32W32IvBHxb7aFSEd=
SRWGNQjOj6Pu5XN1yTi5xRqR-2FauzTzQ8TTCMynbzlKK38dd4vnBgBOISaYuCt2P2K4Nr-2BQr=
wIRxT6vP6cSps-2FKfJeDwWOYjfHKEOE-2B37NVXcSeHy1g85Xu96TxRZSAMYgPybtVUE7VaHkt=
MnSyFARcHi5Smh-2BOt7C17iCCDe0sIJueOT9wnUDuhhw-3D-3D

  To manage Coverity Scan email notifications for "tsimpson@quicinc.com", c=
lick https://u15810271.ct.sendgrid.net/ls/click?upn=3DHRESupC-2F2Czv4BOaCWW=
Cy7my0P0qcxCbhZ31OYv50yped04pjJnmXOsUBtKYNIXxhog3V-2Bya4sYLKnckU-2FWJNYoLyk=
5CFNN4-2FzXAhh2yQgYkIiZFhMvotFhFxZUytWoxPeX55igX3u7EjcDuJbLuFws0HNjzT5-2FUb=
fBZiYi6yb8-3DVX4C_8inUyGh-2BW1HT32W32IvBHxb7aFSEdSRWGNQjOj6Pu5XN1yTi5xRqR-2=
FauzTzQ8TTCw-2FEqvaCcduK-2Fu0844eqQecio6W8FxY0JZVtlm0PPIP0AD11nL4sJi3gMc9nH=
HjGJSV9SIW-2B2UfY06pXWi-2BYos8wCxnEOUkZNMcTI-2BiUeK3HF1W2QdnwXTO58IHvsG3MEA=
qdq9-2BESzEdEojR94qp3ZA-3D-3D


