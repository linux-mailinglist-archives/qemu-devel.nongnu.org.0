Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4833287A3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 18:29:54 +0100 (CET)
Received: from localhost ([::1]:47386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGmMj-00087B-7w
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 12:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGmKh-0006js-Am
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:27:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGmKf-0002op-7G
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:27:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614619664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pOvdoudQIuU/VcDTqIwiqfJkGiSpZYpRZlb8TAYwl0Q=;
 b=fz0KwLJuk1HO2gBlB5bCIKVCgZXv3UwxH6BpwkHNtAJ9qZ1KR11t91hN5JUgsENix2UbDy
 ZggwbfQkFvViFfubRnnVxrqTe6Myj2FWNAd5vm+0FudFOqm70fgUiVRk4gBjICfSB5c84k
 55Gbl8lPoSJIcsg5ohmWTYt1FRZR7So=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-ig4bBh3PMAy88G5YRk61OQ-1; Mon, 01 Mar 2021 12:27:41 -0500
X-MC-Unique: ig4bBh3PMAy88G5YRk61OQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A23E106BAAB;
 Mon,  1 Mar 2021 17:27:40 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BACDE5C1D1;
 Mon,  1 Mar 2021 17:27:36 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] docs: show how to spawn qemu-storage-daemon with fd
 passing
Date: Mon,  1 Mar 2021 17:27:27 +0000
Message-Id: <20210301172728.135331-2-stefanha@redhat.com>
In-Reply-To: <20210301172728.135331-1-stefanha@redhat.com>
References: <20210301172728.135331-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIFFNUCBtb25pdG9yLCBOQkQgc2VydmVyLCBhbmQgdmhvc3QtdXNlci1ibGsgZXhwb3J0IGFs
bCBzdXBwb3J0IGZpbGUKZGVzY3JpcHRvciBwYXNzaW5nLiBUaGlzIGlzIGEgdXNlZnVsIHRlY2hu
aXF1ZSBiZWNhdXNlIGl0IGFsbG93cyB0aGUKcGFyZW50IHByb2Nlc3MgdG8gc3Bhd24gYW5kIHdh
aXQgZm9yIHFlbXUtc3RvcmFnZS1kYWVtb24gd2l0aG91dCBidXN5CndhaXRpbmcsIHdoaWNoIG1h
eSBkZWxheSBzdGFydHVwIGR1ZSB0byBhcmJpdHJhcnkgc2xlZXAoKSBjYWxscy4KClRoaXMgUHl0
aG9uIGV4YW1wbGUgaXMgaW5zcGlyZWQgYnkgdGhlIHRlc3QgY2FzZSB3cml0dGVuIGZvciBsaWJu
YmQgYnkKUmljaGFyZCBXLk0uIEpvbmVzIDxyam9uZXNAcmVkaGF0LmNvbT46Cmh0dHBzOi8vZ2l0
bGFiLmNvbS9uYmRraXQvbGlibmJkLy0vY29tbWl0Lzg5MTEzZjQ4NGVmZmIwZTZjMzIyMzE0YmE3
NWMxY2JlMDdhMDQ1NDMKClRoYW5rcyB0byBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUBy
ZWRoYXQuY29tPiBmb3Igc3VnZ2VzdGlvbnMgb24KaG93IHRvIGdldCB0aGlzIHdvcmtpbmcuIE5v
dyBsZXQncyBkb2N1bWVudCBpdCEKClJlcG9ydGVkLWJ5OiBSaWNoYXJkIFcuTS4gSm9uZXMgPHJq
b25lc0ByZWRoYXQuY29tPgpDYzogS2V2aW4gV29sZiA8a3dvbGZAcmVkaGF0LmNvbT4KQ2M6IERh
bmllbCBQLiBCZXJyYW5nw6kgPGJlcnJhbmdlQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IFN0
ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCnYyOgogKiBVc2UgL3Zhci9y
dW4vcW1wLnNvY2sgaW5zdGVhZCBvZiAvdG1wL3FtcC0kUElELnNvY2sgdG8gcHJldmVudAogICBz
ZWN1cml0eSBpc3N1ZXMgd2l0aCB3b3JsZC13cml0ZWFibGUgZGlyZWN0b3JpZXMgW1JpY2gsIERh
bmllbF0KLS0tCiBkb2NzL3Rvb2xzL3FlbXUtc3RvcmFnZS1kYWVtb24ucnN0IHwgNDIgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kb2NzL3Rvb2xzL3FlbXUtc3RvcmFnZS1k
YWVtb24ucnN0IGIvZG9jcy90b29scy9xZW11LXN0b3JhZ2UtZGFlbW9uLnJzdAppbmRleCBmNjM2
MjdlYWY2Li43ODlhOGU0YTc1IDEwMDY0NAotLS0gYS9kb2NzL3Rvb2xzL3FlbXUtc3RvcmFnZS1k
YWVtb24ucnN0CisrKyBiL2RvY3MvdG9vbHMvcWVtdS1zdG9yYWdlLWRhZW1vbi5yc3QKQEAgLTEw
MSwxMCArMTAxLDEyIEBAIFN0YW5kYXJkIG9wdGlvbnM6CiAKIC4uIG9wdGlvbjo6IC0tbmJkLXNl
cnZlciBhZGRyLnR5cGU9aW5ldCxhZGRyLmhvc3Q9PGhvc3Q+LGFkZHIucG9ydD08cG9ydD5bLHRs
cy1jcmVkcz08aWQ+XVssdGxzLWF1dGh6PTxpZD5dWyxtYXgtY29ubmVjdGlvbnM9PG4+XQogICAt
LW5iZC1zZXJ2ZXIgYWRkci50eXBlPXVuaXgsYWRkci5wYXRoPTxwYXRoPlssdGxzLWNyZWRzPTxp
ZD5dWyx0bHMtYXV0aHo9PGlkPl1bLG1heC1jb25uZWN0aW9ucz08bj5dCisgIC0tbmJkLXNlcnZl
ciBhZGRyLnR5cGU9ZmQsYWRkci5zdHI9PGZkPlssdGxzLWNyZWRzPTxpZD5dWyx0bHMtYXV0aHo9
PGlkPl1bLG1heC1jb25uZWN0aW9ucz08bj5dCiAKICAgaXMgYSBzZXJ2ZXIgZm9yIE5CRCBleHBv
cnRzLiBCb3RoIFRDUCBhbmQgVU5JWCBkb21haW4gc29ja2V0cyBhcmUgc3VwcG9ydGVkLgotICBU
TFMgZW5jcnlwdGlvbiBjYW4gYmUgY29uZmlndXJlZCB1c2luZyBgYC0tb2JqZWN0YGAgdGxzLWNy
ZWRzLSogYW5kIGF1dGh6LSoKLSAgc2VjcmV0cyAoc2VlIGJlbG93KS4KKyAgQSBsaXN0ZW4gc29j
a2V0IGNhbiBiZSBwcm92aWRlZCB2aWEgZmlsZSBkZXNjcmlwdG9yIHBhc3NpbmcgKHNlZSBFeGFt
cGxlcworICBiZWxvdykuIFRMUyBlbmNyeXB0aW9uIGNhbiBiZSBjb25maWd1cmVkIHVzaW5nIGBg
LS1vYmplY3RgYCB0bHMtY3JlZHMtKiBhbmQKKyAgYXV0aHotKiBzZWNyZXRzIChzZWUgYmVsb3cp
LgogCiAgIFRvIGNvbmZpZ3VyZSBhbiBOQkQgc2VydmVyIG9uIFVOSVggZG9tYWluIHNvY2tldCBw
YXRoIGBgL3RtcC9uYmQuc29ja2BgOjoKIApAQCAtMTI3LDYgKzEyOSw0MiBAQCBRTVAgY29tbWFu
ZHM6OgogICAgICAgLS1jaGFyZGV2IHNvY2tldCxwYXRoPXFtcC5zb2NrLHNlcnZlcixub3dhaXQs
aWQ9Y2hhcjEgXAogICAgICAgLS1tb25pdG9yIGNoYXJkZXY9Y2hhcjEKIAorTGF1bmNoIHRoZSBk
YWVtb24gZnJvbSBQeXRob24gd2l0aCBhIFFNUCBtb25pdG9yIHNvY2tldCB1c2luZyBmaWxlIGRl
c2NyaXB0b3IKK3Bhc3Npbmcgc28gdGhlcmUgaXMgbm8gbmVlZCB0byBidXN5IHdhaXQgZm9yIHRo
ZSBRTVAgbW9uaXRvciB0byBiZWNvbWUKK2F2YWlsYWJsZTo6CisKKyAgIyEvdXNyL2Jpbi9lbnYg
cHl0aG9uMworICBpbXBvcnQgc3VicHJvY2VzcworICBpbXBvcnQgc29ja2V0CisKKyAgc29ja19w
YXRoID0gJy92YXIvcnVuL3FtcC5zb2NrJworCisgIHdpdGggc29ja2V0LnNvY2tldChzb2NrZXQu
QUZfVU5JWCwgc29ja2V0LlNPQ0tfU1RSRUFNKSBhcyBsaXN0ZW5fc29jazoKKyAgICAgIGxpc3Rl
bl9zb2NrLmJpbmQoc29ja19wYXRoKQorICAgICAgbGlzdGVuX3NvY2subGlzdGVuKCkKKworICAg
ICAgZmQgPSBsaXN0ZW5fc29jay5maWxlbm8oKQorCisgICAgICBzdWJwcm9jZXNzLlBvcGVuKAor
ICAgICAgICAgIFsncWVtdS1zdG9yYWdlLWRhZW1vbicsCisgICAgICAgICAgICctLWNoYXJkZXYn
LCBmJ3NvY2tldCxmZD17ZmR9LHNlcnZlcj1vbixpZD1jaGFyMScsCisgICAgICAgICAgICctLW1v
bml0b3InLCAnY2hhcmRldj1jaGFyMSddLAorICAgICAgICAgIHBhc3NfZmRzPVtmZF0sCisgICAg
ICApCisKKyAgIyBsaXN0ZW5fc29jayB3YXMgYXV0b21hdGljYWxseSBjbG9zZWQgd2hlbiBsZWF2
aW5nIHRoZSAnd2l0aCcgc3RhdGVtZW50CisgICMgYm9keS4gSWYgdGhlIGRhZW1vbiBwcm9jZXNz
IHRlcm1pbmF0ZWQgZWFybHkgdGhlbiB0aGUgZm9sbG93aW5nIGNvbm5lY3QoKQorICAjIHdpbGwg
ZmFpbCB3aXRoICJDb25uZWN0aW9uIHJlZnVzZWQiIGJlY2F1c2Ugbm8gcHJvY2VzcyBoYXMgdGhl
IGxpc3RlbgorICAjIHNvY2tldCBvcGVuIGFueW1vcmUuIExhdW5jaCBlcnJvcnMgY2FuIGJlIGRl
dGVjdGVkIHRoaXMgd2F5LgorCisgIHFtcF9zb2NrID0gc29ja2V0LnNvY2tldChzb2NrZXQuQUZf
VU5JWCwgc29ja2V0LlNPQ0tfU1RSRUFNKQorICBxbXBfc29jay5jb25uZWN0KHNvY2tfcGF0aCkK
KyAgLi4uUU1QIGludGVyYWN0aW9uLi4uCisKK1RoZSBzYW1lIHNvY2tldCBzcGF3bmluZyBhcHBy
b2FjaCBhbHNvIHdvcmtzIHdpdGggdGhlIGBgLS1uYmQtc2VydmVyCithZGRyLnR5cGU9ZmQsYWRk
ci5zdHI9PGZkPmBgIGFuZCBgYC0tZXhwb3J0Cit0eXBlPXZob3N0LXVzZXItYmxrLGFkZHIudHlw
ZT1mZCxhZGRyLnN0cj08ZmQ+YGAgb3B0aW9ucy4KKwogRXhwb3J0IHJhdyBpbWFnZSBmaWxlIGBg
ZGlzay5pbWdgYCBvdmVyIE5CRCBVTklYIGRvbWFpbiBzb2NrZXQgYGBuYmQuc29ja2BgOjoKIAog
ICAkIHFlbXUtc3RvcmFnZS1kYWVtb24gXAotLSAKMi4yOS4yCgo=


