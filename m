Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC96F41DF2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 09:41:15 +0200 (CEST)
Received: from localhost ([::1]:57198 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haxsg-0006oz-I8
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 03:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46053)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <Stefan.Brankovic@rt-rk.com>) id 1haxrY-00067K-Oc
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 03:40:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Stefan.Brankovic@rt-rk.com>) id 1haxkl-000167-6y
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 03:33:04 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:53591 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Stefan.Brankovic@rt-rk.com>)
 id 1haxkk-0000ba-Se
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 03:33:03 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 9D8581A1162;
 Wed, 12 Jun 2019 09:31:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: by mail.rt-rk.com (Postfix, from userid 492)
 id 6EFD71A1FA9; Wed, 12 Jun 2019 09:31:55 +0200 (CEST)
in-reply-to: <583e3095-2429-cda5-c21d-b6c3ccd3ddd8@linaro.org>
to: "Richard Henderson" <richard.henderson@linaro.org>
from: "Stefan Brankovic" <Stefan.Brankovic@rt-rk.com>
message-id: <2fb9-5d00aa80-1-5f7c330@171364103>
X-Forward: 127.0.0.1
date: Wed, 12 Jun 2019 09:31:55 +0200
MIME-Version: 1.0
User-Agent: SOGoMail 2.3.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] 
 =?utf-8?b?Pz09P3V0Zi04P3E/ID89PT91dGYtOD9xPyBbUEFU?=
 =?utf-8?q?CH_0/8=5D_Optimize_emulation_of_ten_Altivec_instructions=3A=3F?=
 =?utf-8?b?PT0/dXRmLTg/cT8gbHZzbCw=?=
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
Cc: qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>
>
> -------- Original Message --------
> Subject: Re: [Qemu-devel] [PATCH 0/8] Optimize emulation of ten Altiv=
ec instructions: lvsl,
> Date: Thursday, June 6, 2019 19:13 CEST
> From: Richard Henderson <richard.henderson@linaro.org>
> To: Stefan Brankovic <stefan.brankovic@rt-rk.com>, qemu-devel@nongnu.=
org
> CC: david@gibson.dropbear.id.au
> References: <1559816130-17113-1-git-send-email-stefan.brankovic@rt-rk=
.com>
>
>
>
> > On 6/6/19 5:15 AM, Stefan Brankovic wrote:
> > > Stefan Brankovic (8):
> > > target/ppc: Optimize emulation of lvsl and lvsr instructions
> > > target/ppc: Optimize emulation of vsl and vsr instructions
> > > target/ppc: Optimize emulation of vpkpx instruction
> > > target/ppc: Optimize emulation of vgbbd instruction
> > > target/ppc: Optimize emulation of vclzd instruction
> > > target/ppc: Optimize emulation of vclzw instruction
> > > target/ppc: Optimize emulation of vclzh and vclzb instructions
> > > target/ppc: Refactor emulation of vmrgew and vmrgow instructions
> > >
> > > target/ppc/translate/vmx-impl.inc.c | 705 +++++++++++++++++++++++=
+++++++++----
> > > 1 file changed, 636 insertions(+), 69 deletions(-)
> >
> > You should be removing the out-of-line helpers that are no longer u=
sed.
> >

Thank you for taking your time to review my code. I think that your sug=
gestions
are all constructive and very useful. However, I was on a short leave t=
his
week and I couldn't respond promptly. I will respond with more details =
in next
few days.

Kind Regards,
Stefan

> >
> > r~
>
>
>
