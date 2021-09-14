Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4CF40A65A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 07:58:20 +0200 (CEST)
Received: from localhost ([::1]:53356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ1SV-0000vz-HH
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 01:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ1RU-0007m6-1k
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 01:57:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ1RR-0000go-KW
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 01:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631599032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UW95OWBqZqX6gyn2G8pc4/kLKSKGz79r/HqoC2z82wM=;
 b=Vh4ucpTCJaWdPYk8veiG6Qp4Ec/FEDeN09bADhoD4wKXZmwrW5HHV/xV60nUMeYA/kC/12
 v270Cye8NM3A8yfVt+tPZmEQliIgSiCSsUVtBZKJxqCZP08WXHXuLLHkAXPgYYp7YB3bKB
 zFGlvI1z4wp2qdAoZovea62lH7gYcCk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-d6tkrrjKNYWqmgF47fRjVg-1; Tue, 14 Sep 2021 01:57:09 -0400
X-MC-Unique: d6tkrrjKNYWqmgF47fRjVg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A478802B9F
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 05:57:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E1DB66FFF;
 Tue, 14 Sep 2021 05:57:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B4D9F113865F; Tue, 14 Sep 2021 07:57:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 21/22] qapi: Drop simple unions
References: <20210913123932.3306639-1-armbru@redhat.com>
 <20210913123932.3306639-22-armbru@redhat.com>
 <20210913183850.6sfxrf7cvqrgvqm5@redhat.com>
Date: Tue, 14 Sep 2021 07:57:03 +0200
In-Reply-To: <20210913183850.6sfxrf7cvqrgvqm5@redhat.com> (Eric Blake's
 message of "Mon, 13 Sep 2021 13:38:50 -0500")
Message-ID: <87k0jjg0nk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On Mon, Sep 13, 2021 at 02:39:31PM +0200, Markus Armbruster wrote:
>> Simple unions predate flat unions.  Having both complicates the QAPI
>> schema language and the QAPI generator.  We haven't been using simple
>> unions in new code for a long time, because they are less flexible and
>> somewhat awkward on the wire.
>> 
>> The previous commits eliminated simple union from the tree.  Now drop
>> them from the QAPI schema language entirely, and update mentions of
>> "flat union" to just "union".
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  docs/devel/qapi-code-gen.rst                  | 125 ++++--------------
>>  scripts/qapi/expr.py                          |  21 +--
>>  scripts/qapi/schema.py                        | 101 +++-----------
>>  .../qapi-schema/flat-union-array-branch.json  |   2 +-
>>  tests/qapi-schema/flat-union-empty.json       |   2 +-
>>  tests/qapi-schema/flat-union-int-branch.json  |   2 +-
>>  tests/qapi-schema/flat-union-no-base.err      |   2 +-
>>  tests/qapi-schema/flat-union-no-base.json     |   2 +-
>>  tests/qapi-schema/qapi-schema-test.json       |   2 +-
>>  tests/qapi-schema/reserved-member-u.json      |   2 +-
>>  tests/qapi-schema/union-base-empty.json       |   2 +-
>>  .../union-base-no-discriminator.err           |   2 +-
>>  .../union-base-no-discriminator.json          |   2 +-
>>  13 files changed, 62 insertions(+), 205 deletions(-)
>
> Whee!  What a fun ride!

3-2-1-gone!  And good riddance :)

> Reviewed-by: Eric Blake <eblake@redhat.com>

Thank you for your quick review!


