Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7826E34A100
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 06:26:15 +0100 (CET)
Received: from localhost ([::1]:43452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPez8-00007s-Ig
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 01:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPeyJ-00089f-Eq
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 01:25:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPeyG-0008OS-67
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 01:25:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616736318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OC5O5FcX+/tI/b+2/t7fbIKLg4goBFQ+t/hMkSCFFIE=;
 b=Ttt3btimYjhzStgz1EjO7GStkyDxO/sCsxXA2y8HBwYKYBaWggwnae74gqxTpIklAJrG20
 Ikxft/n7y2boLfqntMvuI3bnbBnR6/4T7wnckvY06sqo7KEXOLhx71NxsopSkRzeWrElnU
 kwjureQWoLPG29e/3fP890kzeGaMmx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-eI6oWu_9PkaIm3DK5ZiMLw-1; Fri, 26 Mar 2021 01:25:15 -0400
X-MC-Unique: eI6oWu_9PkaIm3DK5ZiMLw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F519180FCA1;
 Fri, 26 Mar 2021 05:25:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33C5462A33;
 Fri, 26 Mar 2021 05:25:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BED7F11327E1; Fri, 26 Mar 2021 06:25:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 10/28] qapi: Rework name checking in preparation of
 stricter checking
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-11-armbru@redhat.com>
 <bc06289e-87f9-3f44-a004-07c2f6327264@redhat.com>
 <87v99hf60v.fsf@dusky.pond.sub.org>
 <128c8d73-e16c-cc74-4ab8-b7ef7818e0fc@redhat.com>
 <87im5fah92.fsf@dusky.pond.sub.org>
 <6b74a262-10c1-a857-00dd-736d29eec23f@redhat.com>
Date: Fri, 26 Mar 2021 06:25:08 +0100
In-Reply-To: <6b74a262-10c1-a857-00dd-736d29eec23f@redhat.com> (John Snow's
 message of "Thu, 25 Mar 2021 13:48:34 -0400")
Message-ID: <87a6qqbi6j.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: michael.roth@amd.com, qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 3/25/21 2:18 AM, Markus Armbruster wrote:
[...]
>> Apropos qapi-gen testing scripts.  I have scripts to show me how the
>> generated code changes along the way in a branch.  They evolved over a
>> long time, and try to cope with changes in the tree that are hardly
>> relevant anymore.  By now, they could quite possibly make Frankenstein
>> recoil in horror.
>> 
>
> Are they in the tree?

No, because in their current state, they are incomprehensible *and* need
frequent tinkering.

>                       Largely if the generated code changes it's 
> invisible to me, but I rely heavily on the unit tests. I guess maybe if 
> they are not in a state to upstream it might not be worth the hassle to 
> clean them, but I don't know.

The negative unit tests are fairly comprehensive, and guard against
screwing up error path reasonably well.

The positive unit tests compare the frontend state dumped by
test-qapi.py, and compile-test the generated code.  Reasonable
protection against frontend screwups.  Some protection against backend
screwups.  Plenty of unwanted code generation changes can go undetected.

A tool to show generated code changes for review is useful, and having
such a tool in the tree would be nice.

>> As a secondary purpose, the scripts show me how output of pycodestyle-3
>> and pylint change.  This would be uninteresting if the code in master
>> was clean against a useful configuration of these tools.  Your work has
>> been making it less interesting.
>> 
>
> --js


