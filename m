Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECD43D5980
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:29:52 +0200 (CEST)
Received: from localhost ([::1]:51042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7zjz-0001Wi-GJ
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m7zj1-0000aT-6a
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:28:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m7ziz-0007nN-2F
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627302528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mp4ubmuRwJfgQpPqzsxHIpFw60DKCsKYP1z8mt/ql8U=;
 b=P/6iLJ2DXNiC0rX7j0GbtgHdM1Jq34q41DetBzA+SC/J9JiuTeI2MINCXRHXa9gNCUG9Dg
 llvcLvbLcQmTBFz2EM0u4WKZDYBDR4C6l1iNjTtU6+0MnNI/pRRgo63r/ZXo/+Kqkjl8hY
 KylfYiLw/Nmn7fb1clt93kJt+/08dgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-3j61S3p0M0KgnHw4Fjl90Q-1; Mon, 26 Jul 2021 08:28:44 -0400
X-MC-Unique: 3j61S3p0M0KgnHw4Fjl90Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 217AE80292B;
 Mon, 26 Jul 2021 12:28:44 +0000 (UTC)
Received: from localhost (ovpn-113-151.ams2.redhat.com [10.36.113.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36D5C3AC0;
 Mon, 26 Jul 2021 12:28:39 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] raw-format: drop WRITE and RESIZE child perms when possible
Date: Mon, 26 Jul 2021 13:28:39 +0100
Message-Id: <20210726122839.822900-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, afrosi@redhat.com,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjb21tYW5kLWxpbmUgZmFpbHMgZHVlIHRvIGEgcGVybWlzc2lvbnMgY29u
ZmxpY3Q6CgogICQgcWVtdS1zdG9yYWdlLWRhZW1vbiBcCiAgICAgIC0tYmxvY2tkZXYgZHJpdmVy
PW52bWUsbm9kZS1uYW1lPW52bWUwLGRldmljZT0wMDAwOjA4OjAwLjAsbmFtZXNwYWNlPTEgXAog
ICAgICAtLWJsb2NrZGV2IGRyaXZlcj1yYXcsbm9kZS1uYW1lPWwxLTEsZmlsZT1udm1lMCxvZmZz
ZXQ9MCxzaXplPTEwNzM3NDE4MjQgXAogICAgICAtLWJsb2NrZGV2IGRyaXZlcj1yYXcsbm9kZS1u
YW1lPWwxLTIsZmlsZT1udm1lMCxvZmZzZXQ9MTA3Mzc0MTgyNCxzaXplPTEwNzM3NDE4MjQgXAog
ICAgICAtLW5iZC1zZXJ2ZXIgYWRkci50eXBlPXVuaXgsYWRkci5wYXRoPS90bXAvbmJkLnNvY2ss
bWF4LWNvbm5lY3Rpb25zPTIgXAogICAgICAtLWV4cG9ydCB0eXBlPW5iZCxpZD1uYmQtbDEtMSxu
b2RlLW5hbWU9bDEtMSxuYW1lPWwxLTEsd3JpdGFibGU9b24gXAogICAgICAtLWV4cG9ydCB0eXBl
PW5iZCxpZD1uYmQtbDEtMixub2RlLW5hbWU9bDEtMixuYW1lPWwxLTIsd3JpdGFibGU9b24KCiAg
cWVtdS1zdG9yYWdlLWRhZW1vbjogLS1leHBvcnQgdHlwZT1uYmQsaWQ9bmJkLWwxLTEsbm9kZS1u
YW1lPWwxLTEsbmFtZT1sMS0xLHdyaXRhYmxlPW9uOiBQZXJtaXNzaW9uIGNvbmZsaWN0IG9uIG5v
ZGUgJ252bWUwJzogcGVybWlzc2lvbnMgJ3Jlc2l6ZScgYXJlIGJvdGggcmVxdWlyZWQgYnkgbm9k
ZSAnbDEtMScgKHVzZXMgbm9kZSAnbnZtZTAnIGFzICdmaWxlJyBjaGlsZCkgYW5kIHVuc2hhcmVk
IGJ5IG5vZGUgJ2wxLTInICh1c2VzIG5vZGUgJ252bWUwJyBhcyAnZmlsZScgY2hpbGQpLgoKVGhl
IHByb2JsZW0gaXMgdGhhdCBibG9jay9yYXctZm9ybWF0LmMgcmVsaWVzIG9uIGJkcnZfZGVmYXVs
dF9wZXJtcygpIHRvCnNldCBwZXJtaXNzaW9ucyBvbiB0aGUgbnZtZSBub2RlLiBUaGUgZGVmYXVs
dCBwZXJtaXNzaW9ucyBhZGQgUkVTSVpFIGluCmFudGljaXBhdGlvbiBvZiBhIGZvcm1hdCBkcml2
ZXIgbGlrZSBxY293MiB0aGF0IG5lZWRzIHRvIGdyb3cgdGhlIGltYWdlCmZpbGUuIFRoaXMgZmFp
bHMgYmVjYXVzZSBSRVNJWkUgaXMgdW5zaGFyZWQsIHNvIHdlIGNhbm5vdCBnZXQgdGhlIFJFU0la
RQpwZXJtaXNzaW9uLgoKTWF4IFJlaXR6IHBvaW50ZWQgb3V0IHRoYXQgYmxvY2svY3J5cHRvLmMg
YWxyZWFkeSBoYW5kbGVzIHRoaXMgY2FzZSBieQppbXBsZW1lbnRpbmcgYSBjdXN0b20gLT5iZHJ2
X2NoaWxkX3Blcm0oKSBmdW5jdGlvbiB0aGF0IGFkanVzdHMgdGhlCnJlc3VsdCBvZiBiZHJ2X2Rl
ZmF1bHRfcGVybXMoKS4KClRoaXMgcGF0Y2ggdGFrZXMgdGhlIHNhbWUgYXBwcm9hY2ggaW4gYmxv
Y2svcmF3LWZvcm1hdC5jIHNvIHRoYXQgUkVTSVpFCmlzIG9ubHkgcmVxdWlyZWQgaWYgaXQncyBh
Y3R1YWxseSBuZWNlc3NhcnkgKGUuZy4gdGhlIHBhcmVudCBpcyBxY293MikuCgpDYzogTWF4IFJl
aXR6IDxtcmVpdHpAcmVkaGF0LmNvbT4KQ2M6IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+
ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0t
ClRoaXMgaXMgbm90IGEgYnVnIGZpeCwgc28gSSBkaWRuJ3QgbWFyayBpdCBmb3IgUUVNVSA2LjEu
IEl0J3MgbmV3CmJlaGF2aW9yIHRoYXQgaGFzbid0IGJlZW4gc3VwcG9ydGVkIGJlZm9yZS4gSSB3
YW50IHRvIHNwbGl0IGFuIE5WTWUKZHJpdmUgdXNpbmcgdGhlIHJhdyBmb3JtYXQncyBvZmZzZXQ9
L3NpemU9IGZlYXR1cmUuCi0tLQogYmxvY2svcmF3LWZvcm1hdC5jIHwgMjEgKysrKysrKysrKysr
KysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2Jsb2NrL3Jhdy1mb3JtYXQuYyBiL2Jsb2NrL3Jhdy1mb3JtYXQuYwpp
bmRleCA3NzE3NTc4ZWQ2Li5jMjZmNDkzNjg4IDEwMDY0NAotLS0gYS9ibG9jay9yYXctZm9ybWF0
LmMKKysrIGIvYmxvY2svcmF3LWZvcm1hdC5jCkBAIC01ODAsNiArNTgwLDI1IEBAIHN0YXRpYyB2
b2lkIHJhd19jYW5jZWxfaW5fZmxpZ2h0KEJsb2NrRHJpdmVyU3RhdGUgKmJzKQogICAgIGJkcnZf
Y2FuY2VsX2luX2ZsaWdodChicy0+ZmlsZS0+YnMpOwogfQogCitzdGF0aWMgdm9pZCByYXdfY2hp
bGRfcGVybShCbG9ja0RyaXZlclN0YXRlICpicywgQmRydkNoaWxkICpjLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgQmRydkNoaWxkUm9sZSByb2xlLAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgQmxvY2tSZW9wZW5RdWV1ZSAqcmVvcGVuX3F1ZXVlLAorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdWludDY0X3QgcGFyZW50X3Blcm0sIHVpbnQ2NF90IHBhcmVudF9zaGFyZWQsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCAqbnBlcm0sIHVpbnQ2NF90ICpuc2hh
cmVkKQoreworICAgIGJkcnZfZGVmYXVsdF9wZXJtcyhicywgYywgcm9sZSwgcmVvcGVuX3F1ZXVl
LCBwYXJlbnRfcGVybSwKKyAgICAgICAgICAgICAgICAgICAgICAgcGFyZW50X3NoYXJlZCwgbnBl
cm0sIG5zaGFyZWQpOworCisgICAgLyoKKyAgICAgKiBiZHJ2X2RlZmF1bHRfcGVybXMoKSBtYXkg
YWRkIFdSSVRFIGFuZC9vciBSRVNJWkUgKHNlZSBjb21tZW50IGluCisgICAgICogYmRydl9kZWZh
dWx0X3Blcm1zX2Zvcl9zdG9yYWdlKCkgZm9yIGFuIGV4cGxhbmF0aW9uKSBidXQgd2Ugb25seSBu
ZWVkCisgICAgICogdGhlbSBpZiB0aGV5IGFyZSBpbiBwYXJlbnRfcGVybS4gRHJvcCBXUklURSBh
bmQgUkVTSVpFIHdoZW5ldmVyIHBvc3NpYmxlCisgICAgICogdG8gYXZvaWQgcGVybWlzc2lvbiBj
b25mbGljdHMuCisgICAgICovCisgICAgKm5wZXJtICY9IH4oQkxLX1BFUk1fV1JJVEUgfCBCTEtf
UEVSTV9SRVNJWkUpOworICAgICpucGVybSB8PSBwYXJlbnRfcGVybSAmIChCTEtfUEVSTV9XUklU
RSB8IEJMS19QRVJNX1JFU0laRSk7Cit9CisKIEJsb2NrRHJpdmVyIGJkcnZfcmF3ID0gewogICAg
IC5mb3JtYXRfbmFtZSAgICAgICAgICA9ICJyYXciLAogICAgIC5pbnN0YW5jZV9zaXplICAgICAg
ICA9IHNpemVvZihCRFJWUmF3U3RhdGUpLApAQCAtNTg4LDcgKzYwNyw3IEBAIEJsb2NrRHJpdmVy
IGJkcnZfcmF3ID0gewogICAgIC5iZHJ2X3Jlb3Blbl9jb21taXQgICA9ICZyYXdfcmVvcGVuX2Nv
bW1pdCwKICAgICAuYmRydl9yZW9wZW5fYWJvcnQgICAgPSAmcmF3X3Jlb3Blbl9hYm9ydCwKICAg
ICAuYmRydl9vcGVuICAgICAgICAgICAgPSAmcmF3X29wZW4sCi0gICAgLmJkcnZfY2hpbGRfcGVy
bSAgICAgID0gYmRydl9kZWZhdWx0X3Blcm1zLAorICAgIC5iZHJ2X2NoaWxkX3Blcm0gICAgICA9
IHJhd19jaGlsZF9wZXJtLAogICAgIC5iZHJ2X2NvX2NyZWF0ZV9vcHRzICA9ICZyYXdfY29fY3Jl
YXRlX29wdHMsCiAgICAgLmJkcnZfY29fcHJlYWR2ICAgICAgID0gJnJhd19jb19wcmVhZHYsCiAg
ICAgLmJkcnZfY29fcHdyaXRldiAgICAgID0gJnJhd19jb19wd3JpdGV2LAotLSAKMi4zMS4xCgo=


