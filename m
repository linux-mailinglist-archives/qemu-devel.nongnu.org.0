Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEE834FD8B
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 11:57:25 +0200 (CEST)
Received: from localhost ([::1]:36208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXbI-0004Mz-Ni
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 05:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRXVV-0008C8-QK
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:51:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRXVS-000164-VI
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:51:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617184282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YoVaqoPs4A6987YuUxRT/Rw8lPPxe8ACl9sFBJLCayU=;
 b=CWtaLdayOGWlhY4V1ilK0aOUEl0BxwSZDwC+PMjERgUm09RWFtT/Z0E3/EMVXmEpjXio6v
 UzCkkFUM7MTa6XCKiTnBWjBNm30hFsQ3BK+VHxHOWHSmsd8unePsVEXIgbZG4O+nkNDKva
 QhErs5++0tCzqegyEgBYdmQhwo+og5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-kQlDqS5UMkykWMGuA7opRQ-1; Wed, 31 Mar 2021 05:51:20 -0400
X-MC-Unique: kQlDqS5UMkykWMGuA7opRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93E428030BB;
 Wed, 31 Mar 2021 09:51:18 +0000 (UTC)
Received: from localhost (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F2CE19C44;
 Wed, 31 Mar 2021 09:51:18 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.0 2/6] block/vdi: Don't assume that blocks are larger
 than VdiHeader
Date: Wed, 31 Mar 2021 10:50:55 +0100
Message-Id: <20210331095059.303996-3-stefanha@redhat.com>
In-Reply-To: <20210331095059.303996-1-stefanha@redhat.com>
References: <20210331095059.303996-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>, Stefan Weil <sw@weilnetz.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogRGF2aWQgRWRtb25kc29uIDxkYXZpZC5lZG1vbmRzb25Ab3JhY2xlLmNvbT4KCkdpdmVu
IHRoYXQgdGhlIGJsb2NrIHNpemUgaXMgcmVhZCBmcm9tIHRoZSBoZWFkZXIgb2YgdGhlIFZESSBm
aWxlLCBhCndpZGUgdmFyaWV0eSBvZiBzaXplcyBtaWdodCBiZSBzZWVuLiBSYXRoZXIgdGhhbiBy
ZS11c2luZyBhIGJsb2NrCnNpemVkIG1lbW9yeSByZWdpb24gd2hlbiB3cml0aW5nIHRoZSBWREkg
aGVhZGVyLCBhbGxvY2F0ZSBhbgphcHByb3ByaWF0ZWx5IHNpemVkIGJ1ZmZlci4KClNpZ25lZC1v
ZmYtYnk6IERhdmlkIEVkbW9uZHNvbiA8ZGF2aWQuZWRtb25kc29uQG9yYWNsZS5jb20+ClNpZ25l
ZC1vZmYtYnk6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+CkFja2VkLWJ5OiBN
YXggUmVpdHogPG1yZWl0ekByZWRoYXQuY29tPgpNZXNzYWdlLWlkOiAyMDIxMDMyNTExMjk0MS4z
NjUyMzgtMy1wYm9uemluaUByZWRoYXQuY29tCk1lc3NhZ2UtSWQ6IDwyMDIxMDMwOTE0NDAxNS41
NTc0NzctMy1kYXZpZC5lZG1vbmRzb25Ab3JhY2xlLmNvbT4KQWNrZWQtYnk6IE1heCBSZWl0eiA8
bXJlaXR6QHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IFBhb2xvIEJvbnppbmkgPHBib256aW5p
QHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVk
aGF0LmNvbT4KLS0tCiBibG9jay92ZGkuYyB8IDEwICsrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYmxvY2svdmRp
LmMgYi9ibG9jay92ZGkuYwppbmRleCAyYTZkYzI2MTI0Li41NDhmOGEwNTdiIDEwMDY0NAotLS0g
YS9ibG9jay92ZGkuYworKysgYi9ibG9jay92ZGkuYwpAQCAtNjk2LDE4ICs2OTYsMjAgQEAgbm9u
YWxsb2NhdGluZ193cml0ZToKIAogICAgIGlmIChibG9jaykgewogICAgICAgICAvKiBPbmUgb3Ig
bW9yZSBuZXcgYmxvY2tzIHdlcmUgYWxsb2NhdGVkLiAqLwotICAgICAgICBWZGlIZWFkZXIgKmhl
YWRlciA9IChWZGlIZWFkZXIgKikgYmxvY2s7CisgICAgICAgIFZkaUhlYWRlciAqaGVhZGVyOwog
ICAgICAgICB1aW50OF90ICpiYXNlOwogICAgICAgICB1aW50NjRfdCBvZmZzZXQ7CiAgICAgICAg
IHVpbnQzMl90IG5fc2VjdG9yczsKIAorICAgICAgICBnX2ZyZWUoYmxvY2spOworICAgICAgICBo
ZWFkZXIgPSBnX21hbGxvYyhzaXplb2YoKmhlYWRlcikpOworCiAgICAgICAgIGxvZ291dCgibm93
IHdyaXRpbmcgbW9kaWZpZWQgaGVhZGVyXG4iKTsKICAgICAgICAgYXNzZXJ0KFZESV9JU19BTExP
Q0FURUQoYm1hcF9maXJzdCkpOwogICAgICAgICAqaGVhZGVyID0gcy0+aGVhZGVyOwogICAgICAg
ICB2ZGlfaGVhZGVyX3RvX2xlKGhlYWRlcik7Ci0gICAgICAgIHJldCA9IGJkcnZfcHdyaXRlKGJz
LT5maWxlLCAwLCBibG9jaywgc2l6ZW9mKFZkaUhlYWRlcikpOwotICAgICAgICBnX2ZyZWUoYmxv
Y2spOwotICAgICAgICBibG9jayA9IE5VTEw7CisgICAgICAgIHJldCA9IGJkcnZfcHdyaXRlKGJz
LT5maWxlLCAwLCBoZWFkZXIsIHNpemVvZigqaGVhZGVyKSk7CisgICAgICAgIGdfZnJlZShoZWFk
ZXIpOwogCiAgICAgICAgIGlmIChyZXQgPCAwKSB7CiAgICAgICAgICAgICByZXR1cm4gcmV0Owot
LSAKMi4zMC4yCgo=


