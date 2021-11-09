Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2B744B1FD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 18:26:30 +0100 (CET)
Received: from localhost ([::1]:47830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkUtB-0000mP-RY
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 12:26:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mkUrC-00077J-Bv
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:24:27 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:31291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mkUrA-0001pL-Cz
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:24:26 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530--wuTMI4RNsivwIneSM_S2A-1; Tue, 09 Nov 2021 12:24:12 -0500
X-MC-Unique: -wuTMI4RNsivwIneSM_S2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C86F81922036;
 Tue,  9 Nov 2021 17:24:11 +0000 (UTC)
Received: from bahia (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B84F62A44;
 Tue,  9 Nov 2021 17:24:09 +0000 (UTC)
Date: Tue, 9 Nov 2021 18:24:07 +0100
From: Greg Kurz <groug@kaod.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 2/2] accel/tcg: Register a force_rcu notifier
Message-ID: <20211109182407.75f623f8@bahia>
In-Reply-To: <8a184041-39ad-1207-f32b-673e2b8da0f2@linaro.org>
References: <20211108113353.133462-1-groug@kaod.org>
 <20211108113353.133462-3-groug@kaod.org>
 <5892d9dd-5f0c-d745-6a0a-84485e0e29c3@linaro.org>
 <8a184041-39ad-1207-f32b-673e2b8da0f2@linaro.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Nov 2021 09:21:27 +0100
Richard Henderson <richard.henderson@linaro.org> wrote:

> On 11/9/21 8:54 AM, Richard Henderson wrote:
> > On 11/8/21 12:33 PM, Greg Kurz wrote:
> >> +static void rr_force_rcu(Notifier *notify, void *data)
> >> +{
> >> +=C2=A0=C2=A0=C2=A0 /*
> >> +=C2=A0=C2=A0=C2=A0=C2=A0 * Called with rcu_registry_lock held, using =
async_run_on_cpu() ensures
> >> +=C2=A0=C2=A0=C2=A0=C2=A0 * that there are no deadlocks.
> >> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> >> +=C2=A0=C2=A0=C2=A0 async_run_on_cpu(first_cpu, do_nothing, RUN_ON_CPU=
_NULL);
> >> +}
> >=20
> > Should first_cpu really be rr_current_cpu?
> > It's not clear to me that this will work for -smp 2 -cpu thread=3Dsingl=
e.
>=20

Why wouldn't it work ? IIUC we always have a first_cpu and
async_run_on_cpu() will kick any vCPU currently run by the
RR thread... or am I missing something ?

Anyway, it seems more explicit to use rr_current_cpu.

> Alternately, no async_run_on_cpu at all, just rr_kick_next_cpu().
>=20

Heh, this looks even better ! I'll try this right away.

Thanks Richard !

--
Greg

>=20
> r~
>=20


