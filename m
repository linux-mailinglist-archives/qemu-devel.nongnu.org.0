Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6F82B5C11
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 10:47:03 +0100 (CET)
Received: from localhost ([::1]:47340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexZm-0003Ax-4O
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 04:47:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kexYq-0002Be-0H
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:46:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kexYo-0007gJ-6H
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:46:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605606361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wcC/lt9D+Fma/yRYjo3bBHqX82XME87MTHDWdHhjGTM=;
 b=TJIImgI+N7Ja1BmHUuyAPhGdAjI0gY6YPAzW+PrW02/Jv42iqRZ13UyqD9ZwyoqswQl2Uo
 OESpDGQt7cGkU2g3W2uK/KpeeEgU5Eb9nUTuUXzkI8KMWylWWhlLEJPQifIRbzJmmfaxNY
 KZkyjP+OktKVX48L3CKMnYWUkw8l8eQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-aNkwVXiHNhGpcg0r1HHPUw-1; Tue, 17 Nov 2020 04:45:59 -0500
X-MC-Unique: aNkwVXiHNhGpcg0r1HHPUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 428CC8015C6
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:45:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 135695B4C3;
 Tue, 17 Nov 2020 09:45:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7E67711358BA; Tue, 17 Nov 2020 10:45:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 3/7] migration: Refactor migrate_cap_add
References: <20201113011340.463563-1-eblake@redhat.com>
 <20201113011340.463563-4-eblake@redhat.com>
Date: Tue, 17 Nov 2020 10:45:56 +0100
In-Reply-To: <20201113011340.463563-4-eblake@redhat.com> (Eric Blake's message
 of "Thu, 12 Nov 2020 19:13:36 -0600")
Message-ID: <87lff09uzv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> Instead of taking a list parameter and returning a new head at a
> distance, just return the new item for the caller to insert into a
> list via QAPI_LIST_PREPEND.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  migration/migration.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 3263aa55a9da..e8c414a7b8f0 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1667,27 +1667,23 @@ void migrate_set_state(int *state, int old_state, int new_state)
>      }
>  }
>
> -static MigrationCapabilityStatusList *migrate_cap_add(
> -    MigrationCapabilityStatusList *list,
> -    MigrationCapability index,
> -    bool state)
> +static MigrationCapabilityStatus *migrate_cap_add(MigrationCapability index,
> +                                                  bool state)
>  {
> -    MigrationCapabilityStatusList *cap;
> +    MigrationCapabilityStatus *cap;
>
> -    cap = g_new0(MigrationCapabilityStatusList, 1);
> -    cap->value = g_new0(MigrationCapabilityStatus, 1);
> -    cap->value->capability = index;
> -    cap->value->state = state;
> -    cap->next = list;
> +    cap = g_new0(MigrationCapabilityStatus, 1);
> +    cap->capability = index;
> +    cap->state = state;
>
>      return cap;
>  }
>
>  void migrate_set_block_enabled(bool value, Error **errp)
>  {
> -    MigrationCapabilityStatusList *cap;
> +    MigrationCapabilityStatusList *cap = NULL;
>
> -    cap = migrate_cap_add(NULL, MIGRATION_CAPABILITY_BLOCK, value);
> +    QAPI_LIST_PREPEND(cap, migrate_cap_add(MIGRATION_CAPABILITY_BLOCK, value));

Line is too long for my taste.  Please consider

       MigrationCapabilityStatusList *caps = NULL;
       MigrationCapabilityStatus *cap;

       cap = migrate_cap_add(MIGRATION_CAPABILITY_BLOCK, value);
       QAPI_LIST_PREPEND(caps, cap);
       qmp_migrate_set_capabilities(caps, errp);
       qapi_free_MigrationCapabilityStatusList(caps);

>      qmp_migrate_set_capabilities(cap, errp);
>      qapi_free_MigrationCapabilityStatusList(cap);
>  }
> @@ -3874,7 +3870,7 @@ static bool migration_object_check(MigrationState *ms, Error **errp)
>
>      for (i = 0; i < MIGRATION_CAPABILITY__MAX; i++) {
>          if (ms->enabled_capabilities[i]) {
> -            head = migrate_cap_add(head, i, true);
> +            QAPI_LIST_PREPEND(head, migrate_cap_add(i, true));
>          }
>      }

       ret = migrate_caps_check(cap_list, head, errp);

       /* It works with head == NULL */

Unrelated: this comment is not worth its keep.

       qapi_free_MigrationCapabilityStatusList(head);

       return ret;

Reviewed-by: Markus Armbruster <armbru@redhat.com>


