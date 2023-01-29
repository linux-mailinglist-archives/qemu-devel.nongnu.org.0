Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF92767FECD
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 13:10:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM6V7-0000Oy-8b; Sun, 29 Jan 2023 07:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanwj@mail.ustc.edu.cn>)
 id 1pM6Uw-0000Nb-2h
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 07:09:27 -0500
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanwj@mail.ustc.edu.cn>) id 1pM6Ut-0005Jd-3v
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 07:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Subject:
 Content-Type:MIME-Version:Message-ID; bh=EPmItNIUJTW1HZxqXBLndqP
 6tYRdArnvmYC7WTv6p44=; b=TMXsW2/9wMf3Hts4P8qnhH80EEThnuT7C9WK9uI
 Aml99ulgvGJvoaJalFtO0RAzVcsKQ8PocIzrlXJBq8KE5ntX9wYVjhYmrDnVja0Y
 AukZcT1+lOkiK86eopQ05dVLLRT7uT1WxVpxgJJf9AyBpewJYOttsrPh0/rOgN/W
 VibE=
Received: by ajax-webmail-newmailweb.ustc.edu.cn (Coremail) ; Sun, 29 Jan
 2023 20:09:05 +0800 (GMT+08:00)
X-Originating-IP: [120.204.78.217]
Date: Sun, 29 Jan 2023 20:09:05 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: fanwj@mail.ustc.edu.cn
To: qemu-devel@nongnu.org
Subject: Please review a important patch abort fix setting of
 CPUX86State::gdt::base
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT3.0.8 dev build
 20210401(c5ff3689) Copyright (c) 2002-2023 www.mailtech.cn ustccn
X-SendMailWithSms: false
Content-Type: multipart/alternative; 
 boundary="----=_Part_1030385_1758026221.1674994145550"
MIME-Version: 1.0
Message-ID: <4dd3e63d.4889e.185fd6e590e.Coremail.fanwj@mail.ustc.edu.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: LkAmygA3PvrhYdZjpjhNAQ--.0W
X-CM-SenderInfo: pidq4yo6pdxzwoxv3uoohg3hdfq/1tbiAQ0GEFQhoP2F-QAAsK
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=2001:da8:d800::8;
 envelope-from=fanwj@mail.ustc.edu.cn; helo=ustc.edu.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HTML_MESSAGE=0.001, SPF_HELO_PASS=-0.001,
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

------=_Part_1030385_1758026221.1674994145550
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

VGhlIHBhdGNoIGZpeCBidWcgYWJvcnQgc2V0dHRpbmcgQ1BVWDg2U3RhdGU6OmdkdDo6YmFzZSBv
biBsaW51eC11c2VyLCB0aGUgYnVnIGNhbiB3cml0ZSBkaXJ0eSBkYXRhIHRvIGVtdWxhdGVkIHNl
Z21lbnQgcmVnaXN0ZXJzIG9mIHg4NgoKUGF0Y2ggYWRkcmVzczogIGh0dHBzOi8vbGlzdHMubm9u
Z251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDIzLTAxL21zZzAwMTQyLmh0bWwKQnVn
IGRlc2NyaXB0aW9uOiBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9pc3N1
ZXMvMTQwNQoKCgoKQmVjYXVzZSB0aGlzIGJ1ZyBoYXMgYmVlbiBmaXhlZCwgV2luZS1DRSBQcm9q
ZWN0IGNhbiBiZSBzdWNjZWVkZWQsIFdpbmUtQ0UgaXMgYSBjb21wYXRpYmlsaXR5IGxheWVyIGNh
cGFibGUgb2YgcnVubmluZyBXaW5kb3dzIGFwcGxpY2F0aW9ucyBvbiBDcm9zcy1hcmNoaXRlY3R1
cmUgcGFsdGZvcm0gb2YgTGludXguIEl0IGlzIGJhc2Ugb24gV2luZSBQcm9qZWN0IGFuZCBRZW11
IFByb2plY3QuCgoKUHJvamVjdCBBZGRyZXNzOiBodHRwczovL2dpdGxhYi5jb20vd2luZS1jZS93
aW5lLWNl
------=_Part_1030385_1758026221.1674994145550
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5UaGUgcGF0Y2ggZml4IGJ1ZyBhYm9ydCBzZXR0dGluZyBDUFVYODZTdGF0ZTo6Z2R0Ojpi
YXNlIG9uIGxpbnV4LXVzZXIsIHRoZSBidWcgY2FuIHdyaXRlIGRpcnR5IGRhdGEgdG8gZW11bGF0
ZWQgc2VnbWVudCByZWdpc3RlcnMgb2YgeDg2PGJyPjwvZGl2PjxkaXY+UGF0Y2ggYWRkcmVzczom
bmJzcDsgaHR0cHM6Ly9saXN0cy5ub25nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIw
MjMtMDEvbXNnMDAxNDIuaHRtbDwvZGl2PjxkaXY+QnVnIGRlc2NyaXB0aW9uOiBodHRwczovL2dp
dGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9pc3N1ZXMvMTQwNTwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QmVjYXVzZSB0aGlzIGJ1ZyBoYXMgYmVlbiBmaXhlZCwg
V2luZS1DRSBQcm9qZWN0IGNhbiBiZSBzdWNjZWVkZWQsIDxzcGFuIHN0eWxlPSJjb2xvcjogcmdi
KDY0LCA3MiwgOTEpOyBmb250LWZhbWlseTogLWFwcGxlLXN5c3RlbSwgQmxpbmtNYWNTeXN0ZW1G
b250LCAmcXVvdDtTZWdvZSBVSSZxdW90OywgSGVsdmV0aWNhLCBBcmlhbCwgJnF1b3Q7QXBwbGUg
Q29sb3IgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdv
ZSBVSSBTeW1ib2wmcXVvdDssICZxdW90O0xpYmVyYXRpb24gU2FucyZxdW90OywgJnF1b3Q7UGlu
Z0ZhbmcgU0MmcXVvdDssICZxdW90O01pY3Jvc29mdCBZYUhlaSZxdW90OywgJnF1b3Q7SGlyYWdp
bm8gU2FucyBHQiZxdW90OywgJnF1b3Q7V2VucXVhbnlpIE1pY3JvIEhlaSZxdW90OywgJnF1b3Q7
V2VuUXVhbllpIFplbiBIZWkmcXVvdDssICZxdW90O1NUIEhlaXRpJnF1b3Q7LCBTaW1IZWksIFNp
bVN1biwgJnF1b3Q7V2VuUXVhbllpIFplbiBIZWkgU2hhcnAmcXVvdDssIHNhbnMtc2VyaWY7Ij5X
aW5lLUNFIGlzIGEgY29tcGF0aWJpbGl0eSBsYXllciBjYXBhYmxlIG9mIHJ1bm5pbmcgV2luZG93
cyAKYXBwbGljYXRpb25zIG9uIENyb3NzLWFyY2hpdGVjdHVyZSBwYWx0Zm9ybSBvZiBMaW51eC4g
SXQgaXMgYmFzZSBvbiBXaW5lCiBQcm9qZWN0IGFuZCBRZW11IFByb2plY3QuPC9zcGFuPjwvZGl2
PjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoNjQsIDcyLCA5MSk7IGZvbnQtZmFtaWx5OiAt
YXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCBI
ZWx2ZXRpY2EsIEFyaWFsLCAmcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7U2Vn
b2UgVUkgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJIFN5bWJvbCZxdW90OywgJnF1b3Q7TGli
ZXJhdGlvbiBTYW5zJnF1b3Q7LCAmcXVvdDtQaW5nRmFuZyBTQyZxdW90OywgJnF1b3Q7TWljcm9z
b2Z0IFlhSGVpJnF1b3Q7LCAmcXVvdDtIaXJhZ2lubyBTYW5zIEdCJnF1b3Q7LCAmcXVvdDtXZW5x
dWFueWkgTWljcm8gSGVpJnF1b3Q7LCAmcXVvdDtXZW5RdWFuWWkgWmVuIEhlaSZxdW90OywgJnF1
b3Q7U1QgSGVpdGkmcXVvdDssIFNpbUhlaSwgU2ltU3VuLCAmcXVvdDtXZW5RdWFuWWkgWmVuIEhl
aSBTaGFycCZxdW90Oywgc2Fucy1zZXJpZjsiPjxicj48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBz
dHlsZT0iY29sb3I6IHJnYig2NCwgNzIsIDkxKTsgZm9udC1mYW1pbHk6IC1hcHBsZS1zeXN0ZW0s
IEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7U2Vnb2UgVUkmcXVvdDssIEhlbHZldGljYSwgQXJp
YWwsICZxdW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBFbW9qaSZx
dW90OywgJnF1b3Q7U2Vnb2UgVUkgU3ltYm9sJnF1b3Q7LCAmcXVvdDtMaWJlcmF0aW9uIFNhbnMm
cXVvdDssICZxdW90O1BpbmdGYW5nIFNDJnF1b3Q7LCAmcXVvdDtNaWNyb3NvZnQgWWFIZWkmcXVv
dDssICZxdW90O0hpcmFnaW5vIFNhbnMgR0ImcXVvdDssICZxdW90O1dlbnF1YW55aSBNaWNybyBI
ZWkmcXVvdDssICZxdW90O1dlblF1YW5ZaSBaZW4gSGVpJnF1b3Q7LCAmcXVvdDtTVCBIZWl0aSZx
dW90OywgU2ltSGVpLCBTaW1TdW4sICZxdW90O1dlblF1YW5ZaSBaZW4gSGVpIFNoYXJwJnF1b3Q7
LCBzYW5zLXNlcmlmOyI+PC9zcGFuPlByb2plY3QgQWRkcmVzczogaHR0cHM6Ly9naXRsYWIuY29t
L3dpbmUtY2Uvd2luZS1jZTwvZGl2Pg==
------=_Part_1030385_1758026221.1674994145550--


