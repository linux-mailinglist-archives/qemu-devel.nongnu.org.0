Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7603D200848
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 14:03:03 +0200 (CEST)
Received: from localhost ([::1]:44340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmFja-00068s-ET
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 08:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jmFhs-0004gJ-2E
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 08:01:17 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:30009
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jmFhp-0006bO-9L
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 08:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592568071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vu/e2YN0cWmt3Ppx+qvnIOK08pnjIL49S8tGrixieWk=;
 b=CStXFMTMvmjU2jdRVNm8WlGPQwYmayXwEp5m+BwS8cXYBtLO9qfN6CiBozlSQh5b/HDnX8
 8SS4AANgzKHbDFdITs9lZaJ35hicrpnegM89h2n4GzvUQPiBy8DRDpO4JMqet61z7GryOS
 xoV4mPSjWGi7cd560IbeivinnuqxLes=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-5L9uBSPcP-ukJUL_16CGig-1; Fri, 19 Jun 2020 08:01:08 -0400
X-MC-Unique: 5L9uBSPcP-ukJUL_16CGig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E30A38035D2;
 Fri, 19 Jun 2020 12:01:07 +0000 (UTC)
Received: from localhost (ovpn-113-212.ams2.redhat.com [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BDCA7C1EE;
 Fri, 19 Jun 2020 12:01:04 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Coiby Xu <coiby.xu@gmail.com>
Subject: [PATCH 1/6] vhost-user-server: fix VHOST_MEMORY_MAX_REGIONS compiler
 error
Date: Fri, 19 Jun 2020 13:00:41 +0100
Message-Id: <20200619120046.2422205-1-stefanha@redhat.com>
In-Reply-To: <20200614183907.514282-3-coiby.xu@gmail.com>
References: <20200614183907.514282-3-coiby.xu@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.211.31.81; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 01:50:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: kwolf@redhat.com, bharatlkmlkvm@gmail.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q29tbWl0IGI2NTBkNWY0YjFjZDNmOWY4YzRmZGIzMTk4MzhjNWMxZTA2OTVlNDEgKCJMaWZ0IG1h
eCByYW0gc2xvdHMKbGltaXQgaW4gbGlidmhvc3QtdXNlciIpIHJlbmFtZWQgdGhpcyBjb25zdGFu
dC4gVXNlIHRoZSBhcnJheSBzaXplCmluc3RlYWQgb2YgaGFyZC1jb2RpbmcgYSBwYXJ0aWN1bGFy
IGNvbnN0YW50IGluIHRoZSBlcnJvciBtZXNzYWdlLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhh
am5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIHV0aWwvdmhvc3QtdXNlci1zZXJ2ZXIu
YyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS91dGlsL3Zob3N0LXVzZXItc2VydmVyLmMgYi91dGlsL3Zob3N0LXVz
ZXItc2VydmVyLmMKaW5kZXggMzkzYmVlYjZiOS4uZTk0YThkOGE4MyAxMDA2NDQKLS0tIGEvdXRp
bC92aG9zdC11c2VyLXNlcnZlci5jCisrKyBiL3V0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuYwpAQCAt
MTM3LDkgKzEzNyw5IEBAIHZ1X21lc3NhZ2VfcmVhZChWdURldiAqdnVfZGV2LCBpbnQgY29ubl9m
ZCwgVmhvc3RVc2VyTXNnICp2bXNnKQogICAgICAgICByZWFkX2J5dGVzICs9IHJjOwogICAgICAg
ICBpZiAobmZkc190ID4gMCkgewogICAgICAgICAgICAgaWYgKG5mZHMgKyBuZmRzX3QgPiBHX05f
RUxFTUVOVFModm1zZy0+ZmRzKSkgewotICAgICAgICAgICAgICAgIGVycm9yX3JlcG9ydCgiQSBt
YXhpbXVtIG9mICVkIGZkcyBhcmUgYWxsb3dlZCwgIgorICAgICAgICAgICAgICAgIGVycm9yX3Jl
cG9ydCgiQSBtYXhpbXVtIG9mICV6dSBmZHMgYXJlIGFsbG93ZWQsICIKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgImhvd2V2ZXIgZ290ICVsdSBmZHMgbm93IiwKLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgVkhPU1RfTUVNT1JZX01BWF9OUkVHSU9OUywgbmZkcyArIG5mZHNfdCk7
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdfTl9FTEVNRU5UUyh2bXNnLT5mZHMpLCBu
ZmRzICsgbmZkc190KTsKICAgICAgICAgICAgICAgICBnb3RvIGZhaWw7CiAgICAgICAgICAgICB9
CiAgICAgICAgICAgICBtZW1jcHkodm1zZy0+ZmRzICsgbmZkcywgZmRzX3QsCi0tIAoyLjI2LjIK
Cg==


