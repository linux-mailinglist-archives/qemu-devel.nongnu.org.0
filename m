Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAF1364765
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:47:48 +0200 (CEST)
Received: from localhost ([::1]:58358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYW7n-0005zq-6e
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lYW6T-000597-7c
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:46:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lYW6R-0008Qi-AX
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618847182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9VvFBlo7UCzKhz3lZ/kTFqsD7apSd6ENrtCewYS+1dI=;
 b=JvBTDyzkHWQdfOz2hx3l2d1xAYZSEnaCSg6gVk0U0gyXAiF/OuDReM924luUwy7BPrVbT7
 ufTjzAZ+60+QTgy00tC6mCj7SpHLdPMzabBTr3VW1+y5cxJzw66kIdToJyFhTM8ECcy4Fk
 qkZFv+SJWCzpgGCu6XC2aF3+qVkOeq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-zrjtMFREMrKWocqC4ouUdg-1; Mon, 19 Apr 2021 11:46:21 -0400
X-MC-Unique: zrjtMFREMrKWocqC4ouUdg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40D82106BAE7
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 15:46:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13B5A19635;
 Mon, 19 Apr 2021 15:46:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A212B113525D; Mon, 19 Apr 2021 17:46:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
References: <20210415154402.28424-1-vkuznets@redhat.com>
 <87sg3p1cf5.fsf@dusky.pond.sub.org>
Date: Mon, 19 Apr 2021 17:46:18 +0200
In-Reply-To: <87sg3p1cf5.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Sat, 17 Apr 2021 11:35:26 +0200")
Message-ID: <878s5euvjp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

[...]

> Apropos blocked-reasons.  migration.json has:
>
>     # @blocked: True if outgoing migration is blocked (since 6.0)
>     #
>     # @blocked-reasons: A list of reasons an outgoing migration is blocked (since 6.0)
>     [...]
>               'blocked': 'bool',
>               '*blocked-reasons': ['str'],
>
> Can "blocked-reasons" be absent or empty when "blocked" is true?

No.

From fill_source_migration_info():

        info->blocked = migration_is_blocked(NULL);
        info->has_blocked_reasons = info->blocked;
        info->blocked_reasons = NULL;
        if (info->blocked) {
            GSList *cur_blocker = migration_blockers;

            /*
             * There are two types of reasons a migration might be blocked;
             * a) devices marked in VMState as non-migratable, and
             * b) Explicit migration blockers
             * We need to add both of them here.
             */
            qemu_savevm_non_migratable_list(&info->blocked_reasons);

            while (cur_blocker) {
                QAPI_LIST_PREPEND(info->blocked_reasons,
                                  g_strdup(error_get_pretty(cur_blocker->data)));
                cur_blocker = g_slist_next(cur_blocker);
            }
        }

where

    bool migration_is_blocked(Error **errp)
    {
        if (qemu_savevm_state_blocked(errp)) {
            return true;
        }

        if (migration_blockers) {
            error_propagate(errp, error_copy(migration_blockers->data));
            return true;
        }

        return false;
    }

and

    bool qemu_savevm_state_blocked(Error **errp)
    {
        SaveStateEntry *se;

        QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
            if (se->vmsd && se->vmsd->unmigratable) {
                error_setg(errp, "State blocked by non-migratable device '%s'",
                           se->idstr);
                return true;
            }
        }
        return false;
    }

    void qemu_savevm_non_migratable_list(strList **reasons)
    {
        SaveStateEntry *se;

        QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
            if (se->vmsd && se->vmsd->unmigratable) {
                QAPI_LIST_PREPEND(*reasons,
                                  g_strdup_printf("non-migratable device: %s",
                                                  se->idstr));
            }
        }
    }

info->blocked is "non-migratable devices exist, or migration blockers
exist".

info->blocked_reasons has one entry per non-migratable device, and one
entry per migration blocker.

> If not, then "blocked" is redundant, and should be dropped before we
> release 6.0.

It is, and it should.

> Else, the documentation should spell it out.  No need to rush that.
>
> The patch was not cc'ed to me.  I might have caught it earlier...

"The patch" is commit 3af8554bd0 "migration: Add blocker information"

>
> [...]


