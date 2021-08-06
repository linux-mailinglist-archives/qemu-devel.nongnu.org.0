Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC51D3E2394
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 08:55:07 +0200 (CEST)
Received: from localhost ([::1]:46214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBtl4-0001Of-U5
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 02:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBtj8-0008QL-4n
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:53:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBtj6-0007Uo-QY
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628232784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TSzC0KqG3enRV3fn6ZNGxzsWbQ/tIMIA95kl1e3U9og=;
 b=BfGtaxIi8r5/xfIl/qFlAdnjZ7Y8qFval3AY7LsNhi4myFfgFonD15W1ST+inzGRgwDK/K
 4wgAgeyrrao8wHLC3jwWZrl7onCWXke6bXl3dW5rlPR2f1/H08AD2LK8DJHF/Q1N5mKhEH
 QzUGHrAKmCVl3wvzYoC4dH3k8pwdXwA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-EzF1F2ohMGSEfxF4vz_1Sw-1; Fri, 06 Aug 2021 02:53:02 -0400
X-MC-Unique: EzF1F2ohMGSEfxF4vz_1Sw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB7551006C80
 for <qemu-devel@nongnu.org>; Fri,  6 Aug 2021 06:53:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38C891036D27;
 Fri,  6 Aug 2021 06:52:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C6A4611380A0; Fri,  6 Aug 2021 08:52:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v7 09/10] qapi: add 'not' condition operation
References: <20210804083105.97531-1-marcandre.lureau@redhat.com>
 <20210804083105.97531-10-marcandre.lureau@redhat.com>
Date: Fri, 06 Aug 2021 08:52:56 +0200
In-Reply-To: <20210804083105.97531-10-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 4 Aug 2021 12:31:04 +0400")
Message-ID: <87czqr12uv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> For the sake of completeness, introduce the 'not' condition.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---

[...]

> diff --git a/tests/qapi-schema/enum-if-invalid.err b/tests/qapi-schema/en=
um-if-invalid.err
> index b96d94c48a..3bb84075a9 100644
> --- a/tests/qapi-schema/enum-if-invalid.err
> +++ b/tests/qapi-schema/enum-if-invalid.err
> @@ -1,3 +1,3 @@
>  enum-if-invalid.json: In enum 'TestIfEnum':
>  enum-if-invalid.json:2: 'if' condition has unknown key 'val'
> -Valid keys are 'all', 'any'.
> +Valid keys are 'all', 'any', 'not'.
> diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/=
qapi-schema-test.json
> index 5e3dbc0f72..1b3311ce89 100644
> --- a/tests/qapi-schema/qapi-schema-test.json
> +++ b/tests/qapi-schema/qapi-schema-test.json
> @@ -244,7 +244,7 @@
>    'if': { 'all': ['defined(TEST_IF_ALT)', 'defined(TEST_IF_STRUCT)'] } }
> =20
>  { 'command': 'test-if-alternate-cmd', 'data': { 'alt-cmd-arg': 'TestIfAl=
ternate' },
> -  'if': { 'all': ['defined(TEST_IF_ALT)'] } }
> +  'if': { 'all': ['defined(TEST_IF_ALT)', {'not': 'defined(TEST_IF_NOT_A=
LT)'}] } }

Easier to read:

   { 'command': 'test-if-alternate-cmd',
     'data': { 'alt-cmd-arg': 'TestIfAlternate' },
     'if': { 'all': ['defined(TEST_IF_ALT)',
                     {'not': 'defined(TEST_IF_NOT_ALT)'}] } }

Done in my tree.

> =20
>  { 'command': 'test-if-cmd',
>    'data': {

[...]


