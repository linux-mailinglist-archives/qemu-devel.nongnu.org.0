Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547D4610CDA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:15:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooLSZ-0000yS-KV; Fri, 28 Oct 2022 05:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uwu@icenowy.me>) id 1ooLSR-0000y8-DL
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:15:20 -0400
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uwu@icenowy.me>) id 1ooLSP-0006Rr-O6
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:15:19 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1666948511; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jdsT5G+mSy/dtVdNbLLuJ87aK01FxOi/s7vrmOQ6OaWnqnXyhD7dLrDMmRG/TAsLTiYo11UHOo9GcCxgoUQYtpFh4kdq8f74DuCGd7GvCcwGj7pWltmu8rnHbV0G+W1MpyxBuaO6Fia287cXW0RG5qdxz7wIeOby3s0uu+QLTHc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1666948511;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=99UNKp4OvSzaAbw+XlfgfChSVxpVNZNuVqLwKXvEz04=; 
 b=cOjipzUQQHWSzL4R+VSs3+/PJjYY2hozOtFYQhdOPDhg9hvKg6AN/arshctBfkcT8dAIlGMnDv9ZM0C/JAveSczJ0fDFd8NWN2ZjS5PtM8Z0eEfmVDDbnAJgn+gqFjxuPYz8IDcj7MyplC+3fWQUhGI3Gez7j8P+MH2sL3r7Hk4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1666948511; 
 s=zmail; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=99UNKp4OvSzaAbw+XlfgfChSVxpVNZNuVqLwKXvEz04=;
 b=DgSpr48LUit9GTQML1CeNCzgpeagutMgIfPlPKG8gQA0PzpszgyujewkYPCKbp6v
 ueEri3M226S1s5jF0B9i3X/b7882PXax92jRJg4VCe6eS7Ku8zR8tMKFgd+UBqXuv3I
 wYUkgFRK3+fhyq/z499ZgOnxhPOal2bXCOLAaJ6A=
Received: from edelgard.fodlan.icenowy.me (112.94.102.53 [112.94.102.53]) by
 mx.zohomail.com with SMTPS id 1666948509024578.00572335497;
 Fri, 28 Oct 2022 02:15:09 -0700 (PDT)
Message-ID: <09b162ed1ae23f0aacf7fc6ef0754fa01291c1ba.camel@icenowy.me>
Subject: Re: [PATCH] tcg/tci: fix logic error when registering helpers via FFI
From: Icenowy Zheng <uwu@icenowy.me>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Date: Fri, 28 Oct 2022 17:15:06 +0800
In-Reply-To: <87tu3oz4xd.fsf@linaro.org>
References: <20221028072145.1593205-1-uwu@icenowy.me>
 <87tu3oz4xd.fsf@linaro.org>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.18; envelope-from=uwu@icenowy.me;
 helo=sender4-op-o18.zoho.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

5ZyoIDIwMjItMTAtMjjmmJ/mnJ/kupTnmoQgMTA6MTMgKzAxMDDvvIxBbGV4IEJlbm7DqWXlhpnp
gZPvvJoKPiAKPiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4gd3JpdGVzOgo+IAo+ID4g
V2hlbiByZWdpc3RlcmluZyBoZWxwZXJzIHZpYSBGRkkgZm9yIFRDSSwgdGhlIGlubmVyIGxvb3Ag
dGhhdAo+ID4gaXRlcmF0ZXMKPiA+IHBhcmFtZXRlcnMgb2YgdGhlIGhlbHBlciByZXVzZXMgKGFu
ZCB0aHVzIHBvbGx1dGVzKSB0aGUgc2FtZQo+ID4gdmFyaWFibGUKPiA+IHVzZWQgYnkgdGhlIG91
dGVyIGxvb3AgdGhhdCBpdGVyYXRlcyBhbGwgaGVscGVycywgdGh1cyBtYWRlIHNvbWUKPiA+IGhl
bHBlcnMKPiA+IHVucmVnaXN0ZXJlZC4KPiA+IAo+ID4gRml4IHRoaXMgbG9naWMgZXJyb3IgYnkg
dXNpbmcgYSBkZWRpY2F0ZWQgdGVtcG9yYXJ5IHZhcmlhYmxlIGZvcgo+ID4gdGhlCj4gPiBpbm5l
ciBsb29wLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93
eS5tZT4KPiA+IC0tLQo+ID4gwqB0Y2cvdGNnLmMgfCA3ICsrKystLS0KPiA+IMKgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL3RjZy90Y2cuYyBiL3RjZy90Y2cuYwo+ID4gaW5kZXggNjEyYTEyZjU4Zi4uYWRmYWY2MWEz
MiAxMDA2NDQKPiA+IC0tLSBhL3RjZy90Y2cuYwo+ID4gKysrIGIvdGNnL3RjZy5jCj4gPiBAQCAt
NjE5LDYgKzYxOSw3IEBAIHN0YXRpYyB2b2lkIHRjZ19jb250ZXh0X2luaXQodW5zaWduZWQgbWF4
X2NwdXMpCj4gPiDCoMKgwqDCoMKgwqDCoMKgIGdwb2ludGVyIGhhc2ggPSAoZ3BvaW50ZXIpKHVp
bnRwdHJfdCl0eXBlbWFzazsKPiA+IMKgwqDCoMKgwqDCoMKgwqAgZmZpX3N0YXR1cyBzdGF0dXM7
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgIGludCBuYXJnczsKPiA+ICvCoMKgwqDCoMKgwqDCoCBpbnQg
ajsKPiAKPiBZb3UgY291bGQgdHVjayB0aGlzIHZhcmlhYmxlIGRlZmluaXRpb24uLi4KPiAKPiAK
PiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgIGlmIChnX2hhc2hfdGFibGVfbG9va3VwKGZmaV90
YWJsZSwgaGFzaCkpIHsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPiA+
IEBAIC02MzQsOSArNjM1LDkgQEAgc3RhdGljIHZvaWQgdGNnX2NvbnRleHRfaW5pdCh1bnNpZ25l
ZCBtYXhfY3B1cykKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgIGlmIChuYXJncyAhPSAwKSB7
Cj4gCj4gaGVyZSB0byBrZWVwIHRoaW5ncyBtb3JlIGxvY2FsLgoKT29wcyBJIHdhcyB0cnlpbmcg
dG8gZmluZCB0aGUgbmVhcmVzdCBleGlzdGluZyB2YXJpYWJsZSBkZWZpbml0aW9uIHdoZW4Kd3Jp
dGluZyB0aGlzLCBhbmQgZm9yZ2V0IHRoaXMgaXMgYSBibG9jaydzIHN0YXJ0LgoKVGhhbmtzIGZv
ciB0aGlzIHRpcApJY2Vub3d5IFpoZW5nCgo+IAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNhLT5jaWYuYXJnX3R5cGVzID0gY2EtPmFyZ3M7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBmb3IgKGkgPSAwOyBpIDwgbmFyZ3M7ICsraSkgewo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpbnQgdHlwZWNvZGUgPSBleHRyYWN0MzIodHlwZW1hc2ssIChpICsgMSkgKiAz
LAo+ID4gMyk7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhLT5hcmdzW2ld
ID0gdHlwZWNvZGVfdG9fZmZpW3R5cGVjb2RlXTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGZvciAoaiA9IDA7IGogPCBuYXJnczsgKytqKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGludCB0eXBlY29kZSA9IGV4dHJhY3QzMih0eXBlbWFzaywgKGogKyAxKSAqIDMs
Cj4gPiAzKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2EtPmFyZ3Nbal0g
PSB0eXBlY29kZV90b19mZmlbdHlwZWNvZGVdOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IH0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgfQo+IAo+IE90aGVyd2lzZToKPiAKPiBSZXZpZXdlZC1i
eTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgo+IAoK


