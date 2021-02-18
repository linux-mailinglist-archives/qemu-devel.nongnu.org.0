Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB4A31EEC4
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 19:49:10 +0100 (CET)
Received: from localhost ([::1]:56456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCoMO-0004Lh-SR
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 13:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Sandstrom@axis.com>)
 id 1lCoLG-0003vH-Eu
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 13:47:58 -0500
Received: from smtp1.axis.com ([195.60.68.17]:4610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Sandstrom@axis.com>)
 id 1lCoLD-0002TP-OR
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 13:47:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1613674075;
 x=1645210075; h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5vJuWMfNIpfFWVVrvF/qk/J5RRVIprAEZAQwkoUuMns=;
 b=BXM64dXEwx4fQZKayVVViAxM9f1lpZ+9LPSq8a5L/WjdDTUZnd4eZqS8
 EyvEXFGRt/moeTnDfcqxfU8aW7lS4AkRooshKxEgminDrPl37l6Aavp51
 eSI+TcAjtg4stGIINg8VXg6fEDMBAierO64Re9jGu58d3uuDucmqOHrlI
 Uaa7ow7zTJXw/qDiaBxffnDdmG69GvS8r/8RriVL//WUXP60BuiKYLvLG
 lUHMPWV7flqGv3MSwE4veSnaZ7FKAXaGfn+vaPU3rv4mZa3rGCMG33rmk
 TDxtWzr9Kp0UjERbuesKQeQThYryhIYcXMsS2ZJW//0mQp5fc0x0geJ9c g==;
From: =?utf-8?B?U3RlZmFuIFNhbmRzdHLDtm0=?= <Stefan.Sandstrom@axis.com>
To: =?utf-8?B?U3RlZmFuIFNhbmRzdHLDtm0=?= <Stefan.Sandstrom@axis.com>
Subject: Re: [PATCH v2] Correct CRIS TCG register lifetime management
Thread-Topic: [PATCH v2] Correct CRIS TCG register lifetime management
Thread-Index: AQHXBiXsaEPzzLR6yUiER3hr5a8RBqpeMBAA
Date: Thu, 18 Feb 2021 18:47:53 +0000
Message-ID: <1E42B894-8A30-4B2A-ACF7-2A5643CE0778@axis.com>
References: <20210218184302.34984-1-stefans@axis.com>
In-Reply-To: <20210218184302.34984-1-stefans@axis.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.40.0.2.32)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CBB96C4D527BD49A206F810490A80CD@exhub.se.axis.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=195.60.68.17;
 envelope-from=Stefan.Sandstrom@axis.com; helo=smtp1.axis.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "open list:All patches CC
 here" <qemu-devel@nongnu.org>, "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGksDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrISAgSSd2ZSBwb3N0ZWQgYSBuZXcgcGF0Y2gg
d2hpY2ggc2hvdWxkIGFkZHJlc3MgdGhpcyBmZWVkYmFjay4NCkFuZCwgaXQgc2VlbXMgbGlrZSBJ
J3ZlIG1hbmFnZWQgdG8gZ2V0IHRoZSBwYXRjaCBtYWlsaW5nIHJpZ2h0IGF0IGxhc3QuDQoNClRo
YW5rcywNCi1zdGVmYW4NCg0KPiBPbiAxOCBGZWIgMjAyMSwgYXQgMTk6NDMsIFN0ZWZhbiBTYW5k
c3Ryw7ZtIDxTdGVmYW4uU2FuZHN0cm9tQGF4aXMuY29tPiB3cm90ZToNCj4gDQo+IEZyb206IFN0
ZWZhbiBTYW5kc3Ryb20gPHN0ZWZhbnNAYXhpcy5jb20+DQo+IA0KPiBBZGQgYW5kIGZpeCBkZWFs
bG9jYXRpb24gb2YgdGVtcG9yYXJ5IFRDRyByZWdpc3RlcnMgaW4gQ1JJUyBjb2RlDQo+IGdlbmVy
YXRpb24uDQo+IA0KDQo=

