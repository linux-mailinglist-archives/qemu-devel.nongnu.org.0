Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE00D2070C9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 12:07:07 +0200 (CEST)
Received: from localhost ([::1]:54546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo2J8-0001Sm-Uy
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 06:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jo2FO-0002la-OE
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:03:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42776
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jo2FL-0003po-Jb
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592992990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aK8ekwRHGaQX1JqA3rLumYthk8cTBv5YEUllToKlji4=;
 b=Wwkh0xRxKuCdIk2VHk/sZnnB7uJmwVOkuw4OF3Bj/iFqplL7igEJOCiLBoFVMs7Ut5Wsi8
 L94KgQEvS6XIP9kZRafCkoll3qEeFSaDZWGo4vGBrNhb1BYQ6WYI1t984keofrdBAK2FBl
 4wKchGp3lsRItlClyHDEuzMwT/ODHyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-EOvOeq4UPm-_HPAuF0qMqg-1; Wed, 24 Jun 2020 06:03:08 -0400
X-MC-Unique: EOvOeq4UPm-_HPAuF0qMqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98445107ACCA;
 Wed, 24 Jun 2020 10:03:07 +0000 (UTC)
Received: from localhost (ovpn-114-150.ams2.redhat.com [10.36.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DBCF61169;
 Wed, 24 Jun 2020 10:03:01 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/12] block/nvme: clarify that free_req_queue is protected by
 q->lock
Date: Wed, 24 Jun 2020 11:02:08 +0100
Message-Id: <20200624100210.59975-11-stefanha@redhat.com>
In-Reply-To: <20200624100210.59975-1-stefanha@redhat.com>
References: <20200624100210.59975-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.211.31.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RXhpc3RpbmcgdXNlcnMgYWNjZXNzIGZyZWVfcmVxX3F1ZXVlIHVuZGVyIHEtPmxvY2suIERvY3Vt
ZW50IHRoaXMuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhh
dC5jb20+ClJldmlld2VkLWJ5OiBTZXJnaW8gTG9wZXogPHNscEByZWRoYXQuY29tPgpSZXZpZXdl
ZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgpNZXNzYWdl
LWlkOiAyMDIwMDYxNzEzMjIwMS4xODMyMTUyLTYtc3RlZmFuaGFAcmVkaGF0LmNvbQpTaWduZWQt
b2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogYmxvY2sv
bnZtZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvYmxvY2svbnZtZS5jIGIvYmxvY2svbnZtZS5jCmluZGV4IDhlNjA4
ODJhZjMuLjQyNmM3N2U1YWIgMTAwNjQ0Ci0tLSBhL2Jsb2NrL252bWUuYworKysgYi9ibG9jay9u
dm1lLmMKQEAgLTU3LDcgKzU3LDYgQEAgdHlwZWRlZiBzdHJ1Y3QgewogfSBOVk1lUmVxdWVzdDsK
IAogdHlwZWRlZiBzdHJ1Y3QgewotICAgIENvUXVldWUgICAgIGZyZWVfcmVxX3F1ZXVlOwogICAg
IFFlbXVNdXRleCAgIGxvY2s7CiAKICAgICAvKiBGaWVsZHMgcHJvdGVjdGVkIGJ5IEJRTCAqLwpA
QCAtNjUsNiArNjQsNyBAQCB0eXBlZGVmIHN0cnVjdCB7CiAgICAgdWludDhfdCAgICAgKnBycF9s
aXN0X3BhZ2VzOwogCiAgICAgLyogRmllbGRzIHByb3RlY3RlZCBieSBAbG9jayAqLworICAgIENv
UXVldWUgICAgIGZyZWVfcmVxX3F1ZXVlOwogICAgIE5WTWVRdWV1ZSAgIHNxLCBjcTsKICAgICBp
bnQgICAgICAgICBjcV9waGFzZTsKICAgICBpbnQgICAgICAgICBmcmVlX3JlcV9oZWFkOwotLSAK
Mi4yNi4yCgo=


