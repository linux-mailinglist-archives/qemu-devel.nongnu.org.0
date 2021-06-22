Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C293B0B9A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 19:41:02 +0200 (CEST)
Received: from localhost ([::1]:33050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvkOT-0007SY-9v
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 13:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lvkMM-0005wQ-G7
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 13:38:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lvkMK-0001FS-Aw
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 13:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624383525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8t7Of38MQXTRCDdmVQ77JKOj65+T40p7DPnHzN7hL1Q=;
 b=dzY5IqHGnJegfqaRkIIbFgBND/5mhbQDx3FTSMHwjigBOJErFPwvmlfyWm1rOD0+gGrlqp
 XxoWF9QrvZ09TSRh/cBdODdrxqiclWcSz6LrAffq4yzizb90r6GL+gYZ0LkyBdrVTjOfzk
 UHKSevtz13HIXW8X36OHxPdFEmFh0eI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-W49_rjg4O5KBMGUZSlN0nA-1; Tue, 22 Jun 2021 13:38:42 -0400
X-MC-Unique: W49_rjg4O5KBMGUZSlN0nA-1
Received: by mail-qt1-f197.google.com with SMTP id
 e20-20020ac85dd40000b029024ed7d58d2cso38039qtx.8
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 10:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8t7Of38MQXTRCDdmVQ77JKOj65+T40p7DPnHzN7hL1Q=;
 b=KhXYUt3CEAY/UKLQmz/f/HQPRgvBtimD3X8j+bW9CnSJSQe2l8jJhwQj+WU+isoGlM
 zMO1t3b0h4BIvQOIz6AWSokEAMVIpe3bRmxVLuZhuwkmVZEGM3IOmVhpVe97Kk1HHJ9s
 4viz/MDeYg/B+qx1bwN6YiIhaB3jZY7hxxsgDUDzi5JtpMhBUSB+4AjgESl96SSJcH94
 B/FPgRXPj1Kvy07wwnZ/N3PTyUhE3L871G/PpidOTVBG7coHyW7pK89I3S2a5xX7jLz3
 m8vlzXiS8Z7FfUUhewBjZ2vS+JwJwInsMAtQ6iPlbGxMA969G7lbCtQfvJk362qGJWWm
 MG+Q==
X-Gm-Message-State: AOAM5305+jDSUOb9Is8kV+88dt6XeYoQXaKqDaAMnQoMN2bYE9rsfaIG
 QL0Sxzber084BQCh5+aOhOQmt7hCQk2d2w71u19eq1dthZWd9+6DrBhi8w295GaN3a5eQFB6A4h
 a4PdMMD4WSjl8KqQ=
X-Received: by 2002:a05:622a:1896:: with SMTP id
 v22mr4456398qtc.348.1624383521723; 
 Tue, 22 Jun 2021 10:38:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0N7QGkEYtT8CdFn/Xd0gL5ZabH0yx06deW80dI3cEv4vx1rFB/p2SXxvyhZ2L3q3P9BqVNg==
X-Received: by 2002:a05:622a:1896:: with SMTP id
 v22mr4456384qtc.348.1624383521517; 
 Tue, 22 Jun 2021 10:38:41 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id o21sm2145294qtt.51.2021.06.22.10.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 10:38:41 -0700 (PDT)
Date: Tue, 22 Jun 2021 13:38:40 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v1 1/1] migration: Unregister yank if migration setup fails
Message-ID: <YNIgIAXaBnIP3MrR@t490s>
References: <20210622024236.600347-1-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210622024236.600347-1-leobras@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: qemu-devel@nongnu.org, Lukas Straub <lukasstraub2@web.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 11:42:36PM -0300, Leonardo Bras wrote:
> Currently, if a qemu instance is started with "-incoming defer" and
> an incorect parameter is passed to "migrate_incoming", it will print the
> expected error and reply with "duplicate yank instance" for any upcoming
> "migrate_incoming" command.
> 
> This renders current qemu process unusable, and requires a new qemu
> process to be started before accepting a migration.
> 
> This is caused by a yank_register_instance() that happens in
> qemu_start_incoming_migration() but is never reverted if any error
> happens.
> 
> Solves this by unregistering the instance if anything goes wrong
> in the function, allowing a new "migrate_incoming" command to be
> accepted.
> 
> Fixes: b5eea99ec2f ("migration: Add yank feature", 2021-01-13)
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1974366
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> 
> ---
>  migration/migration.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 4228635d18..ddcf9e1868 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -474,9 +474,13 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
>      } else if (strstart(uri, "fd:", &p)) {
>          fd_start_incoming_migration(p, errp);
>      } else {
> -        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>          error_setg(errp, "unknown migration protocol: %s", uri);
>      }
> +
> +    if (*errp) {
> +        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
> +    }
> +
>  }

Yes, looks right to me:

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


