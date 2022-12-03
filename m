Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7D3641566
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 10:44:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1P2g-0001SR-PA; Sat, 03 Dec 2022 04:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p1P2e-0001SA-0S
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 04:42:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p1P2c-0007zM-76
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 04:42:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670060557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dgYQdb+UW8PhUgzoqGEDSQ/vZqRH2AI7JMEJ0584cpI=;
 b=VLCaVMIyZbutJMEBICgkITNw0JEQC5Oc5OIxixaJcPOY0OHbbjKvd509vX/jreecDL5ktW
 7QDtLcQNZinwXaFhBi66RhjE6irqKIDkLuV8wNI9MBsc7RGwCmSv8lbwE0CpgvHi8BtXWA
 1jTRGppwk0M9RJxRoAUxCM/bQ8vhco8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-eT9tKEk5PeKFcIHTkjo8Sg-1; Sat, 03 Dec 2022 04:42:33 -0500
X-MC-Unique: eT9tKEk5PeKFcIHTkjo8Sg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91BEB811E67;
 Sat,  3 Dec 2022 09:42:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 552512028E96;
 Sat,  3 Dec 2022 09:42:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3CDDD21E6921; Sat,  3 Dec 2022 10:42:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hyman <huangy81@chinatelecom.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,  Eric Blake
 <eblake@redhat.com>,  Juan Quintela <quintela@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 08/11] migration: Export dirty-limit time info
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
 <513421b79099d7f73b3db227b5eb347fe9a3c241.1669047366.git.huangy81@chinatelecom.cn>
 <4578db86-2959-9bae-c28e-da7af162be71@chinatelecom.cn>
Date: Sat, 03 Dec 2022 10:42:30 +0100
In-Reply-To: <4578db86-2959-9bae-c28e-da7af162be71@chinatelecom.cn> (Hyman's
 message of "Sat, 3 Dec 2022 17:14:10 +0800")
Message-ID: <87ilisn7qx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

Hyman <huangy81@chinatelecom.cn> writes:

> =E5=9C=A8 2022/11/22 0:26, huangy81@chinatelecom.cn =E5=86=99=E9=81=93:
>> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>> Export dirty limit throttle time and estimated ring full
>> time, through which we can observe the process of dirty
>> limit during live migration.
>> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>> ---
>>   include/sysemu/dirtylimit.h |  2 ++
>>   migration/migration.c       | 10 ++++++++++
>>   monitor/hmp-cmds.c          | 10 ++++++++++
>>   qapi/migration.json         | 10 +++++++++-
>>   softmmu/dirtylimit.c        | 31 +++++++++++++++++++++++++++++++
>>   5 files changed, 62 insertions(+), 1 deletion(-)

[...]

>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index af6b2da..62db5cb 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -242,6 +242,12 @@
>>  #                   Present and non-empty when migration is blocked.
>>  #                   (since 6.0)
>>  #
>> +# @dirty-limit-throttle-us-per-full: Throttle time (us) during the peri=
od of
>> +#                                    dirty ring full (since 7.1)
>> +#
>> +# @dirty-limit-us-ring-full: Estimated periodic time (us) of dirty ring=
 full.
>> +#                            (since 7.1)
> How about the following documents:
>
> # @dirty-limit-throttletime-each-round: Max throttle time (us) of all vir=
tual CPUs each dirty ring
> #                                       full round, used to observe if di=
rty-limit take effect
> #                                       during live migration. (since 7.3)
> #
> # @dirty-limit-ring-full-time: Estimated average dirty ring full time (us=
) each round, note that
> #                              the value equals dirty ring memory size di=
vided by average dirty
> #                              page rate of virtual CPU, which can be use=
d to observe the average
> #                              memory load of virtual CPU indirectly. (si=
nce 7.3)
>
> Is it more easy-understanding ?

dirty-limit-ring-full-time is better than dirty-limit-us-ring-full.

dirty-limit-throttletime-each-round is rather long.

We say "in microseconds" in doc comments.

Avoid abbreviations like "max" in doc comments, spell them out like
"maximum".

I need to give the text a closer read.  Out of time for today.  If you
don't see a reply from me early next week, feel free to remind me.

>> +#
>>  # Since: 0.14
>>  ##
>>  { 'struct': 'MigrationInfo',
>> @@ -259,7 +265,9 @@
>>             '*postcopy-blocktime' : 'uint32',
>>             '*postcopy-vcpu-blocktime': ['uint32'],
>>             '*compression': 'CompressionStats',
>> -           '*socket-address': ['SocketAddress'] } }
>> +           '*socket-address': ['SocketAddress'],
>> +           '*dirty-limit-throttle-us-per-full': 'int64',
>> +           '*dirty-limit-us-ring-full': 'int64'} }
>>  ##
>>  # @query-migrate:

[...]


