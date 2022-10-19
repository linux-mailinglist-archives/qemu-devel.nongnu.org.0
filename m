Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A72E2604C79
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:57:21 +0200 (CEST)
Received: from localhost ([::1]:43268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBRY-0007d5-9q
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yishaih@nvidia.com>)
 id 1olBLk-0008EM-7I; Wed, 19 Oct 2022 11:51:22 -0400
Received: from mail-bn8nam11on2040.outbound.protection.outlook.com
 ([40.107.236.40]:58209 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yishaih@nvidia.com>)
 id 1olBLb-000814-1P; Wed, 19 Oct 2022 11:51:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkRiW507mdwxe7xG+QM3DiGyosP6NzsdpDBGg6uOfLbw06q80kEQLBJwYoqjD8p5HyxxchdlfeGGpkZjGpd1GaSvlR3iMFUxkaXAk/qYa+oFEWxpFj0zk4f6GLRG4eKyro1dRWE/WkOdvwTIt/HFV4CnNlpOU2ah7WVRV/38rBZcR2+nLuxx+UUFA4lj+rU7YKaS/gWEcNWOSit9EuYbYWPlASgdrIPsXA04fm2r8rw+4LolLFC/wtpB8gM5Sy8FazkVgUPw9wxxGmQfJh3yz6XNFcMTIBNAscW0XvTcB2ar73Pazw+ASKT4a8PwLwLIyOefKoryx9P/VNdulxuk5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poklQs+n4loail2QHGP6PGqgXX+aovHdXo5O0YpNWUQ=;
 b=CopFUuRmsGGFGRymdYmJ16HfJk2W3diwL000l6RhSc+XRMTsD1/YPQiSlC8CVEYpy+Qrqkqw/0F/XcIhHHahVtKpkx5Zypo/PimVvRGt4LYriuot3MGS0UKbDv0kbvDiXUE2s2y1DUxW14OwfBrluiAfXmHaAMjwzS2RgXRJnkhz3EMBntrTvOxZuHlak2bMHwI9iSF+xr8c8938AOsACpgSSLoDQOHTICdCj4ukN19ayCziUwu4wRo/zVRj2l3ihFU16FIcmHL6pi2ZiTPfDY1TuED2M8lqyzZ49RjvtposfwnQfwDo7gI4csH3f5zRvVnw/MxVue4UXEGtL9mcDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poklQs+n4loail2QHGP6PGqgXX+aovHdXo5O0YpNWUQ=;
 b=R93htojqJDltXratxsx4BIMfBxr3vstfyLCkM4lRXq26ah387bvrdiCR9xMRm4DgKWkKacH0Pvu508NW5d6rzttEfpREuVqeRq/e0gYWuNjouoGHRRAt4gR/FJVpk9poelyG26dHW7uASjy7bJVytX3DDohPnGWL3eReYlletk+1Zr2+TJLTJ4y322ZWe+oZzc1pFA9yPf64x9T3cYvsMlEZufG+vqehDieu5gFv+kwF0T1RALGEM+f4GEJlqNKeecOGKTAIDf6qv1Y0hXgapyNpV6TIoeChNxglHWHTZRs7EPGJqAg0Agui3ZvrmT2/XPdFpXjm0eaaEOmtEhm/qw==
Received: from DM8PR12MB5478.namprd12.prod.outlook.com (2603:10b6:8:29::12) by
 CH2PR12MB4873.namprd12.prod.outlook.com (2603:10b6:610:63::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.34; Wed, 19 Oct 2022 15:51:06 +0000
Received: from DM8PR12MB5478.namprd12.prod.outlook.com
 ([fe80::69ed:cde8:b5d9:a994]) by DM8PR12MB5478.namprd12.prod.outlook.com
 ([fe80::69ed:cde8:b5d9:a994%6]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 15:51:06 +0000
From: Yishai Hadas <yishaih@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>, "quintela@redhat.com" <quintela@redhat.com>
CC: "quintela@redhat.com" <quintela@redhat.com>, Alex Williamson
 <alex.williamson@redhat.com>, Eric Blake <eblake@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, "qemu-s390x@nongnu.org"
 <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, 
 Laurent Vivier <lvivier@redhat.com>, John Snow <jsnow@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, Eric
 Farman <farman@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, Avihai
 Horon <avihaih@nvidia.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Maor Gottlieb <maorg@nvidia.com>
Subject: RE: [RFC 7/7] migration: call qemu_savevm_state_pending_exact() with
 the guest stopped
Thread-Topic: [RFC 7/7] migration: call qemu_savevm_state_pending_exact() with
 the guest stopped
Thread-Index: AQHY1tdu5ovC6zbbq0mshe4Zm+GR364MT/0AgABA/kWAATMTgIAAEYrogAAOCICABkdVgIABxEHw
Date: Wed, 19 Oct 2022 15:51:05 +0000
Message-ID: <DM8PR12MB547887F7D203FC7590B3565CC32B9@DM8PR12MB5478.namprd12.prod.outlook.com>
References: <20221003031600.20084-1-quintela@redhat.com>
 <20221003031600.20084-8-quintela@redhat.com>
 <bf945182-5c73-b1cc-13b2-5594bc21823f@oracle.com>
 <87ilknemef.fsf@secure.mitica>
 <803b7e06-d379-1115-a2f7-8bf09ec5a1e1@oracle.com>
 <87h706wsns.fsf@secure.mitica>
 <a273f54e-d9d2-fae7-942b-641aa1a3ed3b@oracle.com>
 <Y06ak0I3FacnkFKr@nvidia.com>
In-Reply-To: <Y06ak0I3FacnkFKr@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5478:EE_|CH2PR12MB4873:EE_
x-ms-office365-filtering-correlation-id: 9349f328-b7eb-439a-bf26-08dab1e9bb92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Mgdds2a9BLoTyV5tM+xfVR44J7asLKPm0sNJ9bRwXC2fkePNeppGMnusDLFI/t3UTHTkwOmKr8kkvLXzLBgpuj3eRkF5CkjvbMnhuMT9SMFVhNCQQ/wndwLSbdnZl1OiZVG/+tcnBSwTQd0RVRQ6ZJMn6hoBOY7ckNs8uwqMpBbJTRPzq53MyNNRyhSj30rq0aWmxy4+ddDXALpU8WkaG0DsNaNSshsj4rFgNOt7ovBEq0GOVUUNJs9AcqdjHlRgPcAznGrBwFRbVWwueKfV+to4NJTNHbjlLXlkU1rV5+dXj9JasMTD09dCi4JfaSX794LFEYsuy9911da+p7/G6A2yArXczZkz99bkvl5+kExApI5yGaabFv1EE65PyuKMywZWMto9BSQGT6TqlUJFEQatQh+SqgNLt78hyrRvJ3DuOjMVzMsEWvgKm7nQYta8epl3eH9M266xhQlOSwe8uly/C7GCp4ayKHIlVXbMJR8tEE1KMrmTx9nfG5P9uP63nge5O4TXbLZytsJd5FkEKFXeg0vpSRyo9sm2YszTNs4IlExHnITeq8KoeeOkk3d115HQTETUL6RRywcJVP2GxFYE7tenNn9xWb7L/XAcmmY76YXlXx/tTUVmxC8inGy8dfHkyzPXSGlbgK/y0IpPFJfYddJJYecZR3AuhXYfdC//EqyDzNOBj8151fhS83kPVvqy0bL1EUNHAS4Jed2vojGZFJSJJ05LKhn6DWWTxu7HCvdZNIAwkfyykDHb4H9cEyAlc7ZYiw9Xu8O70/jMg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5478.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199015)(2906002)(66446008)(4326008)(64756008)(66476007)(7416002)(41300700001)(52536014)(38100700002)(5660300002)(8936002)(66556008)(8676002)(33656002)(86362001)(122000001)(38070700005)(9686003)(7696005)(26005)(6506007)(53546011)(110136005)(186003)(54906003)(107886003)(71200400001)(478600001)(66946007)(76116006)(55016003)(316002)(83380400001)(66899015);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjhxbTN4QndPdEM2cDMxcTIyZkFydXF2aFJRcTVlbmFaVUp2N3JuWFg2UjEz?=
 =?utf-8?B?WWgvKzB3My9WaWJNbW5abkVwalg5MUpSYzRwWjZDR0JwRjVIUGg3b2pQYTNT?=
 =?utf-8?B?aHg0alV0cE5HR0ZPOVExQ09SQ0lNcTVYRDZuTnJhbjJyaWNQb2lKdUkzdFdF?=
 =?utf-8?B?YlV2STUvak8wYzJFN0poc0hGcmppZ2dJcGRCN091WjVLYldyRHYrNTlWSWlu?=
 =?utf-8?B?Y1RLclZPVWxHNTdzTFZHeHNxTDZSWEZ6ZWIwbis5Nk4wZW9UVzhpUjhVYm9w?=
 =?utf-8?B?SmFIajFSc1hQUHI4RkhRS1dRYVdwalhSZDJnTUtUYkF3MWMwM3gyQlkrUm1v?=
 =?utf-8?B?QStTMkVmbGRkUE1jMHk1dERwbzV2NE4rVDhlQmZmSDhEOHpoOXN4MXMzZC9Y?=
 =?utf-8?B?Tm5FSHE3OC91dDRWUkZ0TEx4b1RuQWRYRkw1bnJad3Ixb0VCbjlQQXFnZ04r?=
 =?utf-8?B?NlN6MHRCKy9iQkdqcHo3LzZSVWNRNjhaT2ZSbnEzZFNKczlEK01lM1pFT2RX?=
 =?utf-8?B?bjgza1kvMURPeHZrTkZyWmZjeDFIdGIzUG52RVpOYkh1VkZrUFpDc2tnS2cz?=
 =?utf-8?B?VDJDbnJjTlQzUUJtM2c1MkNvN3VSR0NlbnB4RVJ4QVAybTRGQ2xXS0RRM0Ey?=
 =?utf-8?B?eC9oQjNxOW5VMGw5NGx3Q21PQTNzQnBDTXZsdkZaM0xwbW5ZU0xBcUhCUFVW?=
 =?utf-8?B?a3BWbGJGT2VwSUplME5FaWxmekM5UFEvMVhqM2huU2VhTm9RQ0RBZTVUQ1Zu?=
 =?utf-8?B?dXFxNWJRL0VSV0plaFMybnoxYTN1M1kwbDRRcURZL1lWTUFVS1ZLOHhUVVRr?=
 =?utf-8?B?VXRJLzM2WTRST1M3MzRGS0ZpNEswc2FQQUNodjdpczVBZmljRUJrUnRRMDVa?=
 =?utf-8?B?K2NZNnNyUzhLdDV3aFBNRlFBL29nQk4wN252U2dPTnQrWFA5NWRabW1xMzgw?=
 =?utf-8?B?MjJYSktCYzVaalBieituOFdYdWg0NFp5ZFNrbXRGdC9CTmFma25JMWRqRlc1?=
 =?utf-8?B?Y0MySTJTMHVQbWhlS1J5WmdmNUsxRklCZWgrNVpqZVcybVVxbE9MK0ZsYzFQ?=
 =?utf-8?B?ZnlHUHhsQUIvOWVPYzVrbW5UU2N4RkdHK3ZxVUJtcDBpT1pRVFVOSWlJU2Mw?=
 =?utf-8?B?azhYYWxlaVYyazJUdENYa1hYRkdaNjR5TTNjZUFjS25VV1c4Ty9RaTVLb1lO?=
 =?utf-8?B?aVRHTVNQK1RTbEF4VUlBSDMyMW1rRW4zaWxDWklhZWlaNFluQ3RyR0tXYWpr?=
 =?utf-8?B?WmVpVkhhSUhHMW82TFI5SVkxRHA1NFNJUFFITFB6TkxlbzhxY1Q3MlhMMjJp?=
 =?utf-8?B?WDh5RzB2Nzg4QnRLMFpMZFZzQUxaRVhEN2xIakVidTQrYjRjb2htaktSZzg3?=
 =?utf-8?B?c2diZ2NWWDEyTkJxd1NiSGNYd0pyWG1od3R2WTNVTXZ3SjBqR2F0Zmt2eWZl?=
 =?utf-8?B?eHdtU2ZQRTdydVUwZFl6ZGRXWDNIV0VKTzY0c3FVTU93N09CNUZDbjh2RjNS?=
 =?utf-8?B?Qy9wYmpubUpzNUFROTFLMDFCWlIwNkU2bkdVTkZXbjZLUmJ6cTM1VUJmUU9y?=
 =?utf-8?B?RWpsWVRDZHFwWmRNaHkyYXRhU0MxY3dXeWJUK0pjaUgrcTh1cWhyTjBOZm1L?=
 =?utf-8?B?cmU3d2JpZFBZNkhFRUQzemlDcjhaejRmZ05KcWoyQzNNQkVpV1dIUTEzNGlQ?=
 =?utf-8?B?Y01uU25CQmg1VllQVHRZSnhOZ3pxR1hWSkNxUHVFRlF4WWplRGtaUDdPU05N?=
 =?utf-8?B?NGJxRW5ZSVlMWHNVWXNudkVSeTRHYWwvOFZoc2NjY1dHYWhxbUQwa1NjSHll?=
 =?utf-8?B?emQ1NzJNUGV1dW42dHRrcnRmbmJqOHpSM3BjSHkxOVhtZXpRczVKYVRSSW5i?=
 =?utf-8?B?MEZJa1E0bTJvdHh5Rk5YZDhJdmtLb0twNFVzb1p2Yk44d0lOc3hHSHdnN3d4?=
 =?utf-8?B?a2NqcU13RFhVZWdJWUhQRElCdzNkRzhoeDBaN05JSXNnTitXRC9FK1EvZFBW?=
 =?utf-8?B?MGN1YWhSOXVsdGNuM1I1MFRscERLTTl0NmV6N3BEK3JDcU9TL3VUNGJyaDZx?=
 =?utf-8?B?cG9wYTBQc2tHdERLUzUvVU9UVit1YzNOY1NNR2h0a29KVkdabitjMWplbVRT?=
 =?utf-8?Q?qjCCNnIF2vLI9+ZdZ92a3oWw5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9349f328-b7eb-439a-bf26-08dab1e9bb92
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 15:51:05.8486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZmgpDTk1pI511gKDu1s/dxi8txIUL2Bnh1tgkCsVYvR282GVwt7Uu3KLoiHZ6d0P23TWnDWmVIU9aWudjIa2Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4873
Received-SPF: none client-ip=40.107.236.40; envelope-from=yishaih@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FORGED_SPF_HELO=1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

PiBGcm9tOiBRZW11LWRldmVsIDxxZW11LWRldmVsLQ0KPiBib3VuY2VzK3lpc2hhaWg9bnZpZGlh
LmNvbUBub25nbnUub3JnPiBPbiBCZWhhbGYgT2YgSmFzb24gR3VudGhvcnBlDQo+IFNlbnQ6IFR1
ZXNkYXksIDE4IE9jdG9iZXIgMjAyMiAxNToyMw0KPiBUbzogSm9hbyBNYXJ0aW5zIDxqb2FvLm0u
bWFydGluc0BvcmFjbGUuY29tPg0KPiBDYzogcXVpbnRlbGFAcmVkaGF0LmNvbTsgQWxleCBXaWxs
aWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT47DQo+IEVyaWMgQmxha2UgPGVibGFr
ZUByZWRoYXQuY29tPjsgU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPjsNCj4g
RmFtIFpoZW5nIDxmYW1AZXVwaG9uLm5ldD47IHFlbXUtczM5MHhAbm9uZ251Lm9yZzsgQ29ybmVs
aWEgSHVjaw0KPiA8Y29odWNrQHJlZGhhdC5jb20+OyBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0
LmNvbT47IFZsYWRpbWlyDQo+IFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAeWFuZGV4
LXRlYW0ucnU+OyBMYXVyZW50IFZpdmllcg0KPiA8bHZpdmllckByZWRoYXQuY29tPjsgSm9obiBT
bm93IDxqc25vd0ByZWRoYXQuY29tPjsgRHIuIERhdmlkIEFsYW4NCj4gR2lsYmVydCA8ZGdpbGJl
cnRAcmVkaGF0LmNvbT47IENocmlzdGlhbiBCb3JudHJhZWdlcg0KPiA8Ym9ybnRyYWVnZXJAbGlu
dXguaWJtLmNvbT47IEhhbGlsIFBhc2ljIDxwYXNpY0BsaW51eC5pYm0uY29tPjsgUGFvbG8NCj4g
Qm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT47IHFlbXUtYmxvY2tAbm9uZ251Lm9yZzsgRXJp
YyBGYXJtYW4NCj4gPGZhcm1hbkBsaW51eC5pYm0uY29tPjsgUmljaGFyZCBIZW5kZXJzb24NCj4g
PHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+OyBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRA
cmVkaGF0LmNvbT47DQo+IEF2aWhhaSBIb3JvbiA8YXZpaGFpaEBudmlkaWEuY29tPjsgcWVtdS1k
ZXZlbEBub25nbnUub3JnDQo+IFN1YmplY3Q6IFJlOiBbUkZDIDcvN10gbWlncmF0aW9uOiBjYWxs
IHFlbXVfc2F2ZXZtX3N0YXRlX3BlbmRpbmdfZXhhY3QoKQ0KPiB3aXRoIHRoZSBndWVzdCBzdG9w
cGVkDQo+IA0KPiBPbiBGcmksIE9jdCAxNCwgMjAyMiBhdCAwMToyOTo1MVBNICswMTAwLCBKb2Fv
IE1hcnRpbnMgd3JvdGU6DQo+ID4gT24gMTQvMTAvMjAyMiAxMjoyOCwgSnVhbiBRdWludGVsYSB3
cm90ZToNCj4gPiA+IEpvYW8gTWFydGlucyA8am9hby5tLm1hcnRpbnNAb3JhY2xlLmNvbT4gd3Jv
dGU6DQo+ID4gPj4gT24gMTMvMTAvMjAyMiAxNzowOCwgSnVhbiBRdWludGVsYSB3cm90ZToNCj4g
PiA+Pj4gT29wcy4gIE15IHVuZGVyc3RhbmRpbmcgd2FzIHRoYXQgb25jZSB0aGUgZ3Vlc3QgaXMg
c3RvcHBlZCB5b3UgY2FuDQo+ID4gPj4+IHNheSBob3cgYmlnIGlzIGl0Lg0KPiA+ID4NCj4gPiA+
IEhpDQo+ID4gPg0KPiA+ID4+IEl0J3Mgd29ydGgga2VlcGluZyBpbiBtaW5kIHRoYXQgY29uY2Vw
dHVhbGx5IGEgVkYgd29uJ3Qgc3RvcCAoZS5nLg0KPiA+ID4+IERNQSkgdW50aWwgcmVhbGx5IHRv
bGQgdGhyb3VnaCBWRklPLiBTbywgc3RvcHBpbmcgQ1BVcyAoZ3Vlc3QpIGp1c3QNCj4gPiA+PiBt
ZWFucyB0aGF0IGd1ZXN0IGNvZGUgZG9lcyBub3QgYXJtIHRoZSBWRiBmb3IgbW9yZSBJL08gYnV0
IHN0aWxsIGlzDQo+ID4gPj4gYSB3ZWFrIGd1YXJhbnRlZSBhcyBWRiBzdGlsbCBoYXMgb3V0c3Rh
bmRpbmcgSS9PIHRvIGRlYWwgd2l0aCB1bnRpbA0KPiA+ID4+IFZGSU8gdGVsbHMgaXQgdG8gcXVp
ZXNjZSBETUEgKGZvciBkZXZpY2VzIHRoYXQgc3VwcG9ydCBpdCkuDQo+ID4gPg0KPiA+ID4gSG93
IGNhbiB3ZSBtYWtlIHN1cmUgYWJvdXQgdGhhdD8NCj4gPiA+DQo+ID4gPiBpLmUuIEkga25vdyBJ
IGhhdmUgYSB2ZmlvIGRldmljZS4gIEkgbmVlZCB0d28gdGhpbmdzOg0KPiA+ID4gLSBpbiB0aGUg
aXRlcmF0aXZlIHN0YWdlLCBJIGVlZCB0byBjaGVjayB0aGUgc2l6ZSwgYnV0IGEgZXN0aW1hdGUg
aXMgb2suDQo+ID4gPiAgIGZvciBleGFtcGxlIHdpdGggUkFNLCB3ZSB1c2Ugd2hhdGV2ZXIgaXMg
dGhlIHNpemUgb2YgdGhlIGRpcnR5IGJpdG1hcA0KPiA+ID4gICBhdCB0aGF0IG1vbWVudC4NCj4g
PiA+ICAgSWYgdGhlIGVzdGltYXRlZCBzaXplIGlzIHNtYWxsZXIgdGhhbiB0aGUgdGhlc2hvbGQs
IHdlDQo+ID4gPiAgICAqIHN0b3AgdGhlIGd1ZXN0DQo+ID4gPiAgICAqIHN5bmMgZGlydHkgYml0
bWFwDQo+ID4gPiAgICAqIG5vdyB3ZSB0ZXN0IHRoZSAocmVhbCkgZGlydHkgYml0bWFwIHNpemUN
Cj4gPiA+DQo+ID4gPiBIb3cgY2FuIHdlIGRvIHNvbWV0aGluZyBsaWtlIHRoYXQgd2l0aCBhIHZm
aW8gZGV2aWNlLg0KPiA+ID4NCj4gPiBZb3Ugd291bGQgaGF2ZSBhbiBleHRyYSBpbnRlcm1lZGlh
dGUgc3RlcCB0aGF0IHN0b3BzIHRoZSBWRiBwcmlvciB0bw0KPiA+IGFza2luZyB0aGUgZGV2aWNl
IHN0YXRlIGxlbmd0aC4gV2hhdCBJIGFtIG5vdCBzdXJlIGlzIHdoZXRoZXIgc3RvcHBpbmcNCj4g
PiB2Q1BVcyBjYW4gYmUgc2tpcHBlZCBhcyBhbiBvcHRpbWl6YXRpb24uDQo+IA0KPiBJdCBjYW5u
b3QsIGlmIHlvdSB3YW50IHRvIHN0b3AgdGhlIFZGSU8gZGV2aWNlIHlvdSBtdXN0IGFsc28gc3Rv
cCB0aGUgdkNQVXMNCj4gYmVjYXVzZSB0aGUgZGV2aWNlIGlzIG5vdCByZXF1aXJlZCB0byByZXNw
b25kIHByb3Blcmx5IHRvIE1NSU8gb3BlcmF0aW9ucw0KPiB3aGVuIHN0b3BwZWQuDQo+IA0KPiA+
ID4gTXkgdW5kZXJzdGFuZGluZyBmcm9tIE5WaWRpYSBmb2xrcyB3YXMgdGhhdCBuZXdlciBmaXJt
d2FyZSBoYXZlIGFuDQo+ID4gPiBpb2N0bCB0byByZXR1cm4gdGhhbiBpbmZvcm1hdGlvbi4NCj4g
Pg0KPiA+IE1heWJlIHRoZXJlJ3Mgc29tZXRoaW5nIG5ldy4gSSB3YXMgdGhpbmtpbmcgZnJvbSB0
aGlzIGhlcmU6DQo+IA0KPiBKdWFuIGlzIHRhbGtpbmcgYWJvdXQgdGhlIGlvY3RsIHdlIGhhZCBp
biB0aGUgcHJlLWNvcHkgc2VyaWVzLg0KPiANCj4gSSBleHBlY3QgaXQgdG8gY29tZSBpbnRvIHNv
bWUgZGlmZmVyZW50IGZvcm0gdG8gc3VwcG9ydCB0aGlzIFJGQy4NCj4gDQoNCkRvIHdlIHJlYWxs
eSBuZWVkIHRvIFNUT1AgdGhlIFZNIHRvIGdldCB0aGUgZXhhY3QgZGF0YSBsZW5ndGggdGhhdCB3
aWxsIGJlIHJlcXVpcmVkIHRvIGNvbXBsZXRlIHN0b3AgY29weSA/DQoNCkNhbid0IHdlIHNpbXBs
eSBnbyB3aXRoIHNvbWUgY2xvc2UgZXN0aW1hdGlvbiB3aGVuIHRoZSBkZXZpY2UgaXMgcnVubmlu
ZyBhbmQgZHJvcCBhbGwgdGhlIGNvbXBsZXhpdHkgaW4gUUVNVS9LZXJuZWwgdG8gU1RPUCBhbmQg
dGhlbiBSRS1TVEFSVCB0aGUgVk0gaWYgdGhlIHRocmVzaG9sZCBkaWRuJ3QgbWVldCwgZXRjLj8N
Cg0KWWlzaGFpDQo=

