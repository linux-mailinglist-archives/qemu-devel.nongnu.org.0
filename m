Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353FC48D2BC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 08:21:35 +0100 (CET)
Received: from localhost ([::1]:55660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7uQP-0008Fz-Td
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 02:21:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7u8K-0006fv-T0
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:02:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7u8J-000273-CB
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642057370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oV+E/Dg6yGDDTq22oIfJ3VE9HMnhtk5tutfdSjcCFuo=;
 b=S9Bmgpvcx25s4i8Tvi1fkyCjbjQJCk81/0uaa24zDeDTOoJbBwt7StoSsCDBfZq1Ovpk6I
 JmouJ5dqtmwTaK0Ear74KKbA3oYo5w8X8M9a/ar6Zml5sdV6SMNz6M0MoU2A1aC/NdWuWt
 F3rsoKqQAOFy93kbg60Lf51u+JOR6iU=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-Kp76r0WgPHqT5-8lbZcz-w-1; Thu, 13 Jan 2022 02:02:49 -0500
X-MC-Unique: Kp76r0WgPHqT5-8lbZcz-w-1
Received: by mail-pl1-f200.google.com with SMTP id
 u14-20020a170902714e00b00148ee2b06efso5184048plm.5
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 23:02:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oV+E/Dg6yGDDTq22oIfJ3VE9HMnhtk5tutfdSjcCFuo=;
 b=SlVKp8fKUZi+5xliBPz6VOiwHhv8ANW+jud7+KVjHj6lEvM1NXdo2tj6fcJ8mHUHb2
 C9g090VUpTuMfJiVx8JFLQZsTK19Oxllsr/jgih/9bPIv8qiLl667ep9+0/A7MyRO14s
 Vnx6elaAOGSe+NX5CuVgPgn6qCmSrJGIfHQHTt9hoVkfcqnp68rpUxDDaJI8jttqXzPt
 zLqw3bb4kou7YMZZr6ZwFINeU2O0HIn+5oLEsJkk6fv9y278HbZsZEiCQGqjWfvEN+/m
 P3arAuMT/8ZoJiqStiHPW3F8Fnkq3VS/L07prfc8uh2Z4UufvBYiKT0SYxf/bmiAs9lw
 yzvw==
X-Gm-Message-State: AOAM533BNaofDvXiba6KYlikxUEsfFwWQfT7D1U/s2pBwEhcDvRLvwxr
 /+ndsFNQG1RA6VadQ+tnSUxeXOwnRDax9NVKonGuqkHnDhf0c/CmosDAnUv0PKrocHIO1E42C/P
 7EYalHFDOlU5ZP/w=
X-Received: by 2002:a17:90b:3e89:: with SMTP id
 rj9mr123154pjb.91.1642057368403; 
 Wed, 12 Jan 2022 23:02:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5E8g0WJEralF6K1oWq+QOlH6ImzgEmrYF+v7J8R4gU+jIFgSzivPQQDtOG7n9hqY/Hi90fw==
X-Received: by 2002:a17:90b:3e89:: with SMTP id
 rj9mr123127pjb.91.1642057368122; 
 Wed, 12 Jan 2022 23:02:48 -0800 (PST)
Received: from xz-m1.local ([191.101.132.233])
 by smtp.gmail.com with ESMTPSA id l13sm1443874pgq.34.2022.01.12.23.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 23:02:47 -0800 (PST)
Date: Thu, 13 Jan 2022 15:02:42 +0800
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 4/5] migration: Add migrate_use_tls() helper
Message-ID: <Yd/OkqOA96rnGggo@xz-m1.local>
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-5-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106221341.8779-5-leobras@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 06, 2022 at 07:13:41PM -0300, Leonardo Bras wrote:
>  void migration_channel_process_incoming(QIOChannel *ioc)
>  {
> -    MigrationState *s = migrate_get_current();
>      Error *local_err = NULL;
>  
>      trace_migration_set_incoming_channel(
>          ioc, object_get_typename(OBJECT(ioc)));
>  
> -    if (s->parameters.tls_creds &&
> -        *s->parameters.tls_creds &&
> +    if (migrate_use_tls() &&
>          !object_dynamic_cast(OBJECT(ioc),
>                               TYPE_QIO_CHANNEL_TLS)) {
> +        MigrationState *s = migrate_get_current();
> +

Trivial nit: I'd rather keep the line there; as the movement offers nothing,
imho..

>          migration_tls_channel_process_incoming(s, ioc, &local_err);
>      } else {
>          migration_ioc_register_yank(ioc);

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


