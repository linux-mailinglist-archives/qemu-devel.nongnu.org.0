Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7868F6FCDBA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 20:24:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwS08-0004fP-Sb; Tue, 09 May 2023 14:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwS06-0004ee-Qf
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:23:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwS05-0004xL-Em
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:23:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683656628;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bi2w/7Y/Awe6UE68rukj8GuOs336k2ZO/ivg3wNdld4=;
 b=H7A3MqwTmSXxGYfyYerWu1roknr5bD8AOd43uzKcpK34WxGmKoqhsdlXLmC+t4No4dKuvx
 c9qRplgCDYQRdcGzIDHLqQNjylQhNqy+2ZNFDz2AcphPk/j1ao9D25yiOeyphcZPdZuJeI
 4uPAdodfGcZRZDqt2JCKmrgyQhLzPVY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-OsjVXJ_gNcqu7TzSVPGPtA-1; Tue, 09 May 2023 14:23:47 -0400
X-MC-Unique: OsjVXJ_gNcqu7TzSVPGPtA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30635d18e55so2134964f8f.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 11:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683656626; x=1686248626;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bi2w/7Y/Awe6UE68rukj8GuOs336k2ZO/ivg3wNdld4=;
 b=SuQG7VCulwQvPdHe2+hEcA6X4kpVmcNTh3uEGa5FvNS7YxOYuxLdA12RzJiWDdcEGo
 tyEOpPXkcYbprPpFo038VgG9SsDzOklXon8qwvr0b4b8aRzmtuJ4dui+jxPvyFXpHiCS
 jEL6PI5WCS+tUS8lYmIvDfpiXkwQmScMRPKLfVkZ5ia8TfGiL7Ycxh1jlYnkVyWXKcnw
 YP+rX8dZizNw0yIK8MR7cl1xeH6I5o6rroUgrwZ2rdd4pze9iBsJW7rxsXT/1xFijz7l
 /XVQpP0EaadnmOKIvJ1iCaLEVvru88d5yMDtHOV0edKYyJWmFuaFZ6jGh0f+XK44QgKj
 x5cg==
X-Gm-Message-State: AC+VfDxfiPj8C0eS+QpnHruc24gMfu8dSXMHuFZLKArQjrJGKnsNGDDv
 KOrEuYKZ7lZiJUwuUbHgKMN8BG21xu/dSHZu3eejvwwXcRxpbUWm+ghYA3ZAP5fxw3u7poTOCKA
 olQpPwi8QHHWLFFQ=
X-Received: by 2002:adf:db0c:0:b0:307:9d2a:fd35 with SMTP id
 s12-20020adfdb0c000000b003079d2afd35mr4852071wri.53.1683656626395; 
 Tue, 09 May 2023 11:23:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ42S78puFS6UMmO+/bqu4mHE432rVoLrqlHhrMB6m+1BYuhZNSOcG8pQWmWKg7W/JADuuAmiA==
X-Received: by 2002:adf:db0c:0:b0:307:9d2a:fd35 with SMTP id
 s12-20020adfdb0c000000b003079d2afd35mr4852063wri.53.1683656626072; 
 Tue, 09 May 2023 11:23:46 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 r9-20020adfe689000000b002f6dafef040sm15029626wrm.12.2023.05.09.11.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 11:23:45 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  lukasstraub2@web.de,  chen.zhang@intel.com,
 Peter Xu <peterx@redhat.com>,  Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 10/10] migration: block incoming colo when capability
 is disabled
In-Reply-To: <20230428194928.1426370-11-vsementsov@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 28 Apr 2023 22:49:28 +0300")
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-11-vsementsov@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 09 May 2023 20:23:44 +0200
Message-ID: <87r0rpbbyn.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> We generally require same set of capabilities on source and target.
> Let's require x-colo capability to use COLO on target.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I will update the docs as said by lukas.

> ---
>  migration/migration.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 8c5bbf3e94..5e162c0622 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -395,6 +395,12 @@ int migration_incoming_enable_colo(void)
>      return -ENOTSUP;
>  #endif
>  
> +    if (!migrate_colo()) {
> +        error_report("ENABLE_COLO command come in migration stream, but c-colo "
> +                     "capability is not set");
> +        return -EINVAL;
> +    }
> +
>      if (ram_block_discard_disable(true)) {
>          error_report("COLO: cannot disable RAM discard");
>          return -EBUSY;


