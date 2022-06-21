Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333C8553222
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 14:36:05 +0200 (CEST)
Received: from localhost ([::1]:37632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3d6x-0000Qj-1f
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 08:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3d5e-0007zW-FY
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:34:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3d5a-0001Q2-QN
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:34:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655814877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uZaMgpqsrylzrmhJeWjIdOBq+mTgIExx9dUJ0C+bryo=;
 b=L7SKcbCY/1CYu6SxR2gUCkJL7KuftbmKxGjxQ8tABwxDc/qdeiqaIFTO17JVg+j+mEs98t
 9FEBR4drtKTWIpe3mAdAFTfXg6j5F0M6Bt7aXZ8eI/rwWo9v15p5oZBa+5ALQP/bisNbQq
 FrJfz8iojVHWIRqPUWGpv/Q6QFnsXiA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-5NOz2PxMNy2Zqy0BjkvKgA-1; Tue, 21 Jun 2022 08:34:35 -0400
X-MC-Unique: 5NOz2PxMNy2Zqy0BjkvKgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71E133C0D86B;
 Tue, 21 Jun 2022 12:34:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37145404E4DF;
 Tue, 21 Jun 2022 12:34:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C493921E688E; Tue, 21 Jun 2022 14:34:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Juan Quintela
 <quintela@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,  Peter Xu <peterx@redhat.com>,
 =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v4 4/4] migration: Change zero_copy_send from migration
 parameter to migration capability
References: <20220620053944.257547-1-leobras@redhat.com>
 <20220620053944.257547-5-leobras@redhat.com>
Date: Tue, 21 Jun 2022 14:34:33 +0200
In-Reply-To: <20220620053944.257547-5-leobras@redhat.com> (Leonardo Bras's
 message of "Mon, 20 Jun 2022 02:39:45 -0300")
Message-ID: <87fsjyry92.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Bras <leobras@redhat.com> writes:

> When originally implemented, zero_copy_send was designed as a Migration
> paramenter.
>
> But taking into account how is that supposed to work, and how
> the difference between a capability and a parameter, it only makes sense
> that zero-copy-send would work better as a capability.
>
> Taking into account how recently the change got merged, it was decided
> that it's still time to make it right, and convert zero_copy_send into
> a Migration capability.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


