Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF3D69F8F7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 17:27:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUrwZ-000321-M0; Wed, 22 Feb 2023 11:26:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUrwX-00031p-H6
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:26:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUrwU-0005Ly-RN
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:26:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677083165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EbvUeZQOJx/ckOVmw01cxDMv3OFhF6bj3IBKBQBoLJg=;
 b=DP3Tad+zjW98yPKv025r2OO0QcxEjXttY795y/uc3J4d6XvA10ATJDkmfacNthoDFGujNZ
 ZOCYXnib8FOoMc0WtPhJQ4uRghCwvbOImPkxRMqfvZEdT1IYL0L1Q5MY8NU0EVK6g2+tGJ
 r5JK9DpWKJQZ8+AfA8xZimcDsAnmHFA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-k9yqqk2MMFyYUhokhNjHUg-1; Wed, 22 Feb 2023 11:26:02 -0500
X-MC-Unique: k9yqqk2MMFyYUhokhNjHUg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A85EF181E3EF;
 Wed, 22 Feb 2023 16:26:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 748BB2026D3E;
 Wed, 22 Feb 2023 16:26:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4E4B321E6A1F; Wed, 22 Feb 2023 17:26:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  jsnow@redhat.com,  peter.maydell@linaro.org,
 thuth@redhat.com,  alex.bennee@linaro.org,  berrange@redhat.com
Subject: Re: [PATCH 03/10] meson: prefer 'sphinx-build' to 'sphinx-build-3'
References: <20230222143752.466090-1-pbonzini@redhat.com>
 <20230222143752.466090-4-pbonzini@redhat.com>
Date: Wed, 22 Feb 2023 17:26:00 +0100
In-Reply-To: <20230222143752.466090-4-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Wed, 22 Feb 2023 15:37:45 +0100")
Message-ID: <87cz61ll9j.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Paolo Bonzini <pbonzini@redhat.com> writes:

> From: John Snow <jsnow@redhat.com>
>
> Once upon a time, "sphinx-build" on certain RPM platforms invoked
> specifically a Python 2.x version, while "sphinx-build-3" was a distro
> shim for the Python 3.x version.
>
> These days, none of our supported platforms utilize a 2.x version, so it
> should be safe to search for 'sphinx-build' prior to 'sphinx-build-3',
> which will prefer pip/venv installed versions of sphinx if they're
> available.
>
> This adds an extremely convenient ability to test document building
> ability in QEMU across multiple versions of Sphinx for the purposes of
> compatibility testing.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Message-Id: <20230221012456.2607692-6-jsnow@redhat.com>

Accident?

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/meson.build b/docs/meson.build
> index 9136fed3b730..906034f9a87f 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -1,5 +1,5 @@
>  if get_option('sphinx_build') == ''
> -  sphinx_build = find_program(['sphinx-build-3', 'sphinx-build'],
> +  sphinx_build = find_program(['sphinx-build', 'sphinx-build-3'],
>                                required: get_option('docs'))
>  else
>    sphinx_build = find_program(get_option('sphinx_build'),

In review of the original "[PATCH v3 5/6] meson: prefer 'sphinx-build'
to 'sphinx-build-3'", I challenged the check for sphinx-build-3.


