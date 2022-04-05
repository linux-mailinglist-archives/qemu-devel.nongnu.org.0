Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2024F3ECF
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 22:54:53 +0200 (CEST)
Received: from localhost ([::1]:58074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbqCS-0007my-DQ
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 16:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=509467a481=pdel@fb.com>)
 id 1nbqAq-0006sp-AQ; Tue, 05 Apr 2022 16:53:12 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:20870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=509467a481=pdel@fb.com>)
 id 1nbqAn-0002r9-Rj; Tue, 05 Apr 2022 16:53:11 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 235I0UgJ024009;
 Tue, 5 Apr 2022 13:52:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=Be5eZePtPExdE/DvJLqI9nWfwZamctZuSbka+fgDj0s=;
 b=Hv06/8/iqbET+NlowNDnsArJjCe67+Pak7B64mJ/Kb4ckfngSL/SO9nKBbGCicWUlMal
 jZ2sPX+eybHS5weC6H36EyWd3Kc/rdNOK+LaHpOcWxMMDGVA27yxg6yYRjv2e9XFjRpQ
 GnvVxQ5x5pWoRLXOkA9MnvfhuyvRCI+ZAKE= 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3f8egtpy4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Apr 2022 13:52:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Azu8cBFM2eyOolPfnHKwUSOp2pOBdJnqMR4U6xvLenz2WUqqP5DjK7jzyE456sHfeFmcIqvHL5M0bBeQPQWWGcTPVMIVk3J7BsNZNdMaCdXpHUGtmgsrKMeWPAG9DAfWSghTyy7aOgZnYgqgOclxIUL0T25UxaVpEZBQxjUgGVNyrlnAOOvo3c/HzafOR3EzWyg1iGhmoWzOErxA2EfkWcV8TQ3MLNE1+BQXwVS9WN0UFfTTdtYu15PnkB4vaqpnPnA6e0xEoN1Z6heaLVZXBlPxXAm4sVZd8bHZMdYqQyyAbeC+JTXs89NQorS1y0UkziVWWZoyLKTrqxiEqhhdGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndcdeFEpelaF2aTB0w3CRKfsZr5+Gq0UaNn1iGIOFGg=;
 b=ZFgJXLr8dbBXvDBwwL2Cm85xxREB6/l3sqEK8pVu9l0tWBnT8UNflqFfZtd2CffMfQeOEU8tveheY5ojSL3q7SN8j779q5hkL0Fc9bWQSlfNuvMvyGlWIPf+RXYTlTvfg5d1EWYDhgyCRB+9QYx6P1HpeGpouST64Iz++Cop1Lwtufds42G6RddIpKB1CdpeNldogEfySQO8TYD28s0wDHxXzPVJ3ev5B+FggpBhRZ5K5hv6wZOomSUg/MMzu83VgrI8nz1KQigQQh2SgPWrK9/FlmK5HoQP0x8JEsfZYN4ris/C9Fa9P7d4LLKUmJNHeovocVpfS/hXDG7NGd1yLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by MW2PR1501MB2074.namprd15.prod.outlook.com (2603:10b6:302:7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 20:52:32 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::e145:753f:1240:6fc1]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::e145:753f:1240:6fc1%4]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 20:52:32 +0000
From: Peter Delevoryas <pdel@fb.com>
To: Klaus Jensen <its@irrelevant.dk>
CC: Cameron Esfahani via <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Arun Kumar Kashinath Agasar
 <arun.kka@samsung.com>, Corey Minyard <cminyard@mvista.com>, Andrew Jeffery
 <andrew@aj.id.au>, Klaus Jensen <k.jensen@samsung.com>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>, Padmakar Kalghatgi
 <p.kalghatgi@samsung.com>, Matt Johnston <matt@codeconstruct.com.au>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: Re: [RFC PATCH 0/4] hw/i2c: i2c slave mode support
Thread-Topic: [RFC PATCH 0/4] hw/i2c: i2c slave mode support
Thread-Index: AQHYRSerTNcPCkQLM0iu4AURTxPSuqzh09OA
Date: Tue, 5 Apr 2022 20:52:32 +0000
Message-ID: <CA9A7D12-EA42-450B-B378-92D53D3D22EF@fb.com>
References: <20220331165737.1073520-1-its@irrelevant.dk>
In-Reply-To: <20220331165737.1073520-1-its@irrelevant.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f8b5bca-6890-4b09-20e7-08da174634bd
x-ms-traffictypediagnostic: MW2PR1501MB2074:EE_
x-microsoft-antispam-prvs: <MW2PR1501MB2074E2B323A1AB4F62103329ACE49@MW2PR1501MB2074.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SiYeWk7XE22AcQsPuPP8BvZRTxZZoIwm3X4a/gVLr8awih5PZ5KH8lMrkgBdx5DdyO/UGwkK/5plY6+f75znNNmdwqK5KnMqAOGCPiAaQnxVJnmeE2W5oBB+fu92/mkO4+uWdpAj69vZclcOMMyaRTDjGp/XbZF7zNiWiXx+vj01Uu/q225SMWBX4Ej40iIAGODDJFjNvhzxO/ujYdCFB+Y3dbbzNFzCrj51u59Y6Wrb58gAShAFwdgWkrUFEULFpj/0Qa+4/zcmBi98oS+PJFfVvimHm1tiB2QKbQE7gZRQGcm+AeprByWrb3XcFNWqRvZUimtthQ1AJ7WZCEIXKV++m6HqzGhclbPAFI62ryx+c1v2zJLG8eGyGAu8mssbtJsIkL9q7V3mw6Dwz53/m3BuL28nX3dMCOYexKo3RXs+MKocg4/21/fFJRkYSSDJThRnLmB38saQToAOsPcwzAzGPqA3Kh/1J8cSeGG3IUIo/FCGvWujXsydkgrT1LIY+5ZwjEafqSypzuGu3Z1IHy+keGV1KwN311OaMMz/bxoAOb9lF/Xn9+F1lhxIVUgeK4d3nvFt8wMSp/9B2W/FjbDzJOt0bvIctdEJQ+hoOm3FL1mO7ZM6crOs3uoMH2x6Chj0GRJYbxOO2N1Io6ixp9hEqSWNndEuN9ea9GmZkYtu9+T2A33uVR37gWep/ENdT3JFUWzWMtwr9TlGPyHc5sy+uZviKKw5M2Y3cTZlVKoCekWXZ/YfH4Sqd+7Iq6gIsTgP+WS26b8hNQG4NmBftUX76MFpS/oHKXBp2mjNyQFDhyG+ZUoiy43M7/wmzl4JyPbhqK2BpsrXEyifJnhSyk62YIXnakhskXVG2PyYHnk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(966005)(2616005)(186003)(508600001)(6512007)(2906002)(86362001)(33656002)(53546011)(6486002)(8936002)(83380400001)(5660300002)(66446008)(316002)(7416002)(76116006)(66476007)(66946007)(4326008)(64756008)(66556008)(38100700002)(122000001)(36756003)(71200400001)(54906003)(6916009)(8676002)(38070700005)(45980500001)(505234007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGtROXhPTlZzeUQ4UlExTjREeC9vVEhub0NnMS9UM1JBWkZRNG9Hc202SGY0?=
 =?utf-8?B?TzRuWXpIN3FlSllyenhSdW5UNndoUjQ3cUpld29XT0JyWWkzWVIrbXNYUzk3?=
 =?utf-8?B?RUVDd0l3cHRhWUt6SlBXL0dZeFltZUFKSU1HSG54NmM0SXdoMXVRdGJOamlD?=
 =?utf-8?B?UHB0dmowOEYzTGdvQU1CcmJCdGxPbFoyNDhoQmg4RSsrMzRodmZJSFE3U0Jj?=
 =?utf-8?B?N2dRbXY4R2Y5a25ac0dzTllYc3ZDcmMyWjl6SklIMWRyTXNtSnZweXpTakEx?=
 =?utf-8?B?OUtUVXhMUnptR3drRi9CS3RlRVZLeksycjF2VG8xU01VdUw3SG5XU1pGQmFV?=
 =?utf-8?B?R0x3Ny81WUV3RlRQMXo1VC8wVGpXdFBtSE5MSFYvWkFab1FkZngzZ3NUTUpJ?=
 =?utf-8?B?b001WHl3ZzkwQ2t3TWZWS1BuNWVKMXRLaW5uVWFqdXcxb1hCT2FEcVAxMmVl?=
 =?utf-8?B?cmNnQ0ZBOC9SMmdTZHI3RUxncytmdkJqYnJ4YS9wWnJDQ0krZnlFOUZGZmVP?=
 =?utf-8?B?My9ZZmJWaHh3cHhNdm1BV0lwOWVPRXJsRWFMWDJ5SnJzOW1MeStOVmhTdXA2?=
 =?utf-8?B?cm0wTHpvYVorRnovK3lRRkFaK242SlA1djhuYlUwOWFNSk1oUkxLTkZSdG1O?=
 =?utf-8?B?Tkk4cUltaGhlbGNOVEpqSU85eGNiMER1MjNGbXVoQnZ4dTYyN0M2NGRXakRS?=
 =?utf-8?B?WWhGa1pwRFVNSVhnSXZkVGlPQ1ZHVkxHaTJDV29BSGsxeDdrSXlzTGxUVHcz?=
 =?utf-8?B?QlB3bER5cyt2WTVkVk1ITTJJREpKelU5YnlqcHVVTFhNQlp2UklxSTJWd05n?=
 =?utf-8?B?ZXRBakplWXppay9QaVBVRUFCNERDdW1aUmxzWEpYUVFWU2RWZE8xa3REUEI5?=
 =?utf-8?B?amkxWHo5SXJMUllEalJrRE50RXVtRitobEdQNFNUcXhXa0Z4RHpVWUJjK0da?=
 =?utf-8?B?Ylh2M1o4WDhOQ1lvY2FiangzVmh6Z3BlMnd5TWtnejNiVHJrRm5kV1JTTzJX?=
 =?utf-8?B?Y2hRQjI2cnBpL1lDUlBHbERpejNNbkllNDVYNmxpVnNoYnI0Vm1PNHVwN0t1?=
 =?utf-8?B?YmN2bzR6L0lJNFRIbnh3TVVhZFk5N1ZhV3pOWWUzdFR2UzBwayt4bVZVOUVH?=
 =?utf-8?B?eHYrclNXZ3AyclZEZ1FMa25MNU1YTnVUbjB4T0ZmcDhmNFUxNHpNT3U5YUFX?=
 =?utf-8?B?RWRZT0U3ME1STWFTN2JhL081TjRtZVowbFM2OEhGZ2YyR2pMd3BrNG5Nb0tl?=
 =?utf-8?B?NXZmWFovY0NsaVBvN3J4L0dNYVdUS2wyTDYwRzk5aWhQZlBRTk1VVzg1bm5j?=
 =?utf-8?B?UmQzczdMb05TVlRKV1JFdFlQMldFYTE5eTR6RkJHT2xKY01Na0w1Ty9UVm9S?=
 =?utf-8?B?a1cxOFJ2S0pRcFhkZm9DOFhOS3B4azFBM1M2ei9lYTdXQUQwN2hUSXA2RG9O?=
 =?utf-8?B?ak51MENVNGVFRmp6R2swY2hBbTRXaWpYalhYaW9ZSDlXQXh2UUwxWS93WVg5?=
 =?utf-8?B?NDJDUlZvZHdWTi8xb2hpcmNIQ0NjM1hlUWo3SC9weEY5OFlHbC93U1I0STRV?=
 =?utf-8?B?ak14TUV3K2VOTWlrNjBZNXJKZ0huaUF2ZlQ3RnRDMWUxVmlrdXVnMFpXV1or?=
 =?utf-8?B?ejhxcUh3M2RPelFJcUpOOGdkNGwvS3BVdS9OMkNjWklXUjBhQVprUnhyUWJB?=
 =?utf-8?B?VXhHdXBhWnlqSWh4SmhPOXBwazVReDlwa0tmSzRneVdxK3dEa2sxZjR6dFhL?=
 =?utf-8?B?WGxRVUpZVGFFQmFnZExqN1ZlOCswVEI2Ti9qcFA2Rm84OVFWeDVxVFlOYjEr?=
 =?utf-8?B?ek5vNTlaS3VWOWsvdk5DYUtLK1NvUVk4NHdlUFVWNXUyT2V5YTlRMUNraFR3?=
 =?utf-8?B?RDRiVlh0SlNvUVl1aStaSnVBMlhBckhuV3FNZkR1WUI5aHlwaDN6UFY5VFYw?=
 =?utf-8?B?cU9mZTlncjZ0VE9KMzJwVUY0eG5BMmV6bDlvUlMrZHFCRyt1NW1VbklqSFJw?=
 =?utf-8?B?OWlkMnhOQkFBSjhEWGFpY3NKSmszM1pGbk1lcTRVMnVFSERjS2s1WTh2dllR?=
 =?utf-8?B?dlYvbjlHWFB4VXJMdVM3ZHlyVG04VUc4a2hMOHlFTDI1U1NxQ0dQS1YyWU5m?=
 =?utf-8?B?VnE4cmJ4TmhTU3pycWY1aVNZWEVncDVNdmFSL3hUS3hWc29hWkpPVTlSQWRU?=
 =?utf-8?B?ZzhjK055UTVYaDZobW9lcWQ5LytSMEVQK0UrakJPekNIYnNEQW1NSERjQ3V6?=
 =?utf-8?B?MkFERlZBYU9JNXJMSC9OWm50VUk2OG50b01UQUdndklsZDBqZ3UwWFQrVmQ5?=
 =?utf-8?B?bStXNVErUmsvejlqTTlSd1hjSWhjbTBKMTRnWDc4blYwSndVY1dtVC90a2F2?=
 =?utf-8?Q?Tj8otFUT9V92CbTw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A2FA62DB32E944CA2A0BFA21F5C10D0@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8b5bca-6890-4b09-20e7-08da174634bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2022 20:52:32.5368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cp5M33JWAkHdYwOhfRzhwSv7gKCSwlJKlcB9/x0q0BkNCMpr/wEn6CdE6UDuLz0n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR1501MB2074
X-Proofpoint-GUID: Nd7wc9oUDhHuQ8s_CSTzpmRtvb92Oeem
X-Proofpoint-ORIG-GUID: Nd7wc9oUDhHuQ8s_CSTzpmRtvb92Oeem
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 4 URL's were un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-05_07,2022-04-05_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=509467a481=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

DQoNCj4gT24gTWFyIDMxLCAyMDIyLCBhdCA5OjU3IEFNLCBLbGF1cyBKZW5zZW4gPGl0c0BpcnJl
bGV2YW50LmRrPiB3cm90ZToNCj4gDQo+IEZyb206IEtsYXVzIEplbnNlbiA8ay5qZW5zZW5Ac2Ft
c3VuZy5jb20+DQo+IA0KPiBIaSBhbGwsDQo+IA0KPiBUaGlzIFJGQyBzZXJpZXMgYWRkcyBJMkMg
InNsYXZlIG1vZGUiIHN1cHBvcnQgZm9yIHRoZSBBc3BlZWQgSTJDDQo+IGNvbnRyb2xsZXIgYXMg
d2VsbCBhcyB0aGUgbmVjZXNzYXJ5IGluZnJhc3RydWN0dXJlIGluIHRoZSBpMmMgY29yZSB0bw0K
PiBzdXBwb3J0IHRoaXMuDQo+IA0KPiBCYWNrZ3JvdW5kDQo+IH5+fn5+fn5+fn4NCj4gV2UgYXJl
IHdvcmtpbmcgb24gYW4gZW11bGF0ZWQgTlZNIEV4cHJlc3MgTWFuYWdlbWVudCBJbnRlcmZhY2Vb
MV0gZm9yDQo+IHRlc3RpbmcgYW5kIHZhbGlkYXRpb24gcHVycG9zZXMuIE5WTWUtTUkgaXMgYmFz
ZWQgb24gdGhlIE1DVFANCj4gcHJvdG9jb2xbMl0gd2hpY2ggbWF5IHVzZSBhIHZhcmlldHkgb2Yg
dW5kZXJseWluZyB0cmFuc3BvcnRzLiBUaGUgb25lIHdlDQo+IGFyZSBpbnRlcmVzdGVkIGluIGlz
IEkyQ1szXS4NCj4gDQo+IFRoZSBmaXJzdCBnZW5lcmFsIHRyaWNrZXJ5IGhlcmUgaXMgdGhhdCBh
bGwgTUNUUCB0cmFuc2FjdGlvbnMgYXJlIGJhc2VkDQo+IG9uIHRoZSBTTUJ1cyBCbG9jayBXcml0
ZSBidXMgcHJvdG9jb2xbNF0uIFRoaXMgbWVhbnMgdGhhdCB0aGUgc2xhdmUgbXVzdA0KPiBiZSBh
YmxlIHRvIG1hc3RlciB0aGUgYnVzIHRvIGNvbW11bmljYXRlLiBBcyB5b3Uga25vdywgaHcvaTJj
L2NvcmUuYw0KPiBjdXJyZW50bHkgZG9lcyBub3Qgc3VwcG9ydCB0aGlzIHVzZSBjYXNlLg0KDQpU
aGlzIGlzIGdyZWF0LCBJ4oCZbSBhdHRlbXB0aW5nIHRvIHVzZSB5b3VyIGNoYW5nZXMgcmlnaHQg
bm93IGZvciB0aGUgc2FtZSB0aGluZyAoTUNUUCkuDQoNCj4gDQo+IFRoZSBzZWNvbmQgaXNzdWUg
aXMgaG93IHRvIGludGVyYWN0IHdpdGggdGhlc2UgbWFzdGVyaW5nIGRldmljZXMuIEplcmVteQ0K
PiBhbmQgTWF0dCAoQ0MnZWQpIGhhdmUgYmVlbiB3b3JraW5nIG9uIGFuIE1DVFAgc3RhY2sgZm9y
IHRoZSBMaW51eCBLZXJuZWwNCj4gKGFscmVhZHkgdXBzdHJlYW0pIGFuZCBhbiBJMkMgYmluZGlu
ZyBkcml2ZXJbNV0gaXMgY3VycmVudGx5IHVuZGVyDQo+IHJldmlldy4gVGhpcyBiaW5kaW5nIGRy
aXZlciByZWxpZXMgb24gSTJDIHNsYXZlIG1vZGUgc3VwcG9ydCBpbiB0aGUgSTJDDQo+IGNvbnRy
b2xsZXIuDQo+IA0KPiBUaGlzIHNlcmllcw0KPiB+fn5+fn5+fn5+fg0KPiBQYXRjaCAxIGFkZHMg
c3VwcG9ydCBmb3IgbXVsdGlwbGUgbWFzdGVycyBpbiB0aGUgaTJjIGNvcmUsIGFsbG93aW5nDQo+
IHNsYXZlcyB0byBtYXN0ZXIgdGhlIGJ1cyBhbmQgc2FmZWx5IGlzc3VlIGkyY19zZW5kL3JlY3Yo
KS4gUGF0Y2ggMiBhZGRzDQo+IGFuIGFzeW5jaHJvbm91cyBzZW5kIGkyY19zZW5kX2FzeW5jKEky
Q0J1cyAqLCB1aW50OCkgb24gdGhlIGJ1cyB0aGF0DQo+IG11c3QgYmUgcGFpcmVkIHdpdGggYW4g
ZXhwbGljaXQgYWNrIHVzaW5nIGkyY19hY2soSTJDQnVzICopLg0KPiANCj4gUGF0Y2ggMyBhZGRz
IHRoZSBzbGF2ZSBtb2RlIGZ1bmN0aW9uYWxpdHkgdG8gdGhlIGVtdWxhdGVkIEFzcGVlZCBJMkMN
Cj4gY29udHJvbGxlci4gVGhlIGltcGxlbWVudGF0aW9uIGlzIHByb2JhYmx5IGJ1Z2d5IHNpbmNl
IEkgaGFkIHRvIHJlbHkgb24NCj4gdGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBrZXJuZWwgZHJp
dmVyIHRvIHJldmVyc2UgZW5naW5lZXIgdGhlIGJlaGF2aW9yDQo+IG9mIHRoZSBjb250cm9sbGVy
IHNsYXZlIG1vZGUgKEkgZG8gbm90IGhhdmUgYWNjZXNzIHRvIGEgc3BlYyBzaGVldCBmb3INCj4g
dGhlIEFzcGVlZCwgYnV0IG1heWJlIHNvbWVvbmUgY2FuIGhlbHAgbWUgb3V0IHdpdGggdGhhdD8p
Lg0KPiANCj4gRmluYWxseSwgcGF0Y2ggNCBhZGRzIGFuIGV4YW1wbGUgZGV2aWNlIHVzaW5nIHRo
aXMgbmV3IEFQSS4gVGhlIGRldmljZQ0KPiBpcyBhIHNpbXBsZSAiZWNobyIgZGV2aWNlIHRoYXQg
dXBvbiBiZWluZyBzZW50IGEgc2V0IG9mIGJ5dGVzIHVzZXMgdGhlDQo+IGZpcnN0IGJ5dGUgYXMg
dGhlIGFkZHJlc3Mgb2YgdGhlIHNsYXZlIHRvIGVjaG8gdG8uDQo+IA0KPiBXaXRoIHRoaXMgY29t
YmluZWQgSSBhbSBhYmxlIHRvIGJvb3QgdXAgTGludXggb24gYW4gZW11bGF0ZWQgQXNwZWVkIDI2
MDANCj4gZXZhbHVhdGlvbiBib2FyZCBhbmQgaGF2ZSB0aGUgaTJjIGVjaG8gZGV2aWNlIHdyaXRl
IGludG8gYSBMaW51eCBzbGF2ZQ0KPiBFRVBST00uIEFzc3VtaW5nIHRoZSBlY2hvIGRldmljZSBp
cyBvbiBhZGRyZXNzIDB4NDI6DQo+IA0KPiAgIyBlY2hvIHNsYXZlLTI0YzAyIDB4MTA2NCA+IC9z
eXMvYnVzL2kyYy9kZXZpY2VzL2kyYy0xNS9uZXdfZGV2aWNlDQo+ICBpMmMgaTJjLTE1OiBuZXdf
ZGV2aWNlOiBJbnN0YW50aWF0ZWQgZGV2aWNlIHNsYXZlLTI0YzAyIGF0IDB4NjQNCj4gICMgaTJj
c2V0IC15IDE1IDB4NDIgMHg2NCAweDAwIDB4YWEgaQ0KPiAgIyBoZXhkdW1wIC9zeXMvYnVzL2ky
Yy9kZXZpY2VzLzE1LTEwNjQvc2xhdmUtZWVwcm9tDQo+ICAwMDAwMDAwIGZmYWEgZmZmZiBmZmZm
IGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZg0KPiAgMDAwMDAxMCBmZmZmIGZmZmYgZmZmZiBmZmZm
IGZmZmYgZmZmZiBmZmZmIGZmZmYNCj4gICoNCj4gIDAwMDAxMDANCg0KV2hlbiBJIHRyeSB0aGlz
IHdpdGggbXkgc3lzdGVtLCBpdCBzZWVtcyBsaWtlIHRoZSBpMmMtZWNobyBkZXZpY2UgdGFrZXMg
b3Zlcg0KdGhlIGJ1cyBidXQgbmV2ZXIgZWNob2VzIHRoZSBkYXRhIHRvIHRoZSBFRVBST00uIEFt
IEkgbWlzc2luZyBzb21ldGhpbmcgdG8NCm1ha2UgdGhpcyB3b3JrPyBJdCBzZWVtcyBsaWtlIHRo
ZSDigJxpMmNfc2VuZF9hc3luY+KAnSBjYWxscyBhcmVu4oCZdCBoYXBwZW5pbmcsDQp3aGljaCBt
dXN0IGJlIGJlY2F1c2UgdGhlIGJvdHRvbSBoYWxmIGlzbuKAmXQgYmVpbmcgc2NoZWR1bGVkLCBy
aWdodD8gQWZ0ZXINCnRoZSBpMmNfZG9fc3RhcnRfdHJhbnNmZXIsIGhvdyBpcyB0aGUgYm90dG9t
IGhhbGYgc3VwcG9zZWQgdG8gYmUgc2NoZWR1bGVkDQphZ2Fpbj8gSXMgdGhlIHNsYXZlIHJlY2Vp
dmluZyAodGhlIEVFUFJPTSkgc3VwcG9zZWQgdG8gY2FsbCBpMmNfYWNrIG9yIHNvbWV0aGluZz8N
Cg0Kcm9vdEBibWMtb29iOn4jIGVjaG8gMjRjMDIgMHgxMDY0ID4gL3N5cy9idXMvaTJjL2Rldmlj
ZXMvaTJjLTgvbmV3X2RldmljZQ0KWyAgMTM1LjU1OTcxOV0gYXQyNCA4LTEwNjQ6IDI1NiBieXRl
IDI0YzAyIEVFUFJPTSwgd3JpdGFibGUsIDEgYnl0ZXMvd3JpdGUNClsgIDEzNS41NjI2NjFdIGky
YyBpMmMtODogbmV3X2RldmljZTogSW5zdGFudGlhdGVkIGRldmljZSAyNGMwMiBhdCAweDY0DQpy
b290QGJtYy1vb2I6fiMgaTJjc2V0IC15IDggMHg0MiAweDY0IDB4MDAgMHhhYSBpDQppMmNfZWNo
b19ldmVudDogc3RhcnQgc2VuZA0KaTJjX2VjaG9fc2VuZDogZGF0YVswXSA9IDB4NjQNCmkyY19l
Y2hvX3NlbmQ6IGRhdGFbMV0gPSAweDAwDQppMmNfZWNob19zZW5kOiBkYXRhWzJdID0gMHhhYQ0K
aTJjX2VjaG9fZXZlbnQ6IHNjaGVkdWxpbmcgYm90dG9tLWhhbGYNCmkyY19lY2hvX2JoOiBhdHRl
bXB0aW5nIHRvIGdhaW4gbWFzdGVyeSBvZiBidXMNCmkyY19lY2hvX2JoOiBzdGFydGluZyBhIHNl
bmQgdG8gYWRkcmVzcyAweDY0DQpyb290QGJtYy1vb2I6fiMgaGV4ZHVtcCAtQyAvc3lzL2J1cy9p
MmMvZGV2aWNlcy84LTEwNjQvZWVwcm9tDQowMDAwMDAwMCAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICB8Li4uLi4uLi4uLi4uLi4uLnwNCioNCjAwMDAw
MTAwDQoNClRoYW5rcyBhZ2FpbiBmb3IgdGhpcywgaXTigJlzIGV4YWN0bHkgd2hhdCBJIG5lZWRl
ZC4NCg0KPiANCj4gIFsxXTogaHR0cHM6Ly9udm1leHByZXNzLm9yZy9kZXZlbG9wZXJzL252bWUt
bWktc3BlY2lmaWNhdGlvbi8gDQo+ICBbMl06IGh0dHBzOi8vd3d3LmRtdGYub3JnL3NpdGVzL2Rl
ZmF1bHQvZmlsZXMvc3RhbmRhcmRzL2RvY3VtZW50cy9EU1AwMjM2XzEuMy4xLnBkZiANCj4gIFsz
XTogaHR0cHM6Ly93d3cuZG10Zi5vcmcvc2l0ZXMvZGVmYXVsdC9maWxlcy9zdGFuZGFyZHMvZG9j
dW1lbnRzL0RTUDAyMzdfMS4yLjAucGRmIA0KPiAgWzRdOiBodHRwOi8vd3d3LnNtYnVzLm9yZy9z
cGVjcy9TTUJ1c18zXzFfMjAxODAzMTkucGRmIA0KPiAgWzVdOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1pMmMvMjAyMjAyMTgwNTUxMDYuMTk0NDQ4NS0xLW1hdHRAY29kZWNvbnN0cnVj
dC5jb20uYXUvDQo+IA0KPiBLbGF1cyBKZW5zZW4gKDQpOg0KPiAgaHcvaTJjOiBzdXBwb3J0IG11
bHRpcGxlIG1hc3RlcnMNCj4gIGh3L2kyYzogYWRkIGFzeW5jIHNlbmQNCj4gIGh3L2kyYzogYWRk
IHNsYXZlIG1vZGUgZm9yIGFzcGVlZF9pMmMNCj4gIGh3L21pc2M6IGFkZCBhIHRveSBpMmMgZWNo
byBkZXZpY2UNCj4gDQo+IGh3L2kyYy9hc3BlZWRfaTJjLmMgICAgICAgICB8ICA5NSArKysrKysr
KysrKysrKysrKysrKystLS0NCj4gaHcvaTJjL2NvcmUuYyAgICAgICAgICAgICAgIHwgIDU3ICsr
KysrKysrKysrKystDQo+IGh3L2kyYy90cmFjZS1ldmVudHMgICAgICAgICB8ICAgMiArLQ0KPiBo
dy9taXNjL2kyYy1lY2hvLmMgICAgICAgICAgfCAxNDQgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+IGh3L21pc2MvbWVzb24uYnVpbGQgICAgICAgICB8ICAgMiArDQo+IGlu
Y2x1ZGUvaHcvaTJjL2FzcGVlZF9pMmMuaCB8ICAgOCArKw0KPiBpbmNsdWRlL2h3L2kyYy9pMmMu
aCAgICAgICAgfCAgMTkgKysrKysNCj4gNyBmaWxlcyBjaGFuZ2VkLCAzMTYgaW5zZXJ0aW9ucygr
KSwgMTEgZGVsZXRpb25zKC0pDQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBody9taXNjL2kyYy1lY2hv
LmMNCj4gDQo+IC0tIA0KPiAyLjM1LjENCj4gDQo+IA0KDQo=

