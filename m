Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C10D3187B9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:06:52 +0100 (CET)
Received: from localhost ([::1]:52832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA8s7-0005ke-AA
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andreas.konopik@efs-auto.de>)
 id 1lA8oV-00042x-Dy
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:03:07 -0500
Received: from mailin4.audi.de ([143.164.102.18]:42274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andreas.konopik@efs-auto.de>)
 id 1lA8oS-0001f0-BH
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:03:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5fXov9EtbJIT5Dhc8HlIEaOyTtKjJ+b5YbtJCPXMMLkOZxGIosQxM7R4WcuhRcFGqX5f5OVVgMmMbpeUtMJ8OeeSuxlnXTO3vMuCOrm2Ej0DYfNItNSDMjzY4IgW9XPZLq4t4U36N9kl9RKfG4Jk6vPFieJxibWq6AeEBkuiZ8kdsw6S+W5Z0bXLxszaggQnhyvlCfZrt8oo3ovLeu34M2cZTXp9FY/AfBZvKj4pGX+IIGEWs6ZK4USRO5pJKHEHvdcoPD5qDUNP/yuyMafEzIDFEKU5dujonMeK0ZrUzYUnrUVc9VH2sZuJH/kYkr595573hsqUYgBxvdSVHFVkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfPb77gtCqsICCXB/YRVt+XX/1/SUFAFNqy9VbK05s8=;
 b=U5j6crB2rZcNB1iGDdnMIoZ9VJVWIRVugx4oCxhCzJmi30W3kmJw9uPYtvXY0LixZnLTf1F0MJm2NhCY8UXUCNvyBDcBjNDbuwG2ugoE8tRp+x8KaQdlqvjDll9vv+Q7mrq8sRQVjE96vimBtnXBdIhfHUcVns3llimwjhSHgd7h7oFiGFw915M8VJW2nwPZaitadWYcJECnDA19jNGVV1yIWRyKGi3mZwq1vv71guYKsg63+EAaNOS0QHjZi5ncKpYYQmKXY0d2ZuHjIIiAMFpAd0qed0gAjYLb9qug1uAdY+oBT3S2vG6N26UiL6vihrmsVz6pKCWmZXECi3Fciw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efs-auto.de; dmarc=pass action=none header.from=efs-auto.de;
 dkim=pass header.d=efs-auto.de; arc=none
From: "Konopik, Andreas (EFS-GH2)" <andreas.konopik@efs-auto.de>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 0/1] tricore: fixed faulty conditions for extr and imask
Thread-Topic: [PATCH 0/1] tricore: fixed faulty conditions for extr and imask
Thread-Index: AQHW/4aPMzX9A2VrwEuvcstc3jkzr6pRv2aAgAD6fpA=
Date: Thu, 11 Feb 2021 10:02:44 +0000
Message-ID: <DB8PR05MB6107809DB8A933A0178259F9B08C9@DB8PR05MB6107.eurprd05.prod.outlook.com>
References: <20210210082650.5516-1-david.brenken@efs-auto.org>
 <c2854d29-8926-ae13-fbf7-77197728ae96@linaro.org>
In-Reply-To: <c2854d29-8926-ae13-fbf7-77197728ae96@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Enabled=True;
 MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_SiteId=2882be50-2012-4d88-ac86-544124e120c8;
 MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Owner=andreas.konopik@efs-auto.de;
 MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_SetDate=2021-02-11T10:02:42.7675164Z;
 MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Name=Internal;
 MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_ActionId=b1aa2469-7146-430e-9020-f5b5658f078a;
 MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Extended_MSFT_Method=Automatic
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=efs-auto.de;
x-originating-ip: [165.225.27.151]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db2cc035-d3a8-49ab-1c53-08d8ce742d43
x-ms-traffictypediagnostic: DBAPR05MB7384:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBAPR05MB73841BC7994726D171519093B08C9@DBAPR05MB7384.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VTFpr6CQIYkGP6VtADH1TN44fkigcq+A8hCVgFpcXVQQWAd9zP7KWyEVMDP6e67meecLxVF2p0HpgxEZjruPYQAdsiM7AhlOChE/6Do+GFrRfzmi9wj8h3NpkhA4m6HclhQ6SbufEDqY6sqxKCf8fOJqT5F1964ZKVZc81DHKt5mNATzTJ1sfvdixYiMzpd0Ec5MF8+bR6qqWxSVt+jIAAlYG5jTYBUBoLgATeEHq7Vnm4el6SQVA0aiLeOAcwdBSC7ZmdKWSmACraHZVAnwmh3YTOC4g2w3jjSbxfEKXazYQc7zeMjuXN0p6BbD7wghPyMwU9QAq0Wdlxc7H7JUb4SQ6YicxXogfvurRlbF9YlVChYO/zE+uCDulQC7XaMNwRXYR5U9xiyxQVfekFP+JG133U0Y9Y49dyDZKZJWV7mGtWjSwX8pWj5xmBTg01+H3dkj1mt8ACdmRyL5bXMNBZU3wzsjQG91l5ltfqwoRy9FQEZNQiINN2gBSDHuYdfU0L91DdRrOoojLjHxL6K5yQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR05MB6107.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(316002)(33656002)(2906002)(186003)(64756008)(7696005)(8676002)(9686003)(55016002)(26005)(8936002)(83380400001)(5660300002)(54906003)(478600001)(4326008)(66476007)(71200400001)(55236004)(53546011)(66946007)(52536014)(66556008)(76116006)(110136005)(66446008)(6506007)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dC9iRUVlQWpGeU53bXJ2dldmb1Q1aDIvczdWOEN1N2pRRU9oSFJHcGFMbGNU?=
 =?utf-8?B?TkcwbE53NVQybDlqSG5ZZ0dRTlNkZ0FkUHRvRnE4ck9rc2FRTlJvQnRCcS9k?=
 =?utf-8?B?MUJNQ1Z3ekgyNUdVdEJQT3NjUWk5MHBETnRoS05FMFIxTFRoUmN6aXpDdVpa?=
 =?utf-8?B?N0lqaGVFdzRndS8vd2d4Kzhvb3N6TFJZdmxwbGNxZy9tdzNkOUZScjlmMmMr?=
 =?utf-8?B?YXQ4Wlh1d0xFSEh0VGw2Y0xDNmZPWklNVUxJcHlrVDFDT2RQSmhDN1VmbU9w?=
 =?utf-8?B?bkU0azFVWGhvaVM3eGNxUFFoSHhXNHkxYlFwRldLcUI5LzNVTGJqSG5KRFRK?=
 =?utf-8?B?N0syQmphMkk5OHlCeXdScmN4R0NUSzhMdjVsRWZZVW4vaTcyc3h6d0dMRjYv?=
 =?utf-8?B?ZXFJUm1wR2pEdEcxK2hTOXpOeThDMS9rdlZTWW1veEc0VHF4QWZjMjBhZkk2?=
 =?utf-8?B?N3NqSVN0S3AyaGR5K2lLcFhUck9zdm9mMEUvRG54NWdTUlhsSXJ5WGF2c1pE?=
 =?utf-8?B?eWFNOHlkb212WEIwNldKZW5DYVBLeVRqdzJYVVBmRHA1NjhRSVJoNFhuTWpW?=
 =?utf-8?B?Yk9QeGxZRjlTL1JMVjNUSUppN0lxVGlHd0ViWWpwd1ZIOVJvVExZOTF2T3Rv?=
 =?utf-8?B?b1E3L0haVGR0TjJzUXVjU0NReGdrSE5CcStCd2dyLzREUUo5WWVJa3gvWFp6?=
 =?utf-8?B?OUN4Nlgzditkb09Rb1BtNkNhTWNZMWI5SXFpZHBwNktpMUNJQ3lOYkRrNnJj?=
 =?utf-8?B?dlNneTlxenFEY1hmeWY3Z1UzbEVrbXhydllSeVREU04wZ0FDSTEzOXdkNGRm?=
 =?utf-8?B?aGVtWHc1T3o2MWRHalg5VDZOSmR0UDFyQXVoL3JXYXVXMUVzUndZVkozL3N1?=
 =?utf-8?B?YTJtS2Z2U01KME5zZmVvUCtVbldTYUhjbXA0VXVVL1hoUVIxNzdWajhacERH?=
 =?utf-8?B?SGVSWUZRSmdJb1ZrSUNqcS9kUmNJK0lnMTFvUmMySEREWTl5Q21kL0VZWW1U?=
 =?utf-8?B?TEVWcW1hai9iVlZGTkI3aDJ3OFMrMVE0U2poVk5SWEdDcDBsa0tINWNNOXpT?=
 =?utf-8?B?Z2xtVlh0NFBYU2dQWkdvUzZNVHh4dmF3bjJUWm9UNUVSOXVrTk83UFVZbURw?=
 =?utf-8?B?eEorM2pWU1pBUy9JbnU5QlpaejdpNXFMSmdpakFOSS93UnZyWmVnQ3NLZmJx?=
 =?utf-8?B?cEd6VC92c0dZMHhRUHErZ01YbzRHQVdIeHRwMGdKL0pBTnlDSy9TdnBEN1Rw?=
 =?utf-8?B?dmVIbURPa1M4Nnl4VE5wNG1TbGo2OWRRSTIwYlVjOEFwdTFkZysyRlZaUHFL?=
 =?utf-8?B?b3pwN3YxN01helllcEdUd1RWZVhsUVNIc3Rjd3ZsQ1kwb2NWRWVWRGxYZUtT?=
 =?utf-8?B?ZXdmVUVTMVlUS3JJc204amxud1QveitaTm5OMFNWakN5Si8zaUFiNWR5ejFT?=
 =?utf-8?B?bTdXeUVRTXZWak9hZENVcTllT2hmS1NzZVB3WHlDUWRZMWtFZCtDZ2QwcXFi?=
 =?utf-8?B?MmF1VVBhNVhsb25ZeVFRVFUrd1pLWFdjbzRPNmFLK1NEWE1XMDc2Vm9ZRS9q?=
 =?utf-8?B?RG1ZYUJmL3dITTN1VUsrbHpKdjdPWVVhbHZSSC84bzNUK1ZyWkJhZDRGZGZl?=
 =?utf-8?B?dFNIclFONXRCYWlsZW83dW9mczZSWUFIUEo2UldVbEx4WW5yWnNkd0tQZEtw?=
 =?utf-8?B?M3ExVzZTWVV0ZUYyZUNpdlAxWnBEVWxvS1NMczYyZHpBdU9FNHFBUGFTMFhP?=
 =?utf-8?Q?gcEgehTFEDiK0ANs0w5+YAwkZN6d4q3vaFegKRO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR05MB6107.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db2cc035-d3a8-49ab-1c53-08d8ce742d43
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2021 10:02:44.2796 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2882be50-2012-4d88-ac86-544124e120c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qRvR13wzm8hdCDeagRQOihBVmblc26Lb62ftgcULquy4RK4yij33+LG0GyB1XL/CB0ir3HB19ypAkoNbXA3vxEaI2d27wERCXjY2q6qGgAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR05MB7384
X-SGG-UMAMSID: 20210211100247Z23637mxmos07.wob.vw.vwg 1lA8oK-00069F-UF
X-SGG-RESULT: 20210211100247Z23637mxmos07.wob.vw.vwg C1:OK E1:OK MX1:OK BL:OK
 SPF:off CT: CM: SIP:10.186.25.210 SMF:andreas.konopik@efs-auto.de
X-SGG-MF: andreas.konopik@efs-auto.de
X-SGG-DKIM-Signing: 7af5e6687a8e0ef81b3da7a89c6afb54
X-TM-AS-GCONF: 00
Received-SPF: none client-ip=143.164.102.18;
 envelope-from=andreas.konopik@efs-auto.de; helo=mailin4.audi.de
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>, "Brenken,
 David \(EFS-GH5\)" <david.brenken@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgUmljaGFyZCwNCg0KdGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrLg0KDQo+IEZyb206IFJp
Y2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPiBTZW50OiBX
ZWRuZXNkYXksIEZlYnJ1YXJ5IDEwLCAyMDIxIDIwOjAyDQo+IFRvOiBEYXZpZCBCcmVua2VuIDxk
YXZpZC5icmVua2VuQGVmcy1hdXRvLm9yZz4gDQo+IE9uIDIvMTAvMjEgMTI6MjYgQU0sIERhdmlk
IEJyZW5rZW4gd3JvdGU6DQo+ID4gRnJvbTogQW5kcmVhcyBLb25vcGlrIDxhbmRyZWFzLmtvbm9w
aWtAZWZzLWF1dG8uZGU+DQo+ID4NCj4gPiBIZWxsbyB0b2dldGhlciwNCj4gPg0KPiA+IHdlIGhh
dmUgZml4ZWQgYSBmZXcgY29uZGl0aW9ucyBsZWFkaW5nIHRvIGluY29ycmVjdCBpbnRlcm1lZGlh
dGUgY29kZQ0KPiA+IGdlbmVyYXRpb24uIFJDUFdfSU1BU0ssIFJSUFdfRVhUUiwgUlJQV19FWFRS
X1UgYW5kIFJSUFdfSU1BU0sNCj4gaW52b2tlDQo+ID4gdW5kZWZpbmVkIGJlaGF2aW9yIGZvciAi
cG9zICsgd2lkdGggPiAzMiIsIHdoaWNoIGlzIGFsc28gY2hlY2tlZCBpbg0KPiA+IHRjZ19nZW5f
ZXh0cmFjdF90bCgpLiBSUlJXX0VYVFJfVSBpbnZva2VzIHVuZGVmaW5lZCBiZWhhdmlvciBmb3IN
Cj4gPiAid2lkdGggPT0gMCIsIGhlbmNlIHdlIHJlbW92ZWQgdGhhdCBjb25kaXRpb24uDQo+IA0K
PiBUaGlzIGlzIGluY29ycmVjdCwgYmVjYXVzZSAidW5kZWZpbmVkIGJlaGF2aW9yIiBzaG91bGQg
bm90IGluY2x1ZGUgYSBxZW11DQo+IGFib3J0Lg0KDQpJIGRpZG4ndCBub3RpY2UgdGhhdCB0aGVz
ZSBjaGVja3MgdGVybWluYXRlZCBwcm9ncmFtIGV4ZWN1dGlvbi4NCg0KPiBZb3UgY291bGQgcmFp
c2UgYSBndWVzdCBleGNlcHRpb24sIHlvdSBjb3VsZCB0cmVhdCB0aGUgZmF1bHR5IGluc3RydWN0
aW9uIGFzIGENCj4gbm9wLCB5b3UgY291bGQgdHJ1bmNhdGUgdGhlIGlucHV0cyB0byBhdm9pZCB0
aGUgYWJvcnQsIHlvdSBjb3VsZCB3cml0ZQ0KPiAweGRlYWRiZWVmIHRvIHRoZSBkZXN0aW5hdGlv
bi4NCj4gDQo+IE9yIHlvdSBjb3VsZCBmaXggdGhlIGNvdXBsZSBvZiBmYXVsdHkgY29uZGl0aW9u
cyBhbmQgbGVhdmUgdGhlIHJlc3Qgb2YgdGhlIGNvZGUNCj4gYXMtaXMuDQoNCldlIHdpbGwgc3Vi
bWl0IHRoZSBwYXRjaCBmb2xsb3dpbmcgeW91ciBhZHZpY2UgYXMgc29vbiBhcyBwb3NzaWJsZS4N
Cg0KS2luZCByZWdhcmRzLA0KDQpBbmRyZWFzDQoNCklOVEVSTkFMDQo=

