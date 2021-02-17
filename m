Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B629031D95C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 13:26:29 +0100 (CET)
Received: from localhost ([::1]:54378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCLuW-0001LP-Qn
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 07:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lCLrt-0008IM-Ng
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:23:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lCLrr-0001Wm-9x
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:23:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613564621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ck7ZyuX8zuuYttT6uOY59rxz59GKxUFmJHy1jdC5BnY=;
 b=Sy4e9CQanbPuEhyA4vJ4X24yP7NpSgbOyntByYhddCD130Bs/gFnrylaCKh/dhA1gPyf0h
 vASUrabkK3DEpXwda22PmXRrdYIiKYf5U1PYckXw4VnRjsZf4jDn7zCcs6Tv3Zal4dkQgm
 SMfDPl/EIFteRse5O4YiaXeX8SOfMtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-zFajqsbRMIGaefozPBOn1w-1; Wed, 17 Feb 2021 07:23:38 -0500
X-MC-Unique: zFajqsbRMIGaefozPBOn1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0109080196C
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:23:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C655E60DA1;
 Wed, 17 Feb 2021 12:23:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4AD83113860F; Wed, 17 Feb 2021 13:23:35 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 6/6] tests/qapi-schema: Test cases for aliases
References: <20210211183118.422036-1-kwolf@redhat.com>
 <20210211183118.422036-7-kwolf@redhat.com>
 <87eehgrqn9.fsf@dusky.pond.sub.org>
 <20210216153158.GB5282@merkur.fritz.box>
 <87im6sq9ad.fsf@dusky.pond.sub.org>
Date: Wed, 17 Feb 2021 13:23:35 +0100
In-Reply-To: <87im6sq9ad.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Tue, 16 Feb 2021 17:14:50 +0100")
Message-ID: <878s7mvq60.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Kevin Wolf <kwolf@redhat.com> writes:
>
>> Am 16.02.2021 um 16:14 hat Markus Armbruster geschrieben:
>>> Kevin Wolf <kwolf@redhat.com> writes:
>>> 
>>> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>>> [...]
>>> > diff --git a/tests/qapi-schema/alias-name-bad-type.err b/tests/qapi-schema/alias-name-bad-type.err
>>> > new file mode 100644
>>> > index 0000000000..489f45ff9b
>>> > --- /dev/null
>>> > +++ b/tests/qapi-schema/alias-name-bad-type.err
>>> > @@ -0,0 +1,2 @@
>>> > +alias-name-bad-type.json: In struct 'AliasStruct0':
>>> > +alias-name-bad-type.json:1: alias member 'name' requires a string name
>>> 
>>> Would "'aliases' member 'name'..." be more consistent?
>>
>> 'aliases' is a list, not a single alias definition, so technically it
>> would have to be "'aliases' member member 'name'...", which I feel is a
>> bit too confusing.
>
> Indeed.
>
> I think glossing over the list is excusable.
>
>> I think I have consistently used "alias" for "'aliases' member"
>> everywhere, though. At least, that was the intention.
>
> A different way of glossing over details.  Should do as well.  I'll
> double-check consistency.

I did, and it looks okay:

    $ grep "'alias" *err
    alias-bad-type.err:alias-bad-type.json:1: 'aliases' members must be objects

Okay; we are talking about members of array 'aliases' here.

    alias-missing-source.err:alias-missing-source.json:1: 'aliases' member misses key 'source'

Likewise.

    alias-unknown-key.err:alias-unknown-key.json:1: 'aliases' member has unknown key 'known'

Likewise.

    aliases-bad-type.err:aliases-bad-type.json:1: 'aliases' must be an array

Okay; we are talking about 'aliases'.

    double-type.err:Valid keys are 'aliases', 'base', 'data', 'features', 'if', 'struct'.
    unknown-expr-key.err:Valid keys are 'aliases', 'base', 'data', 'features', 'if', 'struct'.

Okay.


