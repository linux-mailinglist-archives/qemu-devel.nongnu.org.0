Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A830D4C3069
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 16:55:35 +0100 (CET)
Received: from localhost ([::1]:41734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNGSs-0002rP-ON
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 10:55:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1nNGRg-0000vt-NB
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:54:21 -0500
Received: from sysprogs.com ([45.79.83.98]:38006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1nNGRZ-0001fz-E5
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:54:15 -0500
Received: from sys2 (unknown [174.1.100.17])
 by sysprogs.com (Postfix) with ESMTPSA id 8663211A358;
 Thu, 24 Feb 2022 15:54:10 +0000 (UTC)
From: "Ivan Shcherbakov" <ivan@sysprogs.com>
To: =?UTF-8?Q?'Alex_Benn=C3=A9e'?= <alex.bennee@linaro.org>,
 "'Peter Maydell'" <peter.maydell@linaro.org>
References: <010e01d82875$d3cc0ec0$7b642c40$@sysprogs.com>
 <93318cc1-bf62-34dd-190c-1961a4716f75@redhat.com>
 <01e801d828f0$b58a6e40$209f4ac0$@sysprogs.com>
 <CAFEAcA_y=xRhBoStyxa+UZcyibAzgcJSf+kQO4e0BMrdq4j6Jg@mail.gmail.com>
 <87v8x433o2.fsf@linaro.org>
In-Reply-To: <87v8x433o2.fsf@linaro.org>
Subject: RE: [PATCH 3/3] whpx: Added support for breakpoints and stepping
Date: Thu, 24 Feb 2022 07:54:08 -0800
Message-ID: <030301d82996$c385f900$4a91eb00$@sysprogs.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNIFN5a+FOAvRiv4eJOlcn7oK8VcgKLbPilArczCsgBeoy2sQJTpbLJqXp5u8A=
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
Cc: 'Paolo Bonzini' <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 armbru@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> I haven't looked at the rest of the patch -- but can you explain where =

> whpx is different from how other accelerators handle debug such that=20
> it needs to know whether gdb is connected or not ?
This mainly comes from the way single-stepping is handled. WHPX needs to =
know whether you want to trap INT1 before starting the first VCPU. The =
current gdbstub implementation doesn=E2=80=99t make it easy. Assume the =
scenario:

1. You have 2 VCPUs. You run the first one and step the second one.
2. gdb_continue_partial() calls cpu_resume(0)
3. gdb_continue_partial() calls cpu_single_step(1).

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


