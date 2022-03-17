Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B29E4DC79F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 14:32:40 +0100 (CET)
Received: from localhost ([::1]:34040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUqF2-0007XG-Bh
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 09:32:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUqBm-0006rJ-9Y
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 09:29:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUqBj-0007UP-CI
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 09:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647523750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+6ZMYoQ633sEwp2UzX0uZ83vrjJi6jZOzmLBoE8/ozI=;
 b=Yl5LVoCfiXsBIqZN0m88rVBRCF7SWGEl6w65yDHQQHJ2jVsboCbDf8Ck672jK4SPeOt/uI
 uR2YqAVAUYhGLeq8Fa3gutYOEuLjx8+3tIcZ/kjPe3tSEuhxqbR3LqNKknFYNlbf/aROc+
 Q07f/jcxhg4PtCq/dTNkZW3OKowsbJo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-vOM0FPnwNk-RxWv_dkhX9g-1; Thu, 17 Mar 2022 09:29:07 -0400
X-MC-Unique: vOM0FPnwNk-RxWv_dkhX9g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E7F1299E756;
 Thu, 17 Mar 2022 13:29:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE6ED46518B;
 Thu, 17 Mar 2022 13:29:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A4A4221E66D2; Thu, 17 Mar 2022 14:29:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/3] hw/display: Allow vga_common_init() to return errors
References: <20220316132402.1190346-1-thuth@redhat.com>
 <20220316132402.1190346-3-thuth@redhat.com>
 <64353530-4488-8820-c58c-a5e104e93b4b@gmail.com>
 <e5e03938-d602-c928-07ef-da6486fb99b0@redhat.com>
 <87bky6ugmx.fsf@pond.sub.org>
 <8e608283-b5d2-91d9-26b3-372c57422a30@redhat.com>
 <87o825qb6y.fsf@pond.sub.org>
 <79b983e8-40aa-35b6-cdf4-6cb0571c37e5@redhat.com>
Date: Thu, 17 Mar 2022 14:29:05 +0100
In-Reply-To: <79b983e8-40aa-35b6-cdf4-6cb0571c37e5@redhat.com> (Thomas Huth's
 message of "Thu, 17 Mar 2022 13:32:39 +0100")
Message-ID: <87lex8g126.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 17/03/2022 08.40, Markus Armbruster wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>=20
>>> On 16/03/2022 15.16, Markus Armbruster wrote:
>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>
>>>>> On 16/03/2022 14.32, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>>> On 16/3/22 14:24, Thomas Huth wrote:
>>>>>>> The vga_common_init() function currently cannot report errors to it=
s
>>>>>>> caller. But in the following patch, we'd need this possibility, so
>>>>>>> let's change it to take an "Error **" as parameter for this.
>>>>>>>
>>>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>

[...]

>>>> Historical reasons.  We deviated from GLib here only to find out that
>>>> the deviation leads to awkward code.  I flipped the guidance in commit
>>>> e3fe3988d7 "error: Document Error API usage rules" (2020-07-10).  A lo=
t
>>>> of old code remains.
>>>
>>> Hmm, you should add some BiteSizeTasks to our issue tracker then to
>>> get this fixed, otherwise people like me will copy-n-paste the bad
>>> code examples that are all over the place!
>>
>> I'm not sure the issue tracker is a good fit here.  An issue tracker
>> works best when you use it to track units of work that can be completed
>> in one go.  An issue then tracks progress of its unit of work.
>
> That's why I wrote "*some* BiteSizeTasks", not "one BitSizeTask"
> ... of course you've got to break it down for unexperienced new
> developers first, e.g. by subsystem. I did that for example for the
> indentation clean up tasks:
>
>  https://gitlab.com/qemu-project/qemu/-/issues/376
>  https://gitlab.com/qemu-project/qemu/-/issues/371
>  https://gitlab.com/qemu-project/qemu/-/issues/372

Okay, I get you now.

When I flipped the guidance, I also updated a substantial amount of code
to honor the rule:

    Subject: [PATCH v4 00/45] Less clumsy error checking
    Date: Tue,  7 Jul 2020 18:05:28 +0200

    [...]

    This series adopts the GError rule (in writing), and updates a
    substantial amount of code to honor the rule.  Cuts the number of
    error_propagate() calls nearly by half.  The diffstat speaks for
    itself.

    https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg02580.html

The "substantial amount of code" were a few subsystems with many, many
callers.  What remains, as far as I can tell, is many functions with few
callers each.

If I run into a bite-sized conversion task I'd like a volunteer to
tackle, I should file an issue for it.

But collecting the everything to be converted, then partitioning it into
sane parts (*many* parts), then creating an issue for each, is not going
to happen.  Nobody got time for that.

>> This isn't a unit, it's more like a class of units.
>> I added an item to https://wiki.qemu.org/ToDo/CodeTransitions for
>> now.
>
> Thanks, but I doubt that this will help much - the description is
> really terse, and for anybody who is not involved in this email thread
> here, I guess it's hard for them to figure out the related parts in
> the include/qapi/error.h on their own ... so if you really want
> somebody else to work on this topic, I think you have to elaborate
> there a little bit (e.g. by giving an example in-place).

"as explained in include/qapi/error.h" points to the full explanation,
which includes examples.


