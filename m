Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1724F24D213
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 12:15:40 +0200 (CEST)
Received: from localhost ([::1]:37190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k945D-00084n-5n
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 06:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k942m-00053h-5t
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:13:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59421
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k942k-0000In-Am
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:13:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598004785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ATVb+MnLS/Fh5QTtjAWEwBNNwPpciuDGYmqtNMOZZDU=;
 b=iTGYB14C1z/tgocbsQddUIrAiVEK+sCx51vMRb0QckBo5hL7YDC3kpJrreP6qBa6cRzcFs
 R2fQ7wXvROhQJEwi2DIcjkJTXbo+bdlAMdDKIlpaOcifCTUsR59PF/GimE6x8n2uT79T0e
 Eiy93BKAvnSm8vYV0OHeuGPTC5h4Gnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-VOkyOVpAOJCieqQEjxYd_w-1; Fri, 21 Aug 2020 06:13:03 -0400
X-MC-Unique: VOkyOVpAOJCieqQEjxYd_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A885D81F02C;
 Fri, 21 Aug 2020 10:13:02 +0000 (UTC)
Received: from localhost (ovpn-113-166.ams2.redhat.com [10.36.113.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42FAB10098AE;
 Fri, 21 Aug 2020 10:12:59 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] fdmon-poll: reset npfd when upgrading to fdmon-epoll
Date: Fri, 21 Aug 2020 11:12:51 +0100
Message-Id: <20200821101252.203056-2-stefanha@redhat.com>
In-Reply-To: <20200821101252.203056-1-stefanha@redhat.com>
References: <20200821101252.203056-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.211.31.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:55:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1,
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
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org, qemu-stable@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bnBmZCBrZWVwcyB0cmFjayBvZiBob3cgbWFueSBwb2xsZmRzIGFyZSBjdXJyZW50bHkgYmVpbmcg
bW9uaXRvcmVkLiBJdAptdXN0IGJlIHJlc2V0IHRvIDAgd2hlbiBmZG1vbl9wb2xsX3dhaXQoKSBy
ZXR1cm5zLgoKV2hlbiBucGZkIHJlYWNoZXMgYSB0cmVzaG9sZCB3ZSBzd2l0Y2ggdG8gZmRtb24t
ZXBvbGwgYmVjYXVzZSBpdCBzY2FsZXMKYmV0dGVyLgoKVGhpcyBwYXRjaCByZXNldHMgbnBmZCBp
biB0aGUgY2FzZSB3aGVyZSB3ZSBzd2l0Y2ggdG8gZmRtb24tZXBvbGwuCkZvcmdldHRpbmcgdG8g
ZG8gc28gcmVzdWx0cyBpbiB0aGUgZm9sbG93aW5nIGFzc2VydGlvbiBmYWlsdXJlOgoKICB1dGls
L2ZkbW9uLXBvbGwuYzo2NTogZmRtb25fcG9sbF93YWl0OiBBc3NlcnRpb24gYG5wZmQgPT0gMCcg
ZmFpbGVkLgoKQnVnbGluazogaHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNn
aT9pZD0xODY5OTUyCkZpeGVzOiAxZjA1MGE0NjkwZjYyYTFlN2RhYmM0ZjQ0MTQxZTlmNzYyYzM3
NjlmICgiYWlvLXBvc2l4OiBleHRyYWN0IHBwb2xsKDIpIGFuZCBlcG9sbCg3KSBmZCBtb25pdG9y
aW5nIikKU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29t
PgotLS0KIHV0aWwvZmRtb24tcG9sbC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKCmRpZmYgLS1naXQgYS91dGlsL2ZkbW9uLXBvbGwuYyBiL3V0aWwvZmRtb24tcG9sbC5j
CmluZGV4IDQ4ODA2N2I2NzkuLjVmZTNiNDc4NjUgMTAwNjQ0Ci0tLSBhL3V0aWwvZmRtb24tcG9s
bC5jCisrKyBiL3V0aWwvZmRtb24tcG9sbC5jCkBAIC03Myw2ICs3Myw3IEBAIHN0YXRpYyBpbnQg
ZmRtb25fcG9sbF93YWl0KEFpb0NvbnRleHQgKmN0eCwgQWlvSGFuZGxlckxpc3QgKnJlYWR5X2xp
c3QsCiAKICAgICAvKiBlcG9sbCg3KSBpcyBmYXN0ZXIgYWJvdmUgYSBjZXJ0YWluIG51bWJlciBv
ZiBmZHMgKi8KICAgICBpZiAoZmRtb25fZXBvbGxfdHJ5X3VwZ3JhZGUoY3R4LCBucGZkKSkgewor
ICAgICAgICBucGZkID0gMDsgLyogd2Ugd29uJ3QgbmVlZCBwb2xsZmRzW10sIHJlc2V0IG5wZmQg
Ki8KICAgICAgICAgcmV0dXJuIGN0eC0+ZmRtb25fb3BzLT53YWl0KGN0eCwgcmVhZHlfbGlzdCwg
dGltZW91dCk7CiAgICAgfQogCi0tIAoyLjI2LjIKCg==


