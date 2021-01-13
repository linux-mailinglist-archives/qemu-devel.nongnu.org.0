Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6052F4BDC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 13:59:44 +0100 (CET)
Received: from localhost ([::1]:47582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzfkV-0002XU-L8
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 07:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzfiC-0001Wa-Hf
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 07:57:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzfi5-0007Qi-S1
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 07:57:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610542632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UlSRGqVdbf+9Y7SgHVOkdaiWILTIdEFYCpq3ZaMmMdk=;
 b=c19JNMGQ67/LsB2X7G0EV5KvokC8dLRAXvVIQD9hAPqswETmFwkj2pEutfD2SVfJmWXk0O
 PfVAx98ndZOTmQA0eN6QZeeXSA6JiRyCyx/4HrCObCzNIrkN8lMAAHbtooMl1DI1PzuMvu
 sCZcwQQ8vTnwlxNOHDPKIASTIzvcaXQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-9cfOmQYJMciEri4j-UUtrw-1; Wed, 13 Jan 2021 07:57:11 -0500
X-MC-Unique: 9cfOmQYJMciEri4j-UUtrw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DB22806661
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 12:57:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D36BA5D9DC;
 Wed, 13 Jan 2021 12:57:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 501F111386A7; Wed, 13 Jan 2021 13:57:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 1/7] net: Clarify early exit condition
References: <20201223221102.390740-1-eblake@redhat.com>
 <20201223221102.390740-2-eblake@redhat.com>
Date: Wed, 13 Jan 2021 13:57:08 +0100
In-Reply-To: <20201223221102.390740-2-eblake@redhat.com> (Eric Blake's message
 of "Wed, 23 Dec 2020 16:10:56 -0600")
Message-ID: <87r1mp0zbv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

> On first glance, the loop in qmp_query_rx_filter() has early return
> paths that could leak any allocation of filter_list from a previous
> iteration.  But on closer inspection, it is obvious that all of the
> early exits are guarded by has_name, and that the bulk of the loop
> body can be executed at most once if the user is filtering by name,
> thus, any early exit coincides with an empty list.  Add asserts to
> make this obvious.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  net/net.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/net/net.c b/net/net.c
> index e1035f21d183..e581c8a26868 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1211,6 +1211,7 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
>          if (nc->info->type != NET_CLIENT_DRIVER_NIC) {
>              if (has_name) {
>                  error_setg(errp, "net client(%s) isn't a NIC", name);
> +                assert(!filter_list);
>                  return NULL;
>              }
>              continue;
> @@ -1236,6 +1237,7 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
>          } else if (has_name) {
>              error_setg(errp, "net client(%s) doesn't support"
>                         " rx-filter querying", name);
> +            assert(!filter_list);
>              return NULL;
>          }

Reviewed-by: Markus Armbruster <armbru@redhat.com>


