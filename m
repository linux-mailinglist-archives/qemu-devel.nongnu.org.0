Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169D6173E4B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 18:21:19 +0100 (CET)
Received: from localhost ([::1]:51176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7jKA-0001Cn-46
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 12:21:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57747)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tsimpson@qualcomm.com>) id 1j7ike-0002pA-E6
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:44:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tsimpson@qualcomm.com>) id 1j7ika-0005XY-V0
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:44:36 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:27035)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tsimpson@qualcomm.com>)
 id 1j7ika-0005Ug-Il
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:44:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1582908272; x=1614444272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HYGhLhXmS2Pd2wefqh2Tib92Xjx/wOU8qBRvN2wX1PE=;
 b=Lk3EdEIXkBtFs8siMwo2rEE95XpTMmQ2qEPWGGvg88lTx9kObtQQV57B
 JdKBNSSwZjrzY+ApP77TJepAa9Loo4nt+WcmTOwcZA5Tb8SWNpHp58ZS+
 ht9M8/RsTJdqCnWY9s/h/ACc30mleLWxTuMT7D5P+rEAiuQ8+bUvJNKp1 Q=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Feb 2020 08:44:30 -0800
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 28 Feb 2020 08:44:29 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 5811F1102; Fri, 28 Feb 2020 10:44:29 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 19/67] Hexagon instruction class definitions
Date: Fri, 28 Feb 2020 10:43:15 -0600
Message-Id: <1582908244-304-20-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582908244-304-1-git-send-email-tsimpson@quicinc.com>
References: <1582908244-304-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 199.106.114.39
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
Cc: riku.voipio@iki.fi, richard.henderson@linaro.org, laurent@vivier.eu,
 Taylor Simpson <tsimpson@quicinc.com>, philmd@redhat.com,
 aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ICAgIEltcG9ydGVkIGZyb20gdGhlIEhleGFnb24gYXJjaGl0ZWN0dXJlIGxpYnJhcnkKClNpZ25l
ZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJn
ZXQvaGV4YWdvbi9pbXBvcnRlZC9pY2xhc3MuZGVmIHwgNTIgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgdGFyZ2V0L2hleGFnb24vaW1wb3J0ZWQvaWNsYXNzLmRlZgoKZGlmZiAt
LWdpdCBhL3RhcmdldC9oZXhhZ29uL2ltcG9ydGVkL2ljbGFzcy5kZWYgYi90YXJnZXQvaGV4YWdv
bi9pbXBvcnRlZC9pY2xhc3MuZGVmCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAu
LjRlZjcyNWYKLS0tIC9kZXYvbnVsbAorKysgYi90YXJnZXQvaGV4YWdvbi9pbXBvcnRlZC9pY2xh
c3MuZGVmCkBAIC0wLDAgKzEsNTIgQEAKKy8qCisgKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMCBR
dWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgorICoK
KyAqICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUg
aXQgYW5kL29yIG1vZGlmeQorICogIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVy
YWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CisgKiAgdGhlIEZyZWUgU29mdHdhcmUg
Rm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IKKyAqICAoYXQg
eW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorICoKKyAqICBUaGlzIHByb2dyYW0gaXMg
ZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyAqICBidXQg
V0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBv
ZgorICogIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9T
RS4gIFNlZSB0aGUKKyAqICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRh
aWxzLgorICoKKyAqICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZQorICogIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBu
b3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisgKi8KKworLyogREVGXyoo
VFlQRSxTTE9UUyxVTklUUykgKi8KK0RFRl9QUF9JQ0xBU1MzMihFWFRFTkRFUiwwMTIzLExEU1R8
U1VOSVR8TVVOSVQpIC8qIDAgKi8KK0RFRl9QUF9JQ0xBU1MzMihDSiwwMTIzLENUUkxGTE9XKSAv
KiAxICovCitERUZfUFBfSUNMQVNTMzIoTkNKLDAxLExEU1R8Q1RSTEZMT1cpIC8qIDIgKi8KK0RF
Rl9QUF9JQ0xBU1MzMihWNExEU1QsMDEsTERTVCkgLyogMyAqLworREVGX1BQX0lDTEFTUzMyKFYy
TERTVCwwMSxMRFNUKSAvKiA0ICovCitERUZfUFBfSUNMQVNTMzIoSiwwMTIzLENUUkxGTE9XKSAg
LyogNSAqLworREVGX1BQX0lDTEFTUzMyKENSLDMsU1VOSVQpICAgICAvKiA2ICovCitERUZfUFBf
SUNMQVNTMzIoQUxVMzJfMm9wLDAxMjMsTERTVHxTVU5JVHxNVU5JVCkgLyogNyAqLworREVGX1BQ
X0lDTEFTUzMyKFNfMm9wLDIzLFNVTklUfE1VTklUKSAgICAgICAgICAgICAgIC8qIDggKi8KK0RF
Rl9QUF9JQ0xBU1MzMihMRCwwMSxMRFNUKSAgICAgICAgICAgICAgICAgICAgLyogOSAqLworREVG
X1BQX0lDTEFTUzMyKFNULDAxLExEU1QpICAgICAgICAgICAgICAgICAgICAgICAgLyogMTAgKi8K
K0RFRl9QUF9JQ0xBU1MzMihBTFUzMl9BRERJLDAxMjMsTERTVHxTVU5JVHxNVU5JVCkgLyogMTEg
Ki8KK0RFRl9QUF9JQ0xBU1MzMihTXzNvcCwyMyxTVU5JVHxNVU5JVCkgICAgICAgICAgICAgICAv
KiAxMiAqLworREVGX1BQX0lDTEFTUzMyKEFMVTY0LDIzLFNVTklUfE1VTklUKSAgICAgICAgICAg
ICAvKiAxMyAqLworREVGX1BQX0lDTEFTUzMyKE0sMjMsU1VOSVR8TVVOSVQpICAgICAgICAgICAg
ICAgICAvKiAxNCAqLworREVGX1BQX0lDTEFTUzMyKEFMVTMyXzNvcCwwMTIzLExEU1R8U1VOSVR8
TVVOSVQpIC8qIDE1ICovCisKK0RFRl9FRV9JQ0xBU1MzMihFRTAsMDEsSU5WQUxJRCkgLyogMCAq
LworREVGX0VFX0lDTEFTUzMyKEVFMSwwMSxJTlZBTElEKSAvKiAxICovCitERUZfRUVfSUNMQVNT
MzIoRUUyLDAxLElOVkFMSUQpIC8qIDIgKi8KK0RFRl9FRV9JQ0xBU1MzMihFRTMsMDEsSU5WQUxJ
RCkgLyogMyAqLworREVGX0VFX0lDTEFTUzMyKEVFNCwwMSxJTlZBTElEKSAvKiA0ICovCitERUZf
RUVfSUNMQVNTMzIoRUU1LDAxLElOVkFMSUQpIC8qIDUgKi8KK0RFRl9FRV9JQ0xBU1MzMihFRTYs
MDEsSU5WQUxJRCkgLyogNiAqLworREVGX0VFX0lDTEFTUzMyKEVFNywwMSxJTlZBTElEKSAvKiA3
ICovCitERUZfRUVfSUNMQVNTMzIoRUU4LDAxLElOVkFMSUQpIC8qIDggKi8KK0RFRl9FRV9JQ0xB
U1MzMihFRTksMDEsSU5WQUxJRCkgLyogOSAqLworREVGX0VFX0lDTEFTUzMyKEVFQSwwMSxJTlZB
TElEKSAvKiAxMCAqLworREVGX0VFX0lDTEFTUzMyKEVFQiwwMSxJTlZBTElEKSAvKiAxMSAqLwor
REVGX0VFX0lDTEFTUzMyKEVFQywwMSxJTlZBTElEKSAvKiAxMiAqLworREVGX0VFX0lDTEFTUzMy
KEVFRCwwMSxJTlZBTElEKSAvKiAxMyAqLworREVGX0VFX0lDTEFTUzMyKEVFRSwwMSxJTlZBTElE
KSAvKiAxNCAqLworREVGX0VFX0lDTEFTUzMyKEVFRiwwMSxJTlZBTElEKSAvKiAxNSAqLworCi0t
IAoyLjcuNAoK

