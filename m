Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6627B1BA39F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 14:31:20 +0200 (CEST)
Received: from localhost ([::1]:43132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jT2us-0004IP-Uy
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 08:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36970)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jT2tJ-000310-9G
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 08:29:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jT2tH-0004zQ-Bs
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 08:29:40 -0400
Resent-Date: Mon, 27 Apr 2020 08:29:40 -0400
Resent-Message-Id: <E1jT2tH-0004zQ-Bs@eggs.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jT2tG-0004qu-Rf
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 08:29:39 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1587990567; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=akxKgogOJY03C0wb+FaK4gC1qSC+Yt1Y1OkeEnu64DyEGps6ldCbJ7bCgXSNrW23Rzs/B8Vs4I4ekVoLHhyzLkP7MoalMx3SXMhQ7QqQfluFKTQ75ybm2v/cdb/r0JOa9r9cB83AyMKSAfecgySZgaG8ntHWdHSL1SfPtRfUl1o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1587990567;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=gAV204A0qIiqHNQeMUWtiXLmG4XSrNL+ZybIA4aiWus=; 
 b=MNUehTCJ3VJkFWM6HlYB7gnOorYKzva+3DeiFi4ONWxZ890cuZMC3i5bmVIIojWJV0bfbPALEePCmPns5O6K6WvWb1gQc+6s3OtwTYneI7ptnv/w6AvbKRiHb6CjXg/N0x/WGWy+VtKB9cr+PvmpHPysTiuYVnuKuATLKVSF0bU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1587990565851875.3881499211577;
 Mon, 27 Apr 2020 05:29:25 -0700 (PDT)
In-Reply-To: <20200427121823.8094-1-changbin.du@gmail.com>
Subject: Re: [PATCH] ui/sdl2: fix segment fault caused by null pointer
 dereference
Message-ID: <158799056471.15667.6442297744656027949@39012742ff91>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: changbin.du@gmail.com
Date: Mon, 27 Apr 2020 05:29:25 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/27 08:29:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Received-From: 136.143.188.53
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
Cc: changbin.du@gmail.com, kraxel@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDQyNzEyMTgyMy44MDk0
LTEtY2hhbmdiaW4uZHVAZ21haWwuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUg
YXNhbiBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21tYW5kcyBhbmQKdGhl
aXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVkLCB5b3UgY2FuIHBy
b2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQoj
IS9iaW4vYmFzaApleHBvcnQgQVJDSD14ODZfNjQKbWFrZSBkb2NrZXItaW1hZ2UtZmVkb3JhIFY9
MSBORVRXT1JLPTEKdGltZSBtYWtlIGRvY2tlci10ZXN0LWRlYnVnQGZlZG9yYSBUQVJHRVRfTElT
VD14ODZfNjQtc29mdG1tdSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoK
ICBCVUlMRCAgIHBjLWJpb3Mvb3B0aW9ucm9tL2xpbnV4Ym9vdF9kbWEuaW1nCiAgQlVJTEQgICBw
Yy1iaW9zL29wdGlvbnJvbS9saW51eGJvb3RfZG1hLnJhdwogIFNJR04gICAgcGMtYmlvcy9vcHRp
b25yb20vbGludXhib290X2RtYS5iaW4KL3RtcC9xZW11LXRlc3Qvc3JjL3VpL3NkbDIuYzo0MTg6
MTA6IGVycm9yOiB1c2Ugb2YgdW5kZWNsYXJlZCBpZGVudGlmaWVyICdzY29uZicKICAgIGlmICgh
c2NvbmYpCiAgICAgICAgIF4KMSBlcnJvciBnZW5lcmF0ZWQuCm1ha2U6ICoqKiBbL3RtcC9xZW11
LXRlc3Qvc3JjL3J1bGVzLm1hazo2OTogdWkvc2RsMi5vXSBFcnJvciAxCm1ha2U6ICoqKiBXYWl0
aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uClRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBs
YXN0KToKICBGaWxlICIuL3Rlc3RzL2RvY2tlci9kb2NrZXIucHkiLCBsaW5lIDY2NCwgaW4gPG1v
ZHVsZT4KLS0tCiAgICByYWlzZSBDYWxsZWRQcm9jZXNzRXJyb3IocmV0Y29kZSwgY21kKQpzdWJw
cm9jZXNzLkNhbGxlZFByb2Nlc3NFcnJvcjogQ29tbWFuZCAnWydzdWRvJywgJy1uJywgJ2RvY2tl
cicsICdydW4nLCAnLS1sYWJlbCcsICdjb20ucWVtdS5pbnN0YW5jZS51dWlkPTRmYTcwMmU0MWEx
NTQxMzc5YzA5NzI5NzI3MTcxMmY3JywgJy11JywgJzEwMDEnLCAnLS1zZWN1cml0eS1vcHQnLCAn
c2VjY29tcD11bmNvbmZpbmVkJywgJy0tcm0nLCAnLWUnLCAnVEFSR0VUX0xJU1Q9eDg2XzY0LXNv
ZnRtbXUnLCAnLWUnLCAnRVhUUkFfQ09ORklHVVJFX09QVFM9JywgJy1lJywgJ1Y9JywgJy1lJywg
J0o9MTQnLCAnLWUnLCAnREVCVUc9JywgJy1lJywgJ1NIT1dfRU5WPScsICctZScsICdDQ0FDSEVf
RElSPS92YXIvdG1wL2NjYWNoZScsICctdicsICcvaG9tZS9wYXRjaGV3Ly5jYWNoZS9xZW11LWRv
Y2tlci1jY2FjaGU6L3Zhci90bXAvY2NhY2hlOnonLCAnLXYnLCAnL3Zhci90bXAvcGF0Y2hldy10
ZXN0ZXItdG1wLXhzaDR1ZHg3L3NyYy9kb2NrZXItc3JjLjIwMjAtMDQtMjctMDguMjUuMDMuMTYy
MTk6L3Zhci90bXAvcWVtdTp6LHJvJywgJ3FlbXU6ZmVkb3JhJywgJy92YXIvdG1wL3FlbXUvcnVu
JywgJ3Rlc3QtZGVidWcnXScgcmV0dXJuZWQgbm9uLXplcm8gZXhpdCBzdGF0dXMgMi4KZmlsdGVy
PS0tZmlsdGVyPWxhYmVsPWNvbS5xZW11Lmluc3RhbmNlLnV1aWQ9NGZhNzAyZTQxYTE1NDEzNzlj
MDk3Mjk3MjcxNzEyZjcKbWFrZVsxXTogKioqIFtkb2NrZXItcnVuXSBFcnJvciAxCm1ha2VbMV06
IExlYXZpbmcgZGlyZWN0b3J5IGAvdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAteHNoNHVkeDcv
c3JjJwptYWtlOiAqKiogW2RvY2tlci1ydW4tdGVzdC1kZWJ1Z0BmZWRvcmFdIEVycm9yIDIKCnJl
YWwgICAgNG0yMi44NDFzCnVzZXIgICAgMG05LjE5MHMKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxh
YmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAwNDI3MTIxODIzLjgwOTQtMS1jaGFu
Z2Jpbi5kdUBnbWFpbC5jb20vdGVzdGluZy5hc2FuLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBn
ZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10u
ClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

