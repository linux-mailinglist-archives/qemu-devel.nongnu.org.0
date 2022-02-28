Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551F94C6233
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 05:32:37 +0100 (CET)
Received: from localhost ([::1]:45592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOXi7-0000TX-Qr
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 23:32:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1nOXgq-0007fr-Tw
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 23:31:16 -0500
Received: from sysprogs.com ([45.79.83.98]:44376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1nOXgp-0003C8-Co
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 23:31:16 -0500
Received: from sys2 (unknown [174.1.100.17])
 by sysprogs.com (Postfix) with ESMTPSA id D2E3711A358;
 Mon, 28 Feb 2022 04:31:12 +0000 (UTC)
From: "Ivan Shcherbakov" <ivan@sysprogs.com>
To: =?UTF-8?Q?'Alex_Benn=C3=A9e'?= <alex.bennee@linaro.org>,
 "'Peter Maydell'" <peter.maydell@linaro.org>
References: <010e01d82875$d3cc0ec0$7b642c40$@sysprogs.com>
 <93318cc1-bf62-34dd-190c-1961a4716f75@redhat.com>
 <01e801d828f0$b58a6e40$209f4ac0$@sysprogs.com>
 <CAFEAcA_y=xRhBoStyxa+UZcyibAzgcJSf+kQO4e0BMrdq4j6Jg@mail.gmail.com>
 <87v8x433o2.fsf@linaro.org> <030301d82996$c385f900$4a91eb00$@sysprogs.com>
In-Reply-To: <030301d82996$c385f900$4a91eb00$@sysprogs.com>
Subject: RE: [PATCH 3/3] whpx: Added support for breakpoints and stepping
Date: Sun, 27 Feb 2022 20:31:09 -0800
Message-ID: <096b01d82c5c$04a0f3a0$0de2dae0$@sysprogs.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNIFN5a+FOAvRiv4eJOlcn7oK8VcgKLbPilArczCsgBeoy2sQJTpbLJArW9O3SpalhhMA==
Content-Language: en-us
Received-SPF: pass client-ip=45.79.83.98; envelope-from=ivan@sysprogs.com;
 helo=sysprogs.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: 'Paolo Bonzini' <pbonzini@redhat.com>, mst@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex and Peter,

It would be great to hear your feedback on handling the WHPX stepping =
via an added argument to vm_prepare_start(). It is only called from 2 =
places, so the changes will be minimal. I this works for you, I will =
gladly send an updated patch.

I am also fully open to other suggestions. You obviously know the QEMU =
codebase much better, so I'm happy to refactor it so that it blends in =
well with the rest of the code.

Best,
Ivan

-----Original Message-----
From: Qemu-devel <qemu-devel-bounces+ivan=3Dsysprogs.com@nongnu.org> On =
Behalf Of Ivan Shcherbakov
Sent: Thursday, February 24, 2022 7:54 AM
To: 'Alex Benn=C3=A9e' <alex.bennee@linaro.org>; 'Peter Maydell' =
<peter.maydell@linaro.org>
Cc: 'Paolo Bonzini' <pbonzini@redhat.com>; qemu-devel@nongnu.org; =
armbru@redhat.com; mst@redhat.com
Subject: RE: [PATCH 3/3] whpx: Added support for breakpoints and =
stepping

> I haven't looked at the rest of the patch -- but can you explain where =

> whpx is different from how other accelerators handle debug such that=20
> it needs to know whether gdb is connected or not ?
This mainly comes from the way single-stepping is handled. WHPX needs to =
know whether you want to trap INT1 before starting the first VCPU. The =
current gdbstub implementation doesn=E2=80=99t make it easy. Assume the =
scenario:

1. You have 2 VCPUs. You run the first one and step the second one.
2. gdb_continue_partial() calls cpu_resume(0) 3. gdb_continue_partial() =
calls cpu_single_step(1).

WHPX needs to know whether to trap INT1 at step #2 (starting the first =
CPU), but it won't know it until step #3. So, the current logic simply =
checks if gdb is connected at all in step #2.

>Just the fact you have connected to the gdbserver shouldn't affect how =
you run WHPX up until the point there are things you need to trap - i.e.
>handling installed breakpoints.

This can be addressed by adding a "bool stepping_expected" argument to =
vm_prepare_start(). It will be set to true if gdb_continue_partial() =
expects ANY thread to be stepped, and will be false otherwise. It will =
also require a new callback in AccelOpsClass (e.g. on_vm_starting(bool =
stepping_expected)) that will be called from vm_prepare_start(). The =
WHPX implementation will then check if any breakpoints are set, and if =
the last call to this function expected stepping, and use it to decide =
whether to trap INT1.

Let me know if this will work better.

Best,
Ivan


