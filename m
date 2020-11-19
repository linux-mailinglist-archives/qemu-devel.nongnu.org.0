Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAEC2B92B9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 13:46:40 +0100 (CET)
Received: from localhost ([::1]:44620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfjKh-0001GX-FC
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 07:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kfjJc-0000jn-Ot
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 07:45:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kfjJa-0003Te-TR
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 07:45:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605789929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0lfW7wHUlL+qNZSmRZVktGaubA8gY41PzjnsT1Vyvrw=;
 b=UqtcrvngFfeGBh+IpjXfCJj9SgnEAQjeYP1Yw9GIWtujJQ8CfToRy8puOG1REaVeVWOQs/
 fmBA5E+wWYe+gXR5N59V4g6q3FLZqOyVgykq52/wghhGXGle18EL8NC9p7z/Ow3CMAccUW
 eAoXHLTv63kf4+Ar6E37lHvrw8Tp6sE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-Qq99HBSKPT2kUMfvt4sGEQ-1; Thu, 19 Nov 2020 07:45:27 -0500
X-MC-Unique: Qq99HBSKPT2kUMfvt4sGEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D0EC1DDE2;
 Thu, 19 Nov 2020 12:45:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8502E5C1A1;
 Thu, 19 Nov 2020 12:45:26 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59DBD4BB40;
 Thu, 19 Nov 2020 12:45:26 +0000 (UTC)
Date: Thu, 19 Nov 2020 07:45:25 -0500 (EST)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <588132608.25123582.1605789925923.JavaMail.zimbra@redhat.com>
In-Reply-To: <20201119112704.837423-1-stefanha@redhat.com>
References: <20201119112704.837423-1-stefanha@redhat.com>
Subject: Re: [PATCH v2] trace: use STAP_SDT_V2 to work around symbol visibility
MIME-Version: 1.0
X-Originating-IP: [10.40.192.178, 10.4.195.18]
Thread-Topic: trace: use STAP_SDT_V2 to work around symbol visibility
Thread-Index: VZ/ipOW07FIrE/8HTrIeS/VeTrXeQw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?utf-8?Q?=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, rjones@redhat.com, fche@redhat.com, kraxel@redhat.com,
 wcohen@redhat.com, ddepaula@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



----- Original Message -----
> From: "Stefan Hajnoczi" <stefanha@redhat.com>
> To: qemu-devel@nongnu.org
> Cc: "Peter Maydell" <peter.maydell@linaro.org>, "Stefan Hajnoczi" <stefan=
ha@redhat.com>, "Daniel P . Berrang=C3=A9"
> <berrange@redhat.com>, wcohen@redhat.com, fche@redhat.com, kraxel@redhat.=
com, rjones@redhat.com,
> mrezanin@redhat.com, ddepaula@redhat.com
> Sent: Thursday, November 19, 2020 12:27:04 PM
> Subject: [PATCH v2] trace: use STAP_SDT_V2 to work around symbol visibili=
ty
>=20
> QEMU binaries no longer launch successfully with recent SystemTap
> releases. This is because modular QEMU builds link the sdt semaphores
> into the main binary instead of into the shared objects where they are
> used. The symbol visibility of semaphores is 'hidden' and the dynamic
> linker prints an error during module loading:
>=20
>   $ ./configure --enable-trace-backends=3Ddtrace --enable-modules ...
>   ...
>   Failed to open module:
>   /builddir/build/BUILD/qemu-4.2.0/s390x-softmmu/../block-curl.so: undefi=
ned
>   symbol: qemu_curl_close_semaphore
>=20
> The long-term solution is to generate per-module dtrace .o files and
> link them into the module instead of the main binary.
>=20
> In the short term we can define STAP_SDT_V2 so dtrace(1) produces a .o
> file with 'default' symbol visibility instead of 'hidden'. This
> workaround is small and easier to merge for QEMU 5.2.
>=20

Thanks for this fix.

Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>

> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: wcohen@redhat.com
> Cc: fche@redhat.com
> Cc: kraxel@redhat.com
> Cc: rjones@redhat.com
> Cc: mrezanin@redhat.com
> Cc: ddepaula@redhat.com
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v2:
>  * Define STAP_SDT_V2 everywhere [danpb]
> ---
>  configure         | 1 +
>  trace/meson.build | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/configure b/configure
> index 714e75b5d8..5d91d49c7b 100755
> --- a/configure
> +++ b/configure
> @@ -4832,6 +4832,7 @@ if have_backend "dtrace"; then
>    trace_backend_stap=3D"no"
>    if has 'stap' ; then
>      trace_backend_stap=3D"yes"
> +    QEMU_CFLAGS=3D"$QEMU_CFLAGS -DSTAP_SDT_V2"
>    fi
>  fi
> =20
> diff --git a/trace/meson.build b/trace/meson.build
> index d5fc45c628..843ea14495 100644
> --- a/trace/meson.build
> +++ b/trace/meson.build
> @@ -38,13 +38,13 @@ foreach dir : [ '.' ] + trace_events_subdirs
>      trace_dtrace_h =3D custom_target(fmt.format('trace-dtrace', 'h'),
>                                     output: fmt.format('trace-dtrace', 'h=
'),
>                                     input: trace_dtrace,
> -                                   command: [ 'dtrace', '-o', '@OUTPUT@'=
,
> '-h', '-s', '@INPUT@' ])
> +                                   command: [ 'dtrace', '-DSTAP_SDT_V2',
> '-o', '@OUTPUT@', '-h', '-s', '@INPUT@' ])
>      trace_ss.add(trace_dtrace_h)
>      if host_machine.system() !=3D 'darwin'
>        trace_dtrace_o =3D custom_target(fmt.format('trace-dtrace', 'o'),
>                                       output: fmt.format('trace-dtrace',
>                                       'o'),
>                                       input: trace_dtrace,
> -                                     command: [ 'dtrace', '-o', '@OUTPUT=
@',
> '-G', '-s', '@INPUT@' ])
> +                                     command: [ 'dtrace', '-DSTAP_SDT_V2=
',
> '-o', '@OUTPUT@', '-G', '-s', '@INPUT@' ])
>        trace_ss.add(trace_dtrace_o)
>      endif
> =20
> --
> 2.28.0
>=20
>=20

--=20
Miroslav Rezanina
Software Engineer - Virtualization Team Maintainer


