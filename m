Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27FA34633A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:46:52 +0100 (CET)
Received: from localhost ([::1]:40888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOjF5-0005Pu-Qn
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOjCn-0004bc-EQ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:44:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOjCi-0007af-8n
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:44:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616514262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ULNSqUR4JM1pPoBOdER9Y5aKG67NU7qxotPdl/HC+/U=;
 b=Gd0+LNowoGNAwSTDeOsgJJszHIyqIC45QKtgRR05Ib2FmDmCx1LE1BfKa8niVhSl0TEnTj
 Wtpa6+1PyYoQbtHvObJNt/+8y6sOW0csUX71D+5J7mVoUc62DJPykb3Qfmu9R2I0irIykf
 Xi20y/Dh+kGRgH0KgRe1LYONdzsny3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-pvyFE44yM3mQxgiurC8D-A-1; Tue, 23 Mar 2021 11:44:21 -0400
X-MC-Unique: pvyFE44yM3mQxgiurC8D-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 646781005530;
 Tue, 23 Mar 2021 15:44:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EDD861F5E;
 Tue, 23 Mar 2021 15:44:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 13EDB11327E1; Tue, 23 Mar 2021 16:44:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 06/28] tests/qapi-schema: Tweak to demonstrate buggy
 member name check
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-7-armbru@redhat.com>
 <f72dbb52-059e-f773-63ad-385b9c9d9e6c@redhat.com>
Date: Tue, 23 Mar 2021 16:44:15 +0100
In-Reply-To: <f72dbb52-059e-f773-63ad-385b9c9d9e6c@redhat.com> (John Snow's
 message of "Tue, 23 Mar 2021 09:20:04 -0400")
Message-ID: <87im5hq3hs.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: michael.roth@amd.com, qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 3/23/21 5:40 AM, Markus Armbruster wrote:
>> Member name 'u' and names starting with 'has-' or 'has_' are reserved
>> for the generator.  check_type() enforces this, covered by tests
>> reserved-member-u and reserved-member-has.
>> These tests neglect to cover optional members, where the name starts
>> with '*'.  Tweak reserved-member-u to fix that.
>> This demonstrates the reserved member name check is broken for
>> optional members.  The next commit will fix it.
>> 
>
> The test without an optional member goes away. Do we lose coverage?
> (Do we care?)

Up to a point :)  We do try to cover all failure modes, just not in all
contexts.

The test is about this error:

         if c_name(key, False) == 'u' or c_name(key, False).startswith('has_'):
             raise QAPISemError(info, "%s uses reserved name" % key_source)

Full matrix: (is "u", starts with "has_") x (optional, not optional).

Instead of covering all four cases, we cover two: non-optional "u"
(reserved-member-u) and non-optional "has-" (reserved-member-has).

The patch flips the former to optional.  The latter still covers
non-optional.

Good enough, I think.

Do you feel I should point to reserved-member-has in the commit message?


