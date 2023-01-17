Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7140D66E1EE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 16:18:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHnhu-0004We-Pw; Tue, 17 Jan 2023 10:17:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHnhn-0004Vr-PB
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:16:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHnhi-0002sE-SK
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:16:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673968609;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oas+znjzf+AP4bd/x5YD4nR2sJcjipvpxkKT4cCa4PQ=;
 b=FKNCzuMI/pzVI/Npwu73WVH4ylCmoZ30ymgYChjLjPV+bStJJaAhSqUcOGPA5V2ZYIm4jD
 UtS3F+vbdpNYImMvkxszhVkyZFYIm+vH2NPX/pRr9snyaTG5i83FA2r2MwJ4FkTqFoGngT
 iSPGAV609pPkhrBHz35Y+thLiLyupEE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-RlMwqNhtNHeGZkFAEnrslA-1; Tue, 17 Jan 2023 10:16:25 -0500
X-MC-Unique: RlMwqNhtNHeGZkFAEnrslA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 884BE80D180;
 Tue, 17 Jan 2023 15:01:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15AF3492B10;
 Tue, 17 Jan 2023 15:01:06 +0000 (UTC)
Date: Tue, 17 Jan 2023 15:01:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 3/3] configure: Enable -Wthread-safety if present
Message-ID: <Y8a4MFiwtxmE8JI4@redhat.com>
References: <20230117135203.3049709-1-eesposit@redhat.com>
 <20230117135203.3049709-4-eesposit@redhat.com>
 <Y8aqii6iBsdd5rl6@redhat.com>
 <b24cbd41-6190-8642-4673-01a6c4b50659@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b24cbd41-6190-8642-4673-01a6c4b50659@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 17, 2023 at 03:41:29PM +0100, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> Am 17/01/2023 um 15:02 schrieb Daniel P. Berrang=C3=A9:
> > On Tue, Jan 17, 2023 at 08:52:03AM -0500, Emanuele Giuseppe Esposito wr=
ote:
> >> From: Kevin Wolf <kwolf@redhat.com>
> >>
> >> This enables clang's thread safety analysis (TSA), which we'll use to
> >> statically check the block graph locking.
> >>
> >> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> >> Message-Id: <20221207131838.239125-9-kwolf@redhat.com>
> >> Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> >> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> >> ---
> >>  configure | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/configure b/configure
> >> index 2281892657..14668e6269 100755
> >> --- a/configure
> >> +++ b/configure
> >> @@ -1183,6 +1183,7 @@ add_to warn_flags -Wnested-externs
> >>  add_to warn_flags -Wendif-labels
> >>  add_to warn_flags -Wexpansion-to-defined
> >>  add_to warn_flags -Wimplicit-fallthrough=3D2
> >> +add_to warn_flags -Wthread-safety
> >=20
> > Does this thread safety analysis have any kind of measurable
> > impact on compilation speed ?
> >=20
> > Our CI jobs are quite sensitive to any increase in build
> > time.
>=20
> From a quick run in my machine (Dell PowerEdge R440 with Intel(R)
> Xeon(R) Gold 5120 CPU @ 2.20GHz, 28 cpus):
>=20
> without clang:
> real    2m46.729s=0F
> =03user    19m24.122s=0F
> =03sys     2m58.643s=0F
>=20
> with clang:
> real    2m45.204s
> user    19m52.096s
> sys     2m9.036s
>=20
> So there should be no significative impact.
>=20
> I also forgot to mention that this serie fixes the CI failure seen in:
>=20
> https://gitlab.com/qemu-project/qemu/-/jobs/3479763741
> https://gitlab.com/qemu-project/qemu/-/jobs/3479763746

Odd, that job already has  -Wthread-safety included in CFLAGS, which
would seem to make this patch redundant, but I don't see where
-Wthread-safety came from in that pipeline=20


With regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


