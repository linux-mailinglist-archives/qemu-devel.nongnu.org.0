Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E68A6C3C2E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 21:49:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peiuu-0008Jg-2Z; Tue, 21 Mar 2023 16:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1peiui-0008Es-KQ
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 16:49:02 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1peiug-0000LF-O8
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 16:49:00 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32LJ6Raq027083; Tue, 21 Mar 2023 20:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=9R8TKatO0mzbyrugGVCFLdR/G15NA4NpSQw/tA0AjWQ=;
 b=BN3DxFZzkIUogGNV2pQYAkb1D7jyRoU9Wyj9pfbg6+ijpy6J+kN+S9Ss8/W6p8F7HNAr
 /PF7UuMtFnukrZd3h+RbvTv5n8NpNUTVc0fK5BRGwrwFg0RglQTlG84lATHX75IjzxL3
 BrNDlIl1mZX6HOqG0YfQDgGiAzrphISbh9g2HKG61g8I5e2s5+VTsnXixzxXk2pYHLva
 4zmYy5eHkTdOWfe8S9efhmw8ajzXZmQMfO14pd81nhwI0ggM0l62JT61RYsr74jSywbv
 DjvcsPeF3i07JYhDaF9gKdQMgeAtshXeAlRGC8Dh3ypBclZOj2Gp8Ff3hQsgrAP7MRUW nA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pfbx01jgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Mar 2023 20:48:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOqNP90dRE6g5PlaobU2sBksR6e5xv8kiv8fFlr405jHV7A+wwzhKhsscTrcpeWhLvWyxcyk7/h006NgVyT6hj8/WCc81P4O8zXdJC1y0Mz1GVBlX+M0QUmE17ZdDJ9GZ6B1XSjJIcKm09lTeiXvQgATaEAMCv/ZTzYC60V8VW7YgOEaWKyyuvLiOWtS/O06RXotdOSUL3CEjr3pUPP68nHv4opgkX6VUvmSOu8QScSQFkYRsLUzlXHlNu8AtoFxI+mKz+6MrtUU01v/fOaAtuqVIcshXX4giMv4acpa8lnGzXabzqqr2LlrCPmy8xROh6pq4UR6FNPoYdtoZ8XtDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9R8TKatO0mzbyrugGVCFLdR/G15NA4NpSQw/tA0AjWQ=;
 b=CY3NGb8sOQAYNxbKDeJPa/E1ujL4kSVIZKAJl402IwtqPEgHSO4OX9dUy9FyKu2slQHIJuUcpCEjpGoM88abbtCA6qYy67IvssjSwjDj3REYzI7Ampmx++jfXYBWYteGyJ6M+hs2phUuxxMLDcZ1sc3tahpNftqNqlRA6W1FwiYiRF4LDpwpBIXokp/Q1LQqOo+0B4P+QOUjnQV9l2IfzE5GnMrMoRLl65wygZmEPCDcEm6zaDvt5PduzKO6ByCi5x31Q+1I8XuonFX1W0CwFFL6lfIXRSAOOK3QpuRgpoIbJK/8MRrl0nTj5FFVL6Owm5SImsodD5lg42+9WH3ZgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BN0PR02MB8269.namprd02.prod.outlook.com
 (2603:10b6:408:158::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:48:53 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6178.036; Tue, 21 Mar 2023
 20:48:52 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Marco Liebel (QUIC)" <quic_mliebel@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, =?iso-8859-1?Q?Daniel_P_=2E_Berrang=E9?=
 <berrange@redhat.com>
Subject: RE: [PATCH v3 1/2] Use f-strings in python scripts
Thread-Topic: [PATCH v3 1/2] Use f-strings in python scripts
Thread-Index: AQHZWw5aXE2wmfpnNki1Tr34Q17I2a8Fpamw
Date: Tue, 21 Mar 2023 20:48:52 +0000
Message-ID: <SN4PR0201MB8808C633E5A0358C98F77FB6DE819@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230320092533.2859433-1-quic_mliebel@quicinc.com>
 <20230320092533.2859433-2-quic_mliebel@quicinc.com>
In-Reply-To: <20230320092533.2859433-2-quic_mliebel@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BN0PR02MB8269:EE_
x-ms-office365-filtering-correlation-id: bf9802f0-01e4-438b-fb1b-08db2a4dae49
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YNFjF9mEp8GX/Oms5LqvLWLGlxJAlZwqrd5eyHwlXU/TD3xQCJalGJg44cSvWr9YfFVIC8S6S20uyYOmEqC4OM4eKx4JkCCyaU7GTqQy++e67mMYBhl8Nfzrw23+iwr0NmxxdgN+lT2uFL7WhoU3YJCi6xC6+RhEMstpyJDFjYXouNzwHhzwVsMLbm2Zq2ylRILxtvZS9Nix2zsEOP4PGTiIm30/oykdW9nSCibWCRPPLL8fXNH0AMkAbvkTaYYboHKFnBsO6ZlugmsWh4V/ICfMeRCIF0ghjOolmV7511fyr0iKi6RQZP2FJBpzUcV+o8MOdyZq74QUZSXUOkwudNl+Kb+kk4pPQ6kT/HiyrhLAqjkf2jnSbBMqtwyxdNug1q+/BmlkMpXa0u8UNLLnQOeydBfivmpF0qqPIm8AneXunKsLx6FThL3DFD4HkMbuacZai6Ypjwk+jov/hZXJMHkJofpise8t5Cg5PfJWommL7vkZoHrV8HFbPHI5Ty/FTFtZyBMCxLfSYj2BLtXcrs92jEBEIeDCe6+cOTlEohNdtDz/pYDQQdz1WyyG2meSZr18oeyWJSZwq2OV5csuSdbpDNS2301nnEjkm4RRbHk0kmfo/Y/mlZjxAM2awuo5qlYpaLNw+sH7bYgXT9pUzKD5z7sz8OvRjaiBCh+QY3ufUsCX4RNA7rNJvmu6YKdL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199018)(7696005)(83380400001)(54906003)(86362001)(38100700002)(38070700005)(55016003)(122000001)(110136005)(8936002)(64756008)(66476007)(66556008)(66446008)(8676002)(4326008)(2906002)(66946007)(52536014)(76116006)(41300700001)(71200400001)(5660300002)(9686003)(6506007)(53546011)(33656002)(26005)(478600001)(316002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7kCObrAVESzpkQrWnNvw5dBSgzxM3KtkZdZOEaW5qG+m33uRXy5Nx7zmLE?=
 =?iso-8859-1?Q?fCkGKzW8lhFVA8zoedzwdPe/G+6ZlQOWwUnKG6tyEGggRiFJoPCU6Z1q1G?=
 =?iso-8859-1?Q?srBefSID2ZBaMk0eGj+QINTOyNSoBUl0O1J/vneMye6z76SkkjLiuY8nwb?=
 =?iso-8859-1?Q?Z/LvCmJagsGbzTAAkX7GvfTV1uioJdaNm7NOhws9V7cvLJoiy/pA3Y+CtG?=
 =?iso-8859-1?Q?WwHmNssWzMLFO45Q/Z1twwuiQLyoul3SQKnrD1AUKZ/92Bc1RYFpejpuIK?=
 =?iso-8859-1?Q?2R9nmNAzs5aH5U/+IDsgmibcGmF3WeRbom2umDpe/C79tuN79t7EgjK/U8?=
 =?iso-8859-1?Q?IeQXkXuJSyl37spAcClGsB0zEwF1Dup5iodQ4bT9h0haQjU7IAtnYLH98K?=
 =?iso-8859-1?Q?yXT5MfVv++H5fWxBEQLhBrWvhLGv3rNgqaPmxeUhRaj3kQ13vUcNZiWTba?=
 =?iso-8859-1?Q?4v2WJOwiUQ3k1c42PHKDtPNOQmEV4pNkGMwDyevfIfYW8SUkU6u5QIcrvG?=
 =?iso-8859-1?Q?qhR1YmqlVouRUPtPjI7O1SwT88k0JuwBrIi7ReUBUMVezG6gXJUAlX7RbU?=
 =?iso-8859-1?Q?hczBqXQSnLTU+XXCN/6LNA2457EUqWGVaTS2Rads8p4F/CbJVGordKzluw?=
 =?iso-8859-1?Q?8p6kQF7vCUG5WwsU5++Rag2Dwpc4dpCRMUApyql6eJUwRIaHG6VLWjHuRc?=
 =?iso-8859-1?Q?UoV4kDXs7sXpgLEZrt5f39o/tZ+n5HlarY+jPR/qNVf0qELc/zoR2zYfOL?=
 =?iso-8859-1?Q?aySFFE+NNKZhOObTZ4AKB02TxLxDR1f0pG251mKzhDmb4i94eTkRvpaJyi?=
 =?iso-8859-1?Q?T+RkE0O/sieT6iuvhMd1UrkvmbsSZJ3HekPzwvb49lCwGCroiJ0Vbct9+t?=
 =?iso-8859-1?Q?Om+fQwOUDx5ozDHv86ho/iAVhjU4glFmcESvKWURSkzPsiih44Uo/AtCmk?=
 =?iso-8859-1?Q?An3I+znKiR0UHJafzyxjP0L79TguyB2sFTmuD+tluAC7KRgbYwF8fqeVBT?=
 =?iso-8859-1?Q?a4y6d5hwzdwuNbymQlxUv/5puxKQTah6M9hSO0CM6XQHbqxgoIv4EaIGUg?=
 =?iso-8859-1?Q?QES+H7TQd6A2sGnrR9KdS61Py4DqvWn3JIL+6Kn6k4ok71LeaodaFBPDBs?=
 =?iso-8859-1?Q?sWiRrbZgwhKR0zghSePljqst4w2DWObZRDHAEllCrFXOwbxNpqj8D6mLvX?=
 =?iso-8859-1?Q?2YRzLNnExHZXK2QVUoA9bzo2erQ1AGcld2a6CDYCUbfpBcnFO4Cr5QQ/fy?=
 =?iso-8859-1?Q?3SlRwphm4qexazfIdUw/GdQYzLuxwzTwInH4bkkZUpUj2tQ8aRFBFtBFDM?=
 =?iso-8859-1?Q?k9WQ90N2DzK+gfmTyzlQBkk2cHkKhQx/xHZATGJvfirsYn6dewtcIn/EcX?=
 =?iso-8859-1?Q?jx8sPyVvGyKPLdEZiP1xhXlN6cF0G4OIHLKPtOsZfxPWhBQoi7GY6i7cGd?=
 =?iso-8859-1?Q?njLMbJ1WZOyQco8HYgGjdR9t+ogdbfja6eEbI0Dg5ole3qMah4cZwiNSZo?=
 =?iso-8859-1?Q?iBXZXJt9HPwx77UfU5Pe+QpSsJSOsxjbk9R7qPs09dun0PKy/jC0WxZqyR?=
 =?iso-8859-1?Q?yWNSz9akHRI8T8ML40LLW0jfDyM63YBZ+njvSvnI41qIEJ3VCnshdM26W4?=
 =?iso-8859-1?Q?sqSEQNxGEnNs9rhkokXwlsiIxvhuVRBsbw?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: P13Q1wN3qyy3G4r/wdJHt6HAu82tdm+kAM7JnJnp4JNTVTV3d0oVCV1MKgfx1Lek+4OTKJ623PX/6pdogNwVjByKRLWl6UVR3MFWN1AnjZmbspXL/HyQ0q284pjolgoO0UQWUQ1hecfwrq6un1/TUK4znh8L3tXdyBpZ5JwtsUgEi89CF8cXH1w0LTnfoNkNdaFCR4e7IcKZHZALQVlWPUezaZrfLWRTqn8lZ1t5SCNQeaxpMtKsN//YI/G17zA3w3md9Q6/vIk5BYIk1mDHrK5RqG2YgOM9c1HfTHF9T6yuCeW1DtNFPH34l+BG22HBjPdH/JM5DMxThKBTcZT1hJfYProyQTBaNdTUSEpONEoBK8mZvgTGDtRpzvDf0w8jHTBCJSq28S6chNCasExwp9X/3SArQ7Uh/kBTIiK2kA57zGYWmomgnHecp0J3X6lBMKk/7xQQrIxI+uX8JEOXJk/4CU2+Sa2vCSHBhOJRohjXPK/3Wc4ksYpVZ3KoZNE3CGmTR8v8ut1dDP+n8Br653Amp82nHPbEKJUduKBTnF/JzHnD0xcSCBblbaKfDf5QwesxbGTxwq/KteUrqhFdkr/HNX2u3Z2mSmy2Ywx0EwWKbrpCZBhe2W+9VtN+S8/0fvliB2YuefcDJV76MY+8T8rYFunqSGpXaz3M0XMzkQnxPu5CBEZIgbFOkY0bwv1rGLND0hoj7uRkbPQhBeaPgEyasx/PGPDsl9lJ2gNJJAx5Gn2V2dg1X2uHQDHxdbeow4ch4QiGDNWRNKEfcTSNPLMEwXtVXg3GfhTTz5L0SVw/PWku32SMvinknfheXoT3TNK10dZ0bga3Royc7GWuhQ==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9802f0-01e4-438b-fb1b-08db2a4dae49
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2023 20:48:52.7677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UTxjnB3QOJRIzjJ91w9+ALgfGgO9HOPp8oOQNdd4GJK8dz+i2IL1NNwPcQsvlpMN5MftKNdf2FAOQHZ/4pKSvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8269
X-Proofpoint-GUID: tqMVse0avZgp0LmdWnOVs3pqwOeohOo8
X-Proofpoint-ORIG-GUID: tqMVse0avZgp0LmdWnOVs3pqwOeohOo8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 mlxlogscore=835 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303210165
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Marco Liebel (QUIC) <quic_mliebel@quicinc.com>
> Sent: Monday, March 20, 2023 3:26 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Philippe Mathieu-Daud=E9
> <philmd@linaro.org>; Markus Armbruster <armbru@redhat.com>; Daniel P .
> Berrang=E9 <berrange@redhat.com>; Marco Liebel (QUIC)
> <quic_mliebel@quicinc.com>
> Subject: [PATCH v3 1/2] Use f-strings in python scripts
>=20
> Replace python 2 format string with f-strings
>=20
> Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
> ---
>  target/hexagon/gen_analyze_funcs.py     | 115 ++++-----
>  target/hexagon/gen_helper_funcs.py      |  54 ++--
>  target/hexagon/gen_helper_protos.py     |  10 +-
>  target/hexagon/gen_idef_parser_funcs.py |   8 +-
>  target/hexagon/gen_op_attribs.py        |   4 +-
>  target/hexagon/gen_op_regs.py           |  10 +-
>  target/hexagon/gen_opcodes_def.py       |   2 +-
>  target/hexagon/gen_printinsn.py         |  14 +-
>  target/hexagon/gen_shortcode.py         |   2 +-
>  target/hexagon/gen_tcg_func_table.py    |   2 +-
>  target/hexagon/gen_tcg_funcs.py         | 317 +++++++++++-------------
>  target/hexagon/hex_common.py            |   4 +-
>  12 files changed, 243 insertions(+), 299 deletions(-)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Tested-by: Taylor Simpson <tsimpson@quicinc.com>


