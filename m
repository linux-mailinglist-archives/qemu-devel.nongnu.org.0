Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B1D148CE6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 18:26:13 +0100 (CET)
Received: from localhost ([::1]:45688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iv2ii-0006ab-Sm
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 12:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54394)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.rikalo@rt-rk.com>) id 1iv2ht-0006BL-Gg
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 12:25:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.rikalo@rt-rk.com>) id 1iv2hs-00066J-Ga
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 12:25:21 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:55069 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.rikalo@rt-rk.com>)
 id 1iv2hs-00065K-82
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 12:25:20 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 074731A1F84;
 Fri, 24 Jan 2020 18:25:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from [10.10.14.141] (rtrkw304-lin.domain.local [10.10.14.141])
 by mail.rt-rk.com (Postfix) with ESMTPSA id E54431A1E2C;
 Fri, 24 Jan 2020 18:25:17 +0100 (CET)
Subject: Re: [PATCH v4 5/7] disas: Add a field for target-dependant data
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1579883929-1517-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1579883929-1517-6-git-send-email-aleksandar.markovic@rt-rk.com>
From: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
Message-ID: <1f64d6de-f898-523b-d423-7b4d129a931d@rt-rk.com>
Date: Fri, 24 Jan 2020 18:25:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1579883929-1517-6-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
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
Cc: aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 > From: Aleksandar Markovic <amarkovic@wavecomp.com>
 >
 > This patch adds a field "target_info" to the structure
 > disassemble_info. The purpose of this field is to enable targets
 > to pass to disassembler code any additional data thet deem suitable.
 >
 > Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
 > ---
 >=C2=A0 include/disas/dis-asm.h | 3 +++
 >=C2=A0 1 file changed, 3 insertions(+)
 >
 > diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
 > index e9c7dd8..f87f468 100644
 > --- a/include/disas/dis-asm.h
 > +++ b/include/disas/dis-asm.h
 > @@ -372,6 +372,9 @@ typedef struct disassemble_info {
 >=C2=A0=C2=A0=C2=A0 /* Command line options specific to the target disas=
sembler.=C2=A0 */
 >=C2=A0=C2=A0=C2=A0 char * disassembler_options;
 >
 > +=C2=A0 /* Field intended to be used by targets in any way they deem=20
suitable.=C2=A0 */
 > +=C2=A0 int64_t target_info;
 > +
 >=C2=A0=C2=A0=C2=A0 /* Options for Capstone disassembly.=C2=A0 */
 >=C2=A0=C2=A0=C2=A0 int cap_arch;
 >=C2=A0=C2=A0=C2=A0 int cap_mode;

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>

