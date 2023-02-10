Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0FF69189E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 07:42:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQN6L-0003pH-7k; Fri, 10 Feb 2023 01:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pQN5Y-0003gS-Qf
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:41:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pQN5X-0000ne-7O
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:40:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676011250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zXXUeySjxpi+cwm7d75zK/tIor99bSa7/MCFNL+1idc=;
 b=FfLqjk+PCrwupSK2HYWEK8R0wFGs6FQQWZGXYeumhxG9+OkGhDPvRgGdOoSh7CVl552/yT
 7pbqBKoLjAwXObO1uNuqxnbqsLIZ5D1d8MmaqfAAmKX1ZaJhz6QiIeZLvPEHjvo32W9aQs
 eHNtC1GZNW4u+USwqkvHhff5Ws3i86k=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-533-Eins2rLwPUOvgFLzK9RlOA-1; Fri, 10 Feb 2023 01:40:41 -0500
X-MC-Unique: Eins2rLwPUOvgFLzK9RlOA-1
Received: by mail-oi1-f197.google.com with SMTP id
 bq17-20020a05680823d100b0037ad91d5262so1243213oib.7
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 22:40:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zXXUeySjxpi+cwm7d75zK/tIor99bSa7/MCFNL+1idc=;
 b=mmdPNBx1ug+58YW2MXucwfpignZqrmPB7jvGSEYAVFqurphKK4WhNCvSbb2WJ3qp3L
 yIbdBKZLjz8In+DgA1h7CedS23s+86CzigR2lwKADYxNDgS+tguA4lxvqdTuBjyXnaM0
 5S4dY7EHr6CLvZIxcFyqKi9mwxyLChBQ97L7237owHk1IHJ9ja2oIdZRFWsDu2HiOm9x
 R0yiGNDg5k0vexlvguGrZmwtUhMTLn/XnTfhJuvWF2w71xSLfbHex40xqr+Aa2gHCMuq
 z0i7cyVCTGUmoB7E2sMCYEWdUTbhG4Z3PlWniJ1YM2FvgdGfiaIh1cQ2IDUXMTYUgM9m
 tF4w==
X-Gm-Message-State: AO0yUKUPq1VgWyB0IirAoIHAHWy9FgWmKxEnMM+9pkfMw9+WkqSgqqSB
 M8MvfUx8AUjjmIOI1fMyet8nn9bAyUrrPFiW2DV2ebwlJYMkdbeu7Vj1P8rU7aRxdvRFaWAXtIs
 K+SmG8xBMjXQWWCE=
X-Received: by 2002:a05:6870:5820:b0:169:eb3b:2435 with SMTP id
 r32-20020a056870582000b00169eb3b2435mr8194758oap.58.1676011240663; 
 Thu, 09 Feb 2023 22:40:40 -0800 (PST)
X-Google-Smtp-Source: AK7set8f+2cXT8n5jYPxnyIM3CwJoip44sdOouYgH83kCyPTJdnYm5fZqtlEhvNSpZmdCrwsL/WlQA==
X-Received: by 2002:a05:6870:5820:b0:169:eb3b:2435 with SMTP id
 r32-20020a056870582000b00169eb3b2435mr8194749oap.58.1676011240371; 
 Thu, 09 Feb 2023 22:40:40 -0800 (PST)
Received: from ?IPv6:2804:1b3:a800:9aa9:fdcb:7dec:9680:8417?
 ([2804:1b3:a800:9aa9:fdcb:7dec:9680:8417])
 by smtp.gmail.com with ESMTPSA id
 q203-20020acad9d4000000b0037adc5702d4sm1831672oig.38.2023.02.09.22.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 22:40:39 -0800 (PST)
Message-ID: <b61707eb365e94b68d103875ad8bec6e4cdec9e7.camel@redhat.com>
Subject: Re: [PATCH v1 4/4] migration/multifd: Move load_cleanup inside
 incoming_state_destroy
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org
Date: Fri, 10 Feb 2023 03:40:36 -0300
In-Reply-To: <20230210063630.532185-4-leobras@redhat.com>
References: <20230210063630.532185-1-leobras@redhat.com>
 <20230210063630.532185-4-leobras@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 2023-02-10 at 03:36 -0300, Leonardo Bras wrote:
> Currently running migration_incoming_state_destroy() without first runnin=
g
> multifd_load_cleanup() will cause a yank error:
>=20
> qemu-system-x86_64: ../util/yank.c:107: yank_unregister_instance:
> Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
> (core dumped)
>=20
> The above error happens in the target host, when multifd is being used
> for precopy, and then postcopy is triggered and the migration finishes.
> This will crash the VM in the target host.
>=20
> To avoid that, move multifd_load_cleanup() inside
> migration_incoming_state_destroy(), so that the load cleanup becomes part
> of the incoming state destroying process.
>=20
> Running multifd_load_cleanup() twice can become an issue, though, but the
> only scenario it could be ran twice is on process_incoming_migration_bh()=
.
> So removing this extra call is necessary.
>=20
> On the other hand, this multifd_load_cleanup() call happens way before th=
e
> migration_incoming_state_destroy() and having this happening before
> dirty_bitmap_mig_before_vm_start() and vm_start() may be a need.
>=20
> So introduce a new function multifd_load_shutdown() that will mainly stop
> all multifd threads and close their QIOChannels. Then use this function
> instead of multifd_load_cleanup() to make sure nothing else is received
> before dirty_bitmap_mig_before_vm_start().

Please add:

Fixes: b5eea99ec2 ("migration: Add yank feature")
Reported-by: Li Xiaohui <xiaohli@redhat.com>

>=20
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  migration/multifd.h   | 1 +
>  migration/migration.c | 4 +++-
>  migration/multifd.c   | 7 +++++++
>  3 files changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 9a7e1a8826..7cfc265148 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -17,6 +17,7 @@ int multifd_save_setup(Error **errp);
>  void multifd_save_cleanup(void);
>  int multifd_load_setup(Error **errp);
>  void multifd_load_cleanup(void);
> +void multifd_load_shutdown(void);
>  bool multifd_recv_all_channels_created(void);
>  void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
>  void multifd_recv_sync_main(void);
> diff --git a/migration/migration.c b/migration/migration.c
> index ce962ea577..9f69447320 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -302,6 +302,8 @@ void migration_incoming_state_destroy(void)
>  {
>      struct MigrationIncomingState *mis =3D migration_incoming_get_curren=
t();
> =20
> +    multifd_load_cleanup();
> +
>      if (mis->to_src_file) {
>          /* Tell source that we are done */
>          migrate_send_rp_shut(mis, qemu_file_get_error(mis->from_src_file=
) !=3D 0);
> @@ -543,7 +545,7 @@ static void process_incoming_migration_bh(void *opaqu=
e)
>       */
>      qemu_announce_self(&mis->announce_timer, migrate_announce_params());
> =20
> -    multifd_load_cleanup();
> +    multifd_load_shutdown();
> =20
>      dirty_bitmap_mig_before_vm_start();
> =20
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 7e37a459ed..9302c9f6cf 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -1022,6 +1022,13 @@ static void multifd_recv_terminate_threads(Error *=
err)
>      }
>  }
> =20
> +void multifd_load_shutdown(void)
> +{
> +    if (migrate_use_multifd() && migrate_multi_channels_is_allowed()) {
> +        multifd_recv_terminate_threads(NULL);
> +    }
> +}
> +
>  void multifd_load_cleanup(void)
>  {
>      int i;


