Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCD22134AD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 09:10:12 +0200 (CEST)
Received: from localhost ([::1]:56236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrFpq-0003P8-SE
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 03:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jrFoz-0002tk-1Z
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 03:09:17 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47812
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jrFow-0003JA-Je
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 03:09:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593760153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D+tQ62GDchFKZrpytAihdC/cfqcYF2lcT4NGXZH7ZFQ=;
 b=Ijzy2qTAzftJmQ+BLoYy98dTigBUJbRXns0873mkBmlpqdPZS1eSEMJSgf6cpHr+p0PBsp
 m6HSzY5LN4LHux3AXu1kBgkLMcxh1MEp7iSXybaiubSWL+Sz18qouQg3fMGKr0yq9PUwl8
 NcjvuvjT7NB+R9xuv2O891t8984xeYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-U3iEgzIHNeaiCA-ZfLEVvQ-1; Fri, 03 Jul 2020 03:09:12 -0400
X-MC-Unique: U3iEgzIHNeaiCA-ZfLEVvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D14CC107ACF7;
 Fri,  3 Jul 2020 07:09:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8611A61462;
 Fri,  3 Jul 2020 07:09:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 12FE61138648; Fri,  3 Jul 2020 09:09:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 37/44] error: Reduce unnecessary error propagation
References: <20200702155000.3455325-1-armbru@redhat.com>
 <20200702155000.3455325-38-armbru@redhat.com>
 <76b18fac-f7fa-b484-fdb0-6d2b927a190c@redhat.com>
Date: Fri, 03 Jul 2020 09:09:09 +0200
In-Reply-To: <76b18fac-f7fa-b484-fdb0-6d2b927a190c@redhat.com> (Eric Blake's
 message of "Thu, 2 Jul 2020 13:27:01 -0500")
Message-ID: <87zh8hvzvu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 01:34:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 7/2/20 10:49 AM, Markus Armbruster wrote:
>> When all we do with an Error we receive into a local variable is
>> propagating to somewhere else, we can just as well receive it there
>> right away, even when we need to keep error_propagate() for other
>> error paths.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
>> +++ b/block/replication.c
>> @@ -85,7 +85,6 @@ static int replication_open(BlockDriverState *bs, QDict *options,
>>   {
>>       int ret;
>>       BDRVReplicationState *s = bs->opaque;
>> -    Error *local_err = NULL;
>>       QemuOpts *opts = NULL;
>>       const char *mode;
>>       const char *top_id;
>> @@ -99,7 +98,7 @@ static int replication_open(BlockDriverState *bs, QDict *options,
>>         ret = -EINVAL;
>>       opts = qemu_opts_create(&replication_runtime_opts, NULL, 0, &error_abort);
>> -    if (!qemu_opts_absorb_qdict(opts, options, &local_err)) {
>> +    if (!qemu_opts_absorb_qdict(opts, options, errp)) {
>>           goto fail;
>>       }
>
> Does this one belong in 36/44, given that removal of 'local_err' is
> evidence that no other error path needed it?
>
> Either way, it belongs in the series, and the result of the two
> patches together is fine.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Actually, this hunk needs to go before PATCH 33 to keep it correct.
I'll find out how to best reshuffle hunks.  The end result will be the
same.

Thanks!


