Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B10C2AD9D6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:12:19 +0100 (CET)
Received: from localhost ([::1]:47850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcVJi-0004vf-Kr
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kcVHX-000385-B1; Tue, 10 Nov 2020 10:10:04 -0500
Resent-Date: Tue, 10 Nov 2020 10:10:03 -0500
Resent-Message-Id: <E1kcVHX-000385-B1@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kcVHS-0001o1-SH; Tue, 10 Nov 2020 10:10:02 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1605020987; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lbZs748E6xpNmBXXyC2BfYWcACmA90XbjdDCRtLMWrjAnsgcrrkAk1kXBYn6tyk4uX+j7dE4UW225HWuAvvMEfoA6nQi2TpzSQe9+Z4KWInBF4m2hvqHSQi1HFgWKhEZp36x4AVv074LGOrkVLbaZhghG7Nh0r27gNNYhCkSHfw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1605020987;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=ahw9lx4XdayeyF4oq/xhs/x8yitXlipi7tAuWeyN9xg=; 
 b=S90RIwH9I6aRjIhkzd+k82cgd+8MtnhX3D/7mZxREawvGLa1ic9Yp45w6mA5P+x9xkqieUb0Hr6JVzzMhkHfeMveEhewSSBCcZDcxbzf2DeWbzgs6zwtRbRzC0YoK8uq/A3daO1domg1d2WXmFyehKXC4FXjjhgFzbMSMQfhzyY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1605020984456302.14865471784856;
 Tue, 10 Nov 2020 07:09:44 -0800 (PST)
Message-ID: <160502098305.21680.18015917231395096308@b92d57cec08d>
Subject: Re: [PATCH 0/2] hw/misc/tmp105: Correct temperature limit check logic
In-Reply-To: <20201110150023.25533-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Date: Tue, 10 Nov 2020 07:09:44 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 10:09:50
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTExMDE1MDAyMy4yNTUz
My0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0
byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgpt
b3JlIGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogMjAyMDExMTAxNTAwMjMuMjU1MzMtMS1wZXRl
ci5tYXlkZWxsQGxpbmFyby5vcmcKU3ViamVjdDogW1BBVENIIDAvMl0gIGh3L21pc2MvdG1wMTA1
OiBDb3JyZWN0IHRlbXBlcmF0dXJlIGxpbWl0IGNoZWNrIGxvZ2ljClR5cGU6IHNlcmllcwoKPT09
IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAv
ZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFj
ayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4
NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hl
dy1wcm9qZWN0L3FlbXUKIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8xNjA0NjQzODkzLTgy
MjMtMS1naXQtc2VuZC1lbWFpbC16aGVuZ2NodWFuQGh1YXdlaS5jb20gLT4gcGF0Y2hldy8xNjA0
NjQzODkzLTgyMjMtMS1naXQtc2VuZC1lbWFpbC16aGVuZ2NodWFuQGh1YXdlaS5jb20KIC0gW3Rh
ZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIwMTEwNDE3MjUxMi4yMzgxNjU2LTEtZWhhYmtvc3RA
cmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjAxMTA0MTcyNTEyLjIzODE2NTYtMS1laGFia29zdEBy
ZWRoYXQuY29tCiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMDExMDkwOTE3MTkuMjQ0
OTE0MS0xLWY0YnVnQGFtc2F0Lm9yZyAtPiBwYXRjaGV3LzIwMjAxMTA5MDkxNzE5LjI0NDkxNDEt
MS1mNGJ1Z0BhbXNhdC5vcmcKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIwMTExMDE1
MDAyMy4yNTUzMy0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZyAtPiBwYXRjaGV3LzIwMjAxMTEw
MTUwMDIzLjI1NTMzLTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnClN3aXRjaGVkIHRvIGEgbmV3
IGJyYW5jaCAndGVzdCcKYWVlYjA0MSB0bXAxMDU6IENvcnJlY3QgaGFuZGxpbmcgb2YgdGVtcGVy
YXR1cmUgbGltaXQgY2hlY2tzCmQ1YzZiY2EgaHcvbWlzYy90bXAxMDU6IHJlc2V0IHRoZSBUX2xv
dyBhbmQgVF9IaWdoIHJlZ2lzdGVycwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS8yIENoZWNraW5n
IGNvbW1pdCBkNWM2YmNhMTkwNGMgKGh3L21pc2MvdG1wMTA1OiByZXNldCB0aGUgVF9sb3cgYW5k
IFRfSGlnaCByZWdpc3RlcnMpCjIvMiBDaGVja2luZyBjb21taXQgYWVlYjA0MTlmNjczICh0bXAx
MDU6IENvcnJlY3QgaGFuZGxpbmcgb2YgdGVtcGVyYXR1cmUgbGltaXQgY2hlY2tzKQpFUlJPUjog
c3BhY2VzIHJlcXVpcmVkIGFyb3VuZCB0aGF0ICcqJyAoY3R4OlZ4VikKIzEyMDogRklMRTogaHcv
bWlzYy90bXAxMDUuYzoyNjM6CisgICAgLnN1YnNlY3Rpb25zID0gKGNvbnN0IFZNU3RhdGVEZXNj
cmlwdGlvbipbXSkgewogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBeCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDEwOCBsaW5lcyBjaGVja2VkCgpQYXRj
aCAyLzIgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNl
IGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVy
LCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQgRU5EID09PQoKVGVz
dCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxl
IGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAxMTEwMTUwMDIzLjI1NTMzLTEtcGV0ZXIu
bWF5ZGVsbEBsaW5hcm8ub3JnL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0K
RW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3
Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0
LmNvbQ==

