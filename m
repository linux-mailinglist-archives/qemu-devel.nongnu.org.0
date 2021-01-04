Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2C32E9765
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 15:36:18 +0100 (CET)
Received: from localhost ([::1]:43648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwQy1-0008FI-GW
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 09:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwQuB-0006O1-9h
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 09:32:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwQu9-000115-DN
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 09:32:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609770736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6tWCWCOLGkXyGUfh+u9khJvMWhDNT7Dc8hK3fzeKu4c=;
 b=fjIglMQPcRPs5PYy3l8GAHukAUw8fn+rMnHV3KpVw08qftyNS1CbMo01R7ywQNCb3IRRDb
 qI/ipLCaYVUjq3RKGtcE//cjKXQmlakNfEW4IGubIpr2jWOHbEjthsToRFwwu/oC4skTqK
 dhwARIG3GYmzBSI0a0mnlwZ76G9ifJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-8QCs-Um8MSuaQdclRxzVUQ-1; Mon, 04 Jan 2021 09:32:14 -0500
X-MC-Unique: 8QCs-Um8MSuaQdclRxzVUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B7F4107ACE3;
 Mon,  4 Jan 2021 14:32:13 +0000 (UTC)
Received: from localhost (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E50D71042A83;
 Mon,  4 Jan 2021 14:32:09 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] tracetool: add out_lineno and out_next_lineno to out()
Date: Mon,  4 Jan 2021 14:31:52 +0000
Message-Id: <20210104143154.462212-4-stefanha@redhat.com>
In-Reply-To: <20210104143154.462212-1-stefanha@redhat.com>
References: <20210104143154.462212-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TWFrZSB0aGUgb3V0cHV0IGZpbGUgbGluZSBudW1iZXIgYW5kIG5leHQgbGluZSBudW1iZXIgYXZh
aWxhYmxlIHRvCm91dCgpLgoKQSBsYXRlciBwYXRjaCB3aWxsIHVzZSB0aGlzIHRvIGltcHJvdmUg
ZXJyb3IgbWVzc2FnZXMuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhh
QHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxp
bmFyby5vcmc+Ck1lc3NhZ2UtSWQ6IDwyMDIwMDgyNzE0MjkxNS4xMDg3MzAtMy1zdGVmYW5oYUBy
ZWRoYXQuY29tPgotLS0KIHNjcmlwdHMvdHJhY2V0b29sL19faW5pdF9fLnB5IHwgMTAgKysrKysr
KysrLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL3NjcmlwdHMvdHJhY2V0b29sL19faW5pdF9fLnB5IGIvc2NyaXB0cy90cmFjZXRv
b2wvX19pbml0X18ucHkKaW5kZXggYTYwMTMzODlhMC4uZGE1MDA0ZWE0NSAxMDA2NDQKLS0tIGEv
c2NyaXB0cy90cmFjZXRvb2wvX19pbml0X18ucHkKKysrIGIvc2NyaXB0cy90cmFjZXRvb2wvX19p
bml0X18ucHkKQEAgLTMxLDYgKzMxLDcgQEAgZGVmIGVycm9yKCpsaW5lcyk6CiAgICAgc3lzLmV4
aXQoMSkKIAogCitvdXRfbGluZW5vID0gMQogb3V0X2ZpbGVuYW1lID0gJzxub25lPicKIG91dF9m
b2JqID0gc3lzLnN0ZG91dAogCkBAIC00NSwxMiArNDYsMTkgQEAgZGVmIG91dCgqbGluZXMsICoq
a3dhcmdzKToKICAgICBZb3UgY2FuIHVzZSBrd2FyZ3MgYXMgYSBzaG9ydGhhbmQgZm9yIG1hcHBp
bmcgdmFyaWFibGVzIHdoZW4gZm9ybWF0dGluZyBhbGwKICAgICB0aGUgc3RyaW5ncyBpbiBsaW5l
cy4KIAotICAgIFRoZSAnb3V0X2ZpbGVuYW1lJyBrd2FyZyBpcyBhdXRvbWF0aWNhbGx5IGFkZGVk
IHdpdGggdGhlIG91dHB1dCBmaWxlbmFtZS4KKyAgICBUaGUgJ291dF9saW5lbm8nIGt3YXJnIGlz
IGF1dG9tYXRpY2FsbHkgYWRkZWQgdG8gcmVmbGVjdCB0aGUgY3VycmVudCBvdXRwdXQKKyAgICBm
aWxlIGxpbmUgbnVtYmVyLiBUaGUgJ291dF9uZXh0X2xpbmVubycga3dhcmcgaXMgYWxzbyBhdXRv
bWF0aWNhbGx5IGFkZGVkCisgICAgd2l0aCB0aGUgbmV4dCBvdXRwdXQgbGluZSBudW1iZXIuIFRo
ZSAnb3V0X2ZpbGVuYW1lJyBrd2FyZyBpcyBhdXRvbWF0aWNhbGx5CisgICAgYWRkZWQgd2l0aCB0
aGUgb3V0cHV0IGZpbGVuYW1lLgogICAgICIiIgorICAgIGdsb2JhbCBvdXRfbGluZW5vCiAgICAg
b3V0cHV0ID0gW10KICAgICBmb3IgbCBpbiBsaW5lczoKKyAgICAgICAga3dhcmdzWydvdXRfbGlu
ZW5vJ10gPSBvdXRfbGluZW5vCisgICAgICAgIGt3YXJnc1snb3V0X25leHRfbGluZW5vJ10gPSBv
dXRfbGluZW5vICsgMQogICAgICAgICBrd2FyZ3NbJ291dF9maWxlbmFtZSddID0gb3V0X2ZpbGVu
YW1lCiAgICAgICAgIG91dHB1dC5hcHBlbmQobCAlIGt3YXJncykKKyAgICAgICAgb3V0X2xpbmVu
byArPSAxCiAKICAgICBvdXRfZm9iai53cml0ZWxpbmVzKCJcbiIuam9pbihvdXRwdXQpICsgIlxu
IikKIAotLSAKMi4yOS4yCgo=


