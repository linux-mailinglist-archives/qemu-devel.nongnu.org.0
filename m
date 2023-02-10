Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66047691ADA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 10:08:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQPNF-0007mF-Eu; Fri, 10 Feb 2023 04:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQPNC-0007m2-7G
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 04:07:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQPN7-00047G-AR
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 04:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676020028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bOd/9dQpjU9I0RDwvChgOJHBdGSWb79TqewbtKNFvNU=;
 b=D1cr847qCIEFkrF3NPTh1CeQ/pxjEdKtWR8sFHER7t+kAJUzo7n/8KZsT4mnqX+lChu3uT
 VpwW/I/WOTAV1iVr6LIOdyDCgfefUZNCptsAXybFHMufUg7PrHNMzbP8OLdoTglHhvhiwU
 FNeeaDU106e8jXOFA4mRlvqM1SleVLs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-hiVPpXSkNiCfxNijxK_DXw-1; Fri, 10 Feb 2023 04:07:03 -0500
X-MC-Unique: hiVPpXSkNiCfxNijxK_DXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1548D803D50;
 Fri, 10 Feb 2023 09:07:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E714F400DFAC;
 Fri, 10 Feb 2023 09:07:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D017221E6A1F; Fri, 10 Feb 2023 10:07:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org,  prerna.saxena@nutanix.com,  quintela@redhat.com,
 dgilbert@redhat.com,  pbonzini@redhat.com,  berrange@redhat.com,
 eblake@redhat.com,  manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v3 2/6] migration: Updated QAPI format for 'migrate'
 qemu monitor command
References: <20230209102754.81578-1-het.gala@nutanix.com>
 <20230209102754.81578-3-het.gala@nutanix.com>
Date: Fri, 10 Feb 2023 10:07:01 +0100
In-Reply-To: <20230209102754.81578-3-het.gala@nutanix.com> (Het Gala's message
 of "Thu, 9 Feb 2023 10:27:50 +0000")
Message-ID: <87ttztvqh6.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Just a quick one on naming before I forget:

Het Gala <het.gala@nutanix.com> writes:

> Existing 'migrate' QAPI design enforces transport mechanism, ip address
> of destination interface and corresponding port number in the form
> of a unified string 'uri' parameter for initiating a migration stream.
> This scheme has a significant flaw in it - double encoding of existing
> URIs to extract migration info.
>
> The current patch maps QAPI uri design onto well defined MigrateChannel
> struct. This modified QAPI helps in preventing multi-level uri
> encodings ('uri' parameter is kept for backward compatibility).
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  qapi/migration.json | 129 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 127 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/migration.json b/qapi/migration.json
> index c84fa10e86..261a6770e7 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1449,12 +1449,106 @@
>  ##
>  { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
>  
> +##
> +# @MigrateTransport:
> +#
> +# The supported communication transport mechanisms for migration
> +#
> +# @socket: Supported communication type between two devices for migration.
> +#          Socket is able to cover all of 'tcp', 'unix', 'vsock' and
> +#          'fd' already
> +#
> +# @exec: Supported communication type to redirect migration stream into file.
> +#
> +# @rdma: Supported communication type to redirect rdma type migration stream.
> +#
> +# Since 8.0
> +##
> +{ 'enum': 'MigrateTransport',
> +  'data': ['socket', 'exec', 'rdma'] }
> +
> +##
> +# @MigrateSocketAddr:
> +#
> +# To support different type of socket.
> +#
> +# Since 8.0
> +##
> +{ 'struct': 'MigrateSocketAddr',

We tend to avoid abbreviations in QAPI schema names.  For instance, it's
SocketAddress, not SocketAddr.  Please use Address, not Addr, for
consistency.

> +  'data': {'data': 'SocketAddress' } }
> +

[...]


