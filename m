Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BE0346ACC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 22:09:09 +0100 (CET)
Received: from localhost ([::1]:59410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOoGy-0003WH-5W
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 17:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOoG1-0002A0-1m
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:08:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOoFx-0006Rc-Uy
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616533684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LyBkYnhWB4qlraJxJ/gnFB7n+CfROoSxQCdx9FrCgcU=;
 b=gc5KWAsVO/6UpJxRmfbKWsnQ1cpc245aVsGAW+tRJOPf2fzU1MqakkAfSFwTeDrHBjrDGP
 s+UMY9OSxBHMtw3m5S3ushO5DCUCH85yPNhpljuR2xeXSUJk6Vck4UyPwP66aKJVb8esdi
 GnXV3NVg6Amug8W3XlEdgOEi1ooxuHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-J-PjbyCjMw-suNE3FYqc5w-1; Tue, 23 Mar 2021 17:08:01 -0400
X-MC-Unique: J-PjbyCjMw-suNE3FYqc5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1EDE801817;
 Tue, 23 Mar 2021 21:08:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E9BD50DD0;
 Tue, 23 Mar 2021 21:07:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A746511327E1; Tue, 23 Mar 2021 22:07:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 08/28] qapi: Support flat unions tag values with leading
 digit
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-9-armbru@redhat.com>
 <b84d5e36-de4a-9178-43d1-7a9e489e7b6c@redhat.com>
 <8735wlq1x8.fsf@dusky.pond.sub.org>
Date: Tue, 23 Mar 2021 22:07:55 +0100
In-Reply-To: <8735wlq1x8.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Tue, 23 Mar 2021 17:18:11 +0100")
Message-ID: <87y2edlgt0.fsf@dusky.pond.sub.org>
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
Cc: michael.roth@amd.com, John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> John Snow <jsnow@redhat.com> writes:
>
>> On 3/23/21 5:40 AM, Markus Armbruster wrote:
>>> Flat union tag values get checked twice: as enum member name, and as
>>> union branch name.  The former accepts leading digits, the latter
>>> doesn't.  The restriction feels arbitrary.  Skip the latter check.
>>>
>>> This can expose c_name() to input it can't handle: a name starting
>>> with a digit.  Improve it to return a valid C identifier for any
>>> input.
>>>
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>
>> Anything in particular inspire this?
>
> Just a desire for keeping things simple.  "Any enum type works as
> discriminator" is simpler than "any enum works, but branches
> corresponding to enum values starting with a digit cannot have members".
> Let me elaborate.
>
> This works:
>
>     {'enum': 'Enu', 'data': ['0', 'eins', '2']}
>     {'struct': 'St', 'data': {'s': 'str'}}
>     {'union': 'Uni',
>      'base': {'type': 'Enu'},
>      'discriminator': 'type',
>      'data': {
>        'eins': 'St'}}
>
> But if you change the last line to
>
>        '0': 'St'}}
>
> you get told off:
>
>     scripts/qapi-gen.py: /dev/stdin: In union 'Uni':
>     /dev/stdin:3: 'data' member '0' has an invalid name

Improved commit message:

    qapi: Permit flat union members for any tag value

    Flat union branch names match the tag enum's member names.  Omitted
    branches default to "no members for this tag value".

    Branch names starting with a digit get rejected like "'data' member
    '0' has an invalid name".  However, omitting the branch works.

    This is because flat union tag values get checked twice: as enum
    member name, and as union branch name.  The former accepts leading
    digits, the latter doesn't.

    Branches whose names start with a digit therefore cannot have members.
    Feels wrong.  Get rid of the restriction by skipping the latter check.

    This can expose c_name() to input it can't handle: a name starting
    with a digit.  Improve it to return a valid C identifier for any
    input.

    Signed-off-by: Markus Armbruster <armbru@redhat.com>

[...]


