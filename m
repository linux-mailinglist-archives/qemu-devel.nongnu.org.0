Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E99328290
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 16:34:11 +0100 (CET)
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGkYk-0002e4-9m
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 10:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGkWn-0001S0-7d
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:32:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGkWl-0002Fr-85
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:32:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614612726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vHslKbJrov1Sj5p7l3/ILTzgapFMZHegcDCUyzwPG4Q=;
 b=es+pZ4XUTO4u08mYittFFJsox//0j3e8vvtETPEv6BkZ5UxzVIihFZpYm5Vdqk9tqtX3xC
 1kjmjSRdg3oJUSb+3OVvY0Ll1acm2UYXbXxpl0hzpzYFHH9QVmy5cf9G1IpXB1iGYfr0AR
 WsfIQY9EqSe5VoZg4rE5J+5O+PsIfl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-KSBY1bzONI-SNRIfuc-g9w-1; Mon, 01 Mar 2021 10:32:04 -0500
X-MC-Unique: KSBY1bzONI-SNRIfuc-g9w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0109610CE780;
 Mon,  1 Mar 2021 15:32:04 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92B7A5C1D1;
 Mon,  1 Mar 2021 15:32:00 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs: show how to spawn qemu-storage-daemon with fd passing
Date: Mon,  1 Mar 2021 15:31:59 +0000
Message-Id: <20210301153159.35660-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBkb2NzL3Rvb2xzL3FlbXUt
c3RvcmFnZS1kYWVtb24ucnN0IHwgMzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kb2NzL3Rvb2xzL3FlbXUtc3RvcmFnZS1kYWVtb24ucnN0IGIvZG9jcy90b29scy9xZW11
LXN0b3JhZ2UtZGFlbW9uLnJzdAppbmRleCBmNjM2MjdlYWY2Li40NTg1NGMxMzFlIDEwMDY0NAot
LS0gYS9kb2NzL3Rvb2xzL3FlbXUtc3RvcmFnZS1kYWVtb24ucnN0CisrKyBiL2RvY3MvdG9vbHMv
cWVtdS1zdG9yYWdlLWRhZW1vbi5yc3QKQEAgLTEwMSwxMCArMTAxLDEyIEBAIFN0YW5kYXJkIG9w
dGlvbnM6CiAKIC4uIG9wdGlvbjo6IC0tbmJkLXNlcnZlciBhZGRyLnR5cGU9aW5ldCxhZGRyLmhv
c3Q9PGhvc3Q+LGFkZHIucG9ydD08cG9ydD5bLHRscy1jcmVkcz08aWQ+XVssdGxzLWF1dGh6PTxp
ZD5dWyxtYXgtY29ubmVjdGlvbnM9PG4+XQogICAtLW5iZC1zZXJ2ZXIgYWRkci50eXBlPXVuaXgs
YWRkci5wYXRoPTxwYXRoPlssdGxzLWNyZWRzPTxpZD5dWyx0bHMtYXV0aHo9PGlkPl1bLG1heC1j
b25uZWN0aW9ucz08bj5dCisgIC0tbmJkLXNlcnZlciBhZGRyLnR5cGU9ZmQsYWRkci5zdHI9PGZk
PlssdGxzLWNyZWRzPTxpZD5dWyx0bHMtYXV0aHo9PGlkPl1bLG1heC1jb25uZWN0aW9ucz08bj5d
CiAKICAgaXMgYSBzZXJ2ZXIgZm9yIE5CRCBleHBvcnRzLiBCb3RoIFRDUCBhbmQgVU5JWCBkb21h
aW4gc29ja2V0cyBhcmUgc3VwcG9ydGVkLgotICBUTFMgZW5jcnlwdGlvbiBjYW4gYmUgY29uZmln
dXJlZCB1c2luZyBgYC0tb2JqZWN0YGAgdGxzLWNyZWRzLSogYW5kIGF1dGh6LSoKLSAgc2VjcmV0
cyAoc2VlIGJlbG93KS4KKyAgQSBsaXN0ZW4gc29ja2V0IGNhbiBiZSBwcm92aWRlZCB2aWEgZmls
ZSBkZXNjcmlwdG9yIHBhc3NpbmcgKHNlZSBFeGFtcGxlcworICBiZWxvdykuIFRMUyBlbmNyeXB0
aW9uIGNhbiBiZSBjb25maWd1cmVkIHVzaW5nIGBgLS1vYmplY3RgYCB0bHMtY3JlZHMtKiBhbmQK
KyAgYXV0aHotKiBzZWNyZXRzIChzZWUgYmVsb3cpLgogCiAgIFRvIGNvbmZpZ3VyZSBhbiBOQkQg
c2VydmVyIG9uIFVOSVggZG9tYWluIHNvY2tldCBwYXRoIGBgL3RtcC9uYmQuc29ja2BgOjoKIApA
QCAtMTI3LDYgKzEyOSwzOCBAQCBRTVAgY29tbWFuZHM6OgogICAgICAgLS1jaGFyZGV2IHNvY2tl
dCxwYXRoPXFtcC5zb2NrLHNlcnZlcixub3dhaXQsaWQ9Y2hhcjEgXAogICAgICAgLS1tb25pdG9y
IGNoYXJkZXY9Y2hhcjEKIAorTGF1bmNoIHRoZSBkYWVtb24gZnJvbSBQeXRob24gd2l0aCBhIFFN
UCBtb25pdG9yIHNvY2tldCB1c2luZyBmaWxlIGRlc2NyaXB0b3IKK3Bhc3Npbmcgc28gdGhlcmUg
aXMgbm8gbmVlZCB0byBidXN5IHdhaXQgZm9yIHRoZSBRTVAgbW9uaXRvciB0byBiZWNvbWUKK2F2
YWlsYWJsZTo6CisKKyAgIyEvdXNyL2Jpbi9lbnYgcHl0aG9uMworICBpbXBvcnQgb3MKKyAgaW1w
b3J0IHN1YnByb2Nlc3MKKyAgaW1wb3J0IHNvY2tldAorCisgIHNvY2tfcGF0aCA9ICcvdG1wL3Ft
cC17fS5zb2NrJy5mb3JtYXQob3MuZ2V0cGlkKCkpCisKKyAgd2l0aCBzb2NrZXQuc29ja2V0KHNv
Y2tldC5BRl9VTklYLCBzb2NrZXQuU09DS19TVFJFQU0pIGFzIGxpc3Rlbl9zb2NrOgorICAgICAg
bGlzdGVuX3NvY2suYmluZChzb2NrX3BhdGgpCisgICAgICBsaXN0ZW5fc29jay5saXN0ZW4oKQor
CisgICAgICBmZCA9IGxpc3Rlbl9zb2NrLmZpbGVubygpCisKKyAgICAgIHN1YnByb2Nlc3MuUG9w
ZW4oCisgICAgICAgICAgWydxZW11LXN0b3JhZ2UtZGFlbW9uJywKKyAgICAgICAgICAgJy0tY2hh
cmRldicsIGYnc29ja2V0LGZkPXtmZH0sc2VydmVyPW9uLGlkPWNoYXIxJywKKyAgICAgICAgICAg
Jy0tbW9uaXRvcicsICdjaGFyZGV2PWNoYXIxJ10sCisgICAgICAgICAgcGFzc19mZHM9W2ZkXSwK
KyAgICAgICkKKworICBxbXBfc29jayA9IHNvY2tldC5zb2NrZXQoc29ja2V0LkFGX1VOSVgsIHNv
Y2tldC5TT0NLX1NUUkVBTSkKKyAgcW1wX3NvY2suY29ubmVjdChzb2NrX3BhdGgpCisgIC4uLlFN
UCBpbnRlcmFjdGlvbi4uLgorCitUaGUgc2FtZSBzb2NrZXQgc3Bhd25pbmcgYXBwcm9hY2ggYWxz
byB3b3JrcyB3aXRoIHRoZSBgYC0tbmJkLXNlcnZlcgorYWRkci50eXBlPWZkLGFkZHIuc3RyPTxm
ZD5gYCBhbmQgYGAtLWV4cG9ydAordHlwZT12aG9zdC11c2VyLWJsayxhZGRyLnR5cGU9ZmQsYWRk
ci5zdHI9PGZkPmBgIG9wdGlvbnMuCisKIEV4cG9ydCByYXcgaW1hZ2UgZmlsZSBgYGRpc2suaW1n
YGAgb3ZlciBOQkQgVU5JWCBkb21haW4gc29ja2V0IGBgbmJkLnNvY2tgYDo6CiAKICAgJCBxZW11
LXN0b3JhZ2UtZGFlbW9uIFwKLS0gCjIuMjkuMgoK


