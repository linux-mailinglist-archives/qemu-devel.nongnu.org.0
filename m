Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4654A87EC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 16:47:36 +0100 (CET)
Received: from localhost ([::1]:34722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFeKd-0005K5-VD
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 10:47:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFeHI-0002q7-FX
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:44:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFeHF-0003dO-Vq
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:44:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643903045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1KBPdnFyVCk8c/C1tM4Q7KkiIuHsthr5cSEbhXAFurY=;
 b=ievCIg/uMn6ikrIt8vvHzTON7kp+tH2uqzJY60Y2mgjOFgC5XwZNOxCkOQJPZJagyRYMpm
 nRLCvW8LpkwPdaEm+QgpfdRDsN8FlADpGP3mLdhUTO12MyIDg6yphRC8uln2I1HPV/Y8x/
 cbkooLHPqdykcBThaqAukJJcuqVhwUM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-i1znJ0x5PCqFo3x4RXG1rg-1; Thu, 03 Feb 2022 10:44:04 -0500
X-MC-Unique: i1znJ0x5PCqFo3x4RXG1rg-1
Received: by mail-wm1-f72.google.com with SMTP id
 w5-20020a1cf605000000b00354d2d83490so795207wmc.4
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 07:44:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1KBPdnFyVCk8c/C1tM4Q7KkiIuHsthr5cSEbhXAFurY=;
 b=CAbFyVTulZ3q0wsbk/dwENdH0UAG22uaQuhI16jYua1daG+7WTK3bteUX+YOhypgNK
 SF1UPvneZBN7Fka6gcgm0fb7v8eJWDwnnU/78zX6wryk8ZwOW825b/mT2TpCmzLQpfVy
 R0m5tsGbpUEnIf/VXRtlIzfAhmaMPGuG91FzDjZi1JYNm/VTgPx+3n2k7y9NfNOn+fl6
 aKLDuqGJAkV41g3bO1gNWo8ejM76D8jhkHMQoghlc2i61El+0H1gG2QgoaTKXdShBoAg
 hsk5bV05uL9aMTikwdzilU0V3OKCzF5z+VLT21mVAselerMpFuVoPdjWhMZU0vbVjzgS
 +iPQ==
X-Gm-Message-State: AOAM531r8uWY+8k4G+0zDnCgIuCBgDZ7XtvkogahBdCCgiMs7EOEX6PN
 S7cOrZENDlN0TxcIq9PVVMtOf145OEu7eiuqC/+ZPrDGlo//bNqQyMlrgoOIMuPO7Kv1RdoJ3Tl
 tbpi+E+YGQ+a92bQ=
X-Received: by 2002:a5d:6090:: with SMTP id w16mr29486376wrt.476.1643903043068; 
 Thu, 03 Feb 2022 07:44:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpOAjNhamEzcfpVoM3QZ9W78xhuzoUJm4G8x4lDyiUYnFzyqqMfdBwNadKJyxQHrt3V4tLQw==
X-Received: by 2002:a5d:6090:: with SMTP id w16mr29486366wrt.476.1643903042888; 
 Thu, 03 Feb 2022 07:44:02 -0800 (PST)
Received: from work-vm (82-132-239-190.dab.02.net. [82.132.239.190])
 by smtp.gmail.com with ESMTPSA id a14sm294637wmj.11.2022.02.03.07.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 07:44:02 -0800 (PST)
Date: Thu, 3 Feb 2022 15:44:00 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 12/15] migration: Move migrate_allow_multifd and
 helpers into migration.c
Message-ID: <Yfv4QKkrac+diZNw@work-vm>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-13-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220119080929.39485-13-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> This variable, along with its helpers, is used to detect whether multiple
> channel will be supported for migration.  In follow up patches, there'll be
> other capability that requires multi-channels.  Hence move it outside multifd
> specific code and make it public.  Meanwhile rename it from "multifd" to
> "multi_channels" to show its real meaning.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 22 +++++++++++++++++-----
>  migration/migration.h |  3 +++
>  migration/multifd.c   | 19 ++++---------------
>  migration/multifd.h   |  2 --
>  4 files changed, 24 insertions(+), 22 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 252ce1eaec..15a48b548a 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -180,6 +180,18 @@ static int migration_maybe_pause(MigrationState *s,
>                                   int new_state);
>  static void migrate_fd_cancel(MigrationState *s);
>  
> +static bool migrate_allow_multi_channels = true;
> +
> +void migrate_protocol_allow_multi_channels(bool allow)
> +{
> +    migrate_allow_multi_channels = allow;
> +}
> +
> +bool migrate_multi_channels_is_allowed(void)
> +{
> +    return migrate_allow_multi_channels;
> +}
> +
>  static gint page_request_addr_cmp(gconstpointer ap, gconstpointer bp)
>  {
>      uintptr_t a = (uintptr_t) ap, b = (uintptr_t) bp;
> @@ -463,12 +475,12 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
>  {
>      const char *p = NULL;
>  
> -    migrate_protocol_allow_multifd(false); /* reset it anyway */
> +    migrate_protocol_allow_multi_channels(false); /* reset it anyway */
>      qapi_event_send_migration(MIGRATION_STATUS_SETUP);
>      if (strstart(uri, "tcp:", &p) ||
>          strstart(uri, "unix:", NULL) ||
>          strstart(uri, "vsock:", NULL)) {
> -        migrate_protocol_allow_multifd(true);
> +        migrate_protocol_allow_multi_channels(true);
>          socket_start_incoming_migration(p ? p : uri, errp);
>  #ifdef CONFIG_RDMA
>      } else if (strstart(uri, "rdma:", &p)) {
> @@ -1252,7 +1264,7 @@ static bool migrate_caps_check(bool *cap_list,
>  
>      /* incoming side only */
>      if (runstate_check(RUN_STATE_INMIGRATE) &&
> -        !migrate_multifd_is_allowed() &&
> +        !migrate_multi_channels_is_allowed() &&
>          cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
>          error_setg(errp, "multifd is not supported by current protocol");
>          return false;
> @@ -2310,11 +2322,11 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>          }
>      }
>  
> -    migrate_protocol_allow_multifd(false);
> +    migrate_protocol_allow_multi_channels(false);
>      if (strstart(uri, "tcp:", &p) ||
>          strstart(uri, "unix:", NULL) ||
>          strstart(uri, "vsock:", NULL)) {
> -        migrate_protocol_allow_multifd(true);
> +        migrate_protocol_allow_multi_channels(true);
>          socket_start_outgoing_migration(s, p ? p : uri, &local_err);
>  #ifdef CONFIG_RDMA
>      } else if (strstart(uri, "rdma:", &p)) {
> diff --git a/migration/migration.h b/migration/migration.h
> index 34b79cb961..d0c0902ec9 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -425,4 +425,7 @@ void migration_cancel(const Error *error);
>  
>  void populate_vfio_info(MigrationInfo *info);
>  
> +bool migrate_multi_channels_is_allowed(void);
> +void migrate_protocol_allow_multi_channels(bool allow);
> +
>  #endif
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 3242f688e5..64ca50de62 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -535,7 +535,7 @@ void multifd_save_cleanup(void)
>  {
>      int i;
>  
> -    if (!migrate_use_multifd() || !migrate_multifd_is_allowed()) {
> +    if (!migrate_use_multifd() || !migrate_multi_channels_is_allowed()) {
>          return;
>      }
>      multifd_send_terminate_threads(NULL);
> @@ -870,17 +870,6 @@ cleanup:
>      multifd_new_send_channel_cleanup(p, sioc, local_err);
>  }
>  
> -static bool migrate_allow_multifd = true;
> -void migrate_protocol_allow_multifd(bool allow)
> -{
> -    migrate_allow_multifd = allow;
> -}
> -
> -bool migrate_multifd_is_allowed(void)
> -{
> -    return migrate_allow_multifd;
> -}
> -
>  int multifd_save_setup(Error **errp)
>  {
>      int thread_count;
> @@ -891,7 +880,7 @@ int multifd_save_setup(Error **errp)
>      if (!migrate_use_multifd()) {
>          return 0;
>      }
> -    if (!migrate_multifd_is_allowed()) {
> +    if (!migrate_multi_channels_is_allowed()) {
>          error_setg(errp, "multifd is not supported by current protocol");
>          return -1;
>      }
> @@ -989,7 +978,7 @@ int multifd_load_cleanup(Error **errp)
>  {
>      int i;
>  
> -    if (!migrate_use_multifd() || !migrate_multifd_is_allowed()) {
> +    if (!migrate_use_multifd() || !migrate_multi_channels_is_allowed()) {
>          return 0;
>      }
>      multifd_recv_terminate_threads(NULL);
> @@ -1138,7 +1127,7 @@ int multifd_load_setup(Error **errp)
>      if (!migrate_use_multifd()) {
>          return 0;
>      }
> -    if (!migrate_multifd_is_allowed()) {
> +    if (!migrate_multi_channels_is_allowed()) {
>          error_setg(errp, "multifd is not supported by current protocol");
>          return -1;
>      }
> diff --git a/migration/multifd.h b/migration/multifd.h
> index e57adc783b..0ed07794b6 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -13,8 +13,6 @@
>  #ifndef QEMU_MIGRATION_MULTIFD_H
>  #define QEMU_MIGRATION_MULTIFD_H
>  
> -bool migrate_multifd_is_allowed(void);
> -void migrate_protocol_allow_multifd(bool allow);
>  int multifd_save_setup(Error **errp);
>  void multifd_save_cleanup(void);
>  int multifd_load_setup(Error **errp);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


