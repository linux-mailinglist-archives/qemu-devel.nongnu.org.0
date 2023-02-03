Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E108068A33A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 20:48:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO22R-0000Ko-SL; Fri, 03 Feb 2023 14:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pO22C-0000Hj-CZ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 14:47:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pO228-0001Dn-7b
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 14:47:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675453659;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=zqOYHWzpcQUwnlycjlPXqzTwUhMyTUgAwuCViYG7w7E=;
 b=X6aXq6Ux7OczugVQX9bv8BJD33qcB+WtQWPYF/e/PQ5kYtx+f/+uyJIA8oBqDpws8libqd
 IRG47mht5sJcENCnn/UlXqyl2ZTGcEps3rp3vT1BXxUp5MOl4BhUW2c0jQHxtKnOdqQeDU
 BIH93XnUB8F7ssthiHDqaJFFVQgCKPY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-416-s_BUbYijN8OGECKpKaSqSg-1; Fri, 03 Feb 2023 14:47:37 -0500
X-MC-Unique: s_BUbYijN8OGECKpKaSqSg-1
Received: by mail-wr1-f69.google.com with SMTP id
 m13-20020a5d4a0d000000b002bfe777a97aso890109wrq.22
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 11:47:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zqOYHWzpcQUwnlycjlPXqzTwUhMyTUgAwuCViYG7w7E=;
 b=yFHz/Mawoi19SHvGahp17t8s6k1nHqPxXYaSmUaZBfwdpgltmLvpwuY4w1vdu3GtWF
 BmFfLFY8KV/oc6PIVK/s3pKk+Bd7/4z6H/dzC3zSKxwQDX/qutpqDXmrETafMZCc1f1k
 6ZVMiI0HLsSTeS6FwE1WntZZL+9T0mfeRB7iNNuy5agy1aekh9J+udFL3P0lh+x8ySyn
 IlRjPIFAM40OqWrVRIpLqkyhJp/5nDWrt70WqWpwn7n3lET3XlGQDiS9owwNfiylpr59
 OmRArRQpYj/WB3hvmFa/qd3or4HqzJKhAiT7zsz1ErvFBun5PHMwI5LkCc20QB/KFkJ9
 qHng==
X-Gm-Message-State: AO0yUKUqGFIvOEekxsZp5EWPIeV6eo+iDV+afRZCWz+1O3sRlSYNFbvJ
 hUee/3P6Zoqp6buvOWR3RxMGyeEegO0PWCZNomo4Zc5ufcsTNzSprvJxQ7tyQpotIRKZ/kh0yDn
 0EXC9+/PmViaT+yk=
X-Received: by 2002:a05:600c:44c8:b0:3dc:45a7:2b8a with SMTP id
 f8-20020a05600c44c800b003dc45a72b8amr10586451wmo.10.1675453656647; 
 Fri, 03 Feb 2023 11:47:36 -0800 (PST)
X-Google-Smtp-Source: AK7set+XXXwWGj5Bp37ulPmGgHCm97CSO8xhLERgQAHi4cYWc/pd+EdSvHzIHoIQUKTHeIJLM103UA==
X-Received: by 2002:a05:600c:44c8:b0:3dc:45a7:2b8a with SMTP id
 f8-20020a05600c44c800b003dc45a72b8amr10586437wmo.10.1675453656458; 
 Fri, 03 Feb 2023 11:47:36 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 z17-20020a7bc7d1000000b003dc3f07c876sm8888421wmk.46.2023.02.03.11.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 11:47:35 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Jiang Jiacheng <jiangjiacheng@huawei.com>
Cc: <qemu-devel@nongnu.org>,  <berrange@redhat.com>,  <dgilbert@redhat.com>,
 <yubihong@huawei.com>,  <xiexiangyou@huawei.com>,
 <zhengchuan@huawei.com>,  <linyilu@huawei.com>
Subject: Re: [PATCH V2 1/2] migration: Introduce interface
 query-migrationthreads
In-Reply-To: <20230203073519.2969147-2-jiangjiacheng@huawei.com> (Jiang
 Jiacheng's message of "Fri, 3 Feb 2023 15:35:18 +0800")
References: <20230203073519.2969147-1-jiangjiacheng@huawei.com>
 <20230203073519.2969147-2-jiangjiacheng@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 03 Feb 2023 20:47:34 +0100
Message-ID: <87k00yfs4p.fsf@secure.mitica>
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Jiang Jiacheng <jiangjiacheng@huawei.com> wrote:
> Introduce interface query-migrationthreads. The interface is used
> to query information about migration threads and returns with
> migration thread's name and its id.
> Introduce threadinfo.c to manage threads with migration.
>
> Signed-off-by: Jiang Jiacheng <jiangjiacheng@huawei.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I will fix this by hand.

> +MigrationThread* MigrationThreadAdd(const char *name, int thread_id)
* on the left instead of the right.

> +{
> +    MigrationThread *thread = NULL;
> +
> +    thread = g_new0(MigrationThread, 1);

This is too much.

      MigrationThread *thread = g_new0(MigrationThread, 1);

If you initialize a variable, don't do a NULL and just in the next line
the right value.


> +    thread->name = (char*)name;

Why not doing it properly and call it just const char * on the header?

> +    thread->thread_id = thread_id;
> +
> +    QLIST_INSERT_HEAD(&migration_threads, thread, node);
> +
> +    return thread;
> +}
> +
> +void MigrationThreadDel(MigrationThread* thread)
> +{
> +    if (thread) {
> +        QLIST_REMOVE(thread, node);

Spaces for indentation

> +	    g_free(thread);

Tabs + spaces.

> +    }
> +}
> +
> +MigrationThreadInfoList* qmp_query_migrationthreads(Error **errp)

* on the worong side.

> +{
> +    MigrationThreadInfoList *head = NULL;
> +    MigrationThreadInfoList **tail = &head;
> +    MigrationThread *thread = NULL;
> +    MigrationThreadInfo *info = NULL;
> +
> +    QLIST_FOREACH(thread, &migration_threads, node) {
> +        info = g_new0(MigrationThreadInfo, 1);

MigrationThreadInfo *info = g_new0(MigrationThreadInfo, 1);

> +        info->name = g_strdup(thread->name);
> +        info->thread_id = thread->thread_id;
> +
> +        QAPI_LIST_APPEND(tail, info);
> +    }
> +
> +    return head;
> +}
> diff --git a/migration/threadinfo.h b/migration/threadinfo.h
> new file mode 100644
> index 0000000000..ebe86a2699
> --- /dev/null
> +++ b/migration/threadinfo.h
> @@ -0,0 +1,28 @@
> +/*
> + *  Migration Threads info
> + *
> + *  Copyright (c) 2022 HUAWEI TECHNOLOGIES CO., LTD.
> + *
> + *  Authors:
> + *  Jiang Jiacheng <jiangjiacheng@huawei.com>
> + *
> + *  This work is licensed under the terms of the GNU GPL, version 2 or later.
> + *  See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/queue.h"
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-migration.h"
> +
> +typedef struct MigrationThread MigrationThread;
> +
> +struct MigrationThread {
> +    char *name; /* the name of migration thread */
> +    int thread_id; /* ID of the underlying host thread */
> +    QLIST_ENTRY(MigrationThread) node;
> +};
> +
> +MigrationThread *MigrationThreadAdd(const char *name, int thread_id);
> +
> +void MigrationThreadDel(MigrationThread* info);
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 88ecf86ac8..c84fa10e86 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1958,6 +1958,35 @@
>  { 'command': 'query-vcpu-dirty-limit',
>    'returns': [ 'DirtyLimitInfo' ] }
>  
> +##
> +# @MigrationThreadInfo:
> +#
> +# Information about migrationthreads
> +#
> +# @name: the name of migration thread
> +#
> +# @thread-id: ID of the underlying host thread
> +#
> +# Since: 7.2

            8.0

Same on the next one.

> +##
> +{ 'struct': 'MigrationThreadInfo',
> +  'data': {'name': 'str',
> +           'thread-id': 'int'} }
> +
> +##
> +# @query-migrationthreads:
> +#
> +# Returns information of migration threads
> +#
> +# data: migration thread name
> +#
> +# returns: information about migration threads
> +#
> +# Since: 7.2
> +##
> +{ 'command': 'query-migrationthreads',
> +  'returns': ['MigrationThreadInfo'] }
> +
>  ##
>  # @snapshot-save:
>  #

Later, Juan.


