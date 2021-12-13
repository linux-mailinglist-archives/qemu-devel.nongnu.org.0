Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A46547307A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:30:30 +0100 (CET)
Received: from localhost ([::1]:58206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwnHY-0001hE-75
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:30:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mwnG5-00012k-Rg
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:28:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mwnG2-00006T-KT
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:28:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639409333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OCdj70yQYgaAqeDoxqnvwQk/hsFJSOy4s/n+Rngl5fc=;
 b=ec0DdvzqwjU/42dgSzkgC5JQsmyftV/fvHrlOLsW65en/PIl49asjK8EJmV9/Oxn8Vdh+f
 NuWUn+XkwuGuV0L1nKpDaVM3q2eUyB8AmKRqqwRj3pZolWgXjuIPlzK/u/W2temBWQQP76
 QMf7U+clweFz1hPa/rCFuPijsY0GjGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-2M9BzYJOP0eXXU8IJwscgw-1; Mon, 13 Dec 2021 10:28:51 -0500
X-MC-Unique: 2M9BzYJOP0eXXU8IJwscgw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D35C01825D5B;
 Mon, 13 Dec 2021 15:28:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A37F5DF3A;
 Mon, 13 Dec 2021 15:28:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BA287113865F; Mon, 13 Dec 2021 16:28:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Redesign of QEMU startup & initial configuration
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
Date: Mon, 13 Dec 2021 16:28:17 +0100
In-Reply-To: <a31201bb-78de-e926-1476-b48b008745c1@redhat.com> (Paolo
 Bonzini's message of "Fri, 10 Dec 2021 16:38:08 +0100")
Message-ID: <878rwozfqm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 12/10/21 14:54, Markus Armbruster wrote:
>> I want an open path to a single binary.  Taking years to get there is
>> fine.
>
> The single binary is a distraction in my opinion.  Imagine
> instead of vl.c you have this in your second binary:

[...]

> static void open_socket_and_monitor(void)
> {
>     int nfds = check_socket_activation();
>     Chardev *chardev;
>     if (nfds > 1) {
>         error_report("QEMU only supports listening on one socket");
>         exit(1);
>     }
>     if (!nfds) {
>         ChardevBackend backend = {
>             .type = CHARDEV_BACKEND_KIND_STDIO,
>             .u.stdio.data = &(ChardevStdio) {
>                 .has_signal = true,
>                 .signal = false
>             }
>         };
>         chardev = qemu_chardev_new("#qmp0", TYPE_CHARDEV_STDIO, &backend, NULL, &error_fatal);
>     } else {
>         ChardevBackend backend = {
>            .type = CHARDEV_BACKEND_KIND_SOCKET,
>            .u.socket.data = &(ChardevSocket) {
>                .addr = &(SocketAddressLegacy) {
>                    .type = SOCKET_ADDRESS_LEGACY_KIND_FD,
>                    .u.fd.data = &(String){
>                        .str = (char *) stringify(FIRST_SOCKET_ACTIVATION_FD)
>                    }
>                }
>            }
>         };
>         chardev = qemu_chardev_new("#qmp0", TYPE_CHARDEV_SOCKET, &backend, NULL, &error_fatal);
>     }
>     monitor_init_qmp(chardev, true, &error_fatal);
> }
>
> void qemu_init(int argc, char **argv, char **envp)
> {
>     error_init(argv[0]);
>     qemu_init_exec_dir(argv[0]);
>     qemu_init_subsystems();
>
>     /* Missing: parse -name, -sandbox, -trace, -L */
>
>     loc_set_none();
>     rcu_disable_atfork();
>     qemu_init_main_loop(&error_fatal);
>     cpu_timers_init();
>     open_socket_and_monitor();
>     init_displaystate();
>     os_setup_signal_handling();
> }
>
> This is the ultimate QEMU startup code.  If we can get this code to
> actually build a machine, you've reached the point where you don't care
> about what is in the command line parser; and consequently you don't care
> if there is one binary or two.

Define "you".  Also explain why it should include me, because I think it
doesn't :)

By when can we have this second binary in master?  Opinion, please, not
promise.

Would you object to me expanding the CLI here to the point where I think
we can deprecate the old binary?

If yes, why?

If no, the file names climain.c and qmpmain.c you mentioned upthread
won't last.  Recommend to pick better names.


