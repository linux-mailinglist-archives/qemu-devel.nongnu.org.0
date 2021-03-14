Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051FE33A8BC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:20:06 +0100 (CET)
Received: from localhost ([::1]:34450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLa1l-00046x-1m
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lLZzz-00033J-B3
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:18:18 -0400
Resent-Date: Sun, 14 Mar 2021 19:18:15 -0400
Resent-Message-Id: <E1lLZzz-00033J-B3@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lLZzu-0006c0-VT
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:18:14 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1615763748; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=P7GgjgtSSWsxZ+sdt4cvhnnHdYwArEkIMdtr9pgzjJ3uVRKeNaSdLSqGBS/7tSPpu3V5+WQ6NIN+2bHYoE/oglQxFuR4sAmksZ/HRkOb6pu17S45T8X3kMaAy0jY/U5RLXD09PrG6q39cqY25NghguJFJSVs9N/E+k2HGgEG6zo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615763748;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=k7Fzd7tRC/DIVaTfOUCYLybHzvPnwrmWD8l+wIGs98A=; 
 b=jyHPOSI55HegdOFbDS25cmQayGppvVxuAtQlpbURv7TlRfSyETqh4Y98b2TrOxcrzo3TUVHjn4IorKFHg+9FHnzNzCatdxUcM9EnzR76NLizyvgjhctC+40BKQSs1Lhpt8EXFctTd4NVd937eHB6IkRbDRP1BQzApFGjbGB3QJ0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615763746716439.207338082173;
 Sun, 14 Mar 2021 16:15:46 -0700 (PDT)
In-Reply-To: <20210314231015.29166-1-alxndr@bu.edu>
Subject: Re: [PATCH] fuzz: check machine, before PC-specific code
Message-ID: <161576374505.17188.11442629030832144638@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alxndr@bu.edu
Date: Sun, 14 Mar 2021 16:15:46 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: qemu-devel@nongnu.org
Cc: lvivier@redhat.com, thuth@redhat.com, darren.kenny@oracle.com,
 qemu-devel@nongnu.org, f4bug@amsat.org, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxNDIzMTAxNS4yOTE2
Ni0xLWFseG5kckBidS5lZHUvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBzb21l
IGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZvcm1h
dGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDMxNDIzMTAxNS4yOTE2Ni0xLWFs
eG5kckBidS5lZHUKU3ViamVjdDogW1BBVENIXSBmdXp6OiBjaGVjayBtYWNoaW5lLCBiZWZvcmUg
UEMtc3BlY2lmaWMgY29kZQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApn
aXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVl
CmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2No
ZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVw
ZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRw
czovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAg
cGF0Y2hldy8yMDIxMDMxNDIzMTAxNS4yOTE2Ni0xLWFseG5kckBidS5lZHUgLT4gcGF0Y2hldy8y
MDIxMDMxNDIzMTAxNS4yOTE2Ni0xLWFseG5kckBidS5lZHUKU3dpdGNoZWQgdG8gYSBuZXcgYnJh
bmNoICd0ZXN0JwpiYjhlMDhkIGZ1eno6IGNoZWNrIG1hY2hpbmUsIGJlZm9yZSBQQy1zcGVjaWZp
YyBjb2RlCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogImZvbyogYmFyIiBzaG91bGQgYmUg
ImZvbyAqYmFyIgojMjU6IEZJTEU6IHRlc3RzL3F0ZXN0L2Z1enovZ2VuZXJpY19mdXp6LmM6Nzg3
OgorICAgIGNvbnN0IGNoYXIqIG1hY2hpbmVfdHlwZTsKCkVSUk9SOiBzcGFjZSByZXF1aXJlZCBi
ZWZvcmUgdGhlIG9wZW4gcGFyZW50aGVzaXMgJygnCiMzNzogRklMRTogdGVzdHMvcXRlc3QvZnV6
ei9nZW5lcmljX2Z1enouYzo4MzI6CisgICAgaWYoZnV6emFibGVfcGNpX2RldmljZXMtPmxlbiAm
JiBzdHJzdHIobWFjaGluZV90eXBlLCAicGMiKSA9PSBtYWNoaW5lX3R5cGUpCgp0b3RhbDogMiBl
cnJvcnMsIDAgd2FybmluZ3MsIDIzIGxpbmVzIGNoZWNrZWQKCkNvbW1pdCBiYjhlMDhkODkzOTgg
KGZ1eno6IGNoZWNrIG1hY2hpbmUsIGJlZm9yZSBQQy1zcGVjaWZpYyBjb2RlKSBoYXMgc3R5bGUg
cHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxz
ZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENI
IGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQg
d2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hl
dy5vcmcvbG9ncy8yMDIxMDMxNDIzMTAxNS4yOTE2Ni0xLWFseG5kckBidS5lZHUvdGVzdGluZy5j
aGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxs
eSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVl
ZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

