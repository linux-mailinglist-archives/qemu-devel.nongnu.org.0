Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992F4318960
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:27:35 +0100 (CET)
Received: from localhost ([::1]:49006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAA8E-0007Ux-E1
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 06:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lAA6v-0006lp-Gj
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:26:13 -0500
Resent-Date: Thu, 11 Feb 2021 06:26:13 -0500
Resent-Message-Id: <E1lAA6v-0006lp-Gj@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lAA6s-0003De-Va
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:26:13 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613042727; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dtn46RptpUjDzrnUhBd1yy6GOyY/zSQCJs3RgcAPsM01XQiURqKd1Z/tMia3x+jhaKT8OJZn6MtU5ksHEBTrxFSANtJ0oWGkc0hwCRQLadpxM9+PptwlWQ8nQErS1ewSB06xeoVBLVthQ8jMZzPaYQ1mBzH+pUdPV0dm5kwRYzs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613042727;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Nre+Oj1nvVQPEa78UBqHblOIKkD2M0OSWtTx7B7ZuUk=; 
 b=GiZEkF/fsB0efVlv8qM7gb9eeV5XxdgOEMOPni6mVVQxaNODthVw6N53iPsxOug4sYDe9qG7N5ehuR6LDwWHMb3RqNLvQ1ePfYds61ZAwlEJkOlfgisfyiT/B410b7o1AktAktiPzMH20IKQHtvoFhrjUEeysO9FfsGmwblV6ds=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 161304272460333.79630842716438;
 Thu, 11 Feb 2021 03:25:24 -0800 (PST)
In-Reply-To: <20210210234334.3750022-1-f4bug@amsat.org>
Subject: Re: [RFC PATCH] target/mips/cp0_timer: Use new clock_ns_to_ticks()
Message-ID: <161304272319.26113.12503101478176267986@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: f4bug@amsat.org
Date: Thu, 11 Feb 2021 03:25:24 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, aleksandar.rikalo@syrmia.com, luc@lmichel.fr,
 qemu-devel@nongnu.org, f4bug@amsat.org, wuhaotsh@google.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIxMDIzNDMzNC4zNzUw
MDIyLTEtZjRidWdAYW1zYXQub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAyMTAyMzQzMzQuMzc1MDAy
Mi0xLWY0YnVnQGFtc2F0Lm9yZwpTdWJqZWN0OiBbUkZDIFBBVENIXSB0YXJnZXQvbWlwcy9jcDBf
dGltZXI6IFVzZSBuZXcgY2xvY2tfbnNfdG9fdGlja3MoKQoKPT09IFRFU1QgU0NSSVBUIEJFR0lO
ID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAw
CmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2Fs
IGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0
b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1Qg
U0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4
ODg3MTMzODQKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo4NmMwZTk1IHRhcmdldC9t
aXBzL2NwMF90aW1lcjogVXNlIG5ldyBjbG9ja19uc190b190aWNrcygpCgo9PT0gT1VUUFVUIEJF
R0lOID09PQpFUlJPUjogc3BhY2UgcHJvaGliaXRlZCBhZnRlciB0aGF0ICctJyAoY3R4OkV4VykK
IzM5OiBGSUxFOiB0YXJnZXQvbWlwcy9jcDBfdGltZXIuYzo0MToKKyAgICAgICAgICAgLSAodWlu
dDMyX3QpKG5vd190aWNrcyAvIGNwdS0+Y3AwX2NvdW50X3JhdGUpOwogICAgICAgICAgICBeCgpX
QVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojNzc6IEZJTEU6IHRhcmdldC9taXBzL2Nw
MF90aW1lci5jOjkyOgorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBxZW11X2Nsb2NrX2dldF9ucyhRRU1VX0NMT0NLX1ZJUlRVQUwpKTsKCldBUk5JTkc6IGxpbmUg
b3ZlciA4MCBjaGFyYWN0ZXJzCiM4MjogRklMRTogdGFyZ2V0L21pcHMvY3AwX3RpbWVyLmM6OTQ6
CisgICAgICAgIGVudi0+Q1AwX0NvdW50ID0gY291bnQgLSAodWludDMyX3QpKGNwMF9jb3VudF90
aWNrcyAvIGNwdS0+Y3AwX2NvdW50X3JhdGUpOwoKdG90YWw6IDEgZXJyb3JzLCAyIHdhcm5pbmdz
LCAxMDQgbGluZXMgY2hlY2tlZAoKQ29tbWl0IDg2YzBlOTU5ZWQyMyAodGFyZ2V0L21pcHMvY3Aw
X3RpbWVyOiBVc2UgbmV3IGNsb2NrX25zX3RvX3RpY2tzKCkpIGhhcyBzdHlsZSBwcm9ibGVtcywg
cGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZl
cyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRB
SU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6
IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dz
LzIwMjEwMjEwMjM0MzM0LjM3NTAwMjItMS1mNGJ1Z0BhbXNhdC5vcmcvdGVzdGluZy5jaGVja3Bh
dGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQ
YXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sg
dG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

