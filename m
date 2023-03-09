Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C376B28FE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 16:42:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paINj-0004R7-Kb; Thu, 09 Mar 2023 10:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1paINe-0004Qk-0i
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 10:40:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1paINc-0001aa-28
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 10:40:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678376429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bzIqygmxwlDi49ce9QxeipFTRy51JDR3rOBfoWZtzsk=;
 b=CquU5gXApX6Xp5KlJ4cvl8l3tMP51mQyq9vptH2YiYoxXaP3jGlQLFOD97h+huiEYcGXIF
 pDwtfyq9NNsHvNg+d+0Z3zhX3slRLtADY76WrybewrhZtNLGxp5PgQaLbUJFETHMhjPUS5
 JICZGqWzxyA6OucEYrYPn+X3I4LRmJU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-V6zPavKANn2jbmjTO8NqwA-1; Thu, 09 Mar 2023 10:40:28 -0500
X-MC-Unique: V6zPavKANn2jbmjTO8NqwA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10B64101A52E;
 Thu,  9 Mar 2023 15:40:28 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A97CA40CF8ED;
 Thu,  9 Mar 2023 15:40:27 +0000 (UTC)
Date: Thu, 9 Mar 2023 09:40:25 -0600
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH 4/9] nbd: mark more coroutine_fns, do not use co_wrappers
Message-ID: <20230309154025.gadhwqel253khpg5@redhat.com>
References: <20230309084456.304669-1-pbonzini@redhat.com>
 <20230309084456.304669-5-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309084456.304669-5-pbonzini@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

On Thu, Mar 09, 2023 at 09:44:51AM +0100, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  nbd/server.c | 48 ++++++++++++++++++++++++------------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/nbd/server.c b/nbd/server.c
> index a4750e41880a..6f5fcade2a54 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -1409,8 +1409,8 @@ nbd_read_eof(NBDClient *client, void *buffer, size_t size, Error **errp)
>      return 1;
>  }
>  
> -static int nbd_receive_request(NBDClient *client, NBDRequest *request,
> -                               Error **errp)
> +static int coroutine_fn nbd_receive_request(NBDClient *client, NBDRequest *request,
> +                                            Error **errp)
>  {

Should we rename this nbd_co_receive_request() while at it?

...
> @@ -2198,9 +2198,9 @@ static int coroutine_fn blockalloc_to_extents(BlockBackend *blk,
>   * @ea is converted to BE by the function
>   * @last controls whether NBD_REPLY_FLAG_DONE is sent.
>   */
> -static int nbd_co_send_extents(NBDClient *client, uint64_t handle,
> -                               NBDExtentArray *ea,
> -                               bool last, uint32_t context_id, Error **errp)
> +static int coroutine_fn nbd_co_send_extents(NBDClient *client, uint64_t handle,
> +                                            NBDExtentArray *ea,
> +                               bool              last, uint32_t context_id, Error **errp)

Whitespace damage.

...
> @@ -2297,8 +2297,8 @@ static int nbd_co_send_bitmap(NBDClient *client, uint64_t handle,
>   * to the client (although the caller may still need to disconnect after
>   * reporting the error).
>   */
> -static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
> -                                  Error **errp)
> +static int coroutine_fn nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
> +                                               Error **errp)
>  {
>      NBDClient *client = req->client;
>      int valid_flags;
> @@ -2446,7 +2446,7 @@ static coroutine_fn int nbd_do_cmd_read(NBDClient *client, NBDRequest *request,

Most uses of coroutine_fn in this patch occur after the return type,
but in this and later hunks, the function has it the other way around.
Should we touch that up in this patch?  Likewise, should we add _co_
in the name of these pre-existing coroutine_fn functions
nbd_do_cmd_read and nbd_handle_request?

But I'm liking the efforts to use our annotations more consistently,
particularly if it is a result of you making progress on having the
compiler point out inconsistencies.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


