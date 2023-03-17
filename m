Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA066BDDDA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 01:57:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcyPP-0000Tr-FX; Thu, 16 Mar 2023 20:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pcyPM-0000Td-R9
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 20:57:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pcyPL-0004DB-4O
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 20:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679014642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3E0biV1ybWn1MhN9iSxhZiB37RMm0kgRC92DUnOgXus=;
 b=I/NL17LZSlsafhIeYHnkXegrDCynSYFN29isKl4Kti52eAZTs4eWkRGivEcVFKgo7kDAFU
 IlhY+hfs8O6eILwZ5e4lt+KcvSxoGvrhwKu4QD7WyIvWrITJXnTyshAVYOu3ViIfyp46VI
 i7MFKGeBXGx61rh8u6NyLhkQ4fbhyXI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-JTmXDPI7NbCzIRaebHaLvw-1; Thu, 16 Mar 2023 20:57:21 -0400
X-MC-Unique: JTmXDPI7NbCzIRaebHaLvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DAC21C087A7;
 Fri, 17 Mar 2023 00:57:20 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7BAA40C6E67;
 Fri, 17 Mar 2023 00:57:19 +0000 (UTC)
Date: Thu, 16 Mar 2023 19:57:18 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, jsnow@redhat.com
Subject: Re: [PATCH 07/14] qapi: Fix error message when type name or array is
 expected
Message-ID: <20230317005718.kslrm7h6aorhqwyk@redhat.com>
References: <20230316071325.492471-1-armbru@redhat.com>
 <20230316071325.492471-8-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316071325.492471-8-armbru@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

On Thu, Mar 16, 2023 at 08:13:18AM +0100, Markus Armbruster wrote:
> We incorrectly report "FOO should be a type name" when it could also
> be an array.  Fix that.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/qapi/expr.py                        | 15 +++++++--------
>  tests/qapi-schema/event-nest-struct.err     |  2 +-
>  tests/qapi-schema/nested-struct-data.err    |  2 +-
>  tests/qapi-schema/returns-dict.err          |  2 +-
>  tests/qapi-schema/struct-member-invalid.err |  2 +-
>  5 files changed, 11 insertions(+), 12 deletions(-)
>

Doesn't change the set of schemas accepted, but does make it easier to
understand when a schema is rejected.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


