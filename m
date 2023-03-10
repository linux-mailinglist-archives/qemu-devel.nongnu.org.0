Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBEB6B50D5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:20:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paiGy-0006Ci-NO; Fri, 10 Mar 2023 14:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1paiGw-0006CW-QV
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:19:22 -0500
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1paiGu-0005So-Nw
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:19:22 -0500
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
 by mta-01.yadro.com (Proxmox) with ESMTP id 8AE78342112;
 Fri, 10 Mar 2023 22:19:12 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=mta-01; bh=I1rWCSfHJOHX1a+o5F
 FgNWTreXhRl0SvoqTlFmcBhVA=; b=pJWLGfjmeVABokuFQmYqKnqvfpyZE3KKyx
 ADRwjR7YCTOlbbsbRNXsPtEeo90FGzO9pJwHFquJofhhz8bjlyYmVE/Sd5DoO2Hx
 5e10fICgP9MsLuW/OTAe9j3xy7Il9E1pCpqsSpWyZvXuQMyQXMs3dRfQVui/KBXC
 RulXQN66Q=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Proxmox) with ESMTPS id 7CF413420EB;
 Fri, 10 Mar 2023 22:19:12 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-08.corp.yadro.com (172.17.11.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Fri, 10 Mar 2023 22:19:12 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Fri,
 10 Mar 2023 22:19:12 +0300
From: Mikhail Tyutin <m.tyutin@yadro.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, "erdnaxe@crans.org" <erdnaxe@crans.org>,
 "ma.mandourr@gmail.com" <ma.mandourr@gmail.com>
Subject: RE: [PATCH v2] TCG plugin API extension to read guest memory content
 by an address
Thread-Topic: [PATCH v2] TCG plugin API extension to read guest memory content
 by an address
Thread-Index: AdlFGzFjtCgLNbPNTzSXOtdOOq1PfAIq/8CAAJ/uHlD//+PYgP/5aCTQ
Date: Fri, 10 Mar 2023 19:19:12 +0000
Message-ID: <05233e3ec9c3420c941e6bfcff6885f6@yadro.com>
References: <5c50db42136d4a908b261c66b132b043@yadro.com>
 <87cz5p98ms.fsf@linaro.org> <65ac5ab41cf74b109d0298c1fd777f63@yadro.com>
 <87ttyxrdcc.fsf@linaro.org>
In-Reply-To: <87ttyxrdcc.fsf@linaro.org>
Accept-Language: en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.178.120.230]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=89.207.88.252; envelope-from=m.tyutin@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

PiA+IERvIHlvdSBtZWFuIGNvbmN1cnJlbnQgYWNjZXNzIHRvIHRoZSBzYW1lIG1lbW9yeSBibG9j
ayBieSBtdWx0aXBsZQ0KPiA+IHRocmVhZHM/DQo+IA0KPiBZZXMgLSBhbHRob3VnaCB3ZSBhbHNv
IHNlZSBNTVUgY2hhbmdlcyB1cGRhdGluZyBhIG1hcHBpbmcgZm9yIGEgZ2l2ZW4NCj4gdmFkZHIg
LT4gcGh5cyBhZGRyZXNzLg0KPiANCj4gPg0KPiA+IEkgdGhpbmsgLCBmb3IgZ3Vlc3QgdGhyZWFk
cy9jb3JlcyBpZiB3ZSBvYnNlcnZlIG1pc21hdGNoIG9mIG1lbW9yeSBjb250ZW50IHJlYWQgYnkg
YSBwbHVnaW4gYW5kIGluc3RydWN0aW9uDQo+ID4gaXRzZWxmLCB0aGVuIGl0IHNob3VsZCBjbGVh
cmx5IGluZGljYXRlIHRoYXQgZ3Vlc3Qgc29mdHdhcmUgaGFzIHRydWUgZGF0YSByYWNlIHByb2Js
ZW0gc2l0dGluZyBzb21ld2hlcmUNCj4gPiBpbiBpdHMgY29kZS4gT3RoZXJ3aXNlIG90aGVyIHRo
cmVhZHMgd291bGQgd2FpdCBvbiBhIHN5bmNocm9uaXphdGlvbiBvYmplY3QgdG8gbGV0IGN1cnJl
bnQgdGhyZWFkDQo+ID4gcGVyZm9ybSBib3RoIG1lbW9yeSBvcGVyYXRpb25zIChwbHVnaW4gY2Fs
bGJhY2sgKyBpbnN0cnVjdGlvbikuDQo+IA0KPiBPdGhlciB0aHJlYWRzIGRvbid0IHBhdXNlIGF0
IGFsbCAodW5sZXNzIHlvdSBkbyBzb21ldGhpbmcgaW4gdGhlIHBsdWdpbg0KPiB0byBmb3JjZSB0
aGF0KQ0KDQpCeSBjb3JyZWN0IG11bHRpLXRocmVhZGVkIGNvZGUgSSBtZWFuIHRoYXQgdHdvIGNv
bmN1cnJlbnQgYWNjZXNzZXMgc2hvdWxkDQpiZSBzeW5jaHJvbml6ZWQgYnkgdGhlIGFwcGxpY2F0
aW9uIGl0c2VsZiB0byBlbnN1cmUgaXQgY29ycmVjdG5lc3MuIEZvciBleGFtcGxlDQp0d28gdGhy
ZWFkIGFjY2VzcyB0aGUgc2FtZSBtZW1vcnkgdXNpbmcgYSBsb2NrOg0KDQpUMToNCkxvY2sgICAg
ICAgICANCiAgcmVhZCBtZW0NClVubG9jaw0KDQpUMjoNCkxvY2sNCiAgd3JpdGUgbWVtDQpVbmxv
Y2sNCg0KSWYgYSBwbHVnaW4gaW5zZXJ0cyBtZW1vcnkgY2FsbGJhY2sgYXQgcmVhZC93cml0ZSBt
ZW0gaW5zdHJ1Y3Rpb24sIGl0IHdpbGwgYmUNCmltcGxpY2l0bHkgc3luY2hyb25pemVkIHdpdGgg
YW5vdGhlciB0aHJlYWQuDQoNCk9uIHRoZSBvdGhlciBoYW5kLCBpZiBhcHBsaWNhdGlvbiBtaXNz
ZXMgdGhlIGxvY2ssIGl0IGhhcyBkYXRhIHJhY2UgcmVnYXJkbGVzcw0Kb2YgaW5zZXJ0ZWQgY2Fs
bGJhY2tzLiBTbywgdGhlIHBsdWdpbiB3aWxsIGdldCB1bmRlZmluZWQgY29udGVudCBhbnl3YXku
DQpUMSAgICAgICAgICAgICAgICAgIFQyDQpyZWFkIG1lbSAgICB3cml0ZSBtZW0NCg0KIA0KPiA+
IE9uIHRoZSBvdGhlciBoYW5kLCBjb25jdXJyZW50IGFjY2Vzcw0KPiA+IHVzaW5nIGF0b21pYyBv
cGVyYXRpb24gd2lsbCBpbmRlZWQgY2F1c2UgZWl0aGVyIHBsdWdpbiBvciBpbnN0cnVjdGlvbiB0
byByZWFkIGludmFsaWQgbWVtb3J5IGNvbnRlbnQuDQo+ID4NCj4gPiBJc27igJl0IGl0IHRoZSBz
YW1lIHByb2JsZW0gYXMgd2UgZmFjZSBpbiBjYXNlIG9mIEdEQiBhdHRhY2hlZCB0byBydW5uaW5n
IFFlbXUgaW5zdGFuY2UgKGdkYnNlcnZlcikgYW5kDQo+ID4gYXNraW5nIGl0IHRvIHJlYWQgc29t
ZSBtZW1vcnk/IEhvdyBpcyBpdCBzb2x2ZWQgdGhlcmU/DQo+IA0KPiBZZXMgYW5kIGl0J3Mgbm90
IHNvbHZlZCBleGNlcHQgdXN1YWxseSBtb3N0IGludGVyYWN0aW9ucyB3aXRoIHRoZSBndWVzdA0K
PiBkdXJpbmcgZGVidWdnaW5nIGFyZSB3aGlsZSB0aGUgc3lzdGVtIGlzIHBhdXNlZC4NCj4gDQo+
IC0tDQo+IEFsZXggQmVubsOpZQ0KPiBWaXJ0dWFsaXNhdGlvbiBUZWNoIExlYWQgQCBMaW5hcm8N
Cg0K


