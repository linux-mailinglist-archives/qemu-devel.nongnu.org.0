Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FEA43C17E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 06:31:06 +0200 (CEST)
Received: from localhost ([::1]:51538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfaaf-0008O5-Jo
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 00:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfaYl-0007Zn-Ok
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:29:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfaYj-0006kj-0j
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635308942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N+Bfdv68E35Y6/zXKW/iN2dQOvtqQq79Gt4ZY1BapFs=;
 b=hqGFQcv5yzF+BBYGqtKK7/7L/dbs5+XSm6Nm0MoGuFtNUbmzvWps9X1FeIiH9jn2lPMlT/
 TOyWbjfR9Q/QZn7k1xYCA4hNFWj4BFR/qgaP06vXP3N5uBdKXaTtMUaZ0/H2oi/l6bcmv0
 pphv1wDK1+rAOY0kun3fxyToy4yuBZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527--68_tU3aPZ2TEVdLAtr0Pg-1; Wed, 27 Oct 2021 00:29:00 -0400
X-MC-Unique: -68_tU3aPZ2TEVdLAtr0Pg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A2A110060F2;
 Wed, 27 Oct 2021 04:28:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7723062A41;
 Wed, 27 Oct 2021 04:28:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E712B11380A7; Wed, 27 Oct 2021 06:28:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 1/3] file-posix: add `aio-max-batch` option
References: <20211026162346.253081-1-sgarzare@redhat.com>
 <20211026162346.253081-2-sgarzare@redhat.com>
Date: Wed, 27 Oct 2021 06:28:51 +0200
In-Reply-To: <20211026162346.253081-2-sgarzare@redhat.com> (Stefano
 Garzarella's message of "Tue, 26 Oct 2021 18:23:44 +0200")
Message-ID: <87zgqvccqk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefano Garzarella <sgarzare@redhat.com> writes:

> Commit d7ddd0a161 ("linux-aio: limit the batch size using
> `aio-max-batch` parameter") added a way to limit the batch size
> of Linux AIO backend for the entire AIO context.
>
> The same AIO context can be shared by multiple devices, so
> latency-sensitive devices may want to limit the batch size even
> more to avoid increasing latency.
>
> For this reason we add the `aio-max-batch` option to the file
> backend, which will be used by the next commits to limit the size of
> batches including requests generated by this device.
>
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>
> Notes:
>     v2:
>     - @aio-max-batch documentation rewrite [Stefan, Kevin]
>
>  qapi/block-core.json | 7 +++++++
>  block/file-posix.c   | 9 +++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 6d3217abb6..fef76b0ea2 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2896,6 +2896,12 @@
>  #              for this device (default: none, forward the commands via SG_IO;
>  #              since 2.11)
>  # @aio: AIO backend (default: threads) (since: 2.8)
> +# @aio-max-batch: maximum number of requests to batch together into a single
> +#                 submission in the AIO backend. The smallest value between
> +#                 this and the aio-max-batch value of the IOThread object is
> +#                 chosen.
> +#                 0 means that the AIO backend will handle it automatically.
> +#                 (default: 0, since 6.2)

"(default 0) (since 6.2)" seems to be more common.

>  # @locking: whether to enable file locking. If set to 'auto', only enable
>  #           when Open File Descriptor (OFD) locking API is available
>  #           (default: auto, since 2.10)
> @@ -2924,6 +2930,7 @@
>              '*pr-manager': 'str',
>              '*locking': 'OnOffAuto',
>              '*aio': 'BlockdevAioOptions',
> +            '*aio-max-batch': 'int',
>              '*drop-cache': {'type': 'bool',
>                              'if': 'CONFIG_LINUX'},
>              '*x-check-cache-dropped': 'bool' },


