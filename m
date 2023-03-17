Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC64F6BDDF9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 02:10:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcybZ-0004QD-C6; Thu, 16 Mar 2023 21:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pcybV-0004Pr-Jw
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 21:09:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pcybT-0000Qk-NW
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 21:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679015394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EsVkT6b4KbXwZUE55mC9WUuTRETqm+nCF8j6k+gidw8=;
 b=ZCtdJfbvvR6BAYrC9RYcG3IXGq8eY5Ken6PzNHGFlWQwtng5EPNJilYwt4BLJWhJBZcfbb
 FDZ9nf3aBs4kAJkfkS9ABi7b0cmq/Hr+xWtbzT9jRzJyIWRbsTsPHu9R6EuZu0hwmRZVvp
 4yAL8ALkpxYW3Z68o4kNwIwzR8EawQU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-IZzRzyXWP_OX6gXKedYCUw-1; Thu, 16 Mar 2023 21:09:53 -0400
X-MC-Unique: IZzRzyXWP_OX6gXKedYCUw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6653896DC81;
 Fri, 17 Mar 2023 01:09:53 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75087492B00;
 Fri, 17 Mar 2023 01:09:52 +0000 (UTC)
Date: Thu, 16 Mar 2023 20:09:50 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, jsnow@redhat.com
Subject: Re: [PATCH 11/14] tests/qapi-schema: Clean up positive test for
 conditionals
Message-ID: <20230317010950.6oxwhloomaup4m2l@redhat.com>
References: <20230316071325.492471-1-armbru@redhat.com>
 <20230316071325.492471-12-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316071325.492471-12-armbru@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

On Thu, Mar 16, 2023 at 08:13:22AM +0100, Markus Armbruster wrote:
> Union TestIfUnion is conditional on macros TEST_IF_UNION and
> TEST_IF_STRUCT.  It uses TestIfEnum, which is conditional on macro
> TEST_IF_ENUM.  If TEST_IF_ENUM and TEST_IF_STRUCT are defined, but
> TEST_IF_ENUM isn't, the generated code won't compile.

s/ENUM/UNION/ in one of these two uses in this sentence.

> 
> Command test-if-cmd is conditional an macros TEST_IF_CMD and
> TEST_IF_STRUCT, and uses TestIfEnum.  Similar issue.
> 
> Event TEST_IF_EVENT is conditional an macros TEST_IF_EVT and
> TEST_IF_STRUCT, and uses TestIfEnum.  Similar issue.
> 
> Replace the uses of TestIfEnum in the latter two by str.
> 
> TestIfUnion is now TestIfEnum's only user.  Change TestIfEnum's
> condition to TEST_IF_UNION.

Fair enough, once the commit message doesn't confuse me in the first
paragraph ;)

> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  tests/qapi-schema/qapi-schema-test.json | 6 +++---
>  tests/qapi-schema/qapi-schema-test.out  | 8 +++-----
>  2 files changed, 6 insertions(+), 8 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


