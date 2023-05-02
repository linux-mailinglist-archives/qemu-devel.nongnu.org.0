Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F756F472B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 17:28:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptrv7-0004mc-Ph; Tue, 02 May 2023 11:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ptrv5-0004mT-EP
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:27:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ptrv3-0008JW-2T
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:27:59 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 342Bug64023054; Tue, 2 May 2023 15:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=plzRfOTVIzOnoW1s6SEmvH/WZVXvRBmcuHrhYJAdpMk=;
 b=G/3Qvia2MIb5FKGz/pleGAj8bPnv5JYvDsY5uvV5meyvYMc65GhBebiXZDNoNZnF7tlm
 AqXzDjpbfiUy04RdAbfxzLBABlEt++qM6vzq5M53wL2ppj9HLf8wB5W9UdhkYkeWCsrP
 yaZmNuctLAVmE/FVe57R2tZsv7g3vYT3gZ5zUEc4NuATNwkiO36c7Y2HfqdPauwZ5Ga5
 9GcLAevsWZ6oVt2bkkRBFu9X93axXZAYRi0L2itUkegQihwuXwEzf/hsGU0FwRJilDnA
 GfXCPe4odPfwN0o+8t3RicmwB9U80rwvhbCmGq0G9wpwwVC11jYPxkGuBEtrRvr4APd+ 1g== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qawct98jv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 15:27:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZ3s2VRIWTvRRi7/zcyILmjWxM2yfAmM+wKlcmIe642h5xqlYVqZU2FqIBoVzuKBSjr1oDvReqPq1s9QnNaF/1nvNc2Cl7uNLNgVv4g7UNjx9fv1k+9TtNJqcT1j7FYYDmckz1OXWeBLps32KIsW6rvcInO3zJ92WQ288W6Nq4OU+mJglGU8Sjs8Jh372ryT0WyFSEiEFwQN9jtSqz8WksonJFh9iyRprAuO9UFgXMA/JZ6a+1u5bw7xXBH3vO6r1YWsYV5BdDvzv7Frsr1rSFK6azVuSC520YR1NGjhDn/unHQoVR942OV/TI0QvWAPmvl5vSdh2/ThdLGptfVGHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plzRfOTVIzOnoW1s6SEmvH/WZVXvRBmcuHrhYJAdpMk=;
 b=meDhpaethvWvphxcohP85IWKqVXpVPennllDimCeJO/+iWgpsDJuzvAKwE4qeILIbUrepbHK/L13+CeTcRlhkjk2dkHW8FtNtGPbxJfVn7j1MNDZ91i6c3mTmkQ0tGqwKsp9S/o27V8KrkfCptaey/342b5hHlEmZPUZ5DRwPrcfdxmy0UQnkxOO3oazj9hXpRH2nSV7jXdUAVgWkQE1QwoloEBCALeuROH5fv/2JfV6SQ9geYjJgPIQ9t1hsFHJkf23D2/R1dCNsWFYcDgiBk4STwxHeOWHIK1GlzvOLnimglPuahegDYWV/77xogEWIJrCrpg0I6D7lBew0DmF4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SJ0PR02MB7807.namprd02.prod.outlook.com
 (2603:10b6:a03:325::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20; Tue, 2 May
 2023 15:27:27 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 15:27:27 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "mrolnik@gmail.com" <mrolnik@gmail.com>, "edgar.iglesias@gmail.com"
 <edgar.iglesias@gmail.com>, "ale@rev.ng" <ale@rev.ng>, "anjo@rev.ng"
 <anjo@rev.ng>, "laurent@vivier.eu" <laurent@vivier.eu>, "philmd@linaro.org"
 <philmd@linaro.org>, "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>,
 "david@redhat.com" <david@redhat.com>, "iii@linux.ibm.com"
 <iii@linux.ibm.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "atar4qemu@gmail.com" <atar4qemu@gmail.com>, "jcmvbkbc@gmail.com"
 <jcmvbkbc@gmail.com>
Subject: RE: [PATCH 3/9] target/Hexagon: Finish conversion to
 tcg_gen_qemu_{ld,st}_*
Thread-Topic: [PATCH 3/9] target/Hexagon: Finish conversion to
 tcg_gen_qemu_{ld,st}_*
Thread-Index: AQHZfP4Z5mmN95DGD0GA6Wo75q9u169HFB0w
Date: Tue, 2 May 2023 15:27:26 +0000
Message-ID: <SN4PR0201MB8808A13255BC8104B407C816DE6F9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
 <20230502135741.1158035-4-richard.henderson@linaro.org>
In-Reply-To: <20230502135741.1158035-4-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SJ0PR02MB7807:EE_
x-ms-office365-filtering-correlation-id: 1da7070d-f8ac-486f-606b-08db4b21bc6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OxS+55eZg4Qk8KA+Sh4ML0f9fKJxYFDQoCK2WRzOVr2it/2vpxXY8mBEaF81GR2FEx6vnz2whwlsvgup8oiyk7yCHb9i1JfhIn4Y4cykTg/OrtKxQx6z/cyov7hM+MggMREN+a0xLFQ1WRE9pN79XX8bsVOjJppSXJvzLXiVCXP+EFuYA0PiP7nPenQ8CFiU+W9CXcMCbWui7MvQkUs/7Iamhc+YEGhhD14yRYfo5rpsRHD1tu9D4MELnRSyDCRaaeql37IIJSenMMu797jm234OEMPQBPEKgsA1FjRjN+r8zJl+gvQBhvipYV1cl/SJ2OafO5tSPfh8LDet9+fMx+6eIzXlW7MjQdwXtvzM4y+VYzBs58Z6Mqhuzds38vc7fgaIJ/iCjWrWmJh2xjA9A1pi9A7mIn5VaHC5PfMvjTdCz5QlhYZLcRCQS8LLr3hDNbpmqcCMMUXGarYhQPqHsZ/jMh+r9QdMQr+8iej6ZNVqPcQEbKuD+5+QJYla3fNoFhFzl6NDlYDDFXLfy4XNe2MzHYeMqR2/3fauVu4tiddMf+dvye544U0pCl1ag1H8ERm/o/+fMUQGD9RPGsOKmxWpVGupI7zftbtkXnpfPQ+dLGEKmVS5w/kAmg7ehJb1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199021)(7416002)(5660300002)(52536014)(86362001)(83380400001)(186003)(26005)(9686003)(53546011)(6506007)(122000001)(38100700002)(38070700005)(8676002)(8936002)(478600001)(33656002)(54906003)(110136005)(71200400001)(7696005)(55016003)(316002)(41300700001)(4326008)(64756008)(66476007)(66556008)(66946007)(66446008)(76116006)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XldK+CGVCBVno5pqInMF4ou6FmKNxlZwf2FJjqNmCxyo/ON6dQmaBuoz9MKY?=
 =?us-ascii?Q?9DzaVr9eUw34s5DmuwtnpRiBWDZPHTnvXqGMw9Kvvj5SevWiJcgb+TSDZEd3?=
 =?us-ascii?Q?RGSn0kbe9aR5R+/efyz/62f2eiC6rPQrK6r8uA0IRhv3W1iPU/qCCxDKim4R?=
 =?us-ascii?Q?EJZVsMLhBZAZN7AX0KAgDWvbqjd1fus0l+1S5RvRfT8dqlrxxKE9BUhLkEfx?=
 =?us-ascii?Q?2olgkpniMttMx31db1avGcXJsnflPugUdmbl8dkWVHy2+Xi9ma3HCjCvOmbn?=
 =?us-ascii?Q?j6dkW2EApx8BtuGou6DxU74FpCeQ01J0r0sozSurPHajzUfguDiTXTAoDQJ8?=
 =?us-ascii?Q?cPpe5hLj4sGPpFq62e8i1u85c7wxKEw4mIZ32ZugTSBixdJOJkSQPrBIrkwE?=
 =?us-ascii?Q?Bi1vIzfYhk9Z9h4iVebbsC/RHbJPcnqGplYI6RSmBRXpCTg3NYKODqFv6a2o?=
 =?us-ascii?Q?Nur0B36bObDde3dbCU3dDQGTsxX+xM6XLG5+mXwXwedUxDi/kFveB9QuhVau?=
 =?us-ascii?Q?4q86KpWAj3YHuU4VXiQ04jEnOPwRyPUVTpID6Ap68xUZ+ElGe5sBoHKhe1h7?=
 =?us-ascii?Q?q+cRFLmOE5WUw0TvjR+lxvPRn9Wlr6l+p/yAZNtbdzl/6ExGjUulfG5rQo4Y?=
 =?us-ascii?Q?6ZhX395y/QNIrTRtlywsDBhXT7L40vaPtPyJHQ8paCcSfhFZs0R0Rp1ayyQf?=
 =?us-ascii?Q?HuXuf+rYeoikD1FS7Cf6uZ7KSCY6SPrNFByAJgZBdecVawNovNqpKF6YS9Zv?=
 =?us-ascii?Q?74cO7HNL1AID5rSqxuxYv1X9sDKPpssNudr0R6bNOD7zb9WUIvh4K1RwVI5Y?=
 =?us-ascii?Q?6tLG0LUVNg21zT3dOCqT5qVjB6mv17SqC633cxxbDOKNZESqOqB4zTHG463t?=
 =?us-ascii?Q?Wb3LWWNUYKskOUgWZrMxrQcQGMqoMd8onXmJOnFmU8AQSb2P5YRoRFx9qlDB?=
 =?us-ascii?Q?sk6wq4i0dUPF73G9fFZHNqqCMH2pNHcc41Bmta0fBRkLgY7QmKQ/i3ACRkDw?=
 =?us-ascii?Q?cSGE9e9C3NhZsmNBBWlS6LFwlW/t1rCiHO9n2WbK34xDRmeQ3z9QHPI4Y7hD?=
 =?us-ascii?Q?iAxbWG4TDqr4KnWWCpSlbu1ACt8OHilE5BPK1epvHVDpnpEjuNwPlUIpvIMh?=
 =?us-ascii?Q?wbdvQkWdCyefr8gJD4bWxd2TMPcut90xZ13F9lb7PVCFsmAodBG4hcs7Syuy?=
 =?us-ascii?Q?XbCwbBwKTnQI2/d7Ff8SeSqNFEybEau2VEWX3BlpwD2jeujDCePsFKs8S8q8?=
 =?us-ascii?Q?rZis3J63ZJ5hxaHMXuINrBoYFgrIWV/DgRPUQmWeJSuuTcs0c+oKgpTeMFCC?=
 =?us-ascii?Q?/cof32mEuRecFcNkkx0ZRF9XHrvzNk//oTlmvidqRhD7dq90/hhnl3HKCeBc?=
 =?us-ascii?Q?uzxAhsjp2sGHIyiaeH/6c/dbWbYG9L5Hp5XJPRQWTb1SMmzJZY4mwdTfyd+b?=
 =?us-ascii?Q?qd0CoDAr6eIyMbNWkEKiF0/6CpUavw9LcLgZI2YrsHLZbnFYPD8r7c9CTgBi?=
 =?us-ascii?Q?yeYukx7/FsOxERNqnXYVzgIYPPQShwozUX1seRNFFvRWObQeFTYCsR5pHMeO?=
 =?us-ascii?Q?BC6ySmjjZE43UrgonBZGdBWDZqN2sE4InR6IbgIW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?vYwqw0pQloDKMTsn2Hdt4C75dckcKP2lGIgehtBKdAlKzc/u+X38yc0sFrTo?=
 =?us-ascii?Q?0e/qHlpZxVhFKmlUc/tUrAh9HNQBx3JdiLfAwtXeVvX8PKSd9sJMaV86qCur?=
 =?us-ascii?Q?kq4ISdC/lqM1Ponv7r4DzjB4gGkWuqF5dq7dRcpol8xuKpjxmGzF0zZ0gCuA?=
 =?us-ascii?Q?/F3Sz75xUVyr2MGQiT6GRCSf+NDaEh0YIujym6c6WvEf3ZYpGvBVPGV3LB3r?=
 =?us-ascii?Q?R7mlZIlxXi77TDZ0lUGQo+0tsm7kk1Kz/Or5upWk+Db6NAJhqS8wSM8kXHXc?=
 =?us-ascii?Q?BqmV6usJyAjfwQG3UNOYEJbF/ZM5h5Fu5OZRQbgniDqeUfSejOBs7uo5Fgs9?=
 =?us-ascii?Q?02hNKESuAfjoUfjFMdtzjpHyQnOXSyCWB5rps0P50irCWvpR6IrF5pmDvXW/?=
 =?us-ascii?Q?EU6aHy/DWR5pcQ+BieLV1i8HJ6CFTkI1ni5MDFFHskL1T90F0H2k4q5zq1nu?=
 =?us-ascii?Q?yFW+8/gojtfdOPBesNQd9oT6acCUpJrfofvZ1CmaSCJ2TsW6Tu+nTHYayw51?=
 =?us-ascii?Q?ujcKgBW4vf0+miycdLikN6Igju8W9q3cvVw4M+kxagaBNVoDx6OmHOOp442f?=
 =?us-ascii?Q?cxW+5ybHzBVsYyQnWe3fKkheQKQwaCbX3M08ZsEy7q9QW7qcYT/apxsbs+V8?=
 =?us-ascii?Q?0R9joBnpgnt9ZQijBCT70Ni8Kl4/ULIf4fhtdFhvpHEApS4Du/IxwgQQeVQn?=
 =?us-ascii?Q?97c9neXhvyn/TYz5yEE5nGMy315HJnVWXaBMAPfzENQ5FmcAeRgDcLVvz28W?=
 =?us-ascii?Q?eGVqBFwIyCIeR7JBevv0LXrNluf2caYPqy0YPtpMNo83pE6sW4lqn432pyJS?=
 =?us-ascii?Q?Kqb960Wk3EcMNhz3RL+Lo2tiOCDLMdt9MvBv8PnOz5ZnyvdkYrgjlMAySXwR?=
 =?us-ascii?Q?Rl/Za2BQYNZrFGKYBHpJWaTdNqCM0HQudTQ3J947Dx/EmQ5SJUikA9FxnkTg?=
 =?us-ascii?Q?+4fWoqToMCzDTPDe0GacYWb85i0y/L37VNHT12b3/+529prUfcFDKo7vLKfd?=
 =?us-ascii?Q?iJkb?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da7070d-f8ac-486f-606b-08db4b21bc6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2023 15:27:27.0131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WNszPuyCXJLFiY+/UjwvUrOinhvGYou1aDzP8aKZcoFnhWjS0HMVMhHbrieawnAANbXLyDijasTHA92lQwF6qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7807
X-Proofpoint-ORIG-GUID: yRrPn9oRs-R1pucWCr7b4iMzH7d-zg_T
X-Proofpoint-GUID: yRrPn9oRs-R1pucWCr7b4iMzH7d-zg_T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_10,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020131
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



> -----Original Message-----
> From: Richard Henderson <richard.henderson@linaro.org>
> Sent: Tuesday, May 2, 2023 8:58 AM
> To: qemu-devel@nongnu.org
> Cc: mrolnik@gmail.com; edgar.iglesias@gmail.com; Taylor Simpson
> <tsimpson@quicinc.com>; ale@rev.ng; anjo@rev.ng; laurent@vivier.eu;
> philmd@linaro.org; jiaxun.yang@flygoat.com; david@redhat.com;
> iii@linux.ibm.com; thuth@redhat.com; mark.cave-ayland@ilande.co.uk;
> atar4qemu@gmail.com; jcmvbkbc@gmail.com
> Subject: [PATCH 3/9] target/Hexagon: Finish conversion to
> tcg_gen_qemu_{ld,st}_*
>=20
> Convert away from the old interface with the implicit MemOp argument.
> Importantly, this removes some incorrect casts generated by idef-parser's
> gen_load().
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/macros.h                     | 14 ++++-----
>  target/hexagon/genptr.c                     |  8 +++---
>  target/hexagon/idef-parser/parser-helpers.c | 28 +++++++++---------
>  target/hexagon/translate.c                  | 32 ++++++++++-----------
>  4 files changed, 40 insertions(+), 42 deletions(-)
>=20
> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c index
> 502c85ae35..244063b1d2 100644
> --- a/target/hexagon/genptr.c
> +++ b/target/hexagon/genptr.c
> @@ -320,14 +320,14 @@ void gen_set_byte_i64(int N, TCGv_i64 result, TCGv
> src)
>=20
>  static void gen_return(DisasContext *ctx, TCGv_i64 dst, TCGv src) @@ -
> 1019,7 +1019,7 @@ static void gen_vreg_load(DisasContext *ctx, intptr_t
> dstoff, TCGv src,
>          tcg_gen_andi_tl(src, src, ~((int32_t)sizeof(MMVector) - 1));
>      }
>      for (int i =3D 0; i < sizeof(MMVector) / 8; i++) {
> -        tcg_gen_qemu_ld64(tmp, src, ctx->mem_idx);
> +        tcg_gen_qemu_ld_i64(tmp, src, ctx->mem_idx, MO_TEUQ);
>          tcg_gen_addi_tl(src, src, 8);
>          tcg_gen_st_i64(tmp, cpu_env, dstoff + i * 8);

Did you intend to leave the tcg_gen_st_i64 alone or should that be converte=
d to tcg_gen_qemu_st64.

There's a tcg_gen_st8_i64 in vec_to_qvec.  Does that need to be converted?

>      }

I'm curious if there's a better way to do a vector load (e.g., with tcg_gen=
_gvec_<something>) than a loop that does 8 bytes at a time.

Otherwise,
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


