Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B00B6BDB2F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 22:57:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcvaW-0005nJ-Fj; Thu, 16 Mar 2023 17:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pcvaU-0005mk-0E
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 17:56:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pcvaS-0001mS-90
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 17:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679003798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y71UOO466FS9z8TJoFn6jjRVh+yxU0YlT7G5b72Ngf8=;
 b=Al+/rIynVfTlcE1V1MLt4a+e0U+DTrjbV80yCyzNcaNm9M9zPoblDRVNpO8c1PYV4KBR0W
 TrHgQCnNwM4Y7wBLfyjprbxvO/JmT0Vu5G9+CJbZuioHrrEMccUrXDv3GdLR2ZYcec0vNk
 GCfMpg0J9mwTlYB5eaDAfevsUdrSVZc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-48_H9l1SOga8kklVn2h8CA-1; Thu, 16 Mar 2023 17:56:37 -0400
X-MC-Unique: 48_H9l1SOga8kklVn2h8CA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01C461C05154;
 Thu, 16 Mar 2023 21:56:37 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E69A2166B26;
 Thu, 16 Mar 2023 21:56:36 +0000 (UTC)
Date: Thu, 16 Mar 2023 16:56:34 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, jsnow@redhat.com
Subject: Re: [PATCH 01/14] qapi: Fix error message format regression
Message-ID: <20230316215634.3vanuhqjgbhp6yvo@redhat.com>
References: <20230316071325.492471-1-armbru@redhat.com>
 <20230316071325.492471-2-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316071325.492471-2-armbru@redhat.com>
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

On Thu, Mar 16, 2023 at 08:13:12AM +0100, Markus Armbruster wrote:
> Commit 52a474180ae3 changed reporting of errors connected to a source
> location without mentioning it in the commit message.  For instance,
> 
>     $ python scripts/qapi-gen.py tests/qapi-schema/unknown-escape.json
>     tests/qapi-schema/unknown-escape.json:3:21: unknown escape \x
> 
> became
> 
>     scripts/qapi-gen.py: tests/qapi-schema/unknown-escape.json:3:21: unknown escape \x
> 
> This is not how compilers report such errors, and Emacs doesn't
> recognize the format.  Revert this change.
> 
> Fixes: 52a474180ae3 (qapi-gen: Separate arg-parsing from generation)
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/qapi/main.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


