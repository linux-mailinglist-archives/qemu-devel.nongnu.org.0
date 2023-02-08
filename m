Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19E468F8BE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 21:20:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPqvE-0001Ta-32; Wed, 08 Feb 2023 15:20:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pPqvB-0001TC-9A
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:20:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pPqv8-0001uG-WC
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:20:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675887598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fs1rKLXjSXHaYK1gFbakgnfYEnWIh6q+WFM+AnkdJWs=;
 b=Jrib5wSUhFhOK6n2HePEhemMFJKsv0crskxGcwaAuofbu4nPtUKG4VFCa33uBvTyTSnOyE
 M+cKUkqmu5E7w314RXvd+4jRjPzugXA4cUJR0zIa8TC0RbTrnNtT1XlkTufI6IbzNsg7M7
 aSbjlTRCzf2qNeoul20Jejj7BUVjUv0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-rKafjtPzP02FHJc3ryAHDQ-1; Wed, 08 Feb 2023 15:19:54 -0500
X-MC-Unique: rKafjtPzP02FHJc3ryAHDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 350981871D94;
 Wed,  8 Feb 2023 20:19:54 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 627062166B29;
 Wed,  8 Feb 2023 20:19:53 +0000 (UTC)
Date: Wed, 8 Feb 2023 14:19:51 -0600
From: Eric Blake <eblake@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
 armbru@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v2 5/6] migration: Modified 'migrate-incoming' QAPI and
 HMP side changes on the destination interface.
Message-ID: <20230208201951.3lcbpppp7vt2nqap@redhat.com>
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-6-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208093600.242665-6-het.gala@nutanix.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

On Wed, Feb 08, 2023 at 09:35:59AM +0000, Het Gala wrote:
> 'migrate-incoming' QAPI design have been modified into well-defined
> MigrateChannel struct to prevent multiple encoding of uri strings on
> the destination side.'uri' parameter is kept for backward compatibility.
> 
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  migration/migration-hmp-cmds.c |  8 +++++++-
>  migration/migration.c          |  3 ++-
>  qapi/migration.json            | 22 ++++++++++++++++++++--
>  softmmu/vl.c                   |  2 +-
>  4 files changed, 30 insertions(+), 5 deletions(-)

> +++ b/qapi/migration.json
> @@ -1623,7 +1623,11 @@
>  # with -incoming defer
>  #
>  # @uri: The Uniform Resource Identifier identifying the source or
> -#       address to listen on
> +#       the address to listen on
> +#
> +# @channel: Struct containing migration channel type, along with
> +#           all the details of the destination interface required
> +#           for the address to listen on for migration stream.

Missing a '(since 8.0)' tag.

>  #
>  # Returns: nothing on success
>  #
> @@ -1640,14 +1644,28 @@
>  #
>  # 3. The uri format is the same as for -incoming
>  #
> +# 4. The 'uri' and 'channel' arguments are mutually exclusive but, atleast
> +#    one of the two arguments should be present.

Grammar:

The 'uri' and 'channel' arguments are mutually exclusive; exactly one
of the two should be present.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


