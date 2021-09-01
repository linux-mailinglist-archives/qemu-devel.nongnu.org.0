Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79C93FD3DB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 08:35:29 +0200 (CEST)
Received: from localhost ([::1]:42368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLJqK-0007jB-OS
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 02:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Renwei.Liu@verisilicon.com>)
 id 1mLJod-0005Xr-QC; Wed, 01 Sep 2021 02:33:43 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:31114
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Renwei.Liu@verisilicon.com>)
 id 1mLJoa-0008Rx-DU; Wed, 01 Sep 2021 02:33:42 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1630478007; h=from:subject:to:date:message-id;
 bh=nqZm03miValXMGMoFv61M/Sx6/MFCwWD5HNjKo8GdVA=;
 b=ft88IJdISbSj9LkRhqIQKJsCFLSeIK3U3yu6wgzmrwU+8dD8Kxil6UAypiADgUdUUaHr0LE3h/U
 2sSM0UNbUlvyJEZZyKuoKv88dpjL7ApzPFYrcsjsBgRE8BVSPkoXTGkUq6iuTOkxgFu5Jec13u9o6
 X/AEWK3QEQXeNgyb8qk=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Wed, 1 Sep 2021 14:33:26 +0800
From: "Liu, Renwei" <Renwei.Liu@verisilicon.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: RE: [PATCH v2] hw/arm/smmuv3: Simplify range invalidation
Thread-Topic: [PATCH v2] hw/arm/smmuv3: Simplify range invalidation
Thread-Index: AdeX84o6Zl+vD6dIRwucF0VY/o+mnwGQGLuAACkW3AA=
Date: Wed, 1 Sep 2021 06:33:25 +0000
Message-ID: <4FA89A717CD8094DBA0FE20FA5F98EAA010E6EA1E0@SHASXM03.verisilicon.com>
References: <4FA89A717CD8094DBA0FE20FA5F98EAA010E6E9940@SHASXM03.verisilicon.com>
 <1805dcb3-6f99-0bf1-2d73-be0537c98512@redhat.com>
In-Reply-To: <1805dcb3-6f99-0bf1-2d73-be0537c98512@redhat.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.46.48]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--14.244800-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Received-SPF: pass client-ip=101.89.135.45;
 envelope-from=Renwei.Liu@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBFcmljIEF1Z2VyIFttYWlsdG86
ZXJpYy5hdWdlckByZWRoYXQuY29tXQ0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgMzEsIDIwMjEg
MTA6NDYgUE0NCj4gVG86IExpdSwgUmVud2VpOyBQZXRlciBNYXlkZWxsDQo+IENjOiBxZW11LWFy
bUBub25nbnUub3JnOyBxZW11LWRldmVsQG5vbmdudS5vcmc7IExpLCBDaHVubWluZzsgV2VuLA0K
PiBKaWFueGlhbg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBody9hcm0vc21tdXYzOiBTaW1w
bGlmeSByYW5nZSBpbnZhbGlkYXRpb24NCj4gDQo+IEhpIExpdSwNCj4gDQo+IE9uIDgvMjMvMjEg
OTo1MCBBTSwgTGl1LCBSZW53ZWkgd3JvdGU6DQo+ID4gU2ltcGxpZnkgcmFuZ2UgaW52YWxpZGF0
aW9uIHdoaWNoIGNhbiBhdm9pZCB0byBpdGVyYXRlIG92ZXIgYWxsDQo+ID4gaW90bGIgZW50cmll
cyBtdWx0aS10aW1lcy4gRm9yIGluc3RhbmNlIGludmFsaWRhdGlvbnMgcGF0dGVybnMgbGlrZQ0K
PiA+ICJpbnZhbGlkYXRlIDMyIDRrQiBwYWdlcyBzdGFydGluZyBmcm9tIDB4ZmZhY2QwMDAiIG5l
ZWQgdG8gaXRlcmF0ZQ0KPiBvdmVyDQo+ID4gYWxsIGlvdGxiIGVudHJpZXMgNiB0aW1lcyAobnVt
X3BhZ2VzOiAxLCAyLCAxNiwgOCwgNCwgMSkuIEl0IG9ubHkNCj4gbmVlZHMNCj4gPiB0byBpdGVy
YXRlIG92ZXIgYWxsIGlvdGxiIGVudHJpZXMgb25jZSB3aXRoIG5ldyBpbXBsZW1lbnRhdGlvbi4N
Cj4gDQo+IFRoaXMgd291bGRuJ3Qgd29yay4gVGhpcyByZXZlcnRzIGNvbW1pdA0KPiA2ZDljZDEx
NWI5ZGYgKCJody9hcm0vc21tdXYzOiBFbmZvcmNlIGludmFsaWRhdGlvbiBvbiBhIHBvd2VyIG9m
IHR3bw0KPiByYW5nZSIpDQo+IHdoaWNoIGlzIG1hbmRhdGVkIGZvciBWRklPIGFuZCB2aXJ0aW8g
dG8gd29yay4gSU9UTEIgaW52YWxpZGF0aW9ucyBtdXN0DQo+IGJlIG5hdHVyYWxseSBhbGlnbmVk
IGFuZCB3aXRoIGEgcG93ZXIgb2YgMiByYW5nZSwgaGVuY2UgdGhpcyBpdGVyYXRpb24uDQo+IA0K
PiBUaGFua3MNCj4NCj4gRXJpYw0KSGkgRXJpYywNCg0KQ291bGQgeW91IHRyeSB0aGUgcGF0Y2gg
Zmlyc3RseT8gSSB3YW50IHRvIGtub3cgd2hldGhlciBpdCdzIGZhaWxlZA0KaW4geW91ciBhcHBs
aWNhdGlvbiBzY2VuYXJpbyB3aXRoIHRoaXMgaW1wbGVtZW50YXRpb24uDQpJIGFncmVlIHdpdGgg
eW91IHRoYXQgSU9UTEIgZW50cnkgbXVzdCBiZSBuYXR1cmFsbHkgYWxpZ25lZCBhbmQNCndpdGgg
YSBwb3dlciBvZiAyIHJhbmdlLiBCdXQgd2UgY2FuIGludmFsaWRhdGUgbXVsdGkgSU9UTEIgZW50
cmllcw0KaW4gb25lIGl0ZXJhdGlvbi4gV2UgY2hlY2sgdGhlIG92ZXJsYXAgYmV0d2VlbiBpbnZh
bGlkYXRpb24gcmFuZ2UNCmFuZCBJT1RMQiByYW5nZSwgbm90IGNoZWNrIG1hc2suIFRoZSBmaW5h
bCByZXN1bHQgaXMgc2FtZSB3aXRoDQp5b3VyIGltcGxlbWVudGF0aW9uIChzcGxpdCB0byBtdWx0
aSB0aW1lcyB3aXRoIGEgcG93ZXIgb2YgMiByYW5nZSkuDQpJIHdvbmRlciB3aHkgd2UgY2FuJ3Qg
aW1wbGVtZW50IGl0IGRpcmVjdGx5IHdoZW4gdGhlIGFwcGxpY2F0aW9uIGNhbg0Kc2VuZCBhbiBp
bnZhbGlkYXRpb24gY29tbWFuZCB3aXRoIGEgbm9uIHBvd2VyIG9mIDIgcmFuZ2UuDQpXZSBoYXZl
IHRlc3RlZCBpdCBpbiBvdXIgYXBwbGljYXRpb24gc2NlbmFyaW8gYW5kIG5vdCBmaW5kIGFueSBm
YWlsLg0KDQpJbiBhZGRpdGlvbiwgZnJvbSB0aGUgY29kZSBpbXBsZW1lbnRhdGlvbiwgc21tdV9p
b3RsYl9pbnZfaW92YSgpDQpzaG91bGQgYmUgT0suIEluIGFub3RoZXIgY2FsbCBzbW11djNfaW52
X25vdGlmaWVyc19pb3ZhKCkgLT4NCnNtbXV2M19ub3RpZnlfaW92YSgpIC0+IG1lbW9yeV9yZWdp
b25fbm90aWZ5X2lvbW11X29uZSgpLA0KaXQgYWxzbyBjaGVja3MgcmFuZ2Ugb3ZlcmxhcC4gU28g
aXQgc2hvdWxkIGJlIE9LIGlmIHRoZSByYW5nZQ0KaXMgbm90IGEgcG93ZXIgb2YgMi4NCg0KQ291
bGQgeW91IHRha2UgYSBsb29rIGF0IGl0IGFnYWluPw0KDQpUaGFua3MNClJlbndlaSBMaXUNCg==

