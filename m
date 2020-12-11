Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623362D7EF2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:59:56 +0100 (CET)
Received: from localhost ([::1]:40484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knndz-0004Hu-94
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:59:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1knnDL-0000o7-CE
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:32:23 -0500
Received: from mail-bn8nam11on2087.outbound.protection.outlook.com
 ([40.107.236.87]:36787 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1knnDH-0005Tw-HI
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:32:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrSbc9ambHy6nuQpeTmJ8D9dwcn3qeyHCaEur3Jyn34HNZGsg2KjqKmWNanGqybza50O0F1zS1mfUW1hXDSR3CsBh2vFs2Icws9nbWZSA8XQ+0p6kvoGUsIxflK/CJh9LQxgeThOzTmv6Fpf3uxqF8XFiDDmdsxLBzU8aUC3lAZhmmTqBoRMjgeTc59qHoAHxDlddbeDfvex143Jb1XxMky8Q7UO7RTZ4KZiMg5PFBqg6xNW5imIYyk4hSFcUk+8G3M8tX6qK/j+9qUlK78vBn8yOxWzWbV/jIh9IOwnCJjY46kNmpRu+sEJBFtgTCzBqrQC3I56JRrYuLbNEoL0uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfVP9RODutVSjjpN/r9wrfJKFq1tDneSRdo9nky3MAQ=;
 b=Bhi/J2ltHLowBMlfnajTz2Xoq4zwbBsbULdaMxmBTzgguR8bKyyabDnmzalHDnkCYgoKhOXYh7LvNv7NywOOxSPubtQKInQnuqmMEdbPBID4QKfTyILYuou5waqXCduBpL5T4qJu1tPhKFN3yF3+X7s3chVj4j4rOupBYyPk6WTQRD5bRpNAD5tL62WkhqaguZUcFJALZEVImtx3Dds4fGA3qPU3dPl5azQEDwNKfmbcS8IzjZMo9TTlf0IuWD8ByR8vV4e8MLAb5lH1XuTtM7JFzuExNYKtOzHRlwDJgcvci8DtRa0GKoWPZds6y3LJmqbegrcWDlKJmXq+bwNYDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfVP9RODutVSjjpN/r9wrfJKFq1tDneSRdo9nky3MAQ=;
 b=j2jK6bVGuollBLHAdsrcfp22Sc2dYxwSzhvp48KgC9w6cNT0+BcdFcKCKhq7vTRxTAVZEoTf2NzCthxS2BlNwU/AUwVBwjHuP01SdojDEVbh/cw/z2f+F8nfEftSf8ow/8dbhZakLKLJBvfquCdFEDehjMVC9n5tW0wz1ObUlgI=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by BYAPR02MB6439.namprd02.prod.outlook.com (2603:10b6:a03:126::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 11 Dec
 2020 18:17:12 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::8163:86a2:8279:471c]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::8163:86a2:8279:471c%8]) with mapi id 15.20.3632.021; Fri, 11 Dec 2020
 18:17:12 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: Vikram Garhwal <fnuv@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>
Subject: FW: [PATCH v15 0/4] Add Versal usb model
Thread-Topic: [PATCH v15 0/4] Add Versal usb model
Thread-Index: AQHWyakU1Iuit5fsw0GKEeicQIOwC6nyHMYAgAAiHvA=
Date: Fri, 11 Dec 2020 18:17:12 +0000
Message-ID: <BY5PR02MB677253233940444E962F521ECACA0@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <1607023357-5096-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <CAFEAcA8-KcdSrFKFGcuPcTQPBvgDapR3epNScaQSbW8s9E9zwg@mail.gmail.com>
In-Reply-To: <CAFEAcA8-KcdSrFKFGcuPcTQPBvgDapR3epNScaQSbW8s9E9zwg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 648263c2-ab64-47f5-4a68-08d89e00fb19
x-ms-traffictypediagnostic: BYAPR02MB6439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB6439EC230C763C450A852D01CACA0@BYAPR02MB6439.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XL4NB+AMW554tJ6VFWtO3/YKoSUQ/ffGaHuGfPDNH3nDq2JViUmzdjRZ7Ioc4880pwH1/fb0YJjFyOhiwibFbME1UphAckyzyGiJvMfyueF2YIYsJc520cluCIzys4zpi4k/HIJyQtvlY+0RPsJkcIzf5W0wSta9yT4Hoir0OcULsfYi+Rf7+B73OyMoLY4mFPpMqmAFXfWUl7fFi0Uu8XfdpAPVhlMkK7dD+uLKc4yf1dqdTkhGC3smCHSeT1u+FekB3KLzTV2qSzjQfQJh1dJxkHfAbY1Zz4rxBomgmIigliHREad2Zb7ABWXPdL7/YywNaw/iYQcmAzXrwxO5Aw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(86362001)(55016002)(64756008)(66476007)(83380400001)(52536014)(7696005)(71200400001)(26005)(5660300002)(4326008)(6636002)(9686003)(2906002)(53546011)(66446008)(4744005)(110136005)(66556008)(8676002)(76116006)(66946007)(508600001)(186003)(33656002)(8936002)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WlhsN004cWMyNGtUZW5raGxOcHc5UFJBN2IyMDVsUCsvNEtZNlF2UllpaEF4?=
 =?utf-8?B?Z05CTUhrbUcvNFJCRUdsUzM4VlNPd2dCNWpsWnNNd1pVU3ZLR2wxMTNWOVpY?=
 =?utf-8?B?Wjd2cER3b1hPc1dRVzVTVi9JbEJwcnZNWmQ4M25HSzFRbWpGMHA0MGtHMGxQ?=
 =?utf-8?B?RG1vRlQzM3dGakVJNWJrNlkzSEZxVE9XK3NFdk15R2xkTmd6bzc2cHk4dVM3?=
 =?utf-8?B?cnB6SWVNWFpHUmFRRFNNcGMxRThBY3RIVkdoU3lMN3FaYWIxb3NZbnkwSXdF?=
 =?utf-8?B?c2poNldVU1RHRHlKT0tqNG9Da2xHSVpnUmIxMUZoTHNHd2JIb2E1aDlzdWVE?=
 =?utf-8?B?Q3Y2WExFQ3VQYnBXM0xROFdlenNVeFA1azFPNUI5YlBwU0djSDNkamh0ZEJ3?=
 =?utf-8?B?ZG52UHVhcVZ1czRmcFZneDhHWEZFTGZrZlJvWGxTNU92bUZpU1l6cnZZeDh2?=
 =?utf-8?B?N3BMQ1NLUkF6ODlyU2lRalVSYkV4NTgvSEVjdDJIYk82VTJJWU9EelFtMG5O?=
 =?utf-8?B?RnpIL3lIQytLSEQ5emIrY2hKOXM5TDMrTzEwemVtRURLSWQxdmx5NEl5OWNM?=
 =?utf-8?B?RzNlK2VPMEdtQXgwQUE0a2FQVDJkcFlLbDlGVUNENkVpZE9IdzQ5TDI1NnBT?=
 =?utf-8?B?eGxCOWI5dDFHcWpaSHZ0NWtxL21QVHc5RVAwYjN3OW1Vc1VRYnpxL1FLRGtq?=
 =?utf-8?B?NlBCNXIyb05kUlpycWRPeVR4aUdpUlpNWXdUbFFITzgvMHBNRkFTa3hkcUdw?=
 =?utf-8?B?RVhmOS83dDhFaUxUN3N5K3dYS3hmdE9FemRFVk5EbG9EWURybmlZUTJueEJm?=
 =?utf-8?B?aGlqd2djSU5ZUFI5NkJiYlluQXdacloxRGl1c0g1VStmbUhGaHMzaHQ3Sit6?=
 =?utf-8?B?WDd3QXYrZkQzOTkzZzQyb2EyQ25OWEtOR1BQcEFRS1hVUzJBRXoyLysvdjI5?=
 =?utf-8?B?UW1qRjhXUDlkeGUyb1hicCtrd0FNTHpyWHh6WlZuR3dyR0VVcTZGc1libGZk?=
 =?utf-8?B?ZjV1ZS9xR0c3Ym9rOFhnUzhMU055Z21neDI4cFBLdW5DeTFUcmZ5R2tHelRi?=
 =?utf-8?B?bmVEMUZ6eUdwcDZKK1EvemZDS1l0eXFQMlZKZHdKMnhtNnBWdmJ3cHNQSy8z?=
 =?utf-8?B?UlNmZSsveGNPeUhRNDZnY0pObVFIa3BFZDl1S3NnbmdwL1o3NUVhNmQzNDZS?=
 =?utf-8?B?Qmk5Mlpnc2pyNE82SmRXWkpkdlptMnRSZitmY01YSnNoU1gwamlmaUFqdEhX?=
 =?utf-8?B?eDNRdytEa08zZFh5RG5yQjMvYVBDNnRPOW9ocXlMMkFQb0JwNDZHbWhxMjhz?=
 =?utf-8?Q?OhnSgyc2QHlfE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 648263c2-ab64-47f5-4a68-08d89e00fb19
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 18:17:12.1368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ISSExm3GXMpYX+yQzhi5WWySlfQMZ84HbgqTgSovtlcipYMICpoJdeYJsSIRMHZLzNaPTPgOB7PbSHBv8KAadQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB6439
Received-SPF: pass client-ip=40.107.236.87; envelope-from=saipava@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGksDQoNCkZpbmFsbHksIHVzYiBzZXJpZXMgZ290IGFjY2VwdGVkLiBJIHRoYW5rIFZpa3JhbSBh
bmQgRWRnYXIgZm9yIHRoZSBncmVhdCBzdXBwb3J0Lg0KDQpSZWdhcmRzLA0KU2FpIFBhdmFuDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBQZXRlciBNYXlkZWxsIDxwZXRlci5t
YXlkZWxsQGxpbmFyby5vcmc+IA0KU2VudDogRnJpZGF5LCBEZWNlbWJlciAxMSwgMjAyMCA5OjQw
IFBNDQpUbzogU2FpIFBhdmFuIEJvZGR1IDxzYWlwYXZhQHhpbGlueC5jb20+DQpDYzogTWFya3Vz
IEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPjsgTWFyYy1BbmRyw6kgTHVyZWF1IDxtYXJj
YW5kcmUubHVyZWF1QHJlZGhhdC5jb20+OyBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQu
Y29tPjsgR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+OyBFZGdhciBJZ2xlc2lhcyA8
ZWRnYXJpQHhpbGlueC5jb20+OyBGcmFuY2lzY28gRWR1YXJkbyBJZ2xlc2lhcyA8ZmlnbGVzaWFA
eGlsaW54LmNvbT47IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT47
IEVkdWFyZG8gSGFia29zdCA8ZWhhYmtvc3RAcmVkaGF0LmNvbT47IFlpbmcgRmFuZyA8ZmFuZ3lp
bmcxQGh1YXdlaS5jb20+OyBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5j
b20+OyBWaWtyYW0gR2FyaHdhbCA8Zm51dkB4aWxpbnguY29tPjsgUGF1bCBaaW1tZXJtYW4gPHBh
dWxkemltQGdtYWlsLmNvbT47IFNhaSBQYXZhbiBCb2RkdSA8c2FpcGF2YUB4aWxpbnguY29tPjsg
UUVNVSBEZXZlbG9wZXJzIDxxZW11LWRldmVsQG5vbmdudS5vcmc+DQpTdWJqZWN0OiBSZTogW1BB
VENIIHYxNSAwLzRdIEFkZCBWZXJzYWwgdXNiIG1vZGVsDQoNCk9uIFRodSwgMyBEZWMgMjAyMCBh
dCAxOToxOCwgU2FpIFBhdmFuIEJvZGR1IDxzYWkucGF2YW4uYm9kZHVAeGlsaW54LmNvbT4gd3Jv
dGU6DQo+DQo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgZHdjMyB1c2IgY29udHJvbGxlciB0byB2
ZXJzYWwgU09DLg0KPg0KDQoNCg0KQXBwbGllZCB0byB0YXJnZXQtYXJtLm5leHQsIHRoYW5rcy4N
Cg0KLS0gUE1NDQo=

