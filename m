Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89D638E718
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:05:09 +0200 (CEST)
Received: from localhost ([::1]:36180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAGa-0005nU-W6
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llADk-0002Gv-Nx
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:02:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llADe-0007cc-Oj
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621861323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r4lIr8BTDrF1dGkThDE8cvCezt7DIcFxQLMJnW043xk=;
 b=E0YCSomfL3IlSxkqVndySIYEg9X+8N6y/zKnlwYWpGlwnhLAnkbaYNv5kfuP84d3JeWFBu
 O/IlbJwZg7qXw9ZPP5lIrnchLyRdoSNTGaloZEtDzBzHEKsq3PMNxU0etwLZu8Uy8S0KC5
 AZAsC5zennDbbkQTY6oRCyPrK8TbMSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-4qj5ss7FPS-i2Fyce8zk-g-1; Mon, 24 May 2021 09:02:00 -0400
X-MC-Unique: 4qj5ss7FPS-i2Fyce8zk-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2569A40C3;
 Mon, 24 May 2021 13:01:58 +0000 (UTC)
Received: from localhost (ovpn-113-244.ams2.redhat.com [10.36.113.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9296B2DE98;
 Mon, 24 May 2021 13:01:51 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for-6.0 1/8] multi-process: Initialize variables declared with
 g_auto*
Date: Mon, 24 May 2021 14:00:17 +0100
Message-Id: <20210524130024.50651-2-stefanha@redhat.com>
In-Reply-To: <20210524130024.50651-1-stefanha@redhat.com>
References: <20210524130024.50651-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogWmVuZ2h1aSBZdSA8eXV6ZW5naHVpQGh1YXdlaS5jb20+CgpRdW90ZSBkb2NzL2RldmVs
L3N0eWxlLnJzdCAoc2VjdGlvbiAiQXV0b21hdGljIG1lbW9yeSBkZWFsbG9jYXRpb24iKToKCiog
VmFyaWFibGVzIGRlY2xhcmVkIHdpdGggZ19hdXRvKiBNVVNUIGFsd2F5cyBiZSBpbml0aWFsaXpl
ZCwKICBvdGhlcndpc2UgdGhlIGNsZWFudXAgZnVuY3Rpb24gd2lsbCB1c2UgdW5pbml0aWFsaXpl
ZCBzdGFjayBtZW1vcnkKCkluaXRpYWxpemUgQG5hbWUgcHJvcGVybHkgdG8gZ2V0IHJpZCBvZiB0
aGUgY29tcGlsYXRpb24gZXJyb3IgKHVzaW5nCmdjYy03LjMuMCBvbiBDZW50T1MpOgoKLi4vaHcv
cmVtb3RlL3Byb3h5LmM6IEluIGZ1bmN0aW9uICdwY2lfcHJveHlfZGV2X3JlYWxpemUnOgovdXNy
L2luY2x1ZGUvZ2xpYi0yLjAvZ2xpYi9nbGliLWF1dG9jbGVhbnVwcy5oOjI4OjM6IGVycm9yOiAn
bmFtZScgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV2Vycm9y
PW1heWJlLXVuaW5pdGlhbGl6ZWRdCiAgIGdfZnJlZSAoKnBwKTsKICAgXn5+fn5+fn5+fn5+Ci4u
L2h3L3JlbW90ZS9wcm94eS5jOjM1MDozMDogbm90ZTogJ25hbWUnIHdhcyBkZWNsYXJlZCBoZXJl
CiAgICAgICAgICAgICBnX2F1dG9mcmVlIGNoYXIgKm5hbWU7CiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5+fn4KClNpZ25lZC1vZmYtYnk6IFplbmdodWkgWXUgPHl1emVuZ2h1aUBodWF3
ZWkuY29tPgpSZXZpZXdlZC1ieTogSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUu
Y29tPgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQu
Y29tPgpSZXZpZXdlZC1ieTogTWlyb3NsYXYgUmV6YW5pbmEgPG1yZXphbmluQHJlZGhhdC5jb20+
Ck1lc3NhZ2UtaWQ6IDIwMjEwMzEyMTEyMTQzLjEzNjktMS15dXplbmdodWlAaHVhd2VpLmNvbQpT
aWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQog
aHcvcmVtb3RlL21lbW9yeS5jIHwgNSArKy0tLQogaHcvcmVtb3RlL3Byb3h5LmMgIHwgMyArLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2h3L3JlbW90ZS9tZW1vcnkuYyBiL2h3L3JlbW90ZS9tZW1vcnkuYwppbmRleCAyZDQx
NzQ2MTRhLi40NzJlZDJhMjcyIDEwMDY0NAotLS0gYS9ody9yZW1vdGUvbWVtb3J5LmMKKysrIGIv
aHcvcmVtb3RlL21lbW9yeS5jCkBAIC00MSwxMCArNDEsOSBAQCB2b2lkIHJlbW90ZV9zeXNtZW1f
cmVjb25maWcoTVBRZW11TXNnICptc2csIEVycm9yICoqZXJycCkKIAogICAgIHJlbW90ZV9zeXNt
ZW1fcmVzZXQoKTsKIAotICAgIGZvciAocmVnaW9uID0gMDsgcmVnaW9uIDwgbXNnLT5udW1fZmRz
OyByZWdpb24rKykgewotICAgICAgICBnX2F1dG9mcmVlIGNoYXIgKm5hbWU7CisgICAgZm9yIChy
ZWdpb24gPSAwOyByZWdpb24gPCBtc2ctPm51bV9mZHM7IHJlZ2lvbisrLCBzdWZmaXgrKykgewor
ICAgICAgICBnX2F1dG9mcmVlIGNoYXIgKm5hbWUgPSBnX3N0cmR1cF9wcmludGYoInJlbW90ZS1t
ZW0tJXUiLCBzdWZmaXgpOwogICAgICAgICBzdWJyZWdpb24gPSBnX25ldyhNZW1vcnlSZWdpb24s
IDEpOwotICAgICAgICBuYW1lID0gZ19zdHJkdXBfcHJpbnRmKCJyZW1vdGUtbWVtLSV1Iiwgc3Vm
Zml4KyspOwogICAgICAgICBtZW1vcnlfcmVnaW9uX2luaXRfcmFtX2Zyb21fZmQoc3VicmVnaW9u
LCBOVUxMLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmFtZSwgc3lz
bWVtX2luZm8tPnNpemVzW3JlZ2lvbl0sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB0cnVlLCBtc2ctPmZkc1tyZWdpb25dLApkaWZmIC0tZ2l0IGEvaHcvcmVtb3RlL3By
b3h5LmMgYi9ody9yZW1vdGUvcHJveHkuYwppbmRleCA0ZmE0YmUwNzlkLi42ZGRhNzA1ZmMyIDEw
MDY0NAotLS0gYS9ody9yZW1vdGUvcHJveHkuYworKysgYi9ody9yZW1vdGUvcHJveHkuYwpAQCAt
MzQ3LDEzICszNDcsMTIgQEAgc3RhdGljIHZvaWQgcHJvYmVfcGNpX2luZm8oUENJRGV2aWNlICpk
ZXYsIEVycm9yICoqZXJycCkKICAgICAgICAgICAgICAgICAgICBQQ0lfQkFTRV9BRERSRVNTX1NQ
QUNFX0lPIDogUENJX0JBU0VfQUREUkVTU19TUEFDRV9NRU1PUlk7CiAKICAgICAgICAgaWYgKHNp
emUpIHsKLSAgICAgICAgICAgIGdfYXV0b2ZyZWUgY2hhciAqbmFtZTsKKyAgICAgICAgICAgIGdf
YXV0b2ZyZWUgY2hhciAqbmFtZSA9IGdfc3RyZHVwX3ByaW50ZigiYmFyLXJlZ2lvbi0lZCIsIGkp
OwogICAgICAgICAgICAgcGRldi0+cmVnaW9uW2ldLmRldiA9IHBkZXY7CiAgICAgICAgICAgICBw
ZGV2LT5yZWdpb25baV0ucHJlc2VudCA9IHRydWU7CiAgICAgICAgICAgICBpZiAodHlwZSA9PSBQ
Q0lfQkFTRV9BRERSRVNTX1NQQUNFX01FTU9SWSkgewogICAgICAgICAgICAgICAgIHBkZXYtPnJl
Z2lvbltpXS5tZW1vcnkgPSB0cnVlOwogICAgICAgICAgICAgfQotICAgICAgICAgICAgbmFtZSA9
IGdfc3RyZHVwX3ByaW50ZigiYmFyLXJlZ2lvbi0lZCIsIGkpOwogICAgICAgICAgICAgbWVtb3J5
X3JlZ2lvbl9pbml0X2lvKCZwZGV2LT5yZWdpb25baV0ubXIsIE9CSkVDVChwZGV2KSwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcHJveHlfbXJfb3BzLCAmcGRldi0+cmVnaW9u
W2ldLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5hbWUsIHNpemUpOwotLSAK
Mi4zMS4xCgo=


