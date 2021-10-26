Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF9B43ADE9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 10:23:29 +0200 (CEST)
Received: from localhost ([::1]:37394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfHk0-0007QH-60
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 04:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfHMA-00030E-4c
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 03:58:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfHM7-0001qL-Jx
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 03:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635235127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jhtcVMIbw5+Eu1K2/yxRYimptHMC2yDQvfT49aQcyI4=;
 b=WF2RlJXz51n67x+bLpUQkwa/bbfGFegbjmQu+pSGNNNib7KgS7Hcs15KKrTyLW2ZqbPEVw
 nf2G5M6e3A8WaOgDJcj/O6bEEZv4v+QIglM91YEgxdhoh8AwEYoeaa/e5PZS2uLlK8LSqZ
 v74A9ouOVXSVJ9N99hTqecDmexVU/hg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-tBkIQVLpNiy5Yv7VfaaNPw-1; Tue, 26 Oct 2021 03:58:43 -0400
X-MC-Unique: tBkIQVLpNiy5Yv7VfaaNPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D9E71006AB8;
 Tue, 26 Oct 2021 07:58:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 933E06418A;
 Tue, 26 Oct 2021 07:58:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 465BC11380A7; Tue, 26 Oct 2021 09:58:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 3/9] qapi: Eliminate QCO_NO_OPTIONS for a slight
 simplification
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-4-armbru@redhat.com>
 <CAFn=p-YAfS1esUOFsjgyg51jjMFHSg72jnqfmLW=x1P+BYmNQQ@mail.gmail.com>
Date: Tue, 26 Oct 2021 09:58:20 +0200
In-Reply-To: <CAFn=p-YAfS1esUOFsjgyg51jjMFHSg72jnqfmLW=x1P+BYmNQQ@mail.gmail.com>
 (John Snow's message of "Mon, 25 Oct 2021 15:08:29 -0400")
Message-ID: <8735oo6wv7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 libvir-list@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 mdroth@linux.vnet.ibm.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On Mon, Oct 25, 2021 at 1:25 AM Markus Armbruster <armbru@redhat.com> wrote:
>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  include/qapi/qmp/dispatch.h | 1 -
>>  monitor/misc.c              | 3 +--
>>  scripts/qapi/commands.py    | 5 +----
>>  3 files changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
>> index 075203dc67..0ce88200b9 100644
>> --- a/include/qapi/qmp/dispatch.h
>> +++ b/include/qapi/qmp/dispatch.h
>> @@ -21,7 +21,6 @@ typedef void (QmpCommandFunc)(QDict *, QObject **, Error
>> **);
>>
>>  typedef enum QmpCommandOptions
>>  {
>> -    QCO_NO_OPTIONS            =  0x0,
>>      QCO_NO_SUCCESS_RESP       =  (1U << 0),
>>      QCO_ALLOW_OOB             =  (1U << 1),
>>      QCO_ALLOW_PRECONFIG       =  (1U << 2),
>> diff --git a/monitor/misc.c b/monitor/misc.c
>> index ffe7966870..3556b177f6 100644
>> --- a/monitor/misc.c
>> +++ b/monitor/misc.c
>> @@ -230,8 +230,7 @@ static void monitor_init_qmp_commands(void)
>>
>>      qmp_init_marshal(&qmp_commands);
>>
>> -    qmp_register_command(&qmp_commands, "device_add", qmp_device_add,
>> -                         QCO_NO_OPTIONS);
>> +    qmp_register_command(&qmp_commands, "device_add", qmp_device_add, 0);
>>
>>      QTAILQ_INIT(&qmp_cap_negotiation_commands);
>>      qmp_register_command(&qmp_cap_negotiation_commands,
>> "qmp_capabilities",
>> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
>> index 3654825968..c8a975528f 100644
>> --- a/scripts/qapi/commands.py
>> +++ b/scripts/qapi/commands.py
>> @@ -229,15 +229,12 @@ def gen_register_command(name: str,
>>      if coroutine:
>>          options += ['QCO_COROUTINE']
>>
>> -    if not options:
>> -        options = ['QCO_NO_OPTIONS']
>> -
>>      ret = mcgen('''
>>      qmp_register_command(cmds, "%(name)s",
>>                           qmp_marshal_%(c_name)s, %(opts)s);
>>  ''',
>>                  name=name, c_name=c_name(name),
>> -                opts=" | ".join(options))
>> +                opts=' | '.join(options) or 0)
>>      return ret
>>
>>
>>
> I'm not a big fan of naked constants on the C side, but the generator
> simplification is nice. I suppose it's worth the trade-off if you like it
> better this way.
>
> "eh".

I think 0 is an okay way to say "no flags, nothing to see here, move
on".

> Reviewed-by: John Snow <jsnow@redhat.com>

Thanks!


