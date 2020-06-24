Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B7B2070B4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 12:05:13 +0200 (CEST)
Received: from localhost ([::1]:45200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo2HI-00059O-Da
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 06:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jo2F2-0001xU-RL
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:02:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29401
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jo2F1-0003gK-2h
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:02:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592992970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fcfJpMktAhCTkb8ZUD6UgIjHN+llwqaMaeBYBwKZ4OQ=;
 b=iRfXy+5DtR8bZoi2lTrd3c/yUzrfqVeSWtAkbUxOfSi3q4dbBiqq2MUzt55Lfh3xmulizo
 H+BuZBM33oUm/vr4x44md5ERtNzA/P1wyw88L4wQn4PA4GX8qOzyYvQTvx6SgC7m6Tbciv
 Cwym3y4uwA49vBf2hUYkfhvl6Xv/Umg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-yBa_nef-PkiejBJWsfrykQ-1; Wed, 24 Jun 2020 06:02:48 -0400
X-MC-Unique: yBa_nef-PkiejBJWsfrykQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54EDA10059B7;
 Wed, 24 Jun 2020 10:02:47 +0000 (UTC)
Received: from localhost (ovpn-114-150.ams2.redhat.com [10.36.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 886FB1010404;
 Wed, 24 Jun 2020 10:02:40 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/12] block/nvme: poll queues without q->lock
Date: Wed, 24 Jun 2020 11:02:04 +0100
Message-Id: <20200624100210.59975-7-stefanha@redhat.com>
In-Reply-To: <20200624100210.59975-1-stefanha@redhat.com>
References: <20200624100210.59975-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.211.31.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Sergio Lopez <slp@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QSBsb3Qgb2YgQ1BVIHRpbWUgaXMgc3BlbnQgc2ltcGx5IGxvY2tpbmcvdW5sb2NraW5nIHEtPmxv
Y2sgZHVyaW5nCnBvbGxpbmcuIENoZWNrIGZvciBjb21wbGV0aW9uIG91dHNpZGUgdGhlIGxvY2sg
dG8gbWFrZSBxLT5sb2NrIGRpc2FwcGVhcgpmcm9tIHRoZSBwcm9maWxlLgoKU2lnbmVkLW9mZi1i
eTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogU2Vy
Z2lvIExvcGV6IDxzbHBAcmVkaGF0LmNvbT4KTWVzc2FnZS1pZDogMjAyMDA2MTcxMzIyMDEuMTgz
MjE1Mi0yLXN0ZWZhbmhhQHJlZGhhdC5jb20KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3pp
IDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIGJsb2NrL252bWUuYyB8IDEyICsrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9ibG9jay9u
dm1lLmMgYi9ibG9jay9udm1lLmMKaW5kZXggZWIyZjU0ZGQ5ZC4uZTQzNzVlYzI0NSAxMDA2NDQK
LS0tIGEvYmxvY2svbnZtZS5jCisrKyBiL2Jsb2NrL252bWUuYwpAQCAtNTEyLDYgKzUxMiwxOCBA
QCBzdGF0aWMgYm9vbCBudm1lX3BvbGxfcXVldWVzKEJEUlZOVk1lU3RhdGUgKnMpCiAKICAgICBm
b3IgKGkgPSAwOyBpIDwgcy0+bnJfcXVldWVzOyBpKyspIHsKICAgICAgICAgTlZNZVF1ZXVlUGFp
ciAqcSA9IHMtPnF1ZXVlc1tpXTsKKyAgICAgICAgY29uc3Qgc2l6ZV90IGNxZV9vZmZzZXQgPSBx
LT5jcS5oZWFkICogTlZNRV9DUV9FTlRSWV9CWVRFUzsKKyAgICAgICAgTnZtZUNxZSAqY3FlID0g
KE52bWVDcWUgKikmcS0+Y3EucXVldWVbY3FlX29mZnNldF07CisKKyAgICAgICAgLyoKKyAgICAg
ICAgICogRG8gYW4gZWFybHkgY2hlY2sgZm9yIGNvbXBsZXRpb25zLiBxLT5sb2NrIGlzbid0IG5l
ZWRlZCBiZWNhdXNlCisgICAgICAgICAqIG52bWVfcHJvY2Vzc19jb21wbGV0aW9uKCkgb25seSBy
dW5zIGluIHRoZSBldmVudCBsb29wIHRocmVhZCBhbmQKKyAgICAgICAgICogY2Fubm90IHJhY2Ug
d2l0aCBpdHNlbGYuCisgICAgICAgICAqLworICAgICAgICBpZiAoKGxlMTZfdG9fY3B1KGNxZS0+
c3RhdHVzKSAmIDB4MSkgPT0gcS0+Y3FfcGhhc2UpIHsKKyAgICAgICAgICAgIGNvbnRpbnVlOwor
ICAgICAgICB9CisKICAgICAgICAgcWVtdV9tdXRleF9sb2NrKCZxLT5sb2NrKTsKICAgICAgICAg
d2hpbGUgKG52bWVfcHJvY2Vzc19jb21wbGV0aW9uKHMsIHEpKSB7CiAgICAgICAgICAgICAvKiBL
ZWVwIHBvbGxpbmcgKi8KLS0gCjIuMjYuMgoK


