Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314D464DA2A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 12:19:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5mFV-0006sy-56; Thu, 15 Dec 2022 06:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5mFT-0006sq-Vi
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 06:18:00 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5mFS-000235-Ce
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 06:17:59 -0500
Received: by mail-pg1-x533.google.com with SMTP id r18so3930044pgr.12
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 03:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t7GRHyXdXjertt7T7+Ne1R01ixzzhO6ypBdiD+60jLQ=;
 b=uzK/3BRCKh3gH/cgZlpXk1AYDXw6YCsjQVZbNBfhVYZINMlFdpqWv1lfPOeZDaiGG2
 0CLNbR/qZw0R8cKYXcOSCUBtrnsvNmhgJxNvySvMqsL5wJX0yl297lSVUw/2Ghm2TvON
 HitM6pymYtmYYZVCQk6ZXVs/Sqdcgm+reB/A5QkdCn6V9HvP9nETFOJ3NUR7N2c9YOnT
 NkU0O8u9/GOHVjJZ8VAby3YRBI4Av4E04OeWOQ7trRWfQVD214xwarsTRZSdGvIvxsOK
 TniI8JoHDYJ89O5F/qeaXfUZ66V86vJPDY+jmoCUN/Nl7QPsqjAtt0sSVwWdke4gIkqd
 +ZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t7GRHyXdXjertt7T7+Ne1R01ixzzhO6ypBdiD+60jLQ=;
 b=dTQeIUoUuaq+VpO+gYSas8MlKl063oGDLoi13nS7GtoYJ+6hTdmTNTZ5XcFTJuHE7D
 sMmq3WhjwkZoQRTzWVxU0wkzblfHeuhn+eTvYTP6B/2T7T5BS3TSyKj3cp56BTNjuaD4
 Rcgv5kCVB1EtJqeQrx8lMBN8rl53/V3kaMs6coy+VCX15ql3Kj/mdlBbRQDuCygYGcy3
 xK73HYz7xDPeJmzZmz4J5Uc5EhtmCN5+5ytVIjUGsmzuH+AOHjJAd5JT0EbyNE90Zi32
 C381q4eZz+/sklFFR3OAljFdbh63tb5JE5Pc+efvJ0rxyqdWGHi37MKIZohCV/jQHdRF
 agBw==
X-Gm-Message-State: ANoB5pk2cIefc/oPIqVhP3/i+ePZtxIHcIwhIyeRkgOhAX+U4VdVzWq1
 6tayLmDZOLekX3IFQy7Y9Fnh+a+J8hmrb+k1yKTD5xQL+5qgNw==
X-Google-Smtp-Source: AA0mqf6zAmH+Cyy/dcyw3Q6VoELiV2bCGfrVwVCARSmGvRj4GNfKYzM5vlGv3r5dGp8XtZItkZepoCqX7hex+aujUj0=
X-Received: by 2002:a62:b501:0:b0:573:1959:c356 with SMTP id
 y1-20020a62b501000000b005731959c356mr79954669pfe.51.1671103076814; Thu, 15
 Dec 2022 03:17:56 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Dec 2022 11:17:45 +0000
Message-ID: <CAFEAcA8x_iM3hN2-P9F+huXnXFXy+D6FzE+Leq4erLdg7zkVGw@mail.gmail.com>
Subject: migration qtest failure: "query-migrate shows failed migration:
 Unable to write to socket: Broken pipe"
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SGk7IEkgc2VlIHRoaXMgbWlncmF0aW9uIHF0ZXN0IGZhaWx1cmUgb24gbXkgeDg2IG1hY29zIGJv
eDoNCg0KDQrilrYgIDMyLzU5MSBFUlJPUjouLi8uLi90ZXN0cy9xdGVzdC9taWdyYXRpb24taGVs
cGVycy5jOjE1MTptaWdyYXRlX3F1ZXJ5X25vdF9mYWlsZWQ6DQphc3NlcnRpb24gZmFpbA0KZWQ6
ICghZ19zdHJfZXF1YWwoc3RhdHVzLCAiZmFpbGVkIikpIEVSUk9SDQogMzIvNTkxIHFlbXU6cXRl
c3QrcXRlc3QtYWFyY2g2NCAvIHF0ZXN0LWFhcmNoNjQvbWlncmF0aW9uLXRlc3QNCiAgICAgICAg
ICAgRVJST1IgICAgICAgICAgMTUyLjI3cyAgIGtpbGxlZCBieSBzaWduYWwgNiBTSUdBQlJUDQri
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJUg4pyA
ICDigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJUN
CnN0ZGVycjoNCnF1ZXJ5LW1pZ3JhdGUgc2hvd3MgZmFpbGVkIG1pZ3JhdGlvbjogVW5hYmxlIHRv
IHdyaXRlIHRvIHNvY2tldDogQnJva2VuIHBpcGUNCioqDQpFUlJPUjouLi8uLi90ZXN0cy9xdGVz
dC9taWdyYXRpb24taGVscGVycy5jOjE1MTptaWdyYXRlX3F1ZXJ5X25vdF9mYWlsZWQ6DQphc3Nl
cnRpb24gZmFpbGVkOiAoIWdfc3RyX2VxdWFsKHN0YXR1cywgImZhaWxlZCIpKQ0KQXNzZXJ0aW9u
IGZhaWxlZDogKHBpZCA9PSBzLT5xZW11X3BpZCksIGZ1bmN0aW9uIHF0ZXN0X3dhaXRfcWVtdSwg
ZmlsZQ0KLi4vLi4vdGVzdHMvcXRlc3QvbGlicXRlc3QuYywgbGluZSAyMDcuDQoNCih0ZXN0IHBy
b2dyYW0gZXhpdGVkIHdpdGggc3RhdHVzIGNvZGUgLTYpDQrigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJUNCg0KYW5kIHNpbWlsYXJs
eToNCg0K4pa2ICAzNC81OTEgRVJST1I6Li4vLi4vdGVzdHMvcXRlc3QvbWlncmF0aW9uLWhlbHBl
cnMuYzoxNTE6bWlncmF0ZV9xdWVyeV9ub3RfZmFpbGVkOg0KYXNzZXJ0aW9uIGZhaWxlZDogKCFn
X3N0cl9lcXVhbChzdGF0dXMsICJmYWlsZWQiKSkgRVJST1INCiAzNC81OTEgcWVtdTpxdGVzdCtx
dGVzdC1pMzg2IC8gcXRlc3QtaTM4Ni9taWdyYXRpb24tdGVzdA0KICAgICAgICAgICBFUlJPUiAg
ICAgICAgICAxNjkuNDRzICAga2lsbGVkIGJ5IHNpZ25hbCA2IFNJR0FCUlQNCuKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAlSDinIAgIOKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAlQ0Kc3RkZXJyOg0K
cXVlcnktbWlncmF0ZSBzaG93cyBmYWlsZWQgbWlncmF0aW9uOiBVbmFibGUgdG8gd3JpdGUgdG8g
c29ja2V0OiBCcm9rZW4gcGlwZQ0KKioNCkVSUk9SOi4uLy4uL3Rlc3RzL3F0ZXN0L21pZ3JhdGlv
bi1oZWxwZXJzLmM6MTUxOm1pZ3JhdGVfcXVlcnlfbm90X2ZhaWxlZDoNCmFzc2VydGlvbiBmYWls
ZWQ6ICghZ19zdHJfZXF1YWwoc3RhdHVzLCAiZmFpbGVkIikpDQpBc3NlcnRpb24gZmFpbGVkOiAo
cGlkID09IHMtPnFlbXVfcGlkKSwgZnVuY3Rpb24gcXRlc3Rfd2FpdF9xZW11LCBmaWxlDQouLi8u
Li90ZXN0cy9xdGVzdC9saWJxdGVzdC5jLCBsaW5lIDIwNy4NCg0KKHRlc3QgcHJvZ3JhbSBleGl0
ZWQgd2l0aCBzdGF0dXMgY29kZSAtNikNCuKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAlQ0KDQpJdCBzZWVtcyB0byBiZSBmYWlybHkg
Y29uc2lzdGVudC4gQW55IGlkZWFzIHdoYXQgaXQgbWlnaHQgYmU/DQpNYXliZSB0aGUgUUVNVSBw
cm9jZXNzIGhhcyBhbHJlYWR5IGV4aXRlZCBiZWZvcmUgdGhlIHRlc3QgYmluYXJ5DQpnZXRzIHJv
dW5kIHRvIHF1ZXJ5aW5nIHRoZSBzdGF0dXMgPw0KDQp0aGFua3MNCi0tIFBNTQ0K

