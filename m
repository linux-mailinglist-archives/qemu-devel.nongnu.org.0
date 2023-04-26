Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6B06EF97D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 19:35:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prj2Q-0007WO-Mg; Wed, 26 Apr 2023 13:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1prj2M-0007W6-HF
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:34:38 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1prj2K-0001tC-Vk
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:34:38 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33QGoI1I023477; Wed, 26 Apr 2023 17:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=bLr/wx8xzw9tJI1R1to71K5wHlz5a8jwAm40Xw2koMA=;
 b=fpMZrn/gjDlVzh1W6jaLQ4oF9PGMpN4Hko9oAJV2wJ1ySJchkjcE5CWhYfykd7XyIUok
 LM9xi39Wv3ZhrEEMV+gPLU9NVG/APfzhpL591Ev2Y943mFYRh+n5tJqYiiYTIFoWvkKB
 UCEeUeY6tVcyX6tarQYdW0cy0z3zypwpZ9+Qo84+at9pidd15GBE4b+4TKLooXZ+Y3hr
 YbbowVGxmvTLnR6m+uNtGgHZvj5z7JhXbRDDbOEapBAkYinZuo7e6eBkSxLUbpKDvPVv
 JMN2bky3l5I8TZvKELnT4lRWTTXtlEG1cBEj5HAF7hdjm/DpTKVpRU8aSarMv0tPpcLS gQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6uprsvx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 17:34:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSZu+/bdflvVnI8ovjH/6WCAgVeOEpylTfNbQUVVdvVyhxJhLv2i3pi6JafeI8p7ZNzt5lqwRyadxYXSr5zbgfyRcKOULMBe5C8ULL/8eQ2JYJqwin9EpPpp08yn5t1L2tsy/jMhjkPyEaT24QoXLT6CgOZ0gEo+YKFeai67Q+UAiH3Q292i9JboTVe/2V3sVc0ViXZTpl/Rp9aQLB1Rs1zmMjk3wZLiSB1Acc56tYntS5jJfvrMilPP/almmifbkf9x07M3nEzMYy+wx3DFg/pFPIs0S/vUqwt3agS6S2oSMiwbtL8sY7AKOoBun+B1aT2Mbi+l4AzKgqCif5v8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLr/wx8xzw9tJI1R1to71K5wHlz5a8jwAm40Xw2koMA=;
 b=nWQZo97Qh4LS6FIrAAv0yJrqbAdk3Bxq8dVfiMzU0W8F1B05WLHdZ5NbnEeKoUk0m0Kq/HxkRQwX/hWgZvIQ6cXqmhfNzOmfAeb93WZzOTy/Z7xztHxQPnZjEHITz2+96/ikbD4BccDap1Klxmj8iyF03bzZIiCl8ec/B/meVMFT8OoOIvUoRO6yyaPOINhd5tFk3E7c9LrgA7NDlsnHzpw5NeCXsLGiJplqXLua2DK1PzZwejrsl4vNEW6SXDXmDHZcvlEMYjOeY+nl1JZV57PVJ6b15H3jOOFuOAvJ6SEYKhN9DqG8V8dGteWJMOwVmyhhL4mA2nDvncYDjJ9yrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BN0PR02MB8127.namprd02.prod.outlook.com
 (2603:10b6:408:162::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 17:34:30 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6319.032; Wed, 26 Apr 2023
 17:34:30 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>, "Matheus
 Bernardino (QUIC)" <quic_mathbern@quicinc.com>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "thuth@redhat.com" <thuth@redhat.com>
Subject: RE: [PATCH 01/21] meson.build Add CONFIG_HEXAGON_IDEF_PARSER
Thread-Topic: [PATCH 01/21] meson.build Add CONFIG_HEXAGON_IDEF_PARSER
Thread-Index: AQHZd9fIdiZnOkeeLESqQGeGvWX1s6892nGAgAAASkA=
Date: Wed, 26 Apr 2023 17:34:29 +0000
Message-ID: <SN4PR0201MB88087A08D84821A31DCADDC5DE659@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230426004057.1318768-1-tsimpson@quicinc.com>
 <c9fd83bb-34d4-5f3c-3b75-6f0eafc70e0d@linaro.org>
In-Reply-To: <c9fd83bb-34d4-5f3c-3b75-6f0eafc70e0d@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BN0PR02MB8127:EE_
x-ms-office365-filtering-correlation-id: 1c55ec55-1c6a-43d7-d714-08db467c7d8f
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NPSVFpBSnTaM8Imj1cQn1XgOPhwhlHIr6LEMe4rlnPGRc0XPf4TrhdO1i4lb6t/XEFGkimchi506lkJne3Tc4W+LGKJdaAr1IaPnYWFFrjpsAaOPc4Uuo/wE96WuKGQamXmqbiWh+jPT8eWtPg2WL3JkKU3pmtxAUbpFRyJzaoU/mCU/326PySTw/X3Oab6QQ75Ni0fwqYpu2X8laS+lRm0HPMsXt6sYVg2h2c1Yv5o8aTBhZXiUAAmJxrcSOJrWuToFHsyA2omGyk8+Gjs+ftM9J8IvxHAw/IRdN5ovYhmeCpGwfMjBG4MTUkVs/EJv+rfRbaPtuapPo743yCDw3rbpT8a4YEGbEsgE1vidQhW3+qhgJI4S2EIlZN8Sj4R4cWgreqTs9c6XiR63WGB5JEK0A54men+/Ko3tmaEBaTCTm/i/QcHPow01So6AHGTxfv4vhVLuXw8xmKBdAwZMPaYYysLBQcDxHtmwyXUWO/BysQn0HvJE37WnjrUIayCxbOIjrKVrCTmIbMxLve3d7Ucm+TmjI22A5YMVXYrp4iFEjIQy0v+1ATRQyy7pShHNggmiw67+bHYrvzujh2icLscFzpCJ1JwmwWAuNPYSCHmStVWrm70Hd35wahK2XcBW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199021)(53546011)(41300700001)(9686003)(6506007)(186003)(26005)(66446008)(52536014)(66556008)(66476007)(4326008)(64756008)(55016003)(5660300002)(76116006)(66946007)(316002)(71200400001)(7696005)(83380400001)(110136005)(38070700005)(54906003)(8676002)(2906002)(4744005)(8936002)(33656002)(478600001)(86362001)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHhsQTlZSWFTaHhGQkNVUVc3TndHbC9ETW5NVlJUV1FoTWlIK0R4TDFZVVA4?=
 =?utf-8?B?ZmkzSDl6TWZSYktKeFZDWEFKZWJudDlCR3E0eTNpZkVxb0ZLaFlXQmF2OURz?=
 =?utf-8?B?SVRTRGNybHBXQzVVQWlLVVlSVk0rUFR5U2pVcGFjekhRZFpuend0Nkk3ZEh3?=
 =?utf-8?B?VFNzWDFyS0hpNDlVcnFCSXNLeXM4N1N3K21talppdUxCdjJnN09IZzFLN2Ir?=
 =?utf-8?B?aHFOUGNIZm1YakJGT3FTeEZQQUY3QUVCTXg4VWtpSUlNUzFaQjZ1WmNRamht?=
 =?utf-8?B?dmlrNnd5bGdLMVQ3ekNxVC9tdUg3TWlWMW5TZTRqbEdHTkhLQVNZMllQakVQ?=
 =?utf-8?B?UUZiaUtiNkJsQU9GbTBEYnpaUE1wTUUvc0N2RkFUL1FjdXNmMFY1SmJIb1NB?=
 =?utf-8?B?V2U2NlRtRlJhOEljZkJCemFNbXZrTTJVeXp5YThSMHp6UWlhdlMzZHEzbXR2?=
 =?utf-8?B?aDNPWi9WYlp5L2V2TDFveDZPTzBSSVp6Rm4rY256VFVNYWlyWTdFQ1lFOEt4?=
 =?utf-8?B?YjFGRGdtbGVVVlNiTXd4S2ZJTTBpZURXRjRxRkpVUjlXc2VCYUtEUnNkZmdW?=
 =?utf-8?B?NFNwM1FkNlhCaWZ6UW5JMnpDU01zeHowUjF3VkRkM0ZQemRzcUs3Vms3TFps?=
 =?utf-8?B?c2dXamR1cFBFVTdwQ1pUMnVOUmlNKzBocFF3ZTJFaVk2aGh3UzZYM0MvQmZs?=
 =?utf-8?B?VndnUnprZHh1ejI0VWlwRHF4VFArQ0d2azFTV2pQRzBuN3I0U0QxTHdoYzBa?=
 =?utf-8?B?VU1VQVJua2lJL0tWbkVpdmpZTFRpeTdXNnhOUWJCeUxUZWtiYktwaHFUaDdy?=
 =?utf-8?B?NmtHRkxJRTNlRytBWHVFV2F6MzgwSXV5aGFkTjNUTHdtL3dGdEhWN3lsRjYx?=
 =?utf-8?B?NXF0cVBrUnl1Y2NCN2dWVkVrSDBiT0JiRTNYLzAyTDZVNUJ5cWNwRGU4dnBv?=
 =?utf-8?B?NHJCSTRReXpDUnQ1cEVXS2tGNWlFWGhrbWVMUCtoTkF1NHNHaDhKOVh6b2VD?=
 =?utf-8?B?dXJYdVJVZzVEeUd5RUdqVnBZc1NYMVVEVDZYRExiZ1BCUGxyVEFvRk9vWHlQ?=
 =?utf-8?B?ZVdhZ0kxM2RER1VWUU15N3VPalJSZTBuaWQxeUV0KzNQWmdhQjhoY053QTNS?=
 =?utf-8?B?bnhDdWRHOC9OV1NocXFraXFjNUpIS3pTclBUQUU4T1JncHA3bUFha0gxcmpC?=
 =?utf-8?B?V3hSeUM1K2Yzeis5NDNDNzZwY045VHRKdEQzMTVvR1FLUlA1YjdaT2l6R2Vh?=
 =?utf-8?B?dzZmUkdES2N6U2lFREdiN0EvS3VJYW1iSWI4R3VPZG1GOWxyQ3NOQ2d5eUxD?=
 =?utf-8?B?OWREMWYzeHpvUzNSRXc2bFE5RVl0d0tkeWI5aHBmbUxadmtFVnhqbmF3aVlI?=
 =?utf-8?B?U3ZkcVc5UmdvMzQ0RDI2eTlUTWJGd2pVYTlhQkcvdi9oM3kwRnN2YmJ0Rk5w?=
 =?utf-8?B?R0Z1RDJRK285RXloaVlTa2tFVHowNHBPWUJheisvNnBRcE1LYmxJcUY2TGFx?=
 =?utf-8?B?S2ZmT2FYaGJ5eG9JZjlTY0VWNTVSNFlQbWRrVFE3WTlxMzNVVnB4M2VBbFNK?=
 =?utf-8?B?YkdyVFpPZjhhcmlsTWNlb1lZTCtNRDBKTDJ1NUVReUhIVEdEZHpvR0pmdnNL?=
 =?utf-8?B?NVkxdXJIdjlzUENmdlNWbG9qK1FVVGlqdzRUSm1rUmFVS1RFSVNWSk1HN3Nt?=
 =?utf-8?B?bTdKRHU4Zm1WSVdxTXR3RDVwaFlFNnFTYTRtYk5pcE5MS04ySVhPQ0d6VFd2?=
 =?utf-8?B?bGlMQXo2MEprZ0VuVE9HRUpJdDgwaCt1WlY2RjBFUXd1UWtnTTZyK3VuK25Y?=
 =?utf-8?B?UGJoY3liZE42UzBvYXVmZEZQaGJuRlpuMVhTV1dSYUtiN05qNXBhMThYTTM3?=
 =?utf-8?B?ZU1QUUZlZzFOay8ybnpBS25GQnRkVmxNL3JaWU0rUEJpc1Ztemh4bjEvT09o?=
 =?utf-8?B?WEF1cjZXcW4rWDhrdGZIOHVBdXdhSUxjR3BXZVFjRVdPSllVUm9SVk11OTcz?=
 =?utf-8?B?SHZJQVN4bUx6SDdOV0dhY0FnYnZjQ29UcXN5RldBQXo1U1p2eHFDaHhmQ29H?=
 =?utf-8?B?Q1NCYzNtWFNiNUl4VVF2SEdEYkd0eTZJZXd1ZDY2UlllQjdWR0ZzbU1VcW5n?=
 =?utf-8?Q?SsviBqk3+uNeEkbMm4+6J4rvI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 8q7whGUSLc+OIKs6WAziY8ALNn5dPYsYjPFfZBL2M0QLCN/PDFro+k2yyRJAa7RBg30F/L/MzdUwcvdDVJ+hCiyXhR1+0KvHPnmDm6hGawih1+yNpLRw1tN5jNugenrk5k2Z0TPctzgw6BPox0M6lQ0vmTN7u2q6ehByGUxnxUAZgYQMteGSSrry5OUsQt7e1zk+6Cj3Gk3QuYUOmbacRlJnI/Jyf536lNHrT9Z6GWXT1eHFw+J2oX4mdP7ZDEJTQNTlOtWZ3q3w7QQ1AxyGIYjYhJszi2DVCQWIpmAdSLAGLoZDJSwLjTOaVzlXypjN6Jvjx6u3omOEotBaN6qolFCiIbfsy8N/t8Bc4dKy3nGLSYVucvzLPzfHnkqI+8h7zxiUGDOyqO8FX6jD1/2gwLH7n36LZkUDxF/+qv/Q1HUv62BeP0LZ2F/RVQINo7/yElmnnoJUDu7GwLCGnvAj3a7fgUCUD4XTBjGDO0boa7XcQNS/zjgYHo+34uX3rmcOKAxczvhbaMXTeU752BmVsiITr4ue8A8025jrSfmV7Linv3ytxTJindQA7RbJdnki+HL1A0NKaumBDpj0hhekcotiIhG/kjlwamkZQ4ElZOchOQFVFLEyEb2jWQYbjXAikF0X1hFDel7WMjUHLmP1srMd+/XcXrijJFC1NOPR3pd2/PdvJ6s3aCuGDYq01Gyq87aZFJhENW8S7Ex41x633vtemb7J6AU9seXrW9bhnqYwteAK7UX8h+1kfPG+nO1tUxiJ5m4zayRv/Se45RHv9Wd9rsk/KTxaQVvbcoHwz0e6tnRLWcSUyIfnR4H16lcb/UrBp7TOlKsgnx/cgVtGqg==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c55ec55-1c6a-43d7-d714-08db467c7d8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 17:34:29.9468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vwZMpWS0FfF33ef4RB4xKU4GnlTFor4J5qKe4myBhk+cLuJL0KCh4784i2CnescDruFz8lOZcM5LBTdERbLmDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8127
X-Proofpoint-ORIG-GUID: -i1HtLpkRknS9nJTx1wMrHPGEDnkKd7c
X-Proofpoint-GUID: -i1HtLpkRknS9nJTx1wMrHPGEDnkKd7c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_08,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=497
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260153
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXBy
aWwgMjYsIDIwMjMgMTI6MzIgUE0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWlj
aW5jLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogcGhpbG1kQGxpbmFyby5vcmc7
IGFsZUByZXYubmc7IGFuam9AcmV2Lm5nOyBCcmlhbiBDYWluDQo+IDxiY2FpbkBxdWljaW5jLmNv
bT47IE1hdGhldXMgQmVybmFyZGlubyAoUVVJQykNCj4gPHF1aWNfbWF0aGJlcm5AcXVpY2luYy5j
b20+OyBwYm9uemluaUByZWRoYXQuY29tOw0KPiBtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb207
IGJlcnJhbmdlQHJlZGhhdC5jb207IHRodXRoQHJlZGhhdC5jb20NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCAwMS8yMV0gbWVzb24uYnVpbGQgQWRkDQo+IENPTkZJR19IRVhBR09OX0lERUZfUEFSU0VS
DQo+IA0KPiBPbiA0LzI2LzIzIDAxOjQwLCBUYXlsb3IgU2ltcHNvbiB3cm90ZToNCj4gPiBFbmFi
bGUgY29uZGl0aW9uYWwgY29tcGlsYXRpb24gZGVwZW5kaW5nIG9uIHdoZXRoZXIgaWRlZi1wYXJz
ZXIgaXMNCj4gPiBjb25maWd1cmVkDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2lt
cHNvbjx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4gPiAtLS0NCj4gPiAgIG1lc29uLmJ1aWxkIHwg
MSArDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IEFyZSB5b3Ug
bm90IGF0IHRoZSBwb2ludCB3aGVyZSB5b3Ugd2FudCB0aGlzIHVuY29uZGl0aW9uYWxseT8NCj4g
SG93IGxvbmcgZG8geW91IGludGVuZCB0byBrZWVwIHRoaXMgb3B0aW9uYWw/DQoNClRoZSBkZWZh
dWx0IGlzIE9OLCBidXQgd2Ugd2FudCB0byBrZWVwIHRoZSBPRkYgb3B0aW9uIHdvcmtpbmcuDQoN
ClRoYW5rcywNClRheWxvcg0KDQo=

