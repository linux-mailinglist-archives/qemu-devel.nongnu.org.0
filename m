Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698CC45F1F2
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 17:34:37 +0100 (CET)
Received: from localhost ([::1]:36662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqeBI-0008DG-Cp
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 11:34:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mqe9s-0007ST-4E
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:33:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mqe9p-0003XU-BH
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:33:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637944383;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=JaO13pOJyScVAACIsSadlls5677QRy/8y6vkatiZdmQ=;
 b=M5QA1KpwTUv0idpgc9WqtQyT5tH5RoAfBOQfTraNzaRa7gHbeEY/SPk1uW2YjyZDT8AZT7
 hwv9u1fhnxOLCeA/KFwoDiWsEqhu3rTYLH1HtonyBoXSxQzKpp6KLw6uoLKQPmFGVfxfWP
 4ztD6+V9g8Shcv0krm5ZsIuQB1gI11c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-zYBRuoLNPoKUkAj_y80tSA-1; Fri, 26 Nov 2021 11:33:02 -0500
X-MC-Unique: zYBRuoLNPoKUkAj_y80tSA-1
Received: by mail-wm1-f72.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so5720195wmr.3
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 08:33:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=JaO13pOJyScVAACIsSadlls5677QRy/8y6vkatiZdmQ=;
 b=zE2sS4vbWZf6MZd+ZpeXMMjESYPnHhrZS+z7RDeSzGTfBbBjd2Nc/cK035BO3rcuI9
 hhNGUfnK37D0VZYdzm3nGkywwEPUp99Zd8vrFbb4SjxiD1SN+aPczmio8z/NCqaV6fYd
 Jm18ba3dAGCbSXKnlluGWxALMMKOQvE8BafacRksj6joNuIXy400Ka8T7A7XqKAjzDXk
 dZtX+nPFb0/QPMFqW8bJbT9zfRN6J+0jgBUBOksRyeXdWwgjaNiHO0X5t7uEJ06xSN52
 I8rTTzjAI/jiSUfctDozisrSGvRtpYDehbb0rLzVOcnS7+ziL5fGbzcr1K8om6h7r8R5
 oq8w==
X-Gm-Message-State: AOAM533icTxSWPUzgGU1giclM2ftX6T362GZNDypi7hx02n+R/HDkH2u
 Tex9iWe0n++4Ok0yutdphJ3n6JkUhteMeQmsdPLzXdhh8fSGMok77lLxrT7n56dnY70Fp8VO8av
 yZj3Euq74jShYLMc=
X-Received: by 2002:a5d:4575:: with SMTP id a21mr15599847wrc.193.1637944381312; 
 Fri, 26 Nov 2021 08:33:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLxAv/46vJ6gjouVf6lz+/FlEdP4ycgPW3+4pd5tK60+pRuNuJJWr3+/PaESUGbyPzEztsPg==
X-Received: by 2002:a5d:4575:: with SMTP id a21mr15599816wrc.193.1637944381109; 
 Fri, 26 Nov 2021 08:33:01 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id ay29sm6028081wmb.44.2021.11.26.08.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:33:00 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Li Zhang <lizhang@suse.de>
Subject: Re: [PATCH 2/2] migration: Set the socket backlog number to reduce
 the chance of live migration failure
In-Reply-To: <20211126153154.25424-3-lizhang@suse.de> (Li Zhang's message of
 "Fri, 26 Nov 2021 16:31:54 +0100")
References: <20211126153154.25424-1-lizhang@suse.de>
 <20211126153154.25424-3-lizhang@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 26 Nov 2021 17:32:59 +0100
Message-ID: <87ilweg9ms.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Li Zhang <lizhang@suse.de> wrote:
> When creating the guest on destination with -incoming ip:port in QEMU command line,
> the source code that sets the backlog number as the same as multifd channels doesn't
> get called. So the number of backlog is always 1. It's very easy to cause live migration
> failure, so a bigger number is preferred to reduce the chance of the failure.
>
> Signed-off-by: Li Zhang <lizhang@suse.de>
> ---
>  migration/socket.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/migration/socket.c b/migration/socket.c
> index 05705a32d8..398d4c10fa 100644
> --- a/migration/socket.c
> +++ b/migration/socket.c
> @@ -152,7 +152,7 @@ socket_start_incoming_migration_internal(SocketAddress *saddr,
>      QIONetListener *listener = qio_net_listener_new();
>      MigrationIncomingState *mis = migration_incoming_get_current();
>      size_t i;
> -    int num = 1;
> +    int num = 16;
>  
>      qio_net_listener_set_name(listener, "migration-socket-listener");

Here, the right answer is to use -incoming defer.

Later, Juan.


