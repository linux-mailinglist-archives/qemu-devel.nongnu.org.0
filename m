Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F83286FE8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 09:53:27 +0200 (CEST)
Received: from localhost ([::1]:56720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQQju-0002He-7k
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 03:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kQQiz-0001sP-1w
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 03:52:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kQQiw-00016Z-Q7
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 03:52:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602143545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zeFgKOqyd59D6PpX1KEynLSjbtuAPVD2wu0jwTRYm6o=;
 b=J8LQMF9xzRt3SlQIv0q72zcgyM/fVgk7FzEwdEsz4VvIaX7w9H554X3XOGwjZQ/5j3DhF4
 5z+lHhAJ2G7RZoS+XTMAi1yYHFEyJk2AJnTK2vqfB80yO2Mahv8gvr5aNMJROFNl46Lghp
 s63YJJUxy7vf3XCS0Um1bQcsBFYPYfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-z1Jgg2YXOparmSUpyr_opg-1; Thu, 08 Oct 2020 03:52:23 -0400
X-MC-Unique: z1Jgg2YXOparmSUpyr_opg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E48F425D0
 for <qemu-devel@nongnu.org>; Thu,  8 Oct 2020 07:52:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F5496715F;
 Thu,  8 Oct 2020 07:52:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D0AC111329C1; Thu,  8 Oct 2020 09:52:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v5 23/36] qapi/commands.py: enable checking with mypy
References: <20201005195158.2348217-1-jsnow@redhat.com>
 <20201005195158.2348217-24-jsnow@redhat.com>
 <87r1qae07b.fsf@dusky.pond.sub.org>
 <145205fe-346b-b382-1cc6-a888dbcf2f65@redhat.com>
Date: Thu, 08 Oct 2020 09:52:20 +0200
In-Reply-To: <145205fe-346b-b382-1cc6-a888dbcf2f65@redhat.com> (John Snow's
 message of "Wed, 7 Oct 2020 11:49:57 -0400")
Message-ID: <87mu0x2lzf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 02:56:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 10/7/20 7:37 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>   scripts/qapi/mypy.ini | 5 -----
>>>   1 file changed, 5 deletions(-)
>>>
>>> diff --git a/scripts/qapi/mypy.ini b/scripts/qapi/mypy.ini
>>> index 5df11e53fd1..8ab9ac52cc4 100644
>>> --- a/scripts/qapi/mypy.ini
>>> +++ b/scripts/qapi/mypy.ini
>>> @@ -4,11 +4,6 @@ strict_optional = False
>>>   disallow_untyped_calls = False
>>>   python_version = 3.6
>>>   -[mypy-qapi.commands]
>>> -disallow_untyped_defs = False
>>> -disallow_incomplete_defs = False
>>> -check_untyped_defs = False
>>> -
>>>   [mypy-qapi.error]
>>>   disallow_untyped_defs = False
>>>   disallow_incomplete_defs = False
>> The equivalent change for  events.py you squashed into the commit
>> adding
>> type hints.  Any particular reason for not doing the same here?
>> 
>
> Just making my life easier for re-arranging commits and rebasing. By
> separating them out whenever I had > 1 fix patch prior, I was able to 
> freely re-arrange and re-order the prior fix patches.
>
> They can be squashed on commit if desired, but for my own sake and
> inability to predict review comments, they are separate.

I only asked because some are separate, and some are not.

Squashing on commit is an easy way toward consistency here.


