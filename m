Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FD02B8B68
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 07:14:09 +0100 (CET)
Received: from localhost ([::1]:50642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfdCq-00056S-78
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 01:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kfdBx-0004hF-Ky
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 01:13:13 -0500
Resent-Date: Thu, 19 Nov 2020 01:13:13 -0500
Resent-Message-Id: <E1kfdBx-0004hF-Ky@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kfdBt-0007jh-RN
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 01:13:13 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1605766364; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=irbQ9pWZs/CR0139urfuy3BoRqPylh3D2f6zkK9h4Kw9kyDYbAXgtKu+vnlA9PFPEK5H/WmhwY7bqLiU7nCb+jgGEz6olvz+3dL58pQLzGmKt3hR7D6EV3VkwHsJ0mUQtoKDWhdKQnzaxSP9Yb7UkzWQSUwibGApn2oaEobkFM4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1605766364;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=73QixZJb/RLLA0Nbzy31s/5dthQ0mnpvKu6wh+TMXHI=; 
 b=fVVmKNJt+KyMBvE/1rbfLWeKcBK6bmU7QFUuCSviqVqRM+/fsRoSX/FQ+14gaCZ/RPlJNImMKKVTRTM48bVcKwNX/5KafpVfCNWw/liQNgqHLyW5eDl0MzPYU+GwP0pthqdAuGGAI+kM8hYEb1ILeMqUvk0J4RRRR97So/btOMA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1605766363266673.5921523035836;
 Wed, 18 Nov 2020 22:12:43 -0800 (PST)
In-Reply-To: <20201119060833.25328-1-lma@suse.com>
Subject: Re: [PATCH] qga: Correct loop count in qmp_guest_get_vcpus()
Message-ID: <160576636218.135.12671371933326755064@ba092462a7f3>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: lma@suse.com
Date: Wed, 18 Nov 2020 22:12:43 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 01:12:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: lma@suse.com, qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTExOTA2MDgzMy4yNTMy
OC0xLWxtYUBzdXNlLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUg
Y29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0
aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAxMTE5MDYwODMzLjI1MzI4LTEtbG1h
QHN1c2UuY29tClN1YmplY3Q6IFtQQVRDSF0gcWdhOiBDb3JyZWN0IGxvb3AgY291bnQgaW4gcW1w
X2d1ZXN0X2dldF92Y3B1cygpCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNo
CmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRy
dWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMv
Y2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoK
VXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0
dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAg
ICBwYXRjaGV3LzIwMjAxMTE5MDYwODMzLjI1MzI4LTEtbG1hQHN1c2UuY29tIC0+IHBhdGNoZXcv
MjAyMDExMTkwNjA4MzMuMjUzMjgtMS1sbWFAc3VzZS5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJh
bmNoICd0ZXN0JwoxZGQyOGRlIHFnYTogQ29ycmVjdCBsb29wIGNvdW50IGluIHFtcF9ndWVzdF9n
ZXRfdmNwdXMoKQoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IGVsc2Ugc2hvdWxkIGZvbGxv
dyBjbG9zZSBicmFjZSAnfScKIzkxOiBGSUxFOiBxZ2EvY29tbWFuZHMtcG9zaXguYzoyNDk0Ogog
ICAgICAgICB9CisgICAgICAgIGVsc2UKCkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBl
dmVuIGZvciBzaW5nbGUgc3RhdGVtZW50IGJsb2NrcwojOTE6IEZJTEU6IHFnYS9jb21tYW5kcy1w
b3NpeC5jOjI0OTQ6CisgICAgICAgIGVsc2UKKyAgICAgICAgICAgIG1heF9sb29wX2NvdW50ICs9
IDE7Cgp0b3RhbDogMiBlcnJvcnMsIDAgd2FybmluZ3MsIDI2IGxpbmVzIGNoZWNrZWQKCkNvbW1p
dCAxZGQyOGRlMjBkY2UgKHFnYTogQ29ycmVjdCBsb29wIGNvdW50IGluIHFtcF9ndWVzdF9nZXRf
dmNwdXMoKSkgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRo
ZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFp
bmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpU
ZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFi
bGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDExMTkwNjA4MzMuMjUzMjgtMS1sbWFA
c3VzZS5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5l
cmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBs
ZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

