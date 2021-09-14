Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F20640A5AF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 06:59:04 +0200 (CEST)
Received: from localhost ([::1]:58442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ0X9-000886-Kl
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 00:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ0Th-0002JM-H0
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 00:55:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ0Tg-0007QL-24
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 00:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631595327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XhvnNVmR+yUvtJE3clLLtz7mAqU9exiwsrK/wIQqmeM=;
 b=JCUQkPzJzl+69ihdeRcnef5fcnWRD7mPQS0MJuy38LRiBSoDSpFQKvFhDHcoANa2gLcKvY
 x0sp3H4Y07jXjUSAPF2SLkf57qn5ruIv39SgCLFitN+RRv47rzfQABW3HHla+EFSZVexCw
 qISnrFU9WXiuqqWjMU798pxJGxkjXYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-TlDizdwfN2O5y77a0PK02A-1; Tue, 14 Sep 2021 00:55:23 -0400
X-MC-Unique: TlDizdwfN2O5y77a0PK02A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB7121084684
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 04:55:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB68B5D9D3;
 Tue, 14 Sep 2021 04:55:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 80DCA113865F; Tue, 14 Sep 2021 06:55:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 04/22] qapi: Convert simple union InputEvent to flat one
References: <20210913123932.3306639-1-armbru@redhat.com>
 <20210913123932.3306639-5-armbru@redhat.com>
 <20210913144637.t3mw3o65cfpmgyjh@redhat.com>
Date: Tue, 14 Sep 2021 06:55:15 +0200
In-Reply-To: <20210913144637.t3mw3o65cfpmgyjh@redhat.com> (Eric Blake's
 message of "Mon, 13 Sep 2021 09:46:37 -0500")
Message-ID: <871r5rhi30.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: marcandre.lureau@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 jsnow@redhat.com, Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On Mon, Sep 13, 2021 at 02:39:14PM +0200, Markus Armbruster wrote:
>> Simple unions predate flat unions.  Having both complicates the QAPI
>> schema language and the QAPI generator.  We haven't been using simple
>> unions in new code for a long time, because they are less flexible and
>> somewhat awkward on the wire.
>> 
>> To prepare for their removal, convert simple union InputEvent to an
>> equivalent flat one.  Adds some boilerplate to the schema, which is a
>> bit ugly, but a lot easier to maintain than the simple union feature.
>> 
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  qapi/ui.json | 42 ++++++++++++++++++++++++++++++++++++++----
>>  1 file changed, 38 insertions(+), 4 deletions(-)
>
> Same question as in 3/22:
>
>> 
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index a6b0dce876..fe10d69431 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -960,6 +960,38 @@
>>    'data'  : { 'axis'    : 'InputAxis',
>>                'value'   : 'int' } }
>>  
>> +##
>> +# @InputEventKind:
>> +#
>> +# Since: 6.1
>
> This should either be 6.2, or...
>
>>  ##
>>  # @InputEvent:
>>  #
>> @@ -975,10 +1007,12 @@
>>  # Since: 2.0
>
> ...2.0.

Same answer: 2.0.

>>  ##
>>  { 'union' : 'InputEvent',
>> -  'data'  : { 'key'     : 'InputKeyEvent',
>> -              'btn'     : 'InputBtnEvent',
>> -              'rel'     : 'InputMoveEvent',
>> -              'abs'     : 'InputMoveEvent' } }
>> +  'base': { 'type': 'InputEventKind' },
>> +  'discriminator': 'type',
>> +  'data'  : { 'key'     : 'InputKeyEventWrapper',
>> +              'btn'     : 'InputBtnEventWrapper',
>> +              'rel'     : 'InputMoveEventWrapper',
>> +              'abs'     : 'InputMoveEventWrapper' } }
>
> But as with that patch, I trust your decision on docs, and the
> conversion itself is sane.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


