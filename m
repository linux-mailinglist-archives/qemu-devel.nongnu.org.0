Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E466BDDFE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 02:13:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcyec-0005JK-D4; Thu, 16 Mar 2023 21:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pcyea-0005J4-3H
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 21:13:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pcyeY-0002J9-2X
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 21:13:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679015585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kTpkRA8Ke172+NXbm82qSp3oYEZBJeXvRg1wZYe/OP8=;
 b=FVk7yRkpgO8WyDLS95xlxg+ibQaeDlatGfxX4lModI8YX2kI5S3RSWvJOSja4H5wBKhLhJ
 25CcnNRwoJ+96udadT1IXt15hLAdGZF9Z6TwQKgqCsMyKesXhee3JSRl0gxCyG7xTmpCyk
 VEQZV2HQILSopU2EOgRK8Jp6H/3JCDQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-mkTE4WZUNkq_cg-UVW_b9A-1; Thu, 16 Mar 2023 21:13:03 -0400
X-MC-Unique: mkTE4WZUNkq_cg-UVW_b9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FDF985A5A3;
 Fri, 17 Mar 2023 01:13:03 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD905202701E;
 Fri, 17 Mar 2023 01:13:01 +0000 (UTC)
Date: Thu, 16 Mar 2023 20:13:00 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, jsnow@redhat.com
Subject: Re: [PATCH 13/14] qapi: Fix code generated for optional conditional
 struct member
Message-ID: <20230317011300.s77azyajtrnt4wq5@redhat.com>
References: <20230316071325.492471-1-armbru@redhat.com>
 <20230316071325.492471-14-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230316071325.492471-14-armbru@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Thu, Mar 16, 2023 at 08:13:24AM +0100, Markus Armbruster wrote:
> The generated member visit neglects to emit #if around a conditional
> struct member's has_ variable.  For instance,
> tests/qapi-schema/qapi-schema-test.json generates
> 
>     #if defined(TEST_IF_STRUCT)
>     bool visit_type_TestIfStruct_members(Visitor *v, TestIfStruct *obj, Error **errp)
>     {
> --->	bool has_baz = !!obj->baz;
> 
...
> 
> Won't compile when TEST_IF_STRUCT is defined and TEST_IF_STRUCT_MEMBER
> isn't.
> 
> Fix that the obvious way:
> 
>     #if defined(TEST_IF_STRUCT_MEMBER)
> 	bool has_baz = !!obj->baz;
>     #endif /* defined(TEST_IF_STRUCT_MEMBER) */
> 
> Fixes: 44ea9d9be33c (qapi: Start to elide redundant has_FOO in generated C)
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/qapi/visit.py | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


