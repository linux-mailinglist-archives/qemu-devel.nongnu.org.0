Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D11D40A5EB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 07:27:21 +0200 (CEST)
Received: from localhost ([::1]:35926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ0yW-0004v1-Ex
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 01:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ0wk-0004DR-WD
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 01:25:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ0wi-0007P9-0d
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 01:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631597126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1EwfvmEgkDqI3kX6BemK+bgKKnm5dnZjTrV72Dlg8aQ=;
 b=QwQNjEIaBWoA+ly6dGmiFjeL+Yu8EFL7T2VAKozAOONMQHATNoPWV6DFvqhwFCbdzbEqU/
 C8BX0itxF9VFaPFZpAHOxrSMKIe3kyyILrKecQm5nPMB2tMUp5/y5Xdmc5llW3drZRn4VM
 O3TyeGFWUJvqyehEULXjs+OvSyqUx5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-bCtrbsE5MdyShEj190eJjA-1; Tue, 14 Sep 2021 01:25:24 -0400
X-MC-Unique: bCtrbsE5MdyShEj190eJjA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D34B1006AA1
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 05:25:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A4466D983;
 Tue, 14 Sep 2021 05:25:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1B6A1113865F; Tue, 14 Sep 2021 07:25:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 10/22] qapi: Convert simple union TransactionAction to
 flat one
References: <20210913123932.3306639-1-armbru@redhat.com>
 <20210913123932.3306639-11-armbru@redhat.com>
 <20210913145316.y73zmxsxifhdkplr@redhat.com>
Date: Tue, 14 Sep 2021 07:25:18 +0200
In-Reply-To: <20210913145316.y73zmxsxifhdkplr@redhat.com> (Eric Blake's
 message of "Mon, 13 Sep 2021 09:53:16 -0500")
Message-ID: <87wnnjg24h.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: Kevin Wolf <kwolf@redhat.com>, marcandre.lureau@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On Mon, Sep 13, 2021 at 02:39:20PM +0200, Markus Armbruster wrote:
>> Simple unions predate flat unions.  Having both complicates the QAPI
>> schema language and the QAPI generator.  We haven't been using simple
>> unions in new code for a long time, because they are less flexible and
>> somewhat awkward on the wire.
>> 
>> To prepare for their removal, convert simple union TransactionAction
>> to an equivalent flat one.  Adds some boilerplate to the schema, which
>> is a bit ugly, but a lot easier to maintain than the simple union
>> feature.
>> 
>> Cc: Kevin Wolf <kwolf@redhat.com>
>> Cc: Hanna Reitz <hreitz@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  qapi/transaction.json | 111 +++++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 99 insertions(+), 12 deletions(-)
>
> Same comments for each of 5-10 as for 4; the conversion is sane, and
> the only question is on documentation, whether you want...
>
>> 
>> diff --git a/qapi/transaction.json b/qapi/transaction.json
>> index 894258d9e2..d7fc73d7df 100644
>> --- a/qapi/transaction.json
>> +++ b/qapi/transaction.json
>> @@ -38,6 +38,91 @@
>>  { 'enum': 'ActionCompletionMode',
>>    'data': [ 'individual', 'grouped' ] }
>>  
>> +##
>> +# @TransactionActionKind:
>> +#
>> +# Since: 6.1
>
> ... 6.2 here, or to preserve the implicit...
>
>>  ##
>>  # @TransactionAction:
>>  #
>> @@ -60,19 +145,21 @@
>>  # Since: 1.1
>
> ...1.1 matching when the simple union was first formed (actually, this
> simple union has grown over time, which makes it trickier to decide
> which historical Since: to use on each Wrapper, so I'd lean towards
> 6.2 on all of them as being less work).

The enum becomes explicit in the schema, but is the same as before.  I
think copying "since" information from the no-longer-simple union and
its branches to the enum and its members makes sense.

The wrapper types become explicit, but with a new name.  We can copy
"since" from their branch anyway.  Doesn't really matter, unlike for the
enum.

> For patches 5-10:
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


