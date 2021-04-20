Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C0A36510A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 05:41:09 +0200 (CEST)
Received: from localhost ([::1]:40626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYhG7-0001W7-Jr
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 23:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lYhF9-00015E-Of
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 23:40:07 -0400
Resent-Date: Mon, 19 Apr 2021 23:40:07 -0400
Resent-Message-Id: <E1lYhF9-00015E-Of@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lYhF7-0005g4-AS
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 23:40:07 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618889987; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QIvzL7usUtL4dhzHiGEA89NB6uW9/CAjwXCsJ0uPg34vtTBsZNO22e0mo0TpcVihcLwFztF0XTlm1XJhbymki0Kj7knkssuNQgzw0DxiE9EzCSleSNRJcqy6K6vN4tyTT3g2hIvsr+GXYhETrKahWZMiNr3FL1oAMXRg7ytnvVI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1618889987;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=k/i9pMyzbbL66W8AobDSTWTw23Y5fGWmoXJcFgFc2gg=; 
 b=AVnZji1QLw9DS+HfY73wOiA+jmIgvAXaqR/OxXNhM7BJDS08ZSfz48a+AGoPqSto9OS3KKsH6QRMiZhfA2tCdh9hGRBQ8o/gWHbcBJaCjcebHuaVNPGs8Wg2cWNPGS5bp0owbhSAjCL4HdU+xzLwL6UfDaqeX66qX3zqMqI2TRM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1618889985395467.22472703895255;
 Mon, 19 Apr 2021 20:39:45 -0700 (PDT)
In-Reply-To: <1618889702-13104-1-git-send-email-igor.druzhinin@citrix.com>
Subject: Re: [PATCH] xen-mapcache: avoid a race on memory map while using
 MAP_FIXED
Message-ID: <161888998361.15979.8661085658302494664@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Date: Mon, 19 Apr 2021 20:39:45 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: igor.druzhinin@citrix.com, sstabellini@kernel.org, ehabkost@redhat.com,
 mst@redhat.com, paul@xen.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pbonzini@redhat.com, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjE4ODg5NzAyLTEzMTA0LTEt
Z2l0LXNlbmQtZW1haWwtaWdvci5kcnV6aGluaW5AY2l0cml4LmNvbS8KCgoKSGksCgpUaGlzIHNl
cmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0
IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDE2
MTg4ODk3MDItMTMxMDQtMS1naXQtc2VuZC1lbWFpbC1pZ29yLmRydXpoaW5pbkBjaXRyaXguY29t
ClN1YmplY3Q6IFtQQVRDSF0geGVuLW1hcGNhY2hlOiBhdm9pZCBhIHJhY2Ugb24gbWVtb3J5IG1h
cCB3aGlsZSB1c2luZyBNQVBfRklYRUQKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmlu
L2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmln
IC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFt
ZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2Ny
aXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQg
PT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZy
b20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAg
ICAgICAgIHBhdGNoZXcvMTYxODg4OTcwMi0xMzEwNC0xLWdpdC1zZW5kLWVtYWlsLWlnb3IuZHJ1
emhpbmluQGNpdHJpeC5jb20gLT4gcGF0Y2hldy8xNjE4ODg5NzAyLTEzMTA0LTEtZ2l0LXNlbmQt
ZW1haWwtaWdvci5kcnV6aGluaW5AY2l0cml4LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2gg
J3Rlc3QnCjMxMDI1MTkgeGVuLW1hcGNhY2hlOiBhdm9pZCBhIHJhY2Ugb24gbWVtb3J5IG1hcCB3
aGlsZSB1c2luZyBNQVBfRklYRUQKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBBdXRob3Ig
ZW1haWwgYWRkcmVzcyBpcyBtYW5nbGVkIGJ5IHRoZSBtYWlsaW5nIGxpc3QKIzI6IApBdXRob3I6
IElnb3IgRHJ1emhpbmluIHZpYSA8cWVtdS1kZXZlbEBub25nbnUub3JnPgoKdG90YWw6IDEgZXJy
b3JzLCAwIHdhcm5pbmdzLCAyMSBsaW5lcyBjaGVja2VkCgpDb21taXQgMzEwMjUxOTlhMWI0ICh4
ZW4tbWFwY2FjaGU6IGF2b2lkIGEgcmFjZSBvbiBtZW1vcnkgbWFwIHdoaWxlIHVzaW5nIE1BUF9G
SVhFRCkgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNl
IGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVy
LCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0
IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUg
YXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMTYxODg4OTcwMi0xMzEwNC0xLWdpdC1zZW5kLWVt
YWlsLWlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1l
c3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRw
czovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1k
ZXZlbEByZWRoYXQuY29t

