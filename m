Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F6355BF56
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:08:32 +0200 (CEST)
Received: from localhost ([::1]:42364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66Gt-0000XO-6I
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7178e17cfc=pdel@fb.com>)
 id 1o65H8-00066e-Cr; Tue, 28 Jun 2022 03:04:42 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:19714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7178e17cfc=pdel@fb.com>)
 id 1o65H6-0000Jf-5R; Tue, 28 Jun 2022 03:04:42 -0400
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1eZs029348;
 Tue, 28 Jun 2022 00:04:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=YhqYD58m0z3KABcYuu83veHcHgRZHFmJzkHmnLtlOfs=;
 b=pc07mQTEJl6fO8w2ow0CBHqpmnMAHz2LXxTNNN8hO0PxLieFs0ItwD1uNmNt0yXZSIV+
 FLv/W0hDy/Jm46zhXTJT7HHMUyPFLafz9Ya9HiD7qU8jG+7PM4BOSRKiBp1qeA98sBAK
 v1jowOSfA9XWepsrlVUoSvqPxXA4T0pot0g= 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gwwpqgfga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jun 2022 00:04:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOUpBEkByCf9c0Tmx/3dZuHNqlotOVKD51eN4Mj9zkGgv5Fvo8KTZbAbARnrdgj/BDsp/X2n/JM0TRNBUM+iuLbrlPX5oVnjLL3CKpMBLzjtweTWL00Nm7OH1iUoKajSr/+QzNeNXJhH6cN4kA7HHdaX5axRdpXRG5nzZ8a+jqxlGEVXWCI8mDohZEDEU5VfXDT0dnwDe96MFqaB3cKvHk/cfIKRdKLXnffsUdz16hBECz3lt24lIjklXoFtzM3okLqolZ15z2us4tE0oEtr2sT5JWAHN8Q6kBJRp2BO7J4WV4liYtJcQ8B0RJqo4NRBnvl30TqR+pVJNVdWbKdkyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhqYD58m0z3KABcYuu83veHcHgRZHFmJzkHmnLtlOfs=;
 b=M7DC2Cbe7ZvqjEl+rRXXESus0cyYS53lq6G1bMfXadzxMfkRDg9tdaUQppDMhL0Ir7FMacDhTg9/KtI7/lNjMjOPBmCxcw4WVExWi4edTCvKPWf29vIZjJo3nnK0I6Z7zYtK6USlHcb/sCDHvx8utDIgSRxKD62AkcVJwrKZb95CP4LpuaRZdA6RSj/PrGINGmga3Dj79elaYQfA70eEbLpVickT7iIBJJ32Z2Wz6g3Y/cvuhibwuw6NFtVyZ//EhR52MOJrHsV2frkZmuW2ph6zgQqvl+6ZUCMafoG5ZewXwRSLvh4mn6/sAohaTKMYTG4L4O/p/DFSs1K7KKOoTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by MWHPR15MB1453.namprd15.prod.outlook.com (2603:10b6:300:bd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 07:04:28 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134%6]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 07:04:28 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Peter Delevoryas <pdel@fb.com>, Dan Zhang <zhdaniel@fb.com>, Cameron
 Esfahani via <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "komlodi@google.com" <komlodi@google.com>, "titusr@google.com"
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Subject: Re: [PATCH 09/14] pmbus: Reset out buf after switching pages
Thread-Topic: [PATCH 09/14] pmbus: Reset out buf after switching pages
Thread-Index: AQHYil/h4Rl0fpDiyUeDKZd3GNGqMq1kYi6AgAADroA=
Date: Tue, 28 Jun 2022 07:04:28 +0000
Message-ID: <A88BCA80-BD92-4436-9647-F1804C364734@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
 <20220627195506.403715-10-pdel@fb.com>
 <dcf7d788-1629-0fbd-b511-9c1272a5f7e3@kaod.org>
In-Reply-To: <dcf7d788-1629-0fbd-b511-9c1272a5f7e3@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f469e468-944d-4669-3a80-08da58d47140
x-ms-traffictypediagnostic: MWHPR15MB1453:EE_
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b5PH64gVAgzunRw/zHzG2X8A0JXUfTvj67OOVKaAyWe4AwJ2pBhfv44hwUA9v6wndmhrQS/U2gjxoKGsSnlUJNarO4OLoUou7bva6coNGBrdEqmdlU8LKKUlvd61/EHkitphtshXTSLPrWid9utkuOO9djiM80BWd07LEcEk0TqvBOS2CXCX87Q6SNEia8Fsgb9F4FaC+4oYeJMtyQfUiTLLaqQRsnqLJhv0wp9r1NTnaLqHG/+n4+7vzipJGLcZzZ8ewvNjhFgdNKKX6weYSE6CJf5QHweGWXSg6/Afd+zgRk9VinkwF2ouvWqTyH7Ipb6AMFI4nLLaou+MEkw8N1FIpJjh3w/zn1j2h0NGhR2JT7fWnRNu0DtK3fCnViOhH+0DDAxyZnVFW/0wI2/hTLUe9jLUMSQlP6EHkogxaAaqGjArWR9OQZaZFi/YJeQ/ghnf+DTNhBz8gzfUQIBCIHX9Gsn2g5FEAhD/us+TWVkuQzyNkcuBdnK+RhTq2tcDbQ3prnYluqJmAMUcIJd+o3bH97Te0vZLFv0W7/yQCYVxB8ARdtrOFwuFzyp3ZlIYU9EkjVqSlg+SuHCvg9cILKduQA8UmQpLPOVHqNNWqj8B6jGLU5nUxeMCHHx+4bvh9obIY/wKH0plEpf6wGNMpwgk8ASjWL1iCUQGNIV7UM9s1aQxlIAGG+CFeHCfHJiwiLokOcDKYV2rC1RmJHMwJys5CZyo+jwwsohIkLPCJah4xYQgClJxdkjLRJGKL+FuzcatytzFqY8SDjBnLJckYg9JM9ZTY+45W5kQu3G+AhSw1Btiyyd60RIhQM5+XBUFEubQunWq0S/jOUrLmlnsVw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(5660300002)(4744005)(38100700002)(2906002)(64756008)(122000001)(66476007)(38070700005)(6506007)(41300700001)(4326008)(33656002)(66446008)(8936002)(316002)(71200400001)(109986005)(86362001)(478600001)(36756003)(54906003)(2616005)(66946007)(66556008)(6512007)(76116006)(91956017)(8676002)(186003)(6486002)(53546011)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmFLVGQwMUl5QnU5VW9sVFdDVnk3b3c4ejNqK2J5amhzSkwxSmt3b0ZMMEpj?=
 =?utf-8?B?Z3F0QnRrL0d0SVJ6Y3VTZjZqTC95WXZaZmJXYzI2M1JUYVFPYU5kK2swTEc5?=
 =?utf-8?B?WUl2TGtGRTJzQjhWV21MT3JLemlPRDB5VXJRL1ZpekErdmdYck9MbUpoM0h2?=
 =?utf-8?B?RDlFbmo0U0RFNEVSQ3M3Mnh1dER0ejN6USs0RWp6UCtjbDcyNy9hZFYyWXM3?=
 =?utf-8?B?YnhOMU45ZTNqV3BLSjk4bXhHS2g3QVZ2dUJGTVpENFFxejk1WmVIUkNlTEx1?=
 =?utf-8?B?MkpoY1g2Wm1PSjIxelg2ZFNPd0ZJQUV0T3ZraXlkWXY4cWZuNTd0RVFqYnJF?=
 =?utf-8?B?NXUwa21hK1R3VGtKcmV1MlJuWU02WlNTQ1NjMEVIRnRCQmwxRlRtOXFQcHA1?=
 =?utf-8?B?RmIxMDd5cnZ5dmIxSUI1OGdRZTdMK210ak4rYWcvZk5TYTVGS1VNR1VzNXRY?=
 =?utf-8?B?N00yMy9mVVhtYUZwV3ZCL3pkK0laSlZrb1NCelRVUEhGNzNOcDlZWldMcjI5?=
 =?utf-8?B?cmJ0dW5pL0FmeTgxUkJIZ3BOdTFVT2FRRnRDdjRESk8zc2VxWXBzZFAzNU1i?=
 =?utf-8?B?ZEl6Y2R6NUZsUVB4RlF0a1pRMmNHV3JJUndUeUNIRi9hT2lpWU0yQi9nTGxq?=
 =?utf-8?B?eEZJdVpzR0t6SFlqYlRha1RQR1Azb3F6c3J0cVdmeEphdERmQlBlZUlHUmpM?=
 =?utf-8?B?eEN0ZHpQT2preDhtM1crUlZML3FONG9Mdkw5NkFMUmI5YWV1eVJIdWpNNmFU?=
 =?utf-8?B?T0doOUlEbmczQkUwWWJmZEJoVjBKeFE3a1FNUElLMVdBSVQ3Tm5SaGd2RTg1?=
 =?utf-8?B?OEJkR25aRVB5MnZPNFp4bGUzV0E3NmluSnVCRFlndzMrVlV4QlpFVks3MjNN?=
 =?utf-8?B?OTNoTEtLMFVIVzRYYWhTTkl3bEhDUnNKQUlOWHVlYTVQSmIrRkpkM3pUWE1R?=
 =?utf-8?B?a3pLRjAxR0g2dm85RFQwbjZGcC9WWkR0UWlhb1h2cFlYclo3VFphS2FqUzJ3?=
 =?utf-8?B?K1hPT3UwajEyK2RTYTNxTUZzNVU1dGpPaFhvOExxK25lY2tqMDVWRHdnNG1q?=
 =?utf-8?B?L1RoVW0zWjUvOEFPeFN5ekIzOWt4NVA0eG9aK1NReDlvWE9rdmVQVUhsdEEz?=
 =?utf-8?B?ZklRZWJ0RmtoYlZyT29UeFN0OURobTlITFZPZXBkbHpoTW1mSFdaYjdIdEtW?=
 =?utf-8?B?ZlN6ODFzYXBUQ29IUlRQYzhqMjNUSkNENHYxRkhEMWt4azdPWFhKc2NteUM4?=
 =?utf-8?B?VHBpeGZwcFlOOXpKVWtGaDF1TzNKckV4cXJxdDNDN0RnYkF3ZURXWXZsam5F?=
 =?utf-8?B?ME5yUldvcElQaWlqSDc5czNWUy9XR0xRa0RPUk5aUlFXaStXcGtFRUdYUmZ0?=
 =?utf-8?B?WG5ocTIwTGxra1JsTnA2NGh1UWN3Z3NudDRzaDhVK0FtY0RuUzJXbjk4ZW03?=
 =?utf-8?B?cVh3TE9CekcyMyt5QVl0ZkJLM05RRWdMTHFJckpLOGN1allENkVJNHdYM3FJ?=
 =?utf-8?B?SDUwMWJRa2FWV2g4ZDFnWElMdVVTOUVQV0xLTVJGbVhYdFFWQzlsWlloU2dv?=
 =?utf-8?B?V2N2Zm1vWlJZdjJwSjZ3V1E5OE1wVXBmS3NsVm9IWk5XUEhLRUdXQktzTURx?=
 =?utf-8?B?U3lQM3A2S01vWDNtcUUraHNScGZhTUpIaG1JY2FmeS9uaHVvdFVPL1YzNVVO?=
 =?utf-8?B?SXpCN0ZJY3NFbGs5NGNSMHNTT29OSkVYSTl6UDA1dFBkT051RmR6WFN3MVhR?=
 =?utf-8?B?aEkwZVAvalh6TUdHc05mUC9NM3c5WjJXVVc2aUVEWER1TFFib1ovL1N0WEwz?=
 =?utf-8?B?alkvaW5xVjZoOGpnUzZSOERrRW5mSTRXT29vM1QzQkJEcW5lZS8wK3NEa3FY?=
 =?utf-8?B?Yi9ySU1JUXpEakJac1hpbUZBQWZIMFpoMUlNRUFHa2pDOVdlN3hlc003WHk5?=
 =?utf-8?B?S3F4aDZmYUhzMUpyYkZOcUlrbkZhUnRZYkJybEJNVmRtOWpsclphTDhDTVQw?=
 =?utf-8?B?eE5nS1FBUUErT1JQSkZxRDFpaTdLZkhtajBuai9PMnNyWWVQeXJXeHhxbjd5?=
 =?utf-8?B?SmlGQStJSTg5cnlaWnVGNlEvSGpuOE55Zm5IZWhvVmJYZ2hXbThRMnRoTWR0?=
 =?utf-8?B?OE1LWi83ZWltWW14b1Y0VG92ZFp2Y082WTVLbDhsV1liWmRZSldqaHB2R1Ar?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <432367376197994B8C29C8B72171F9C5@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f469e468-944d-4669-3a80-08da58d47140
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 07:04:28.2067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xivj7zexu2kRU5fEU8/TK3CEEf4rFxKmD4wSmT5WzXdO3cgwiRLMxHoNeMDNDxOe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1453
X-Proofpoint-ORIG-GUID: LTkSE6fC7hI7vn8Nk_brM1Sm7BNtacrK
X-Proofpoint-GUID: LTkSE6fC7hI7vn8Nk_brM1Sm7BNtacrK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_09,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=7178e17cfc=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

DQoNCj4gT24gSnVuIDI3LCAyMDIyLCBhdCAxMTo1MSBQTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNs
Z0BrYW9kLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiA2LzI3LzIyIDIxOjU1LCBQZXRlciBEZWxldm9y
eWFzIHdyb3RlOg0KPj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgRGVsZXZvcnlhcyA8cGRlbEBmYi5j
b20+DQo+IA0KPiBpcyB0aGF0IGEgYnVnID8NCg0KSSBiZWxpZXZlIHNvIHllcywgYWx0aG91Z2gg
SSBkb27igJl0IHJlYWxseSBoYXZlIGFueSBleHBlcmllbmNlIHdpdGgNCnJlYWwgcG1idXMgZGV2
aWNlcy4gQnV0LCBJIHdvdWxkIGFzc3VtZSB0aGF0IHdoZW4geW914oCZcmUgc3dpdGNoaW5nDQpw
YWdlcywgeW91IHdvdWxkbuKAmXQgcmV0YWluIGFueSByZW1haW5pbmcgZGF0YSBmcm9tIHRoZSB0
cmFuc2Zlcg0KYnVmZmVyIG9mIHRoZSBwcmV2aW91cyBwYWdlLCBiZWNhdXNlIHRoYXQgd291bGQg
cmV0dXJuIGRhdGENCmZyb20gdGhlIHByZXZpb3VzIHBhZ2UuDQoNCkhlcmXigJlzIHRoZSB0YWcg
SSBzaG91bGQgaGF2ZSBpbmNsdWRlZDoNCg0KRml4ZXM6IDM3NDZkNWMxNWU3MDU3MGIgKCJody9p
MmM6IGFkZCBzdXBwb3J0IGZvciBQTUJ1c+KAnSkNCg0KPiANCj4gDQo+PiAtLS0NCj4+ICBody9p
MmMvcG1idXNfZGV2aWNlLmMgfCAxICsNCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykNCj4+IGRpZmYgLS1naXQgYS9ody9pMmMvcG1idXNfZGV2aWNlLmMgYi9ody9pMmMvcG1idXNf
ZGV2aWNlLmMNCj4+IGluZGV4IDYyODg1ZmE2YTEuLmVmZGRjMzZmZDkgMTAwNjQ0DQo+PiAtLS0g
YS9ody9pMmMvcG1idXNfZGV2aWNlLmMNCj4+ICsrKyBiL2h3L2kyYy9wbWJ1c19kZXZpY2UuYw0K
Pj4gQEAgLTEwODgsNiArMTA4OCw3IEBAIHN0YXRpYyBpbnQgcG1idXNfd3JpdGVfZGF0YShTTUJ1
c0RldmljZSAqc21kLCB1aW50OF90ICpidWYsIHVpbnQ4X3QgbGVuKQ0KPj4gICAgICAgIGlmIChw
bWRldi0+Y29kZSA9PSBQTUJVU19QQUdFKSB7DQo+PiAgICAgICAgICBwbWRldi0+cGFnZSA9IHBt
YnVzX3JlY2VpdmU4KHBtZGV2KTsNCj4+ICsgICAgICAgIHBtZGV2LT5vdXRfYnVmX2xlbiA9IDA7
DQo+PiAgICAgICAgICByZXR1cm4gMDsNCj4+ICAgICAgfQ0KPj4gIA0KPiANCg0K

