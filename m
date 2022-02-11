Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E9B4B2445
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 12:29:25 +0100 (CET)
Received: from localhost ([::1]:50042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIU79-0004e5-81
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 06:29:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nITvz-0007On-08
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:17:51 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:20461)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nITvv-00015o-9e
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:17:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644578267; x=1676114267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c5eHRolqDGhD1jTJFayTqDl22+47uR0w0fm8aLuE0/M=;
 b=v0tGaZ2EILQl8g+sR4G1Nci+jpsfQuwUWrAgBQaEwMwbKg/AcIPMrESO
 U2h7wbn29k27u+oY8ymrZRiairAzxYDi3/JpUIHHNO1jqqt3KgduwBAEr
 sYUvlqseU4qjXkv3lOgJraY76RlgLt1q407BZ/1VtZu2sFYKFNnEsynx4 8=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 11 Feb 2022 03:17:25 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP; 11 Feb 2022 03:17:24 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 9E2DE50059E; Fri, 11 Feb 2022 03:17:24 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/12] Hexagon (tests/tcg/hexagon) update overflow test
Date: Fri, 11 Feb 2022 03:17:17 -0800
Message-Id: <20220211111722.31036-8-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211111722.31036-1-tsimpson@quicinc.com>
References: <20220211111722.31036-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=129.46.98.28; envelope-from=tsimpson@qualcomm.com;
 helo=alexa-out.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org, zongyuan.li@smartx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWRkIGEgdGVzdCB0aGF0IHNldHMgVVNSIG11bHRpcGxlIHRpbWVzIGluIGEgcGFja2V0CgpTaWdu
ZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ck1lc3NhZ2Ut
SWQ6IDwyMDIyMDIxMDAyMTU1Ni45MjE3LTktdHNpbXBzb25AcXVpY2luYy5jb20+CkFja2VkLWJ5
OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KLS0tCiB0
ZXN0cy90Y2cvaGV4YWdvbi9vdmVyZmxvdy5jIHwgNjEgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3RjZy9oZXhhZ29uL292ZXJmbG93LmMgYi90ZXN0cy90
Y2cvaGV4YWdvbi9vdmVyZmxvdy5jCmluZGV4IDE5NmZjZjdmM2EuLjk0MDg3ODUxYjAgMTAwNjQ0
Ci0tLSBhL3Rlc3RzL3RjZy9oZXhhZ29uL292ZXJmbG93LmMKKysrIGIvdGVzdHMvdGNnL2hleGFn
b24vb3ZlcmZsb3cuYwpAQCAtMSw1ICsxLDUgQEAKIC8qCi0gKiAgQ29weXJpZ2h0KGMpIDIwMjEg
UXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyAq
ICBDb3B5cmlnaHQoYykgMjAyMS0yMDIyIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMu
IEFsbCBSaWdodHMgUmVzZXJ2ZWQuCiAgKgogICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3
YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgKiAgaXQgdW5kZXIg
dGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQg
YnkKQEAgLTcyLDYgKzcyLDIwIEBAIGludCByZWFkX3Vzcl9vdmVyZmxvdyh2b2lkKQogICAgIHJl
dHVybiByZXN1bHQgJiAxOwogfQogCitpbnQgZ2V0X3Vzcl9vdmVyZmxvdyhpbnQgdXNyKQorewor
ICAgIHJldHVybiB1c3IgJiAxOworfQorCitpbnQgZ2V0X3Vzcl9mcF9pbnZhbGlkKGludCB1c3Ip
Cit7CisgICAgcmV0dXJuICh1c3IgPj4gMSkgJiAxOworfQorCitpbnQgZ2V0X3Vzcl9scGNmZyhp
bnQgdXNyKQoreworICAgIHJldHVybiAodXNyID4+IDgpICYgMHgzOworfQogCiBqbXBfYnVmIGpt
cF9lbnY7CiBpbnQgdXNyX292ZXJmbG93OwpAQCAtODIsNiArOTYsNDkgQEAgc3RhdGljIHZvaWQg
c2lnX3NlZ3YoaW50IHNpZywgc2lnaW5mb190ICppbmZvLCB2b2lkICpwdWMpCiAgICAgbG9uZ2pt
cChqbXBfZW52LCAxKTsKIH0KIAorc3RhdGljIHZvaWQgdGVzdF9wYWNrZXQodm9pZCkKK3sKKyAg
ICBpbnQgY29udnJlczsKKyAgICBpbnQgc2F0cmVzOworICAgIGludCB1c3I7CisKKyAgICBhc20o
InIyID0gdXNyXG5cdCIKKyAgICAgICAgInIyID0gY2xyYml0KHIyLCAjMClcblx0IiAgICAgICAg
LyogY2xlYXIgb3ZlcmZsb3cgYml0ICovCisgICAgICAgICJyMiA9IGNscmJpdChyMiwgIzEpXG5c
dCIgICAgICAgIC8qIGNsZWFyIEZQIGludmFsaWQgYml0ICovCisgICAgICAgICJ1c3IgPSByMlxu
XHQiCisgICAgICAgICJ7XG5cdCIKKyAgICAgICAgIiAgICAlMCA9IGNvbnZlcnRfc2YydXcoJTMp
OmNob3Bcblx0IgorICAgICAgICAiICAgICUxID0gc2F0YiglNClcblx0IgorICAgICAgICAifVxu
XHQiCisgICAgICAgICIlMiA9IHVzclxuXHQiCisgICAgICAgIDogIj1yIihjb252cmVzKSwgIj1y
IihzYXRyZXMpLCAiPXIiKHVzcikKKyAgICAgICAgOiAiciIoMHg2YTA1MWI4NiksICJyIigweDA0
MTBlZWMwKQorICAgICAgICA6ICJyMiIsICJ1c3IiKTsKKworICAgIGNoZWNrKGNvbnZyZXMsIDB4
ZmZmZmZmZmYpOworICAgIGNoZWNrKHNhdHJlcywgMHg3Zik7CisgICAgY2hlY2soZ2V0X3Vzcl9v
dmVyZmxvdyh1c3IpLCAxKTsKKyAgICBjaGVjayhnZXRfdXNyX2ZwX2ludmFsaWQodXNyKSwgMSk7
CisKKyAgICBhc20oInIyID0gdXNyXG5cdCIKKyAgICAgICAgInIyID0gY2xyYml0KHIyLCAjMClc
blx0IiAgICAgICAgLyogY2xlYXIgb3ZlcmZsb3cgYml0ICovCisgICAgICAgICJ1c3IgPSByMlxu
XHQiCisgICAgICAgICIlMiA9IHIyXG5cdCIKKyAgICAgICAgInAzID0gc3AzbG9vcDAoMWYsICMx
KVxuXHQiCisgICAgICAgICIxOlxuXHQiCisgICAgICAgICJ7XG5cdCIKKyAgICAgICAgIiAgICAl
MCA9IHNhdGIoJTIpXG5cdCIKKyAgICAgICAgIn06ZW5kbG9vcDBcblx0IgorICAgICAgICAiJTEg
PSB1c3Jcblx0IgorICAgICAgICA6ICI9ciIoc2F0cmVzKSwgIj1yIih1c3IpCisgICAgICAgIDog
InIiKDB4MDQxMGVlYzApCisgICAgICAgIDogInIyIiwgInVzciIsICJwMyIsICJzYTAiLCAibGMw
Iik7CisKKyAgICBjaGVjayhzYXRyZXMsIDB4N2YpOworICAgIGNoZWNrKGdldF91c3Jfb3ZlcmZs
b3codXNyKSwgMSk7CisgICAgY2hlY2soZ2V0X3Vzcl9scGNmZyh1c3IpLCAyKTsKK30KKwogaW50
IG1haW4oKQogewogICAgIHN0cnVjdCBzaWdhY3Rpb24gYWN0OwpAQCAtMTAyLDYgKzE1OSw4IEBA
IGludCBtYWluKCkKIAogICAgIGNoZWNrKHVzcl9vdmVyZmxvdywgMCk7CiAKKyAgICB0ZXN0X3Bh
Y2tldCgpOworCiAgICAgcHV0cyhlcnIgPyAiRkFJTCIgOiAiUEFTUyIpOwogICAgIHJldHVybiBl
cnIgPyBFWElUX0ZBSUxVUkUgOiBFWElUX1NVQ0NFU1M7CiB9Ci0tIAoyLjE3LjEKCg==

