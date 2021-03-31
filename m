Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE85934FDA0
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 11:59:51 +0200 (CEST)
Received: from localhost ([::1]:45042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXde-000815-U5
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 05:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRXVk-0008PP-Sp
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:51:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRXVd-0001F5-Qu
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617184292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+T0Y4suzH9bAuGQlsJCr4UlfeAbPVFDegeuHhhrGHPA=;
 b=FtUlNGzvtMjvU/298latdfN5k16zgfWGuhp7ODLURX1ITooGaYgdPxJEnYTQuX4LFXVecL
 qs90wevIcxYxR5A8OGQVx322oHAb/sCE70cpMEf7VdyZKKQdU6HoW0nwyIHUyoPFkG3RH6
 /3JBWO0RV6/uHhlo7Zoy2cZdEmm9YzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-IZuWw5bpO7a-eDar2Son3Q-1; Wed, 31 Mar 2021 05:51:28 -0400
X-MC-Unique: IZuWw5bpO7a-eDar2Son3Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 029BC180FCAA;
 Wed, 31 Mar 2021 09:51:27 +0000 (UTC)
Received: from localhost (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4E625F705;
 Wed, 31 Mar 2021 09:51:19 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.0 3/6] coroutine-lock: Store the coroutine in the
 CoWaitRecord only once
Date: Wed, 31 Mar 2021 10:50:56 +0100
Message-Id: <20210331095059.303996-4-stefanha@redhat.com>
In-Reply-To: <20210331095059.303996-1-stefanha@redhat.com>
References: <20210331095059.303996-1-stefanha@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>, Stefan Weil <sw@weilnetz.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogRGF2aWQgRWRtb25kc29uIDxkYXZpZC5lZG1vbmRzb25Ab3JhY2xlLmNvbT4KCldoZW4g
dGFraW5nIHRoZSBzbG93IHBhdGggZm9yIG11dGV4IGFjcXVpc2l0aW9uLCBzZXQgdGhlIGNvcm91
dGluZQp2YWx1ZSBpbiB0aGUgQ29XYWl0UmVjb3JkIGluIHB1c2hfd2FpdGVyKCksIHJhdGhlciB0
aGFuIGJvdGggdGhlcmUgYW5kCmluIHRoZSBjYWxsZXIuCgpSZXZpZXdlZC1ieTogUGFvbG8gQm9u
emluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2aWQgRWRtb25kc29u
IDxkYXZpZC5lZG1vbmRzb25Ab3JhY2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogUGFvbG8gQm9uemlu
aSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KTWVzc2FnZS1pZDogMjAyMTAzMjUxMTI5NDEuMzY1MjM4
LTQtcGJvbnppbmlAcmVkaGF0LmNvbQpNZXNzYWdlLUlkOiA8MjAyMTAzMDkxNDQwMTUuNTU3NDc3
LTQtZGF2aWQuZWRtb25kc29uQG9yYWNsZS5jb20+ClNpZ25lZC1vZmYtYnk6IFBhb2xvIEJvbnpp
bmkgPHBib256aW5pQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8
c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiB1dGlsL3FlbXUtY29yb3V0aW5lLWxvY2suYyB8IDEg
LQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS91dGlsL3FlbXUt
Y29yb3V0aW5lLWxvY2suYyBiL3V0aWwvcWVtdS1jb3JvdXRpbmUtbG9jay5jCmluZGV4IDU4MTZi
Zjg5MDAuLmViNzNjZjExZGMgMTAwNjQ0Ci0tLSBhL3V0aWwvcWVtdS1jb3JvdXRpbmUtbG9jay5j
CisrKyBiL3V0aWwvcWVtdS1jb3JvdXRpbmUtbG9jay5jCkBAIC0yMDQsNyArMjA0LDYgQEAgc3Rh
dGljIHZvaWQgY29yb3V0aW5lX2ZuIHFlbXVfY29fbXV0ZXhfbG9ja19zbG93cGF0aChBaW9Db250
ZXh0ICpjdHgsCiAgICAgdW5zaWduZWQgb2xkX2hhbmRvZmY7CiAKICAgICB0cmFjZV9xZW11X2Nv
X211dGV4X2xvY2tfZW50cnkobXV0ZXgsIHNlbGYpOwotICAgIHcuY28gPSBzZWxmOwogICAgIHB1
c2hfd2FpdGVyKG11dGV4LCAmdyk7CiAKICAgICAvKiBUaGlzIGlzIHRoZSAiUmVzcG9uc2liaWxp
dHkgSGFuZC1PZmYiIHByb3RvY29sOyBhIGxvY2soKSBwaWNrcyBmcm9tCi0tIAoyLjMwLjIKCg==


