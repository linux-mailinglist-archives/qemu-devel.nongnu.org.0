Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CE3611EC6
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 02:46:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooZy2-0003gE-3H; Fri, 28 Oct 2022 20:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uwu@icenowy.me>) id 1ooZy0-0003g5-K3
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 20:44:52 -0400
Received: from sender4-op-o13.zoho.com ([136.143.188.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uwu@icenowy.me>) id 1ooZxy-0008Vv-Qr
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 20:44:52 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1667004286; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GL7UvO7THKcDYOZyM5kSzVsXTBM04gaf7u/+XR1ZDXmQ23br6Zecfq3Uxz4Qz6iHThe980o3o7m9ZwQYq8cuEzGwPLzTmhFmQfj6+xUDAaPgLhi9G9JgpdkeKX49Z0hOJuVPG1unvReeU2ObOQXW67Pgu9hgWb7ysl1BOmTgssI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1667004286;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=v/XaPOkQ1OIaJBMJX7y9nQuXar1mytEaEalDkaSp7og=; 
 b=CLQRkDDwbPqnHWYnM4Z/nPsowN86rlYwUSYsvlXGg4+Y9f2T5HUjuVqgZm8BVEsOufIpfrKEu35vOFM2xULuRhqwHqdTQpYqNo/574JrD3OZkfQ7V7eCnZq5CQGldV8Xw1Jv44+uss7LQBUugiEy3bwZW6/nNIZR3nzk1xN2P18=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1667004286; 
 s=zmail; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=v/XaPOkQ1OIaJBMJX7y9nQuXar1mytEaEalDkaSp7og=;
 b=YfN8j7F2sqamid9p2XHABL17mGoEMHgpXg/wP6n8xR1wiPiXwSrFp8rsxGiPLbWN
 iQ7/F3iye7m8ZwxegcaxLI6xmwLX4J92vODWL+lM2AxNX1DwSIgA8xsOujCHJlIRMF8
 SUdMCqnoHmPsopcpt57kafw7RJtTL8qS3qMg/szM=
Received: from edelgard.fodlan.icenowy.me (112.94.102.53 [112.94.102.53]) by
 mx.zohomail.com with SMTPS id 1667004283995229.24370814474958;
 Fri, 28 Oct 2022 17:44:43 -0700 (PDT)
Message-ID: <8e47bd2257004301fcd3ae17705e6b5351875f83.camel@icenowy.me>
Subject: Re: [PATCH] tcg/tci: fix logic error when registering helpers via FFI
From: Icenowy Zheng <uwu@icenowy.me>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Date: Sat, 29 Oct 2022 08:44:41 +0800
In-Reply-To: <f28c1d8f-d30d-fc24-ce4e-88aba776abe2@linaro.org>
References: <20221028072145.1593205-1-uwu@icenowy.me>
 <f28c1d8f-d30d-fc24-ce4e-88aba776abe2@linaro.org>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.13; envelope-from=uwu@icenowy.me;
 helo=sender4-op-o13.zoho.com
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

5ZyoIDIwMjItMTAtMjnmmJ/mnJ/lha3nmoQgMDY6MjggKzExMDDvvIxSaWNoYXJkIEhlbmRlcnNv
buWGmemBk++8mgo+IE9uIDEwLzI4LzIyIDE4OjIxLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+ID4g
V2hlbiByZWdpc3RlcmluZyBoZWxwZXJzIHZpYSBGRkkgZm9yIFRDSSwgdGhlIGlubmVyIGxvb3Ag
dGhhdAo+ID4gaXRlcmF0ZXMKPiA+IHBhcmFtZXRlcnMgb2YgdGhlIGhlbHBlciByZXVzZXMgKGFu
ZCB0aHVzIHBvbGx1dGVzKSB0aGUgc2FtZQo+ID4gdmFyaWFibGUKPiA+IHVzZWQgYnkgdGhlIG91
dGVyIGxvb3AgdGhhdCBpdGVyYXRlcyBhbGwgaGVscGVycywgdGh1cyBtYWRlIHNvbWUKPiA+IGhl
bHBlcnMKPiA+IHVucmVnaXN0ZXJlZC4KPiA+IAo+ID4gRml4IHRoaXMgbG9naWMgZXJyb3IgYnkg
dXNpbmcgYSBkZWRpY2F0ZWQgdGVtcG9yYXJ5IHZhcmlhYmxlIGZvcgo+ID4gdGhlCj4gPiBpbm5l
ciBsb29wLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93
eS5tZT4KPiA+IC0tLQo+ID4gwqAgdGNnL3RjZy5jIHwgNyArKysrLS0tCj4gPiDCoCAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvdGNnL3RjZy5jIGIvdGNnL3RjZy5jCj4gPiBpbmRleCA2MTJhMTJmNThmLi5hZGZhZjYx
YTMyIDEwMDY0NAo+ID4gLS0tIGEvdGNnL3RjZy5jCj4gPiArKysgYi90Y2cvdGNnLmMKPiA+IEBA
IC02MTksNiArNjE5LDcgQEAgc3RhdGljIHZvaWQgdGNnX2NvbnRleHRfaW5pdCh1bnNpZ25lZCBt
YXhfY3B1cykKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCBncG9pbnRlciBoYXNoID0gKGdwb2ludGVy
KSh1aW50cHRyX3QpdHlwZW1hc2s7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqAgZmZpX3N0YXR1cyBz
dGF0dXM7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqAgaW50IG5hcmdzOwo+ID4gK8KgwqDCoMKgwqDC
oMKgIGludCBqOwo+ID4gwqAgCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGdfaGFzaF90YWJs
ZV9sb29rdXAoZmZpX3RhYmxlLCBoYXNoKSkgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY29udGludWU7Cj4gPiBAQCAtNjM0LDkgKzYzNSw5IEBAIHN0YXRpYyB2b2lkIHRjZ19jb250
ZXh0X2luaXQodW5zaWduZWQgbWF4X2NwdXMpCj4gPiDCoCAKPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiAobmFyZ3MgIT0gMCkgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2EtPmNp
Zi5hcmdfdHlwZXMgPSBjYS0+YXJnczsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciAo
aSA9IDA7IGkgPCBuYXJnczsgKytpKSB7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGludCB0eXBlY29kZSA9IGV4dHJhY3QzMih0eXBlbWFzaywgKGkgKyAxKSAqIDMsCj4gPiAz
KTsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2EtPmFyZ3NbaV0gPSB0eXBl
Y29kZV90b19mZmlbdHlwZWNvZGVdOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChq
ID0gMDsgaiA8IG5hcmdzOyArK2opIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaW50IHR5cGVjb2RlID0gZXh0cmFjdDMyKHR5cGVtYXNrLCAoaiArIDEpICogMywKPiA+IDMp
Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYS0+YXJnc1tqXSA9IHR5cGVj
b2RlX3RvX2ZmaVt0eXBlY29kZV07Cj4gCj4gT2ggbXkuwqAgSSdtIHN1cnByaXNlZCBhbnkgdGVz
dCBjYXNlcyBhdCBhbGwgd29ya2VkLgo+IFF1ZXVlZCB0byB0Y2ctbmV4dCwgd2l0aCB0aGUgZGVj
bGFyYXRpb24gb2YgaiBtb3ZlZCB0byB0aGUgbG9vcAo+IGl0c2VsZjoKPiAKPiDCoMKgwqDCoMKg
wqDCoMKgZm9yIChpbnQgaiA9IDA7IGogPCBuYXJnczsgKytqKQoKQWggSSB0aGluayB0aGlzIGlz
IGEgQzk5IGZlYXR1cmUuIElzIG91ciBDIHN0YW5kYXJkIGJhc2VsaW5lIGhpZ2gKZW5vdWdoIHRv
IHVzZSBpdD8KCj4gCj4gCj4gcn4KPiAKCg==


