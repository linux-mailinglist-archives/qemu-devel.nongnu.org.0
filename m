Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654C9457C08
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 07:54:28 +0100 (CET)
Received: from localhost ([::1]:43328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moKGZ-00081V-1p
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 01:54:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1moKFg-0007KY-BJ
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 01:53:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1moKFc-0005xX-Kf
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 01:53:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637391206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iVEy7P3muvM483y+NjHiEl03mus1rWkuh1QGtx7Lwuw=;
 b=Qbxb5JzcjXxXND1jsMMEeYYBRa1alE+tFzNRBf0PmtVdmDt7ipABEFvC1YyDyq6VYLRAE2
 i+7PUV4WED/mGk8OiQMfyY06Z6PWlCk4NRVo1QNrftH/R8hh4v08p8LuY55G6Ft7tN7u23
 SDYpz7E07rJ8wjjjEmZAmKZgo6rRZIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-xv0eTUNpOwyMBbyWSnx95g-1; Sat, 20 Nov 2021 01:53:24 -0500
X-MC-Unique: xv0eTUNpOwyMBbyWSnx95g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B5C2108088A
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 06:53:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D86B860BF1;
 Sat, 20 Nov 2021 06:53:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2D0B911380A7; Sat, 20 Nov 2021 07:53:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH-for-6.2 v3] qdev-monitor: Only allow full --global
 <driver>.<property>=<val> option
References: <20211119182644.480115-1-philmd@redhat.com>
Date: Sat, 20 Nov 2021 07:53:20 +0100
In-Reply-To: <20211119182644.480115-1-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 19 Nov 2021 19:26:44
 +0100")
Message-ID: <87czmv1fof.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> When not all fields of the --global option are provided,
> QEMU might crash:
>
>   $ qemu-system-x86_64 -global driver=3Disa-fdc
>   qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
>   string_input_visitor_new: Assertion `str' failed.
>   Aborted (core dumped)
>
> Fix by only allowing --global with all 3 fields:
>
>   $ qemu-system-x86_64 -global driver=3Disa-fdc
>   Invalid 'global' option format. It must be provided as:
>     --global <driver>.<property>=3D<value>
>
> Reported-by: Thomas Huth <thuth@redhat.com>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v3: Change qemu_global_option (Markus)
>
> Supersedes: <20211119122911.365036-1-philmd@redhat.com>
> ---
>  softmmu/qdev-monitor.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 01f3834db57..558272b147c 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -1029,13 +1029,10 @@ int qemu_global_option(const char *str)
>          qemu_opt_set(opts, "value", str + offset + 1, &error_abort);
>          return 0;
>      }
> +    printf("Invalid 'global' option format. It must be provided as:\n");
> +    printf("  --global <driver>.<property>=3D<value>\n");
> =20
> -    opts =3D qemu_opts_parse_noisily(&qemu_global_opts, str, false);
> -    if (!opts) {
> -        return -1;
> -    }
> -
> -    return 0;
> +    return -1;
>  }
> =20
>  bool qmp_command_available(const QmpCommand *cmd, Error **errp)

This drops a documented part of the external interface:

    $ qemu-system-x86_64 -help | grep -C 1 global
                    i.e. -set drive.$id.file=3D/path/to/image
    -global driver.property=3Dvalue
--> -global driver=3Ddriver,property=3Dproperty,value=3Dvalue
                    set a global default for a driver property
    -boot [order=3Ddrives][,once=3Ddrives][,menu=3Don|off]

It goes back to commit 3751d7c43f "vl: allow full-blown QemuOpts syntax
for -global", v2.4.0.

The appropriate fix is to check @opts for presence of all three
parameters.


