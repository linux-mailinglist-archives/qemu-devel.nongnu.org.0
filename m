Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6676FC038
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 09:11:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwHUA-0000OO-TN; Tue, 09 May 2023 03:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwHU8-0000Np-Jw
 for qemu-devel@nongnu.org; Tue, 09 May 2023 03:10:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwHU6-000753-WA
 for qemu-devel@nongnu.org; Tue, 09 May 2023 03:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683616206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qCLrREJKzayDuNuwBKypchxBmUYP4eO3i1+Q/rAWxaQ=;
 b=jGxHWl3n1yw7UMbU2OSSon6csxSA23b+RoIX6c80c7PgEo8zUN9sNWnWPpYpVPmgOXTFeZ
 Gw99AsCvG5SLGbX0/MbH3gB+6ZOgkmHfsxwq2i6x9F8wCf5U8Tvbddr04BDO5YleuQ+5dv
 GA9eLjmVpLesmDesbFPjsWzqaftq/yw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-Rxqctc29NAmG2LL9t6GF6A-1; Tue, 09 May 2023 03:10:02 -0400
X-MC-Unique: Rxqctc29NAmG2LL9t6GF6A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1752118E0AC4;
 Tue,  9 May 2023 07:10:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57DFEC16024;
 Tue,  9 May 2023 07:10:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 224EA21E6924; Tue,  9 May 2023 09:10:00 +0200 (CEST)
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
Subject: Re: [PATCH 04/17] meson: Fix to make QAPI generator output depend
 on main.py
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-5-armbru@redhat.com>
 <877ctv99hv.fsf@secure.mitica>
Date: Tue, 09 May 2023 09:10:00 +0200
In-Reply-To: <877ctv99hv.fsf@secure.mitica> (Juan Quintela's message of "Fri, 
 28 Apr 2023 19:55:56 +0200")
Message-ID: <87y1lyj7zr.fsf@pond.sub.org>
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
>> @qapi_gen_depends is missing scripts/qapi/main.py.  Fix that, and drop
>> a duplicate scripts/qapi/common.py.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
>
>> ---
>>  meson.build | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meson.build b/meson.build
>> index c44d05a13f..ed24df2ade 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -2834,12 +2834,12 @@ qapi_gen_depends = [ meson.current_source_dir() / 'scripts/qapi/__init__.py',
>>                       meson.current_source_dir() / 'scripts/qapi/expr.py',
>>                       meson.current_source_dir() / 'scripts/qapi/gen.py',
>>                       meson.current_source_dir() / 'scripts/qapi/introspect.py',
>> +                     meson.current_source_dir() / 'scripts/qapi/main.py',
>>                       meson.current_source_dir() / 'scripts/qapi/parser.py',
>>                       meson.current_source_dir() / 'scripts/qapi/schema.py',
>>                       meson.current_source_dir() / 'scripts/qapi/source.py',
>>                       meson.current_source_dir() / 'scripts/qapi/types.py',
>>                       meson.current_source_dir() / 'scripts/qapi/visit.py',
>> -                     meson.current_source_dir() / 'scripts/qapi/common.py',
>>                       meson.current_source_dir() / 'scripts/qapi-gen.py'
>>  ]
>
> And here you see why putting things in alphabetical order (when
> possible) avoids this kind of duplications.

Right.

When Paolo converted this to Meson, he kept the list in alphabetical
order, except he added common.py and doc.py again at the end.  Probably
an editing accident.  When Peter later replaced doc.py, he dropped both
copies here, but apparently didn't notice the other duplicate.

Thanks!


