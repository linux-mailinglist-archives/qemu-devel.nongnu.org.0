Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63DB3CFC88
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:42:15 +0200 (CEST)
Received: from localhost ([::1]:40330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5qwo-0004pc-QC
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1m5qt3-0008QT-BH
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:38:21 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:39540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1m5qt1-0003Qu-4u
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:38:20 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KEWxGL032428; Tue, 20 Jul 2021 07:38:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=2rgxcFJ/ITAneyKttJwSyj+BgLKxd//lK1bDLUEbPQc=;
 b=H3FTKr//aRXeinhMRUyyoYAN1QeqwNPAECDVYzWuw+yLmDS1P9Q4ESoWzPJbNCzdXTze
 u5llOx/wBrX3mGV6vuDpoaBP5AuVn2JCqijDZ6aBYx+W45gwLlVVE0onBPBxmZwyy16b
 zYSXeieDnpHSqx2ioIc6jJaV0iSAEAnITEOfcdvHkm6uuXz56ogFmwS/A0VpkjR2IzBG
 I2wmnBrvO9lBmVA1mwkhebbRxl7rdOQ7/P7FHlOVQ2yQzDQij3n2INkvyDPgd/XvneGb
 IYkYPzE6lcv5lgxRgERbKcp6vw23ngpsP3exXxTCjEgiJ6jzX/8loTwBzN3Up6Bmd8Ep lA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by mx0a-002c1b01.pphosted.com with ESMTP id 39w78kaxan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 07:38:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJsgFWqjPf/zHTIRn1O1iGqnupPOABGYBI633c0YNmZ4zfkLlCULbeAN20gVAVl6+DMGe3sm5WkcyD5D+L9YAjixBUEidnRgxfpbIGyVKUmZ2okXOBqLKUieCHgM+/3LBYjKqoPvEN2e64zScY+b2BwBMKkS59NoTzzLxPCoSTVBgjHEFfQaFDulds2+Aa/lhsj2Ha7gcLpKnuEyFAVaFSyD/+RUaiCHiVp1g20TsJjOpWk93w7svOZ4tkOg+JK8fm7Ow93ppg15lwisLCQG8gmDKyxGznkpl+6jUWe3EqGVXSNh2gWciXd6e5KF+pAqibbIBeqL38ggG7Rr3S0vcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rgxcFJ/ITAneyKttJwSyj+BgLKxd//lK1bDLUEbPQc=;
 b=d6H1vuY/LaLDXm5CRKenhI/Vr92zYte1lpD4QGyfSsMBzun8mnAoQ9qgWGKiX4EExuG6Mf2ciXgm1IcWt2oTFpJFkgp4jNZlNuKQXD45MRKd4o/8wRzmjHOUZ834gjLX3Tv8Wklfpp/6D2Bgzweg3LK0GEgTOlnRpimeFAEOty7eHFt3II2VMXjVQKKwkkfBR5fBhRkGXI7nNZw8GI3h5pxJzEOnuE+M8vOwY6FuBpI5WJp5kRg2hwFWd6+yZZWSpDFe3iQqnUnczds3OYtMB+IP+/ck8Dk6W1ImKqPE5JyIFFTqErVHs3wt0C1UfoPbGRQebYkXkG9HL7RWeGYesA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from CH0PR02MB7898.namprd02.prod.outlook.com (2603:10b6:610:113::5)
 by CH2PR02MB6887.namprd02.prod.outlook.com (2603:10b6:610:8d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Tue, 20 Jul
 2021 14:38:14 +0000
Received: from CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::3167:f3a5:5f8c:284b]) by CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::3167:f3a5:5f8c:284b%9]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 14:38:14 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: Jagannathan Raman <jag.raman@oracle.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH RFC server 07/11] vfio-user: handle DMA mappings
Thread-Topic: [PATCH RFC server 07/11] vfio-user: handle DMA mappings
Thread-Index: AQHXfNjBzA0/TwxW6UWBwDzBrozhgqtL7ivA
Date: Tue, 20 Jul 2021 14:38:14 +0000
Message-ID: <CH0PR02MB78989BE24EC5224A203C8C218BE29@CH0PR02MB7898.namprd02.prod.outlook.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
 <609dee10d839194f1dca5aac3064e75c408fbbdb.1626722742.git.jag.raman@oracle.com>
In-Reply-To: <609dee10d839194f1dca5aac3064e75c408fbbdb.1626722742.git.jag.raman@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53eddba5-2e56-41ef-82fb-08d94b8c01cb
x-ms-traffictypediagnostic: CH2PR02MB6887:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB6887831C7D298A98C98416C68BE29@CH2PR02MB6887.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m8HsruCDoFGYQlLR59J7/Re6xnd9KaajC5J8I+AzMgPVYUZG67mbbCkX9V7yXvq08m4lfA3RLEJ4jSlKwNIDJvgCP9t0stmSb4L+eX/qU8CH/d6Fs30tYRkfSirTmppxVQOtI6/mKFQdhPFQnape1pgmqycxpqOEOGx8gLVSkpBk2+Hs9yOz6I0/VeuwhI6ovgw+O4qCRx27N60KjGTWa7aFiJ6nd8pGrBoSK6slvccukl6hKRlF1w+iEbW3e9bE7PnHBRK+EwsRiPrkqPx3WNjUkoB7j1VGQr7EktTwjrAw6NkubBERhI5ancqRbRLFRxo3sk3KyrgfpUWs7LTV0DclkZZdE3SQqSpHtYT1NcWr+6Zgl4pJLVv8tUInEsgyxLZBDlAAH5ED/zs8iQ0KqJaCHQIg88yU12YRp/pWcHZUhlj2MEGBEcCUTbG35Zaq6Llt+f0Nq0IjDqIBWv3Ijw7k3GI47Q5nmiq5cal35DqO/GW76TRMSVo+yCA9i9duONOWpagq7QAq/pTpb2vmFgpkEYpuY0lccpDt7LFqb3YWunixkMzB/FjPBB4enHvnMuxVlWPA11zyAPVm3J+416rZE55oxRIXr1T0Vfjhp5tEwC06SFFAmo9xRntWPNqkoJ9PYJ4Lf7NdTNLrj8BWTummB1nJaR7acxMxzeBrnLiCE9PVy8MJ6/8y4qSft+WF9dWu1H5osjR6f/5o3A5mNA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR02MB7898.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(346002)(376002)(366004)(136003)(52536014)(122000001)(66946007)(5660300002)(71200400001)(478600001)(6506007)(53546011)(8936002)(76116006)(86362001)(44832011)(26005)(316002)(64756008)(66556008)(66446008)(9686003)(38100700002)(66476007)(107886003)(4326008)(83380400001)(55016002)(54906003)(110136005)(8676002)(7696005)(186003)(33656002)(2906002)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUxtMW9GVkFHTk9PUFk0My9Rb1Yxa0R3ZHQ3U1dJL0VBL0ZrV3RGZGVyM212?=
 =?utf-8?B?ZGZDZnpxbktYc0xLdW9zakRWZ1NXSzZmeEFkTmhMOEU1SkpQQ05EOFI3Rk1n?=
 =?utf-8?B?NjJkZnJqaXY5Q2ZlK0RuZnJJL0xUWDNVaEtwU2xDRVNqY1l5VUJORDIwekg3?=
 =?utf-8?B?TFhWMzZxVWVkQkRQb0FwTTZmMTUzTW9GMERyc1RoYUNwWW5aeFY3Z1EwNHFi?=
 =?utf-8?B?L1lWQW9WMzIvdmpkQ0tic3BUYldpNENZZzdZbFpqM3d2a0dna0VYV0dxZnp2?=
 =?utf-8?B?eTNqdVJaNnVKNG5TV2E5T08xNDJTckFwakFWUjlpSmtncDJQbzZ6L25jNUtm?=
 =?utf-8?B?SGRqeFBPUThXdDZRYTFZMDFyNE0vNHNjZnhMaVhhRzBUakZ1NElwYVZ2Yytn?=
 =?utf-8?B?VFdWSmpKY0x0d3FHVGJwb1Q2YWhhTEhRM01aL2dXaGhyWXR2RGhMYm5Ja25H?=
 =?utf-8?B?b0VyWkpVcFBhNTFNcjRVOGdWa3F1QmRVNGtlbFV0aFAySG80SUFnZDhqcXZ3?=
 =?utf-8?B?WkRnQ3ZzaUZaVllZanNWUFh5enRHcnhkdy93NmowRk1jWDJBd3diS21TZFl3?=
 =?utf-8?B?SmFCTW43UkFwTDQydjhCTzN0V1dXM2lLSFlCL2VJckdaU25CM1o5ME1TRE5a?=
 =?utf-8?B?WXZyQm92V3IxbGRyei9RZVFVbHhqZHBIU0p4VTBXZGgvc1l4bUpGeXlTZUxy?=
 =?utf-8?B?VkVpVzM4TXZTSTQwL2QrUllVL1lBei9MT1F4dXh4SjB1Y1pvekNyTGJuZTY2?=
 =?utf-8?B?YzJWdnI3ZktXLzl3S0ZPNkFnS1RjdGFRblhDQk5VRWpUVG0rekpkVjJmUVFp?=
 =?utf-8?B?WE1Jb0xMdEZQeHBHNHF6MGhyMGZBSWxVZnd5d1VGeCtXbEFiQUR6T2dHdkZP?=
 =?utf-8?B?Um84NFVXcEZIbEZlNmdUZUhZQlFPOXBSYk54enBaZXFUV1o3TGpFSXlaVWNS?=
 =?utf-8?B?VEJMWUVqNEs1R2FsMWtkK2FaQTFJelBhaGVLTTd4TWc2ZjIvZUovY1c5QWlj?=
 =?utf-8?B?YnZDSnBPN0hXSnZ4YVcvSmdXUlB1SmcyM3NMbUpMMHRFNDB5UDd3a0VkSW5y?=
 =?utf-8?B?alJhQ2hGcExLa1d0NDRWUXhqelBNZUJOUUtRNW9MY0Vqa0VRVzBTUzVGd09z?=
 =?utf-8?B?T2huK00rL0xaSVQ4S093bVN4MnJkS2wxMDJmblhwV1NzczR2NjBNS2lWN3RE?=
 =?utf-8?B?cnlEMU04YjRDN0hEME1vYTF4TEEwMWNqUjhxNlp4ZmdId08ybnplbjYxaVYv?=
 =?utf-8?B?MnBPVjczTU56emtUSS9YT2hQc0dkUUJUU2Y2eE90RytTcC81VTB2TU1uYTJY?=
 =?utf-8?B?Ykk2U0pWTGdQeHg2ZGwzRVc1MEpHQTVxci9xM25wQTdXbXpMaisvKzQyRlJN?=
 =?utf-8?B?VzE1TmVaY2NIOGp0K1hJa0F4Zk5nQjNnY1RKdVUwTThnVGthYXdobm5xQytr?=
 =?utf-8?B?VlBUSzJQMXU4ZlRBTWlWVFExc0NwdHl6Y2dnMXM4c2FhM1lHc2FnQ3IxZmdT?=
 =?utf-8?B?YWFUZmpWN3BQQ2lHSEM2d3hYUmRHbXViMi9QNG1ZWUJYRTBFa2RONU05ZE1F?=
 =?utf-8?B?bDRHNTEwR2xhRGE4eXpZUjNXT0RXMWMxM1hNREoraFd6WUpFWEtYRkJzWTJB?=
 =?utf-8?B?Q2l2YjlaMkhDbWZmRmtwT1hqTU0zenlTQW50S2F0N0lPaWg2Zk9aSC9lOEV1?=
 =?utf-8?B?VjdTVWlPYlljS2MySW5XUUFyTWU2aDl5S2FrNjJqWmEyT3JSTXYybDluZ2FV?=
 =?utf-8?Q?5031OM1Xqaag/xf+Pc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7898.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53eddba5-2e56-41ef-82fb-08d94b8c01cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 14:38:14.5970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nqjwFX5vOpjaQj2XInP94Vbel7JvlE6wBi/oOoNkKy3Hfgxw+KOKqAyjE42mn4SuewvqToZmBtEKahbDLL0w9kdQfTCyfTUHSndUdBPNqgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6887
X-Proofpoint-GUID: O0PdTcyWeXBmXh-fBcQYA_-hmxS-jbim
X-Proofpoint-ORIG-GUID: O0PdTcyWeXBmXh-fBcQYA_-hmxS-jbim
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_09:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "elena.ufimtseva@oracle.com" <elena.ufimtseva@oracle.com>,
 "john.g.johnson@oracle.com" <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>, John Levon <john.levon@nutanix.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYWdhbm5hdGhhbiBSYW1hbiA8
amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+IFNlbnQ6IDE5IEp1bHkgMjAyMSAyMTowMA0KPiBUbzog
cWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBzdGVmYW5oYUByZWRoYXQuY29tOyBhbGV4Lndp
bGxpYW1zb25AcmVkaGF0LmNvbTsNCj4gZWxlbmEudWZpbXRzZXZhQG9yYWNsZS5jb207IEpvaG4g
TGV2b24gPGpvaG4ubGV2b25AbnV0YW5peC5jb20+Ow0KPiBqb2huLmcuam9obnNvbkBvcmFjbGUu
Y29tOyBUaGFub3MgTWFrYXRvcw0KPiA8dGhhbm9zLm1ha2F0b3NAbnV0YW5peC5jb20+OyBTd2Fw
bmlsIEluZ2xlDQo+IDxzd2FwbmlsLmluZ2xlQG51dGFuaXguY29tPjsgamFnLnJhbWFuQG9yYWNs
ZS5jb20NCj4gU3ViamVjdDogW1BBVENIIFJGQyBzZXJ2ZXIgMDcvMTFdIHZmaW8tdXNlcjogaGFu
ZGxlIERNQSBtYXBwaW5ncw0KPiANCj4gRGVmaW5lIGFuZCByZWdpc3RlciBjYWxsYmFja3MgdG8g
bWFuYWdlIHRoZSBSQU0gcmVnaW9ucyB1c2VkIGZvcg0KPiBkZXZpY2UgRE1BDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBFbGVuYSBVZmltdHNldmEgPGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBKb2huIEcgSm9obnNvbiA8am9obi5nLmpvaG5zb25Ab3JhY2xlLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUu
Y29tPg0KPiAtLS0NCj4gIGh3L3JlbW90ZS92ZmlvLXVzZXItb2JqLmMgfCA1OA0KPiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgaHcvcmVtb3RlL3Ry
YWNlLWV2ZW50cyAgICB8ICAyICsrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMo
KykNCj4gDQo+IGRpZmYgLS1naXQgYS9ody9yZW1vdGUvdmZpby11c2VyLW9iai5jIGIvaHcvcmVt
b3RlL3ZmaW8tdXNlci1vYmouYw0KPiBpbmRleCA2MGQ5ZmE4Li5kMTU4YTdmIDEwMDY0NA0KPiAt
LS0gYS9ody9yZW1vdGUvdmZpby11c2VyLW9iai5jDQo+ICsrKyBiL2h3L3JlbW90ZS92ZmlvLXVz
ZXItb2JqLmMNCj4gQEAgLTE2MSw2ICsxNjEsNTcgQEAgc3RhdGljIHNzaXplX3QgdmZ1X29iamVj
dF9jZmdfYWNjZXNzKHZmdV9jdHhfdA0KPiAqdmZ1X2N0eCwgY2hhciAqIGNvbnN0IGJ1ZiwNCj4g
ICAgICByZXR1cm4gY291bnQ7DQo+ICB9DQo+IA0KPiArc3RhdGljIHZvaWQgZG1hX3JlZ2lzdGVy
KHZmdV9jdHhfdCAqdmZ1X2N0eCwgdmZ1X2RtYV9pbmZvX3QgKmluZm8pDQo+ICt7DQo+ICsgICAg
TWVtb3J5UmVnaW9uICpzdWJyZWdpb24gPSBOVUxMOw0KPiArICAgIGdfYXV0b2ZyZWUgY2hhciAq
bmFtZSA9IE5VTEw7DQo+ICsgICAgc3RhdGljIHVuc2lnbmVkIGludCBzdWZmaXg7DQo+ICsgICAg
c3RydWN0IGlvdmVjICppb3YgPSAmaW5mby0+aW92YTsNCj4gKw0KPiArICAgIGlmICghaW5mby0+
dmFkZHIpIHsNCj4gKyAgICAgICAgcmV0dXJuOw0KPiArICAgIH0NCg0KVGhpcyBzaG91bGRuJ3Qg
aGFwcGVuLCB5b3UgY2FuIHJlcGxhY2UgaXQgd2l0aCBhbiBhc3NlcnQgaWYgeW91IHdhbnQuDQoN
Cj4gKw0KPiArICAgIG5hbWUgPSBnX3N0cmR1cF9wcmludGYoInJlbW90ZS1tZW0tJXUiLCBzdWZm
aXgrKyk7DQo+ICsNCj4gKyAgICBzdWJyZWdpb24gPSBnX25ldzAoTWVtb3J5UmVnaW9uLCAxKTsN
Cj4gKw0KPiArICAgIHFlbXVfbXV0ZXhfbG9ja19pb3RocmVhZCgpOw0KPiArDQo+ICsgICAgbWVt
b3J5X3JlZ2lvbl9pbml0X3JhbV9wdHIoc3VicmVnaW9uLCBOVUxMLCBuYW1lLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGlvdi0+aW92X2xlbiwgaW5mby0+dmFkZHIpOw0KPiAr
DQo+ICsgICAgbWVtb3J5X3JlZ2lvbl9hZGRfc3VicmVnaW9uKGdldF9zeXN0ZW1fbWVtb3J5KCks
IChod2FkZHIpaW92LQ0KPiA+aW92X2Jhc2UsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN1YnJlZ2lvbik7DQo+ICsNCj4gKyAgICBxZW11X211dGV4X3VubG9ja19pb3RocmVh
ZCgpOw0KPiArDQo+ICsgICAgdHJhY2VfdmZ1X2RtYV9yZWdpc3RlcigodWludDY0X3QpaW92LT5p
b3ZfYmFzZSwgaW92LT5pb3ZfbGVuKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBkbWFfdW5y
ZWdpc3Rlcih2ZnVfY3R4X3QgKnZmdV9jdHgsIHZmdV9kbWFfaW5mb190ICppbmZvKQ0KPiArew0K
PiArICAgIE1lbW9yeVJlZ2lvbiAqbXIgPSBOVUxMOw0KPiArICAgIHJhbV9hZGRyX3Qgb2Zmc2V0
Ow0KPiArDQo+ICsgICAgbXIgPSBtZW1vcnlfcmVnaW9uX2Zyb21faG9zdChpbmZvLT52YWRkciwg
Jm9mZnNldCk7DQo+ICsgICAgaWYgKCFtcikgew0KDQpJcyB0aGlzIGV4cGVjdGVkPyBJZiBub3Qg
dGhlbiBzaG91bGQgd2UgYXQgbGVhc3QgbG9nIHNvbWV0aGluZz8NCg0KPiArICAgICAgICByZXR1
cm4gMDsNCj4gKyAgICB9DQo+ICsNCj4gKyAgICBxZW11X211dGV4X2xvY2tfaW90aHJlYWQoKTsN
Cj4gKw0KPiArICAgIG1lbW9yeV9yZWdpb25fZGVsX3N1YnJlZ2lvbihnZXRfc3lzdGVtX21lbW9y
eSgpLCBtcik7DQo+ICsNCj4gKyAgICBvYmplY3RfdW5wYXJlbnQoKE9CSkVDVChtcikpKTsNCj4g
Kw0KPiArICAgIHFlbXVfbXV0ZXhfdW5sb2NrX2lvdGhyZWFkKCk7DQo+ICsNCj4gKyAgICB0cmFj
ZV92ZnVfZG1hX3VucmVnaXN0ZXIoKHVpbnQ2NF90KWluZm8tPmlvdmEuaW92X2Jhc2UpOw0KPiAr
DQo+ICsgICAgcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyB2b2lkIHZmdV9vYmplY3Rf
bWFjaGluZV9kb25lKE5vdGlmaWVyICpub3RpZmllciwgdm9pZCAqZGF0YSkNCj4gIHsNCj4gICAg
ICBWZnVPYmplY3QgKm8gPSBjb250YWluZXJfb2Yobm90aWZpZXIsIFZmdU9iamVjdCwgbWFjaGlu
ZV9kb25lKTsNCj4gQEAgLTIwOCw2ICsyNTksMTMgQEAgc3RhdGljIHZvaWQgdmZ1X29iamVjdF9t
YWNoaW5lX2RvbmUoTm90aWZpZXINCj4gKm5vdGlmaWVyLCB2b2lkICpkYXRhKQ0KPiAgICAgICAg
ICByZXR1cm47DQo+ICAgICAgfQ0KPiANCj4gKyAgICByZXQgPSB2ZnVfc2V0dXBfZGV2aWNlX2Rt
YShvLT52ZnVfY3R4LCAmZG1hX3JlZ2lzdGVyLA0KPiAmZG1hX3VucmVnaXN0ZXIpOw0KPiArICAg
IGlmIChyZXQgPCAwKSB7DQo+ICsgICAgICAgIGVycm9yX3NldGcoJmVycm9yX2Fib3J0LCAidmZ1
OiBGYWlsZWQgdG8gc2V0dXAgRE1BIGhhbmRsZXJzIGZvciAlcyIsDQo+ICsgICAgICAgICAgICAg
ICAgICAgby0+ZGV2aWQpOw0KPiArICAgICAgICByZXR1cm47DQo+ICsgICAgfQ0KPiArDQo+ICAg
ICAgcWVtdV90aHJlYWRfY3JlYXRlKCZvLT52ZnVfY3R4X3RocmVhZCwgIlZGVSBjdHggcnVubmVy
IiwNCj4gdmZ1X29iamVjdF9jdHhfcnVuLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBvLCBR
RU1VX1RIUkVBRF9KT0lOQUJMRSk7DQo+ICB9DQo+IGRpZmYgLS1naXQgYS9ody9yZW1vdGUvdHJh
Y2UtZXZlbnRzIGIvaHcvcmVtb3RlL3RyYWNlLWV2ZW50cw0KPiBpbmRleCAyZWY3ODg0Li5mOTQ1
YzdlIDEwMDY0NA0KPiAtLS0gYS9ody9yZW1vdGUvdHJhY2UtZXZlbnRzDQo+ICsrKyBiL2h3L3Jl
bW90ZS90cmFjZS1ldmVudHMNCj4gQEAgLTcsMyArNyw1IEBAIG1wcWVtdV9yZWN2X2lvX2Vycm9y
KGludCBjbWQsIGludCBzaXplLCBpbnQgbmZkcykgImZhaWxlZA0KPiB0byByZWNlaXZlICVkIHNp
emUgJWQsDQo+ICB2ZnVfcHJvcChjb25zdCBjaGFyICpwcm9wLCBjb25zdCBjaGFyICp2YWwpICJ2
ZnU6IHNldHRpbmcgJXMgYXMgJXMiDQo+ICB2ZnVfY2ZnX3JlYWQodWludDMyX3Qgb2Zmc2V0LCB1
aW50MzJfdCB2YWwpICJ2ZnU6IGNmZzogMHgldSAtPiAweCV4Ig0KPiAgdmZ1X2NmZ193cml0ZSh1
aW50MzJfdCBvZmZzZXQsIHVpbnQzMl90IHZhbCkgInZmdTogY2ZnOiAweCV1IDwtIDB4JXgiDQo+
ICt2ZnVfZG1hX3JlZ2lzdGVyKHVpbnQ2NF90IGdwYSwgc2l6ZV90IGxlbikgInZmdTogcmVnaXN0
ZXJpbmcgR1BBDQo+IDB4JSJQUkl4NjQiLCAlenUgYnl0ZXMiDQo+ICt2ZnVfZG1hX3VucmVnaXN0
ZXIodWludDY0X3QgZ3BhKSAidmZ1OiB1bnJlZ2lzdGVyaW5nIEdQQSAweCUiUFJJeDY0IiINCj4g
LS0NCj4gMS44LjMuMQ0KDQo=

