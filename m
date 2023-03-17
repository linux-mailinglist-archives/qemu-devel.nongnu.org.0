Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F846BE932
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 13:30:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd9DF-00027l-Ez; Fri, 17 Mar 2023 08:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pd9DA-00027X-ME
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 08:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pd9D8-0003oy-CX
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 08:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679056168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4cRGJoZv0KsEMLZWdUfVwRxKMgBViUrt2GtyUT9RRFI=;
 b=SUJjjoMpUpMuWukEuUFzZhAzM3kwEDbsBftrYdBjUbBo9X6Y4ekz87eiJy8gl2LkXZvt/s
 /+SOoY9RO/7rKUqjU9xWHShKKkYx0mMc7z5t+j8wOESAD3C6IIWkbOM2Aiicg9szPdLWsi
 hVFx/kZb3m2Fic6i/ooToKNN7QsPQq0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-G7IX26JkPny-_m2OxlJ4gg-1; Fri, 17 Mar 2023 08:29:27 -0400
X-MC-Unique: G7IX26JkPny-_m2OxlJ4gg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EA0B2810C07;
 Fri, 17 Mar 2023 12:29:27 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FE74483EC0;
 Fri, 17 Mar 2023 12:29:26 +0000 (UTC)
Date: Fri, 17 Mar 2023 07:29:24 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, jsnow@redhat.com
Subject: Re: [PATCH 11/14] tests/qapi-schema: Clean up positive test for
 conditionals
Message-ID: <20230317122924.lbx4kni45tes5byo@redhat.com>
References: <20230316071325.492471-1-armbru@redhat.com>
 <20230316071325.492471-12-armbru@redhat.com>
 <20230317010950.6oxwhloomaup4m2l@redhat.com>
 <87jzzfoqkz.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzzfoqkz.fsf@pond.sub.org>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

On Fri, Mar 17, 2023 at 07:10:52AM +0100, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
> 
> > On Thu, Mar 16, 2023 at 08:13:22AM +0100, Markus Armbruster wrote:
> >> Union TestIfUnion is conditional on macros TEST_IF_UNION and
> >> TEST_IF_STRUCT.  It uses TestIfEnum, which is conditional on macro
> >> TEST_IF_ENUM.  If TEST_IF_ENUM and TEST_IF_STRUCT are defined, but
> >> TEST_IF_ENUM isn't, the generated code won't compile.
> >
> > s/ENUM/UNION/ in one of these two uses in this sentence.
> 
> Yes: If TEST_IF_UNION and TEST_IF_UNION are defined, ...

If TEST_IF_UNION and TEST_IF_STRUCT are defined, ...

(you are stuck in a maze of twisty little passages, all alike)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


