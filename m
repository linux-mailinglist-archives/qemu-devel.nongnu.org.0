Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F97E31CD5C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:59:43 +0100 (CET)
Received: from localhost ([::1]:34864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC2lK-00040W-MJ
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lC2ju-00034g-Bn
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:58:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lC2jq-0005PB-Sp
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:58:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613491088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZfJCOzM735mOTVqfc3OrjygL3YpEfPuHnEL/9CgrBRM=;
 b=Nn+mvDtWZrIO3Zw8mqdWPX3YZiKnmJWs2daEB2TBNsQcqyZf38yYCQcjMWWRMiM0iq0WpD
 lwJdGzYovF8BsqZDxBMQ7gM9TxS8tZsNVRLeWiMiT1mTkVMeaVD2yYqhf0M8Zoq5c8aF73
 p6S5cJnQv0073/WegF1cGtUGjDUOmVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-evwU26fCMeistt1QeCmS-w-1; Tue, 16 Feb 2021 10:58:05 -0500
X-MC-Unique: evwU26fCMeistt1QeCmS-w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F16486A06A;
 Tue, 16 Feb 2021 15:58:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-100.ams2.redhat.com
 [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D91CE19D6C;
 Tue, 16 Feb 2021 15:58:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5DD79113865F; Tue, 16 Feb 2021 16:58:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 01/19] qapi: Replace List[str] with Sequence[str] for
 ifcond
References: <20210216021809.134886-1-jsnow@redhat.com>
 <20210216021809.134886-2-jsnow@redhat.com>
 <87h7mcpflg.fsf@dusky.pond.sub.org>
 <cbe912f8-ede2-870c-1ad6-a8080840b374@redhat.com>
Date: Tue, 16 Feb 2021 16:58:02 +0100
In-Reply-To: <cbe912f8-ede2-870c-1ad6-a8080840b374@redhat.com> (John Snow's
 message of "Tue, 16 Feb 2021 10:19:42 -0500")
Message-ID: <87v9asqa2d.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 2/16/21 3:43 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> It does happen to be a list (as of now), but we can describe it in more
>>> general terms with no loss in accuracy to allow tuples and other
>>> constructs.
>>>
>>> In the future, we can write "ifcond: Sequence[str] = ()" as a default
>>> parameter, which we could not do with a Mutable type like a List.
>> Well, we could write "= []", but we shouldn't.  Worth a commit
>> message
>> tweak?
>> 
>
> It would be funny to leave it in to see if anyone tries to disprove
> me, and in the act of disproving me, learns for themselves why you
> "can't" do that. Rite of passage for Python programming.
>
> Jokes aside:
>
> "which we could not do ^safely^ with a Mutable type like a List."

Works for me.

> If that warrants further exposition by Professor Snow:
>
> "(Unsafe due to how Python initializes defaults, see
> https://docs.python-guide.org/writing/gotchas/#mutable-default-arguments)"

I can add that if you prefer.

> I leave it to your discretion.
>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>> 
>
> These are worth more than BTC!

;)


