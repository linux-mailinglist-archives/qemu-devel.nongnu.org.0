Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6C9697E03
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 15:09:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSIT1-00082N-Bk; Wed, 15 Feb 2023 09:09:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pSIT0-00082B-4O
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:09:02 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pSISx-0001MA-T4
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:09:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=9gf/eyoF/OZBdlQrQOGcOEHR81H+oKVI7+EBTBveN+Y=; b=TTTCW4lPt6QmPAFeNu9493NS+2
 lTBoueJk10z9a3k85U11aZVTeFoI26yuu4OWjZn4qnfSsx6siPG+RLKS07ED4BGlPOtiKetZCzOlY
 EKwSnQAhqvmvew4yP1t+WZjlfV2y8OHSnxSAsfG5wLa42jTIUS1ta+R3Xzb89RkmJNfJLvQRqNTq3
 G5GjfnlAkCVXhGJO2BKQDWfQWL5QV/aRbxwYBUWLDhvPPdcZJpymBL22wwwgu+IBltX+XvzykxE+5
 TRWFCqK+QWFu/h/Kh3ZWSaVBCJd7XWc+jyGtYyGHokhvR1eceSZ5TY0ZDeqz9DpanYyS9vSEKvAwJ
 tqq2dODdjZWIePm/RcSE35HHF54RkQu75XndLm0dI4//2SHLAwrXbGFNBvxAGS8VZ3nzv27TyNtxX
 PstEHv6cMLQ1SBNZ0+y6EynScIeu7xla6Nb/m4nF6e+sc5XMvhKV44pZvRlJ6txErHQuqlzNtnHVu
 5ov0ZXJLPGPNVS31CQIEIZD641dhHdV5Sbc98+kIzeTya/M2Q0CEbrO0sEjRPhEfknJ5qd3qY2FAk
 UAsX0G7/NgN1yMlygnS6QwApVRI8kH1nVd7JV/XlASBdTpK8DCdGUzKB7kuT7omBFmeHK4cnlyEmP
 NUyhT7Q3B0gkB8Mk/rbRsY6N4HsOW1B2MWNxJUEnw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Dorinda Bassey <dbassey@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, armbru@redhat.com,
 pbonzini@redhat.com, wtaymans@redhat.com,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH] audio/pwaudio.c: Add Pipewire audio backend for QEMU
Date: Wed, 15 Feb 2023 15:08:54 +0100
Message-ID: <5159868.WgR6L5i3FV@silver>
In-Reply-To: <CAJ+F1CL0_OAj5-jsyCVY5aF=qoSoPx2Mu=q8Z7mpp3mesRi6=Q@mail.gmail.com>
References: <20230215085102.415053-1-dbassey@redhat.com>
 <CAJ+F1CL0_OAj5-jsyCVY5aF=qoSoPx2Mu=q8Z7mpp3mesRi6=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Wednesday, February 15, 2023 2:18:50 PM CET Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Wed, Feb 15, 2023 at 12:51 PM Dorinda Bassey <dbassey@redhat.com> wrot=
e:
> >
> > This commit adds a new audiodev backend to allow QEMU to use Pipewire a=
s=20
both an audio sink and source. This backend is available on most systems.
> >
>=20
> Hmm, I would rather have less audio (and ui) backends in QEMU. (for
> audio, if I could introduce and keep only one, that would be
> GStreamer: to remove the others..)
>=20
> What is the main advantage compared to using the ALSA backend? (I
> assume pipewire depends on ALSA anyway on Linux)

I think it does make sense to add Pipewire. Apparently it gains popularity.

The main advantage of Pipewire is its interoperability: It allows you to=20
connect apps with each other that only support a specific audio system. Say=
=20
one app that only supports JACK, another app that only supports PulseAudio,=
=20
another that only supports ALSA and so on. So it tries to provide a univers=
al=20
plug on a system for all.

Best regards,
Christian Schoenebeck



