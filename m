Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665215E6666
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:04:21 +0200 (CEST)
Received: from localhost ([::1]:35526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obNkS-0006ID-0h
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obMNK-00056E-TI
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:36:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obMNH-00025i-1n
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663853777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FvAtRdJjpPnccagKO5QQhUTuoT1OMUt4JHgJayUEgFE=;
 b=YOdleoRPDCINNrMiGrGJ1vtr3nwZrrFWipQ6qpSQy3rX4kKx+QUsV55yFG0UrIbdvx7zgM
 ca1bQ8zp0x1ey+XiS7L95qMnG9WQVaSsAaSmt4RdO2UURWvM9Km6ZHPfNk7n3/A9kWhnvO
 sHOY1HeWfqz2El9n8MsqZSCqImEUoYE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-xRAJzkjpONK4pNiRbpCPRQ-1; Thu, 22 Sep 2022 09:36:13 -0400
X-MC-Unique: xRAJzkjpONK4pNiRbpCPRQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69AC63806702;
 Thu, 22 Sep 2022 13:36:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41E97140EBF5;
 Thu, 22 Sep 2022 13:36:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0963821E6900; Thu, 22 Sep 2022 15:36:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,  Michael
 Roth <michael.roth@amd.com>,  John Snow <jsnow@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Juan Quintela <quintela@redhat.com>,  "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 14/27] qapi migration: Elide redundant has_FOO in
 generated C
References: <20220915204317.3766007-1-armbru@redhat.com>
 <20220915204317.3766007-15-armbru@redhat.com>
 <CAAdtpL5RoFEzEJFXZT44oi9YQr9N84sSoy5xPKLkkdxWRiwMjw@mail.gmail.com>
Date: Thu, 22 Sep 2022 15:36:12 +0200
In-Reply-To: <CAAdtpL5RoFEzEJFXZT44oi9YQr9N84sSoy5xPKLkkdxWRiwMjw@mail.gmail.com>
 ("Philippe =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 22 Sep 2022
 15:15:48 +0200")
Message-ID: <877d1vleer.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On Thu, Sep 15, 2022 at 10:52 PM Markus Armbruster <armbru@redhat.com> wr=
ote:
>>
>> The has_FOO for pointer-valued FOO are redundant, except for arrays.
>> They are also a nuisance to work with.  Recent commit "qapi: Start to
>> elide redundant has_FOO in generated C" provided the means to elide
>> them step by step.  This is the step for qapi/migration.json.
>>
>> Said commit explains the transformation in more detail.  The invariant
>> violations mentioned there do not occur here.
>>
>> Cc: Juan Quintela <quintela@redhat.com>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  migration/block-dirty-bitmap.c |  4 ++--
>>  migration/colo.c               |  1 -
>>  migration/migration.c          | 27 ++++++++-------------------
>>  monitor/hmp-cmds.c             | 26 +++++++++++---------------
>>  monitor/misc.c                 |  2 +-
>>  scripts/qapi/schema.py         |  1 -
>>  6 files changed, 22 insertions(+), 39 deletions(-)
>
>> @@ -1556,7 +1548,7 @@ static bool migrate_params_check(MigrationParamete=
rs *params, Error **errp)
>>  #ifdef CONFIG_LINUX
>>      if (migrate_use_zero_copy_send() &&
>>          ((params->has_multifd_compression && params->multifd_compressio=
n) ||
>> -         (params->has_tls_creds && params->tls_creds && *params->tls_cr=
eds))) {
>> +         (params->tls_creds && params->tls_creds && *params->tls_creds)=
)) {
>>          error_setg(errp,
>>                     "Zero copy only available for non-compressed non-TLS=
 multifd migration");
>>          return false;
>
> Checking params->tls_creds once should be enough ;)

Can't deny that!

Will tidy up, thanks!


