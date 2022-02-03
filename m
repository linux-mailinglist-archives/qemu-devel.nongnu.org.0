Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA19C4A8CC7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 20:56:04 +0100 (CET)
Received: from localhost ([::1]:53652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFiD5-0008TV-TZ
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 14:56:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nFhMt-0000tn-Vs; Thu, 03 Feb 2022 14:02:08 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:46692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nFhMq-0005P7-SI; Thu, 03 Feb 2022 14:02:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1643914924; x=1644519724;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A38pUBvP620/MutrWydxWP4Dij/2ek83VrQhvPEp7AI=;
 b=zrCVbK4oab/yet8UVUKIpJ0gjrC3pPExVYQlF65m/X0keTK2btbhl6tK
 lL69Oj/nTScmTlCkPRkSyXd+jzg9lNoM/DGwqz6NIjkW0T1y9FEob9xfi
 DJzCmwXCN9jDjh3YylH8Y/jD0AyDUnI0NmyKFlhMtX0qpa8h8T6iEtyoa Y=;
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 19:01:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=En9DWnzTn5wBpUrSrN0pu3USftDeH23CpkQuSDpv2gTaoP0ADYtfYHyaK6BVB9k/9tZr89O8py5vRfLHn5kBHc4AHqSJMjOlUdHAAXSWqMHtw84uuWzxlEoiXg8C0zyh07s6s7I4o/gakiZ+VZ1SDNHUOcd16Dr3hGgCYoE438n8CR5drgi7evZQnm6KuYJeBNhprG/PIoBoVNe9SooprgJiMaNt+w2B1vF9IkYcJCcxmYOdnnxK3nQ6KmtgJLmZ0oZ62BFjO1XVjjgVIjugerdNFgRTat6dMY/dKJzwQlFIIHqwh7gOqPFDqlcW2Z1tenhtMmf8Gxmtnz7fgZMCkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A38pUBvP620/MutrWydxWP4Dij/2ek83VrQhvPEp7AI=;
 b=Hyqr84RFZaiZU+neSzosxYNYzLTIYNh4PCiZVePaeMcGqHunOkeM4Jnf7c8FmG75vn34wt9OFfzAl0WPdm4r/C5cXyKNKU3EK+gKPagVoIjkju26XJaWyAEeBbLP8i8qh1PR/zE/OROK6AvYdTjME4jcA5Y9wVyHRYxMGJdHV7GzOWID5evhPSJAwZW9VbP2zGigwTYxMsFdlxsIkAZR6uDi4IONDIY2CcKYkReJKYCIMoFIJuE+NFAHxFyynMiVwYqUkK+Vy1HSEbAMm4rah7qUnOVMgsT+qq08b9gEYVRTNho8OtImDEgW57D8DFrwmspWfDPOnqVdlF0LfKAxnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by MWHPR0201MB3465.namprd02.prod.outlook.com
 (2603:10b6:301:76::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Thu, 3 Feb
 2022 19:01:54 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::bd2b:92ca:d25e:9d10]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::bd2b:92ca:d25e:9d10%6]) with mapi id 15.20.4951.014; Thu, 3 Feb 2022
 19:01:54 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Subject: RE: [RFC PATCH  0/4] improve coverage of vector backend
Thread-Topic: [RFC PATCH  0/4] improve coverage of vector backend
Thread-Index: AQHYGHGJHyYvQ8C+vki+6vd1G/AKz6yA5OuAgAApILCAAPft0IAAFiAAgAAAdCCAAAmWAIAACUOg
Date: Thu, 3 Feb 2022 19:01:54 +0000
Message-ID: <SN4PR0201MB8808C67FF92D6656EB9DD5B0DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <87k0ecvoxu.fsf@linaro.org>
 <SN4PR0201MB8808B91BF0F27E376C1872AEDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <SN4PR0201MB88089C0A52C660DC7A6D71E6DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87pmo3sut4.fsf@linaro.org>
 <SN4PR0201MB8808A6436C987408C04CED6BDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87leyrst2m.fsf@linaro.org>
In-Reply-To: <87leyrst2m.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53e0ae5f-ff46-4b2f-fce3-08d9e747a4c1
x-ms-traffictypediagnostic: MWHPR0201MB3465:EE_
x-microsoft-antispam-prvs: <MWHPR0201MB34659C9EB42AA8549CE6F477DE289@MWHPR0201MB3465.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NNe4Fy5UDsr5QgSsQHDAmZsik6psnMwJjlCQTpjvyNTDWLWYltRfFr9L2V7NDjcUPpgsdtSeI9oaKmWSkDo0xC7hKDpXxk161uu83vQnf6FuKIVoNMRY84JW/jWbC2W5wLB8lzpUh7LePm7YbE1ezRS2nrR84XpHJbpHWmL2gfPXI/j7yElsKYNzmTgUOVfYIwPFkWg7RCnJGMd6TxF1CWKL89Jlxjt+9C7kJu2G/EtCN1C6/gFUgYmHYq3yfhdZUcaRqQOBwegnSMm1cmPDqoQl6KQbVZW6XzQJe/Bz3BuTKlpo6rs5XGF6V4QXOKZxWIU9HD14end76eljNKhiVkA6ittXR9POZUOQkvx2lB3lBnABkJC92ZPAXFG7cDuTArtRR60wsn5oDYmjY2aPB7TgWIClpO5lykutRYgxPGXVFsa9WsPc/ecauEFXQElLmA2962nGVMk0iisDCBFy3JY9aidE3RlFSqOk9FT3be507L22u24ILeKMyc5Fr4qF2Myc7NzRU75wifCHaxSNzlXgUGfJjJrE4YZ6o8NTx5UV/3bacEhUufli3nEcMA3VFvnVqwDJbgkQF1pC0yHxxoffTCxqz6fQXzSShN/4N75QXOPJN6f21fEca686Y3KtjLwcTakJnA2joKcbWIxd8NqfjStP6TroK6yA8CRjYWBkr+6hphtv6XOUUDFJGL0TlZJU+NtCiFmn9NT6nY9oR1e09/3YOFeI7Y6ErTbIdWoUhW6g8YZfFRCiUag8Pb5bEiB1ih0EiC3B7H16JwoOImjexdZI4qSmSopcQZAO9/Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66574015)(9686003)(52536014)(83380400001)(966005)(6506007)(7696005)(55016003)(33656002)(508600001)(53546011)(5660300002)(316002)(7416002)(6916009)(54906003)(86362001)(64756008)(71200400001)(66476007)(66446008)(4326008)(8676002)(8936002)(2906002)(122000001)(186003)(26005)(38070700005)(38100700002)(66556008)(66946007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zk5WalZkMlIvclBsalFVVUk0blphL2dTT2Z6L0xmNENWMTRyZmJzU2RLemQy?=
 =?utf-8?B?RnNSTW1hRlMvZzg4VlduSjhCYlprYXYrMGdoUEFMNXAxeXBsYWU1YXhwd2pj?=
 =?utf-8?B?cjFQc1FscHlUV3UvWXBrYnpnK2s3dUNodXVSNmFCbTl3cTN5czVUZWp0SUEr?=
 =?utf-8?B?ZEF5blFJTkdyOGdJZVgrUTZLQmFGV0RJNVV0MGVIUkZpSE1sQU1neGtqdTFx?=
 =?utf-8?B?N3VoVjVOMHpOeXd3dHdLZWx2bGxGclBlZ1NPeUV3RExmQnBiQkZRVG1KMndE?=
 =?utf-8?B?TjhoUXpBVlhxeTI2NlpkTGlLbEthVDBNNjF3ZFlCNzJsdkdPWU9NQW8wRUtm?=
 =?utf-8?B?bU1SeW1oMERrejBxS3ZtSWRYL2FSV1ZJeW9SWDBGcllmVXQrOVZFTWZocFBC?=
 =?utf-8?B?ZWJQVVJTaDdqTjNYMFJPUHBjNDNuelVoRlBENmRNMmNRU2E4YjI3WUd0eEpz?=
 =?utf-8?B?R05hMlhkMkNwWVhmWG1NMDVkTlNNN0hYd2NoMWZiOERlV0xXajRQb0c3Yksy?=
 =?utf-8?B?YS9yQXNFZ2FubytBWDFxMkFFNjAwSDlwWkh2dEpCUFA3Q2xQc21ReTQ2THNr?=
 =?utf-8?B?aU50bm9VVkdIdXlNT2FSVVdIRElVd3lGWEthOCtEQ2xKMEY2MTBaalhZM2Nw?=
 =?utf-8?B?TmpJdUZGRDM3ZU5EWEgwU2lEL3dPNGlvYTcxcUN4ZTdPamFPQTQzSWRUUXVm?=
 =?utf-8?B?ajFLRncyTFpFNkNiMGtkVkZ2dXpZaEJBT25RUURjYjAvamxPUi9wcFBtMXdt?=
 =?utf-8?B?M3lkaDJpMzR5Y1RoMlJpSFBKdG5kOEk0WTNnZXpNeDNGazI5c2xzOS96NDdh?=
 =?utf-8?B?Rnp4TDRhVkd6S0hPdi92UlNkTFU1RkoycWJUTVpxZENpUTBibmkzNndqT0Jw?=
 =?utf-8?B?d2JzM24xNEZNS2VyL0FyY05TazAvMTBmRzRXOXBaUU0zZUQxUVZpbFA0Mng3?=
 =?utf-8?B?b2hYWWszNnFzMUJwTTFqUktZZ3dYM3Ezc2R4dXQvc3RvY1J6bjVpTytKZXB5?=
 =?utf-8?B?d1hmR0c4R0ZNcnRsSU1YV2Nid21oY2ZjN1B5YStKYTAxWUJQNnlXSU9rbHhv?=
 =?utf-8?B?dUxLaDk4M2FVc3VSdjNmVTN6dXF1RFJZbnZSaCtTUHNtTklyWTFpQWdlTHNN?=
 =?utf-8?B?V3pBMWcwRDFYUTRIYjNPeGlHR1VPZFJPNmNHdXZBNFFuQmV5TjVMeDdzM1Mx?=
 =?utf-8?B?dmV4SEtxVmZmSUIrbEtaeWdBTDJvdmtJL2lHd3VhSTdUTFhzQVd2bnpnKzR6?=
 =?utf-8?B?UXlMcEloQU53Tk1qaFFVRGFMMzRGdHgyMTlpNEZSZHF3dG9mRkptUkF2Y0RE?=
 =?utf-8?B?VVQ0U0NtSTMvM3JmbzVGK24zRDdnZ0JrUVhSanlNbWQvaUZCWFhmR3JnRlYv?=
 =?utf-8?B?V2NKZm9WNElhaWhhUmxEc1BuVHhoeDE5cXFZS0F0MmtSeVNsY2RUU0FWck55?=
 =?utf-8?B?elBmZGZUTi95TzJJUzFDNmxIU0g0OTlKNHZ6TmJ4eG9hQlRzV1g0MGlaS2ha?=
 =?utf-8?B?Ly9tM3czNzRGL1E3VlJjM1FsbFIzaW9JN0dSWXNXTkxSZXBQTG11Q0ZGUHVN?=
 =?utf-8?B?VWZidVhxR2taY3cxK2V4SG5EVUpYZzhiY2pPeVlZTXhhcjUxa0dQdlFmSTBl?=
 =?utf-8?B?ZTViNlR2ZFF2U2FZT1BnRGFIMkV4K05FUytIc1NEc1F5ZXBoS1F1SzBJYTdR?=
 =?utf-8?B?SkVSYUdvaXhPeDQ5Q2FWdEdIRFpOWnJsRjUyaEp1TUdWY0hFcmdpVGpxYU1C?=
 =?utf-8?B?VmxWelF5UWpPTjNIVll2VGhRUFBsL0xmQ1BGaWNmNnp3VlFuZytpdGZSOVYz?=
 =?utf-8?B?YzhmMVRsTG81cnZ4SEwwWXE0NDd2Ris3SElqK2RLWlpPMUhpYmpWNmUycWda?=
 =?utf-8?B?OUFJOGc2MGdFRk9jTnRBQVdycG5CN0hBVEo5SU1XRjRYdTVOVFlkVFQ2NG1B?=
 =?utf-8?B?UVQvMGQ2TUZMcE9XYUZBNlBJckpRd0xzUDd0ZzlwR1YrU0NoY3N0VE1FTFVM?=
 =?utf-8?B?VjlRSEQxOVBPditMYVNHR3RJSDN1TXZKUzQ5M1V4UUNITU9UQTFmNldCTDJj?=
 =?utf-8?B?Z0grU29tdnlFQXFyN0tzanA3bStzMjRENm9HUFduVXVKNWkxM2c1WG4rc3FB?=
 =?utf-8?B?NFgyeFc2NjRNcnRmT2V3cEl1cExKK1JacitVWm9FRFVyWkRMTlM0L04rQXpY?=
 =?utf-8?Q?/n1VR0C7BfncjIvzTvRGRMw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e0ae5f-ff46-4b2f-fce3-08d9e747a4c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 19:01:54.1567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cOU+lizGeqzmftLzvH4b6ZkldUhiHZe/zLdc24rZDElaahCA5wJVDK00Dp1GwJ1VWQ3HdP2GrbJ/OXCFByB+Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3465
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: "fam@euphon.net" <fam@euphon.net>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleCBCZW5uw6llIDxh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgRmVicnVhcnkgMywgMjAy
MiAxMjoyNiBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPg0K
PiBDYzogcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3Jn
OyBxZW11LQ0KPiBhcm1Abm9uZ251Lm9yZzsgZmFtQGV1cGhvbi5uZXQ7IGJlcnJhbmdlQHJlZGhh
dC5jb207DQo+IGY0YnVnQGFtc2F0Lm9yZzsgYXVyZWxpZW5AYXVyZWwzMi5uZXQ7IHBib256aW5p
QHJlZGhhdC5jb207DQo+IHN0ZWZhbmhhQHJlZGhhdC5jb207IGNyb3NhQHJlZGhhdC5jb20NCj4g
U3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMC80XSBpbXByb3ZlIGNvdmVyYWdlIG9mIHZlY3RvciBi
YWNrZW5kDQo+IA0KPiA+IEFueSBjaGFuY2UgdGhlIHByb2JsZW0gaXMgaW4gdGhlIHRlc3QgaXRz
ZWxmIChlLmcuLCBzb21lIHNvcnQgb2YNCj4gPiB1bmRlZmluZWQgYmVoYXZpb3Igb3IgYSA2NC1i
aXQgdnMgMzItYml0IGRpZmZlcmVuY2UpPw0KPiANCj4gSXQgZG9lcyBoYXZlIGEgNjQgYml0IGJ5
dGVzd2FwIGluIC0gaXQncyBwb3NzaWJsZSBJIGJyb2tlIGl0IGNvcHlpbmcgZnJvbSB0aGUNCj4g
dXBzdHJlYW06DQo+IA0KPiAgIGh0dHBzOi8vY2NvZGVhcmNoaXZlLm5ldC9pbmZvL2NyeXB0by9z
aGE1MTIuaHRtbA0KPiANCj4gYnV0IGl0IGRvZXMgcGFzcyBvbiAqYWxsKiB0aGUgb3RoZXIgYXJj
aGl0ZWN0dXJlcyB3aGljaCBpcyBhIG1peCBvZiAzMiBhbmQgNjQNCj4gYml0IGNvZGUuIEkgZGlk
IGhhdmUgdG8gaGFjayB0aGUgZW5kaWFuIGRldGVjdGlvbiBjb2RlIHRob3VnaC4NCj4gRG9lczoN
Cj4gDQo+ICAgI2lmIEJZVEVfT1JERVIgPT0gQklHX0VORElBTg0KPiANCj4gd29yayBmb3IgeW91
ciBjb21waWxlcj8NCg0KTm8sIGJ1dCB0aGlzIGRvZXMNCiNpZiBfX0JZVEVfT1JERVJfXyA9PSBf
X09SREVSX0JJR19FTkRJQU5fXw0KDQpXaXRoIHRoYXQgY2hhbmdlIGluIHRoZSBzb3VyY2UsIHRo
ZSB0ZXN0cyBwYXNzZXMuICBXaWxsIHRoYXQgd29yayBmb3Igb3RoZXIgdGFyZ2V0cz8NCg0KVGF5
bG9yDQoNCg==

