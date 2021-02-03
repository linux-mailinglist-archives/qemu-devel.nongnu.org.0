Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F9230D8E6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 12:40:40 +0100 (CET)
Received: from localhost ([::1]:53004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7GWV-0001Gv-C3
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 06:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7GTY-0006Sr-5Z
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:37:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7GTW-0006sN-Lm
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:37:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612352253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7UgtqJh8shH6LnZBT2YWFJLGzV2O2mRyyLonmsjOnLE=;
 b=Ske9+KD8zr9lKaYfNPFv4v2wmFD9yuiFGUD+kC53zM2dafng/q+haqIeYbthJibyav52jR
 hrKEhBLweLeh4zvNlkYFOr3q2Hg/h8jZ4akAeZvY5Vj6aLkm4L4IryowMUzSOasmzv4LmR
 kCfaLPdu2yoc5o6/YzUMCNPbqywL2Hs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-GGSRR82xPWmeReJckIpThw-1; Wed, 03 Feb 2021 06:37:31 -0500
X-MC-Unique: GGSRR82xPWmeReJckIpThw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F10B85B664;
 Wed,  3 Feb 2021 11:37:30 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F110C5D9E3;
 Wed,  3 Feb 2021 11:37:20 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Date: Wed,  3 Feb 2021 11:37:16 +0000
Message-Id: <20210203113719.83633-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mszeredi@redhat.com, Daniel Berrange <berrange@redhat.com>, slp@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com, Alex Xu <alex@alxu.ca>,
 Stefan Hajnoczi <stefanha@redhat.com>, P J P <ppandit@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

djM6DQogKiBSZXN0cnVjdHVyZSBsb19jcmVhdGUoKSB0byBoYW5kbGUgZXh0ZXJuYWxseS1jcmVh
dGVkIGZpbGVzICh3ZSBuZWVkDQogICB0byBhbGxvY2F0ZSBhbiBpbm9kZSBmb3IgdGhlbSkgW0dy
ZWddDQogKiBQYXRjaCAxICYgMiByZWZhY3RvciB0aGUgY29kZSBzbyB0aGF0IFBhdGNoIDMgY2Fu
IGltcGxlbWVudCB0aGUgQ1ZFIGZpeA0KdjM6DQogKiBQcm90ZWN0IGxvX2NyZWF0ZSgpIFtHcmVn
XQ0KdjI6DQogKiBBZGQgZG9jIGNvbW1lbnQgY2xhcmlmeWluZyB0aGF0IHN5bWxpbmtzIGFyZSB0
cmF2ZXJzZWQgY2xpZW50LXNpZGUNCiAgIFtEYW5pZWxdDQoNCkEgd2VsbC1iZWhhdmVkIEZVU0Ug
Y2xpZW50IGRvZXMgbm90IGF0dGVtcHQgdG8gb3BlbiBzcGVjaWFsIGZpbGVzIHdpdGgNCkZVU0Vf
T1BFTiBiZWNhdXNlIHRoZXkgYXJlIGhhbmRsZWQgb24gdGhlIGNsaWVudCBzaWRlIChlLmcuIGRl
dmljZSBub2Rlcw0KYXJlIGhhbmRsZWQgYnkgY2xpZW50LXNpZGUgZGV2aWNlIGRyaXZlcnMpLg0K
DQpUaGUgY2hlY2sgdG8gcHJldmVudCB2aXJ0aW9mc2QgZnJvbSBvcGVuaW5nIHNwZWNpYWwgZmls
ZXMgaXMgbWlzc2luZyBpbg0KYSBmZXcgY2FzZXMsIG1vc3Qgbm90YWJseSBGVVNFX09QRU4uIEEg
bWFsaWNpb3VzIGNsaWVudCBjYW4gY2F1c2UNCnZpcnRpb2ZzZCB0byBvcGVuIGEgZGV2aWNlIG5v
ZGUsIHBvdGVudGlhbGx5IGFsbG93aW5nIHRoZSBndWVzdCB0bw0KZXNjYXBlLiBUaGlzIGNhbiBi
ZSBleHBsb2l0ZWQgYnkgYSBtb2RpZmllZCBndWVzdCBkZXZpY2UgZHJpdmVyLiBJdCBpcw0Kbm90
IGV4cGxvaXRhYmxlIGZyb20gZ3Vlc3QgdXNlcnNwYWNlIHNpbmNlIHRoZSBndWVzdCBrZXJuZWwg
d2lsbCBoYW5kbGUNCnNwZWNpYWwgZmlsZXMgaW5zaWRlIHRoZSBndWVzdCBpbnN0ZWFkIG9mIHNl
bmRpbmcgRlVTRSByZXF1ZXN0cy4NCg0KVGhpcyBwYXRjaCBzZXJpZXMgZml4ZXMgdGhpcyBpc3N1
ZSBieSBpbnRyb2R1Y2luZyB0aGUgbG9faW5vZGVfb3BlbigpIGZ1bmN0aW9uDQp0byBjaGVjayB0
aGUgZmlsZSB0eXBlIGJlZm9yZSBvcGVuaW5nIGl0LiBUaGlzIGlzIGEgc2hvcnQtdGVybSBzb2x1
dGlvbiBiZWNhdXNlDQppdCBkb2VzIG5vdCBwcmV2ZW50IGEgY29tcHJvbWlzZWQgdmlydGlvZnNk
IHByb2Nlc3MgZnJvbSBvcGVuaW5nIGRldmljZSBub2Rlcw0Kb24gdGhlIGhvc3QuDQoNClRoaXMg
aXNzdWUgd2FzIGRpYWdub3NlZCBvbiBwdWJsaWMgSVJDIGFuZCBpcyB0aGVyZWZvcmUgYWxyZWFk
eSBrbm93bg0KYW5kIG5vdCBlbWJhcmdvZWQuDQoNClJlcG9ydGVkLWJ5OiBBbGV4IFh1IDxhbGV4
QGFseHUuY2E+DQpGaXhlczogQ1ZFLTIwMjAtMzU1MTcNCg0KU3RlZmFuIEhham5vY3ppICgzKToN
CiAgdmlydGlvZnNkOiBleHRyYWN0IGxvX2RvX29wZW4oKSBmcm9tIGxvX29wZW4oKQ0KICB2aXJ0
aW9mc2Q6IG9wdGlvbmFsbHkgcmV0dXJuIGlub2RlIHBvaW50ZXIgZnJvbSBsb19kb19sb29rdXAo
KQ0KICB2aXJ0aW9mc2Q6IHByZXZlbnQgb3BlbmluZyBvZiBzcGVjaWFsIGZpbGVzIChDVkUtMjAy
MC0zNTUxNykNCg0KIHRvb2xzL3ZpcnRpb2ZzZC9wYXNzdGhyb3VnaF9sbC5jIHwgMjIxICsrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMTQ1IGluc2VydGlv
bnMoKyksIDc2IGRlbGV0aW9ucygtKQ0KDQotLSANCjIuMjkuMg0KDQo=


