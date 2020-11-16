Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1613D2B45BF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 15:23:53 +0100 (CET)
Received: from localhost ([::1]:37024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kefQ8-0000M0-6F
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 09:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kefPP-0008MV-M0
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 09:23:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kefPM-0003QJ-HL
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 09:23:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605536582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uHdd2b79Fv+Kt3LgsSSfpBk3wWwYbyWNQ2N1xTKU2jQ=;
 b=PZpmPnejCw7WHOrmX+UGO9snF0hsU9de/qKOn5hC2nc/FpLiXDKVgBAVmU+NgVzjaw6FII
 KQ/CRgC20l+5v/3iMT5qFJlfAgB4oRKPUOJQyDchMn7nLscJSxPg8cVuegGQSM2MhdZLMJ
 MQM972ioD22e372g8RUxTy66RgwqnCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-u_PApTnnN1S-epSwGjH9kQ-1; Mon, 16 Nov 2020 09:23:01 -0500
X-MC-Unique: u_PApTnnN1S-epSwGjH9kQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5301F1084C85
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 14:23:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20AFA5D9D2;
 Mon, 16 Nov 2020 14:23:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 91F9411358BA; Mon, 16 Nov 2020 15:22:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 1/7 for-5.2?] net: Fix memory leak on error
References: <20201113011340.463563-1-eblake@redhat.com>
 <20201113011340.463563-2-eblake@redhat.com>
Date: Mon, 16 Nov 2020 15:22:58 +0100
In-Reply-To: <20201113011340.463563-2-eblake@redhat.com> (Eric Blake's message
 of "Thu, 12 Nov 2020 19:13:34 -0600")
Message-ID: <87pn4didod.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> If qmp_query_rx_filter() encounters an error on a second iteration, it
> leaks the memory from the first.
>
> Fixes: 9083da1d4c
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  net/net.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/net/net.c b/net/net.c
> index 794c652282cb..eb65e110871a 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1213,6 +1213,7 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
       NetClientState *nc;
       RxFilterInfoList *filter_list = NULL, *last_entry = NULL;

       QTAILQ_FOREACH(nc, &net_clients, next) {
           RxFilterInfoList *entry;
           RxFilterInfo *info;

           if (has_name && strcmp(nc->name, name) != 0) {
               continue;
           }

If @has_name and we get here more than once, then multiple @net_clients
have the same name.  How can that be?  We are not supposed to return
multiple replies with the same @name, are we?

           /* only query rx-filter information of NIC */
>          if (nc->info->type != NET_CLIENT_DRIVER_NIC) {
>              if (has_name) {
>                  error_setg(errp, "net client(%s) isn't a NIC", name);
> +                qapi_free_RxFilterInfoList(filter_list);

Unless multiple @net_clients are named @name, @filter_list is null,
isn't it?

>                  return NULL;
>              }
>              continue;
           }

           /* only query information on queue 0 since the info is per nic,
            * not per queue
            */
           if (nc->queue_index != 0)
               continue;

           if (nc->info->query_rx_filter) {
               info = nc->info->query_rx_filter(nc);
               entry = g_malloc0(sizeof(*entry));
               entry->value = info;

               if (!filter_list) {
                   filter_list = entry;

From now on, we must either return or free @filter_list.

               } else {
                   last_entry->next = entry;
               }
               last_entry = entry;
> @@ -1238,6 +1239,7 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
>          } else if (has_name) {
>              error_setg(errp, "net client(%s) doesn't support"
>                         " rx-filter querying", name);
> +            qapi_free_RxFilterInfoList(filter_list);

Unless multiple @net_clients are named @name, @filter_list is null,
isn't it?

>              return NULL;
>          }

           if (has_name) {
               break;
           }
       }

I dislike this loop.

       if (filter_list == NULL && has_name) {
           error_setg(errp, "invalid net client name: %s", name);
       }

       return filter_list;

I should've strangled the optional @name parameter in the crib.


