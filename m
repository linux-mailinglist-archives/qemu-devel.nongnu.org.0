Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BFD5848D2
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 01:55:06 +0200 (CEST)
Received: from localhost ([::1]:50398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHDLN-00078j-GX
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 19:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1oHDK7-0005no-7A
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 19:53:47 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:63270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1oHDK4-0002z3-U3
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 19:53:46 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26SNkBpx028312;
 Thu, 28 Jul 2022 23:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=sN1KqbXrwyFZDbtlddRJMSbo/Ed4/+1aPSXpVLqyUYA=;
 b=UIeURb78ojh9CF/WFpNJO/tT3Ecy8AbE2uLZmWP149+I0YdhDNsYYF6oZJrB9IHTyzhn
 KkEMjmtCgCxqC5dy28tAqvbfwRAec4SWiwA7JVX1TVoNW0IKGlqzvh8XUz5m7/C7YTOP
 IOQjeqbeIr1N9UiiWLMc39yvtRUufPR1A8vMoI3+EeuXnmWC+j36u0e4TGcn1Q+uohW6
 ZywGJu3bZKrwwj1pINluWljtvT4hv9bUxOe6AXUAzCdqrVjCMv03Knqjh0NZQNecl+zQ
 O2+kAlnKjBokfl03rqGd0yrujBlps2rASrjgg9WdL1jcHT01q2PWbqngucN4lPlagEWp VQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hkt3csh7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jul 2022 23:53:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4lnYwBCLmgTuuSJpuvSFMiJdl41QV4ji/lJWjX/a3/vqbH+N6q5KFKVgtgtRuDCAnZHaeSP9B86KPzoWCE6i1MCK72/goUJ4cXF8dPkiEe4s15qgXg2S7ARszS4oRmeoteOX5vC7xVZX8xDbQfQTb3pyClDe3N3G1bGQqUa6YeGLvqjIqFZ+jLAdthIgkr3UQKUkUomVW31Dbe7kTyGNTXYo+jMw/YXyNfQ7sfXp/6xGqsq6R1kYadSiUX8IGTmN5YkeJES1+o6eG2zNkPY5lIU0BrPQlZFFRLUob5JMdEg4M6RBs6CKf9fyzzM/XhnLlodI/0jbQ53TzKH1Bcvog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sN1KqbXrwyFZDbtlddRJMSbo/Ed4/+1aPSXpVLqyUYA=;
 b=F/rp7xpiNXfLopZ0j67jfevtGDwQP5Ulzv0bbsyq8g7g9iAcBzEvRFWXTg3WZxqUDXA5TC9XlhPU/ZXACY1E/ELKT/eQlTwfyshwMJ6hzyJdj3rdBOOIEchGnE1a4oZT1jDC6WTUB6l43M4RYI3UbmQ3+aZxtrh5gM78gGPuZTLzM1DVGWvahbt+MldGRm8JcHDxphJWhhaSjxa8+dQo6Zu4t92x7Dd49iFO2aT1h2vjvHzSqobKBY3WvW6VnaCIfoWnZS0rR+MHqjg/uDDBto/z+vIbRODDw7QfGAnNaEBsgjRhK9YpAsHYunIZpY5q7hzrIFiju0pAEtRTZV6BDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BN6PR02MB2609.namprd02.prod.outlook.com
 (2603:10b6:404:53::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Thu, 28 Jul
 2022 23:53:30 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::35d4:a77c:1fe0:53f9]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::35d4:a77c:1fe0:53f9%3]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 23:53:30 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] configure: pass correct cflags to container-based cross
 compilers
Thread-Topic: [PATCH] configure: pass correct cflags to container-based cross
 compilers
Thread-Index: AQHYotCxuij0JeEDk0ykQ+iOuwsgSK2UaNQAgAALzzA=
Date: Thu, 28 Jul 2022 23:53:30 +0000
Message-ID: <SN4PR0201MB88084B3F0B44502FB10B2BC5DE969@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220728222237.307698-1-pbonzini@redhat.com>
 <48c09d94-9b7c-1417-64f3-f14053f084ea@linaro.org>
In-Reply-To: <48c09d94-9b7c-1417-64f3-f14053f084ea@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66633009-d053-41c7-0260-08da70f45fc7
x-ms-traffictypediagnostic: BN6PR02MB2609:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LlYngAxZ/9JDyhFW7k17X9AV4e2ZoxaZDKIxqUOelB6s4nGfky806+dJzGiOCL7MSDgeieUa4cKLLCZ6209yNXdM4DLRb8IDi76YeJhkkt31IU9wqWnSuZyIYkYBUp/4p0dx4W2bZx4eg4e2yYUsvSCtmHxJTmjT/ChuVpUO8D/p+ewhDRnEBUHMcissPvTUrMMaAEU7lm1aXorS1ZXlcVSUW4snmxYoKUaEOATravXSjqv5H4XLoTiVvCK4eqQMjpcEPy1IisqCSJ020vVKJ++JpYCDO18MQzJrV8PxhobhdnQlyAeNgQllwlc/qIfhkVvH9rnmnzzRTjcAtO8/YZUQXrUnOohkaOow5MWCi2Z16qtAo6dTyGC5gFXU7LQvxU47VEgmBDv3TUWmmUwAdb8uVLwMdf2q9d52wmaFentCbm6ZmHaegVqNGzZ4LBOtYzxhSMABFdqMZbd1SYOrQeN80p+jfUpfVY5RLrL0AR6y9gJzVc+PtqEmlm10o+vMSlU2eKTYu+N3yxJYtzRax8Sw6C4jd5WJ7Ww1StGaPD+Hk3fAW9sORzjXrVM2Y1RtUwrLQMHdx8Wa4PDE0xYbSd7w6BJ6VNkRhmtquILmNXJvEPUoJQJRlsnnIh0QWdf+Wy6U7yKvAMEHMIaxI2HW5lxxHfpGt6jKmQCVIFMy+qZOJz6FDEfgBvzPPIAiVudy/KN6+eDrPzidpX+6a4ABKqazM6Cw+D4zivr79cBSy7D5PRTr9zw8ZPMPLtAVH/M4ETvX0J5l73lsDJelzZXAtbnaYezUQI2aXrkC/6raZGS0oprdXK/HGkzKnjbqXvgR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(6506007)(55016003)(83380400001)(186003)(66946007)(110136005)(66476007)(64756008)(76116006)(66446008)(8676002)(71200400001)(316002)(52536014)(478600001)(26005)(53546011)(86362001)(9686003)(66556008)(41300700001)(5660300002)(8936002)(7696005)(38100700002)(38070700005)(2906002)(122000001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTByNW44bUVTM1dLQ09XYlI3OWo1djVUQkkrMFlEMU1LZlNXd1FMbmh6cW5j?=
 =?utf-8?B?NHJlSFl0Rjd0anZGRGtDbDBabGVEMDlFN012dnNJcFBNVlVLM3c1dnY3Yzk4?=
 =?utf-8?B?YzJueE8xbXl5YUR4REdKOVRaY2VCZzNWVmxDczRiRk05THQ3QlpPNlRnTUVp?=
 =?utf-8?B?Q0VPVUdnbTlVNUZGeEFESVNMcnRYZktDcmw4TmdMeHVmc0JrM3BsVkh1T05U?=
 =?utf-8?B?dnYxL3BtMGpMNm9YK0V2TFVSRjZyZGxyL1ZwZTdwUlRFcVdwNWg4OXFZY0ZW?=
 =?utf-8?B?cmc5aStsdVRvcmhSVGhGd0RnU0wyRFVaOGRPeW92cUZrMkRmVFNrb2k1Rlc0?=
 =?utf-8?B?bFFpZllzenppOGR1OUFBbi9GTWxneU9JdXM3QVp0dDVXVE9BNVNMcGJqWmVC?=
 =?utf-8?B?bjN3QjhabFljZGdPZktKd1ZYR091cSs2YmxJdzBZbWQ1TlJObnVaS0E5Sjcw?=
 =?utf-8?B?UzdsR3JBWmtKT25pbGdUcmlRc2MzZE5jQ1RKTTBZU2l4V1o5bDdQM0lHUlpC?=
 =?utf-8?B?WUltaFJZaFhlL1ZIeU5oVXUyL2l6dEUzcDNlbVUvV0R0ZnJETmZ6dDVLbEJy?=
 =?utf-8?B?eUtuVW90U3NLQTZtbmxpN1k3SVI0TlRoZStnRXExR2NURW1oSnJxU293MStT?=
 =?utf-8?B?R05KbmZFYnVxQmZSNS9URGN2aXdkVjhFSmNFNWVsQW5wZUJ3WGREOHh4RUdk?=
 =?utf-8?B?SWMxOXo0ZE1GOWhFaWRYN0pZakV2ZzY2WTBhNTJPMVFhei9OZDByTlFRRXpl?=
 =?utf-8?B?VHNZeHozZEM2MVJGaU5FMjRQdjJyNHZDZXA2ZzhNd2llMGw0UVRKNFQxTHFX?=
 =?utf-8?B?MVUvdVptR1RUVWFUcGtFT096R09aWGQ2YU1HRHd4ZHpVckNOOS9QVDFtZ2ha?=
 =?utf-8?B?ZEJhUGdNZjR4OFFnWnVNZkxwV2FTdzlkdWhPSlJHMy8ydDZTNzMwNmJha29t?=
 =?utf-8?B?NTNGRHRmaG5hcmhQVzRYY0FaWFRzK3ROeWZpaHpYVk90VFd4UERoRTk1ZkMv?=
 =?utf-8?B?SWhudU9aN2FQTXZBMHJIcVJSa2w0OEdwanZiVVU3QkNaTjg1cVFFWnlzOFFk?=
 =?utf-8?B?UWdJNUZuc0kwMENDaXpTVW9DYWN4S2U5QnMxZVRnSzB6U1VmKyszMEgxMkRQ?=
 =?utf-8?B?clFwNUhyQW0wSFA0RmFUbzRBazYrWnBadVByLzNObXV6dHFaY0l1RlZRWldJ?=
 =?utf-8?B?bytqbVpxc2hDVUJNSEpGR2pBYXVGWGNBNFkwTjJkM014eEdDUDZ1WHYvQnpB?=
 =?utf-8?B?QU10SXFacWpHK0hicVZncGsvYURIdEJZNmtHdmlySjFyQjAxUzYvM2swMFJL?=
 =?utf-8?B?aG54clQwMStSVUhJUyt4TzNtUkRxTk52Z3oxUjlQeFN5K0JsZS9jQy8xSzRo?=
 =?utf-8?B?SUJRNUpvODEvMlYwY3lJNS9GTUUzOU50cHNTaDRPWndva0I3NnFnT3I3VHR4?=
 =?utf-8?B?SFZWcW1rTUVLajF2cE5HTFlFMDRvUXgvL1RoR0xaL2hEdHQvdS9nRU5mL0N6?=
 =?utf-8?B?Mkp5RTlHMjBwdUV5OGhGalNycHlSUmRMeFMzNGdhaUg1akgwYUljYWlIS1cy?=
 =?utf-8?B?dWdRMnJZc3lPOEZET2cxY1ZNUitWdzMyeUw0QnM0MlZ0em9GSWJVZDlzYjFU?=
 =?utf-8?B?Yk9memZ5VjZtU0w1djN1WTZ5ZEhIY1d6SXpvelRnRW9sY2tncURZUEJ6Z25L?=
 =?utf-8?B?d25nY0NDb1c5M2tVVCtjNUc0ZkVNY3lrUkIzNFlQWTFQaitzcWVGODhxa2xN?=
 =?utf-8?B?VVJPclZVSXJmTXQrS3BNRVFLc1JwQ1oyL284RkZiRVR3d29yK3diZnFvNWNn?=
 =?utf-8?B?c29CRGx2NWkvSEZHY2ZFd3BzODdsS3R0WlF3UkM1TzhnRGMycHB5WW51eE5w?=
 =?utf-8?B?azdXWm5iZExtZVhrR3dQZVA1NDdjT3k1MlFPOTBNaXFCZWpZaDlZR3c1Zjcx?=
 =?utf-8?B?S3IwZTNDdDlVT2kzK1hEVUoyQlFUYTJ4V21TNitqaTNFMFo5OXZQR3FpMmdN?=
 =?utf-8?B?bFE0UGJDNTc0VmhLL21XMHRwTGdGOHBEaEJ4TVZadVJqcXFFTURvSUluRWNX?=
 =?utf-8?B?UE5JUlhGYkdMcEE3a1U5RGxaWVE0WmgwK1htdWptTytGQTcxSk9IWGRGSE91?=
 =?utf-8?Q?Fh3k04WoWJHtIcLYX4o/nd0BK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66633009-d053-41c7-0260-08da70f45fc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 23:53:30.6930 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Upw/gUUN5DnAAZmYc41MagrVhYzM0WXhcdLXKBwKJavdDTVRqvEK6MMDa6usKTYA2vav9Y38qk83v3P1Bz52Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2609
X-Proofpoint-GUID: MwX3Kw9rxmhFWbqhyjOIdxin69BJFUE9
X-Proofpoint-ORIG-GUID: MwX3Kw9rxmhFWbqhyjOIdxin69BJFUE9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-28_06,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207280106
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5
IDI4LCAyMDIyIDU6MTEgUE0NCj4gVG86IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5j
b20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IFRheWxvciBTaW1wc29uIDx0c2ltcHNv
bkBxdWljaW5jLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gY29uZmlndXJlOiBwYXNzIGNv
cnJlY3QgY2ZsYWdzIHRvIGNvbnRhaW5lci1iYXNlZCBjcm9zcw0KPiBjb21waWxlcnMNCj4gDQo+
IE9uIDcvMjgvMjIgMTU6MjIsIFBhb2xvIEJvbnppbmkgd3JvdGU6DQo+ID4gcHJvYmVfdGFyZ2V0
X2NvbXBpbGVyIHJldHVybnMgbm9uZW1wdHkgJHRhcmdldF9jYyBmb3IgaW5zdGFsbGVkDQo+ID4g
dG9vbGNoYWlucyBhbmQgJGNvbnRhaW5lcl9jcm9zc19jYyBmb3IgY29udGFpbmVyLWJhc2VkIHRv
b2xjaGFpbnMuICBJbg0KPiA+IGJvdGggY2FzZXMgaG93ZXZlciB0aGUgZmxhZ3MgKGNvbWluZyBm
cm9tDQo+ID4gJGNyb3NzX2NjX2NmbGFnc18ke3RhcmdldF9hcmNofSkgbXVzdCBiZSBpbiAkdGFy
Z2V0X2NmbGFncy4NCj4gPg0KPiA+IFRoZXJlZm9yZSwgZG8gbm90IGNsZWFyIHRoZW0gcHJpb3Ig
dG8gcmV0dXJuaW5nIGZyb20NCj4gcHJvYmVfdGFyZ2V0X2NvbXBpbGVyLg0KPiA+DQo+ID4gUmVw
b3J0ZWQtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4gPiBGaXhl
czogOTJlMjg4ZmNmYiAoImJ1aWxkOiB0cnkgYm90aCBuYXRpdmUgYW5kIGNyb3NzIGNvbXBpbGVy
cyIsDQo+ID4gMjAyMi0wNy0wOCkNCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYW9sbyBCb256aW5pIDxw
Ym9uemluaUByZWRoYXQuY29tPg0KPiA+IC0tLQ0KPiA+ICAgY29uZmlndXJlIHwgMSAtDQo+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2Nv
bmZpZ3VyZSBiL2NvbmZpZ3VyZQ0KPiA+IGluZGV4IGM0YzAyYjg0MzguLjcyYWIwM2YxMWEgMTAw
NzU1DQo+ID4gLS0tIGEvY29uZmlndXJlDQo+ID4gKysrIGIvY29uZmlndXJlDQo+ID4gQEAgLTIx
NzMsNyArMjE3Myw2IEBAIHByb2JlX3RhcmdldF9jb21waWxlcigpIHsNCj4gPiAgICAgICBidWls
ZF9zdGF0aWM9DQo+ID4gICAgICAgdGFyZ2V0X2NjPQ0KPiA+ICAgICAgIHRhcmdldF9jY2FzPQ0K
PiA+IC0gICAgdGFyZ2V0X2NmbGFncz0NCj4gPiAgICAgICB0YXJnZXRfYXI9DQo+ID4gICAgICAg
dGFyZ2V0X2FzPQ0KPiA+ICAgICAgIHRhcmdldF9sZD0NCj4gDQo+IFJldmlld2VkLWJ5OiBSaWNo
YXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gDQo+IHJ+DQoN
ClJldmlld2VkLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo=

