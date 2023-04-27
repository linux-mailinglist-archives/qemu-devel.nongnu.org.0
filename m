Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E68F6F05E9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:37:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps0rO-0000cS-3f; Thu, 27 Apr 2023 08:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ps0rK-0000bC-BH
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:36:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ps0rI-0000Pd-HR
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:36:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682598984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YiJdzag3a6P7/ZEVHyGwR5McV2G0pKISlb+MeV/OuZI=;
 b=JLFKOSNRIDLhCgouTfNWawzOzCbVdVhUxiEmh9pUkkF71C5GKCeC5+BsumQhu3jxnEWC0D
 +N619bNtE3Qhw2m2F1bok+9OyklJahQqOb8r3I1I4msdGAojABegvh0LFd89ReBD1zotaL
 5hp2KQwTRV8/Pt2fRHJ2q/YAXR7wnQo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-UXusWVBQNZWXp5F05ysxJQ-1; Thu, 27 Apr 2023 08:36:19 -0400
X-MC-Unique: UXusWVBQNZWXp5F05ysxJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14C5185A5A3;
 Thu, 27 Apr 2023 12:36:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C8462027043;
 Thu, 27 Apr 2023 12:36:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A064821E675B; Thu, 27 Apr 2023 14:36:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  eblake@redhat.com,
 kwolf@redhat.com,  hreitz@redhat.com,  pbonzini@redhat.com,
 marcandre.lureau@redhat.com,  arei.gonglei@huawei.com,
 pizhenwei@bytedance.com,  jsnow@redhat.com,  vsementsov@yandex-team.ru,
 eduardo@habkost.net,  marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com,  jasowang@redhat.com,  yuval.shaia.ml@gmail.com,
 stefanha@redhat.com,  kraxel@redhat.com,  kkostiuk@redhat.com,
 qemu-block@nongnu.org,  marcandre.lureau@gmail.com,  david@redhat.com
Subject: Re: [PATCH 17/16] docs/devel/qapi-code-gen: Describe some doc
 markup pitfalls
References: <20230425064223.820979-1-armbru@redhat.com>
 <20230427095346.1238913-1-armbru@redhat.com>
 <878redd1ju.fsf@secure.mitica>
Date: Thu, 27 Apr 2023 14:36:16 +0200
In-Reply-To: <878redd1ju.fsf@secure.mitica> (Juan Quintela's message of "Thu, 
 27 Apr 2023 13:09:25 +0200")
Message-ID: <87y1mdsdrz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

Juan Quintela <quintela@redhat.com> writes:

> Markus Armbruster <armbru@redhat.com> wrote:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>

Thanks!

>> ---
>>  docs/devel/qapi-code-gen.rst | 53 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 53 insertions(+)
>>
>> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
>> index d81aac7a19..14983b074c 100644
>> --- a/docs/devel/qapi-code-gen.rst
>> +++ b/docs/devel/qapi-code-gen.rst

[...]

>> +When you change documentation comments, please check the generated
>> +documentation comes out as intended!
>
> What is the easiest way to see the code generated for some subsystem,
> say migration.json and find the problems and undocumented stuff?
>
> I am expecting something in the lines of:
> - you run this command
> - and look at this file

Make sure building documentation is enabled, run "make", and look at
bld-clang/docs/manual/interop/qemu-qmp-ref.html.  Documentation for
qapi/migration.json is in section "Migration" (because
qapi/migration.json starts with a "# = Migration" heading).

Sphinx can produce a number of formats.  Our build system only does HTML
and manual pages.  I like to also produce plain text for easy diffing.
I grab the sphinx-build invocation from "make V=1" and replace "-b html"
by "-b text".


