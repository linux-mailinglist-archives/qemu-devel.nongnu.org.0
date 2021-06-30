Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E1F3B868A
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:55:22 +0200 (CEST)
Received: from localhost ([::1]:51760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycYb-00017m-6t
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lycJY-0001Ry-Pi
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:39:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lycJU-0000wN-Kn
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625067583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D89zjLjWX4El9Up8lJP0TtfKnm5xQQxYLqeeONWdJ7c=;
 b=IzO7bPqCPUsB5Ciyq0tD/IWqhOqpNmjK4YoUNMiW/4qPaO3+yRfJGxqPbxN3eGFqRr2li+
 /d4Aoh2XytAj9nreTIUt0YqYEcJSKIoSj2G264agBNGk2RjC0uhvwEZ9d9IuMKRbS7R14T
 lAklyIVB4BzGdKAGTasaHHEJo1wn5OQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-ZlC2L8pkNZ2t5FF61xJ3KA-1; Wed, 30 Jun 2021 11:39:28 -0400
X-MC-Unique: ZlC2L8pkNZ2t5FF61xJ3KA-1
Received: by mail-wr1-f71.google.com with SMTP id
 k1-20020adfe8c10000b0290124c5f1d4dbso1142695wrn.0
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 08:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=D89zjLjWX4El9Up8lJP0TtfKnm5xQQxYLqeeONWdJ7c=;
 b=PV7iDR/w0/9gpQD4saDi+RB60pvx9rq1AI3Exc4tk/Zrr/pTXXf5wCQ93xiA8XcloH
 nQ7XXGtjoYMJM1OW0AYQ7bMlZKbxNFl0AKKw8DITH/dCTcKc5OHutPvxAbbBl50C4PxW
 xsIdP6cBkudkP9Zj2AiCD83mwfazIySl3jJwPWr4UfqHiUz0twk0bfwyVbDdeH9W+/W4
 9iXlP2CSgoCyYMXt0KkcyBFjvLKLwpaVZm6vQTKFbze1s8gi7JvR3Omu3Pws2XUsizSz
 i8kuHzbc5sBTrN7Jx8MzSjEsCeCflZosD/4jvMlu3gSQteh3Q3G70avMgzxWviDw1MUy
 fnDQ==
X-Gm-Message-State: AOAM531iB9miKEN2PLLVMfTGLid5MLXs1YLjhQySN0NZ70M1XYd55AIh
 nJUzq8RAEXd3wgXCkOjAkEo5ccxJCRn66hxSlDgJ74z4WoHgmsjWIL6/YRsdDw8E+zqE/eRra5Z
 9FIMZcrFnDI+ceYg=
X-Received: by 2002:a5d:5388:: with SMTP id d8mr39362167wrv.423.1625067566797; 
 Wed, 30 Jun 2021 08:39:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAO1WeMj5IhMs2HYh0AvT9hEOHYj0jH+M4Ed8dqPBM7xIMbS/wex71ttuE7wsa8G82ZfIysg==
X-Received: by 2002:a5d:5388:: with SMTP id d8mr39362142wrv.423.1625067566559; 
 Wed, 30 Jun 2021 08:39:26 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id o20sm6489122wms.3.2021.06.30.08.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 08:39:26 -0700 (PDT)
Date: Wed, 30 Jun 2021 16:39:24 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 2/2] migration: Allow reset of postcopy_recover_triggered
 when failed
Message-ID: <YNyQLCorNvmrHAVq@work-vm>
References: <20210629181356.217312-1-peterx@redhat.com>
 <20210629181356.217312-3-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210629181356.217312-3-peterx@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> It's possible qemu_start_incoming_migration() failed at any point, when it
> happens we should reset postcopy_recover_triggered to false so that the user
> can still retry with a saner incoming port.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 1bb03d1eca..fcca289ef7 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2097,6 +2097,13 @@ void qmp_migrate_recover(const char *uri, Error **errp)
>  {
>      MigrationIncomingState *mis = migration_incoming_get_current();
>  
> +    /*
> +     * Don't even bother to use ERRP_GUARD() as it _must_ always be set by
> +     * callers (no one should ignore a recover failure); if there is, it's a
> +     * programming error.
> +     */
> +    assert(errp);
> +
>      if (mis->state != MIGRATION_STATUS_POSTCOPY_PAUSED) {
>          error_setg(errp, "Migrate recover can only be run "
>                     "when postcopy is paused.");
> @@ -2115,6 +2122,12 @@ void qmp_migrate_recover(const char *uri, Error **errp)
>       * to continue using that newly established channel.
>       */
>      qemu_start_incoming_migration(uri, errp);
> +
> +    /* Safe to dereference with the assert above */
> +    if (*errp) {
> +        /* Reset the flag so user could still retry */
> +        qatomic_set(&mis->postcopy_recover_triggered, false);
> +    }
>  }
>  
>  void qmp_migrate_pause(Error **errp)
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


