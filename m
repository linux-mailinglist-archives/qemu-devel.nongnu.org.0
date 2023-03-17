Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06256BE0CD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 06:51:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd2zx-0005qz-F6; Fri, 17 Mar 2023 01:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pd2zr-0005p1-Sy
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 01:51:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pd2zq-0007JD-4k
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 01:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679032278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hNDmIlR284agt35FEmciKoel3od5Qtte6qkNfaNYX3w=;
 b=DXCFgNmB7ZzudfmAey/DaRFschBITBgM8W+3QsunT06BMhlurHvAanIAuyUrhPFW5sU3uQ
 geNdKd7cOmCEMmVioEHIkMAwFu+J2dWqxLJGgkgrMHrIWIH1nv3g2c6Y5/G6Ea8zbCiFb5
 IY9rqdbZTubz5NG/tqRt3PAcGK7gwfY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-jrDo7g9QPH6pJdXC1muvtQ-1; Fri, 17 Mar 2023 01:51:15 -0400
X-MC-Unique: jrDo7g9QPH6pJdXC1muvtQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 529E92812948;
 Fri, 17 Mar 2023 05:51:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3382B492B00;
 Fri, 17 Mar 2023 05:51:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3566721E6806; Fri, 17 Mar 2023 06:51:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,
 marcandre.lureau@redhat.com,  berrange@redhat.com,  jsnow@redhat.com
Subject: Re: [PATCH 09/14] tests/qapi-schema: Improve union discriminator
 coverage
References: <20230316071325.492471-1-armbru@redhat.com>
 <20230316071325.492471-10-armbru@redhat.com>
 <20230317010625.o2lrcplrcdzynbs4@redhat.com>
Date: Fri, 17 Mar 2023 06:51:14 +0100
In-Reply-To: <20230317010625.o2lrcplrcdzynbs4@redhat.com> (Eric Blake's
 message of "Thu, 16 Mar 2023 20:06:25 -0500")
Message-ID: <87pm98ncx9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Eric Blake <eblake@redhat.com> writes:

> On Thu, Mar 16, 2023 at 08:13:20AM +0100, Markus Armbruster wrote:
>> A union's 'discriminator' must name a one of the common members.
>
> s/ a//

Yes.

>> QAPISchemaVariants.check() looks it up by its c_name(), then checks
>> the name matches exactly (because c_name() is not injective).
>> 
>> Tests union-base-empty and union-invalid-discriminator both cover the
>> case where lookup fails.  Repurpose the latter to cover the case where
>> it succeeds and the name check fails.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  tests/qapi-schema/union-invalid-discriminator.err  | 2 +-
>>  tests/qapi-schema/union-invalid-discriminator.json | 4 ++--
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>> 
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>
> (- vs. _ is subtle, especially since I purposefully case-map them to
> one another whenever I can...)

Abusing the clash checking machinery to look up the the tag member is
kind of hacky, and it's why we have this odd case to cover.

Thanks!


