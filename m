Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56C631CDDD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:20:47 +0100 (CET)
Received: from localhost ([::1]:35562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC35i-0002Rf-K0
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:20:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lC308-0004js-JU
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:15:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lC305-0001jy-QD
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613492095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fOaUd/Ktde6kba7r+9VT2dpepBBSGwXtXllR+Uc+xIM=;
 b=gBhAoU0AHK6whInrxaF7FWXA7gwP3ZLAcVWFykxjITUWxF8QjK0xLyOqn5vC4KywPrU2iK
 QhFpyQrq5BMFv/CBv2Vgj8qQEOvQbTg/hAxQ7zZVE88docxXq4JRVLRHs9HxtZrOl41i47
 v2fjGaXMK8wqsHzix+s2rJH9Bko3ElE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-fNIZRkdfNpyXHigK_j4ANg-1; Tue, 16 Feb 2021 11:14:53 -0500
X-MC-Unique: fNIZRkdfNpyXHigK_j4ANg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B56C8107ACE6
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 16:14:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-100.ams2.redhat.com
 [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85B576F7E8;
 Tue, 16 Feb 2021 16:14:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DD1D1113865F; Tue, 16 Feb 2021 17:14:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 6/6] tests/qapi-schema: Test cases for aliases
References: <20210211183118.422036-1-kwolf@redhat.com>
 <20210211183118.422036-7-kwolf@redhat.com>
 <87eehgrqn9.fsf@dusky.pond.sub.org>
 <20210216153158.GB5282@merkur.fritz.box>
Date: Tue, 16 Feb 2021 17:14:50 +0100
In-Reply-To: <20210216153158.GB5282@merkur.fritz.box> (Kevin Wolf's message of
 "Tue, 16 Feb 2021 16:31:58 +0100")
Message-ID: <87im6sq9ad.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Kevin Wolf <kwolf@redhat.com> writes:

> Am 16.02.2021 um 16:14 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> [...]
>> > diff --git a/tests/qapi-schema/alias-name-bad-type.err b/tests/qapi-schema/alias-name-bad-type.err
>> > new file mode 100644
>> > index 0000000000..489f45ff9b
>> > --- /dev/null
>> > +++ b/tests/qapi-schema/alias-name-bad-type.err
>> > @@ -0,0 +1,2 @@
>> > +alias-name-bad-type.json: In struct 'AliasStruct0':
>> > +alias-name-bad-type.json:1: alias member 'name' requires a string name
>> 
>> Would "'aliases' member 'name'..." be more consistent?
>
> 'aliases' is a list, not a single alias definition, so technically it
> would have to be "'aliases' member member 'name'...", which I feel is a
> bit too confusing.

Indeed.

I think glossing over the list is excusable.

> I think I have consistently used "alias" for "'aliases' member"
> everywhere, though. At least, that was the intention.

A different way of glossing over details.  Should do as well.  I'll
double-check consistency.


