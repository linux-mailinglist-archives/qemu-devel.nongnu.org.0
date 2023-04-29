Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2716F25FA
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 21:29:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psqEI-0001gJ-NQ; Sat, 29 Apr 2023 15:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1psqEG-0001fp-CS
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 15:27:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1psqEE-0002Zy-KS
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 15:27:32 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33TJNVoc013771; Sat, 29 Apr 2023 19:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=elZbx9Mn9bukepx6HqFOOeONAu9QigDgDBG81CtHRQY=;
 b=YiKvuBwvQw+6pF0cy7Kiyt2vqgbC1mfrdst24Tn4ZN0PPyJazzqBggmvpSzg0FRQcjM9
 EL2JEHuHCWBeJLY2scuZIOLqJljr0laFblp0fu9lhUBRa46Z9RXMv6aM8gFibwS7SwQc
 futFdaOD6WcShRFGvOnXVgoFpFkBO6ekmywbkGUqK2wZoklVs7hDKlx83+7A5/cpyTwg
 pppoiWjXxu625I1Xy+fWe20i+ez/ATrL7HIsHbHhmKmFYj4cb8jXRkNPl0Napfn245Lk
 RfvVevxcnu+WWNX0FoHKbW7pbdOTK4MFi4ffVhoaS069noSQBVgnT3elJQCFLbr+VKIi dQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q8vhgrxh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Apr 2023 19:27:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDAHjqCaB9+QUSx5tkMP3jE735tQoueGglXnJgrj/inQob6/pdLOz1NyJCR93voXM97ZnxzuNC8EToFmbhH38Lskn8pqNTtIHqeaMTu/Q9Bg6xK6r5dqiI9vdPTI5YZ+Teuj9SUQySQKB7Be6S2WpCOTbh8I4zRURp04lM0QXBywCoOYiGdGj4x+jOwps6HI3lRxlto0midEHuKDrjQy1v7w2SkIRdaGNpjH88UjkpRH+aCRwlT3ack4RH3U1tYgswPPDJc1by7tES8+FH7bPf143F/AS+71+2RCzy2Ce8urleGy5ES3cAApzNxeeAF3GTs3UEzFWfAQASwV2mL2Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elZbx9Mn9bukepx6HqFOOeONAu9QigDgDBG81CtHRQY=;
 b=THlV97JLlcP4RBT3J1Uu2yCIRA9UCKGReSMxmdjg0OLinhWgNnK/yuNZ5EdTlQTfs2IHwucpjJAYcJPP1so47TB+zE5p77h7h3UuOjCdCN2MLYkO/Wq8dnli6KwDh+60SGC8bq+9r8GBNudmCHrv8m7tRS/jI+E14bD2HRq0fQXlgkH6EB/lo9tiDIITzC68QX4lIF/DPLlSH52dJSH4venEYxzQojFqTHLE74VTirl1JDNdtVHQHjEOY5JMD5BtWWqOKdEkijc5U58eo1kYTTVD9MCZ7I6YZIhkl/0WzSFcK/NmFkOt+gZGQiRFOa3QSrhYYCszAP2MUKhkTVPa8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CO6PR02MB7697.namprd02.prod.outlook.com
 (2603:10b6:303:ad::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.27; Sat, 29 Apr
 2023 19:27:21 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6319.032; Sat, 29 Apr 2023
 19:27:21 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>, "Matheus
 Bernardino (QUIC)" <quic_mathbern@quicinc.com>
Subject: RE: [PATCH v2] target/hexagon: fix = vs. == mishap
Thread-Topic: [PATCH v2] target/hexagon: fix = vs. == mishap
Thread-Index: AQHZehI0/lp26rY7mUa8z/4m9gE98a9CNqsAgAB2VNA=
Date: Sat, 29 Apr 2023 19:27:20 +0000
Message-ID: <SN4PR0201MB88089F9BD086FF728E22DAB4DE689@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230428204411.1400931-1-tsimpson@quicinc.com>
 <e00e814a-53ac-df6b-44a2-ea1fda4e20ba@redhat.com>
In-Reply-To: <e00e814a-53ac-df6b-44a2-ea1fda4e20ba@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|CO6PR02MB7697:EE_
x-ms-office365-filtering-correlation-id: 6873f195-76cc-4061-de9f-08db48e7c09a
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ah9aRfsf+0nTVxjugcpdLZbLhfLNjU/TtIsPs0CytowbiSqtkHuTyYleLpjJoiTnj2P1StcIui2fColkizLsRwyOe4tg28DpxATl5c2LmfNQ+ZNJFJQ3oMfPonLhqIf6gTO3Y7pfrvEt1EQaexm6bKLswmYv1PPMVLLYzsq9SdbmN1kvGwCjPjlx2sR+Ns1EDF50ZFbMn2jlCuJZL6sp/5gG5vYohXABD5KcQOLGsP9DLb4qIztdXcSR72f+JfpSraYNDxQgp6w64PI0CC7fXBN5XpGtuRmyj2pHjtns0llTJsHrDYsGabyFE0n+JP7bHtxfETXcxBic3RiwpGgvT7yLQozF/tgfr636rMazRJMok6C3/bY2MjpEP6Vxj4rHEobjFg8xSWYCih8XqhMunbp43LS2Lb2oczTFSjdKRB/hlH6WWTqmhk8Kj1C6+E49vEsATf8mk3NklhsW0dp++U1tuY3yIAoIOuNz8Q4zsL9bPg+GIc7E9kVsCHqANC0vFDG+iKWDobdvD8nyUZW8oAFpvgmErf9L336V0K/LLYB6/kG2shtLimPNrmpTEW8V6KF5i2ZVMdcoMVWTAYs53vx107n91+GuquIPcfZc0cS86KSrBCD5HivG/zj36laz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199021)(71200400001)(7696005)(53546011)(9686003)(55016003)(33656002)(107886003)(6506007)(186003)(86362001)(52536014)(5660300002)(83380400001)(38100700002)(8676002)(8936002)(4744005)(2906002)(478600001)(110136005)(64756008)(66446008)(66556008)(66946007)(66476007)(76116006)(122000001)(41300700001)(316002)(54906003)(4326008)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1B6NGZZd1VsbHBuaU5VdEd0cGM4bTFEejg3bFY4b1YyUzZYaGpSS2l3clJY?=
 =?utf-8?B?bjRiMVk4NkR2Zmx0NHovK3J4L1ljVGlMUFRVZy9UT3JBV3dlaGQ5bVRyaURN?=
 =?utf-8?B?UUtQMmV6UVQ4OWF3VlEzUzdDVGZMUHA5c3lLZ0htSFBQOFhnWVFvNU1SSHlr?=
 =?utf-8?B?QXRvemk4bjVXTFZ4RmNJQnRaZlE2ZjJaa2hVY1RKSmhLYW15V3JjZ0ZkUThH?=
 =?utf-8?B?YzM0ZXE0VFl0aEVsUHpTZHYrRFZHNi9mRUpvWEhpYWdxWUdmSzI1UmZmWGtK?=
 =?utf-8?B?UHlhK3N0UWNVdjNWNy9VWHBSc2RQS2pCNkFuZHFFUmVZdjBHS3NQWlFrS0tx?=
 =?utf-8?B?UE5UTW9uM1N3ZldVTkRxSnRoL3FObVZOcUJEUlhINmZOa0hzWTRWdU03UjMy?=
 =?utf-8?B?N2ErK0MzNXJOeUMyS0xXQWpEaVRCcThMNGVGY2c3MFJiUGllQStkL1gxT3h2?=
 =?utf-8?B?VE5tQVhTMG45Ymp4cVdYc1BwdFMyRU5VY0MxbjJEQVpHMzBNamxnZkF1UVZL?=
 =?utf-8?B?K1IyZDdBNlRtdVdGaTlmMFJrbGkyUFJaOFZ1SkRPbEJjYlk5cjlOYzVDTitO?=
 =?utf-8?B?ZGhvZmF5SWRaK3BrNjhyNzVoUCtXTFhFMmEvSnB3SDFxYkJCeDFMK2hodnov?=
 =?utf-8?B?UmZia3VEMVZPeTVXdVNQNlhybTFOSjE2WjlUTndJdWhKSzlXNjlJREkxZ3dl?=
 =?utf-8?B?TlE5L2dBWk0wQ284SUpERGhBb3hlNUR5UGlnOTIvd1NMODZPeWoxRllxb0VZ?=
 =?utf-8?B?RnZ4amZJOERWQzIzc0Y4bUdqRVdZbHlvL29QdHZ2QWcwdUsraEZOaXJiRWZU?=
 =?utf-8?B?LzVxMThOcXdMdGtiRmd0Tnl3Qlp6T1phUTE5QkpMUVlkaGppMlYybXMrdjBv?=
 =?utf-8?B?UjFaTDZhSm1odXA4eVdMSDR1VXlpZ1FLa01mTzNEL1dvRjZQQmdaZUxwdSt2?=
 =?utf-8?B?VExCNk1zZ2dDcmRTZ1c5KzQ4dGZLWENhWWlIV1FuNGdQamNnS3lpVk4wZ3Bp?=
 =?utf-8?B?dE8rR1hSdHl0YXRwUTh4OFBCMkpNMGhaaWxpWEpaM1pLWXMxbXZ4SERVdUpU?=
 =?utf-8?B?c1NzQXh6ODVpeFoxcW1OOUpZMW93alJRRHFlTmpRWEgwcnRRVlh6SHJ1cE13?=
 =?utf-8?B?akF3d2MzTmdiWmRRZjJiUldTeWY2VXZ0VWhJYXM5clpUWHdSd09FM2hIejQw?=
 =?utf-8?B?aUNYYzFINXFpc2dJVGFaYXo0NUJ5bVFMWEFpZUZSTjNtTmx4TU15UnVTZTdJ?=
 =?utf-8?B?YXJZNy81VWdBNDlQcGZtK1k1aG9EbzlPa2dNWm1UWFRoL2dzK3JkeU5mdmlW?=
 =?utf-8?B?UWw4ZW94Q0NJUTlDUHpiY3F0VUpZVGQzV1IrYkc2NVVhZDkxSFRUMGthSXZx?=
 =?utf-8?B?RWJSdzlHOVA0Qy9VYjVXK2Z6WWRnZlk0cUkvZ1JCaWhReE01MDZRZWR3eGgw?=
 =?utf-8?B?VUtJV2MzWmtIczVoeG92UGtwVkNVY29ybFVWTEZEUlhmRS9nN2pjWXJTZGQz?=
 =?utf-8?B?eTN1VnFGb2xSbXdPWFMvYkVTTGJrTmw4b2dYRi9aT0lsYm54a1FUTFVROHBF?=
 =?utf-8?B?NXBGcHJCOUlqdmpOQTRvcFpER0NmdzFCNzYzeDZMalc4V1FQVnhlMzF1WkV5?=
 =?utf-8?B?N0pOWU5PYmg4d281NU42M2dhQlFEZ1FyaHlKTVpxNmJadWh0T3d5alExODJq?=
 =?utf-8?B?SGlUNDU0TkQrZTU2eThncW9qanY2NjJZMHEvU2ljRFN5NVk4VHAzQVY0QkF1?=
 =?utf-8?B?VXpwVVpLbk9RRWxFalNsdTFMWFVxS3RpYzRwTmtKT041VXZhMitPMnY0NWZh?=
 =?utf-8?B?OW1sVGNlR2FlNE55cVBWS0dBTUZtV0NBNW1LTjREU1pMUHloY2tQdWFrbG9j?=
 =?utf-8?B?dzJWa2dHNStlRzNyUjJlaU9KSDYrNngrM2cvZk12QktLOUYwZFMvZHlIbkVr?=
 =?utf-8?B?RDdQb3hOM21GZWhCVlY5dG8zbVNLTVFmRlV1Ty9Cd3FtaW1rbGpuSWhkWHpj?=
 =?utf-8?B?ci8zblNmVjBCTTlIc2NSSkIzM2tYRTRTalJQM0RLVERobW9yc0NhTTd4T0Jr?=
 =?utf-8?B?V3RiVmtKQm9ZaGR3ek9iR2RsRVVlSks2cG1OS0h6YWZERGQ4Wms0L2g5UHlW?=
 =?utf-8?B?TXFSQ3RQSG1zTnJnWjRkRThNY01XOVVPYUxNSzhyUDdhL0t3d3kyQVFnaW1U?=
 =?utf-8?Q?z3+HaFXEe6aREdLQItWXj97EhSQqY2zw48CJhoeYUyCl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: FuUU0dXLPOLyrcIfHgp55+Vsui8ldsVB9klYsMTLo6AQe5Iay9ngP7NcfY31S28FO8wb0EWYW7f2TaR0Gv4+ogCk+JRBNohokVnAwBN3KdIpv6fTc/cbfsDnI6GI9YKjOADW3SXuKUg7Pu5zVjJBlaqvD5pBoRFA2f4dv8geBNOOO30M1y0NG595N+LQEuGlagY9CI93psBier6P3rGr4aZhuIMZmUlYzi8gggJxwQTu5IdtJM1udaz1svWgdSBpr2wgWiURxTV93N6pniqr9vYn1B80d2UNJRc4Map1Xt+T+rgMnCGcwYnzWYIjGWJNcWGxRYxC3DM6MydE4SqqnTPxfRzG9kJaNaLzcD0L9lQln2oT7PWg8+W5kTrqvmiexDikcmr9Zv0DCXCus8zRdJresdFUgRdy+JkNBd0D/y0Few6grn7jZii44EGRFWJOXGF0Pe5YkULDKakZFIm447Wx5PFQBcbvmMPQdWWtv9m9iOmRH+TXG5vFPSrtUfEPzQDGJMNQZPb6V9Ou28Tioy5Eoc78ABdeNemQrjlficIgmbX8I2xMUNtMMy3UT+9Wqj9c9+DpiCbkzAHP1XO3d1Uqjhqbjiwe2CSZizd4AYGjZKSGWY5mMdbRdmh5PG2fbw/WtLha1rPJVfYYue5RAvCwSNwaC9g3ZY9/fpL8jCHvqC+VRk7WIRGtLz/gDVYMBViLs9FbA9PbT8A6Vn0nq+cmSBRCkjyZsNtLgCznGikfH/Q1cOfRiV87FFnyLPk12nHXaS0HX+9EJliGzHt7+C0156lTcUf6eF3lL9BJ0mqyPxC8IwlTmo/AZddG4Jbm58h72Xo/mCI2DUYRsny5/A==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6873f195-76cc-4061-de9f-08db48e7c09a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2023 19:27:20.9022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D2mG/RHLxjdsWBoyR1Nql2srK3H9tRfJFFhlCvH9+/lBqT5P6TSOwdsuzLPTb3zRJb20n3kNxSOurwCdQu1OBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7697
X-Proofpoint-GUID: 2iRdOOlnHXjaxoBy7I8MCSi_R1PWeaLA
X-Proofpoint-ORIG-GUID: 2iRdOOlnHXjaxoBy7I8MCSi_R1PWeaLA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-29_04,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=595 adultscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304290185
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGFvbG8gQm9uemluaSA8
cGJvbnppbmlAcmVkaGF0LmNvbT4NCj4gU2VudDogU2F0dXJkYXksIEFwcmlsIDI5LCAyMDIzIDc6
MjQgQU0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IHFlbXUt
ZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsgcGhp
bG1kQGxpbmFyby5vcmc7IGFsZUByZXYubmc7DQo+IGFuam9AcmV2Lm5nOyBCcmlhbiBDYWluIDxi
Y2FpbkBxdWljaW5jLmNvbT47IE1hdGhldXMgQmVybmFyZGlubyAoUVVJQykNCj4gPHF1aWNfbWF0
aGJlcm5AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIHRhcmdldC9oZXhh
Z29uOiBmaXggPSB2cy4gPT0gbWlzaGFwDQo+IA0KPiBXQVJOSU5HOiBUaGlzIGVtYWlsIG9yaWdp
bmF0ZWQgZnJvbSBvdXRzaWRlIG9mIFF1YWxjb21tLiBQbGVhc2UgYmUgd2FyeQ0KPiBvZiBhbnkg
bGlua3Mgb3IgYXR0YWNobWVudHMsIGFuZCBkbyBub3QgZW5hYmxlIG1hY3Jvcy4NCj4gDQo+IE9u
IDQvMjgvMjMgMjI6NDQsIFRheWxvciBTaW1wc29uIHdyb3RlOg0KPiA+IEZyb206IFBhb2xvIEJv
bnppbmk8cGJvbnppbmlAcmVkaGF0LmNvbT4NCj4gPg0KPiA+ICoqKiogQ2hhbmdlcyBpbiB2MiAq
KioqDQo+ID4gRml4IHl5YXNzZXJ0J3MgZm9yIHNpZ24gYW5kIHplcm8gZXh0ZW5kcw0KPiA+DQo+
ID4gQ292ZXJpdHkgcmVwb3J0cyBhIHBhcmFtZXRlciB0aGF0IGlzICJzZXQgYnV0IG5ldmVyIHVz
ZWQiLiAgVGhpcyBpcw0KPiA+IGNhdXNlZCBieSBhbiBhc3NpZ25tZW50IG9wZXJhdG9yIGJlaW5n
IHVzZWQgaW5zdGVhZCBvZiBlcXVhbGl0eS4NCj4gPg0KPiA+IENvLWF1dGhvcmVkLWJ5OiBUYXls
b3IgU2ltcHNvbjx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGZp
eCBUYXlsb3IsIEknbGwgbGV0IHlvdSBzdWJtaXQgdGhpcyBhcyBwYXJ0IG9mIHlvdXIgcHVsbCBy
ZXF1ZXN0cy4NCj4gDQo+IFBhb2xvDQoNCldpbGwgZG8uDQoNClRoYW5rcywNClRheWxvcg0KDQo=

