Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565C033C167
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:16:17 +0100 (CET)
Received: from localhost ([::1]:39348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLptA-0004UO-AE
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLpqT-0002KX-6n
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:13:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLpqR-0000pS-2A
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:13:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615824806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UkfgkcM4a43Ft39Jw7XbKpRqqc6SYwq6Cm4XmXb0lXs=;
 b=OtSNppL9YkgmyKrPK08C4SZwajAHD88kVQ4Inc5dje/VSc4IuA6dZCVlWb3Ji/dKlJ+O6E
 pDfKOyOcxa1VRUeuiwvc7cFvT8dvs9/2T4EwRB4Km5QV8/ggb/Mw7YC9vjGvahh4ezX190
 MFiGlpOiaGmMmVkPZIajuve7qgh5X/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-zwC2hNGKOAi9gYXxtKxq8Q-1; Mon, 15 Mar 2021 12:13:21 -0400
X-MC-Unique: zwC2hNGKOAi9gYXxtKxq8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32EEA83DD21;
 Mon, 15 Mar 2021 16:13:20 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D57E95D705;
 Mon, 15 Mar 2021 16:13:19 +0000 (UTC)
Subject: Re: [PATCH v6 06/10] qapi: Implement deprecated-output=hide for QMP
 introspection
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210312153210.2810514-1-armbru@redhat.com>
 <20210312153210.2810514-7-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <33280932-c25b-5f1f-86e2-ad6f76aa55e1@redhat.com>
Date: Mon, 15 Mar 2021 11:13:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312153210.2810514-7-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@gmail.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 9:32 AM, Markus Armbruster wrote:
> This policy suppresses deprecated bits in output, and thus permits
> "testing the future".  Implement it for QMP command query-qmp-schema:
> suppress information on deprecated commands, events and object type
> members, i.e. anything that has the special feature flag "deprecated".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  monitor/qmp-cmds-control.c | 71 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/monitor/qmp-cmds-control.c b/monitor/qmp-cmds-control.c
> index 25afd0867f..bcfccc4ac4 100644
> --- a/monitor/qmp-cmds-control.c
> +++ b/monitor/qmp-cmds-control.c
> @@ -158,6 +158,74 @@ EventInfoList *qmp_query_events(Error **errp)
>      return ev_list;
>  }
>  
> +static void *split_off_generic_list(void *list,
> +                                    bool (*splitp)(void *elt),
> +                                    void **part)
> +{
> +    GenericList *keep = NULL, **keep_tailp = &keep;
> +    GenericList *split = NULL, **split_tailp = &split;
> +    GenericList *tail;
> +
> +    for (tail = list; tail; tail = tail->next) {
> +        if (splitp(tail)) {
> +            *split_tailp = tail;
> +            split_tailp = &tail->next;
> +        } else {
> +            *keep_tailp = tail;
> +            keep_tailp = &tail->next;
> +        }
> +    }

At first glance, I wondered if QAPI_LIST_APPEND would be better than
open coding, but with a bit more thought, I agree that this particular
case is best written as presented (you are manipulating two tail
pointers in one iteration, which is different semantics than
QAPI_LIST_APPEND advancing a single tail pointer).

R-b still stands.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


