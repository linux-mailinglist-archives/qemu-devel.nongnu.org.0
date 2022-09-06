Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8435ADEBA
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 07:03:49 +0200 (CEST)
Received: from localhost ([::1]:48060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVQkR-0006IW-90
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 01:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVQiV-0004li-Uf
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 01:01:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVQiS-0004V1-Md
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 01:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662440499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WxL2qAcKT1YBPD7Fq1BE810fYLIVEzMmQJUoZ/H4rHE=;
 b=dU5wWBNXAopSNi2KY7pFiOgiHzV29TosVs/9WdLyt6FWJBoy0I1pcgMdhvjj0/+QKFeAci
 eaZJzA6WsQr0+8dyDhaDT5GmA92C0lHFnYXvfoOQNhvDQKVM3PQ0jCBBTnxLc3kCAhvGJr
 F2lDjyRnzR/CYoQ4HTmjSiVX/VSbDNY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-4VovfGLIMxCgToPq-qxKZQ-1; Tue, 06 Sep 2022 01:01:37 -0400
X-MC-Unique: 4VovfGLIMxCgToPq-qxKZQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4D278041BE
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 05:01:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8014F2166B26;
 Tue,  6 Sep 2022 05:01:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 379BB21E6900; Tue,  6 Sep 2022 07:01:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] tests: unit: add NULL-pointer check
References: <20220905111038.33324-1-pbonzini@redhat.com>
Date: Tue, 06 Sep 2022 07:01:35 +0200
In-Reply-To: <20220905111038.33324-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 5 Sep 2022 13:10:38 +0200")
Message-ID: <87pmg96qq8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> In CID 1432593, Coverity complains that the result of qdict_crumple()
> might leak if it is not a dictionary.  This is not a practical concern
> since the test would fail immediately with a NULL pointer dereference
> in qdict_size().
>
> However, it is not nice to depend on qdict_size() crashing, so add an
> explicit assertion that that the crumpled object was indeed a dictionary.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/unit/check-block-qdict.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/unit/check-block-qdict.c b/tests/unit/check-block-qdict.c
> index 5a25825093..751c58e737 100644
> --- a/tests/unit/check-block-qdict.c
> +++ b/tests/unit/check-block-qdict.c
> @@ -504,7 +504,7 @@ static void qdict_crumple_test_empty(void)
>      src = qdict_new();
>  
>      dst = qobject_to(QDict, qdict_crumple(src, &error_abort));
> -
> +    g_assert(dst);
>      g_assert_cmpint(qdict_size(dst), ==, 0);
>  
>      qobject_unref(src);

First, I'm fine with the patch, so
Reviewed-by: Markus Armbruster <armbru@redhat.com>

Next, permit me a few words on writing tests.  For me, a unit test fails
by crashing.  Crashing with a nice message is optional.  The more likely
the failure, the more useful is niceness.  Complete niceness is
impossible --- if we could predict all crashes, we wouldn't need tests.
Trying to push niceness can be overly verbose.  Thus, judgement calls,
and matters of taste.

Wanting to mollify Coverity is a valid argument.


