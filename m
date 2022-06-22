Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220F1554AC1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 15:16:40 +0200 (CEST)
Received: from localhost ([::1]:48280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o40Dn-0004vA-6Z
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 09:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bfalk@gamozolabs.com>)
 id 1o3qLn-0007G3-CX
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 22:44:15 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:35733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bfalk@gamozolabs.com>)
 id 1o3qLl-0008Ah-Im
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 22:44:15 -0400
Received: by mail-lf1-x12d.google.com with SMTP id a29so25484994lfk.2
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 19:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gamozolabs.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=rFIz3Fm6AKUkXuGkM0uP0CqAvlgEGKrnuP3/8N+6K2g=;
 b=S98Z4wXJ0fP3mts5Y7g09T2v4A8egkHNkhoPFD/Qhi9XalnaGCoFtJtw1E8kZ/3HQH
 2kPMYuByGftQiwMDoUfG1r5/q1TTbWm3DUfbai/apXXBmXFZBI/+d4E2NlzrmVU5dTAd
 G97zQusDp++/AEaiAlWa4io6Njd8SLvG7YC4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rFIz3Fm6AKUkXuGkM0uP0CqAvlgEGKrnuP3/8N+6K2g=;
 b=GsA1Km5z7e9+JfSH61IlMj5Oi4vDaJWAG0RG59Ivff9P5qZqR+EvPpvFVthC6I2W+h
 hc1PI3Ff1aSrS3ZQrJ87Fj6A6fyCEEwK0YiGMGQE6q3dO8z2ZLkNXjFy/QCqDmUM2hOX
 wvuQ3w6SiaMO22mXKqMbEDz/OtjEb01MuPq3ZQQeLDX3H6+I24IIkUWL/gkv62RAyXUC
 CLbKwP+ktKRJC4JbBAVN0NbAn93goaAOH+W9qoqeHDZ2JZ4l6RpL9Myfa/uqf2lnO5u6
 j9LFr9paKuO+nQAHjyZ/lpMM2PjiI9x3+qVuFbecPlGDqrvoWlvvt2paVlF3S/ALxNRs
 NfTA==
X-Gm-Message-State: AJIora+2O0eU7SMKLW46jiXdMMmuP1nu7iJOREygXcbHu3dluEUdJVSm
 gz0kCBFHxpYv2oh3XumnM5GXaq76pVCMs7E5r0V8hl+5bFFQNw==
X-Google-Smtp-Source: AGRyM1s50jfwpRQjbDj1KBaeOT1lLWVWUAZl9XCy4jOv791x2s7/ORXNMMY6KT6xKb1lzMVQ3GIMUirVvgaLtd1iM2E=
X-Received: by 2002:a05:6512:3ba8:b0:47e:ce:2a08 with SMTP id
 g40-20020a0565123ba800b0047e00ce2a08mr769236lfv.558.1655865850348; Tue, 21
 Jun 2022 19:44:10 -0700 (PDT)
MIME-Version: 1.0
From: Brandon Falk <bfalk@gamozolabs.com>
Date: Tue, 21 Jun 2022 19:43:59 -0700
Message-ID: <CAK9+cJVrgAew_DjQaEg56ywJAt4bLGgzyZsJqHg3SZVngmq81A@mail.gmail.com>
Subject: [PATCH] Added error message for qemu-user fake_open which clears up
 misleading open() errors which are caused by QEMU interception of open()
 rather than the linux-user's open()
To: qemu-devel@nongnu.org
Content-Type: multipart/mixed; boundary="000000000000ce8eb505e2004f1d"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=bfalk@gamozolabs.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 22 Jun 2022 09:13:11 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ce8eb505e2004f1d
Content-Type: multipart/alternative; boundary="000000000000ce8eb305e2004f1b"

--000000000000ce8eb305e2004f1b
Content-Type: text/plain; charset="UTF-8"

Add error message for fake open calls when failing to create a temporary
file. I spent some time debugging an issue where for some reason I thought
/proc was misbehaving in the linux-user chroot environment, but it was
rather QEMU silently failing (and passing through an error) to the guest
application, even though it was a QEMU issue related to creating a
temporary file in the chrooted environment.

--000000000000ce8eb305e2004f1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Add error message for fake open calls when failing to crea=
te a temporary file. I spent some time debugging an issue where for some re=
ason I thought /proc was misbehaving in the linux-user chroot environment, =
but it was rather QEMU silently failing (and passing through an error) to t=
he guest application, even though it was a QEMU issue related to creating a=
 temporary file in the chrooted environment.<br></div>

--000000000000ce8eb305e2004f1b--

--000000000000ce8eb505e2004f1d
Content-Type: application/octet-stream; name=patch
Content-Disposition: attachment; filename=patch
Content-Transfer-Encoding: base64
Content-ID: <f_l4ozpllu0>
X-Attachment-Id: f_l4ozpllu0

RnJvbSA4ZjM1YTg5MzE3NmI2MWNkOWRlODJiZjgwYzYwMDQ5YzA1NTk3ZTdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcmFuZG9uIEZhbGsgPGJmYWxrQGdhbW96b2xhYnMuY29tPgpE
YXRlOiBUdWUsIDIxIEp1biAyMDIyIDE4OjQ3OjI0IC0wNzAwClN1YmplY3Q6IFtQQVRDSF0gQWRk
ZWQgZXJyb3IgbWVzc2FnZSBmb3IgcWVtdS11c2VyIGZha2Vfb3BlbiB3aGljaCBjbGVhcnMgdXAK
IG1pc2xlYWRpbmcgb3BlbigpIGVycm9ycyB3aGljaCBhcmUgY2F1c2VkIGJ5IFFFTVUgaW50ZXJj
ZXB0aW9uIG9mIG9wZW4oKQogcmF0aGVyIHRoYW4gdGhlIGxpbnV4LXVzZXIncyBvcGVuKCkKClNp
Z25lZC1vZmYtYnk6IEJyYW5kb24gRmFsayA8YmZhbGtAZ2Ftb3pvbGFicy5jb20+Ci0tLQogbGlu
dXgtdXNlci9zeXNjYWxsLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9saW51eC11c2VyL3N5c2NhbGwuYyBiL2xpbnV4LXVzZXIvc3lzY2Fs
bC5jCmluZGV4IGY1NWNkZWJlZTUuLmFjZDdiMjA2M2UgMTAwNjQ0Ci0tLSBhL2xpbnV4LXVzZXIv
c3lzY2FsbC5jCisrKyBiL2xpbnV4LXVzZXIvc3lzY2FsbC5jCkBAIC04MjYzLDYgKzgyNjMsMTAg
QEAgc3RhdGljIGludCBkb19vcGVuYXQoQ1BVQXJjaFN0YXRlICpjcHVfZW52LCBpbnQgZGlyZmQs
IGNvbnN0IGNoYXIgKnBhdGhuYW1lLCBpbnQKICAgICAgICAgc25wcmludGYoZmlsZW5hbWUsIHNp
emVvZihmaWxlbmFtZSksICIlcy9xZW11LW9wZW4uWFhYWFhYIiwgdG1wZGlyKTsKICAgICAgICAg
ZmQgPSBta3N0ZW1wKGZpbGVuYW1lKTsKICAgICAgICAgaWYgKGZkIDwgMCkgeworICAgICAgICAg
ICAgZnByaW50ZihzdGRlcnIsCisgICAgICAgICAgICAgICAgICAgICJxZW11LXVzZXI6IENvdWxk
IG5vdCBjcmVhdGUgdGVtcG9yYXJ5IGZpbGUgZm9yICIKKyAgICAgICAgICAgICAgICAgICAgImZh
a2Vfb3Blbiwgc2V0ICRUTVBESVIgdG8gYSB2YWxpZCBwYXRoIG9yIGNyZWF0ZSAvdG1wLiAiCisg
ICAgICAgICAgICAgICAgICAgICJSZXR1cm5pbmcgZXJyb3IgZm9yIG9wZW4oKSBvZiAlc1xuIiwg
cGF0aG5hbWUpOwogICAgICAgICAgICAgcmV0dXJuIGZkOwogICAgICAgICB9CiAgICAgICAgIHVu
bGluayhmaWxlbmFtZSk7Ci0tIAoyLjM1LjEKCg==
--000000000000ce8eb505e2004f1d--

