Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF360564DA4
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 08:22:04 +0200 (CEST)
Received: from localhost ([::1]:43742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8FT4-0002UL-Sy
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 02:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o8FQG-0001mJ-FD
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 02:19:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o8FQC-0001tL-Mp
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 02:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656915539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6PrqfuHhQkOANnGNULXJnWeuyNpLjt6sv2cFVZ06CD8=;
 b=Jw01/wfsJWL/ELb9PCSSJvB/eNCrJlh+c3rEs9cDKmGSS39XB0QGcvuU3AreD2nEJ90UV/
 SKHM5aHRcUjrfcz0SJntY3796Tm8CJGQX3QjBUnnmQdmzhsf7fYhOZ6YdUgKGF/FuKrW3K
 qRb4E3ivHAFQahdrMliyy+kALKImnxU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-WY5zqmxCMjOG9uMU4GiKGQ-1; Mon, 04 Jul 2022 02:18:56 -0400
X-MC-Unique: WY5zqmxCMjOG9uMU4GiKGQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC192185A7BA
 for <qemu-devel@nongnu.org>; Mon,  4 Jul 2022 06:18:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8AA2C15D42;
 Mon,  4 Jul 2022 06:18:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8035921E690D; Mon,  4 Jul 2022 08:18:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Juan Quintela
 <quintela@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,  Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/3] Add zero-copy-copied migration stat
References: <20220701155935.482503-1-leobras@redhat.com>
 <20220701155935.482503-3-leobras@redhat.com>
Date: Mon, 04 Jul 2022 08:18:54 +0200
In-Reply-To: <20220701155935.482503-3-leobras@redhat.com> (Leonardo Bras's
 message of "Fri, 1 Jul 2022 12:59:35 -0300")
Message-ID: <877d4tz9gx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Leonardo Bras <leobras@redhat.com> writes:

> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  qapi/migration.json   | 5 ++++-
>  migration/migration.c | 1 +
>  monitor/hmp-cmds.c    | 4 ++++
>  3 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 7102e474a6..925f009868 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -55,6 +55,9 @@
>  # @postcopy-bytes: The number of bytes sent during the post-copy phase
>  #                  (since 7.0).
>  #
> +# @zero-copy-copied: The number of zero-copy flushes that reported data sent
> +#                    using zero-copy that ended up being copied. (since 7.2)

The description feels awkward.  What's a "zero-copy flush", and why
should the user care?  I figure what users care about is the number of
all-zero pages we had to "copy", i.e. send the bulky way.  Is this what
@zero-copy-copied reports?

> +#
>  # Since: 0.14
>  ##
>  { 'struct': 'MigrationStats',
> @@ -65,7 +68,7 @@
>             'postcopy-requests' : 'int', 'page-size' : 'int',
>             'multifd-bytes' : 'uint64', 'pages-per-second' : 'uint64',
>             'precopy-bytes' : 'uint64', 'downtime-bytes' : 'uint64',
> -           'postcopy-bytes' : 'uint64' } }
> +           'postcopy-bytes' : 'uint64', 'zero-copy-copied' : 'uint64' } }
>  
>  ##
>  # @XBZRLECacheStats:


