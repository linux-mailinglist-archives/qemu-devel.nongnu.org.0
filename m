Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC4B4E3BE9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:48:10 +0100 (CET)
Received: from localhost ([::1]:50968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWb7a-0006Ym-0f
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:48:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nWb5x-0005Do-4w
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:46:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nWb5v-00021x-BB
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647942386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gp7GFF3gplQjwoS2ZAj30exrVZN4fOeCJQCcQprq2ko=;
 b=S9/pw3KZf/U7zto2gJvZb0e1eDnelhUR7TBwM3WpjNKDIF6erZxOrLgUtS7pPv47kY6HWh
 2AsGUtzMG6MDJG7XlsfAQOsRRnHTE0xxfVc5yj4Y6FfrdQSiG1sVvOXgzdysXIVttTPHFO
 pCOJwZtAJdvmazOPUXGdAlVthxdjkko=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-fJZaHPy6OPWT2rKUx1LQ-Q-1; Tue, 22 Mar 2022 05:46:23 -0400
X-MC-Unique: fJZaHPy6OPWT2rKUx1LQ-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C9462999B4B;
 Tue, 22 Mar 2022 09:46:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBF74400E881;
 Tue, 22 Mar 2022 09:46:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C7E9221E6742; Tue, 22 Mar 2022 10:46:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/3] qapi-schema: test: add a qapi-schema-test for array
 alternates
References: <20220321164243.200569-1-pbonzini@redhat.com>
 <20220321164243.200569-3-pbonzini@redhat.com>
Date: Tue, 22 Mar 2022 10:46:21 +0100
In-Reply-To: <20220321164243.200569-3-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 21 Mar 2022 17:42:42 +0100")
Message-ID: <87a6dijp5e.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Check that conflicts among array alternates are detected correctly.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/qapi-schema/alternate-conflict-lists.err  | 2 ++
>  tests/qapi-schema/alternate-conflict-lists.json | 6 +++++
>  tests/qapi-schema/alternate-conflict-lists.out  | 0
>  tests/qapi-schema/meson.build                   | 1 +
>  4 files changed, 8 insertions(+)
>  create mode 100644 tests/qapi-schema/alternate-conflict-lists.err
>  create mode 100644 tests/qapi-schema/alternate-conflict-lists.json
>  create mode 100644 tests/qapi-schema/alternate-conflict-lists.out
>
> diff --git a/tests/qapi-schema/alternate-conflict-lists.err b/tests/qapi-schema/alternate-conflict-lists.err
> new file mode 100644
> index 0000000000..288b75a2ff
> --- /dev/null
> +++ b/tests/qapi-schema/alternate-conflict-lists.err
> @@ -0,0 +1,2 @@
> +alternate-conflict-lists.json: In alternate 'Alt':
> +alternate-conflict-lists.json:5: branch 'two' can't be distinguished from 'one'

Needs a trivial fixup:

-alternate-conflict-lists.json:5: branch 'two' can't be distinguished from 'one'
+alternate-conflict-lists.json:4: branch 'two' can't be distinguished from 'one'

Happy to apply it in my tree.

> diff --git a/tests/qapi-schema/alternate-conflict-lists.json b/tests/qapi-schema/alternate-conflict-lists.json
> new file mode 100644
> index 0000000000..90710da115
> --- /dev/null
> +++ b/tests/qapi-schema/alternate-conflict-lists.json
> @@ -0,0 +1,6 @@
> +# Two lists conflict even if their inner types would be compatible
> +{ 'struct': 'One',
> +  'data': { 'name': 'str' } }
> +{ 'alternate': 'Alt',
> +  'data': { 'one': [ 'int' ],
> +            'two': [ 'str' ] } }
> diff --git a/tests/qapi-schema/alternate-conflict-lists.out b/tests/qapi-schema/alternate-conflict-lists.out
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
> index caf0791ba8..c18dd7d02f 100644
> --- a/tests/qapi-schema/meson.build
> +++ b/tests/qapi-schema/meson.build
> @@ -11,6 +11,7 @@ schemas = [
>    'alternate-conflict-dict.json',
>    'alternate-conflict-enum-bool.json',
>    'alternate-conflict-enum-int.json',
> +  'alternate-conflict-lists.json',
>    'alternate-conflict-string.json',
>    'alternate-conflict-bool-string.json',
>    'alternate-conflict-num-string.json',

With the fixup:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


