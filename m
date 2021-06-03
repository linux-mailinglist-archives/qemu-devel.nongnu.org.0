Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00B639A28B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 15:54:01 +0200 (CEST)
Received: from localhost ([::1]:52130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lonnM-0008GJ-Er
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 09:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1lonma-0007L1-M9; Thu, 03 Jun 2021 09:53:12 -0400
Received: from mail.csgraf.de ([85.25.223.15]:58802 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1lonmY-0002HB-Hz; Thu, 03 Jun 2021 09:53:12 -0400
Received: from smtpclient.apple
 (dynamic-077-004-113-104.77.4.pool.telefonica.de [77.4.113.104])
 by csgraf.de (Postfix) with ESMTPSA id 99FBF6080292;
 Thu,  3 Jun 2021 15:53:06 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Alexander Graf <agraf@csgraf.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v8 00/19] hvf: Implement Apple Silicon Support
Date: Thu, 3 Jun 2021 15:53:05 +0200
Message-Id: <69E1BF99-9687-4915-B9DF-E2DAF8157289@csgraf.de>
References: <CAFEAcA8qwTY7OZzZSCqD3CA_wsL9VJEFWkCSNAerQohM4VvMuQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8qwTY7OZzZSCqD3CA_wsL9VJEFWkCSNAerQohM4VvMuQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: iPhone Mail (18E212)
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> Am 03.06.2021 um 15:44 schrieb Peter Maydell <peter.maydell@linaro.org>:
>=20
> =EF=BB=BFOn Wed, 19 May 2021 at 21:22, Alexander Graf <agraf@csgraf.de> wr=
ote:
>>=20
>> Now that Apple Silicon is widely available, people are obviously excited
>> to try and run virtualized workloads on them, such as Linux and Windows.
>>=20
>> This patch set implements a fully functional version to get the ball
>> going on that. With this applied, I can successfully run both Linux and
>> Windows as guests. I am not aware of any limitations specific to
>> Hypervisor.framework apart from:
>>=20
>>  - Live migration / savevm
>>  - gdbstub debugging (SP register)
>>  - missing GICv3 support
>=20
>> Alexander Graf (18):
>>  hvf: Move assert_hvf_ok() into common directory
>>  hvf: Move vcpu thread functions into common directory
>>  hvf: Move cpu functions into common directory
>>  hvf: Move hvf internal definitions into common header
>>  hvf: Make hvf_set_phys_mem() static
>>  hvf: Remove use of hv_uvaddr_t and hv_gpaddr_t
>>  hvf: Split out common code on vcpu init and destroy
>>  hvf: Use cpu_synchronize_state()
>>  hvf: Make synchronize functions static
>>  hvf: Remove hvf-accel-ops.h
>>  hvf: Introduce hvf vcpu struct
>>  hvf: Simplify post reset/init/loadvm hooks
>=20
> I haven't had time to review the tail-end of this series yet,
> I'm afraid, but these first 12 patches are clearly all OK, so
> I'm going to put them into target-arm.next so that at least
> that refactoring part is in master and won't go stale.
>=20
> The last 7 patches are still on my todo list to review.

Thank you ;)

Alex

>=20
> thanks
> -- PMM

