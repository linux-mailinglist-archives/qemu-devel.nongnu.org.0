Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60949552756
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 01:01:00 +0200 (CEST)
Received: from localhost ([::1]:54242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3QOA-0005DO-AC
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 19:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71706c1562=pdel@fb.com>)
 id 1o3QMK-0004Yj-GT
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 18:59:04 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:5716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71706c1562=pdel@fb.com>)
 id 1o3QMH-0003tR-SF; Mon, 20 Jun 2022 18:59:03 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25KM1siV003396;
 Mon, 20 Jun 2022 15:58:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=o8y0KGfnc7EgVUeL2rkdcRrbLyR8oo998gbce/D/zHA=;
 b=q4y/8eJzrWaRqfSJd3tS1XqY7eVoTI4rwIkeGUfev5xPsjxCEIRwYUtE4EjIWuGg+OWp
 3COSVgQZF+It3EvEgPKSvWPVCXhUDTWbkAtjywydCi7oOb8nVgavEwoDL2hvbcwDSf7D
 tm19C1RwGJwXz5djZozs/3Efox1ckI0iK8k= 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gtunftns6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 15:58:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDNfM35WZ7tSP2x34nnauDqJgywq2N/W26W71sj+82WpyiGCaeeJ3w+aCLnXF6GbH6SyoVE3ybakp9nCcKeyJbmbmsmuHKeTTCxkE6MCWxls9RkvJbGMRM9euQx8NDHUMn5pXnPLDHC73X+KntVLZHHpVYkrDE688Kgjwq2RrViHvxW+DpJsbXqu9bzfj1wJmfSVqDy6B5BAWUU31VbaSkMYWXmACw/ZDUClU/kiHLTgqjc5XB+9zgv6+ptBLqtx/rgcaylXYHw2g4oAx+8Ef86EZHav4oC+udb7W28l9lmQTMdSl9Qxw//V8GeCPt86ZRAidJl82jGMzdiehCL6FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8y0KGfnc7EgVUeL2rkdcRrbLyR8oo998gbce/D/zHA=;
 b=XCwiFLVCgql9gNy+S0Qq/1hHuvxf6xiW+jQSKpRW2Cb/nbVAgxXIWZ2kxFRkcQgcu1DwXs90r498bK1p30fG/2DFQL3T5P88XqswB/kquGLk5YKEyUaC+34WIGKLq76nTb36RWvJq47XXEm4Uk9fRJSt0QNYEh4fJrvUT7oHFT/Dfjr7COHwfxiqWAtnlig9LG+PA3R13q5+zLDe7FFVzvAGiQngBItSMoE4F6GAAonTVCMfnpTFUyShGLQqSqF2mal8XQlOb4KPP4xCVjVJrThZzQvnCrvaI35oJT+XIw4YlmteX4kdj/77E9EtzbbvjR31xU2BHhKUHf6nXK+L8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by MW4PR15MB4539.namprd15.prod.outlook.com (2603:10b6:303:108::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Mon, 20 Jun
 2022 22:58:56 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::5812:71cc:63fb:1081]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::5812:71cc:63fb:1081%7]) with mapi id 15.20.5353.022; Mon, 20 Jun 2022
 22:58:56 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "eblake@redhat.com"
 <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@gnu.org>, Peter Delevoryas <pdel@fb.com>
Subject: Re: [PATCH 3/4] slirp: Add mfr-id to -netdev options
Thread-Topic: [PATCH 3/4] slirp: Add mfr-id to -netdev options
Thread-Index: AQHYgR08UpPl0/rupEKyMlpOY4dTFa1U84wAgAP824A=
Date: Mon, 20 Jun 2022 22:58:56 +0000
Message-ID: <E8553AF9-7690-493D-ACC2-00B61B8308CC@fb.com>
References: <20220616010526.1895564-1-pdel@fb.com>
 <20220616010526.1895564-4-pdel@fb.com>
 <20220618100508.g7fkar6c6jvrzfwz@begin>
In-Reply-To: <20220618100508.g7fkar6c6jvrzfwz@begin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1244160-cd30-4eb5-1d8d-08da53107486
x-ms-traffictypediagnostic: MW4PR15MB4539:EE_
x-microsoft-antispam-prvs: <MW4PR15MB45391E53741C816AAAD2D774ACB09@MW4PR15MB4539.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Gjr+LPTe6ZyWga6wqX/1h4Dxk0kYnMyCQGtlkY2sSk91UEJHxvA+oARzndUomtd0X9knHwqeZadkBcTJ6To2nJ7DODwTPnAgGL11y0GgtSokhBgj+P+8ms8aPUuswqu/2wJzCEdgCSpKkXhGsLpQStyF98PeSZpjTnkl7/pJ3o7WUbQa8e++hHCcbvZeNxpczCmZMSBTgk5HOA4GCXE4PV7l3P0lktEbZPRHeUw4Nrxo6n6yd9lEkrqZcsAgWIMYLN5y2UZy7F1VVAqsRP8xnqvsdgaM8Pz1YeiVipRyxPX4mM7Qi2K8DeBRV7SwxkVXkgJlKp8UsAUy4hzby/qxE7wDk3/LcyUTBNuKaAIKswZA4h+UEH8zMtg065q0UuGJsSWhsVXSGTQWoVoaN/UqFxyJaMT2XkP35PpYFQR0vfUaLUjFKL3mH9j7o16j9u2FYFezEs3IP/zS42USkCJFQynVDuDSQPIzcuC5BTNy6/m+mBL58btUShMpaBs1YaVCEYAqmN5UHikAoIZ00uVfRpISwhOcQXEh1YH/57n7Q88Wihkojk7ufzK+6i95XNdng6YWIua12rPJQBwGnnkZ5RFEEDelR74igP55zyPT2E2R0OtvqA2mMJsCKjpG8eZDUX1pXKAkD8Un2kEznfD6qIvsN8gTyKuqti/2myrThuQwb5QG9ty6HS3okI5W73rYMW2TEZ3cDTvtHBGIf9cV3SJhGQh5EQgpo/89cPnt+/GExUp4TC8rvWZn3+b5daQKv0Y/dT9h/Jp/vRL/96bpBQh0OUWIpFqpQd+zxz96YSGpk4kjiLVkoLrwx0Pi5Ns
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(186003)(122000001)(83380400001)(109986005)(6506007)(38100700002)(478600001)(71200400001)(38070700005)(53546011)(66946007)(6486002)(966005)(316002)(54906003)(2906002)(41300700001)(2616005)(8936002)(64756008)(66446008)(33656002)(8676002)(76116006)(66476007)(66556008)(5660300002)(4326008)(36756003)(86362001)(6512007)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0o0bjNBNWFLNHZySkdjWDhtb2lNOFVvcVloTUR0SGNRSEV1TDJjQTFobVFv?=
 =?utf-8?B?UFF1Y3U4YzFKNzRQRExxdi9CL09YUVJIdU5UdHJudHlYQmxQNktFVU0yTXpZ?=
 =?utf-8?B?dVZFVlJPWnhld091TGJBUE13N2hWclQxVlFGZ2dObUI5N3NkTkx5SG5BMVBF?=
 =?utf-8?B?cWFwcUd1MFdwVmRydVMxUGQ4VCtIaG9XUGUvbHFKTUdhRlJEb3hsQnVoaUg5?=
 =?utf-8?B?ZkxOVHk4TG1FUXIxREM3MUN2SnJ6U2RMTFdGMEJCU3pkS2pVUnk5TjNUS2U5?=
 =?utf-8?B?V2lCbmlleEZpZWpyOGtqYVJsTnExSXJOdWdOaEU0aktPWWM4Q2Vta2ZxdGFP?=
 =?utf-8?B?UVAzV01Dc2ttS21MNTE1dURjRFY5eTlZeEpvdGlmVkJiMnV5OG50ZkFXVXhT?=
 =?utf-8?B?MTJMWk03cXoyazVWanFtMXJjSVI3cGNXTm13eHMxUWNtVFJmQWRTUFZySGFG?=
 =?utf-8?B?UTM0bkh6SHpuLzFOMmI1QWQrWnBCdHMzR0pNOVJoUzB5d3I5ZWZVN1V5ajdE?=
 =?utf-8?B?dmhxOGlOSzFTZGJ3bGhObE1yZUEvQlY3cE9JdHlhN3ZzdGxvdUQvakM0RGow?=
 =?utf-8?B?NUx5NW1hb2FobXFUSGpaaFlQTm90WDFTQnZCdFAxNDlicVJkcjRwcys0d3px?=
 =?utf-8?B?eFlRY1c0QTVUUTE5UURLdUZ5Vll1eGJETHBQMGl4VlZiK3ZoUDhiU2Zmaldj?=
 =?utf-8?B?eXZKRlpDdDhDMUkzMXVUaENDdTl1ZFRqMFJqL2Y2OHhCd2JXazJjQmdJbGhM?=
 =?utf-8?B?S2NSVjd5T0VFNitRMWxNaWJzNnlsS1NwTXZRQmJlYTBpNW5hQ2UvSm1HV2l1?=
 =?utf-8?B?QW9JbThLNnUxYURUM0daeUNzYmh6NW8xbDQ2VUc2RjVpK1dEc1pKWTAzaEk2?=
 =?utf-8?B?YzZTSkloQkNXOUNycnNWV09zWEJGajduNTJJQjlncDVDVTFPTmdWWlh2aGt3?=
 =?utf-8?B?UzBNR3lCMjZOU0JFQlg3c2tvdWpoWGU3a2JxRll5M3UyeURpaVdCbVBNWWl6?=
 =?utf-8?B?aFVlR1BNM2dLU1BEd1F1aWsyVy9RQ3RXWjZiY0tMM0FHNkNzVGxxNU5qSVVu?=
 =?utf-8?B?TjBvWGE1SFRzMUxZU0RpOWwrVE9WajI5N2M4YVNhenp2MjNNVTRwd3MySmFT?=
 =?utf-8?B?NWQrU2dLc2V1YjMvcWlrSVhqTzJ2bFU3cFA1WjVDcGp4VjFENmZHeURXdS9a?=
 =?utf-8?B?UzkxeXN1RWhNREk2UUlPMUNnbTdwWFZrRHpWSGVWYk91TnQ0MDdZZGQvbTk3?=
 =?utf-8?B?c21mWFBUdkQ5RC8reTBlNW1lRWdZenArMFg5KzJqLyt6Rk9BeE9vdDU4QUVo?=
 =?utf-8?B?L1V2YWlIanArVk1Sd2RTcUpPMW1JbVBNdm5RZjFlN0xKYzlFVmliNVk0bXVC?=
 =?utf-8?B?TlcyeGZJTU1RZ1hERjFGdnllK0hhTjd6WnpTSzJFeVFKYTl6cGh2SnljaDJU?=
 =?utf-8?B?Vmd6MUdrNXdHTCtYYUtQMldGQUFlc2lkaGEvOXlVaU5iWCs3Y0FLMEtNb3Qw?=
 =?utf-8?B?aXlIaENmOVdoN3ZJR0ErMzBFMHdobHR3YVBuV2RNdzBHQWhUOTBGS2tMQ3l2?=
 =?utf-8?B?UWo5ZWlNQ29oaTFrT3JMbjBRQ2hhbTZpNDRWVlRVRDZjL3hRaHpNMWpCZjVJ?=
 =?utf-8?B?UFh1VVRWUkZLeTl1U1ZmT0RjMFFSU3F6WnZLSkpGMXo2TU1FLzdSeklQUk5M?=
 =?utf-8?B?ZnNFV3MvVlJOVFlOcFZzMWhzS2VZdE8zTjRGVDBJVTduYkt0d2h4R0dGbk9I?=
 =?utf-8?B?U1E5WXNFaDVNTHJYWDcyc2VVWlNodVU5ZXIzUDZQQTVaek9XV3BDQVFoRHNp?=
 =?utf-8?B?cWRQUGVXbmFCeW5aZkZvN2NXRVJ3OWxRNGJ2VSttWFhHZTlNYkFndlUvNGJt?=
 =?utf-8?B?b1hIRFhoRlhPcmRRS2xkd3kvSERNb3JiNDhQTGc0bk5SK05OUTFEenY1U2g5?=
 =?utf-8?B?SUplYk1Pa0JZVHV4WTVSUHA5WG10L1Bhb0tnWHdNRTZCdTJjd0doeFlMd0Fy?=
 =?utf-8?B?cFBJQkZESllQMEwzcytWU3k5S0xSZTVmcTI4RW5VN0E4UzZvRGMwb1A5eldm?=
 =?utf-8?B?WkcrK1Z6b3ZJdTZlWDNOUWprMnFNMjNZc2MycjVoKzhjVkdocGNlTnBUS0lU?=
 =?utf-8?B?TXNqVHJsMFg5T3FSa3F0T3YwTGRsd0Rhd0xpczdHdm1JL3poVXcwOFIrOGhD?=
 =?utf-8?B?MTQrdm9GWm5nQUpOQk03Rlo5ak9tZUxoTXJhYlF1MERBN25nejVDazdzN1RQ?=
 =?utf-8?B?alZ3U1hRQ3ZEMjE2Sk9zNTl1andubDBwUXV6RXVIakJrcDBPd2pYSnduN0Zy?=
 =?utf-8?B?ZWkzdlBPeXJIL0R5ZjJPV3J5RVBuVjk2b3V2V3BrcnU0NTMwRWVvUlNxQytm?=
 =?utf-8?Q?h2roCXgEbI7Tcirs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C8AF97D6F2C504BADCED8686BE427D5@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1244160-cd30-4eb5-1d8d-08da53107486
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 22:58:56.5718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a2MEQKvTWn4MzvW/Nl7oSwtVo185rr5z3Q9zPrJN0WHp5QNtEjENr7vixtcoxy4f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR15MB4539
X-Proofpoint-GUID: TA5fHJr1QaUkpBTrEdqaOGh-7lT2f0KB
X-Proofpoint-ORIG-GUID: TA5fHJr1QaUkpBTrEdqaOGh-7lT2f0KB
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_06,2022-06-17_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=71706c1562=pdel@fb.com; helo=mx0a-00082601.pphosted.com
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

DQoNCj4gT24gSnVuIDE4LCAyMDIyLCBhdCAzOjA1IEFNLCBTYW11ZWwgVGhpYmF1bHQgPHNhbXVl
bC50aGliYXVsdEBnbnUub3JnPiB3cm90ZToNCj4gDQo+IFBldGVyIERlbGV2b3J5YXMsIGxlIG1l
ci4gMTUganVpbiAyMDIyIDE4OjA1OjI1IC0wNzAwLCBhIGVjcml0Og0KPj4gVGhpcyBsZXRzIHlv
dSBzZXQgdGhlIG1hbnVmYWN0dXJlcidzIElEIGZvciBhIHNsaXJwIG5ldGRldiwgd2hpY2ggY2Fu
IGJlDQo+PiBxdWVyaWVkIGZyb20gdGhlIGd1ZXN0IHRocm91Z2ggdGhlIEdldCBWZXJzaW9uIElE
IE5DLVNJIGNvbW1hbmQuIEZvcg0KPj4gZXhhbXBsZSwgYnkgc2V0dGluZyB0aGUgbWFudWZhY3R1
cmVyJ3MgSUQgdG8gMHg4MTE5Og0KPj4gDQo+PiB3Z2V0IGh0dHBzOi8vZ2l0aHViLmNvbS9mYWNl
Ym9vay9vcGVuYm1jL3JlbGVhc2VzL2Rvd25sb2FkL29wZW5ibWMtZTIyOTRmZjVkMzFkL2ZieTM1
Lm10ZA0KPj4gcWVtdS1zeXN0ZW0tYXJtIC1tYWNoaW5lIGZieTM1LWJtYyBcDQo+PiAtZHJpdmUg
ZmlsZT1mYnkzNS5tdGQsZm9ybWF0PXJhdyxpZj1tdGQgLW5vZ3JhcGhpYyBcDQo+PiAtbmV0ZGV2
IHVzZXIsaWQ9bmljLG1mci1pZD0weDgxMTksaG9zdGZ3ZD06OjIyMjItOjIyIFwNCj4+IC1uZXQg
bmljLG1vZGVsPWZ0Z21hYzEwMCxuZXRkZXY9bmljDQo+PiAuLi4NCj4+IHVzZXJuYW1lOiByb290
DQo+PiBwYXNzd29yZDogMHBlbkJtYw0KPj4gLi4uDQo+PiByb290QGJtYy1vb2I6fiMgbmNzaS11
dGlsIDB4MTUNCj4+IE5DLVNJIENvbW1hbmQgUmVzcG9uc2U6DQo+PiBjbWQ6IEdFVF9WRVJTSU9O
X0lEKDB4MTUpDQo+PiBSZXNwb25zZTogQ09NTUFORF9DT01QTEVURUQoMHgwMDAwKSBSZWFzb246
IE5PX0VSUk9SKDB4MDAwMCkNCj4+IFBheWxvYWQgbGVuZ3RoID0gNDANCj4+IA0KPj4gMjA6IDB4
ZjEgMHhmMCAweGYwIDB4MDANCj4+IDI0OiAweDAwIDB4MDAgMHgwMCAweDAwDQo+PiAyODogMHgw
MCAweDAwIDB4MDAgMHgwMA0KPj4gMzI6IDB4MDAgMHgwMCAweDAwIDB4MDANCj4+IDM2OiAweDAw
IDB4MDAgMHgwMCAweDAwDQo+PiA0MDogMHgwMCAweDAwIDB4MDAgMHgwMA0KPj4gNDQ6IDB4MDAg
MHgwMCAweDAwIDB4MDANCj4+IDQ4OiAweDAwIDB4MDAgMHgwMCAweDAwDQo+PiA1MjogMHgwMCAw
eDAwIDB4ODEgMHgxOQ0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBEZWxldm9yeWFzIDxw
ZGVsQGZiLmNvbT4NCj4+IC0tLQ0KPj4gbmV0L3NsaXJwLmMgfCA1ICsrKy0tDQo+PiBxYXBpL25l
dC5qc29uIHwgNSArKysrLQ0KPj4gMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS9uZXQvc2xpcnAuYyBiL25ldC9zbGly
cC5jDQo+PiBpbmRleCA3NWU1Y2NhZmQ5Li4yMzEwNjhjMWUyIDEwMDY0NA0KPj4gLS0tIGEvbmV0
L3NsaXJwLmMNCj4+ICsrKyBiL25ldC9zbGlycC5jDQo+PiBAQCAtNDEzLDcgKzQxMyw3IEBAIHN0
YXRpYyBpbnQgbmV0X3NsaXJwX2luaXQoTmV0Q2xpZW50U3RhdGUgKnBlZXIsIGNvbnN0IGNoYXIg
Km1vZGVsLA0KPj4gY29uc3QgY2hhciAqdm5hbWVzZXJ2ZXIsIGNvbnN0IGNoYXIgKnZuYW1lc2Vy
dmVyNiwNCj4+IGNvbnN0IGNoYXIgKnNtYl9leHBvcnQsIGNvbnN0IGNoYXIgKnZzbWJzZXJ2ZXIs
DQo+PiBjb25zdCBjaGFyICoqZG5zc2VhcmNoLCBjb25zdCBjaGFyICp2ZG9tYWlubmFtZSwNCj4+
IC0gY29uc3QgY2hhciAqdGZ0cF9zZXJ2ZXJfbmFtZSwNCj4+ICsgY29uc3QgY2hhciAqdGZ0cF9z
ZXJ2ZXJfbmFtZSwgdWludDMyX3QgbWZyX2lkLA0KPj4gRXJyb3IgKiplcnJwKQ0KPj4gew0KPj4g
LyogZGVmYXVsdCBzZXR0aW5ncyBhY2NvcmRpbmcgdG8gaGlzdG9yaWMgc2xpcnAgKi8NCj4+IEBA
IC02MzYsNiArNjM2LDcgQEAgc3RhdGljIGludCBuZXRfc2xpcnBfaW5pdChOZXRDbGllbnRTdGF0
ZSAqcGVlciwgY29uc3QgY2hhciAqbW9kZWwsDQo+PiBjZmcudm5hbWVzZXJ2ZXI2ID0gaXA2X2Ru
czsNCj4+IGNmZy52ZG5zc2VhcmNoID0gZG5zc2VhcmNoOw0KPj4gY2ZnLnZkb21haW5uYW1lID0g
dmRvbWFpbm5hbWU7DQo+PiArIGNmZy5tZnJfaWQgPSBtZnJfaWQ7DQo+IA0KPiBZb3Ugd2lsbCBu
ZWVkIGEgI2lmIHRvIG9ubHkgaW5jbHVkZSBpdCB3aXRoIHNsaXJwIDQuOC4wIGluZGVlZC4NCj4g
T3RoZXJ3aXNlIHRoZSBtZnJfaWQgZmllbGQgd29uJ3QgZXhpc3QuDQo+IA0KDQpPaCwgcmlnaHQu
IEnigJlsbCB0ZXN0IHRoaXMgY29kZSB3aXRoIDQuNy4wIGFuZCA0LjguMCBhbmQgbWFrZQ0Kc3Vy
ZSB0aGUgYmVoYXZpb3IgaXMgY29ycmVjdCAoYW5kIHBlcmhhcHMgZXZlbiB3aXRoIGVhcmxpZXIN
CnZlcnNpb25zIGxpa2UgMS4wKS4NCg0KPiBJbiB0aGUgI2Vsc2UgcGFydCwgaXQgd291bGQgcHJv
YmFibHkgdXNlZnVsIHRvIGdpdmUgdGhlIHVzZXIgYXQgbGVhc3QgYQ0KPiB3YXJuaW5nIHRoYXQg
dGVsbHMgaGVyIHRvIHVwZ3JhZGUgc2xpcnAgdG8gNC44LjAgdG8gZ2V0IHRoZSBtZnJfaWQNCj4g
ZnVuY3Rpb25hbGl0eSB3b3JraW5nLg0KDQpBaCB5ZXMgZ29vZCBpZGVhLCBJ4oCZbGwgaW5jbHVk
ZSB0aGF0Lg0KDQo+IA0KPj4gcy0+c2xpcnAgPSBzbGlycF9uZXcoJmNmZywgJnNsaXJwX2NiLCBz
KTsNCj4+IFFUQUlMUV9JTlNFUlRfVEFJTCgmc2xpcnBfc3RhY2tzLCBzLCBlbnRyeSk7DQo+PiAN
Cj4+IEBAIC0xMTcyLDcgKzExNzMsNyBAQCBpbnQgbmV0X2luaXRfc2xpcnAoY29uc3QgTmV0ZGV2
ICpuZXRkZXYsIGNvbnN0IGNoYXIgKm5hbWUsDQo+PiB1c2VyLT5ib290ZmlsZSwgdXNlci0+ZGhj
cHN0YXJ0LA0KPj4gdXNlci0+ZG5zLCB1c2VyLT5pcHY2X2RucywgdXNlci0+c21iLA0KPj4gdXNl
ci0+c21ic2VydmVyLCBkbnNzZWFyY2gsIHVzZXItPmRvbWFpbm5hbWUsDQo+PiAtIHVzZXItPnRm
dHBfc2VydmVyX25hbWUsIGVycnApOw0KPj4gKyB1c2VyLT50ZnRwX3NlcnZlcl9uYW1lLCB1c2Vy
LT5tZnJfaWQsIGVycnApOw0KPj4gDQo+PiB3aGlsZSAoc2xpcnBfY29uZmlncykgew0KPj4gY29u
ZmlnID0gc2xpcnBfY29uZmlnczsNCj4+IGRpZmYgLS1naXQgYS9xYXBpL25ldC5qc29uIGIvcWFw
aS9uZXQuanNvbg0KPj4gaW5kZXggZDZmN2NmZDRkNi4uZWZjNWNiM2ZiNiAxMDA2NDQNCj4+IC0t
LSBhL3FhcGkvbmV0Lmpzb24NCj4+ICsrKyBiL3FhcGkvbmV0Lmpzb24NCj4+IEBAIC0xNjcsNiAr
MTY3LDggQEANCj4+ICMNCj4+ICMgQHRmdHAtc2VydmVyLW5hbWU6IFJGQzIxMzIgIlRGVFAgc2Vy
dmVyIG5hbWUiIHN0cmluZyAoU2luY2UgMy4xKQ0KPj4gIw0KPj4gKyMgQG1mci1pZDogTWFudWZh
Y3R1cmVyIElEIChQcml2YXRlIEVudGVycHJpc2UgTnVtYmVyOiBJQU5BKQ0KPj4gKyMNCj4+ICMg
U2luY2U6IDEuMg0KPj4gIyMNCj4+IHsgJ3N0cnVjdCc6ICdOZXRkZXZVc2VyT3B0aW9ucycsDQo+
PiBAQCAtMTkyLDcgKzE5NCw4IEBADQo+PiAnKnNtYnNlcnZlcic6ICdzdHInLA0KPj4gJypob3N0
ZndkJzogWydTdHJpbmcnXSwNCj4+ICcqZ3Vlc3Rmd2QnOiBbJ1N0cmluZyddLA0KPj4gLSAnKnRm
dHAtc2VydmVyLW5hbWUnOiAnc3RyJyB9IH0NCj4+ICsgJyp0ZnRwLXNlcnZlci1uYW1lJzogJ3N0
cicsDQo+PiArICcqbWZyLWlkJzogJ3VpbnQzMicgfSB9DQo+PiANCj4+ICMjDQo+PiAjIEBOZXRk
ZXZUYXBPcHRpb25zOg0KPj4gLS0gDQo+PiAyLjMwLjINCg0K

