Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4732E9BCB
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 18:15:53 +0100 (CET)
Received: from localhost ([::1]:37258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwTSS-0003LU-Ae
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 12:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwTQY-00020m-UP
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:13:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwTQS-0002SN-LK
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:13:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609780428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjgYdtXItrBRDuOEDu+e3r/gEkmIeLeFz46RVO5XZug=;
 b=jKRLVZOt0XB7hBWrEs8NA5NSPzsJhz03qgA212/SaTZOJI1GaAJNLJ8rK2rHxEQMhk28rI
 Xqp6NgLJiknSR3P6UQaoShZ/UcuqlDgj0ol4vLCdtLgckMTZIrXrcqSehCQo0yO0rOcKZR
 9jUD6PZT4F0855x4ZcBmi9bWEV9GWbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-NMpLlB24OieqIXwOyiqX5g-1; Mon, 04 Jan 2021 12:13:46 -0500
X-MC-Unique: NMpLlB24OieqIXwOyiqX5g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6E16C281;
 Mon,  4 Jan 2021 17:13:44 +0000 (UTC)
Received: from localhost (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DCE25D735;
 Mon,  4 Jan 2021 17:13:38 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] hostmem-file: add readonly=on|off option
Date: Mon,  4 Jan 2021 17:13:19 +0000
Message-Id: <20210104171320.575838-3-stefanha@redhat.com>
In-Reply-To: <20210104171320.575838-1-stefanha@redhat.com>
References: <20210104171320.575838-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, eric.g.ernst@gmail.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TGV0IC1vYmplY3QgbWVtb3J5LWJhY2tlbmQtZmlsZSB3b3JrIG9uIHJlYWQtb25seSBmaWxlcyB3
aGVuIHRoZQpyZWFkb25seT1vbiBvcHRpb24gaXMgZ2l2ZW4uIFRoaXMgY2FuIGJlIHVzZWQgdG8g
c2hhcmUgdGhlIGNvbnRlbnRzIG9mIGEKZmlsZSBiZXR3ZWVuIG11bHRpcGxlIGd1ZXN0cyB3aGls
ZSBwcmV2ZW50aW5nIHRoZW0gZnJvbSBjb25zdW1pbmcKQ29weS1vbi1Xcml0ZSBtZW1vcnkgaWYg
Z3Vlc3RzIGRpcnR5IHRoZSBwYWdlcywgZm9yIGV4YW1wbGUuCgpBY2tlZC1ieTogTWljaGFlbCBT
LiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IExpYW0gTWVyd2ljayA8bGlh
bS5tZXJ3aWNrQG9yYWNsZS5jb20+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3Rl
ZmFuaGFAcmVkaGF0LmNvbT4KLS0tCnYzOgogKiBVc2UgT2JqZWN0ICpvYmogaW5zdGVhZCBvZiBP
YmplY3QgKm8gW0lnb3JdCiAqIERvIG5vdCBkZXJlZmVyZW5jZSBNRU1PUllfQkFDS0VORF9GSUxF
KG8pLT5yZWFkb25seSBkaXJlY3RseSwgdXNlIGEKICAgbG9jYWwgdmFyaWFibGUgdG8gaG9sZCB0
aGUgSG9zdE1lbW9yeUJhY2tlbmRGaWxlIHBvaW50ZXIuIFtJZ29yXQotLS0KIGJhY2tlbmRzL2hv
c3RtZW0tZmlsZS5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogcWVtdS1vcHRp
b25zLmh4ICAgICAgICAgfCAgNSArKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2JhY2tlbmRzL2hvc3RtZW0tZmlsZS5j
IGIvYmFja2VuZHMvaG9zdG1lbS1maWxlLmMKaW5kZXggZTgyNzY5MjEyNC4uNzMzNDA4ZTA3NiAx
MDA2NDQKLS0tIGEvYmFja2VuZHMvaG9zdG1lbS1maWxlLmMKKysrIGIvYmFja2VuZHMvaG9zdG1l
bS1maWxlLmMKQEAgLTI5LDYgKzI5LDcgQEAgc3RydWN0IEhvc3RNZW1vcnlCYWNrZW5kRmlsZSB7
CiAgICAgdWludDY0X3QgYWxpZ247CiAgICAgYm9vbCBkaXNjYXJkX2RhdGE7CiAgICAgYm9vbCBp
c19wbWVtOworICAgIGJvb2wgcmVhZG9ubHk7CiB9OwogCiBzdGF0aWMgdm9pZApAQCAtNTYsNyAr
NTcsNyBAQCBmaWxlX2JhY2tlbmRfbWVtb3J5X2FsbG9jKEhvc3RNZW1vcnlCYWNrZW5kICpiYWNr
ZW5kLCBFcnJvciAqKmVycnApCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
YmFja2VuZC0+c2l6ZSwgZmItPmFsaWduLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIChiYWNrZW5kLT5zaGFyZSA/IFJBTV9TSEFSRUQgOiAwKSB8CiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKGZiLT5pc19wbWVtID8gUkFNX1BNRU0gOiAwKSwKLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYi0+bWVtX3BhdGgsIGZhbHNlLCBl
cnJwKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYi0+bWVtX3BhdGgs
IGZiLT5yZWFkb25seSwgZXJycCk7CiAgICAgZ19mcmVlKG5hbWUpOwogI2VuZGlmCiB9CkBAIC0x
NTEsNiArMTUyLDI4IEBAIHN0YXRpYyB2b2lkIGZpbGVfbWVtb3J5X2JhY2tlbmRfc2V0X3BtZW0o
T2JqZWN0ICpvLCBib29sIHZhbHVlLCBFcnJvciAqKmVycnApCiAgICAgZmItPmlzX3BtZW0gPSB2
YWx1ZTsKIH0KIAorc3RhdGljIGJvb2wgZmlsZV9tZW1vcnlfYmFja2VuZF9nZXRfcmVhZG9ubHko
T2JqZWN0ICpvYmosIEVycm9yICoqZXJycCkKK3sKKyAgICBIb3N0TWVtb3J5QmFja2VuZEZpbGUg
KmZiID0gTUVNT1JZX0JBQ0tFTkRfRklMRShvYmopOworCisgICAgcmV0dXJuIGZiLT5yZWFkb25s
eTsKK30KKworc3RhdGljIHZvaWQgZmlsZV9tZW1vcnlfYmFja2VuZF9zZXRfcmVhZG9ubHkoT2Jq
ZWN0ICpvYmosIGJvb2wgdmFsdWUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBFcnJvciAqKmVycnApCit7CisgICAgSG9zdE1lbW9yeUJhY2tlbmQgKmJhY2tl
bmQgPSBNRU1PUllfQkFDS0VORChvYmopOworICAgIEhvc3RNZW1vcnlCYWNrZW5kRmlsZSAqZmIg
PSBNRU1PUllfQkFDS0VORF9GSUxFKG9iaik7CisKKyAgICBpZiAoaG9zdF9tZW1vcnlfYmFja2Vu
ZF9tcl9pbml0ZWQoYmFja2VuZCkpIHsKKyAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAiY2Fubm90
IGNoYW5nZSBwcm9wZXJ0eSAncmVhZG9ubHknIG9mICVzLiIsCisgICAgICAgICAgICAgICAgICAg
b2JqZWN0X2dldF90eXBlbmFtZShvYmopKTsKKyAgICAgICAgcmV0dXJuOworICAgIH0KKworICAg
IGZiLT5yZWFkb25seSA9IHZhbHVlOworfQorCiBzdGF0aWMgdm9pZCBmaWxlX2JhY2tlbmRfdW5w
YXJlbnQoT2JqZWN0ICpvYmopCiB7CiAgICAgSG9zdE1lbW9yeUJhY2tlbmQgKmJhY2tlbmQgPSBN
RU1PUllfQkFDS0VORChvYmopOwpAQCAtMTgyLDYgKzIwNSw5IEBAIGZpbGVfYmFja2VuZF9jbGFz
c19pbml0KE9iamVjdENsYXNzICpvYywgdm9pZCAqZGF0YSkKICAgICAgICAgTlVMTCwgTlVMTCk7
CiAgICAgb2JqZWN0X2NsYXNzX3Byb3BlcnR5X2FkZF9ib29sKG9jLCAicG1lbSIsCiAgICAgICAg
IGZpbGVfbWVtb3J5X2JhY2tlbmRfZ2V0X3BtZW0sIGZpbGVfbWVtb3J5X2JhY2tlbmRfc2V0X3Bt
ZW0pOworICAgIG9iamVjdF9jbGFzc19wcm9wZXJ0eV9hZGRfYm9vbChvYywgInJlYWRvbmx5IiwK
KyAgICAgICAgZmlsZV9tZW1vcnlfYmFja2VuZF9nZXRfcmVhZG9ubHksCisgICAgICAgIGZpbGVf
bWVtb3J5X2JhY2tlbmRfc2V0X3JlYWRvbmx5KTsKIH0KIAogc3RhdGljIHZvaWQgZmlsZV9iYWNr
ZW5kX2luc3RhbmNlX2ZpbmFsaXplKE9iamVjdCAqbykKZGlmZiAtLWdpdCBhL3FlbXUtb3B0aW9u
cy5oeCBiL3FlbXUtb3B0aW9ucy5oeAppbmRleCA0NTljOTE2ZDNkLi40NzMyYzZiNDVlIDEwMDY0
NAotLS0gYS9xZW11LW9wdGlvbnMuaHgKKysrIGIvcWVtdS1vcHRpb25zLmh4CkBAIC00NDA3LDcg
KzQ0MDcsNyBAQCBTUlNUCiAgICAgdGhleSBhcmUgc3BlY2lmaWVkLiBOb3RlIHRoYXQgdGhlICdp
ZCcgcHJvcGVydHkgbXVzdCBiZSBzZXQuIFRoZXNlCiAgICAgb2JqZWN0cyBhcmUgcGxhY2VkIGlu
IHRoZSAnL29iamVjdHMnIHBhdGguCiAKLSAgICBgYC1vYmplY3QgbWVtb3J5LWJhY2tlbmQtZmls
ZSxpZD1pZCxzaXplPXNpemUsbWVtLXBhdGg9ZGlyLHNoYXJlPW9ufG9mZixkaXNjYXJkLWRhdGE9
b258b2ZmLG1lcmdlPW9ufG9mZixkdW1wPW9ufG9mZixwcmVhbGxvYz1vbnxvZmYsaG9zdC1ub2Rl
cz1ob3N0LW5vZGVzLHBvbGljeT1kZWZhdWx0fHByZWZlcnJlZHxiaW5kfGludGVybGVhdmUsYWxp
Z249YWxpZ25gYAorICAgIGBgLW9iamVjdCBtZW1vcnktYmFja2VuZC1maWxlLGlkPWlkLHNpemU9
c2l6ZSxtZW0tcGF0aD1kaXIsc2hhcmU9b258b2ZmLGRpc2NhcmQtZGF0YT1vbnxvZmYsbWVyZ2U9
b258b2ZmLGR1bXA9b258b2ZmLHByZWFsbG9jPW9ufG9mZixob3N0LW5vZGVzPWhvc3Qtbm9kZXMs
cG9saWN5PWRlZmF1bHR8cHJlZmVycmVkfGJpbmR8aW50ZXJsZWF2ZSxhbGlnbj1hbGlnbixyZWFk
b25seT1vbnxvZmZgYAogICAgICAgICBDcmVhdGVzIGEgbWVtb3J5IGZpbGUgYmFja2VuZCBvYmpl
Y3QsIHdoaWNoIGNhbiBiZSB1c2VkIHRvIGJhY2sKICAgICAgICAgdGhlIGd1ZXN0IFJBTSB3aXRo
IGh1Z2UgcGFnZXMuCiAKQEAgLTQ0OTAsNiArNDQ5MCw5IEBAIFNSU1QKICAgICAgICAgNC4xNSkg
YW5kIHRoZSBmaWxlc3lzdGVtIG9mIGBgbWVtLXBhdGhgYCBtb3VudGVkIHdpdGggREFYCiAgICAg
ICAgIG9wdGlvbi4KIAorICAgICAgICBUaGUgYGByZWFkb25seWBgIG9wdGlvbiBzcGVjaWZpZXMg
d2hldGhlciB0aGUgYmFja2luZyBmaWxlIGlzIG9wZW5lZAorICAgICAgICByZWFkLW9ubHkgb3Ig
cmVhZC13cml0ZSAoZGVmYXVsdCkuCisKICAgICBgYC1vYmplY3QgbWVtb3J5LWJhY2tlbmQtcmFt
LGlkPWlkLG1lcmdlPW9ufG9mZixkdW1wPW9ufG9mZixzaGFyZT1vbnxvZmYscHJlYWxsb2M9b258
b2ZmLHNpemU9c2l6ZSxob3N0LW5vZGVzPWhvc3Qtbm9kZXMscG9saWN5PWRlZmF1bHR8cHJlZmVy
cmVkfGJpbmR8aW50ZXJsZWF2ZWBgCiAgICAgICAgIENyZWF0ZXMgYSBtZW1vcnkgYmFja2VuZCBv
YmplY3QsIHdoaWNoIGNhbiBiZSB1c2VkIHRvIGJhY2sgdGhlCiAgICAgICAgIGd1ZXN0IFJBTS4g
TWVtb3J5IGJhY2tlbmQgb2JqZWN0cyBvZmZlciBtb3JlIGNvbnRyb2wgdGhhbiB0aGUKLS0gCjIu
MjkuMgoK


