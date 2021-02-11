Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDE8318937
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:17:04 +0100 (CET)
Received: from localhost ([::1]:45196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9y3-00048L-H8
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 06:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lA9vE-0002Gx-QW; Thu, 11 Feb 2021 06:14:10 -0500
Resent-Date: Thu, 11 Feb 2021 06:14:08 -0500
Resent-Message-Id: <E1lA9vE-0002Gx-QW@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lA9v8-00069G-VV; Thu, 11 Feb 2021 06:14:08 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613042039; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=D9Qc0H0JXb6p5Ksru48rCttUnpAyQGW15J/ho02R9hI0LRCmtxJRvb2r7U9mRCc3OTcZI/mmMZuBijmB1qqgKrqBBF61EUyC67/y8o9E/vocX8zO9y4yyXTggrQ1rbFttfMna/4hI6JJxuMnZEpxTDMMyPophXnUdAVNoEpW0lo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613042039;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=RS7PA54cMhdQWC3xV4TbQPoWVf403VhPOkykRUyqjO0=; 
 b=Jfv+y0356knS3rR9Aeb1Rn6NiUvoMdUas+yRx8fGZCdCl5pMpxt7oOamt7oi3WyJRD2TDvGQC+7q74MrUpzGaj+lzlU9xXfLgeRY69solpt4KkZlL55luK5jXPnDfY+gWPNVgs4W5uFFMkT9UZdfIdbTcqt2jsHD7+YLpLhwMOc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1613042036579491.40689524186075;
 Thu, 11 Feb 2021 03:13:56 -0800 (PST)
In-Reply-To: <20210210174122.410690-1-muellerd@fb.com>
Subject: Re: [PATCH v2] target/arm: Correctly initialize MDCR_EL2.HPMN
Message-ID: <161304203545.26113.632198214959924515@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2021 03:13:56 -0800 (PST)
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
Cc: muellerd@fb.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIxMDE3NDEyMi40MTA2
OTAtMS1tdWVsbGVyZEBmYi5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDIxMDE3NDEyMi40MTA2OTAt
MS1tdWVsbGVyZEBmYi5jb20KU3ViamVjdDogW1BBVENIIHYyXSB0YXJnZXQvYXJtOiBDb3JyZWN0
bHkgaW5pdGlhbGl6ZSBNRENSX0VMMi5IUE1OCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMh
L2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5y
ZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQou
L3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQg
RU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4
NApTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjAxNmE0OWUgdGFyZ2V0L2FybTogQ29y
cmVjdGx5IGluaXRpYWxpemUgTURDUl9FTDIuSFBNTgoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJS
T1I6IE1pc3NpbmcgU2lnbmVkLW9mZi1ieTogbGluZShzKQoKdG90YWw6IDEgZXJyb3JzLCAwIHdh
cm5pbmdzLCAzMCBsaW5lcyBjaGVja2VkCgpDb21taXQgMDE2YTQ5ZWEyYjc5ICh0YXJnZXQvYXJt
OiBDb3JyZWN0bHkgaW5pdGlhbGl6ZSBNRENSX0VMMi5IUE1OKSBoYXMgc3R5bGUgcHJvYmxlbXMs
IHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2
ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5U
QUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2Rl
OiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9n
cy8yMDIxMDIxMDE3NDEyMi40MTA2OTAtMS1tdWVsbGVyZEBmYi5jb20vdGVzdGluZy5jaGVja3Bh
dGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQ
YXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sg
dG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

