Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0A343C220
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 07:24:24 +0200 (CEST)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfbQF-0001jr-6V
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 01:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfbPM-00015W-0S
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:23:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfbPK-0006Rg-9y
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:23:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635312205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FsuM1ZGEuHCfUw36OsdVssjF+XkVK3yMHKROEpvyHzA=;
 b=Gd7RFM8dus2l0qmc0cALBzpvmIfYlrg5yvqX2tzDcou/jhwlmqvHBMIDRcy0l10uLSsk/j
 cjPcdtrpEkxA36ynwQRdgGfoZZdCXCmYhOBLKtOt6b3jqjR3oe5heimfR/iDTj/JZnhn2z
 gczVU5b6GZ9j8FaztJD78NoQYSfMcoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-0wkviBvVO-ehjfKibT9HBw-1; Wed, 27 Oct 2021 01:23:21 -0400
X-MC-Unique: 0wkviBvVO-ehjfKibT9HBw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4944D10A8E01;
 Wed, 27 Oct 2021 05:23:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B874B19724;
 Wed, 27 Oct 2021 05:23:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4CAD611380A7; Wed, 27 Oct 2021 07:22:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 5/5] block: Deprecate transaction type drive-backup
References: <20211025042405.3762351-1-armbru@redhat.com>
 <20211025042405.3762351-6-armbru@redhat.com>
 <CAFn=p-ZfdUO5hfxjqFLt_kUD24jvAbPURyJ6Cozvdq5SLb0YcA@mail.gmail.com>
Date: Wed, 27 Oct 2021 07:22:59 +0200
In-Reply-To: <CAFn=p-ZfdUO5hfxjqFLt_kUD24jvAbPURyJ6Cozvdq5SLb0YcA@mail.gmail.com>
 (John Snow's message of "Tue, 26 Oct 2021 16:54:34 -0400")
Message-ID: <87v91jca8c.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, libvir-list@redhat.com,
 qemu-devel <qemu-devel@nongnu.org>, mdroth@linux.vnet.ibm.com,
 Peter Krempa <pkrempa@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On Mon, Oct 25, 2021 at 12:24 AM Markus Armbruster <armbru@redhat.com>
> wrote:
>
>> Several moons ago, Vladimir posted
>>
>>     Subject: [PATCH v2 3/3] qapi: deprecate drive-backup
>>     Date: Wed,  5 May 2021 16:58:03 +0300
>>     Message-Id: <20210505135803.67896-4-vsementsov@virtuozzo.com>
>>     https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg01394.html
>>
>> with this
>>
>>     TODO: We also need to deprecate drive-backup transaction action..
>>     But union members in QAPI doesn't support 'deprecated' feature. I tried
>>     to dig a bit, but failed :/ Markus, could you please help with it? At
>>     least by advice?
>>
>> This is one way to resolve it.  Sorry it took so long.
>>
>>
> I'll share the blame for not pushing back on the other series, but ...
>
>
>> John explored another way, namely adding feature flags to union
>> branches.  Could also be useful, say to add different features to
>> branches in multiple unions sharing the same tag enum.
>>
>>
> ... this way seems simpler for now, and I trust your intuition on what's
> easier to support as I don't have a solid grasp of the C interfaces at play
> for actually parsing the input. We can always revisit the other thing later
> if/when we need it.
>
>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  qapi/transaction.json | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/qapi/transaction.json b/qapi/transaction.json
>> index d175b5f863..381a2df782 100644
>> --- a/qapi/transaction.json
>> +++ b/qapi/transaction.json
>> @@ -54,6 +54,10 @@
>>  # @blockdev-snapshot-sync: since 1.1
>>  # @drive-backup: Since 1.6
>>  #
>> +# Features:
>> +# @deprecated: Member @drive-backup is deprecated.  Use member
>> +#              @blockdev-backup instead.
>> +#
>>  # Since: 1.1
>>  ##
>>  { 'enum': 'TransactionActionKind',
>> @@ -62,7 +66,7 @@
>>              'block-dirty-bitmap-disable', 'block-dirty-bitmap-merge',
>>              'blockdev-backup', 'blockdev-snapshot',
>>              'blockdev-snapshot-internal-sync', 'blockdev-snapshot-sync',
>> -            'drive-backup' ] }
>> +            { 'name': 'drive-backup', 'features': [ 'deprecated' ] } ] }
>>
>>  ##
>>  # @AbortWrapper:
>> --
>> 2.31.1
>>
>>
> Seems pretty clean to me overall. What's the reason for wanting it to be
> RFC?

I believe it depends on the remainder of Vladimir's series.


