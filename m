Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF2D429799
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 21:34:11 +0200 (CEST)
Received: from localhost ([::1]:47376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma13q-0002Y7-9j
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 15:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ma11u-0001Cf-1M
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 15:32:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ma11o-00073p-JW
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 15:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633980723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DW+ks89py5vowX+VGGK18LGDZCJTV7Yf681SO0XZzZw=;
 b=O8AJD3WUCx4I9J9gYLyW6YdHrKHC90KiFVHoIcvMTBQ/+YqQfO06U1YEwNBrkxy1wIJtx5
 XgV744nJfTaew3G15MfkVICRYvSM3k8KWkXrx9P8hzbEBCHidY3QmO/eaC5Kncxr7gcrAv
 gLrdUvUXX7ayu8EWbPhrj7keOXzjzss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-rfac13yVPNSxig2RCpfvDg-1; Mon, 11 Oct 2021 15:32:00 -0400
X-MC-Unique: rfac13yVPNSxig2RCpfvDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F35DB1006AA2
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 19:31:58 +0000 (UTC)
Received: from redhat.com (ovpn-113-152.phx2.redhat.com [10.3.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5947160BF4;
 Mon, 11 Oct 2021 19:31:58 +0000 (UTC)
Date: Mon, 11 Oct 2021 14:31:56 -0500
From: Eric Blake <eblake@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 3/3] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
Message-ID: <20211011193156.biedorxjetduaf7y@redhat.com>
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-4-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211009075612.230283-4-leobras@redhat.com>
User-Agent: NeoMutt/20210205-852-339c0c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 09, 2021 at 04:56:13AM -0300, Leonardo Bras wrote:
> Implement zerocopy on nocomp_send_write(), by making use of QIOChannel
> zerocopy interface.
> 
> Change multifd_send_sync_main() so it can distinguish the last sync from
> the setup and per-iteration ones, so a flush_zerocopy() can be called
> at the last sync in order to make sure all RAM is sent before finishing
> the migration.
> 
> Also make it return -1 if flush_zerocopy() fails, in order to cancel
> the migration process, and avoid resuming the guest in the target host
> without receiving all current RAM.
> 
> This will work fine on RAM migration because the RAM pages are not usually freed,
> and there is no problem on changing the pages content between async_send() and
> the actual sending of the buffer, because this change will dirty the page and
> cause it to be re-sent on a next iteration anyway.
> 
> Given a lot of locked memory may be needed in order to use multid migration
> with zerocopy enabled, make it optional by creating a new parameter
> multifd-zerocopy on qapi, so low-privileged users can still perform multifd
> migrations.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  qapi/migration.json   | 18 ++++++++++++++++++
>  migration/migration.h |  1 +
>  migration/multifd.h   |  2 +-
>  migration/migration.c | 20 ++++++++++++++++++++
>  migration/multifd.c   | 33 ++++++++++++++++++++++++++++-----
>  migration/ram.c       | 20 +++++++++++++-------
>  monitor/hmp-cmds.c    |  4 ++++
>  7 files changed, 85 insertions(+), 13 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 88f07baedd..c4890cbb54 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -724,6 +724,11 @@
>  #                      will consume more CPU.
>  #                      Defaults to 1. (Since 5.0)
>  #
> +# @multifd-zerocopy: Controls behavior on sending memory pages on multifd migration.
> +#                    When true, enables a zerocopy mechanism for sending memory
> +#                    pages, if host does support it.

s/does support/supports/ (several instances this patch)

> +#                    Defaults to false. (Since 6.2)
> +#
>  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
>  #                        aliases for the purpose of dirty bitmap migration.  Such
>  #                        aliases may for example be the corresponding names on the
> @@ -758,6 +763,7 @@
>             'xbzrle-cache-size', 'max-postcopy-bandwidth',
>             'max-cpu-throttle', 'multifd-compression',
>             'multifd-zlib-level' ,'multifd-zstd-level',
> +	   'multifd-zerocopy',
>             'block-bitmap-mapping' ] }

Should this feature be guarded with 'if':'CONFIG_LINUX', since that's
the only platform where you even compile the code (even then, it can
still fail if the kernel doesn't support it).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


