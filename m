Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA3C5F7B5A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:23:57 +0200 (CEST)
Received: from localhost ([::1]:55124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogq8i-0002CU-I2
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ogozG-0005JE-Oq
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:10:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ogozB-0003d8-KV
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:10:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665155396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jKc9Dsz9nipSMhhQ6QiUTTa/hBR9W28kDChlSYAQNdI=;
 b=HMqHLfHrnLS9v1JRTaunxI5I8SCw9Yb7nM3cQnV5I/hhrWkUyjMhyIBDcDHrLu/0A5lwl3
 Kn6q4D+wqo56mC7oOTai20ragN+Ehmi2VmMvsZC+NMtbom9FUWijKFWxtNU6iR1pG8da0n
 8GrUk9qy/6LSTErVRA3yC81mgWo2URg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-73up1SQENSetg3iRvsoX7g-1; Fri, 07 Oct 2022 11:09:55 -0400
X-MC-Unique: 73up1SQENSetg3iRvsoX7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6720938041D7;
 Fri,  7 Oct 2022 15:09:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2835740C94CE;
 Fri,  7 Oct 2022 15:09:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 95E8521E691D; Fri,  7 Oct 2022 17:09:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,  Juan
 Quintela <quintela@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Eric Blake <eblake@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v1 5/8] migration: Export dirty-limit time info
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
 <cover.1662052189.git.huangy81@chinatelecom.cn>
 <5ca0b4ae2aa787c1547d798521ab0e67867437a8.1662052189.git.huangy81@chinatelecom.cn>
 <87o7uvjszm.fsf@pond.sub.org>
 <00eac029-89b0-04ae-f591-c91ac5baba51@chinatelecom.cn>
Date: Fri, 07 Oct 2022 17:09:53 +0200
In-Reply-To: <00eac029-89b0-04ae-f591-c91ac5baba51@chinatelecom.cn> (Hyman
 Huang's message of "Sun, 2 Oct 2022 09:13:43 +0800")
Message-ID: <8735bzr7pa.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hyman Huang <huangy81@chinatelecom.cn> writes:

> =E5=9C=A8 2022/10/2 2:31, Markus Armbruster =E5=86=99=E9=81=93:
>> huangy81@chinatelecom.cn writes:
>>=20
>>> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>>>
>>> Export dirty limit throttle time and estimated ring full
>>> time, through which we can observe the process of dirty
>>> limit during live migration.
>>>
>>> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.c=
n>
>> [...]
>>=20
>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>> index bc4bc96..c263d54 100644
>>> --- a/qapi/migration.json
>>> +++ b/qapi/migration.json
>>> @@ -242,6 +242,12 @@
>>>   #                   Present and non-empty when migration is blocked.
>>>   #                   (since 6.0)
>>>   #
>>> +# @dirty-limit-throttle-us-per-full: Throttle time (us) during the per=
iod of
>>> +#                                    dirty ring full (since 7.0)
>>> +#
>>> +# @dirty-limit-us-ring-full: Estimated periodic time (us) of dirty rin=
g full.
>>> +#                            (since 7.0)
>>> +#
>>
>> Can you explain what is measured here a bit more verbosely?
>
> The two fields of migration info aims to export dirty-limit throttle time=
 so that upper apps can check out the process of live migration,=20
> like 'cpu-throttle-percentage'.
>
> The commit "tests: Add migration dirty-limit capability test" make use of=
 the 'dirty-limit-throttle-us-per-full' to checkout if dirty-limit has=20
> started, the commit "tests/migration: Introduce dirty-limit into guestper=
f" introduce the two field so guestperf tools also show the=20
> process of dirty-limit migration.
>
> And i also use qmp_query_migrate to observe the migration by checkout the=
se two fields.
>
> I'm not sure if above explantation is what you want exactly, please be fr=
ee to start any discussion about this features.

You explained use cases, which is always welcome.

I'm trying to understand the two new members' meaning, i.e. what exactly
is being measured.

For existing @cpu-throttle-percentage, the doc comment tells me:
"percentage of time guest cpus are being throttled during
auto-converge."

For the your new members, the doc comment tries to tell me, but it
doesn't succeed.  If you explain what is being measured more verbosely,
we may be able to improve the doc comment.


