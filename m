Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37682C59AC
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 17:57:31 +0100 (CET)
Received: from localhost ([::1]:55822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiKaI-00031e-HD
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 11:57:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiKY7-00028p-3z
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 11:55:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiKY3-0007ob-5x
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 11:55:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606409710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8VSTRhc69DgGHJ70nI6zKWxeJfkBsyUPuxrQqK6+iM4=;
 b=OOuXO0tPgrqAuxRn74nhHHSh+eRUqpZA7Q5JOymOwPEIRuWCi7WvIVteLS1DcHKOsHYvDf
 4IaKC+/LLdNIwUE2eW9Jt18thUjvESizxsHhrd6afopZQN/FYatPGnSa8thRDXbDp99eZU
 o0wMql22ZGFtmRHMgNXX6kAwyDLFLeY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-YlEfm7sTNa2mQFS12ZwdkQ-1; Thu, 26 Nov 2020 11:55:08 -0500
X-MC-Unique: YlEfm7sTNa2mQFS12ZwdkQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C4148049C4
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 16:55:07 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 276475C1BD;
 Thu, 26 Nov 2020 16:55:00 +0000 (UTC)
Date: Thu, 26 Nov 2020 17:54:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 12/36] vl: load plugins as late as possible
Message-ID: <20201126175459.566a55a0@redhat.com>
In-Reply-To: <20201123141435.2726558-13-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-13-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 09:14:11 -0500
Paolo Bonzini <pbonzini@redhat.com> wrote:

> There is no need to load plugins in the middle of default device processi=
ng,
> move -plugin handling just before preconfig is entered.
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  softmmu/vl.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 87c10f625c..ab08a0290c 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -125,6 +125,7 @@ static const char *boot_order;
>  static const char *boot_once;
>  static const char *incoming;
>  static const char *loadvm;
> +static QemuPluginList plugin_list =3D QTAILQ_HEAD_INITIALIZER(plugin_lis=
t);
>  enum vga_retrace_method vga_retrace_method =3D VGA_RETRACE_DUMB;
>  static int mem_prealloc; /* force preallocation of physical target memor=
y */
>  int display_opengl;
> @@ -3074,6 +3075,11 @@ static void qemu_init_board(void)
>          create_default_memdev(current_machine, mem_path);
>      }
> =20
> +    /* process plugin before CPUs are created, but once -smp has been pa=
rsed */
> +    if (qemu_plugin_load_list(&plugin_list)) {
> +        exit(1);
> +    }
> +
>      machine_run_board_init(current_machine);
> =20
>      /*
> @@ -3208,7 +3214,6 @@ void qemu_init(int argc, char **argv, char **envp)
>      Error *err =3D NULL;
>      bool have_custom_ram_size;
>      BlockdevOptionsQueue bdo_queue =3D QSIMPLEQ_HEAD_INITIALIZER(bdo_que=
ue);
> -    QemuPluginList plugin_list =3D QTAILQ_HEAD_INITIALIZER(plugin_list);
> =20
>      qemu_add_opts(&qemu_drive_opts);
>      qemu_add_drive_opts(&qemu_legacy_drive_opts);
> @@ -4178,11 +4183,6 @@ void qemu_init(int argc, char **argv, char **envp)
>                                 machine_class->default_machine_opts, 0);
>      }
> =20
> -    /* process plugin before CPUs are created, but once -smp has been pa=
rsed */
> -    if (qemu_plugin_load_list(&plugin_list)) {
> -        exit(1);
> -    }
> -
>      qemu_opts_foreach(qemu_find_opts("device"),
>                        default_driver_check, NULL, NULL);
>      qemu_opts_foreach(qemu_find_opts("global"),


