Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D4B20A097
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 16:08:55 +0200 (CEST)
Received: from localhost ([::1]:56164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joSYf-0003UZ-Uw
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 10:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1joSXx-00035m-NE
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 10:08:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39518
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1joSXv-0003VY-CB
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 10:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593094085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NsSPK6FsQmHVmLP45bUM/hm96AQvKSo/hGYkFVL3Fck=;
 b=Obr3Cg/vdC0XeGK/kRWKMO2zy9je0K4/VYGP/poi0VUo4OlscymAhV+k6hKM0FfakdxpTp
 rnyYeWr620txofldc41u9zy/n9IS4vP4eWbXjpm7r5FdtVEV3ivd+DkhTiMRMJ21avAQV9
 2Y3p/T8bsIihtJezMOJJ+DdJuIYGfTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-duJkgTSEN5KHjXTuhA-3lg-1; Thu, 25 Jun 2020 10:08:03 -0400
X-MC-Unique: duJkgTSEN5KHjXTuhA-3lg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD6F6800C64
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 14:08:02 +0000 (UTC)
Received: from localhost (ovpn-115-49.ams2.redhat.com [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E49171688;
 Thu, 25 Jun 2020 14:07:58 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tracetool: work around ust <sys/sdt.h> include conflict
Date: Thu, 25 Jun 2020 15:07:57 +0100
Message-Id: <20200625140757.237012-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.211.31.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 01:47:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: armbru@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qm90aCB0aGUgZHRyYWNlIGFuZCB1c3QgYmFja2VuZHMgbWF5IGluY2x1ZGUgPHN5cy9zZHQuaD4g
YnV0IExUVG5nClVzZXJzcGFjZSBUcmFjZXIgMi4xMSBhbmQgbGF0ZXIgcmVxdWlyZXMgU0RUX1VT
RV9WQVJJQURJQyB0byBiZSBkZWZpbmVkCmJlZm9yZSBpbmNsdWRpbmcgdGhlIGhlYWRlciBmaWxl
LgoKVGhpcyBpcyBhIGNsYXNzaWMgcHJvYmxlbSB3aXRoIEMgaGVhZGVyIGZpbGVzIGluY2x1ZGVk
IGZyb20gZGlmZmVyZW50CnBhcnRzIG9mIGEgcHJvZ3JhbS4gSWYgdGhlIHNhbWUgaGVhZGVyIGlz
IGluY2x1ZGVkIHR3aWNlIHdpdGhpbiB0aGUgc2FtZQpjb21waWxhdGlvbiB1bml0IHRoZW4gdGhl
IGZpcnN0IGluY2x1c2lvbiBkZXRlcm1pbmVzIHRoZSBtYWNybwplbnZpcm9ubWVudC4KCldvcmsg
YXJvdW5kIHRoaXMgYnkgZGVmaW5pbmcgU0RUX1VTRV9WQVJJQURJQyBpbiB0aGUgZHRyYWNlIGJh
Y2tlbmQgdG9vLgpJdCBkb2Vzbid0IGh1cnQgYW5kIGZpeGVzIGEgbWlzc2luZyBTVEFQX1BST0JF
VigpIGNvbXBpbGVyIGVycm9yIHdoZW4KdGhlIHVzdCBiYWNrZW5kIGlzIGVuYWJsZWQgdG9nZXRo
ZXIgd2l0aCB0aGUgZHRyYWNlIGJhY2tlbmQuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9j
emkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQpJIGFtIGFsc28gc2VuZGluZyBhIGZpeCB0byB0
aGUgTFRUbmcgVXNlcnNwYWNlIFRyYWNlciBwcm9qZWN0IHRvIGFkZAotRFNEVF9VU0VfVkFSSUFE
SUMgdG8gdGhlIHBrZy1jb25maWcgQ0ZMQUdTIHNvIHRoYXQgYXBwbGljYXRpb25zIGRlZmluZQp0
aGUgbWFjcm8gY29uc2lzdGVudGx5LiBCdXQgdGhpcyBwYXRjaCBpcyBzdGlsbCBuZWVkZWQgYXMg
YSB3b3JrYXJvdW5kCmZvciBsdHRuZy11c3QgMi4xMS4KLS0tCiBzY3JpcHRzL3RyYWNldG9vbC9i
YWNrZW5kL2R0cmFjZS5weSB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy90cmFjZXRvb2wvYmFja2VuZC9kdHJhY2UucHkgYi9z
Y3JpcHRzL3RyYWNldG9vbC9iYWNrZW5kL2R0cmFjZS5weQppbmRleCA2Mzg5OTBkYjc5Li43OWRi
YzJmYTI3IDEwMDY0NAotLS0gYS9zY3JpcHRzL3RyYWNldG9vbC9iYWNrZW5kL2R0cmFjZS5weQor
KysgYi9zY3JpcHRzL3RyYWNldG9vbC9iYWNrZW5kL2R0cmFjZS5weQpAQCAtNDAsNiArNDAsMTIg
QEAgZGVmIGdlbmVyYXRlX2hfYmVnaW4oZXZlbnRzLCBncm91cCk6CiAgICAgZWxzZToKICAgICAg
ICAgaGVhZGVyID0gInRyYWNlLWR0cmFjZS5oIgogCisgICAgIyBXb3JrYXJvdW5kIGZvciB1c3Qg
YmFja2VuZCwgd2hpY2ggYWxzbyBpbmNsdWRlcyA8c3lzL3NkdC5oPiBhbmQgbWF5CisgICAgIyBy
ZXF1aXJlIFNEVF9VU0VfVkFSSUFESUMgdG8gYmUgZGVmaW5lZC4gSWYgZHRyYWNlIGluY2x1ZGVz
IDxzeXMvc2R0Lmg+CisgICAgIyBmaXJzdCB3aXRob3V0IGRlZmluaW5nIFNEVF9VU0VfVkFSSUFE
SUMgdGhlbiB1c3QgYnJlYWtzIGJlY2F1c2UgdGhlCisgICAgIyBTVEFQX1BST0JFVigpIG1hY3Jv
IGlzIG5vdCBkZWZpbmVkLgorICAgIG91dCgnI2RlZmluZSBTRFRfVVNFX1ZBUklBRElDIDEnKQor
CiAgICAgb3V0KCcjaW5jbHVkZSAiJXMiJyAlIGhlYWRlciwKICAgICAgICAgJycpCiAKLS0gCjIu
MjYuMgoK


