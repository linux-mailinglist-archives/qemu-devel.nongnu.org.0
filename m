Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC2835FC47
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 22:05:53 +0200 (CEST)
Received: from localhost ([::1]:38636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWlln-0006Bg-Jb
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 16:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWlj5-0004lq-9s
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:03:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWlj1-000462-57
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618430577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XV45UG/62qLq8DYoi2o7/mo+aQK6EDw9R/O9G2/WFJM=;
 b=WWp1ToleuLhJlQ4ILDD+CTN70oD1MZuJzRcQBXJcDzT59WytThc/z/PG52LC3JO3Rg/6cJ
 st+7WNmppa6/MZxsoOQfo8Nvm7E0pzUkQ8GuPW6PeMj1jZ7G7FNpKpem2MzPPp8N6c84ji
 QiXbyF0p2P849GvoSHKgcNds0UrIoPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-8oavRnhbMTytzYIppEH2gA-1; Wed, 14 Apr 2021 16:02:54 -0400
X-MC-Unique: 8oavRnhbMTytzYIppEH2gA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 056048030BB;
 Wed, 14 Apr 2021 20:02:53 +0000 (UTC)
Received: from localhost (ovpn-114-209.ams2.redhat.com [10.36.114.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 684E15C1B4;
 Wed, 14 Apr 2021 20:02:48 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] util/async: print leaked BH name when AioContext finalizes
Date: Wed, 14 Apr 2021 21:02:45 +0100
Message-Id: <20210414200247.917496-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, eric.g.ernst@gmail.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RXJpYyBFcm5zdCBhbmQgSSBkZWJ1Z2dlZCBhIEJIIGxlYWsgYW5kIGl0IHdhcyBtb3JlIGludm9s
dmVkIHRoYW4gaXQgc2hvdWxkIGJlLg0KVGhlIHByb2JsZW0gaXMgdGhhdCBCSHMgZG9uJ3QgaGF2
ZSBhIGh1bWFuLXJlYWRhYmxlIGlkZW50aWZpZXIsIHNvIGxvdy1sZXZlbA0KZGVidWdnaW5nIHRl
Y2huaXF1ZXMgYW5kIGluZmVyZW5jZXMgYWJvdXQgdGhlIGNvZGUgYXJlIHJlcXVpcmVkIHRvIGZp
Z3VyZSBvdXQNCndoaWNoIEJIIHdhcyBsZWFrZWQgaW4gcHJvZHVjdGlvbiBlbnZpcm9ubWVudHMg
d2l0aG91dCBlYXN5IGRlYnVnIGFjY2Vzcy4NCg0KVGhlIGxlYWsgZW5kZWQgdXAgYWxyZWFkeSBi
ZWluZyBmaXhlZCB1cHN0cmVhbSBidXQgbGV0J3MgaW1wcm92ZSBkaWFnbm9zdGljcw0KZm9yIGxl
YWtlZCBCSHMgc28gdGhhdCB0aGlzIGJlY29tZXMgcXVpY2sgYW5kIGVhc3kgaW4gdGhlIGZ1dHVy
ZS4NCg0KU3RlZmFuIEhham5vY3ppICgyKToNCiAgdXRpbC9hc3luYzogYWRkIGEgaHVtYW4tcmVh
ZGFibGUgbmFtZSB0byBCSHMgZm9yIGRlYnVnZ2luZw0KICB1dGlsL2FzeW5jOiBwcmludCBsZWFr
ZWQgQkggbmFtZSB3aGVuIEFpb0NvbnRleHQgZmluYWxpemVzDQoNCiBpbmNsdWRlL2Jsb2NrL2Fp
by5oICAgICAgICAgICAgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tDQogaW5j
bHVkZS9xZW11L21haW4tbG9vcC5oICAgICAgIHwgIDQgKysrLQ0KIHRlc3RzL3VuaXQvcHRpbWVy
LXRlc3Qtc3R1YnMuYyB8ICAyICstDQogdXRpbC9hc3luYy5jICAgICAgICAgICAgICAgICAgIHwg
MjUgKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KIHV0aWwvbWFpbi1sb29wLmMgICAgICAgICAg
ICAgICB8ICA0ICsrLS0NCiA1IGZpbGVzIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKyksIDExIGRl
bGV0aW9ucygtKQ0KDQotLSANCjIuMzAuMg0KDQo=


