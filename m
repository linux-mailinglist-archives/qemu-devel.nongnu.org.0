Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A3268E1B0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 21:06:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPUDZ-0003iM-9R; Tue, 07 Feb 2023 15:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPUDX-0003i4-66
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:05:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPUDU-0005wK-Gw
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:05:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675800323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SQcpypF1zRnJtHoXo1rFAfvGxMAlj6EJNaxw19JfZDI=;
 b=AlVPW6aemMlI/LotuJf3Op6LmlyoidxEjVX4xHk4MCY/nPvUjcrgjBYx1Rj6hD01XtY9u8
 xGKFjdsrgO5gdlKvXggSNN2JP6YEuCvZAfC0sWZK3geqEElY3D1EifpXL8qhGEe3AOpvVg
 B5Z9LfLMf1zwtbJXU9puICM68ybmfXw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-342-U7w6aG3oOxu2OKVNs5T_cw-1; Tue, 07 Feb 2023 15:05:21 -0500
X-MC-Unique: U7w6aG3oOxu2OKVNs5T_cw-1
Received: by mail-qt1-f198.google.com with SMTP id
 i5-20020ac813c5000000b003b86b748aadso9293259qtj.14
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 12:05:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SQcpypF1zRnJtHoXo1rFAfvGxMAlj6EJNaxw19JfZDI=;
 b=3uRr1gmyTW1asTAUwa88blJF6xI/TXZzI8xrjp4zmIjlreWB4XPVdBTUZhuozMoxkv
 WSXKN6ugTVAZCq3xSJYAYFgPYmCCcm2zQrAsIZJlfSiJD/KV4XPmyywitlwBY0Lo/fB6
 cTZPFUZ13+k15c/ImnDBHhxezQIfpTKSPOW+18uJnBH1omT4amfFoRlNOZJbDmnkE2CP
 bgBIvw/HxSNPm1eqVn9GjONIqrA/QIGGR+f1324xpjXhisPBm+NB0jrNb+alZ9+9cfkv
 qrwynj00Ox1x43tqJjrvAdkka35hmh8GOZd1w7naQ4rk4zgv5Nk5gI1eC6X1VwUjpdt5
 i9Qg==
X-Gm-Message-State: AO0yUKUVpJSBB4sZfQv5N8vr+gK5bI689IPqvyoHEObJYZIy7KP9v1FC
 eOaR+7RlocoNjjO3a1N8/lUZkcqG78szuz2tACmzYM2vnlIKGbfWp/+H8ZcSa67YiwBrAdrMKIP
 SJuj1nekJc8ex20A=
X-Received: by 2002:ac8:4e8d:0:b0:3b8:5f47:aac2 with SMTP id
 13-20020ac84e8d000000b003b85f47aac2mr9255127qtp.1.1675800321352; 
 Tue, 07 Feb 2023 12:05:21 -0800 (PST)
X-Google-Smtp-Source: AK7set9hC0kdbt6OmYUwSwflZrbpWDx217I+CAoevt3kv84sOHcUZq6DK4v9hEMi4snV3wk4kcdzBA==
X-Received: by 2002:ac8:4e8d:0:b0:3b8:5f47:aac2 with SMTP id
 13-20020ac84e8d000000b003b85f47aac2mr9255088qtp.1.1675800320998; 
 Tue, 07 Feb 2023 12:05:20 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 y23-20020ac87057000000b003b86b5a07b3sm1731672qtm.90.2023.02.07.12.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 12:05:20 -0800 (PST)
Date: Tue, 7 Feb 2023 15:05:19 -0500
From: Peter Xu <peterx@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH V2] migration: simplify blockers
Message-ID: <Y+Ku/zQOoFogmx0j@x1n>
References: <1675796593-235541-1-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1675796593-235541-1-git-send-email-steven.sistare@oracle.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Tue, Feb 07, 2023 at 11:03:13AM -0800, Steve Sistare wrote:
> Modify migrate_add_blocker and migrate_del_blocker to take an Error **
> reason.  This allows migration to own the Error object, so that if
> an error occurs, migration code can free the Error and clear the client
> handle, simplifying client code.  This is a pre-requisite for a future
> patch that will allow one Error blocker to be registered for multiple
> migration modes.
> 
> No functional change.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>

Acked-by: Peter Xu <peterx@redhat.com>

One trivial comment below.

[...]

> diff --git a/include/migration/blocker.h b/include/migration/blocker.h
> index 9cebe2b..7c8d326 100644
> --- a/include/migration/blocker.h
> +++ b/include/migration/blocker.h
> @@ -17,19 +17,22 @@
>  /**
>   * @migrate_add_blocker - prevent migration from proceeding
>   *
> - * @reason - an error to be returned whenever migration is attempted
> + * @reasonp - address of an error to be returned whenever migration is attempted
>   *
>   * @errp - [out] The reason (if any) we cannot block migration right now.
>   *
>   * @returns - 0 on success, -EBUSY/-EACCES on failure, with errp set.
> + *
> + * *@reasonp is freed and set to NULL if failure is returned.
> + * On success, the caller no longer owns *@reasonp and must not free it.

This statement reads weird.  IMHO the caller still owns @reasonp, but if it
succeeded it should only free it with a migrate_del_blocker() later.

>   */
> -int migrate_add_blocker(Error *reason, Error **errp);
> +int migrate_add_blocker(Error **reasonp, Error **errp);
>  
>  /**
>   * @migrate_add_blocker_internal - prevent migration from proceeding without
>   *                                 only-migrate implications
>   *
> - * @reason - an error to be returned whenever migration is attempted
> + * @reasonp - address of an error to be returned whenever migration is attempted
>   *
>   * @errp - [out] The reason (if any) we cannot block migration right now.
>   *
> @@ -38,14 +41,19 @@ int migrate_add_blocker(Error *reason, Error **errp);
>   * Some of the migration blockers can be temporary (e.g., for a few seconds),
>   * so it shouldn't need to conflict with "-only-migratable".  For those cases,
>   * we can call this function rather than @migrate_add_blocker().
> + *
> + * *@reasonp is freed and set to NULL if failure is returned.
> + * On success, the caller no longer owns *@reasonp and must not free it.

Same here?

>   */

-- 
Peter Xu


