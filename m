Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EA16A930
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 15:09:01 +0200 (CEST)
Received: from localhost ([::1]:48678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnNCW-0006aS-NV
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 09:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44862)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hnNC9-0005n1-Ke
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 09:08:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hnNC8-0002QN-AA
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 09:08:37 -0400
Received: from mail-am5eur02on070b.outbound.protection.outlook.com
 ([2a01:111:f400:fe07::70b]:46899
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hnNC8-0002NH-19
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 09:08:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oF95IeOWpZVO884ORKSPm6UwR1WB2zBMsATuCYLu6PKFWyf12yYoQlsrMO5ARJ7Cf/pBA63q6+U+qiHos6UAdkdrBPv4H+PO3WjWK61DWnsbBl+tM26Qqx/Lgj0Zds2KkKhRtDrJ1puItLVpGp2BN0Ox6H9pQkHcoovlBkgxSZ05ph6AyiZAc9wuCRZRDXhn+6BlnxKosJHgf27/s/TxkWDOHoFr4GIKrP0oc0iQhfDVCmj9zKjt+mKXYc/eBQ+56O0pEZtX7tOrEgaGB6iLSH8FkYhjduaXF6EQRe+bM1goER6M6660NvploBT+rXhqCWeaANnSUqLlOnD0GnOcAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBFiaTRLuiKR8tTdXwn3NA0chigYlQ6W1hh6TDbDAKY=;
 b=Nv/uv/gS3l4aasUJqebHhfpyRMpPRc1FZiOb2VcqCA8R6528qQjpXt+E0E2uG1orrogH/nfX+PyHTf/mapxtbVYDKdZ9UhQD0WSgkDf7+CHYEjKWDi88GRCmB3JRFVkz1XHAB7VtqIFBsSUdHBv/HkHHHxF70PDlxJoGTdOPBktH4JSsh1hoIieEPixWMGSvLuQPajngVClRRFU1FBPyDr/O+t4bbtxGAEPt02j8A7TW7JeVi2m5p5P313ffgXFRCyGNZzZ2ZkEVqR2nFcY5xy2zEPWjA5mZop69N3h+c0GFdBlNeQ6X4oXi9XlKgAjtQz4FrHlxEovodWZ5hqubMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=virtuozzo.com;dmarc=pass action=none
 header.from=virtuozzo.com;dkim=pass header.d=virtuozzo.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBFiaTRLuiKR8tTdXwn3NA0chigYlQ6W1hh6TDbDAKY=;
 b=Nu6ru7px6UYjuADY61vejhSGyaPEgzX4zzy1upc3mQSqVvNnl4dGLpAjjvhnlYyXnVCJFQqf637siSoPKqaLpj5Qd5NtG2QnSoHrtK38eI9dyZp0whrk2ruknlke7GzvigrfxABdbmmlHYlDsvf+6gtqL364yXWKpAuNAbCvzUI=
Received: from VI1PR08MB4399.eurprd08.prod.outlook.com (20.179.28.141) by
 VI1PR08MB2670.eurprd08.prod.outlook.com (10.175.245.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 16 Jul 2019 13:08:31 +0000
Received: from VI1PR08MB4399.eurprd08.prod.outlook.com
 ([fe80::4c3d:79b3:a884:18c4]) by VI1PR08MB4399.eurprd08.prod.outlook.com
 ([fe80::4c3d:79b3:a884:18c4%3]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 13:08:31 +0000
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH] chardev: race condition with
 tcp_chr_disconnect
Thread-Index: AQHVOOZ1DwB6Iz4ObkKXlmNSu3G56abL8iuAgAAR7QCAATk6gA==
Date: Tue, 16 Jul 2019 13:08:31 +0000
Message-ID: <5832b3c6-c014-eef2-50bb-f25d70d65678@virtuozzo.com>
References: <1562959033-223586-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <b270d0cc-2a28-8a60-ccac-45ac4de89f02@redhat.com>
 <a55d4518-734e-9dd1-296f-473600eacbf7@redhat.com>
In-Reply-To: <a55d4518-734e-9dd1-296f-473600eacbf7@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0401CA0072.eurprd04.prod.outlook.com
 (2603:10a6:3:19::40) To VI1PR08MB4399.eurprd08.prod.outlook.com
 (2603:10a6:803:102::13)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=andrey.shinkevich@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2eda5d14-3304-4823-7b0f-08d709eeb34b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR08MB2670; 
x-ms-traffictypediagnostic: VI1PR08MB2670:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR08MB2670A019950A722FAC4D1B74F4CE0@VI1PR08MB2670.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(396003)(366004)(136003)(376002)(346002)(39850400004)(189003)(199004)(11346002)(5660300002)(2616005)(14454004)(446003)(486006)(25786009)(4326008)(44832011)(66476007)(66946007)(66446008)(64756008)(68736007)(2906002)(66066001)(256004)(8936002)(2501003)(31686004)(14444005)(86362001)(305945005)(3846002)(31696002)(36756003)(99286004)(316002)(966005)(66556008)(229853002)(110136005)(54906003)(6436002)(107886003)(6486002)(71190400001)(76176011)(6116002)(53936002)(102836004)(386003)(476003)(81156014)(6306002)(81166006)(6506007)(6512007)(26005)(53546011)(6246003)(8676002)(186003)(71200400001)(52116002)(478600001)(7736002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR08MB2670;
 H:VI1PR08MB4399.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pXPa3ip2rR5qIhBVnsZcjc9ab1R8De+RVwG6s9JWo0J/l944epN7qtDX57RBSTbRqMWbmWLQGFbQsWv9FvGeOxsSzz1QGHFr+Azb+euBeYtmfMi1b4PkoDJUZTyvmbrvVysZHKuFcJgmtVpgWbpFGY2Ojrn9g9jk4csMihe9XeYiqjYfOV8bTpYh1TEDkLIcqCVonTYzsyLR/jzQrzFIDVwST8mXZOPedeQxx5RHupKd2/Xe2nHZISm+4Zkkuu4boDEcwAbJqyAkMcKaclE97uNE3p+LRLJfRHkF0PFSPsdpLXM38pBVi01+nmNgzoVVlg79RtQvIlqi0fwNDugZkq40dLsc2RlX1FxoNqFTtzSgaRBRq8Nj7gzQ0oWM29/fShcVYbZGvUDgzFiIqvOUvicwSbxuJLyUg4YmDB3JqAw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <245085B18BF7454F921D5DACE4B19B81@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eda5d14-3304-4823-7b0f-08d709eeb34b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 13:08:31.2228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: andrey.shinkevich@virtuozzo.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2670
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe07::70b
Subject: Re: [Qemu-devel] [PATCH] chardev: race condition with
 tcp_chr_disconnect
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
Cc: "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Roman Kagan <rkagan@virtuozzo.com>, Denis Lunev <den@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDE1LzA3LzIwMTkgMjE6MjcsIFBhb2xvIEJvbnppbmkgd3JvdGU6DQo+IE9uIDE1LzA3
LzE5IDE5OjIzLCBNYXggUmVpdHogd3JvdGU6DQo+PiBPbiAxMi4wNy4xOSAyMToxNywgQW5kcmV5
IFNoaW5rZXZpY2ggd3JvdGU6DQo+Pj4gV2hlbiB0Y3BfY2hyX2Rpc2Nvbm5lY3QoKSBpcyBjYWxs
ZWQsIG90aGVyIHRocmVhZCBtYXkgYmUgc3RpbGwgd3JpdGluZw0KPj4+IHRvIHRoZSBjaGFubmVs
LiBUaGlzIHBhdGNoIHByb3RlY3RzIG9ubHkgcmVhZCBvcGVyYXRpb25zIHRoYXQgaW5pdGlhdGUN
Cj4+PiB0aGUgZGlzY29ubmVjdGlvbi4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBT
aGlua2V2aWNoIDxhbmRyZXkuc2hpbmtldmljaEB2aXJ0dW96em8uY29tPg0KPj4+IC0tLQ0KPj4N
Cj4+IEhhdmUgeW91IGxvb2tlZCBhdA0KPj4gaHR0cHM6Ly9saXN0cy5ub25nbnUub3JnL2FyY2hp
dmUvaHRtbC9xZW11LWRldmVsLzIwMTktMDIvbXNnMDYxNzQuaHRtbA0KPj4gYWxyZWFkeT8gIEZy
b20gYSBnbGFuY2UsIGl0IGxvb2tzIGxpa2UgdGhhdCBzZXJpZXMgc3VwZXJzZWRlcyB0aGlzIG9u
ZS4NCj4+DQo+PiAoTm8sIEkgZG9u4oCZdCBrbm93IHdoeSB0aGUgb3RoZXIgc2VyaWVzIGlzIGRl
bGF5ZWQuDQo+IA0KPiBCZWNhdXNlIGl0IGJyb2tlIHNvbWUgdGVzdGNhc2VzIGluIHRlc3RzL3Zo
b3N0LXVzZXItdGVzdC4gIFRoZXkgYXJlDQo+IGRpc2FibGVkIGJ5IGRlZmF1bHQsIGJlY2F1c2Ug
QUZBSVIgdGhleSBicm9rZSBvbiBzb21lIENJIGVudmlyb25tZW50LA0KPiBidXQgdGhleSBhcmUg
c3VwcG9zZWQgdG8gd29yay4NCj4gDQo+IFBhb2xvDQo+IA0KPj4gSSBrZWVwIHJlbWluZGluZw0K
Pj4gUGFvbG8gb2YgaXQuKQ0KPj4NCj4+IE1heA0KPj4NCj4gDQoNClRoZSB0ZXN0IGNoZWNrLXF0
ZXN0LXg4Nl82NDogdGVzdHMvcW9zLXRlc3QgaGFuZ3Mgd2l0aCB0aGUgDQpRVEVTVF9WSE9TVF9V
U0VSX0ZJWE1FIHNldCBldmVuIHdpdGhvdXQgYXBwbHlpbmcgdGhlIHNlcmllczoNCg0KVGhyZWFk
IDQgKFRocmVhZCAweDJhZGU3YTJiYjcwMCAoTFdQIDQ5MjU2NikpOg0KIzAgIDB4MDAwMDJhZGU2
ZjU0MzFjOSBpbiBzeXNjYWxsICgpIGF0IA0KLi4vc3lzZGVwcy91bml4L3N5c3YvbGludXgveDg2
XzY0L3N5c2NhbGwuUzozOA0KIzEgIDB4MDAwMDU1OTlkZWMwOGJiNiBpbiBxZW11X2Z1dGV4X3dh
aXQgKGY9MHg1NTk5ZGY2NjUxZDQgDQo8cmN1X2NhbGxfcmVhZHlfZXZlbnQ+LCB2YWw9NDI5NDk2
NzI5NSkgYXQgDQovaG9tZS9hbmRyZXkvZ2l0L3FlbXUvaW5jbHVkZS9xZW11L2Z1dGV4Lmg6MjkN
CiMyICAweDAwMDA1NTk5ZGVjMDhkN2YgaW4gcWVtdV9ldmVudF93YWl0IChldj0weDU1OTlkZjY2
NTFkNCANCjxyY3VfY2FsbF9yZWFkeV9ldmVudD4pIGF0IHV0aWwvcWVtdS10aHJlYWQtcG9zaXgu
Yzo0NDINCiMzICAweDAwMDA1NTk5ZGVjMjFlYTEgaW4gY2FsbF9yY3VfdGhyZWFkIChvcGFxdWU9
MHgwKSBhdCB1dGlsL3JjdS5jOjI2MA0KIzQgIDB4MDAwMDU1OTlkZWMwOGYyYyBpbiBxZW11X3Ro
cmVhZF9zdGFydCAoYXJncz0weDU1OTllMTA1NjhmMCkgYXQgDQp1dGlsL3FlbXUtdGhyZWFkLXBv
c2l4LmM6NTAyDQojNSAgMHgwMDAwMmFkZTZmMjM2ZGQ1IGluIHN0YXJ0X3RocmVhZCAoYXJnPTB4
MmFkZTdhMmJiNzAwKSBhdCANCnB0aHJlYWRfY3JlYXRlLmM6MzA3DQojNiAgMHgwMDAwMmFkZTZm
NTQ4ZWFkIGluIGNsb25lICgpIGF0IA0KLi4vc3lzZGVwcy91bml4L3N5c3YvbGludXgveDg2XzY0
L2Nsb25lLlM6MTExDQoNClRocmVhZCAzIChUaHJlYWQgMHgyYWRlN2E0YmM3MDAgKExXUCA0OTI1
NjcpKToNCiMwICAweDAwMDAyYWRlNmY1M2UyMGQgaW4gcG9sbCAoKSBhdCAuLi9zeXNkZXBzL3Vu
aXgvc3lzY2FsbC10ZW1wbGF0ZS5TOjgxDQojMSAgMHgwMDAwMmFkZTU2ZTdjMzJjIGluIGdfbWFp
bl9jb250ZXh0X2l0ZXJhdGUuaXNyYS4xOSAoKSBhdCANCi9saWI2NC9saWJnbGliLTIuMC5zby4w
DQojMiAgMHgwMDAwMmFkZTU2ZTdjNjdhIGluIGdfbWFpbl9sb29wX3J1biAoKSBhdCAvbGliNjQv
bGliZ2xpYi0yLjAuc28uMA0KIzMgIDB4MDAwMDU1OTlkZTdmNjc3MiBpbiBpb3RocmVhZF9ydW4g
KG9wYXF1ZT0weDU1OTllMTE5NmEzMCkgYXQgDQppb3RocmVhZC5jOjgyDQojNCAgMHgwMDAwNTU5
OWRlYzA4ZjJjIGluIHFlbXVfdGhyZWFkX3N0YXJ0IChhcmdzPTB4NTU5OWUxMWE4N2EwKSBhdCAN
CnV0aWwvcWVtdS10aHJlYWQtcG9zaXguYzo1MDINCiM1ICAweDAwMDAyYWRlNmYyMzZkZDUgaW4g
c3RhcnRfdGhyZWFkIChhcmc9MHgyYWRlN2E0YmM3MDApIGF0IA0KcHRocmVhZF9jcmVhdGUuYzoz
MDcNCiM2ICAweDAwMDAyYWRlNmY1NDhlYWQgaW4gY2xvbmUgKCkgYXQgDQouLi9zeXNkZXBzL3Vu
aXgvc3lzdi9saW51eC94ODZfNjQvY2xvbmUuUzoxMTENCg0KVGhyZWFkIDIgKFRocmVhZCAweDJh
ZGU3YTdhZTcwMCAoTFdQIDQ5MjU2OCkpOg0KIzAgIDB4MDAwMDJhZGU2ZjIzZTM2MSBpbiBfX3Np
Z3dhaXQgKHNpZz0weDJhZGU3YTdhYjc1MCwgc2V0PTxvcHRpbWl6ZWQgDQpvdXQ+KSBhdCAuLi9z
eXNkZXBzL3VuaXgvc3lzdi9saW51eC9zaWd3YWl0LmM6NjANCiMxICAweDAwMDAyYWRlNmYyM2Uz
NjEgaW4gX19zaWd3YWl0IChzZXQ9MHgyYWRlN2E3YWI3NjAsIA0Kc2lnPTB4MmFkZTdhN2FiNzUw
KSBhdCAuLi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9zaWd3YWl0LmM6OTUNCiMyICAweDAwMDA1
NTk5ZGU2NTVmZWUgaW4gcWVtdV9kdW1teV9jcHVfdGhyZWFkX2ZuIChhcmc9MHg1NTk5ZTExYTll
YjApIA0KYXQgL2hvbWUvYW5kcmV5L2dpdC9xZW11L2NwdXMuYzoxMzMxDQojMyAgMHgwMDAwNTU5
OWRlYzA4ZjJjIGluIHFlbXVfdGhyZWFkX3N0YXJ0IChhcmdzPTB4NTU5OWUxMWNkMTQwKSBhdCAN
CnV0aWwvcWVtdS10aHJlYWQtcG9zaXguYzo1MDINCiM0ICAweDAwMDAyYWRlNmYyMzZkZDUgaW4g
c3RhcnRfdGhyZWFkIChhcmc9MHgyYWRlN2E3YWU3MDApIGF0IA0KcHRocmVhZF9jcmVhdGUuYzoz
MDcNCiM1ICAweDAwMDAyYWRlNmY1NDhlYWQgaW4gY2xvbmUgKCkgYXQgDQouLi9zeXNkZXBzL3Vu
aXgvc3lzdi9saW51eC94ODZfNjQvY2xvbmUuUzoxMTENCg0KVGhyZWFkIDEgKFRocmVhZCAweDJh
ZGU1NjYxYzI4MCAoTFdQIDQ5MjU2NCkpOg0KIzAgIDB4MDAwMDJhZGU2ZjUzZTJjZiBpbiBfX0dJ
X3Bwb2xsIChmZHM9MHg1NTk5ZTIwZTEzNjAsIG5mZHM9OSwgDQp0aW1lb3V0PTxvcHRpbWl6ZWQg
b3V0Piwgc2lnbWFzaz0weDApIGF0IA0KLi4vc3lzZGVwcy91bml4L3N5c3YvbGludXgvcHBvbGwu
Yzo1Ng0KIzEgIDB4MDAwMDU1OTlkZWMwMjMyZCBpbiBxZW11X3BvbGxfbnMgKGZkcz0weDU1OTll
MjBlMTM2MCwgbmZkcz05LCANCnRpbWVvdXQ9NDM3OTM5OTg5NjQwMDApIGF0IHV0aWwvcWVtdS10
aW1lci5jOjMzNA0KIzIgIDB4MDAwMDU1OTlkZWMwMzUxMCBpbiBvc19ob3N0X21haW5fbG9vcF93
YWl0IA0KKHRpbWVvdXQ9NDM3OTM5OTg5NjQwMDApIGF0IHV0aWwvbWFpbi1sb29wLmM6MjQwDQoj
MyAgMHgwMDAwNTU5OWRlYzAzNjM0IGluIG1haW5fbG9vcF93YWl0IChub25ibG9ja2luZz0wKSBh
dCANCnV0aWwvbWFpbi1sb29wLmM6NTIxDQojNCAgMHgwMDAwNTU5OWRlN2ZmNDM5IGluIG1haW5f
bG9vcCAoKSBhdCB2bC5jOjE3OTENCiM1ICAweDAwMDA1NTk5ZGU4MDZkY2EgaW4gbWFpbiAoYXJn
Yz0xOSwgYXJndj0weDdmZmU1YjNiNjZhOCwgDQplbnZwPTB4N2ZmZTViM2I2NzQ4KSBhdCB2bC5j
OjQ0NzMNCg0KQW5kcmV5DQotLSANCldpdGggdGhlIGJlc3QgcmVnYXJkcywNCkFuZHJleSBTaGlu
a2V2aWNoDQoNCg==

