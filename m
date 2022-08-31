Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFD55A7CDD
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 14:05:37 +0200 (CEST)
Received: from localhost ([::1]:40222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTMTP-0002E8-QG
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 08:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTMQ1-000770-3W
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 08:02:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTMPu-0008EQ-Cy
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 08:02:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661947317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ggoNbnxpWT4TJekHOFExscEzN+e/FmGu9s5+HZ2c0gU=;
 b=Z1VRGVaKOK1u3wnaKT1SBZi8/VL5og7D1JQ9uhfOQhTaRQCFGKYt6WADE9yuYd5RCNlQzn
 iiiaXWEfObj+ccSchCkb4zwvenVaH5q44LHlk8epMijscA/u6cOPIJ/YJYuRdLyglyPhaE
 IPr7PUP0s8yT2QdXGybBox/Zh0EXHkU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-tbRFlvKwOrW38Co5Y7zGlQ-1; Wed, 31 Aug 2022 08:01:56 -0400
X-MC-Unique: tbRFlvKwOrW38Co5Y7zGlQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2F681C0BDE3;
 Wed, 31 Aug 2022 12:01:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74B59C15BB3;
 Wed, 31 Aug 2022 12:01:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3CE9521E6900; Wed, 31 Aug 2022 14:01:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v1 16/16] RFC: add a generator for qapi's examples
References: <20220830161545.84198-1-victortoso@redhat.com>
 <20220830161545.84198-17-victortoso@redhat.com>
Date: Wed, 31 Aug 2022 14:01:54 +0200
In-Reply-To: <20220830161545.84198-17-victortoso@redhat.com> (Victor Toso's
 message of "Tue, 30 Aug 2022 18:15:45 +0200")
Message-ID: <87ilm8aafh.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Victor Toso <victortoso@redhat.com> writes:

> The goal of this generator is to validate QAPI examples and transform
> them into a format that can be used for 3rd party applications to
> validate their QAPI/QMP introspection.
>
> For each Example section, we parse server and client messages into a
> python dictionary. This step alone has found several ill formatted
> JSON messages in the examples.
>
> The generator outputs another JSON file with all the examples in the
> QAPI module that they came from. This can be used to validate the
> introspection between QAPI/QMP to language bindings.
>
> When used with the POC qapi-go branch, we have found bad QMP messages
> with wrong member names, mandatory members that were missing and
> optional members that were being set with null (not needed).
>
> A simple example of the output format is:
>
>  { "examples": [
>    {
>      "id": "ksuxwzfayw",
>      "client": [
>      {
>        "sequence-order": 1
>        "message-type": "command",
>        "message":
>        { "arguments":
>          { "device": "scratch", "size": 1073741824 },
>          "execute": "block_resize"
>        },
>     } ],
>     "server": [
>     {
>       "sequence-order": 2
>       "message-type": "return",
>       "message": { "return": {} },
>     } ]
>     }
>   ] }
>
> If this idea seems reasonable, we can add python-qemu-qmp to validate
> each message at generation time already.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>

If I understand you correctly, there are two benefits:

1. Mechanical syntax check for examples

   Love it.

2. Can extract examples for use as test cases

   Sounds good to me.  Possible redundancy with existing tests.
   Probably nothing to worry about.

   Can you explain in a bit more detail how the extracted data is (to
   be) used?


