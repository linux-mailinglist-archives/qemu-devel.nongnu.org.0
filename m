Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19D26E8226
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 21:52:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppDq3-00019L-L9; Wed, 19 Apr 2023 15:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppDq0-00019D-DM
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 15:51:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppDpy-00005C-P5
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 15:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681933889;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9ELt8bbqNqSkDuV++aVe7GyFO37C63LuRnlFFsPs0hw=;
 b=RvFodZfwykM2w3lO8zLZsQZ0Uc6+hcqsgG09Uc68mtF3NKKWoZS+JbOdkNc9AcN1sYtYba
 eG8hQ7bk3EGy11NzUXTLBbV4xBAMwBq77GQmlUGP35jnq4b9laS/xgF8W69xTfE+9oVM+v
 NJqC9wXjZYrsegaQvj5mYtPpw2bTqig=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-UMJz_4GfPdKGMHCQwwwQTA-1; Wed, 19 Apr 2023 15:51:27 -0400
X-MC-Unique: UMJz_4GfPdKGMHCQwwwQTA-1
Received: by mail-wm1-f72.google.com with SMTP id
 t16-20020a05600c451000b003f187e8d111so44631wmo.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 12:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681933886; x=1684525886;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ELt8bbqNqSkDuV++aVe7GyFO37C63LuRnlFFsPs0hw=;
 b=HPwDdkqXnjhmxgndHRNkExR7BRSD+PBm9JAxol7yqAsRSj5HD+M/AJ2faYLVzUFTIm
 Mrma/CxjtP9HW60CwGNyLwlsb5/h56eqe5T3big+cvoitDyPOWgM4RyIbxGVvSIBy099
 la28/ngzZH17Ifkze48qYfObte1m6CisUhBNKgGdaGzCI0UhXQKZEwi6XMn6ZIWaNs51
 eSYLGJgQmLBMQzTqV4wYmzD596sWbRDNJI8z18R7Khg5ckKjmfVGLlpERF1v1HUSrL9u
 CehMgwDADkTMv9Sv0KqunATrF67d4AV/YlLkq//kv5jaOrzv4HZ9COL/ZB2sHkHZeS7z
 FBzw==
X-Gm-Message-State: AAQBX9ejF5ghzvn7r2IvaDPGiMMhmV+AVG0nYuqhmdST0fFbKHmh5iiX
 BXgrU2S8tiYv2EBoAcTxISO0UhsLTk16ds0cSb13f6zFsRsawYG3HI/OM72NGNKrFZ9bFHN+SNY
 jwtFk0tnvmNuVoKo=
X-Received: by 2002:a1c:4b09:0:b0:3f0:7e56:82a4 with SMTP id
 y9-20020a1c4b09000000b003f07e5682a4mr17716254wma.18.1681933886708; 
 Wed, 19 Apr 2023 12:51:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zr372/9p6ID6QGUnFcnVhqnZhslOw3dC5/R4tvRkyElKZL1tRJHEd5myPT2Ecz2xJkqt8aMw==
X-Received: by 2002:a1c:4b09:0:b0:3f0:7e56:82a4 with SMTP id
 y9-20020a1c4b09000000b003f07e5682a4mr17716244wma.18.1681933886383; 
 Wed, 19 Apr 2023 12:51:26 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 o9-20020a5d6849000000b002fb0c5a0458sm7548739wrw.91.2023.04.19.12.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 12:51:25 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Leonardo Bras Soares
 Passos <lsoaresp@redhat.com>,  David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 4/4] migration: Allow
 postcopy_ram_supported_by_host() to report err
In-Reply-To: <20230419161739.1129988-5-peterx@redhat.com> (Peter Xu's message
 of "Wed, 19 Apr 2023 12:17:39 -0400")
References: <20230419161739.1129988-1-peterx@redhat.com>
 <20230419161739.1129988-5-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 19 Apr 2023 21:51:24 +0200
Message-ID: <87y1mnzm4j.fsf@secure.mitica>
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

Peter Xu <peterx@redhat.com> wrote:
> Instead of print it to STDERR, bring the error upwards so that it can be
> reported via QMP responses.
>
> E.g.:
>
> { "execute": "migrate-set-capabilities" ,
>   "arguments": { "capabilities":
>   [ { "capability": "postcopy-ram", "state": true } ] } }
>
> { "error":
>   { "class": "GenericError",
>     "desc": "Postcopy is not supported: Host backend files need to be TMPFS
>     or HUGETLBFS only" } }
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/migration.c    |  9 +++---
>  migration/postcopy-ram.c | 61 ++++++++++++++++++++++------------------
>  migration/postcopy-ram.h |  3 +-
>  migration/savevm.c       |  3 +-
>  4 files changed, 42 insertions(+), 34 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index bda4789193..ac15fa6092 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1313,6 +1313,7 @@ static bool migrate_caps_check(bool *cap_list,
>      MigrationCapabilityStatusList *cap;
>      bool old_postcopy_cap;
>      MigrationIncomingState *mis = migration_incoming_get_current();
> +    Error *local_err = NULL;

This variable can be declared in the only block that uses it.

> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index bbb8af61ae..0713ddeeef 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -282,11 +282,14 @@ static bool request_ufd_features(int ufd, uint64_t features)
>      return true;
>  }
>  
> -static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
> +static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis,
> +                                Error **errp)
>  {
>      uint64_t asked_features = 0;
>      static uint64_t supported_features;
>  
> +    assert(errp);
> +

Is this right?  My impression was that you have to live with errp being NULL.

error_setg() knows how to handle it being NULL:

error_setg() -> error_setg_internal() -> error_setv()

static void error_setv(Error **errp,
                       const char *src, int line, const char *func,
                       ErrorClass err_class, const char *fmt, va_list ap,
                       const char *suffix)
{
    ....
    if (errp == NULL) {
        return;
    }


> -static int test_ramblock_postcopiable(RAMBlock *rb)
> +static int test_ramblock_postcopiable(RAMBlock *rb, Error **errp)

In patch 3 you do this other change:

-static int test_ramblock_postcopiable(RAMBlock *rb, void *opaque)
+static int test_ramblock_postcopiable(RAMBlock *rb)

Can you do with a single change?

The idea of the patch is right.

Later, Juan.


