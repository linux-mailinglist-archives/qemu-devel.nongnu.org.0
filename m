Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052596FBFE0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 09:04:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwHO9-0006Ai-Gh; Tue, 09 May 2023 03:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwHO7-0006A5-3T
 for qemu-devel@nongnu.org; Tue, 09 May 2023 03:03:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwHO5-0005z0-Dj
 for qemu-devel@nongnu.org; Tue, 09 May 2023 03:03:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683615829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HA59Wx+uPOEJled3+DgDGjKpxi743TLhRZ9PPB+P3Aw=;
 b=fdLJ6wy3CBpG56m1u/QBWXmBNE3wFA5o3enjaX8t2KBSG6agIV03AlN/oRMpd7kNJirXBk
 oIREFyuT1Vaf5kpxgB1HVO2uWPXcgQRedduHxgMJWoGKMzme7PYJ/g2QpJ++0W2wIKgVNB
 vhlArbLW+fw2y8cP18cqpwXTLhX0WFQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-l9RrEdJAPsq3AKGzrKvFLQ-1; Tue, 09 May 2023 03:03:45 -0400
X-MC-Unique: l9RrEdJAPsq3AKGzrKvFLQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34CA118E0AC4;
 Tue,  9 May 2023 07:03:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A30C8C16024;
 Tue,  9 May 2023 07:03:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6B43421E6924; Tue,  9 May 2023 09:03:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  peter.maydell@linaro.org,
 pbonzini@redhat.com,  marcandre.lureau@redhat.com,  berrange@redhat.com,
 thuth@redhat.com,  philmd@linaro.org,  mst@redhat.com,
 imammedo@redhat.com,  anisinha@redhat.com,  eblake@redhat.com,
 kraxel@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 arei.gonglei@huawei.com,  pizhenwei@bytedance.com,  jsnow@redhat.com,
 vsementsov@yandex-team.ru,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  wangyanan55@huawei.com,  peterx@redhat.com,
 leobras@redhat.com,  jasowang@redhat.com,  yuval.shaia.ml@gmail.com,
 pavel.dovgaluk@ispras.ru,  jiri@resnulli.us,  stefanb@linux.vnet.ibm.com,
 stefanha@redhat.com,  lukasstraub2@web.de,  kkostiuk@redhat.com,
 qemu-block@nongnu.org,  victortoso@redhat.com
Subject: Re: [PATCH 03/17] qapi: Fix crash on stray double quote character
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-4-armbru@redhat.com>
 <87bkj799kn.fsf@secure.mitica>
Date: Tue, 09 May 2023 09:03:42 +0200
In-Reply-To: <87bkj799kn.fsf@secure.mitica> (Juan Quintela's message of "Fri, 
 28 Apr 2023 19:54:16 +0200")
Message-ID: <873546kmup.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Juan Quintela <quintela@redhat.com> writes:

> Markus Armbruster <armbru@redhat.com> wrote:
>> When the lexer chokes on a stray character, its shows the characters
>> until the next structural character in the error message.
>
> You have a problem
>
>> It uses a regular expression
>
> You use regular expresions.
>
> Now you have two problems.
>
> Yes, I had to do it.

:)

Regular expressions go bad when pushed too far.

Lexers are a perfect fit for them.  However, the bug I fix here isn't in
the lexer proper, it's in "make the error message nice" code.

>> to match a non-empty string of non-structural
>> characters.  Bug: the regular expression treats '"' as structural.
>> When the lexer chokes on '"', the match fails, and trips
>> must_match()'s assertion.  Fix the regular expression.
>>
>> Fixes: 14c32795024c (qapi: Improve reporting of lexical errors)
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>

Thanks!


