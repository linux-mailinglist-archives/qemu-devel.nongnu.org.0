Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602D5243573
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Aug 2020 09:52:07 +0200 (CEST)
Received: from localhost ([::1]:45276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k681u-0005ZL-FI
	for lists+qemu-devel@lfdr.de; Thu, 13 Aug 2020 03:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k67v5-0002iL-6O
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 03:45:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45649
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k67v3-0002Wp-7X
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 03:45:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597304700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z8sS8i4kWBPQwcuMdL8VeFf0XP6UvVF/A6wBf5rP+yY=;
 b=TQ3t9TMWQLtSbdxTosJccJkcA5+uxz2OhSsRBlvq9D9eaLXKdpS3ecwXraSSTOLuoMFuY9
 8VtxfQ2sMA1sYkeqUN09juvy9Q78d25AMfpXnPNMIU9iCuNm7BnkAQt13yWWiPA+n1NBL1
 G1oWujlfFV84GhTT36kJjpAy27cN1Ik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-FWeL5spZOC-C9zrCtRuiDw-1; Thu, 13 Aug 2020 03:44:57 -0400
X-MC-Unique: FWeL5spZOC-C9zrCtRuiDw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 932BE1005E5B;
 Thu, 13 Aug 2020 07:44:54 +0000 (UTC)
Received: from localhost (ovpn-114-3.ams2.redhat.com [10.36.114.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AE235D9E8;
 Thu, 13 Aug 2020 07:44:35 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] scripts/tracetool: Use void pointer for vcpu
Date: Thu, 13 Aug 2020 06:22:50 +0100
Message-Id: <20200813052257.226142-3-stefanha@redhat.com>
In-Reply-To: <20200813052257.226142-1-stefanha@redhat.com>
References: <20200813052257.226142-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=205.139.110.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 03:44:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Cameron Esfahani <dirty@apple.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Max Reitz <mreitz@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUm9tYW4gQm9sc2hha292IDxyLmJvbHNoYWtvdkB5YWRyby5jb20+CgpkdHJhY2Ugb24g
bWFjT1MgY29tcGxhaW5zIHRoYXQgQ1BVU3RhdGUgKiBpcyB1c2VkIGZvciBhIGZldyBwcm9iZXM6
CgogIGR0cmFjZTogZmFpbGVkIHRvIGNvbXBpbGUgc2NyaXB0IHRyYWNlLWR0cmFjZS1yb290LmR0
cmFjZTogbGluZSAxMzA6IHN5bnRheCBlcnJvciBuZWFyICJDUFVTdGF0ZSIKCkEgY29tbWVudCBp
biBzY3JpcHRzL3RyYWNldG9vbC9fX2luaXRfXy5weSBtZW50aW9ucyB0aGF0OgoKICBXZSBvbmx5
IHdhbnQgdG8gYWxsb3cgc3RhbmRhcmQgQyB0eXBlcyBvciBmaXhlZCBzaXplZAogIGludGVnZXIg
dHlwZXMuIFdlIGRvbid0IHdhbnQgUUVNVSBzcGVjaWZpYyB0eXBlcwogIGFzIHdlIGNhbid0IGFz
c3VtZSB0cmFjZSBiYWNrZW5kcyBjYW4gcmVzb2x2ZSBhbGwgdGhlCiAgdHlwZWRlZnMKCkZpeGVz
OiAzZDIxMWQ5ZjRkYmVlICgidHJhY2U6IEFkZCAndmNwdScgZXZlbnQgcHJvcGVydHkgdG8gdHJh
Y2UgZ3Vlc3QgdkNQVSIpClJldmlld2VkLWJ5OiBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5n
ZUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRo
YXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBSb21hbiBCb2xzaGFrb3YgPHIuYm9sc2hha292QHlhZHJv
LmNvbT4KTWVzc2FnZS1pZDogMjAyMDA3MTcwOTM1MTcuNzMzOTctMy1yLmJvbHNoYWtvdkB5YWRy
by5jb20KQ2M6IENhbWVyb24gRXNmYWhhbmkgPGRpcnR5QGFwcGxlLmNvbT4KU2lnbmVkLW9mZi1i
eTogUm9tYW4gQm9sc2hha292IDxyLmJvbHNoYWtvdkB5YWRyby5jb20+ClNpZ25lZC1vZmYtYnk6
IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBzY3JpcHRzL3RyYWNl
dG9vbC92Y3B1LnB5IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy90cmFjZXRvb2wvdmNwdS5weSBiL3Njcmlw
dHMvdHJhY2V0b29sL3ZjcHUucHkKaW5kZXggYjU0ZTRmNGU3YS4uODY4YjRjYjA0YyAxMDA2NDQK
LS0tIGEvc2NyaXB0cy90cmFjZXRvb2wvdmNwdS5weQorKysgYi9zY3JpcHRzL3RyYWNldG9vbC92
Y3B1LnB5CkBAIC0yNCw3ICsyNCw3IEBAIGRlZiB0cmFuc2Zvcm1fZXZlbnQoZXZlbnQpOgogICAg
ICAgICBhc3NlcnQgInRjZy10cmFucyIgbm90IGluIGV2ZW50LnByb3BlcnRpZXMKICAgICAgICAg
YXNzZXJ0ICJ0Y2ctZXhlYyIgbm90IGluIGV2ZW50LnByb3BlcnRpZXMKIAotICAgICAgICBldmVu
dC5hcmdzID0gQXJndW1lbnRzKFsoIkNQVVN0YXRlICoiLCAiX19jcHUiKSwgZXZlbnQuYXJnc10p
CisgICAgICAgIGV2ZW50LmFyZ3MgPSBBcmd1bWVudHMoWygidm9pZCAqIiwgIl9fY3B1IiksIGV2
ZW50LmFyZ3NdKQogICAgICAgICBpZiAidGNnIiBpbiBldmVudC5wcm9wZXJ0aWVzOgogICAgICAg
ICAgICAgZm10ID0gIlwiY3B1PSVwIFwiIgogICAgICAgICAgICAgZXZlbnQuZm10ID0gW2ZtdCAr
IGV2ZW50LmZtdFswXSwKLS0gCjIuMjYuMgoK


