Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7DC49AF86
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 10:15:00 +0100 (CET)
Received: from localhost ([::1]:56108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCHul-0000WY-Ew
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 04:14:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nCHsP-0007yg-Js
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:12:33 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:38110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nCHsN-0002Gj-FR
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:12:33 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-7MsKPqq4Obe1_KbkLTsFGg-1; Tue, 25 Jan 2022 04:12:23 -0500
X-MC-Unique: 7MsKPqq4Obe1_KbkLTsFGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A74A583DD22;
 Tue, 25 Jan 2022 09:12:22 +0000 (UTC)
Received: from bahia (unknown [10.39.192.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6958A7B028;
 Tue, 25 Jan 2022 09:12:21 +0000 (UTC)
Date: Tue, 25 Jan 2022 10:12:20 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/1] target/ppc: fix 'skip KVM' cond in
 cpu_interrupt_exittb()
Message-ID: <20220125101220.2c0f350d@bahia>
In-Reply-To: <20220121160841.9102-1-danielhb413@gmail.com>
References: <20220121160841.9102-1-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: clg@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 21 Jan 2022 13:08:41 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> cpu_interrupt_exittb() was introduced by commit 044897ef4a22
> ("target/ppc: Fix system lockups caused by interrupt_request state
> corruption") as a way to wrap cpu_interrupt() helper in BQL.
>=20
> After that, commit 6d38666a8931 ("ppc: Ignore the CPU_INTERRUPT_EXITTB
> interrupt with KVM") added a condition to skip this interrupt if we're
> running with KVM.
>=20
> Problem is that the change made by the above commit, testing for
> !kvm_enabled() at the start of cpu_interrupt_exittb():
>=20
> static inline void cpu_interrupt_exittb(CPUState *cs)
> {
>     if (!kvm_enabled()) {
>         return;
>     }
>     (... do cpu_interrupt(cs, CPU_INTERRUPT_EXITTB) ...)
>=20
> is doing the opposite of what it intended to do. This will return
> immediately if not kvm_enabled(), i.e. it's a emulated CPU, and if
> kvm_enabled() it will proceed to fire CPU_INTERRUPT_EXITTB.
>=20

Ohh boy... this is embarrassing :-\

> Fix the 'skip KVM' condition so the function is a no-op when
> kvm_enabled().
>=20
> CC: Greg Kurz <groug@kaod.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/809
> Fixes: 6d38666a8931 ("ppc: Ignore the CPU_INTERRUPT_EXITTB interrupt with=
 KVM")
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  target/ppc/helper_regs.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 8671b7bb69..7dca585ddd 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -201,7 +201,11 @@ void cpu_get_tb_cpu_state(CPUPPCState *env, target_u=
long *pc,
> =20
>  void cpu_interrupt_exittb(CPUState *cs)
>  {
> -    if (!kvm_enabled()) {
> +    /*
> +     * We don't need to worry about translation blocks
> +     * when running with KVM.
> +     */
> +    if (kvm_enabled()) {
>          return;
>      }
> =20


