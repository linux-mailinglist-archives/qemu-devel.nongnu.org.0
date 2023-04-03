Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697666D3F60
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 10:47:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjFp2-00050x-U3; Mon, 03 Apr 2023 04:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1pjFox-00050j-Ky
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 04:45:47 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1pjFou-0005Bb-Pf
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 04:45:47 -0400
Received: from [172.16.75.132] (unknown [49.255.141.98])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3F6FF20034;
 Mon,  3 Apr 2023 16:45:30 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1680511530;
 bh=hyc1DxSRr4BVo0fMczpS0FOeG+yGVTraGJoEtAakX9w=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=KHSOD1BG06L6SRxVWh9SxeeURaDhKBq4zIBV4REDjI4VTigArCQsceO1ELCSBx4D2
 DNDnCp8jDiA0jWPZf70tgKkgYxMxK2WkpK3hkNzdhp9ySC/j15uFTwW1yXGYXGg2Ix
 U8bk7InUN4/wD3DlJ249AmiKFEn9PsZJ/TRJszZ2IO2qUigRceQfMToqQ1hA/Mm3Jw
 2FCmVWSq2kICLU3LIthURXGfBf3BgTlfkH3m9cO/x9MUx10ctsre373iqNRlPbwgQS
 IFco8wFOEJ509bJ1z7q1mv9UReKVtM8XmhZdQGBVCTVLT1THeCqdgF95aOGcT/PPrT
 X7tAjd13xKr5g==
Message-ID: <6e379932f6b74371a464a51727b808ab9115ba9a.camel@codeconstruct.com.au>
Subject: Re: [PATCH 09/16] hw/i3c/aspeed_i3c: Add data TX and RX
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Joe Komlodi <komlodi@google.com>, qemu-devel@nongnu.org
Cc: venture@google.com, peter.maydell@linaro.org
Date: Mon, 03 Apr 2023 16:45:29 +0800
In-Reply-To: <20230331010131.1412571-10-komlodi@google.com>
References: <20230331010131.1412571-1-komlodi@google.com>
 <20230331010131.1412571-10-komlodi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=jk@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

SGkgSm9lLAoKPiArc3RhdGljIHVpbnQ4X3QgYXNwZWVkX2kzY19kZXZpY2VfdGFyZ2V0X2FkZHIo
QXNwZWVkSTNDRGV2aWNlICpzLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVp
bnQxNl90IG9mZnNldCkKPiArewo+ICvCoMKgwqAgaWYgKG9mZnNldCA+IEFTUEVFRF9JM0NfTlJf
REVWSUNFUykgewo+ICvCoMKgwqDCoMKgwqDCoCBxZW11X2xvZ19tYXNrKExPR19HVUVTVF9FUlJP
UiwgIiVzOiBEZXZpY2UgYWRkciB0YWJsZSBvZmZzZXQgJWQgb3V0IG9mICIKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJib3VuZHNcbiIsIG9iamVjdF9nZXRf
Y2Fub25pY2FsX3BhdGgoT0JKRUNUKHMpKSwgb2Zmc2V0KTsKPiArwqDCoMKgwqDCoMKgwqAgLyog
SWYgd2UncmUgb3V0IG9mIGJvdW5kcywgcmV0dXJuIGFuIGFkZHJlc3Mgb2YgMC4gKi8KPiArwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4gK8KgwqDCoCB9Cj4gKwo+ICvCoMKgwqAgdWludDE2X3Qg
ZGV2X2luZGV4ID0gUl9ERVZJQ0VfQUREUl9UQUJMRV9MT0MxICsgb2Zmc2V0Owo+ICvCoMKgwqAg
LyogSTJDIGRldmljZXMgdXNlIGEgc3RhdGljIGFkZHJlc3MuICovCj4gK8KgwqDCoCBpZiAoYXNw
ZWVkX2kzY19kZXZpY2VfdGFyZ2V0X2lzX2kyYyhzLCBvZmZzZXQpKSB7Cj4gK8KgwqDCoMKgwqDC
oMKgIHJldHVybiBGSUVMRF9FWDMyKHMtPnJlZ3NbZGV2X2luZGV4XSwgREVWSUNFX0FERFJfVEFC
TEVfTE9DMSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgREVWX1NUQVRJQ19BRERSKTsKPiArwqDCoMKgIH0KPiArwqDCoMKgIHJldHVybiBGSUVM
RF9FWDMyKHMtPnJlZ3NbZGV2X2luZGV4XSwgREVWSUNFX0FERFJfVEFCTEVfTE9DMSwKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERFVl9EWU5BTUlDX0FERFIp
Owo+ICt9CgpEZXBlbmRpbmcgb24gdGhlIHVzYWdlIG9mIHRoaXMgZnVuY3Rpb24sIHlvdSdsbCBw
cm9iYWJseSB3YW50IHRvIG1hc2sKb3V0IHRoZSBwYXJpdHkgYml0ICh0aGUgbXNiKSBmcm9tIHRo
ZSBERVZfRFlOQU1JQ19BRERSIGZpZWxkLgoKQ3VycmVudGx5LCB5b3UncmUgcmV0dXJuaW5nIHRo
aXMgdmFsdWUgZGlyZWN0bHkgZnJvbSB0aGUgRU5UREFBIGhhbmRsZXIsCndoaWNoIGlzIGVuZGlu
ZyB1cCBhc3NpZ25pbmcgYWRkcmVzc2VzIHdpdGggdGhlIGhpZ2ggYml0IHNldC4KCihkb2luZyBh
IGJpdCBvZiBhIHBpZWNlbWVhbCByZXZpZXcgaGVyZSwgYXMgSSdtIHRlc3Rpbmcgb3V0IHRoZQpt
b2RlbC4uLikKCkNoZWVycywKCgpKZXJlbXkK


