Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E415255B0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 21:25:54 +0200 (CEST)
Received: from localhost ([::1]:54346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npERc-0004eG-VY
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 15:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1npD9k-0005vc-TN
 for qemu-devel@nongnu.org; Thu, 12 May 2022 14:03:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1npD9j-0002e1-5n
 for qemu-devel@nongnu.org; Thu, 12 May 2022 14:03:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652378598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QC1llFFScIPO4BnTVdX8zrd7KDnaLcW7lISqQ+1rHUs=;
 b=bLn8tUVUL9XJp4ANan+80sNfLVtst8KP9jyk4r8dg3HyO7D5d3xkx+05BzgGjUBMBIxiOG
 gLcMg8aIWEwGagWxKjxCaGS7iLINi37cnSVBD0X5TRomkfE37X1S0YaY+iV0MIrbyn9ULb
 879BAhb4TA8rdHtYM9AQHAkj4RanAqY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-LNKt7XHRPBC_vEN89dPBTA-1; Thu, 12 May 2022 14:03:17 -0400
X-MC-Unique: LNKt7XHRPBC_vEN89dPBTA-1
Received: by mail-wr1-f70.google.com with SMTP id
 l7-20020adfa387000000b0020acc61dbaeso2313147wrb.7
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 11:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QC1llFFScIPO4BnTVdX8zrd7KDnaLcW7lISqQ+1rHUs=;
 b=kglyz1nPgQvb6BFsSTT7PxtX3qIagQncICrhiBYpBzPJMuoumjXTDIXL4qNWQbfUQJ
 OjmG/wboMU+0P03LEDCYTmQdD1sXgzn7T/xcPOD+6YD2fOJkCH/O9o6xHY5mwrGl4g5a
 fZueEF4zZZlOKfmFr7qwxnln672GiYe3rJK5PImN1MJnyV23MMDHNAV1b9oAAotltNnc
 ggoAP5HPJzFn8jG7bfYcJyeKsbTYMLkzpqPhBYiZxtXGS0nETtBdCjpFc3Zq+0INnr0e
 e/xIeb+/to1QDCJgYrxTwAW9xAx4lXQ3JoPyxLsAGs55AyNDQeChTyvVNRIOzWNmh7E+
 UBMw==
X-Gm-Message-State: AOAM5328UMJO+NhKm5IFZQuKF46KoKTIfrzIugy1pOX88Cgb2+iRb7JM
 3u3j39hS+/DMxdLLFhu6nQbVWtfNlMUombjNdXaZdsHaTHqVYnwiQEmVrQqirFVQRTygXnoU76H
 IR3qYncy5QEeF04U=
X-Received: by 2002:a7b:c5d1:0:b0:37f:a8a3:9e17 with SMTP id
 n17-20020a7bc5d1000000b0037fa8a39e17mr11149175wmk.109.1652378595795; 
 Thu, 12 May 2022 11:03:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUhpsc27po44r6VxdD7+XIcMg924A/nvqi+ji0TsWKKRXOq+yEqNJ6fbnSMkb2Tq00J/Ke2g==
X-Received: by 2002:a7b:c5d1:0:b0:37f:a8a3:9e17 with SMTP id
 n17-20020a7bc5d1000000b0037fa8a39e17mr11149156wmk.109.1652378595505; 
 Thu, 12 May 2022 11:03:15 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o1-20020adfba01000000b0020c5253d914sm160455wrg.96.2022.05.12.11.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 11:03:15 -0700 (PDT)
Date: Thu, 12 May 2022 19:03:13 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH v5 17/21] migration: Export tls-[creds|hostname|authz]
 params to cmdline too
Message-ID: <Yn1L4eOEBMVvnYXH@work-vm>
References: <20220425233847.10393-1-peterx@redhat.com>
 <20220425233847.10393-18-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425233847.10393-18-peterx@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> It's useful for specifying tls credentials all in the cmdline (along with
> the -object tls-creds-*), especially for debugging purpose.
> 
> The trick here is we must remember to not free these fields again in the
> finalize() function of migration object, otherwise it'll cause double-free.
> 
> The thing is when destroying an object, we'll first destroy the properties
> that bound to the object, then the object itself.  To be explicit, when
> destroy the object in object_finalize() we have such sequence of
> operations:
> 
>     object_property_del_all(obj);
>     object_deinit(obj, ti);
> 
> So after this change the two fields are properly released already even
> before reaching the finalize() function but in object_property_del_all(),
> hence we don't need to free them anymore in finalize() or it's double-free.
> 
> This also fixes a trivial memory leak for tls-authz as we forgot to free it
> before this patch.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/migration.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 71a50b5c37..b0f2de1e09 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -4339,6 +4339,9 @@ static Property migration_properties[] = {
>                        DEFAULT_MIGRATE_ANNOUNCE_STEP),
>      DEFINE_PROP_BOOL("x-postcopy-preempt-break-huge", MigrationState,
>                        postcopy_preempt_break_huge, true),
> +    DEFINE_PROP_STRING("tls-creds", MigrationState, parameters.tls_creds),
> +    DEFINE_PROP_STRING("tls-hostname", MigrationState, parameters.tls_hostname),
> +    DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
>  
>      /* Migration capabilities */
>      DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
> @@ -4372,12 +4375,9 @@ static void migration_class_init(ObjectClass *klass, void *data)
>  static void migration_instance_finalize(Object *obj)
>  {
>      MigrationState *ms = MIGRATION_OBJ(obj);
> -    MigrationParameters *params = &ms->parameters;
>  
>      qemu_mutex_destroy(&ms->error_mutex);
>      qemu_mutex_destroy(&ms->qemu_file_lock);
> -    g_free(params->tls_hostname);
> -    g_free(params->tls_creds);

So hmm, why is tls-authz special here?

Dave

>      qemu_sem_destroy(&ms->wait_unplug_sem);
>      qemu_sem_destroy(&ms->rate_limit_sem);
>      qemu_sem_destroy(&ms->pause_sem);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


