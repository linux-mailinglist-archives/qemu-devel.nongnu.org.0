Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733353C141D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:19:21 +0200 (CEST)
Received: from localhost ([::1]:55530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Tw0-0004j0-HM
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1Tp4-000241-H2
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:12:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1Tp0-0000fF-Kg
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:12:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625749921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=03x1xG7Q6lW/zbtBfeHefd7Fjg4pA2oZfps0DxQm0QQ=;
 b=Q4Qkc9FbUC86SiacLlpAgnqHjS04jlXnEMjcSEzu93H/LCH1mKQeurnVzDT1vpBhaxaGbX
 TyZXG2MalpxOzfWjFHpYapA4tcCnQj616d4XLcG4w5eW4GTClnOv4Rn09JSb9LpS/OZd+M
 dAiFpHfAhUNehMsofmluRQJFLRPB52M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-5LoQgkkiP9OEVe2jLEZOqA-1; Thu, 08 Jul 2021 09:11:59 -0400
X-MC-Unique: 5LoQgkkiP9OEVe2jLEZOqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 639911934100;
 Thu,  8 Jul 2021 13:11:58 +0000 (UTC)
Received: from localhost (ovpn-114-141.ams2.redhat.com [10.36.114.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06D2F19C66;
 Thu,  8 Jul 2021 13:11:57 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 5/5] block/io: Merge discard request alignments
Date: Thu,  8 Jul 2021 14:11:43 +0100
Message-Id: <20210708131143.240647-6-stefanha@redhat.com>
In-Reply-To: <20210708131143.240647-1-stefanha@redhat.com>
References: <20210708131143.240647-1-stefanha@redhat.com>
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
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogQWtpaGlrbyBPZGFraSA8YWtpaGlrby5vZGFraUBnbWFpbC5jb20+CgpTaWduZWQtb2Zm
LWJ5OiBBa2loaWtvIE9kYWtpIDxha2loaWtvLm9kYWtpQGdtYWlsLmNvbT4KTWVzc2FnZS1pZDog
MjAyMTA3MDUxMzA0NTguOTc2NDItMy1ha2loaWtvLm9kYWtpQGdtYWlsLmNvbQpTaWduZWQtb2Zm
LWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogYmxvY2svaW8u
YyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9i
bG9jay9pby5jIGIvYmxvY2svaW8uYwppbmRleCBjZjE3N2E5ZDJkLi5lMGE2ODljNTg0IDEwMDY0
NAotLS0gYS9ibG9jay9pby5jCisrKyBiL2Jsb2NrL2lvLmMKQEAgLTEyNSw2ICsxMjUsOCBAQCB2
b2lkIGJkcnZfcGFyZW50X2RyYWluZWRfYmVnaW5fc2luZ2xlKEJkcnZDaGlsZCAqYywgYm9vbCBw
b2xsKQogCiBzdGF0aWMgdm9pZCBiZHJ2X21lcmdlX2xpbWl0cyhCbG9ja0xpbWl0cyAqZHN0LCBj
b25zdCBCbG9ja0xpbWl0cyAqc3JjKQogeworICAgIGRzdC0+cGRpc2NhcmRfYWxpZ25tZW50ID0g
TUFYKGRzdC0+cGRpc2NhcmRfYWxpZ25tZW50LAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNyYy0+cGRpc2NhcmRfYWxpZ25tZW50KTsKICAgICBkc3QtPm9wdF90cmFuc2ZlciA9
IE1BWChkc3QtPm9wdF90cmFuc2Zlciwgc3JjLT5vcHRfdHJhbnNmZXIpOwogICAgIGRzdC0+bWF4
X3RyYW5zZmVyID0gTUlOX05PTl9aRVJPKGRzdC0+bWF4X3RyYW5zZmVyLCBzcmMtPm1heF90cmFu
c2Zlcik7CiAgICAgZHN0LT5tYXhfaHdfdHJhbnNmZXIgPSBNSU5fTk9OX1pFUk8oZHN0LT5tYXhf
aHdfdHJhbnNmZXIsCi0tIAoyLjMxLjEKCg==


