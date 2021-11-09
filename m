Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D806A44B2BD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 19:32:50 +0100 (CET)
Received: from localhost ([::1]:60700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVvN-0008UF-FK
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 13:32:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mkVsC-0005MR-RG
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 13:29:32 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:57860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mkVsB-0000DZ-Hj
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 13:29:32 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-4O_wOOKvOfueorhH5UMgsg-1; Tue, 09 Nov 2021 13:29:28 -0500
X-MC-Unique: 4O_wOOKvOfueorhH5UMgsg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C001E75A;
 Tue,  9 Nov 2021 18:29:27 +0000 (UTC)
Received: from bahia (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADC6D56A91;
 Tue,  9 Nov 2021 18:29:25 +0000 (UTC)
Date: Tue, 9 Nov 2021 19:29:23 +0100
From: Greg Kurz <groug@kaod.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 2/2] accel/tcg: Register a force_rcu notifier
Message-ID: <20211109192923.2c4b788a@bahia>
In-Reply-To: <86f1fea3-9fc4-b61b-ff0e-4cf5e7374675@redhat.com>
References: <20211108113353.133462-1-groug@kaod.org>
 <20211108113353.133462-3-groug@kaod.org>
 <5892d9dd-5f0c-d745-6a0a-84485e0e29c3@linaro.org>
 <8a184041-39ad-1207-f32b-673e2b8da0f2@linaro.org>
 <20211109182407.75f623f8@bahia>
 <86f1fea3-9fc4-b61b-ff0e-4cf5e7374675@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Nov 2021 19:03:56 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 11/9/21 18:24, Greg Kurz wrote:> Anyway, it seems more explicit to use=
 rr_current_cpu.
> >=20
> >> Alternately, no async_run_on_cpu at all, just rr_kick_next_cpu().
> >>
> >=20
> > Heh, this looks even better ! I'll try this right away.
>=20
> Once you've tested it I can queue the series with just a
>=20
> --- a/accel/tcg/tcg-accel-ops-rr.c
> +++ b/accel/tcg/tcg-accel-ops-rr.c
> @@ -141,10 +141,10 @@ static void do_nothing(CPUState *cpu, run_on_cpu_da=
ta d)
>   static void rr_force_rcu(Notifier *notify, void *data)
>   {
>       /*
> -     * Called with rcu_registry_lock held, using async_run_on_cpu() ensu=
res
> -     * that there are no deadlocks.
> +     * Called with rcu_registry_lock held.  rr_kick_next_cpu() is
> +     * asynchronous, so there cannot be deadlocks.
>        */
> -    async_run_on_cpu(first_cpu, do_nothing, RUN_ON_CPU_NULL);
> +    rr_kick_next_cpu();
>   }
>  =20
>   /*
>=20
> squashed in.
>=20

I've tested and it works just fine. I need to send a v4 anyway so that
the commit message is in sync with the code changes.

Cheers,

--
Greg

> Paolo
>=20


