Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751C66BDA33
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 21:34:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcuHK-0003Bb-BG; Thu, 16 Mar 2023 16:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pcuHH-0003BA-Lq
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 16:32:47 -0400
Received: from mail-am7eur03on2131.outbound.protection.outlook.com
 ([40.107.105.131] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pcuHF-0000ox-9Q
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 16:32:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEqd1Cc22e8WzHtXyKyPa4ocWFLvKxrox+4oWdSADRf0GDO8Q+P43GTZU1aI9boA11QqeQAJgoJH1Ivq8KA5akjmo3cjzcVScq2qZx1LRktsGICHu823T86F/x5x0+0Bj0wpQPHhIW4Pq16wEpUfelC+Xo7QtLEbMxNqJ6V+xzKRVBPTkX62D1Yza8wWF42dHR7n4mJn/Ie5PUxJTti4OA76s7SzHnftIwawmva0z5gl2l7y4Bk9RzWssyxNeRRHgqNsrjoQiJPLjZOsMIuE/wskxcF+4Z6ZmQvhfnqePxLGofTObjkkeEdwmUCIRsf1INNH6zqVFgUmPYnoKtQ7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNnqb6+LwwVBvdQg8CYpwTnhWbdrRzG7Ma0jYYcDGes=;
 b=VkJCgdImIXGL28osa9VS89zM6mEWmQaZ52YkVydpGC0t2Aq/oy0BAnSK+FmLD13QabQAUytYkr3j1Wo689Ynhu1MNY7EVDlypL6LIzlMT2Mgb+ON8aIdO/OpJVZwUAPWtpMZp4Y/F/8jF1TuaqhRogyVcsTTRg+O/cObafESSxOdoHA78Pj5G2XRHrvbduvmWNNpQQC2shmGHZWUkQqL4L3SlWjrwKZIQHNmYjIHXWMudvXEs7OBFmC908tUsgNexy0fHp1jd9d7n+a7VO+2z/n9YCpFwZ4TGVsD0U6TO77p+7LnEvEKX03t/guRWbBs1fiQknT3TwdvyTt7fNxzsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNnqb6+LwwVBvdQg8CYpwTnhWbdrRzG7Ma0jYYcDGes=;
 b=HilTUWn/rtvBcLVmawNGGH50Qj8IbtcG8irZmCu0saXUCULKOs+thakE88b5TrWyeCnA7EuqwmSiF/JJyk/55Altg7QXCTto8F2sa8qsHXFCwqEmj+9IUcswMPf4giAorIoSJVpynn8B1NP/Iik7pVMRJp03bG0jPjlHAq6Ta/8=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DU0P189MB2042.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 20:27:37 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%8]) with mapi id 15.20.6178.035; Thu, 16 Mar 2023
 20:27:36 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Jason Wang
 <jasowang@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Subject: RE: [PATCH for 8.0 v2] igb: Save the entire Tx context descriptor
Thread-Topic: [PATCH for 8.0 v2] igb: Save the entire Tx context descriptor
Thread-Index: AQHZWCA18E7Jk3u3gEOqTwZBvrajBq792KIQ
Date: Thu, 16 Mar 2023 20:27:36 +0000
Message-ID: <DBBP189MB1433F6AD96242F323CFEA36B95BC9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230316155707.27007-1-akihiko.odaki@daynix.com>
In-Reply-To: <20230316155707.27007-1-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DU0P189MB2042:EE_
x-ms-office365-filtering-correlation-id: eebf8d44-400a-4e92-a324-08db265ce1b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b8oD/sT/jfeBtwaIJbENHCgaO2qjR1xR7qoocffwHtPcKM+K7AOJ/u7dPBKUprOc3xtAy9BggFOE0g3vvINfPC/MKfcgChM6bhP/jEQLPvZRbN7h5k232oKERLcI/8MXbQlSj8lIKulvaFS4H3i4shiUrUjyXoRpgAy+GFf37cZyUWhY0U1RYu/2KmBH8RKr6AfLZAZkYE9UbCGRab2ZQ4Ka54Y52TT1KuIzhQdxtD+MMucnNk7zlKhFRW2/o5e903hSCbIHzesUeZjzTNiI5phsXMOd4XJ9m+VEvyKBtIAA+sxsZUyfVSW9W9JyL97+zjGCHiVuikBiyhVM8lI/WJCex8R613Kndd6ceke2d+L582Eis0Xo1JrOTOJvoe122DkqgpdxGJTE4XlsrI/KvanVbwodwb7dVNd2/QO7C4FQogSfd0SswUh7Ru30Pb5ayjwF0TnuhH+/KfAKBaS6Q9dbdub6FIDX7uY2AW5hPrzDfPIjpzqksXV+PVJW66XbkfZHJrvOxiuu9qG1s6YapP6L+TqvS37r43Slr8mJzghsZIRJGxQyXKAMG/lOG9JqOZlAqdT/qKiA0/4EGZX9mjP/2Vdy7JPBFUX59e8JCxC4tLmnbamNSfmK26q2rVCr9X7JRIHvIW4e1IvnTSL3iPKjToGspnLZ729vzaEEuy6RxyqfuT+zYHiq6BXKAZDI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(396003)(366004)(39840400004)(376002)(451199018)(38070700005)(86362001)(122000001)(33656002)(44832011)(5660300002)(41300700001)(52536014)(8936002)(2906002)(55016003)(9686003)(6506007)(4326008)(186003)(38100700002)(54906003)(316002)(83380400001)(71200400001)(966005)(66446008)(66556008)(64756008)(66476007)(6916009)(478600001)(66946007)(7696005)(76116006)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2NubDA2TkVJUWk2bE1uU3prYnFXYmRNdytNdjNmaTFiY3ZuWTh4MzMrU05F?=
 =?utf-8?B?cGxQMFp3a2s5a1ZjaU9zbzFyVjVmVUZrc28wTXNIZmhvS3VYeVpCdDA5bVd4?=
 =?utf-8?B?cnJ2MWYzT01tTTRERkludGpqMHBTbXhDb001c1VEbEkvQW9HNG9IUER0WTZr?=
 =?utf-8?B?dnJRSGdDbGtIaW1QOTA1amtrNno2aTM3dkRaeE5KR1lwblZtMVpCMkc1MHpj?=
 =?utf-8?B?WmtheVBBNlVRRmdDc084c0tMMUJYVFl2dmxueStjRTJqVzZ0cEE5ZWdpVmY5?=
 =?utf-8?B?bUZqTnFnV3oyNFVSM0VqZDhYd0srQUNBWlJPeUNYOHRMTTFHSERXaG4yZTZn?=
 =?utf-8?B?M0tKcFNISExjWTZBeUdYNzAybHg2VkIzWkpZbHRkVklHSU9zaE1ZbXJoc1FQ?=
 =?utf-8?B?WHZNMmcxMXdoVUlCOEY1bGFZd0VZSlhJaGNJMmFXd3U2WVNLTEd6QmhjNWQ0?=
 =?utf-8?B?cW81WWlTWHRCNEc4R29UQzA2M1Qxcy9IVXllalFzYTVsbnFMSnRXbE5RNUhC?=
 =?utf-8?B?eFBSU0FROHpKRUNsT1FuZnFYeDZSM0ZmTG9jSVZ3YncrQ2J6OElHZXljdGJV?=
 =?utf-8?B?c1ljTS8yWWNVZExob1BQdlM1ZlYyMXhNb1pSRkhSZHllTHE2RlBrKzFadDNn?=
 =?utf-8?B?Z21rQXNGMHZpNDA5L3JyMmpDSUo4MDhYT29oU1dkUi9zZVoxMjE0eGxNZDNh?=
 =?utf-8?B?ZDdpdFZ5VldoWWRmcm9obmZwMEpEZWlIM0JrSXJraklCVVU0OWJoVTNSSGZW?=
 =?utf-8?B?a0RzY2EwcExQOXQ2czQrTWpjQ0FMSSsvQms5aWEzTHZLSjRvQ01nNnpaWnYr?=
 =?utf-8?B?ZXI0Z0tGSVN2ZmNjVVFaYUVBand1YWtCckNHRm0yTHZ6UXFPVXZCMit5dVRK?=
 =?utf-8?B?a3VyQ0VVNnJLWmxLWVI3ejUwV0VvSGRSK0Z1MUJqdmNvRk8rdFVZZVMyR3Uw?=
 =?utf-8?B?VUE4czNSVkVPWm9yZ3lTaWhGZFYvS0wycjdBWHhyN1hpMkR3Z1BNUDVoNWRr?=
 =?utf-8?B?bnhTL0RVUDRaY1JmVnZxMytLMDRlVGNYQU01N3pDQ2NBa0gyN1lSVnVvTzR5?=
 =?utf-8?B?TElCOWRNY01aK1pSanowTEJ3NWhpWUdiMGxzZit4K1RWVFZFV0oyZ3FYbWNl?=
 =?utf-8?B?dDJOREtHV3EyRGx0aTRKYlErR0M1WElqVE5jaVRJakJDQVRna2JHcE83Vnh6?=
 =?utf-8?B?clJGZHBsQ2M1NGJQS2hrOTFNYWNZWU1sUEdWeXZENGRCak9oZUVveXU2cmF3?=
 =?utf-8?B?MkhtNHpGYkNwTFJwQ3c4OXMraDF6aWlCWTJsNWJveHRWOWFCdisyNkJXazJ2?=
 =?utf-8?B?d0FRbzE2QTRTNUxZQ1Z6b2I3ZVoyN3YxemIzN2FwdlNORElDUjA4MkxGU2tt?=
 =?utf-8?B?VlRhbDZPTHVCWEt5S0tsLzJRMHd1L0xWbm9zb080U0RkM3VJcG9BWDM1RElU?=
 =?utf-8?B?SjRqTUZDMDJCeDJpUkIzUkNraXU3OVl3Q2JyQ2Vpa29LQTdoMUtMVVF3MGlN?=
 =?utf-8?B?cW4xUk5vZTZ2R1Q2OXAzRTlDNTRMNXplRnBCdU5VU1ZYelFUK1M4bFhrc1gw?=
 =?utf-8?B?dllhMFVtWmNyck91RDFEMHM2aU5KQUJETndBNHA3S25TNjV3dmR6QjFtZEdR?=
 =?utf-8?B?QXNTQmZ3YVdKUFZ3UUIwNTBQNkNyZmVVWUhQK0s2b0wzWUYxcmhvRzJXeGVz?=
 =?utf-8?B?c0JBWWFjWjN3ZGJCc1k1MnA4bk5GZG5PbloyTjc4d1E3U2IzTXpBbTR2czY5?=
 =?utf-8?B?bi9UdmZqN2N5YzA5UU9hQTloSVhlUDdWUUNIWkdmNVprTVBqQmxxQUsvdGVQ?=
 =?utf-8?B?bktKcXg4R1VndHorMmZRN0ZzSGl2R2N4N24zdWFXRFlWNjRCaTZhZFhJdXFm?=
 =?utf-8?B?NkNMd1gyakNkZTFaZXVEcmtrWWVvbjB2TFl2a3NZWGg3bUdOekw5RjI0Y0g3?=
 =?utf-8?B?cFA0RzU2SDhwKzRFSHFNYXBBQmlYdW1YdWFTMkJUYTJrZDYrT3JFYjdKUW84?=
 =?utf-8?B?SVFWVElyYUxNVmRvUlhEZXFzamFQdEdpc05WL0o5M1Y5UmdTN2FzMTZvWW5K?=
 =?utf-8?B?TkM1Z01PWXN4bUNiQmNoVFAyc0lyZ1NCb0NkRU5SWXVBQUpCSUIzRzFLTCtU?=
 =?utf-8?B?SUpSdmIxbklOOXlEbWphMWRjZ29hRU82R0xzNjZVL1Mrdi9DNDlOLys2SzIy?=
 =?utf-8?B?cHA1YVEvZXJuQnFHSk1Mak5EcFEzcldHRHNlNXNtU1hTN1V6WVpScWE1Ym41?=
 =?utf-8?B?OVN3aVhIWVBrMWlHeGRWenA1a05RPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: eebf8d44-400a-4e92-a324-08db265ce1b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 20:27:36.8197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SzNopu6XmjF3mOE0SkdO/2mjno26gbH4fsJMtTuk9xF8VvA1IZkOIo1qcFXuAlh4AlbdqfIWkzB10HYNkJHw3Ad6WL9uFXMP0e+KolbrSQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2042
Received-SPF: pass client-ip=40.107.105.131;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IHFlbXUtZGV2ZWwtYm91bmNl
cytzcmlyYW0ueWFnbmFyYW1hbj1lc3QudGVjaEBub25nbnUub3JnDQo+IDxxZW11LWRldmVsLWJv
dW5jZXMrc3JpcmFtLnlhZ25hcmFtYW49ZXN0LnRlY2hAbm9uZ251Lm9yZz4gT24gQmVoYWxmDQo+
IE9mIEFraWhpa28gT2Rha2kNCj4gU2VudDogVGh1cnNkYXksIDE2IE1hcmNoIDIwMjMgMTY6NTcN
Cj4gQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0
LmNvbT47IERtaXRyeQ0KPiBGbGV5dG1hbiA8ZG1pdHJ5LmZsZXl0bWFuQGdtYWlsLmNvbT47IHF1
aW50ZWxhQHJlZGhhdC5jb207IFBoaWxpcHBlDQo+IE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGlu
YXJvLm9yZz47IEFraWhpa28gT2Rha2kNCj4gPGFraWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4g
U3ViamVjdDogW1BBVENIIGZvciA4LjAgdjJdIGlnYjogU2F2ZSB0aGUgZW50aXJlIFR4IGNvbnRl
eHQgZGVzY3JpcHRvcg0KPiANCj4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgaWdiIHVz
ZXMgb25seSBwYXJ0IG9mIGEgYWR2YW5jZWQgVHggY29udGV4dA0KPiBkZXNjcmlwdG9yIGJlY2F1
c2UgaXQgbWlzc2VzIHNvbWUgZmVhdHVyZXMgYW5kIHNuaWZmcyB0aGUgdHJhaXQgb2YgdGhlIHBh
Y2tldA0KPiBpbnN0ZWFkIG9mIHJlc3BlY3RpbmcgdGhlIHBhY2tldCB0eXBlIHNwZWNpZmllZCBp
biB0aGUgZGVzY3JpcHRvci4gSG93ZXZlciwgd2UNCj4gd2lsbCBjZXJ0YWlubHkgbmVlZCB0aGUg
ZW50aXJlIFR4IGNvbnRleHQgZGVzY3JpcHRvciB3aGVuIHdlIHVwZGF0ZSBpZ2IgdG8NCj4gcmVz
cGVjdCB0aGVzZSBpZ25vcmVkIGZpZWxkcy4gU2F2ZSB0aGUgZW50aXJlIFR4IGNvbnRleHQgZGVz
Y3JpcHRvciB0byBwcmVwYXJlDQo+IGZvciBzdWNoIGEgY2hhbmdlLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogQWtpaGlrbyBPZGFraSA8YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0KPiAtLS0NCj4g
VjEgLT4gVjI6IEJ1bXAgaWdiLXR4IHZlcnNpb24NCj4gDQo+ICBody9uZXQvaWdiLmMgICAgICB8
IDEwICsrKysrKy0tLS0NCj4gIGh3L25ldC9pZ2JfY29yZS5jIHwgMTcgKysrKysrKysrKy0tLS0t
LS0gIGh3L25ldC9pZ2JfY29yZS5oIHwgIDMgKy0tDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE3IGlu
c2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L25ldC9p
Z2IuYyBiL2h3L25ldC9pZ2IuYyBpbmRleCBjNmQ3NTNkZjg3Li5mOWVjODJmYzI4IDEwMDY0NA0K
PiAtLS0gYS9ody9uZXQvaWdiLmMNCj4gKysrIGIvaHcvbmV0L2lnYi5jDQo+IEBAIC01MDQsMTEg
KzUwNCwxMyBAQCBzdGF0aWMgaW50IGlnYl9wb3N0X2xvYWQodm9pZCAqb3BhcXVlLCBpbnQNCj4g
dmVyc2lvbl9pZCkNCj4gDQo+ICBzdGF0aWMgY29uc3QgVk1TdGF0ZURlc2NyaXB0aW9uIGlnYl92
bXN0YXRlX3R4ID0gew0KPiAgICAgIC5uYW1lID0gImlnYi10eCIsDQo+IC0gICAgLnZlcnNpb25f
aWQgPSAxLA0KPiAtICAgIC5taW5pbXVtX3ZlcnNpb25faWQgPSAxLA0KPiArICAgIC52ZXJzaW9u
X2lkID0gMiwNCj4gKyAgICAubWluaW11bV92ZXJzaW9uX2lkID0gMiwNCj4gICAgICAuZmllbGRz
ID0gKFZNU3RhdGVGaWVsZFtdKSB7DQo+IC0gICAgICAgIFZNU1RBVEVfVUlOVDE2KHZsYW4sIHN0
cnVjdCBpZ2JfdHgpLA0KPiAtICAgICAgICBWTVNUQVRFX1VJTlQxNihtc3MsIHN0cnVjdCBpZ2Jf
dHgpLA0KPiArICAgICAgICBWTVNUQVRFX1VJTlQzMihjdHgudmxhbl9tYWNpcF9sZW5zLCBzdHJ1
Y3QgaWdiX3R4KSwNCj4gKyAgICAgICAgVk1TVEFURV9VSU5UMzIoY3R4LnNlcW51bV9zZWVkLCBz
dHJ1Y3QgaWdiX3R4KSwNCj4gKyAgICAgICAgVk1TVEFURV9VSU5UMzIoY3R4LnR5cGVfdHVjbWRf
bWxobCwgc3RydWN0IGlnYl90eCksDQo+ICsgICAgICAgIFZNU1RBVEVfVUlOVDMyKGN0eC5tc3Nf
bDRsZW5faWR4LCBzdHJ1Y3QgaWdiX3R4KSwNCj4gICAgICAgICAgVk1TVEFURV9CT09MKHRzZSwg
c3RydWN0IGlnYl90eCksDQo+ICAgICAgICAgIFZNU1RBVEVfQk9PTChpeHNtLCBzdHJ1Y3QgaWdi
X3R4KSwNCj4gICAgICAgICAgVk1TVEFURV9CT09MKHR4c20sIHN0cnVjdCBpZ2JfdHgpLCBkaWZm
IC0tZ2l0IGEvaHcvbmV0L2lnYl9jb3JlLmMNCj4gYi9ody9uZXQvaWdiX2NvcmUuYyBpbmRleCBh
N2M3YmZkYzc1Li4zMDRmNWQ4NDlmIDEwMDY0NA0KPiAtLS0gYS9ody9uZXQvaWdiX2NvcmUuYw0K
PiArKysgYi9ody9uZXQvaWdiX2NvcmUuYw0KPiBAQCAtMzkwLDcgKzM5MCw4IEBAIHN0YXRpYyBi
b29sDQo+ICBpZ2Jfc2V0dXBfdHhfb2ZmbG9hZHMoSUdCQ29yZSAqY29yZSwgc3RydWN0IGlnYl90
eCAqdHgpICB7DQo+ICAgICAgaWYgKHR4LT50c2UpIHsNCj4gLSAgICAgICAgaWYgKCFuZXRfdHhf
cGt0X2J1aWxkX3ZoZWFkZXIodHgtPnR4X3BrdCwgdHJ1ZSwgdHJ1ZSwgdHgtPm1zcykpIHsNCj4g
KyAgICAgICAgdWludDMyX3QgbXNzID0gdHgtPmN0eC5tc3NfbDRsZW5faWR4ID4+IDE2Ow0KPiAr
ICAgICAgICBpZiAoIW5ldF90eF9wa3RfYnVpbGRfdmhlYWRlcih0eC0+dHhfcGt0LCB0cnVlLCB0
cnVlLCBtc3MpKSB7DQo+ICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+ICAgICAgICAgIH0N
Cj4gDQo+IEBAIC01NTAsOCArNTUxLDEwIEBAIGlnYl9wcm9jZXNzX3R4X2Rlc2MoSUdCQ29yZSAq
Y29yZSwNCj4gICAgICAgICAgICAgICAgICAgICBFMTAwMF9BRFZUWERfRFRZUF9DVFhUKSB7DQo+
ICAgICAgICAgICAgICAvKiBhZHZhbmNlZCB0cmFuc21pdCBjb250ZXh0IGRlc2NyaXB0b3IgKi8N
Cj4gICAgICAgICAgICAgIHR4X2N0eF9kZXNjID0gKHN0cnVjdCBlMTAwMF9hZHZfdHhfY29udGV4
dF9kZXNjICopdHhfZGVzYzsNCj4gLSAgICAgICAgICAgIHR4LT52bGFuID0gbGUzMl90b19jcHUo
dHhfY3R4X2Rlc2MtPnZsYW5fbWFjaXBfbGVucykgPj4gMTY7DQo+IC0gICAgICAgICAgICB0eC0+
bXNzID0gbGUzMl90b19jcHUodHhfY3R4X2Rlc2MtPm1zc19sNGxlbl9pZHgpID4+IDE2Ow0KPiAr
ICAgICAgICAgICAgdHgtPmN0eC52bGFuX21hY2lwX2xlbnMgPSBsZTMyX3RvX2NwdSh0eF9jdHhf
ZGVzYy0+dmxhbl9tYWNpcF9sZW5zKTsNCj4gKyAgICAgICAgICAgIHR4LT5jdHguc2VxbnVtX3Nl
ZWQgPSBsZTMyX3RvX2NwdSh0eF9jdHhfZGVzYy0+c2VxbnVtX3NlZWQpOw0KPiArICAgICAgICAg
ICAgdHgtPmN0eC50eXBlX3R1Y21kX21saGwgPSBsZTMyX3RvX2NwdSh0eF9jdHhfZGVzYy0NCj4g
PnR5cGVfdHVjbWRfbWxobCk7DQo+ICsgICAgICAgICAgICB0eC0+Y3R4Lm1zc19sNGxlbl9pZHgg
PQ0KPiArIGxlMzJfdG9fY3B1KHR4X2N0eF9kZXNjLT5tc3NfbDRsZW5faWR4KTsNCg0KV291bGRu
J3QgaXQgYmUgYmV0dGVyIHRvIHBhcnNlIHRoZSBjb250ZXh0IGludG8gYWxsIHRoZSByZXF1aXJl
ZCBmaWVsZHMgbGlrZSB2bGFuLCBtc3MsIGV0Yy4sIGFscmVhZHkgd2hlbiBoYW5kbGluZyB0aGUg
Y29udGV4dCBkZXNjcmlwdG9yLCBpbnN0ZWFkIG9mIHBhcnNpbmcgaXQgZm9yIGV2ZXJ5IGRhdGEg
ZGVzY3JpcHRvciBsYXRlcj8NCkFsc28sIGluIG15IHlldCB0byBiZSBtZXJnZWQgcGF0Y2ggWzFd
IHdoaWNoIGhhbmRsZXMgVkxBTiBpbnNlcnRpb24gZm9yIFZNRHEgSSB1c2UgdGhlIHZsYW4gZmll
bGQgaW4gbXVsdGlwbGUgcGxhY2VzLCBzbyBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaGF2ZSB0aGUg
dmxhbiB2YWx1ZSByZWFkaWx5IGF2YWlsYWJsZS4gDQpbMV06IGh0dHBzOi8vbGlzdHMuZ251Lm9y
Zy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDIzLTAyL21zZzAwMzkzLmh0bWwNCg0KPiAgICAg
ICAgICAgICAgcmV0dXJuOw0KPiAgICAgICAgICB9IGVsc2Ugew0KPiAgICAgICAgICAgICAgLyog
dW5rbm93biBkZXNjcmlwdG9yIHR5cGUgKi8gQEAgLTU3NSw4ICs1NzgsOSBAQA0KPiBpZ2JfcHJv
Y2Vzc190eF9kZXNjKElHQkNvcmUgKmNvcmUsDQo+ICAgICAgaWYgKGNtZF90eXBlX2xlbiAmIEUx
MDAwX1RYRF9DTURfRU9QKSB7DQo+ICAgICAgICAgIGlmICghdHgtPnNraXBfY3AgJiYgbmV0X3R4
X3BrdF9wYXJzZSh0eC0+dHhfcGt0KSkgew0KPiAgICAgICAgICAgICAgaWYgKGNtZF90eXBlX2xl
biAmIEUxMDAwX1RYRF9DTURfVkxFKSB7DQo+IC0gICAgICAgICAgICAgICAgbmV0X3R4X3BrdF9z
ZXR1cF92bGFuX2hlYWRlcl9leCh0eC0+dHhfcGt0LCB0eC0+dmxhbiwNCj4gLSAgICAgICAgICAg
ICAgICAgICAgY29yZS0+bWFjW1ZFVF0gJiAweGZmZmYpOw0KPiArICAgICAgICAgICAgICAgIHVp
bnQxNl90IHZsYW4gPSB0eC0+Y3R4LnZsYW5fbWFjaXBfbGVucyA+PiAxNjsNCj4gKyAgICAgICAg
ICAgICAgICB1aW50MTZfdCB2ZXQgPSBjb3JlLT5tYWNbVkVUXSAmIDB4ZmZmZjsNCj4gKyAgICAg
ICAgICAgICAgICBuZXRfdHhfcGt0X3NldHVwX3ZsYW5faGVhZGVyX2V4KHR4LT50eF9wa3QsIHZs
YW4sIHZldCk7DQo+ICAgICAgICAgICAgICB9DQo+ICAgICAgICAgICAgICBpZiAoaWdiX3R4X3Br
dF9zZW5kKGNvcmUsIHR4LCBxdWV1ZV9pbmRleCkpIHsNCj4gICAgICAgICAgICAgICAgICBpZ2Jf
b25fdHhfZG9uZV91cGRhdGVfc3RhdHMoY29yZSwgdHgtPnR4X3BrdCk7IEBAIC00MDI0LDgNCj4g
KzQwMjgsNyBAQCBzdGF0aWMgdm9pZCBpZ2JfcmVzZXQoSUdCQ29yZSAqY29yZSwgYm9vbCBzdykN
Cj4gICAgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShjb3JlLT50eCk7IGkrKykgew0KPiAg
ICAgICAgICB0eCA9ICZjb3JlLT50eFtpXTsNCj4gICAgICAgICAgbmV0X3R4X3BrdF9yZXNldCh0
eC0+dHhfcGt0KTsNCj4gLSAgICAgICAgdHgtPnZsYW4gPSAwOw0KPiAtICAgICAgICB0eC0+bXNz
ID0gMDsNCj4gKyAgICAgICAgbWVtc2V0KCZ0eC0+Y3R4LCAwLCBzaXplb2YodHgtPmN0eCkpOw0K
PiAgICAgICAgICB0eC0+dHNlID0gZmFsc2U7DQo+ICAgICAgICAgIHR4LT5peHNtID0gZmFsc2U7
DQo+ICAgICAgICAgIHR4LT50eHNtID0gZmFsc2U7DQo+IGRpZmYgLS1naXQgYS9ody9uZXQvaWdi
X2NvcmUuaCBiL2h3L25ldC9pZ2JfY29yZS5oIGluZGV4DQo+IDgxNGMxZTI2NGIuLjM0ODNlZGM2
NTUgMTAwNjQ0DQo+IC0tLSBhL2h3L25ldC9pZ2JfY29yZS5oDQo+ICsrKyBiL2h3L25ldC9pZ2Jf
Y29yZS5oDQo+IEBAIC03Miw4ICs3Miw3IEBAIHN0cnVjdCBJR0JDb3JlIHsNCj4gICAgICBRRU1V
VGltZXIgKmF1dG9uZWdfdGltZXI7DQo+IA0KPiAgICAgIHN0cnVjdCBpZ2JfdHggew0KPiAtICAg
ICAgICB1aW50MTZfdCB2bGFuOyAgLyogVkxBTiBUYWcgKi8NCj4gLSAgICAgICAgdWludDE2X3Qg
bXNzOyAgIC8qIE1heGltdW0gU2VnbWVudCBTaXplICovDQo+ICsgICAgICAgIHN0cnVjdCBlMTAw
MF9hZHZfdHhfY29udGV4dF9kZXNjIGN0eDsNCj4gICAgICAgICAgYm9vbCB0c2U7ICAgICAgIC8q
IFRDUC9VRFAgU2VnbWVudGF0aW9uIEVuYWJsZSAqLw0KPiAgICAgICAgICBib29sIGl4c207ICAg
ICAgLyogSW5zZXJ0IElQIENoZWNrc3VtICovDQo+ICAgICAgICAgIGJvb2wgdHhzbTsgICAgICAv
KiBJbnNlcnQgVENQL1VEUCBDaGVja3N1bSAqLw0KPiAtLQ0KPiAyLjM5LjINCj4gDQoNCg==

