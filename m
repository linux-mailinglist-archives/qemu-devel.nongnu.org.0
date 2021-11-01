Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E49441C50
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 15:12:26 +0100 (CET)
Received: from localhost ([::1]:40164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhY2y-0000v4-TR
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 10:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mhY1c-0008Cz-Rr
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:11:01 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:34394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mhY1Z-0002BB-Py
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1635775857; x=1636380657;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d5cz3vL/OsNeAZHwoWQYlhFXhhoRQjtLj8wUUg/dwxo=;
 b=fcXJ6j17CHchMCbFMFDEUoQeiTQ2mpTMvIcG9GqmvMO0q2AQD/bIyP8F
 cPBaDYuJo/CUrPNJwMifIAIdpCTId3Gr0cxnQ+0KzxZ/sOO6tLe2SyI1E
 8K6oTCuVpSgf3RnKGJu7fQbuXNGLkngIGsrY2hnhUJ+zRbrloWlKjpJyl Y=;
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 14:09:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q68s/oiHw4i+QeBc32Uugd5RWNLtSE/EhbWSZ53518QWPFf9V+k4t9vHElmdYDn8iDozxxLcFiXG5/qU3njKbw58CpC8ALyLxb03feyasAvqunXAF3BeLebDrIkrUVKgYf0ktaUpOB5xPPoy1iNF26BsCTTxPVEyjPG7naoNRwg+sDtCoeNYguBBaclVBiQaztYoY6T2dUSwhP+euSstzoo+QYvCC1Z1xcx0yN0AcMb6edPDyDZrGt1Cldf6yJPkeFLKfnu+Ze8Hk/ZcwHxn3QwFYQ555TwNJ6MdVugxvS07zG929iYOusIKbPzDHq0iXbCqdjfBhF0qNbvhk3bC1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5cz3vL/OsNeAZHwoWQYlhFXhhoRQjtLj8wUUg/dwxo=;
 b=Dvz61kxuzbl+1KWz7rux71svRsJIERGQaw4mneO+d9XqwaK0b9xWFvQRecCTvjkBhDo2Cz53qI9uhCVWpKLZB1oaBtPeD0wq7Bv9bHYXc0AURca1c1sqavsyuO+ZV/GTd0Elgh+qsljMIUswEvn3ZpnwICxXUBCGfDZGaLRveP+m8OruS5vqHOreYDegrlvlra6MEwr/AtwIgmVp8/5n/G8TAQj2o2LIEof08pw36Ht8HFUnzQhmw2p8ioLTagdj2drU7wgQPiQlJRaSu/KKUz4kTSE8ludmH9hrFukxmZyKA3olt7StBzSm+N5mbjumMYWKB5OGnE/o1zP6ZK2Apw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN4PR0201MB8743.namprd02.prod.outlook.com
 (2603:10b6:806:1ea::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Mon, 1 Nov
 2021 14:09:11 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04%5]) with mapi id 15.20.4649.018; Mon, 1 Nov 2021
 14:09:11 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, =?utf-8?B?QWxleCBCZW5uw6ll?=
 <alex.bennee@linaro.org>
Subject: RE: [PULL 28/30] Hexagon HVX (tests/tcg/hexagon) hvx_misc test
Thread-Topic: [PULL 28/30] Hexagon HVX (tests/tcg/hexagon) hvx_misc test
Thread-Index: AQHXznZ17I9Od8eOSkWYgK05UEqDb6vuet4AgAA1MoCAAAbMIA==
Date: Mon, 1 Nov 2021 14:09:11 +0000
Message-ID: <SN4PR0201MB8808814113CBE84889CD5234DE8A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <1635698589-31849-1-git-send-email-tsimpson@quicinc.com>
 <1635698589-31849-29-git-send-email-tsimpson@quicinc.com>
 <e1d3d003-f287-7f82-d604-6f43b0d9c55c@amsat.org>
 <2f35d0c6-0ba7-b911-56db-c1ed9ae4afbc@linaro.org>
In-Reply-To: <2f35d0c6-0ba7-b911-56db-c1ed9ae4afbc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26908a37-abb6-4a80-d8f6-08d99d412dd5
x-ms-traffictypediagnostic: SN4PR0201MB8743:
x-microsoft-antispam-prvs: <SN4PR0201MB87433E5D1C3EC674416FC40FDE8A9@SN4PR0201MB8743.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e3MOlALk/Gi/9bgd7qsGEARLHeeGwHnKe+6u93tlGrkVoFRDUB+y9yTU6OHoteuIxaG8e+h0OvVfzQLk4TtFxKqvKUg3/1YEnyifXcs+OAiPmUdqAc5LDxcrrteqq/Ixva25Ofzyl1i7Yt73twPaSjVIrutsNw2Lsujgidy5Eh+zQKn7O92FLLul7XamZD+JyDcU5lY75MdS5O6zVuVIz24Ul2EojAi/e4Zapwi8Zjm9U33WHpBL7rn8j6rIMh+7vV1p6fEarD/o/RKRTh81B8V1vpayVwjp2BIrjlA/QiT5/TDX/UZQwe9AH60iM+Menq6zqfyHW3Nm47/0E7kL57zS0hbHm2C1WyTLdT2pjctJujTwrYul8R2/AZ4jBa6GjbZPb8/1Xhk3eZc6do91gT5qp8sje7hwRw6LJHUvHshN90cjO7wWsL4h/ESz0DNFdlCJF4KdWvxmGOJrKJMxPE3EYAg1e8windX7ErJCNuvVANZ9WGCmPqkl67MRa6Y1ZTf6jtXCMb3U2/FpbFbAMX9/Umwh1ZP8zy5LlwF/5awxd7WB7OINfhShvnAY7k47sFjxzvJdL5sYSSSxnViYRc8XY/7/Aj3O5Wjy3vOw2AROy2M/hm4Yt79RIvInZmktQn2dThrBKd4yJiX8HVkHdgRTrwO6CmKeNUpZasK8JFhYPInf+oAOszL2I249bFGwVJze35+se2lJeCcqHZrCeg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(122000001)(52536014)(66574015)(71200400001)(8936002)(86362001)(38070700005)(33656002)(186003)(8676002)(76116006)(508600001)(53546011)(4326008)(7696005)(5660300002)(66946007)(66476007)(66556008)(6506007)(2906002)(66446008)(64756008)(55016002)(110136005)(9686003)(26005)(316002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDk4Vk1JSlpDNU5HK1Z0eVl4TFJhcWRCRkM1NnZDd2hZeHB2NmVsSmlzY0Jx?=
 =?utf-8?B?bnlIY0liM3cxdlgyblpxejRJb2dJR0ZBYUVrRmp4UUVQZGdGVlBFbEd5TzVH?=
 =?utf-8?B?TjRtdW1YT25hd3hEVTVmZ2Q4b1J5TVlXekhvYmRQV2VTVlZPOUR2ekpCMDFa?=
 =?utf-8?B?eE1waWdHcUI1QXlnNEEycDZINHlqUWNxL3FLdVVscFMzQlZlM2c3ZWszZUFE?=
 =?utf-8?B?QkRtUE85VDdOL0trNjEzdXBJU2Fha3hLU0k1VHR0QThJRk14NWVNd3RxNjZi?=
 =?utf-8?B?OXo5dHpsdjlLUkxGVU5kVks5WGFuNkVVZmpMeGJYMWR3d3ZtZEFjRlM3SFZS?=
 =?utf-8?B?R0lNR0ZRa1lHM3lmRjdmYmtXVnFlbmRSRDFsc01CS0RmYU9pYzliTmIxemZG?=
 =?utf-8?B?S05DNXhxRU8zSk9qa2gwQlJzY1hSRkNEU05UZ3FQdnUvdkIwVGtoeDZ3U3Bs?=
 =?utf-8?B?eTd2RTBBb0M1alZXNlJ2MW5ER1FPTVhBVmtHanBmRXhPb3VEVXpIOUxSUVRF?=
 =?utf-8?B?N0NNSVNYU0FVVDZFb1Nabk9qellZZ0lkVXJScC9DYWd1SzBMS3FnbVZhaE9Z?=
 =?utf-8?B?V2lpelVBSmJBTWV5UUlZSDhMWkFhNTkzcGxmaFlPeHhGMlhYdldhMzlHbWhP?=
 =?utf-8?B?ei9hZzJyUWNTZ3VESUc1WUJCd2hGcGxTblpsMDVwS3VZR3NZWFFRMkJVNGVy?=
 =?utf-8?B?d3FVTHM4RkVtNmc1cGczQUxrS0pUZmdjdmJDZm9hQnNTdmNSWGdnVkFJRU9S?=
 =?utf-8?B?dWFXVEhWT3RtazBDcjM0YVp6S0l0ZGVieWJMUHNMRjI5NjNidXRkQ3FRZG5M?=
 =?utf-8?B?UG1VSzNNelQ0aUQxbEd4OXdDMGRlSmY4OU9haHU1ZmlYYWN1eVJ4bk9hOWZa?=
 =?utf-8?B?RHhoVVl6anNkYjA2a2QremZ4bG9HVm00SVhlVkhvQ1c5VEVyVUhXZEg4U3Nh?=
 =?utf-8?B?VnBFUGlVRERCQnpoSG94Tk43QWp6Z2o1Y2JFRXo1OGFDSmtLdVY0a2FsTVJT?=
 =?utf-8?B?ZnQwWm5ud0hsSGFTQkYzbjJPbk1pa2F0R1UvNVFHQ3haRzcxd1g2WG9KMDkw?=
 =?utf-8?B?YnVBTDF0ODhuWmRwNElrQm5LSFEwb1UvSXpzK082dE1RRjBDenhpVDgydlFI?=
 =?utf-8?B?UzRZaUpvVi9KV1daYktPZWpnUldBUmNHVDNiNmgzZ1Q5WjVvRXhnZ0QzbmpI?=
 =?utf-8?B?WlpiRU9MVU1VbmZHUno1eFlrcnVNaFVKcjZHWWkrSTV4YWRhSDNJVHcvcXBo?=
 =?utf-8?B?NjduMDk0bnREUHhscXFFUTJpY2RGc0RMRG1EZjRzNlhHbG9TU2ZtMXAvRTQ5?=
 =?utf-8?B?SXoxWm00OXBxWXVYdnNzSEljV01raVk3THFxUTFWQ2VIVmtvdXVOaGtxaU1J?=
 =?utf-8?B?STc0RDJsdzUwYVhDQWsvN0Z5d1VmSmRuTGRWbGxLRGc1OEJiamM2TGRwN3Bm?=
 =?utf-8?B?eDNGalNtcENiU1pKTk9UVzIrSzhWdlgvQWcwR25rL3ZnajA3dlhxOW1UcmVx?=
 =?utf-8?B?NlJaV2tWZ3BzRHRuSGpVMzVlemRMaTFCU3BlWGJ4S2p3Z0M2Mk5TczlhUnZk?=
 =?utf-8?B?aGMzazNHeGdvYkM3R2MwVlhWOEw3M1hpNDltSktHakUrWTJhZlVDaVJ3WDdH?=
 =?utf-8?B?ODNyOVQ3NmNBdkN6amRpL2V5bmRqZ3FHajJyT3FXWUgxNDVxY1hxSytlRVRp?=
 =?utf-8?B?SUFNUytuUHFRTldRSlFFblBrQlFrUm5oRmFEcnFIQjFzNHVJaUZxKzg1YWFQ?=
 =?utf-8?B?Y29tcG5nVUhvWU52MmFjdGtCYno0N0lSelBVekNPaGdWVlpSdHczS1pGQThJ?=
 =?utf-8?B?R2JHRXNVSEVzUDZNVUw2YUZmR25UeXc2U2tGMWMzWnBRWVk3aFpBaytBS0xO?=
 =?utf-8?B?MXpLRUFkWVZWOWVOU0xOZDQ2VXFwd250NFdncHJKRWgrc0NoQVBsYlpxVEV3?=
 =?utf-8?B?Z2EvNnJXZ2Q5bnJvN1E3UkRSUEl4VUlzNlBuV28zVit6WGQ1aWdrZzVGSHBx?=
 =?utf-8?B?Vmt2TG8yaVVmQnZGZVNybnFPWmFIYVlvQTF2MlpUTE5JMUpXcVFOQTUwVmNu?=
 =?utf-8?B?Z0puTHNVUkl2WEtPMDlqWTVsbEgxek92L1o2d1U1QnVuM015R2ZJY0ROYmJJ?=
 =?utf-8?B?Qko0YWFJRk12ZFBNRXBabml4c2pFa05mTmtQS1J4aHg4OEhhYkNvZFZ0Nndm?=
 =?utf-8?Q?4JAWagbnNRT3N5uQj2JIgS4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26908a37-abb6-4a80-d8f6-08d99d412dd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2021 14:09:11.6482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PSxwNZVUnqNZF59Zyc+3NUwU6KF5JZbkmjvHE1xoZ9u6zOEMx1BowExhhrg8e1U16tp4k95Kvn8dG10pmiJEGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8743
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGxhbi1BIHNob3VsZCBiZSB0byB1cGRhdGUgdGhlIGNvbnRhaW5lciB3aXRoIHRoZSBuZXcgdG9v
bGNoYWluLg0KDQpQbGFuLUIgd291bGQgYmUgdG8gcmVtb3ZlIHRoZSB2ZWN0b3IgcmVnaXN0ZXJz
IGZyb20gdGhlIGlubGluZSBhc20uDQoNCg0KVGhhbmtzIQ0KVGF5bG9yDQoNCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5o
ZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciAxLCAyMDIxIDg6
NDQgQU0NCj4gVG86IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+OyBU
YXlsb3IgU2ltcHNvbg0KPiA8dHNpbXBzb25AcXVpY2luYy5jb20+OyBxZW11LWRldmVsQG5vbmdu
dS5vcmc7IEFsZXggQmVubsOpZQ0KPiA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4gQ2M6IHBl
dGVyLm1heWRlbGxAbGluYXJvLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BVTEwgMjgvMzBdIEhleGFn
b24gSFZYICh0ZXN0cy90Y2cvaGV4YWdvbikgaHZ4X21pc2MgdGVzdA0KPiANCj4gV0FSTklORzog
VGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBRdWFsY29tbS4gUGxlYXNlIGJl
IHdhcnkNCj4gb2YgYW55IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVuYWJsZSBt
YWNyb3MuDQo+IA0KPiBPbiAxMS8xLzIxIDY6MzMgQU0sIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOp
IHdyb3RlOg0KPiA+IE9uIDEwLzMxLzIxIDE3OjQzLCBUYXlsb3IgU2ltcHNvbiB3cm90ZToNCj4g
Pj4gVGVzdHMgZm9yDQo+ID4+ICAgICAgcGFja2V0IHNlbWFudGljcw0KPiA+PiAgICAgIHZlY3Rv
ciBsb2FkcyAoYWxpZ25lZCBhbmQgdW5hbGlnbmVkKQ0KPiA+PiAgICAgIHZlY3RvciBzdG9yZXMg
KGFsaWduZWQgYW5kIHVuYWxpZ25lZCkNCj4gPj4gICAgICB2ZWN0b3IgbWFza2VkIHN0b3Jlcw0K
PiA+PiAgICAgIHZlY3RvciBuZXcgdmFsdWUgc3RvcmUNCj4gPj4gICAgICBtYXhpbXVtIEhWWCB0
ZW1wcyBpbiBhIHBhY2tldA0KPiA+PiAgICAgIHZlY3RvciBvcGVyYXRpb25zDQo+ID4+DQo+ID4+
IEFja2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9y
Zz4NCj4gPj4gU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPg0KPiA+PiAtLS0NCj4gPj4gICB0ZXN0cy90Y2cvaGV4YWdvbi9odnhfbWlzYy5jICAgICAg
fCA0NjkNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPj4gICB0
ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQgfCAgIDIgKw0KPiA+PiAgIDIgZmlsZXMg
Y2hhbmdlZCwgNDcxIGluc2VydGlvbnMoKykNCj4gPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVz
dHMvdGNnL2hleGFnb24vaHZ4X21pc2MuYw0KPiA+DQo+ID4+ICtzdGF0aWMgdm9pZCB0ZXN0X2xv
YWRfdG1wKHZvaWQpDQo+ID4+ICt7DQo+ID4+ICsgICAgdm9pZCAqcDAgPSBidWZmZXIwOw0KPiA+
PiArICAgIHZvaWQgKnAxID0gYnVmZmVyMTsNCj4gPj4gKyAgICB2b2lkICpwb3V0ID0gb3V0cHV0
Ow0KPiA+PiArDQo+ID4+ICsgICAgZm9yIChpbnQgaSA9IDA7IGkgPCBCVUZTSVpFOyBpKyspIHsN
Cj4gPj4gKyAgICAgICAgLyoNCj4gPj4gKyAgICAgICAgICogTG9hZCBpbnRvIHYxMiBhcyAudG1w
LCB0aGVuIHVzZSBpdCBpbiB0aGUgbmV4dCBwYWNrZXQNCj4gPj4gKyAgICAgICAgICogU2hvdWxk
IGdldCB0aGUgbmV3IHZhbHVlIHdpdGhpbiB0aGUgc2FtZSBwYWNrZXQgYW5kDQo+ID4+ICsgICAg
ICAgICAqIHRoZSBvbGQgdmFsdWUgaW4gdGhlIG5leHQgcGFja2V0DQo+ID4+ICsgICAgICAgICAq
Lw0KPiA+PiArICAgICAgICBhc20oInYzID0gdm1lbSglMCArICMwKVxuXHQiDQo+ID4+ICsgICAg
ICAgICAgICAicjEgPSAjMVxuXHQiDQo+ID4+ICsgICAgICAgICAgICAidjEyID0gdnNwbGF0KHIx
KVxuXHQiDQo+ID4+ICsgICAgICAgICAgICAie1xuXHQiDQo+ID4+ICsgICAgICAgICAgICAiICAg
IHYxMi50bXAgPSB2bWVtKCUxICsgIzApXG5cdCINCj4gPj4gKyAgICAgICAgICAgICIgICAgdjQu
dyA9IHZhZGQodjEyLncsIHYzLncpXG5cdCINCj4gPj4gKyAgICAgICAgICAgICJ9XG5cdCINCj4g
Pj4gKyAgICAgICAgICAgICJ2NC53ID0gdmFkZCh2NC53LCB2MTIudylcblx0Ig0KPiA+PiArICAg
ICAgICAgICAgInZtZW0oJTIgKyAjMCkgPSB2NFxuXHQiDQo+ID4+ICsgICAgICAgICAgICA6IDog
InIiKHAwKSwgInIiKHAxKSwgInIiKHBvdXQpDQo+ID4+ICsgICAgICAgICAgICA6ICJyMSIsICJ2
MTIiLCAidjMiLCAidjQiLCAidjYiLCAibWVtb3J5Iik7DQo+ID4+ICsgICAgICAgIHAwICs9IHNp
emVvZihNTVZlY3Rvcik7DQo+ID4+ICsgICAgICAgIHAxICs9IHNpemVvZihNTVZlY3Rvcik7DQo+
ID4+ICsgICAgICAgIHBvdXQgKz0gc2l6ZW9mKE1NVmVjdG9yKTsNCj4gPj4gKw0KPiA+PiArICAg
ICAgICBmb3IgKGludCBqID0gMDsgaiA8IE1BWF9WRUNfU0laRV9CWVRFUyAvIDQ7IGorKykgew0K
PiA+PiArICAgICAgICAgICAgZXhwZWN0W2ldLndbal0gPSBidWZmZXIwW2ldLndbal0gKyBidWZm
ZXIxW2ldLndbal0gKyAxOw0KPiA+PiArICAgICAgICB9DQo+ID4+ICsgICAgfQ0KPiA+PiArDQo+
ID4+ICsgICAgY2hlY2tfb3V0cHV0X3coX19MSU5FX18sIEJVRlNJWkUpOyB9DQo+ID4NCj4gPiBU
aGlzIHRlc3QgZmFpbHMgZ3Vlc3QtdGVzdHM6DQo+ID4NCj4gPiB0ZXN0cy90Y2cvaGV4YWdvbi9o
dnhfbWlzYy5jOjExMToyMTogZXJyb3I6IHVua25vd24gcmVnaXN0ZXIgbmFtZSAndjEyJw0KPiA+
IGluIGFzbQ0KPiA+ICAgICAgICAgICAgICA6ICJyMSIsICJ2MTIiLCAidjMiLCAidjQiLCAidjYi
LCAibWVtb3J5Iik7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgXg0KPiA+IHRlc3RzL3RjZy9o
ZXhhZ29uL2h2eF9taXNjLmM6MzYyOjk6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8NCj4gJ1RF
U1RfVkVDX09QMicNCj4gPiAgICAgICAgICBWRUNfT1AyKEFTTSwgRUwsIHAwLCBwMSwgcG91dCk7
IFwNCj4gPiAgICAgICAgICBeDQo+ID4NCj4gDQo+IFllcCwgdGhpcyBQUiBkZXBlbmRzIG9uIHRo
ZSB0b29sY2hhaW4gdXBkYXRlIHRoYXQncyBwZW5kaW5nLg0KPiBJJ2xsIGFzayBBbGV4IHRvIGh1
cnJ5IHVwIHRoZSBkb2NrZXIgcGF0Y2ggcXVldWUuDQo+IA0KPiANCj4gcn4NCg==

