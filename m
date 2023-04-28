Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CFD6F1442
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 11:34:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psKUa-0008CV-5L; Fri, 28 Apr 2023 05:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psKUY-0008Bq-BL
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:34:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psKUT-000645-Mp
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682674449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QTWfh0mTR5TIlGJzxubMNhjXbsO3W3buPcrMKjkf5OU=;
 b=iqZEHTmnP2ccGvJ+5bxDleRtzOMsrUAa8cCgTupV63Fnh1qrrUZp2FVAZZnFpUv+vj3QWI
 TT2JITFHW56Ye5BArHOMc5KOdmLU5Z6i5IS0/mfa77x7R7IjwoykMAxV4b3r9x4BZhVSSA
 DltG+U1k9Ri7XXJ5eNNdKsHtD1JeUkY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-2cg0p9r1NEG2DWObqaBNMA-1; Fri, 28 Apr 2023 05:34:05 -0400
X-MC-Unique: 2cg0p9r1NEG2DWObqaBNMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 647ED1C02D42;
 Fri, 28 Apr 2023 09:34:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90786440BC;
 Fri, 28 Apr 2023 09:34:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7EECE21E675B; Fri, 28 Apr 2023 11:34:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  eblake@redhat.com,
 kwolf@redhat.com,  hreitz@redhat.com,  pbonzini@redhat.com,
 marcandre.lureau@redhat.com,  arei.gonglei@huawei.com,
 pizhenwei@bytedance.com,  jsnow@redhat.com,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  wangyanan55@huawei.com,
 quintela@redhat.com,  jasowang@redhat.com,  yuval.shaia.ml@gmail.com,
 stefanha@redhat.com,  kraxel@redhat.com,  kkostiuk@redhat.com,
 qemu-block@nongnu.org,  marcandre.lureau@gmail.com,  david@redhat.com
Subject: Re: [PATCH 17/16] docs/devel/qapi-code-gen: Describe some doc
 markup pitfalls
References: <20230425064223.820979-1-armbru@redhat.com>
 <20230427095346.1238913-1-armbru@redhat.com>
 <eee8f95c-43eb-b357-d42a-1c479967b97c@yandex-team.ru>
Date: Fri, 28 Apr 2023 11:34:02 +0200
In-Reply-To: <eee8f95c-43eb-b357-d42a-1c479967b97c@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 27 Apr 2023 15:41:12 +0300")
Message-ID: <87y1mcnyet.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:

> On 27.04.23 12:53, Markus Armbruster wrote:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   docs/devel/qapi-code-gen.rst | 53 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
>> index d81aac7a19..14983b074c 100644
>> --- a/docs/devel/qapi-code-gen.rst
>> +++ b/docs/devel/qapi-code-gen.rst
>> @@ -1059,6 +1059,59 @@ For example::
>>      'returns': ['BlockStats'] }
>>     +Markup pitfalls
>> +~~~~~~~~~~~~~~~
>> +
>> +A blank line is required between list items and paragraphs.  Without
>> +it, the list may not be recognized, resulting in garbled output.  Good
>> +example::
>> +
>> + # An event's state is modified if:
>> + #
>> + # - its name matches the @name pattern, and
>> + # - if @vcpu is given, the event has the "vcpu" property.
>> +
>> +Without the blank line this would be a single paragraph.
>> +
>> +Indentation matters.  Bad example::
>> +
>> + # @none: None (no memory side cache in this proximity domain,
>> + #              or cache associativity unknown)
>> +
>> +The description is parsed as a definition list with term "None (no
>> +memory side cache in this proximity domain," and definition "or cache
>> +associativity unknown)".
>
> May be add good example of indentation as well

Patches I'm about to post will fill up this pitfall.  They change the
text to:

     # @none: None (no memory side cache in this proximity domain,
     #              or cache associativity unknown)
     #     (since 5.0)

    The last line's de-indent is wrong.  The second and subsequent lines
    need to line up with each other, like this::

     # @none: None (no memory side cache in this proximity domain,
     #     or cache associativity unknown)
     #     (since 5.0)

Good enough?

[...]


