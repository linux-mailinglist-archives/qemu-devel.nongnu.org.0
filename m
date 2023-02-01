Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21119686464
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 11:36:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNAS7-00025p-Dg; Wed, 01 Feb 2023 05:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNAS2-0001za-6U
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:34:51 -0500
Received: from mail-db8eur05on2108.outbound.protection.outlook.com
 ([40.107.20.108] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNAS0-0003in-1p
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:34:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+l7PAOrq8S1HqL/IwzAoa/nPVWKZptVlQKCpUXIE+4Gk2oIjGdR/dlMUtDGa9GhLDGC7DRQwmbIDuKWwILGqsl6QcDDqyzMHN2NdAYYWXb8ElxkrXCNl20QV4CMqDSE+r03m03nv+S+/7zOq/0y3acXh4tFgL6rXkyEPcOmRWMxRGBpkbVQeENaEizGacuehwD1RxgbmOxcQ1ttigiRQu6xnRQvRBv5mNnyPBk7Owl0CNI3UVsmx7H3F7iv9DyzcSfkSCeQyhMC5z3zsgi2NiTFgHZF8tCWpPSqwYD8URXdz4nlop+WxwX6WTah9XcUjo0pCZMjByUh7m+DWwpilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiwqLa3gFtBaVJ/dcshnFOrjpNgpzVRNB8JKGe0Uhe0=;
 b=bv80Z6ZTdjXR1kxTKasKS/BheC6l+9YTwKToYO6QE0Ru5113Ao2COxXEixtvIR3m+EClHkiWo+WRS0YlUJYtqaHgOPMpG/y7YiYCvcIDEiVpXSege0aklrKuJMOxiK5yK4S020osSsHC3aNxM+IUoBjoGXOXk/kYEQrTfWCAXg7F33agIICs2rqcbXG6atAkl8xRYS7gJePJ2G0FL9n5uMbUOFSb/BLBoO7GVNzAQhO2i7sEtoNjFEH8ZCAa2ZyGYhxmXBKaJZXLF5TJEbuw6bWasPuORYw46jskOIwvYtBpK5N76Z6lg/zcE3Fz9XDp2E13P+uFKKAvli3zF3WCfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiwqLa3gFtBaVJ/dcshnFOrjpNgpzVRNB8JKGe0Uhe0=;
 b=NwVa1xCdCFwe1XJCmjcO9xFEJz/2kRADaA99rovu/wev1ZNbDxFNibZH0ceVhzspLBI5mzF0Yit3mWk1tr6+C6eGrKrAa1Kz4QORV77Y/BL2/lo489FBs1LDF+fFeFgB+iAhWsi5JLjPfKA3mY2tk4xcK0LYrvkzvdi5h1UlRac=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AM7P189MB0774.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:119::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Wed, 1 Feb
 2023 10:29:41 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 10:29:41 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Jason Wang
 <jasowang@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, "Michael
 S . Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: RE: [PATCH v3 8/9] igb: respect VT_CTL ignore MAC field
Thread-Topic: [PATCH v3 8/9] igb: respect VT_CTL ignore MAC field
Thread-Index: AQHZNVhbPu1rv7d0gEml5+cOmwOQV665iOSAgABV3YA=
Date: Wed, 1 Feb 2023 10:29:41 +0000
Message-ID: <DBBP189MB14332AC6E6880C0A15E0CB9795D19@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
 <20230131094232.28863-9-sriram.yagnaraman@est.tech>
 <6ee9c527-2993-83b4-02c2-6e604d0c3679@daynix.com>
In-Reply-To: <6ee9c527-2993-83b4-02c2-6e604d0c3679@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|AM7P189MB0774:EE_
x-ms-office365-filtering-correlation-id: 3c39be31-1eb2-45b3-10c8-08db043f3a99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SBgDE6WI0vm6XAfqQhSoG8t0o6SCcqMWoYdyL2cVtBnZiOD7YPpeJl7GGbwWwbU0RD7GDaw+pwo8sbn4QGf4s20KgICfPqNeuGc9PnT4yE1CyZERMCrUyQTqODm0PpADa3Rpkh0qX+Sj/xkAO2cjtisMZ+uzWKpRhjFZ7ugV8WRREmWUR4+/H24TpOERR5S5eI8yGdD7FKc+QU45HsJXRmzTkU0y+UZg6S71Xw76lFsLAIM7qhs3OHKLlRVFEpl00+Yb+WD+5BQNOUWAMRupzAq1kSViFkQ6V4dIEFlMODYbPtvKXocVs7yQ1V2zDEpNrUWDZqw/p9ZdlAVAsoWmdpAsBXuFLxhZrJA4UU48xh3jUjhDkiHlammTRNdekhvSpHIY+KVzF+58UM5703QhrctaEjZDLhCrwwbV1cC4R/IZZ3z3vcBA3r6gMLXOyTAENt2kdVqVgSg8gdPTiYF9yjwpEpuPpSFyS88KiyvsL7UJ+Tsm9syexMNLRDbVW1Ht6jNMqGbPIjCB1HWHwwFK5s9xJPy59kdeldllNy6H4BfRIC2ABBiCUu1PdjFQYRMplsq1rDZ81U2ct4aNCzm8d5UxX5zUTCBbzfhyYMzPOwOlaaLpIDfn5WOOGx41HuzGz+BRUsBzJ4gZci/JDwonGilxDJbrP5NW0nsK8ucwJjMg5Kn9sb7Yr723xiOn5IcB7gqqXWE/W5bujVfzyhkgkA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(346002)(396003)(39830400003)(376002)(451199018)(52536014)(2906002)(8936002)(5660300002)(41300700001)(38100700002)(38070700005)(122000001)(55016003)(33656002)(86362001)(44832011)(54906003)(316002)(478600001)(7696005)(9686003)(71200400001)(186003)(26005)(8676002)(83380400001)(6506007)(6916009)(64756008)(66476007)(4326008)(66446008)(53546011)(76116006)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OE1aTlVxTENjNHUvMzNnc2tDakJuaHFJQTNGb0lzUVRlejEzekdjeG1wMHk4?=
 =?utf-8?B?SThzLzdzYlZCOVRvSHN3dW05dEdmZFpBbC8vZlIvYkQrbW02UEZxOWptZ2Ju?=
 =?utf-8?B?cU4vLzRzak9TN1Q4Mjd5cTc3RmNKTWZCUy9yb3RpUXVWVDd2TjVJbXBERFVo?=
 =?utf-8?B?Slh5WVI5WDY4aHdocEoxKzEvcHBhaDZ4bEIvTmZVKzZGcUlSSm5MVUw2ZkhS?=
 =?utf-8?B?UUVpY3dSVkNiWTQzQlhIeThPOElkMkVYSHh4VEJHR2srRFpML1RJVnJKTVZq?=
 =?utf-8?B?NjRuWG9Md0dCK1dsYlprNjcvdERtMFNxQStPY0ZLVG9ZbjdQSlNHWWNBNFYv?=
 =?utf-8?B?d1VZWHp2MU5yc1B1RWt2WWJLdFptUk1PQnpmWUoxU1VPblNtYk94YUowNTZr?=
 =?utf-8?B?czVXQnlmd0llVEJWZXpmcVpBV2k1ZEJPMm9oTUxCN1N6ay9NSzV3aGhVTFNo?=
 =?utf-8?B?KzhhTkIrd2h4WUZjRWE2ZmgwVlhobXh6QmVtSFJtRlFmRU81L0R6S2pYUHJT?=
 =?utf-8?B?N1VMRnpJK2tKY1RSRFFvbkI3ZFRlQjkvS0pNc1k4eVpzMmFYSndOa0Y3ZU85?=
 =?utf-8?B?VldlbjB4SUhsTzJVY1J5WWxDSmxKUnFOUEFVRTgwandDa2ZoVzI2ZVdtTXha?=
 =?utf-8?B?TWtZY0c0dGFMbXNkNERhRXpCK0ZraWkyamxtcExZRENONndraFc2UjBQVTlj?=
 =?utf-8?B?Tkg4UUQ0Uk9ma2xsc2R3RTBrc3JLR0c3Vlc0eWNRc092cnJkcTVEczBnOE5k?=
 =?utf-8?B?MG5CajA5S0d5UUN6ZEFoOGpwS3h1aGgvVkZmNHRPRU85N3RxYXI5ci9nN3lT?=
 =?utf-8?B?dUQ0d3BjcTFSL09TUFRrR0VTREhyU3FULzNKcE5kYlp4bVYxRXpuVEZGTUpt?=
 =?utf-8?B?VkUxYVVCcU9jcDhlaHpPdWVRL2VqTCtkbVZnMHkzczl4UGJrblI5eHk0aDRH?=
 =?utf-8?B?WDgvUjhyRGxlc283N0gvbUd1MEx6WFZKVVFTRW11YjlJTUxNZWhQMmhZVFZr?=
 =?utf-8?B?UGVmMWJkMGs4UnVkWEF6ZWl5UERPaDNVNUtKWGZvYVZnd2JXVWVZMm5Ud252?=
 =?utf-8?B?L01RZ0lXK3A2cml2YlFheHdEaWFmSVlyeG0yUU5odU9hZSt5dnNIRk9qVGJ3?=
 =?utf-8?B?ajZrVThMZnp4aVk0V1lndEhCbkN5bUJ0dGlKOENzRTVNYW44WTdUU3NEbnBi?=
 =?utf-8?B?NzY0T0ZLUnNqYnFVT2ZQQ00wbDVGZjlDQUQ5Z1BlM0xWVkYycDR4TjV6VjNu?=
 =?utf-8?B?Vjk0Rk1TUmdlMzJONGMyQkpIc2Z6M2xheWtNZDNBK3o5Mko5MzJWWTdpTVZo?=
 =?utf-8?B?akJtaGRTQm81OXFQZUViN0t0MlRRWEVjbEMxYXYvd2g4OXZkSi9KemJNTnlY?=
 =?utf-8?B?bTN0eWtlN1M4TEYwd0ZLZENIQmIrT1l0S1lTVWt6R1UrRk9hZFJLZ3JSeUpI?=
 =?utf-8?B?cWozRyt6U3V0T0hzd0haeEhRV2lINzZ2cytLM0g1Um1oR0sxSzRYMmU3MVlI?=
 =?utf-8?B?SU53N3JhdEhjVlhRN2ovQ3R1eW5QcWFWQkxJQTVZR2NhdzRlcks3ak9SK0xh?=
 =?utf-8?B?WWJXWXhvSW5RVzNYR2FnNmVXTWdTSVg0QzVyVG1aVnR3WVpQTDFDMDRUUXR0?=
 =?utf-8?B?d1ZGb3BWakpqN0plZ0d4U3A4NWdQbDAxYkpHMTVNeHMxc3JDOGY1b3FQRG5a?=
 =?utf-8?B?cHRVN1Jnenh5VlRuTGd4VHQ5WjBzNEw1YjNGRnFPUGJhMVR4bURXUXkvZVlQ?=
 =?utf-8?B?S2U5WWkyODN6K2l2RzBJY0E4TTErd2Q0V3NSejBoOWR2eDNHczhXMDhlcDVs?=
 =?utf-8?B?bTg1RE9FUzJkaWhUSzM5TTFkMkdySWduYmlESkNNNzR5dUhQM2NNRG9hdmVy?=
 =?utf-8?B?L2xIZmxiSWViakdKTXpxZENCNG95Yys5YlVmQ2VJcjA1UDZZb2pLZ3NSVUpi?=
 =?utf-8?B?MWtHcmp2K1pvWHNTYVNWc3RDZm9hRUxVaEhJOEEzWEFZU2VodVdlOXNiYzcz?=
 =?utf-8?B?d1lkSEVzR09Nek5jd2NmZ0dMd09hSitPY3BQMnhhUzdKdGdNR2lVR1lSMTJn?=
 =?utf-8?B?ajRicmx4OHBhdHp2bElaMGtwcFNqdDNoRVAwZ0dzSHlpTXRVd25tM3RyUmtF?=
 =?utf-8?Q?5Rm8oyjPceVU/wDgk/2/Iyg4d?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c39be31-1eb2-45b3-10c8-08db043f3a99
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 10:29:41.5136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HsviczNABrixhskmzoQ3IjvP7mpVEUq5RpHwgp9ZjFvi0uAN+FUfupATCdIl9Iku0xRVj7WCbo1OitEP4VrApyOhYq/wgR0ITMghWoCXcRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0774
Received-SPF: pass client-ip=40.107.20.108;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWtpaGlrbyBPZGFraSA8
YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIDEgRmVicnVhcnkg
MjAyMyAwNTo1OA0KPiBUbzogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWduYXJhbWFuQGVz
dC50ZWNoPg0KPiBDYzogcWVtdS1kZXZlbEBub25nbnUub3JnOyBKYXNvbiBXYW5nIDxqYXNvd2Fu
Z0ByZWRoYXQuY29tPjsgRG1pdHJ5DQo+IEZsZXl0bWFuIDxkbWl0cnkuZmxleXRtYW5AZ21haWwu
Y29tPjsgTWljaGFlbCBTIC4gVHNpcmtpbg0KPiA8bXN0QHJlZGhhdC5jb20+OyBNYXJjZWwgQXBm
ZWxiYXVtIDxtYXJjZWwuYXBmZWxiYXVtQGdtYWlsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyA4LzldIGlnYjogcmVzcGVjdCBWVF9DVEwgaWdub3JlIE1BQyBmaWVsZA0KPiANCj4gT24g
MjAyMy8wMS8zMSAxODo0MiwgU3JpcmFtIFlhZ25hcmFtYW4gd3JvdGU6DQo+ID4gQWxzbyB0cmFj
ZSBvdXQgYSB3YXJuaW5nIGlmIHJlcGxpY2F0aW9uIG1vZGUgaXMgZGlzYWJsZWQsIHNpbmNlIHdl
DQo+ID4gb25seSBzdXBwb3J0IHJlcGxpY2F0aW9uIG1vZGUgZW5hYmxlZC4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3QudGVj
aD4NCj4gPiAtLS0NCj4gPiAgIGh3L25ldC9pZ2JfY29yZS5jICAgfCA5ICsrKysrKysrKw0KPiA+
ICAgaHcvbmV0L3RyYWNlLWV2ZW50cyB8IDIgKysNCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTEg
aW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2h3L25ldC9pZ2JfY29yZS5jIGIv
aHcvbmV0L2lnYl9jb3JlLmMgaW5kZXgNCj4gPiBjNWY5YzE0ZjQ3Li44MTE1YmUyZDc2IDEwMDY0
NA0KPiA+IC0tLSBhL2h3L25ldC9pZ2JfY29yZS5jDQo+ID4gKysrIGIvaHcvbmV0L2lnYl9jb3Jl
LmMNCj4gPiBAQCAtOTY0LDYgKzk2NCwxMCBAQCBzdGF0aWMgdWludDE2X3QgaWdiX3JlY2VpdmVf
YXNzaWduKElHQkNvcmUgKmNvcmUsDQo+IGNvbnN0IHN0cnVjdCBldGhfaGVhZGVyICplaGRyLA0K
PiA+ICAgICAgIH0NCj4gPg0KPiA+ICAgICAgIGlmIChjb3JlLT5tYWNbTVJRQ10gJiAxKSB7DQo+
ID4gKyAgICAgICAgaWYgKCEoY29yZS0+bWFjW1ZUX0NUTF0gJiBFMTAwMF9WVF9DVExfVk1fUkVQ
TF9FTikpIHsNCj4gPiArICAgICAgICAgICAgdHJhY2VfaWdiX3J4X3ZtZHFfcmVwbGljYXRpb25f
bW9kZV9kaXNhYmxlZCgpOw0KPiA+ICsgICAgICAgIH0NCj4gPiArDQo+ID4gICAgICAgICAgIGlm
IChpc19icm9hZGNhc3RfZXRoZXJfYWRkcihlaGRyLT5oX2Rlc3QpKSB7DQo+ID4gICAgICAgICAg
ICAgICBmb3IgKGkgPSAwOyBpIDwgSUdCX05VTV9WTV9QT09MUzsgaSsrKSB7DQo+ID4gICAgICAg
ICAgICAgICAgICAgaWYgKGNvcmUtPm1hY1tWTU9MUjAgKyBpXSAmIEUxMDAwX1ZNT0xSX0JBTSkg
eyBAQA0KPiA+IC0xMDEwLDYgKzEwMTQsMTEgQEAgc3RhdGljIHVpbnQxNl90IGlnYl9yZWNlaXZl
X2Fzc2lnbihJR0JDb3JlICpjb3JlLA0KPiBjb25zdCBzdHJ1Y3QgZXRoX2hlYWRlciAqZWhkciwN
Cj4gPiAgICAgICAgICAgICAgIH0NCj4gPiAgICAgICAgICAgfQ0KPiA+DQo+ID4gKyAgICAgICAg
LyogYXNzdW1lIGEgZnVsbCBwb29sIGxpc3QgaWYgSUdNQUMgaXMgc2V0ICovDQo+ID4gKyAgICAg
ICAgaWYgKGNvcmUtPm1hY1tWVF9DVExdICYgRTEwMDBfVlRfQ1RMX0lHTk9SRV9NQUMpIHsNCj4g
PiArICAgICAgICAgICAgcXVldWVzID0gQklUKElHQl9NQVhfVkZfRlVOQ1RJT05TKSAtIDE7DQo+
ID4gKyAgICAgICAgfQ0KPiA+ICsNCj4gDQo+IFRoaXMgb3ZlcndyaXRlcyAicXVldWVzIiwgYnV0
ICJleHRlcm5hbF90eCIgaXMgbm90IG92ZXJ3cml0dGVuLg0KDQpEZXNjcmlwdGlvbiBpbiBzZWN0
aW9uIDcuMTAuMy42IGlzIGEgYml0IGNvbmZ1c2luZywgSSBpbnRlcnByZXRlZCB0aGF0IHBhY2tl
dCBpcyBub3Qgc2VudCB0byBuZXR3b3JrIGlmIGl0IG1hdGNoZXMgYW4gZXhhY3QgZmlsdGVyIHJl
Z2FyZGxlc3Mgb2YgVlRfQ1RMLklHTUFDIHNldHRpbmcuDQpJIHRoaW5rIHRoYXQgVlRfQ1RMLklH
TUFDIHNldHRpbmcgaXMgb25seSBmb3IgTUFDIGZpbHRlcmluZyBhbmQgcG9vbCBzZWxlY3Rpb24s
IGFuZCBub3QgdG8gZGV0ZXJtaW5lIGlmIGEgcGFja2V0IG11c3QgZ28gdG8gZXh0ZXJuYWwgTEFO
IG9yIG5vdC4NCg0KPiANCj4gPiAgICAgICAgICAgaWYgKGUxMDAweF92bGFuX3J4X2ZpbHRlcl9l
bmFibGVkKGNvcmUtPm1hYykpIHsNCj4gPiAgICAgICAgICAgICAgIHVpbnQxNl90IG1hc2sgPSAw
Ow0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2h3L25ldC90cmFjZS1ldmVudHMgYi9ody9uZXQvdHJh
Y2UtZXZlbnRzIGluZGV4DQo+ID4gZTk0MTcyZTc0OC4uOWJjNzY1ODY5MiAxMDA2NDQNCj4gPiAt
LS0gYS9ody9uZXQvdHJhY2UtZXZlbnRzDQo+ID4gKysrIGIvaHcvbmV0L3RyYWNlLWV2ZW50cw0K
PiA+IEBAIC0yODgsNiArMjg4LDggQEAgaWdiX3J4X2Rlc2NfYnVmZl93cml0ZSh1aW50NjRfdCBh
ZGRyLCB1aW50MTZfdA0KPiA+IG9mZnNldCwgY29uc3Qgdm9pZCogc291cmNlLCB1aW50Mw0KPiA+
DQo+ID4gICBpZ2JfcnhfbWV0YWRhdGFfcnNzKHVpbnQzMl90IHJzcykgIlJTUyBkYXRhOiAweCVY
Ig0KPiA+DQo+ID4gK2lnYl9yeF92bWRxX3JlcGxpY2F0aW9uX21vZGVfZGlzYWJsZWQodm9pZCkg
IldBUk46IE9ubHkgcmVwbGljYXRpb24NCj4gbW9kZSBlbmFibGVkIGlzIHN1cHBvcnRlZCINCj4g
PiArDQo+ID4gICBpZ2JfaXJxX2ljcl9jbGVhcl9ncGllX25zaWNyKHZvaWQpICJDbGVhcmluZyBJ
Q1Igb24gcmVhZCBkdWUgdG8gR1BJRS5OU0lDUg0KPiBlbmFibGVkIg0KPiA+ICAgaWdiX2lycV9p
Y3Jfd3JpdGUodWludDMyX3QgYml0cywgdWludDMyX3Qgb2xkX2ljciwgdWludDMyX3QgbmV3X2lj
cikNCj4gIkNsZWFyaW5nIElDUiBiaXRzIDB4JXg6IDB4JXggLS0+IDB4JXgiDQo+ID4gICBpZ2Jf
aXJxX3NldF9pYW0odWludDMyX3QgaWNyKSAiVXBkYXRlIElBTTogMHgleCINCg==

