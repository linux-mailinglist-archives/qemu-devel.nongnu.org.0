Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B246E3346
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 21:10:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnlGi-0000WB-J1; Sat, 15 Apr 2023 15:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnlGg-0000W1-Ay
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 15:09:02 -0400
Received: from mail-db5eur02on20727.outbound.protection.outlook.com
 ([2a01:111:f400:fe12::727]
 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnlGe-0007N3-Ph
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 15:09:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdntxVkB5ikEcBFzzTQK83GIgX5PsmteDXWAfS7MAvV4KOCbQ6RoAWUYBTEXGk/zGwhlI/uLormHANF7JtB6cfDn0HQKCcy6bPv11yf7TdhBfIuKjHoCMss5tiq1GEYiLsd0Ky0feGrod6TAycaRf6eX9bjbdDJFqCZ/sDr5gcIsQxrwtUkAUgLP8Lq95TDxtWHw7O0E/iDFVRDJHe7ehaqqppznMeKBoHlh5mh/z2R9fe3z8GxtjPZSBz2XYczD3NXfIzKntKdtZ+jZS6YXyfU4P/ymNlxvIdT6WLOqbqGCKD5FMB6J94NmZBD+WJ6v3nu3p3GcIfghF/sb7Ab1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlMvTpuknblkXFjS2HYX0hmyKOnE2MYgaoqtT5PM4QI=;
 b=JogaBdUi9+roux5WufNqAOzFb/rUcfzMBxfJlwDKTEXDb+7ZPf/z/zqIpnHRz0TZjCgvgRXuBeMLfPN1hNW5zQ4KyIP7eE0wHR3XcBx3/YYEzniBLBXSBEhNeEMaT4sAKwBMGk8Q+sgx/aykqMlZ6EYKCvjIMUdLvy6SRN8r+LLGQmY9x3lD1j3CcHqO2TiELtga+CvRe/hUdWtD0Uggn9TA6J4kbrHN7CISZdH/3B5oJfsqcu7QccevCqL+y76+TrJjiyrSoegM5ptuWbJ0xmIWsZPQX/unzBFfEreRVHEwQMXSTe8ZUFGqSaubV3ZvrozvpLzXlgGG3vf+dmRTvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlMvTpuknblkXFjS2HYX0hmyKOnE2MYgaoqtT5PM4QI=;
 b=HtgM3suKMOVjriMhP9vYDC4GaGoFR5O3Idroe94H9VMlg15mRA6YuTA1XwQ9yffTZknw8KZ/qA68duF6WKMOt+RFSnBRzs6XXatsxdJvKcs+9ZFUUxZeB2szOazb1D4Qo6iLptILs6QztgIs6Quq//+h4f8hSn9WRBfREvnUZe0=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2239.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Sat, 15 Apr
 2023 19:08:46 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6298.030; Sat, 15 Apr 2023
 19:08:46 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 19/40] igb: Read DCMD.VLE of the first Tx descriptor
Thread-Topic: [PATCH 19/40] igb: Read DCMD.VLE of the first Tx descriptor
Thread-Index: AQHZbsXBdhcVzkETzUa0ZdywNQ5a1q8svA1w
Date: Sat, 15 Apr 2023 19:08:46 +0000
Message-ID: <DBBP189MB1433FB6CC8249CB6AFC0C0BF959E9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-20-akihiko.odaki@daynix.com>
In-Reply-To: <20230414113737.62803-20-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB4P189MB2239:EE_
x-ms-office365-filtering-correlation-id: dd11041c-87b7-42d6-c1dd-08db3de4d66f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XZ5sx1IaH8gHSMQurnNPBxi2+gR3qnKJqHEKy8ednPYdRx39b7wtloKLd3yD+kh2B5I2B4iCF69qsyEPcYvUJRdyJPYQOfc2KHhtoasU7fdantrUSzHm/gUbrDeBPWqzYHBQ05dQhEL9upBl3fik06QkkSbDBdcmmFClVDv38vsvbrifBzXyh3AF7DVYs+I6VyySmNKL+bmQaLHY0H9OUFkotU8DDx/WY18KXwxPk9JFZ4BvSCj6F5XyP7tl+uueBkrLqzzp5ejh5HET2nFV3dfHfrJsqIivNBwehdBS8P90MK1I6UYKoEeKqi7fCzRnlX4G4NjWsIniOPisVT8T/XVWzcZGjCwITMpIBCdfKJEZASh0rVyGvl+nZ6bc/dKZCc2c5NjihMHZnluwnjZCq5Bh79swsMzGh1hl3HFfhgf3Toz4p4/5hrIzKLKy/SyUZCZAIUVZAhlSZtLFHbdcahDD2XlKLfmaO9JuOY3KQNMwj19cqcOyVkLwIqLsSjXVC4jyRHKYdVZw1L7V9+8izJkgsvBVu6GdJh5MVaDy5HANd5MMNEAF3IGCjStLAiTRbQpBwFUQtRIw2PIRm7WAoa7vrlejWkh0Nhd4xqvssoBG+X34ha2nTobyHJ+iiTJ3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(39830400003)(376002)(366004)(136003)(346002)(396003)(451199021)(55016003)(71200400001)(7696005)(38070700005)(2906002)(33656002)(26005)(6506007)(9686003)(86362001)(122000001)(54906003)(8676002)(6916009)(4326008)(41300700001)(66446008)(316002)(64756008)(76116006)(66946007)(66556008)(66476007)(38100700002)(5660300002)(44832011)(7416002)(478600001)(8936002)(52536014)(186003)(66574015)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXh4SVVIaUV0bWNFOU5zRVNBcURxaHpaK0ZMczNKd1gzd0kwdzJYdWVGM1F6?=
 =?utf-8?B?RW1pY2xGM1lNZFJ3SGhOS3ppaCtwOEtmOFNDaDNmczBIWXg2aW1WZjh1NWRj?=
 =?utf-8?B?b0xZbUlvYnpBZGs4ZGpTZUVWSzdkUFhCb0l4VU1KNDZzYXI3NktjeS9nU1Yw?=
 =?utf-8?B?cUF5S0RqRnJaSU8wbkxRRENxU21vcjR6Z0k0ZEdZTUFibVJ5WUppNndiOWlI?=
 =?utf-8?B?VXp4TTNsaHI3Y1VRRGJDVVB0WmgwNGI0akY4UXdvN2loZkdOSmpXMmVYSUJ3?=
 =?utf-8?B?YVpua3RiODRydkIvK0pLS3dxMnB0NGxwc2tDN3E4ZzVzYUEyK2NNQ2oyaitn?=
 =?utf-8?B?M3dwVEV6SWhMMVNlSWhUdDJqRnhQcEhoYnlBU25ta0VXbkxsZWVFUlNkcURh?=
 =?utf-8?B?ZHpieEw2blhTWTNtTHBLWTA5eXIxRTJYZHlvaXNLNWpaSWwzS1RaNDdnTVNu?=
 =?utf-8?B?Z0pOTzk1dXdhaVRScGFTcTdGZ0VPelZ6ZW5hYlFpN0h6a0k0cnFrcEpkcGJ1?=
 =?utf-8?B?R0RHTjdIZm9GTlBLZGlSKzl1Y3FFQWJFN3BBdndMb0lFMC9PYXJoVVZFaG8v?=
 =?utf-8?B?NXNxdDB5YXRkM1ZxTXA1M3hqVjBaclkrM2pOQWxyeWpUMmZKS0ZnOWg5ZnU1?=
 =?utf-8?B?ZVJ5SnkwZ2o3SnIzbmVTZUlFRnljQ3owR3FJdk8wQnR6VXZIcDBYbk5rYXF1?=
 =?utf-8?B?am41RWYwY0Rwakw0QXFrc3lVZ24vbkNrc2NsbGFBODduWFhRSHVWVlU5NUNV?=
 =?utf-8?B?bnk1YTVFL1ZkeWw4S0d1MWYzMHdqLzdPOVdEZ1VmMzE2VzJuWWJXLzVOcWhp?=
 =?utf-8?B?MWNqMEQ4cUUwOFZSSVB3cWtReVBYVW9LcTFMWS9CK1FqZG9GczI4REVudlNM?=
 =?utf-8?B?MHZPcTRvWmdPTGxQdVJLcXh3aTQ2aUwrendWWk5tcGUxbXp6UmY3cVZQUlEr?=
 =?utf-8?B?MHJRTVRtMk1GYW5GK0FpUEVzYWhhVWlTbyt0Z053MzBycWlsMXp0cXdtcWVX?=
 =?utf-8?B?QkpPclNvWkF5WXpIb1lrRzlFZmhSaWtBUk8wUUsvNFY4bDlLT3cyK2NZL0Jp?=
 =?utf-8?B?amdSRlhPODFlWGhtTldISUVMRnJxMEduc09DMWxHb3RVRW14dW5KU01EMnJp?=
 =?utf-8?B?eEE1YzVuYlJvZFZJdHBhUXMrMWpkdFFVNlRIdC9IZ2lid3hKQzQ1Ukd2cUJm?=
 =?utf-8?B?VWpJT1poSVpsNGVCNjYwa3hxUnp3YnpNMDR0MU5WRm5DcE9zMXBGc2NnZGty?=
 =?utf-8?B?TmZPTEY1SDZWQmtGd25hYm5MRlQxeGtkb1M2Y2o5ZFREY2RCeEZacGVIQit4?=
 =?utf-8?B?OUQvYjA0ZDZNeUxGRS9HSnY5eEFKMmdTS1NWNE9NTHVUR1pZMlVrUXg5THNL?=
 =?utf-8?B?dUkxbEp4Z3BtT2JkcEkwdFFQTU10UklBVFdIRThYME9BQXhjaFgvNDgvc3hG?=
 =?utf-8?B?aGhiNkpLUEhUTG5sd0NZMGZBVFJVNHQ3RW1XSVUyemx4azVpYUFiRjJ4TGVO?=
 =?utf-8?B?STdZQlNkV3duVjZFVmc5emVXQStQVkNMNjdnTnZ2UktoQjdrRVBFdVZKU01E?=
 =?utf-8?B?cnRiNUtGckFKVkZYa2dkNDcycE9CbU1ka1Rpd3JCWi9EMkU4QlpXcnFHR3Y1?=
 =?utf-8?B?VWJTcTRPLzBQdm5GVzFhU1E3QURBU3h6SEwyemlJZTZpNmxJSjcvVmNRKzNi?=
 =?utf-8?B?UkVRZTlWQzZ3cDBSZjBsZFpISjJHNXNFREpFQWxGMFZPSDZaZDZlUXBpd1FE?=
 =?utf-8?B?Y2NBTG54eHBPUzhOZEhKYWNjanliOUROb3lGNW53RGRlL2dUSldiSEgzSTht?=
 =?utf-8?B?TnBKTWEzOC9JeXJPVnhsZ0R3VFQrbDNEWU14eCtJUVcvU2c2ZnU1RU1Rcndy?=
 =?utf-8?B?RTNVdkZNSC82QklTcG41dnpTUDRHVkNJTmRuTHpiRThwc2RuSzlWekM0VkFF?=
 =?utf-8?B?R3prbUdIL09pcjBXbUdkMUgzYVZKYzFsQmdEcEczTjhUSWo5NnliM2tzYjRh?=
 =?utf-8?B?V2VrSm5jVEdzNStwUGJDYjhJNVVyOHZsUWw4M1ZOb3NMZkV3VzlzaGR1bXFY?=
 =?utf-8?B?OERwZHRCTzJIaGlCUy84ZzU4U1BUNE1XYnBwOWJnZ0dxUjZUdTUvNW1mUW1O?=
 =?utf-8?Q?eJ0o4uHnRRLf5qqjEuQUO2kcR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dd11041c-87b7-42d6-c1dd-08db3de4d66f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2023 19:08:46.1936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g3qB3ZoNOMh7CxlDCGu9SMwCH9euGhGOcJRYsh5WrBoU7p3TXo0nZ1+P2bK4/ktyJQMGoE2UzUP8G1HG7rELR1KT14PkD143Pl4FIiqHOY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2239
Received-SPF: pass client-ip=2a01:111:f400:fe12::727;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR02-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFraWhpa28gT2Rha2kgPGFr
aWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gU2VudDogRnJpZGF5LCAxNCBBcHJpbCAyMDIzIDEz
OjM3DQo+IENjOiBTcmlyYW0gWWFnbmFyYW1hbiA8c3JpcmFtLnlhZ25hcmFtYW5AZXN0LnRlY2g+
OyBKYXNvbiBXYW5nDQo+IDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsgRG1pdHJ5IEZsZXl0bWFuIDxk
bWl0cnkuZmxleXRtYW5AZ21haWwuY29tPjsNCj4gTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVk
aGF0LmNvbT47IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz47DQo+IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz47IFRob21hcyBIdXRoDQo+IDx0
aHV0aEByZWRoYXQuY29tPjsgV2FpbmVyIGRvcyBTYW50b3MgTW9zY2hldHRhDQo+IDx3YWluZXJz
bUByZWRoYXQuY29tPjsgQmVyYWxkbyBMZWFsIDxibGVhbEByZWRoYXQuY29tPjsgQ2xlYmVyIFJv
c2ENCj4gPGNyb3NhQHJlZGhhdC5jb20+OyBMYXVyZW50IFZpdmllciA8bHZpdmllckByZWRoYXQu
Y29tPjsgUGFvbG8gQm9uemluaQ0KPiA8cGJvbnppbmlAcmVkaGF0LmNvbT47IHFlbXUtZGV2ZWxA
bm9uZ251Lm9yZzsgQWtpaGlrbyBPZGFraQ0KPiA8YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0ggMTkvNDBdIGlnYjogUmVhZCBEQ01ELlZMRSBvZiB0aGUgZmlyc3Qg
VHggZGVzY3JpcHRvcg0KPiANCj4gU2VjdGlvbiA3LjIuMi4zIEFkdmFuY2VkIFRyYW5zbWl0IERh
dGEgRGVzY3JpcHRvciBzYXlzOg0KPiA+IEZvciBmcmFtZXMgdGhhdCBzcGFucyBtdWx0aXBsZSBk
ZXNjcmlwdG9ycywgYWxsIGZpZWxkcyBhcGFydCBmcm9tDQo+ID4gRENNRC5FT1AsIERDTUQuUlMs
IERDTUQuREVYVCwgRFRBTEVOLCBBZGRyZXNzIGFuZCBEVFlQIGFyZSB2YWxpZCBvbmx5DQo+ID4g
aW4gdGhlIGZpcnN0IGRlc2NyaXB0b3JzIGFuZCBhcmUgaWdub3JlZCBpbiB0aGUgc3Vic2VxdWVu
dCBvbmVzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWtpaGlrbyBPZGFraSA8YWtpaGlrby5vZGFr
aUBkYXluaXguY29tPg0KPiAtLS0NCj4gIGh3L25ldC9pZ2JfY29yZS5jIHwgMiArLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvaHcvbmV0L2lnYl9jb3JlLmMgYi9ody9uZXQvaWdiX2NvcmUuYyBpbmRleA0KPiBjY2E3
MTYxMWZlLi5lNWE3MDIxYzBlIDEwMDY0NA0KPiAtLS0gYS9ody9uZXQvaWdiX2NvcmUuYw0KPiAr
KysgYi9ody9uZXQvaWdiX2NvcmUuYw0KPiBAQCAtNjEzLDcgKzYxMyw3IEBAIGlnYl9wcm9jZXNz
X3R4X2Rlc2MoSUdCQ29yZSAqY29yZSwNCj4gICAgICAgICAgICAgIGlkeCA9ICh0eC0+Zmlyc3Rf
b2xpbmZvX3N0YXR1cyA+PiA0KSAmIDE7DQo+ICAgICAgICAgICAgICBpZ2JfdHhfaW5zZXJ0X3Zs
YW4oY29yZSwgcXVldWVfaW5kZXgsIHR4LA0KPiAgICAgICAgICAgICAgICAgIHR4LT5jdHhbaWR4
XS52bGFuX21hY2lwX2xlbnMgPj4gMTYsDQo+IC0gICAgICAgICAgICAgICAgISEoY21kX3R5cGVf
bGVuICYgRTEwMDBfVFhEX0NNRF9WTEUpKTsNCj4gKyAgICAgICAgICAgICAgICAhISh0eC0+Zmly
c3RfY21kX3R5cGVfbGVuICYgRTEwMDBfVFhEX0NNRF9WTEUpKTsNCj4gDQo+ICAgICAgICAgICAg
ICBpZiAoaWdiX3R4X3BrdF9zZW5kKGNvcmUsIHR4LCBxdWV1ZV9pbmRleCkpIHsNCj4gICAgICAg
ICAgICAgICAgICBpZ2Jfb25fdHhfZG9uZV91cGRhdGVfc3RhdHMoY29yZSwgdHgtPnR4X3BrdCwg
cXVldWVfaW5kZXgpOw0KPiAtLQ0KPiAyLjQwLjANCg0KUmV2aWV3ZWQtYnk6IFNyaXJhbSBZYWdu
YXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3QudGVjaD4NCg0K

