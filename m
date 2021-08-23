Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4DB3F46C7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 10:44:37 +0200 (CEST)
Received: from localhost ([::1]:49996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI5ZM-0002Sw-Se
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 04:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mI5XG-0000ZQ-Ky
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:42:26 -0400
Received: from esa2.fujitsucc.c3s2.iphmx.com ([68.232.152.246]:18536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mI5XE-0001g5-Hr
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1629708145; x=1661244145;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YydqLxE73uTRYZZsGJiInhbTe7cJarOF56nOBzmBe58=;
 b=U/2xqGEAdG0U7OG91KNdcHS+7sDfUuLVcfv8lEDedPFG0Yl/2/LT4oUK
 jFEV9fjeDR4skwzlaYrEw0w/Zu4CfKWZrSioZ4kM3OSJbhQWVnTW+F0uQ
 KL3M5cO7BJjidA5vHZzX5/JxI2gdXkqCb5uqi9cjlut1fFU0JLxn2scZ0
 i168FyJ5ubaGzuohKhYsQwq1daOcDStrOzes/jIoB8mbkQrj05GETVf/W
 MO24EkWkSx+guDssVAXgUArGmyft0qnxKh6FGC0ocSRkpRNPCXAXhwM8B
 va8MF3MqmtHieruqpWIMcJhHEHqlX3dixLZP9lqqjTBd8uUPtNWz18ZCI A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="45552755"
X-IronPort-AV: E=Sophos;i="5.84,344,1620658800"; d="scan'208";a="45552755"
Received: from mail-ty1jpn01lp2056.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 17:42:22 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkWZTC68Xo3UpRbmFKhdiTB7o7LZajzRTj4yDZ8ntBkoao5glSWTZBeOHHgIa/y2dpClTkcCz7vMwEMnrvu3lT61n9eq/nAXUcxfvmQnUcvLEdp3S2JFPXtug7050P+wdbNzlK60m8aCAwI15w3GpaSTYs0Z4FXBM9DVnS22pzFbwRmmC2/WkQLH5s6FMkCAfyY7mzFfy2Jv8Y9lLULZqb12XVbyfVcosrCpv8BOvU5qTL5V6DHFW3dxNp+OHdj/6xiSe8cO7XmeyRCz/cmQHr9O8tVc4qX2ZNufjOxW1He93dFZoYerdc28tn9e1Fv0kd/mqM9Y2aD0lVQ/4W39sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YydqLxE73uTRYZZsGJiInhbTe7cJarOF56nOBzmBe58=;
 b=N6HVJGTX0fJG7zUfMsoSOAMLq54Wf2vXVHH6QYXEu6x+r4H2PBlS++qQk5kIxxnMEKOp4pjSc0KQQzfemswiw2P4XBsJ58gPNSJQzd1EPToHUYpJBy0qZWc1Y02m5ePL6LFh+svRCtJqKjBbOMRy7KncmYJDYXRrZBtrKpxveU/g+DNhk0uvEKm7rSm6+mkiS3Q/7dNdCJ55fjhLkc8q9f+4Izlt7uNAsbemdzE4ztUcnogvoZTneRBo6Uh1Qn+/misUbiNH3x0ZHdf/215AVFvXEmoiy8C1wXDaXoi4EPec+ENXOWx4xPck3+F7TNztRhDfng9DNx4KRd8C1imLyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YydqLxE73uTRYZZsGJiInhbTe7cJarOF56nOBzmBe58=;
 b=JUaRVXnGHci6dyc/oGJ2LT4PB5lWc0k/xjt//SSqSswLW6Zuhfi2QKjTH5KYI7Bj8Z3+DbQ2hv/t9g4TleBT2m6P9DGHw/v9NQSvyg/mnlfKFEKDuh+SZWGX03rtee0n4YY2ghIIxVWC3N8Qx8eYVuIevpaFzTIyGQQp/W3zrJs=
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com (2603:1096:604:14f::5)
 by OS3PR01MB7405.jpnprd01.prod.outlook.com (2603:1096:604:11f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 08:42:18 +0000
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::d0b3:dccf:a218:f634]) by OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::d0b3:dccf:a218:f634%6]) with mapi id 15.20.4415.024; Mon, 23 Aug 2021
 08:42:18 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2 1/2] migration/rdma: Try to register On-Demand Paging
 memory region
Thread-Topic: [PATCH v2 1/2] migration/rdma: Try to register On-Demand Paging
 memory region
Thread-Index: AQHXl88V3UbGGKIGFkqv3Y4aZaKCzKuAxWIA
Date: Mon, 23 Aug 2021 08:42:18 +0000
Message-ID: <18b3929e-8651-11b9-73ee-7fffbff40686@fujitsu.com>
References: <20210823033358.3002-1-lizhijian@cn.fujitsu.com>
 <20210823033358.3002-2-lizhijian@cn.fujitsu.com>
In-Reply-To: <20210823033358.3002-2-lizhijian@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc7fce03-187c-403a-b6c8-08d96611eacf
x-ms-traffictypediagnostic: OS3PR01MB7405:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB7405AB03AC5FD2F4D543F8F2A5C49@OS3PR01MB7405.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sMgSl4h1rIQQjsQ5ZxUxCU/KglR6PacAYVg0q7k27Xw8yY0lPQCDOE4snr3K73p6btNOkYSszBfbWqmwL6aCgC9Q3tfA3JceJYmEZ7WV6ggl3iHuNYM3RngZxNnflR53NkMmr9aGsdP4606QtQGkmPY3LNQztukhhgvglGrMOZCGODMGYq+6Z59UDCpDP7MlEnpD6lWTjEywDBmWDxT2HrykCzswkjMRJkk9yURIvSJvVKlhB6Nep58rFRLc1I0F4u2ouM1RyiBUwDGEGFey8GuIfH6GQsjqGPAb/GHEubOLpNYqXmp/zo/Fu5+8CC0GmchncLPhOAF5T8Z31aNXp6Kliip9CMlnFhiU/5v27USXf0GkKUNsF15lqIXwOVcgIhnEbhcvc2CjiY3EIQX4qv+oOrK4xqoERKiSrCotiQIQkpgnX4TubKIgZhSlPDPN7oJ54hg3LOAVrgN5OXNL3/euSLAcgWFKMaS65k6fKpLQ//FPFDj+QhXrLp5MCh1klpgtiIKbXkyyVq7s0CgwDvVt1Ut1CMypixC3aG/qKGqzzMdkxrpBzRvWK2X6BC55poi4Lquujac7aILbiJ48bd3dpZRn2oDs4mI7OxKX9RtHPHU+pnN3W0IGSpnsWdYc9poy2DB8A6CfeqA0eq3bdQeQ7qYh9/YVvanQFUiD+7MPwHKITlu2zEId1NKYU/impwAJfFsxq18SPGAeamEWVhjvcx6uU0NQ56QwfWomeQtD/flJfRvlUvoaGq2tB1x19fPj22uQlzhUGovDv7k8SCGvTZvsJvglAMMie+DD+XNCYi1vLJ2ggwCi/Jwte5rDia8c8ndLC7jb7hyrfXB+yLhGwLHAOP5JHgo4kA8hdRs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB7650.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(478600001)(31696002)(966005)(110136005)(31686004)(2906002)(316002)(38070700005)(86362001)(85182001)(4326008)(6506007)(2616005)(53546011)(38100700002)(122000001)(5660300002)(66446008)(66476007)(8936002)(76116006)(6486002)(8676002)(91956017)(66946007)(6512007)(71200400001)(83380400001)(36756003)(64756008)(66556008)(186003)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTI4YmI0eHpWVEVPRDg3ajE5VzFIdTJYS2F4M1NwZkp5c0RaQjZGSi9rM1k2?=
 =?utf-8?B?dXp6UElzaGFIb1pTUGV3S2NaZ0grZlRQSDhVZkQrZTZQRHBJYjJZU1VTeHpw?=
 =?utf-8?B?WUNFY1VCMmRSVjd3aWJ4anR4SDdKSnZiY0lqcVFZWHgwMjgyWkU2Z0VGS3NO?=
 =?utf-8?B?SEdBT0ZnN3dmWVJwbVNSSThhTldpS21yd1JtQk5MR3FxYldkUXhQZ0cxemMr?=
 =?utf-8?B?RFpkLzBLcEY1Nm1pSm0xMFoyZUwySkQybE1HQ0FCbVZKSGpxL2xRWkcxS3Ja?=
 =?utf-8?B?SXNGZzg3N2J2dGh4b1FNbWxaOWdJRnU2Z1lGSjUxY0xxREtWd3pUVThNRTd6?=
 =?utf-8?B?aFNQeHQ2VkNaNy9zdDBHbE16RkVPVnZuMWpQL3JqK1F3UHhabzV4S2w4eHBG?=
 =?utf-8?B?ekpyRGZ2N0JVdXBRQURtSE8wWWRBakUvNVV6SnVZc2p3bWMwKzUybWVVVTVl?=
 =?utf-8?B?M01oYmRhZGhqU3VwWXdhL09LTTBNK1pSUkR4ODYxVk5kRkZNUEtCUm53SnhS?=
 =?utf-8?B?TXFGL1J5bWEzMkhoeG5NRldRQnZsZDlGMkNyc3dNSHNFMXpoMDFmWjdsZHRP?=
 =?utf-8?B?Y050b2xvVERxRWtNU2dHQW8rRUNuNzlnTlZqNHVVSHRnRzRjSFc3TS84cncy?=
 =?utf-8?B?bEhxTUJJa1pOZDAzK3BwS2xnSHdaMU5tRmFzNTJxYXRPRFBUWjFuaGowcE5P?=
 =?utf-8?B?SDdCcUY1ajJUT2JPc2NkWmdTbUVuRURyTzIyMDlKMDRwZ2lUbDlUdnY1MkNG?=
 =?utf-8?B?UTY1ZWFhNFRIeTF3Tkoxa1FTR09SOUF5blkvYkZBMnl6RmUwdldQaER5Z2lt?=
 =?utf-8?B?dVovS094NVoxVnJob1FGblBNRnRrVlZtK0xodEt5a1haQUV1ZUg5a2JNVzJo?=
 =?utf-8?B?a2k0ODVRUEp3RFNxOFc2NnN5ZjlZdXdOVVl0eGdkQ2N4SDRrdkxZL2FzZjJD?=
 =?utf-8?B?d2hFTng1RFJRamREaGNBN0liV3lhV1R4YkMwSTE0U1FlVkF5QXRBMXBRdVhy?=
 =?utf-8?B?WGtzajFtNVUrNjdvWHpuYjhWczJYMWF0UzExdWdPUDhKSnJzKzNvUkhETHoz?=
 =?utf-8?B?OG93TmRWYkMwZWdPSjdMRkd5NHBjZGpreVNVZ2Y0Sm9zdVV6eUozTzZ1Q3Zj?=
 =?utf-8?B?ZzZxYVcwR1gzMmRtUU5xOS9xcldMT2FOcDNHUU9PWjIxY1E3ZGc5SFdWM3pw?=
 =?utf-8?B?MlZPZVZKeUM0VE5zSTdZVkUvaUlMbm1GR1NwWi9vRFN4S3lXZkJXS3hWdXRy?=
 =?utf-8?B?N1Bld0RLTGx4dlNrZE5qODZqUHZJQmVGYlRkcmh4cHF3WW9pekhPRE5yQ1Iz?=
 =?utf-8?B?T2lPVlY2dlVWU0ZWSFV6TXJpOVdEU21lOGEvYXR4YXpRZC9WRzIzWTZtN2dt?=
 =?utf-8?B?NXJkUDJNM1ZwenJQUkxZLzMxbGZ1NzFUZ3ZsOW1iRFUxNnF1aDhMTU9OanRh?=
 =?utf-8?B?a3FWM1F1ckRuSytOT1BmcTNWQ3UvM2NSOEtKQ0xRaFM2Wk0vVzArc25ORkl3?=
 =?utf-8?B?NE5KcGtRTWk1ZkI0WkN5U1dadGVZQllBdEFUejRVNjl4SnlDbDRuMjZ6b0lj?=
 =?utf-8?B?bUlDYW5TMTRKQ2dLZ0pOdkNYbzNNTGtJbDJNSGpQYjNyRU9icm53eGV0RzZL?=
 =?utf-8?B?RGR5T0RTd3NvSm5jdHVlNGNrZTh3UnVTU3o4b01jT1VKeEU5UnlvL3Z3YWx4?=
 =?utf-8?B?aitQSyt4MHlFZm9oL0hIcFZ2VTRjWGNxZW15NzQrU3Z3aWkwN25ZT3EwZHVz?=
 =?utf-8?B?UkVWb3BrUW9hT21oK1A4U3NocE9EejNUN1FUZmROZ2xGVVFHOStLZWN3MkVZ?=
 =?utf-8?B?MFlLejFjbmVTUnR2N2Fudz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F23D2D279CEBD468C8F17A9E2C02432@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7650.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7fce03-187c-403a-b6c8-08d96611eacf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2021 08:42:18.8668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y+UHhp/cRQSWKb7iqI1R6p22VnfWaImFjwNZY5iw5+ldpBmDup/prFDKbS7v9QVND3jN/QDgal5KS/Yuj2aA6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7405
Received-SPF: pass client-ip=68.232.152.246;
 envelope-from=lizhijian@fujitsu.com; helo=esa2.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.959,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q0NpbmfCoCBNYXJjZWwNCg0KDQpPbiAyMy8wOC8yMDIxIDExOjMzLCBMaSBaaGlqaWFuIHdyb3Rl
Og0KPiBQcmV2aW91c2x5LCBmb3IgdGhlIGZzZGF4IG1lbS1iYWNrZW5kLWZpbGUsIGl0IHdpbGwg
cmVnaXN0ZXIgZmFpbGVkIHdpdGgNCj4gT3BlcmF0aW9uIG5vdCBzdXBwb3J0ZWQuIEluIHRoaXMg
Y2FzZSwgd2UgY2FuIHRyeSB0byByZWdpc3RlciBpdCB3aXRoDQo+IE9uLURlbWFuZCBQYWdpbmdb
MV0gbGlrZSB3aGF0IHJwbWFfbXJfcmVnKCkgZG9lcyBvbiBycG1hWzJdLg0KPg0KPiBbMV06IGh0
dHBzOi8vY29tbXVuaXR5Lm1lbGxhbm94LmNvbS9zL2FydGljbGUvdW5kZXJzdGFuZGluZy1vbi1k
ZW1hbmQtcGFnaW5nLS1vZHAteA0KPiBbMl06IGh0dHA6Ly9wbWVtLmlvL3JwbWEvbWFucGFnZXMv
djAuOS4wL3JwbWFfbXJfcmVnLjMNCj4NCj4gQ0M6IE1hcmNlbCBBcGZlbGJhdW0gPG1hcmNlbC5h
cGZlbGJhdW1AZ21haWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBMaSBaaGlqaWFuIDxsaXpoaWpp
YW5AY24uZnVqaXRzdS5jb20+DQo+DQo+IC0tLQ0KPiBWMjogYWRkIE9EUCBzYW5pdHkgY2hlY2sg
YW5kIHJlbW92ZSBnb3RvDQo+IC0tLQ0KPiAgIG1pZ3JhdGlvbi9yZG1hLmMgICAgICAgfCA3MyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0NCj4gICBtaWdyYXRpb24v
dHJhY2UtZXZlbnRzIHwgIDEgKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygr
KSwgMjAgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9taWdyYXRpb24vcmRtYS5jIGIv
bWlncmF0aW9uL3JkbWEuYw0KPiBpbmRleCA1YzJkMTEzYWE5NC4uZWI4MDQzMWFhZTIgMTAwNjQ0
DQo+IC0tLSBhL21pZ3JhdGlvbi9yZG1hLmMNCj4gKysrIGIvbWlncmF0aW9uL3JkbWEuYw0KPiBA
QCAtMTExNywxOSArMTExNyw0NyBAQCBzdGF0aWMgaW50IHFlbXVfcmRtYV9hbGxvY19xcChSRE1B
Q29udGV4dCAqcmRtYSkNCj4gICAgICAgcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiArLyogQ2hl
Y2sgd2hldGhlciBPbi1EZW1hbmQgUGFnaW5nIGlzIHN1cHBvcnRlZCBieSBSREFNIGRldmljZSAq
Lw0KPiArc3RhdGljIGJvb2wgcmRtYV9zdXBwb3J0X29kcChzdHJ1Y3QgaWJ2X2NvbnRleHQgKmRl
dikNCj4gK3sNCj4gKyAgICBzdHJ1Y3QgaWJ2X2RldmljZV9hdHRyX2V4IGF0dHIgPSB7MH07DQo+
ICsgICAgaW50IHJldCA9IGlidl9xdWVyeV9kZXZpY2VfZXgoZGV2LCBOVUxMLCAmYXR0cik7DQo+
ICsgICAgaWYgKHJldCkgew0KPiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+ICsgICAgfQ0KPiAr
DQo+ICsgICAgaWYgKGF0dHIub2RwX2NhcHMuZ2VuZXJhbF9jYXBzICYgSUJWX09EUF9TVVBQT1JU
KSB7DQo+ICsgICAgICAgIHJldHVybiB0cnVlOw0KPiArICAgIH0NCj4gKw0KPiArICAgIHJldHVy
biBmYWxzZTsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBpbnQgcWVtdV9yZG1hX3JlZ193aG9sZV9y
YW1fYmxvY2tzKFJETUFDb250ZXh0ICpyZG1hKQ0KPiAgIHsNCj4gICAgICAgaW50IGk7DQo+ICAg
ICAgIFJETUFMb2NhbEJsb2NrcyAqbG9jYWwgPSAmcmRtYS0+bG9jYWxfcmFtX2Jsb2NrczsNCj4g
ICANCj4gICAgICAgZm9yIChpID0gMDsgaSA8IGxvY2FsLT5uYl9ibG9ja3M7IGkrKykgew0KPiAr
ICAgICAgICBpbnQgYWNjZXNzID0gSUJWX0FDQ0VTU19MT0NBTF9XUklURSB8IElCVl9BQ0NFU1Nf
UkVNT1RFX1dSSVRFOw0KPiArDQo+ICAgICAgICAgICBsb2NhbC0+YmxvY2tbaV0ubXIgPQ0KPiAg
ICAgICAgICAgICAgIGlidl9yZWdfbXIocmRtYS0+cGQsDQo+ICAgICAgICAgICAgICAgICAgICAg
ICBsb2NhbC0+YmxvY2tbaV0ubG9jYWxfaG9zdF9hZGRyLA0KPiAtICAgICAgICAgICAgICAgICAg
ICBsb2NhbC0+YmxvY2tbaV0ubGVuZ3RoLA0KPiAtICAgICAgICAgICAgICAgICAgICBJQlZfQUND
RVNTX0xPQ0FMX1dSSVRFIHwNCj4gLSAgICAgICAgICAgICAgICAgICAgSUJWX0FDQ0VTU19SRU1P
VEVfV1JJVEUNCj4gKyAgICAgICAgICAgICAgICAgICAgbG9jYWwtPmJsb2NrW2ldLmxlbmd0aCwg
YWNjZXNzDQo+ICAgICAgICAgICAgICAgICAgICAgICApOw0KPiArDQo+ICsgICAgICAgIGlmICgh
bG9jYWwtPmJsb2NrW2ldLm1yICYmDQo+ICsgICAgICAgICAgICBlcnJubyA9PSBFTk9UU1VQICYm
IHJkbWFfc3VwcG9ydF9vZHAocmRtYS0+dmVyYnMpKSB7DQo+ICsgICAgICAgICAgICAgICAgYWNj
ZXNzIHw9IElCVl9BQ0NFU1NfT05fREVNQU5EOw0KPiArICAgICAgICAgICAgICAgIC8qIHJlZ2lz
dGVyIE9EUCBtciAqLw0KPiArICAgICAgICAgICAgICAgIGxvY2FsLT5ibG9ja1tpXS5tciA9DQo+
ICsgICAgICAgICAgICAgICAgICAgIGlidl9yZWdfbXIocmRtYS0+cGQsDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbG9jYWwtPmJsb2NrW2ldLmxvY2FsX2hvc3RfYWRkciwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb2NhbC0+YmxvY2tbaV0ubGVuZ3RoLCBh
Y2Nlc3MpOw0KPiArICAgICAgICAgICAgICAgIHRyYWNlX3FlbXVfcmRtYV9yZWdpc3Rlcl9vZHBf
bXIobG9jYWwtPmJsb2NrW2ldLmJsb2NrX25hbWUpOw0KPiArICAgICAgICB9DQo+ICsNCj4gICAg
ICAgICAgIGlmICghbG9jYWwtPmJsb2NrW2ldLm1yKSB7DQo+ICAgICAgICAgICAgICAgcGVycm9y
KCJGYWlsZWQgdG8gcmVnaXN0ZXIgbG9jYWwgZGVzdCByYW0gYmxvY2shIik7DQo+ICAgICAgICAg
ICAgICAgYnJlYWs7DQo+IEBAIC0xMjE1LDI4ICsxMjQzLDMzIEBAIHN0YXRpYyBpbnQgcWVtdV9y
ZG1hX3JlZ2lzdGVyX2FuZF9nZXRfa2V5cyhSRE1BQ29udGV4dCAqcmRtYSwNCj4gICAgICAgICov
DQo+ICAgICAgIGlmICghYmxvY2stPnBtcltjaHVua10pIHsNCj4gICAgICAgICAgIHVpbnQ2NF90
IGxlbiA9IGNodW5rX2VuZCAtIGNodW5rX3N0YXJ0Ow0KPiArICAgICAgICBpbnQgYWNjZXNzID0g
cmtleSA/IElCVl9BQ0NFU1NfTE9DQUxfV1JJVEUgfCBJQlZfQUNDRVNTX1JFTU9URV9XUklURSA6
DQo+ICsgICAgICAgICAgICAgICAgICAgICAwOw0KPiAgIA0KPiAgICAgICAgICAgdHJhY2VfcWVt
dV9yZG1hX3JlZ2lzdGVyX2FuZF9nZXRfa2V5cyhsZW4sIGNodW5rX3N0YXJ0KTsNCj4gICANCj4g
LSAgICAgICAgYmxvY2stPnBtcltjaHVua10gPSBpYnZfcmVnX21yKHJkbWEtPnBkLA0KPiAtICAg
ICAgICAgICAgICAgIGNodW5rX3N0YXJ0LCBsZW4sDQo+IC0gICAgICAgICAgICAgICAgKHJrZXkg
PyAoSUJWX0FDQ0VTU19MT0NBTF9XUklURSB8DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICBJ
QlZfQUNDRVNTX1JFTU9URV9XUklURSkgOiAwKSk7DQo+IC0NCj4gLSAgICAgICAgaWYgKCFibG9j
ay0+cG1yW2NodW5rXSkgew0KPiAtICAgICAgICAgICAgcGVycm9yKCJGYWlsZWQgdG8gcmVnaXN0
ZXIgY2h1bmshIik7DQo+IC0gICAgICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIkNodW5rIGRldGFp
bHM6IGJsb2NrOiAlZCBjaHVuayBpbmRleCAlZCINCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAiIHN0YXJ0ICUiIFBSSXVQVFIgIiBlbmQgJSIgUFJJdVBUUg0KPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICIgaG9zdCAlIiBQUkl1UFRSDQo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIiBsb2NhbCAlIiBQUkl1UFRSICIgcmVnaXN0cmF0aW9uczogJWRcbiIsDQo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2stPmluZGV4LCBjaHVuaywgKHVpbnRwdHJf
dCljaHVua19zdGFydCwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAodWludHB0cl90
KWNodW5rX2VuZCwgaG9zdF9hZGRyLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1
aW50cHRyX3QpYmxvY2stPmxvY2FsX2hvc3RfYWRkciwNCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICByZG1hLT50b3RhbF9yZWdpc3RyYXRpb25zKTsNCj4gLSAgICAgICAgICAgIHJldHVy
biAtMTsNCj4gKyAgICAgICAgYmxvY2stPnBtcltjaHVua10gPSBpYnZfcmVnX21yKHJkbWEtPnBk
LCBjaHVua19zdGFydCwgbGVuLCBhY2Nlc3MpOw0KPiArICAgICAgICBpZiAoIWJsb2NrLT5wbXJb
Y2h1bmtdICYmDQo+ICsgICAgICAgICAgICBlcnJubyA9PSBFTk9UU1VQICYmIHJkbWFfc3VwcG9y
dF9vZHAocmRtYS0+dmVyYnMpKSB7DQo+ICsgICAgICAgICAgICBhY2Nlc3MgfD0gSUJWX0FDQ0VT
U19PTl9ERU1BTkQ7DQo+ICsgICAgICAgICAgICAvKiByZWdpc3RlciBPRFAgbXIgKi8NCj4gKyAg
ICAgICAgICAgIGJsb2NrLT5wbXJbY2h1bmtdID0gaWJ2X3JlZ19tcihyZG1hLT5wZCwgY2h1bmtf
c3RhcnQsIGxlbiwgYWNjZXNzKTsNCj4gKyAgICAgICAgICAgIHRyYWNlX3FlbXVfcmRtYV9yZWdp
c3Rlcl9vZHBfbXIoYmxvY2stPmJsb2NrX25hbWUpOw0KPiAgICAgICAgICAgfQ0KPiAtICAgICAg
ICByZG1hLT50b3RhbF9yZWdpc3RyYXRpb25zKys7DQo+ICAgICAgIH0NCj4gKyAgICBpZiAoIWJs
b2NrLT5wbXJbY2h1bmtdKSB7DQo+ICsgICAgICAgIHBlcnJvcigiRmFpbGVkIHRvIHJlZ2lzdGVy
IGNodW5rISIpOw0KPiArICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIkNodW5rIGRldGFpbHM6IGJs
b2NrOiAlZCBjaHVuayBpbmRleCAlZCINCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICIgc3Rh
cnQgJSIgUFJJdVBUUiAiIGVuZCAlIiBQUkl1UFRSDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAiIGhvc3QgJSIgUFJJdVBUUg0KPiArICAgICAgICAgICAgICAgICAgICAgICAgIiBsb2NhbCAl
IiBQUkl1UFRSICIgcmVnaXN0cmF0aW9uczogJWRcbiIsDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICBibG9jay0+aW5kZXgsIGNodW5rLCAodWludHB0cl90KWNodW5rX3N0YXJ0LA0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgKHVpbnRwdHJfdCljaHVua19lbmQsIGhvc3RfYWRkciwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICh1aW50cHRyX3QpYmxvY2stPmxvY2FsX2hvc3RfYWRk
ciwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHJkbWEtPnRvdGFsX3JlZ2lzdHJhdGlvbnMp
Ow0KPiArICAgICAgICByZXR1cm4gLTE7DQo+ICsgICAgfQ0KPiArICAgIHJkbWEtPnRvdGFsX3Jl
Z2lzdHJhdGlvbnMrKzsNCj4gICANCj4gICAgICAgaWYgKGxrZXkpIHsNCj4gICAgICAgICAgICps
a2V5ID0gYmxvY2stPnBtcltjaHVua10tPmxrZXk7DQo+IGRpZmYgLS1naXQgYS9taWdyYXRpb24v
dHJhY2UtZXZlbnRzIGIvbWlncmF0aW9uL3RyYWNlLWV2ZW50cw0KPiBpbmRleCBhMWMwZjAzNGFi
OC4uNWY2YWE1ODBkZWYgMTAwNjQ0DQo+IC0tLSBhL21pZ3JhdGlvbi90cmFjZS1ldmVudHMNCj4g
KysrIGIvbWlncmF0aW9uL3RyYWNlLWV2ZW50cw0KPiBAQCAtMjEyLDYgKzIxMiw3IEBAIHFlbXVf
cmRtYV9wb2xsX3dyaXRlKGNvbnN0IGNoYXIgKmNvbXBzdHIsIGludDY0X3QgY29tcCwgaW50IGxl
ZnQsIHVpbnQ2NF90IGJsb2NrDQo+ICAgcWVtdV9yZG1hX3BvbGxfb3RoZXIoY29uc3QgY2hhciAq
Y29tcHN0ciwgaW50NjRfdCBjb21wLCBpbnQgbGVmdCkgIm90aGVyIGNvbXBsZXRpb24gJXMgKCUi
IFBSSWQ2NCAiKSByZWNlaXZlZCBsZWZ0ICVkIg0KPiAgIHFlbXVfcmRtYV9wb3N0X3NlbmRfY29u
dHJvbChjb25zdCBjaGFyICpkZXNjKSAiQ09OVFJPTDogc2VuZGluZyAlcy4uIg0KPiAgIHFlbXVf
cmRtYV9yZWdpc3Rlcl9hbmRfZ2V0X2tleXModWludDY0X3QgbGVuLCB2b2lkICpzdGFydCkgIlJl
Z2lzdGVyaW5nICUiIFBSSXU2NCAiIGJ5dGVzIEAgJXAiDQo+ICtxZW11X3JkbWFfcmVnaXN0ZXJf
b2RwX21yKGNvbnN0IGNoYXIgKm5hbWUpICJUcnkgdG8gcmVnaXN0ZXIgT24tRGVtYW5kIFBhZ2lu
ZyBtZW1vcnkgcmVnaW9uOiAlcyINCj4gICBxZW11X3JkbWFfcmVnaXN0cmF0aW9uX2hhbmRsZV9j
b21wcmVzcyhpbnQ2NF90IGxlbmd0aCwgaW50IGluZGV4LCBpbnQ2NF90IG9mZnNldCkgIlphcHBp
bmcgemVybyBjaHVuazogJSIgUFJJZDY0ICIgYnl0ZXMsIGluZGV4ICVkLCBvZmZzZXQgJSIgUFJJ
ZDY0DQo+ICAgcWVtdV9yZG1hX3JlZ2lzdHJhdGlvbl9oYW5kbGVfZmluaXNoZWQodm9pZCkgIiIN
Cj4gICBxZW11X3JkbWFfcmVnaXN0cmF0aW9uX2hhbmRsZV9yYW1fYmxvY2tzKHZvaWQpICIiDQo=

