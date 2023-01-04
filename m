Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBB065CD78
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 08:06:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCxpH-0003aj-63; Wed, 04 Jan 2023 02:04:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pCxoy-0003aT-8i
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 02:04:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pCxov-00024e-Vv
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 02:04:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672815856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7TynIgOl7eGg//IlEXPICNinv5qaRCl1IBhCC6GKLVQ=;
 b=OjtZm4WI/dKtnQIySYlzAONS9KO/KH3vcrFyYamdd2U3WGhyvTigm5hhUiE2LJWvV0qEY8
 v0PwrF7DJ+0BQzSAhO15xaWC/VqsqChMAJ5LdYQcKHolOLUfM9nC9ywgnYRFLMXynWjcvJ
 gE6s0DzrKQZ4nWooE/vBiYK7JP9Fmzo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-7LLM1dVMPXqrNfkrAExxSg-1; Wed, 04 Jan 2023 02:04:13 -0500
X-MC-Unique: 7LLM1dVMPXqrNfkrAExxSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B574B3C01DF0;
 Wed,  4 Jan 2023 07:04:12 +0000 (UTC)
Received: from [10.39.192.86] (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C9CE39D7C;
 Wed,  4 Jan 2023 07:04:11 +0000 (UTC)
Content-Type: multipart/mixed; boundary="------------SEqidZyFTi0V4WvawJF3RUd0"
Message-ID: <c03e353e-0d7b-6515-d7ac-1cb71e9cc7c9@redhat.com>
Date: Wed, 4 Jan 2023 08:04:10 +0100
MIME-Version: 1.0
Subject: Re: IO port write width clamping differs between TCG and KVM
Content-Language: en-US
From: Laszlo Ersek <lersek@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Michael Tsirkin <mtsirkin@redhat.com>
Cc: "Ard Biesheuvel (kernel.org address)" <ardb@kernel.org>,
 qemu devel list <qemu-devel@nongnu.org>
References: <aaedee84-d3ed-a4f9-21e7-d221a28d1683@redhat.com>
 <ea401dd3-53f1-b27c-4a5a-9085ce5ab051@redhat.com>
In-Reply-To: <ea401dd3-53f1-b27c-4a5a-9085ce5ab051@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a multi-part message in MIME format.
--------------SEqidZyFTi0V4WvawJF3RUd0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Adding Michael. The thread started here:

https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg00199.html

More below:

On 1/4/23 07:06, Laszlo Ersek wrote:
> On 1/3/23 18:42, Laszlo Ersek wrote:
>> (resending with qemu-devel on CC; sorry!)
>>
>> Hi,
>>
>> this is with QEMU-7.2.
>
> This is a regression. It works fine with QEMU-5.0. The regression has
> not been fixed since QEMU-7.2, as of master @ 222059a0fccf ("Merge tag
> 'pull-ppc-20221221' of https://gitlab.com/danielhb/qemu into staging",
> 2022-12-21).
>
> I'm bisecting.
>
> (It's a relief that this is a regression. I felt pretty certain that I
> had tested CPU hotplug with TCG as well!
>
> I've picked QEMU-5.0 as the start candidate for my bisection for the
> following reason: per git-blame, Igor described the modern interface
> detection steps in commit ae340aa3d2567 (which I reviewed), and the
> first tag/release to contain that commit was QEMU-5.0. The first QEMU
> release after Igor and I had worked on this in QEMU and OVMF
> definitely worked with TCG too, by my account.)

See the bisection log attached.

The first bad commit is:

> commit 5d971f9e672507210e77d020d89e0e89165c8fc9
> Author: Michael S. Tsirkin <mst@redhat.com>
> Date:   Wed Jun 10 09:47:49 2020 -0400
>
>     memory: Revert "memory: accept mismatching sizes in memory_region_access_valid"
>
>     Memory API documentation documents valid .min_access_size and .max_access_size
>     fields and explains that any access outside these boundaries is blocked.
>
>     This is what devices seem to assume.
>
>     However this is not what the implementation does: it simply
>     ignores the boundaries unless there's an "accepts" callback.
>
>     Naturally, this breaks a bunch of devices.
>
>     Revert to the documented behaviour.
>
>     Devices that want to allow any access can just drop the valid field,
>     or add the impl field to have accesses converted to appropriate
>     length.
>
>     Cc: qemu-stable@nongnu.org
>     Reviewed-by: Richard Henderson <rth@twiddle.net>
>     Fixes: CVE-2020-13754
>     Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1842363
>     Fixes: a014ed07bd5a ("memory: accept mismatching sizes in memory_region_access_valid")
>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>     Message-Id: <20200610134731.1514409-1-mst@redhat.com>
>     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

First released in QEMU v5.1.0 and v6.0.0 (exact same commit hash in
both, as v6.0.0 descends of v5.1.0).

Because this is a CVE fix, and also because of the suggestions made in
the commit message, I think the commit is actually right, and what we
need to fix is the hotplug register block -- namely the
"AcpiCpuHotplug_ops" structure in "hw/acpi/cpu_hotplug.c".

However, what I *really* don't understand is why this commit
(5d971f9e672507210e77d020d89e0e89165c8fc9) makes a difference *only*
under TCG.

Laszlo
--------------SEqidZyFTi0V4WvawJF3RUd0
Content-Type: text/x-log; charset=UTF-8; name="bisect.log"
Content-Disposition: attachment; filename="bisect.log"
Content-Transfer-Encoding: base64

Z2l0IGJpc2VjdCBzdGFydAojIGJhZDogWzIyMjA1OWEwZmNjZjRhZjNiZTc3NmZlMzVhNWVh
MmQ2YTY4ZjlhMGJdIE1lcmdlIHRhZyAncHVsbC1wcGMtMjAyMjEyMjEnIG9mIGh0dHBzOi8v
Z2l0bGFiLmNvbS9kYW5pZWxoYi9xZW11IGludG8gc3RhZ2luZwpnaXQgYmlzZWN0IGJhZCAy
MjIwNTlhMGZjY2Y0YWYzYmU3NzZmZTM1YTVlYTJkNmE2OGY5YTBiCiMgZ29vZDogW2ZkZDc2
ZmVjZGRlMWFkNDQ0ZmY0ZGViN2YxYzRmN2U0YTFlZjk3ZDZdIFVwZGF0ZSB2ZXJzaW9uIGZv
ciB2NS4wLjAgcmVsZWFzZQpnaXQgYmlzZWN0IGdvb2QgZmRkNzZmZWNkZGUxYWQ0NDRmZjRk
ZWI3ZjFjNGY3ZTRhMWVmOTdkNgojIGJhZDogWzYwOWQ3NTk2NTI0YWIyMDRjY2Q3MWVmNDJj
OWVlZTRjN2MzMzhlYTRdIFVwZGF0ZSB2ZXJzaW9uIGZvciB2Ni4wLjAgcmVsZWFzZQpnaXQg
YmlzZWN0IGJhZCA2MDlkNzU5NjUyNGFiMjA0Y2NkNzFlZjQyYzllZWU0YzdjMzM4ZWE0CiMg
YmFkOiBbYTBiZGY4NjY4NzM0NjcyNzFlZmY5YTkyZjE3OWFiMGY3N2Q3MzVjYl0gTWVyZ2Ug
cmVtb3RlLXRyYWNraW5nIGJyYW5jaCAncmVtb3Rlcy9kZ2lsYmVydC90YWdzL3B1bGwtbWln
cmF0aW9uLTIwMjAxMDEyYScgaW50byBzdGFnaW5nCmdpdCBiaXNlY3QgYmFkIGEwYmRmODY2
ODczNDY3MjcxZWZmOWE5MmYxNzlhYjBmNzdkNzM1Y2IKIyBiYWQ6IFszYTkxNjNhZjRlM2Rk
NjE3OTVhMzVkNDdiNzAyZTMwMmY5OGY4MWQ2XSBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJh
bmNoICdyZW1vdGVzL3BoaWxtZC1naXRsYWIvdGFncy9zZGNhcmQtQ1ZFLTIwMjAtMTMyNTMt
cHVsbC1yZXF1ZXN0JyBpbnRvIHN0YWdpbmcKZ2l0IGJpc2VjdCBiYWQgM2E5MTYzYWY0ZTNk
ZDYxNzk1YTM1ZDQ3YjcwMmUzMDJmOThmODFkNgojIGdvb2Q6IFs3ZDM2NjBlNzk4MzBhMDY5
ZjE4NDhiYjRmYTFjZGY4ZjY2NjQyNGZiXSBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNo
ICdyZW1vdGVzL2JvbnppbmkvdGFncy9mb3ItdXBzdHJlYW0nIGludG8gc3RhZ2luZwpnaXQg
YmlzZWN0IGdvb2QgN2QzNjYwZTc5ODMwYTA2OWYxODQ4YmI0ZmExY2RmOGY2NjY0MjRmYgoj
IGJhZDogWzkyZmJjM2UwN2ViOTI0YmQ1ZTAzZDIyNzY0ZTYzN2IyZTAyZTQ2YmRdIHZob3N0
X25ldDogdXNlIHRoZSBmdW5jdGlvbiBxZW11X2dldF9wZWVyCmdpdCBiaXNlY3QgYmFkIDky
ZmJjM2UwN2ViOTI0YmQ1ZTAzZDIyNzY0ZTYzN2IyZTAyZTQ2YmQKIyBnb29kOiBbNDk1MTM0
Yjc1Y2NhM2U2YTM0ZDQyMzMxMTNjNTE0MzQzOTA2MTc3MV0gaHcvcmlzY3Y6IHNpZml2ZTog
Q2hhbmdlIFNpRml2ZSBFL1UgQ1BVIHJlc2V0IHZlY3RvciB0byAweDEwMDQKZ2l0IGJpc2Vj
dCBnb29kIDQ5NTEzNGI3NWNjYTNlNmEzNGQ0MjMzMTEzYzUxNDM0MzkwNjE3NzEKIyBnb29k
OiBbNGU1ZGYwMzY5ZmI1YTQ5ZWQyNjUxOGRjY2ZmZWIwM2EyNTIzNTJkYl0gYWRiOiBhZGQg
YXV0b3BvbGxfYmxvY2tlZCB2YXJpYWJsZSB0byBibG9jayBhdXRvcG9sbApnaXQgYmlzZWN0
IGdvb2QgNGU1ZGYwMzY5ZmI1YTQ5ZWQyNjUxOGRjY2ZmZWIwM2EyNTIzNTJkYgojIGdvb2Q6
IFtjNzQ1OTYzM2JhYTcxZDE3ODFmZGU0YTI0NWQ2ZWM5Y2UyZjAwOGNmXSB0YXJnZXQvYXJt
OiBFbmFibGUgTVRFCmdpdCBiaXNlY3QgZ29vZCBjNzQ1OTYzM2JhYTcxZDE3ODFmZGU0YTI0
NWQ2ZWM5Y2UyZjAwOGNmCiMgYmFkOiBbMzU5MWRkZDM5OTg3Y2JkYWEwY2ZhMzQ0YTI2MmYz
MTVhYmQ5NzU4Ml0gTWVyZ2UgcmVtb3RlLXRyYWNraW5nIGJyYW5jaCAncmVtb3Rlcy9ib256
aW5pL3RhZ3MvZm9yLXVwc3RyZWFtJyBpbnRvIHN0YWdpbmcKZ2l0IGJpc2VjdCBiYWQgMzU5
MWRkZDM5OTg3Y2JkYWEwY2ZhMzQ0YTI2MmYzMTVhYmQ5NzU4MgojIGJhZDogWzFmMThhMWU2
YWI4MzY4YTRlYWIyZDIyODk0ZDNiMmFlNzUyNTBjZDNdIHRhcmdldC9pMzg2OiByZWltcGxl
bWVudCBmeWwyeCB1c2luZyBmbG9hdHg4MCBvcGVyYXRpb25zCmdpdCBiaXNlY3QgYmFkIDFm
MThhMWU2YWI4MzY4YTRlYWIyZDIyODk0ZDNiMmFlNzUyNTBjZDMKIyBiYWQ6IFtlZTc2MGFj
ODBhYzFmMTMwMTM4ZThlYjRlYmEyNjNhNGQ0OGFjZTUxXSBody9zY3NpL21lZ2FzYXM6IEZp
eCBwb3NzaWJsZSBvdXQtb2YtYm91bmRzIGFycmF5IGFjY2VzcyBpbiB0cmFjZXBvaW50cwpn
aXQgYmlzZWN0IGJhZCBlZTc2MGFjODBhYzFmMTMwMTM4ZThlYjRlYmEyNjNhNGQ0OGFjZTUx
CiMgYmFkOiBbNWQ5NzFmOWU2NzI1MDcyMTBlNzdkMDIwZDg5ZTBlODkxNjVjOGZjOV0gbWVt
b3J5OiBSZXZlcnQgIm1lbW9yeTogYWNjZXB0IG1pc21hdGNoaW5nIHNpemVzIGluIG1lbW9y
eV9yZWdpb25fYWNjZXNzX3ZhbGlkIgpnaXQgYmlzZWN0IGJhZCA1ZDk3MWY5ZTY3MjUwNzIx
MGU3N2QwMjBkODllMGU4OTE2NWM4ZmM5CiMgZ29vZDogW2FlMmI3MjA3MmJjNDAxMTE0ZWJi
OWY0NmFiZDY3ZDA3ZDRjYWJmMTBdIHV0aWwvZ2V0YXV4dmFsOiBQb3J0aW5nIHRvIEZyZWVC
U0QgZ2V0YXV4dmFsIGZlYXR1cmUKZ2l0IGJpc2VjdCBnb29kIGFlMmI3MjA3MmJjNDAxMTE0
ZWJiOWY0NmFiZDY3ZDA3ZDRjYWJmMTAKIyBnb29kOiBbNGI3YzA2ODM3YWUwYjFmZjU2NDcz
MjAyYTQyZTdlMzg2ZjUzZDZkYl0gbGlicW9zOiBwY2ktcGM6IHVzZSAzMi1iaXQgd3JpdGUg
Zm9yIEVKIHJlZ2lzdGVyCmdpdCBiaXNlY3QgZ29vZCA0YjdjMDY4MzdhZTBiMWZmNTY0NzMy
MDJhNDJlN2UzODZmNTNkNmRiCiMgZmlyc3QgYmFkIGNvbW1pdDogWzVkOTcxZjllNjcyNTA3
MjEwZTc3ZDAyMGQ4OWUwZTg5MTY1YzhmYzldIG1lbW9yeTogUmV2ZXJ0ICJtZW1vcnk6IGFj
Y2VwdCBtaXNtYXRjaGluZyBzaXplcyBpbiBtZW1vcnlfcmVnaW9uX2FjY2Vzc192YWxpZCIK


--------------SEqidZyFTi0V4WvawJF3RUd0--


