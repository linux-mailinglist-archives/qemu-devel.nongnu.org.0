Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528E74CD77D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:16:17 +0100 (CET)
Received: from localhost ([::1]:46894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9fE-0003Mq-Ch
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:16:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1nQ8rK-0005LG-4W
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:24:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1nQ8rI-0002mV-4Z
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ZnI7zilZNPnOaNn5ItZqbgPglK8ECnye3IPBNYiUnM=;
 b=P5mEKP3ylkRdBhxbSYV8gCsSgFK4CwN7wXgljnUI2m81uNSIRljsuU819LcFuiP5Ishkm1
 et8r2M6MnCxaGvMg++ENkdMyWD1WcQC8N0NP2w1KDpZNj8SIelVkO2uNaBvOISA2jv7lVO
 JvB2o4L4bOs0PVVdAGfvBLudnRayo8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-k6Z6KUweOVmzADdvrsMXDQ-1; Fri, 04 Mar 2022 09:24:35 -0500
X-MC-Unique: k6Z6KUweOVmzADdvrsMXDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE45F835DE5;
 Fri,  4 Mar 2022 14:24:34 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.195.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80D60866F5;
 Fri,  4 Mar 2022 14:24:32 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/virt: Validate memory size on the first NUMA node
To: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20220228075203.60064-1-gshan@redhat.com>
 <20220228100820.477e2311@redhat.com>
 <41eb791c-a74a-7ed6-df05-cd1867ecbb5f@redhat.com>
 <20220301114257.2bppjnjqj7dgxztc@sirius.home.kraxel.org>
 <ee76dcac-8914-2f24-9920-9d93aa29c22d@redhat.com>
 <20220304115240.71d241ad@redhat.com>
 <CAFEAcA8BwRnziYaO2ZP7e_hNuAPBV7UOViX-nDu=ae2_7CemKw@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <1abedac8-00c8-3039-ccfe-783f5eab9439@redhat.com>
Date: Fri, 4 Mar 2022 15:24:30 +0100
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8BwRnziYaO2ZP7e_hNuAPBV7UOViX-nDu=ae2_7CemKw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------277B6B0876B57D25FAC51BF2"
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: drjones@redhat.com, Gavin Shan <gshan@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Shan Gavin <shan.gavin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------277B6B0876B57D25FAC51BF2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Gerd,

On 03/04/22 11:58, Peter Maydell wrote:
> On Fri, 4 Mar 2022 at 10:52, Igor Mammedov <imammedo@redhat.com> wrote:
>> if firmware is not an option, I wouldn't opposed to printing warning
>> message from QEMU if you can detect that you are running broken edk2
>> and under condition that no new infa/hooks are invented for this.
>> (assuming it's worth all the effort at all)
> 
> I am definitely not in favour of that. QEMU should provide the
> emulated hardware and let the firmware deal with detecting if
> it's missing important stuff. It should as far as is possible
> not have special-case detection-of-broken-guests handling.
> 
> thanks
> -- PMM
> 

It's probably simplest if you replace the ASSERT()s in question; please
see the attachment. (Only smoke tested.) Gavin indicated up-thread he'd
be OK with an easier-to-understand error message.

Laszlo

--------------277B6B0876B57D25FAC51BF2
Content-Type: text/x-patch;
 name="0001-ArmVirtPkg-QemuVirtMemInfoLib-improve-error-messages-for-MemoryInitPei.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename*0="0001-ArmVirtPkg-QemuVirtMemInfoLib-improve-error-messages-fo";
 filename*1="r-MemoryInitPei.patch"

RnJvbSAwYWI0NTY5YzQ1YWIyM2MxMmNhOWVhYjQyMDE2YzBlODQ0Njg5YjdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgpEYXRl
OiBGcmksIDQgTWFyIDIwMjIgMTU6MTQ6MjUgKzAxMDAKU3ViamVjdDogW1BBVENIIDEvMV0gQXJt
VmlydFBrZy9RZW11VmlydE1lbUluZm9MaWI6IGltcHJvdmUgZXJyb3IgbWVzc2FnZXMgZm9yCiBN
ZW1vcnlJbml0UGVpCgpRRU1VIG1ha2VzICJ2aXJ0IiBib2FyZCBjb25maWd1cmF0aW9ucyBwb3Nz
aWJsZSB3aGVyZSB0aGUgbG93ZXN0IG1lbW9yeQpub2RlIGlzIHNtYWxsZXIgdGhhbiAxMjggTUIu
IEN1cnJlbnRseSB3ZSBjYXRjaCB0aGF0IHdpdGggYW4gQVNTRVJUKCkKb25seTsgdHVybiBpdCBp
bnRvIGEgaGFyZCBDcHVEZWFkTG9vcCgpLCBhbmQgbG9nIGEgbW9yZSB1c2VyLWZyaWVuZGx5CmVy
cm9yIG1lc3NhZ2UuCgpDb252ZXJ0IHNvbWUgb3RoZXIgQVNTRVJUKClzIGFzIHdlbGwuCgpXaGls
ZSBhdCBpdCwgZml4IHVwIHRoZSBkaXNvcmRlciBpbiB0aGUgW0xpYnJhcnlDbGFzc2VzXSBzZWN0
aW9uIG9mCiJRZW11VmlydE1lbUluZm9QZWlMaWIuaW5mIi4KCkJ1Z3ppbGxhOiBodHRwczovL2J1
Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTIwNDEzMjMKU2lnbmVkLW9mZi1ieTog
TGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KLS0tCiAuLi4vUWVtdVZpcnRNZW1JbmZv
UGVpTGliLmluZiAgICAgICAgICAgICAgICAgfCAgMyArLQogLi4uL1FlbXVWaXJ0TWVtSW5mb1Bl
aUxpYkNvbnN0cnVjdG9yLmMgICAgICAgIHwgMzYgKysrKysrKysrKysrKysrLS0tLQogMiBmaWxl
cyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L0FybVZpcnRQa2cvTGlicmFyeS9RZW11VmlydE1lbUluZm9MaWIvUWVtdVZpcnRNZW1JbmZvUGVp
TGliLmluZiBiL0FybVZpcnRQa2cvTGlicmFyeS9RZW11VmlydE1lbUluZm9MaWIvUWVtdVZpcnRN
ZW1JbmZvUGVpTGliLmluZgppbmRleCA3ZWNmNmRmYmI3ODYuLjA3NmVlMjRhNDk2MSAxMDA2NDQK
LS0tIGEvQXJtVmlydFBrZy9MaWJyYXJ5L1FlbXVWaXJ0TWVtSW5mb0xpYi9RZW11VmlydE1lbUlu
Zm9QZWlMaWIuaW5mCisrKyBiL0FybVZpcnRQa2cvTGlicmFyeS9RZW11VmlydE1lbUluZm9MaWIv
UWVtdVZpcnRNZW1JbmZvUGVpTGliLmluZgpAQCAtMjksMTEgKzI5LDEyIEBAIFtQYWNrYWdlc10K
IA0KIFtMaWJyYXJ5Q2xhc3Nlc10NCiAgIEFybUxpYg0KKyAgQmFzZUxpYg0KICAgQmFzZU1lbW9y
eUxpYg0KICAgRGVidWdMaWINCiAgIEZkdExpYg0KLSAgUGNkTGliDQogICBNZW1vcnlBbGxvY2F0
aW9uTGliDQorICBQY2RMaWINCiANCiBbUGNkXQ0KICAgZ0FybVRva2VuU3BhY2VHdWlkLlBjZEZk
QmFzZUFkZHJlc3MNCmRpZmYgLS1naXQgYS9Bcm1WaXJ0UGtnL0xpYnJhcnkvUWVtdVZpcnRNZW1J
bmZvTGliL1FlbXVWaXJ0TWVtSW5mb1BlaUxpYkNvbnN0cnVjdG9yLmMgYi9Bcm1WaXJ0UGtnL0xp
YnJhcnkvUWVtdVZpcnRNZW1JbmZvTGliL1FlbXVWaXJ0TWVtSW5mb1BlaUxpYkNvbnN0cnVjdG9y
LmMKaW5kZXggMzNkMzU5N2Q1N2FiLi40M2ZiMzhiZGU0MzYgMTAwNjQ0Ci0tLSBhL0FybVZpcnRQ
a2cvTGlicmFyeS9RZW11VmlydE1lbUluZm9MaWIvUWVtdVZpcnRNZW1JbmZvUGVpTGliQ29uc3Ry
dWN0b3IuYworKysgYi9Bcm1WaXJ0UGtnL0xpYnJhcnkvUWVtdVZpcnRNZW1JbmZvTGliL1FlbXVW
aXJ0TWVtSW5mb1BlaUxpYkNvbnN0cnVjdG9yLmMKQEAgLTcsNiArNyw3IEBACiAqKi8NCiANCiAj
aW5jbHVkZSA8QmFzZS5oPg0KKyNpbmNsdWRlIDxMaWJyYXJ5L0Jhc2VMaWIuaD4NCiAjaW5jbHVk
ZSA8TGlicmFyeS9EZWJ1Z0xpYi5oPg0KICNpbmNsdWRlIDxMaWJyYXJ5L1BjZExpYi5oPg0KICNp
bmNsdWRlIDxsaWJmZHQuaD4NCkBAIC04NSw3ICs4NiwxNSBAQCBRZW11VmlydE1lbUluZm9QZWlM
aWJDb25zdHJ1Y3RvciAoCiAgIC8vDQogICAvLyBNYWtlIHN1cmUgdGhlIHN0YXJ0IG9mIERSQU0g
bWF0Y2hlcyBvdXIgZXhwZWN0YXRpb24NCiAgIC8vDQotICBBU1NFUlQgKEZpeGVkUGNkR2V0NjQg
KFBjZFN5c3RlbU1lbW9yeUJhc2UpID09IE5ld0Jhc2UpOw0KKyAgaWYgKEZpeGVkUGNkR2V0NjQg
KFBjZFN5c3RlbU1lbW9yeUJhc2UpICE9IE5ld0Jhc2UpIHsNCisgICAgREVCVUcgKCgNCisgICAg
ICBERUJVR19FUlJPUiwNCisgICAgICAiJWE6IHRoZSBsb3dlc3QgbWVtb3J5IG5vZGUgbXVzdCBz
dGFydCBhdCAweCVMeFxuIiwNCisgICAgICBfX0ZVTkNUSU9OX18sDQorICAgICAgRml4ZWRQY2RH
ZXQ2NCAoUGNkU3lzdGVtTWVtb3J5QmFzZSkNCisgICAgICApKTsNCisgICAgQ3B1RGVhZExvb3Ag
KCk7DQorICB9DQogICBQY2RTdGF0dXMgPSBQY2RTZXQ2NFMgKFBjZFN5c3RlbU1lbW9yeVNpemUs
IE5ld1NpemUpOw0KICAgQVNTRVJUX1JFVFVSTl9FUlJPUiAoUGNkU3RhdHVzKTsNCiANCkBAIC05
NywxMiArMTA2LDI1IEBAIFFlbXVWaXJ0TWVtSW5mb1BlaUxpYkNvbnN0cnVjdG9yICgKICAgLy8g
Y2hhbmNlIG9mIG1hcmtpbmcgaXRzIGxvY2F0aW9uIGFzIHJlc2VydmVkIG9yIGNvcHkgaXQgdG8g
YSBmcmVzaGx5DQogICAvLyBhbGxvY2F0ZWQgYmxvY2sgaW4gdGhlIHBlcm1hbmVudCBQRUkgUkFN
IGluIHRoZSBwbGF0Zm9ybSBQRUlNLg0KICAgLy8NCi0gIEFTU0VSVCAoTmV3U2l6ZSA+PSBTSVpF
XzEyOE1CKTsNCi0gIEFTU0VSVCAoDQotICAgICgoKFVJTlQ2NClQY2RHZXQ2NCAoUGNkRmRCYXNl
QWRkcmVzcykgKw0KLSAgICAgIChVSU5UNjQpUGNkR2V0MzIgKFBjZEZkU2l6ZSkpIDw9IE5ld0Jh
c2UpIHx8DQotICAgICgoVUlOVDY0KVBjZEdldDY0IChQY2RGZEJhc2VBZGRyZXNzKSA+PSAoTmV3
QmFzZSArIE5ld1NpemUpKQ0KLSAgICApOw0KKyAgaWYgKE5ld1NpemUgPCBTSVpFXzEyOE1CKSB7
DQorICAgIERFQlVHICgoDQorICAgICAgREVCVUdfRVJST1IsDQorICAgICAgIiVhOiB0aGUgbG93
ZXN0IG1lbW9yeSBub2RlIG11c3QgYmUgYXQgbGVhc3QgMHgleCBieXRlc1xuIiwNCisgICAgICBf
X0ZVTkNUSU9OX18sDQorICAgICAgKFVJTlQzMilTSVpFXzEyOE1CDQorICAgICAgKSk7DQorICAg
IENwdURlYWRMb29wICgpOw0KKyAgfQ0KKyAgaWYgKCgoKFVJTlQ2NClQY2RHZXQ2NCAoUGNkRmRC
YXNlQWRkcmVzcykgKw0KKyAgICAgICAgKFVJTlQ2NClQY2RHZXQzMiAoUGNkRmRTaXplKSkgPiBO
ZXdCYXNlKSAmJg0KKyAgICAgICgoVUlOVDY0KVBjZEdldDY0IChQY2RGZEJhc2VBZGRyZXNzKSA8
IChOZXdCYXNlICsgTmV3U2l6ZSkpKSB7DQorICAgIERFQlVHICgoDQorICAgICAgREVCVUdfRVJS
T1IsDQorICAgICAgIiVhOiB0aGUgbG93ZXN0IG1lbW9yeSBub2RlIG11c3Qgbm90IG92ZXJsYXAg
dGhlIGZsYXNoIGRldmljZVxuIiwNCisgICAgICBfX0ZVTkNUSU9OX18NCisgICAgICApKTsNCisg
ICAgQ3B1RGVhZExvb3AgKCk7DQorICB9DQogDQogICByZXR1cm4gUkVUVVJOX1NVQ0NFU1M7DQog
fQ0KCmJhc2UtY29tbWl0OiA1ODlkNTFkZjI2MDQ2NWUyNTYxOTc5YjhhOTg4ZTc3YjBmMzJhNmU4
Ci0tIAoyLjE5LjEuMy5nMzAyNDdhYTVkMjAxCgo=
--------------277B6B0876B57D25FAC51BF2--


