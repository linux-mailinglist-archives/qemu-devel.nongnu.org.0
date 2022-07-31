Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A1D5861FB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 01:35:00 +0200 (CEST)
Received: from localhost ([::1]:46692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIISZ-0003qv-IF
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 19:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oIIQT-00083i-Hz
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 19:32:49 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:54485)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oIIQR-0000Zn-Pa
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 19:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659310368; x=1690846368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+IzbenrvwlKVFxfzwy4u2APn2cxymqNhXhRYtwFNJR4=;
 b=UVzjI0v9cCPCodIe0EGxv/FWCXdsgM2endyqeZSFW7Ga1WdKznvX0ilR
 jx1LXq23sfXciEx+keZVa+VrW8wVnMR4QF/iQMmoEBGQJmCyfftz4Kw2Y
 adWmmD1K0s88YyrDXbO3FkxcCo3x0Oi4u8PEtc6oNOMidC0of/9KEGw8s o=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 31 Jul 2022 16:32:34 -0700
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP; 31 Jul 2022 16:32:33 -0700
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 013C25005BE; Sun, 31 Jul 2022 16:32:33 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org
Subject: [PULL 2/3] Hexagon (tests/tcg/hexagon) Fix alignment in load_unpack.c
Date: Sun, 31 Jul 2022 16:32:31 -0700
Message-Id: <20220731233232.2473-3-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220731233232.2473-1-tsimpson@quicinc.com>
References: <20220731233232.2473-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=129.46.98.28; envelope-from=tsimpson@qualcomm.com;
 helo=alexa-out.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGluY3JlbWVudCB1c2VkIGluIDpicmV2IHRlc3RzIHdhcyBjYXVzaW5nIHVuYWxpZ25lZCBh
ZGRyZXNzZXMKQ2hhbmdlIHRoZSBpbmNyZW1lbnQgYW5kIHRoZSByZWxldmFudCBleHBlY3RlZCB2
YWx1ZXMKClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNv
bT4KQWNrZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnPgpNZXNzYWdlLUlkOiA8MjAyMjA3MTgyMzAzMjAuMjQ0NDQtMy10c2ltcHNvbkBxdWljaW5j
LmNvbT4KLS0tCiB0ZXN0cy90Y2cvaGV4YWdvbi9sb2FkX3VucGFjay5jIHwgMTQgKysrKysrKy0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvdGVzdHMvdGNnL2hleGFnb24vbG9hZF91bnBhY2suYyBiL3Rlc3RzL3RjZy9o
ZXhhZ29uL2xvYWRfdW5wYWNrLmMKaW5kZXggMzU3NWEzN2EyOC4uNGFhMjZmYzM4OCAxMDA2NDQK
LS0tIGEvdGVzdHMvdGNnL2hleGFnb24vbG9hZF91bnBhY2suYworKysgYi90ZXN0cy90Y2cvaGV4
YWdvbi9sb2FkX3VucGFjay5jCkBAIC0yNDUsNyArMjQ1LDcgQEAgVEVTVF9wcihsb2FkYnN3NF9w
ciwgbG9uZyBsb25nLCBTLCA0LCAweDAwMDBmZjAwMDAwMGZmMDBMTCwKICAqLwogI2RlZmluZSBC
eFdfTE9BRF9wYnIoU1osIFJFUywgUFRSKSBcCiAgICAgX19hc21fXyggXAotICAgICAgICAicjQg
PSAjKDEgPDwgKDE2IC0gMykpXG5cdCIgXAorICAgICAgICAicjQgPSAjKDEgPDwgKDE2IC0gNCkp
XG5cdCIgXAogICAgICAgICAibTAgPSByNFxuXHQiIFwKICAgICAgICAgIiUwID0gbWVtIiAjU1og
IiglMSsrbTA6YnJldilcblx0IiBcCiAgICAgICAgIDogIj1yIihSRVMpLCAiK3IiKFBUUikgXApA
QCAtMjczLDE1ICsyNzMsMTUgQEAgdm9pZCB0ZXN0XyMjTkFNRSh2b2lkKSBcCiB9CiAKIFRFU1Rf
cGJyKGxvYWRiencyX3BiciwgaW50LCBaLCAweDAwMDAwMDAwLAotICAgIDB4MDAwMjAwODEsIDB4
MDAwNjAwODUsIDB4MDAwNDAwODMsIDB4MDAwODAwODcpCisgICAgMHgwMDAyMDA4MSwgMHgwMDBh
MDA4OSwgMHgwMDA2MDA4NSwgMHgwMDBlMDA4ZCkKIFRFU1RfcGJyKGxvYWRic3cyX3BiciwgaW50
LCBTLCAweDAwMDBmZjAwLAotICAgIDB4MDAwMjAwODEsIDB4MDAwNjAwODUsIDB4MDAwNDAwODMs
IDB4MDAwODAwODcpCisgICAgMHgwMDAyMDA4MSwgMHgwMDBhZmY4OSwgMHgwMDA2ZmY4NSwgMHgw
MDBlZmY4ZCkKIFRFU1RfcGJyKGxvYWRienc0X3BiciwgbG9uZyBsb25nLCBaLCAweDAwMDAwMDAw
MDAwMDAwMDBMTCwKLSAgICAweDAwMDQwMDgzMDAwMjAwODFMTCwgMHgwMDA4MDA4NzAwMDYwMDg1
TEwsCi0gICAgMHgwMDA2MDA4NTAwMDQwMDgzTEwsIDB4MDAwYTAwODkwMDA4MDA4N0xMKQorICAg
IDB4MDAwNDAwODMwMDAyMDA4MUxMLCAweDAwMGMwMDhiMDAwYTAwODlMTCwKKyAgICAweDAwMDgw
MDg3MDAwNjAwODVMTCwgMHgwMDEwMDA4ZjAwMGUwMDhkTEwpCiBURVNUX3Bicihsb2FkYnN3NF9w
YnIsIGxvbmcgbG9uZywgUywgMHgwMDAwZmYwMDAwMDBmZjAwTEwsCi0gICAgMHgwMDA0MDA4MzAw
MDIwMDgxTEwsIDB4MDAwODAwODcwMDA2MDA4NUxMLAotICAgIDB4MDAwNjAwODUwMDA0MDA4M0xM
LCAweDAwMGEwMDg5MDAwODAwODdMTCkKKyAgICAweDAwMDQwMDgzMDAwMjAwODFMTCwgMHgwMDBj
ZmY4YjAwMGFmZjg5TEwsCisgICAgMHgwMDA4ZmY4NzAwMDZmZjg1TEwsIDB4MDAxMGZmOGYwMDBl
ZmY4ZExMKQogCiAvKgogICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKLS0gCjIuMTcuMQoK

