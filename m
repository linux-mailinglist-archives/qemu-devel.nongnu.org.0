Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934C052CB17
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 06:29:00 +0200 (CEST)
Received: from localhost ([::1]:37440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrXmV-0004kT-7n
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 00:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1nrXkV-00044z-9N
 for qemu-devel@nongnu.org; Thu, 19 May 2022 00:26:55 -0400
Received: from sysprogs.com ([45.79.83.98]:42784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1nrXkT-0006oj-F2
 for qemu-devel@nongnu.org; Thu, 19 May 2022 00:26:54 -0400
Received: from sys2 (unknown [174.1.100.17])
 by sysprogs.com (Postfix) with ESMTPSA id 958BF11A203;
 Thu, 19 May 2022 04:26:50 +0000 (UTC)
From: "Ivan Shcherbakov" <ivan@sysprogs.com>
To: "'Paolo Bonzini'" <pbonzini@redhat.com>,
	<qemu-devel@nongnu.org>
References: <004101d86732$0d33bd70$279b3850$@sysprogs.com>
 <e1229b1f-d94e-6529-311e-30999741fadc@redhat.com>
 <021801d86954$fe4cb940$fae62bc0$@sysprogs.com>
 <4ee53657-76fc-116f-b569-d0813301a9fc@redhat.com>
In-Reply-To: <4ee53657-76fc-116f-b569-d0813301a9fc@redhat.com>
Subject: RE: [PATCH] whpx: Added support for saving/restoring VM state
Date: Wed, 18 May 2022 21:26:48 -0700
Message-ID: <059001d86b38$a94ee450$fbecacf0$@sysprogs.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGju1X+FE0XGWjqIp7RwfyaKhTT0QIlouyPATrvxvQCMxCEh61iWonQ
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

Thanks for pointing out the relevant fields of the XSAVE state - it =
explains what is going on.
I did some quick experiments with modifying the buffer manually, so:

* Hyper-V doesn't care about the value of MXCSR_MASK. Both 0xFFFF and =
0x0000 work.
* Setting XCOMP_BV to 0 does trigger the error.

My best guess is that Hyper-V is emulating XSAVE/XRSTOR programmatically =
and they only implemented the compacted format.

Do you think it would be a reasonable workaround to handle it like this:

1. Pass the XSAVE data received from Hyper-V to =
x86_cpu_xrstor_all_areas().
2. Also save it into the snapshot area like we do now.
3. When restoring, first try to pass the data from =
x86_cpu_xsave_all_areas() to Hyper-V.
4. If it rejects it, pass the original block saved in step 2.

If either Microsoft adds support for the regular format, or someone on =
the Qemu side implements the compacted one, this logic will start =
properly synchronizing the QEMU-level XSAVE structure with Hyper-V. =
Until then (or if it breaks again) it will fall back to saving/restoring =
the data "as is", which will be sufficient for snapshots.

Best,
Ivan

-----Original Message-----
From: Qemu-devel <qemu-devel-bounces+ivan=3Dsysprogs.com@nongnu.org> On =
Behalf Of Paolo Bonzini
Sent: Tuesday, May 17, 2022 7:12 AM
To: Ivan Shcherbakov <ivan@sysprogs.com>; qemu-devel@nongnu.org
Subject: Re: [PATCH] whpx: Added support for saving/restoring VM state

On 5/16/22 20:44, Ivan Shcherbakov wrote:
> Passing it to x86_cpu_xrstor_all_areas()/x86_cpu_xsave_all_areas() =
changed the following values:
>=20
> 0x0000001C: ff ff -> 00 00
> 0x00000208: 07 -> 00
> 0x0000020F: 80 -> 00

0x1C-0x1F is MXCSR_MASK.  There's already a field in the x86 CPUState, =
but it was forgotten in =
x86_cpu_xsave_all_areas()/x86_cpu_xrstor_all_areas().  The field should =
also be initialized to 0xffff in the CPU reset function.

0x208...0x20F is XCOMP_BV and bit 63 in there is indeed signaling =
compacted format.  First of all I'd start with your patch and hack it to =
check if Hyper-V accepts zero at 0x208..0x20F; in this specific case of =
0x208...0x20F have all low consecutive bits set plus bit 63 set, it's =
fine to do just that.  If so, x86_cpu_xrstor_all_areas() needs no =
support for compacted format.  I would be somewhat surprised if Hyper-V =
needs support in XRSTOR too.

For XSAVE, the algorithm to compute the offset (instead of just using=20
x->offset) is given in the Intel manual:

If XCOMP_BV[i] =3D 0, state component i is not in the XSAVE area at all.

If XCOMP_BV[i] =3D 1, state component i is located at a byte offset  =
from the base address of the XSAVE area, which is determined by the =
following
steps:

- If i is the first bit set in bits 62:2 of the XCOMP_BV, state =
component i starts at offset 576

- Otherwise, take CPUID[EAX=3D0DH,ECX=3Di].ECX[1]:

   - If it is 0, state component i starts right after the preceding =
state
     component whose bit is set in XCOMP_BV (where the size of component
     j is enumerated in CPUID[EAX=3D0DH,ECX=3Dj].EAX).

   - If it is 1, state component i starts after the preceding state
     component whose bit is set in XCOMP_BV, but on a 64-byte aligned
     offset relative to the beginning of the XSAVE area.

Paolo


