Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F277F66443F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:13:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFEms-0004IV-Qc; Tue, 10 Jan 2023 08:35:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFEmf-0004Fy-Jq
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:35:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFEmd-0005BF-Ni
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:35:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673357719;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yeGBN51Brkijzauv7csHSI1CZlOkZ0PJM7beLuBd+s=;
 b=WUSb+DKyPmGmBHvG3bQiw6b2PSFNMlMtmy56me/r4tMPO388vwFD2coQYTYYad4UvMO6yz
 8d89fs+dN5Gv45XMhnr2MgaEWWHyUxZDzebUpSZUVmGcItWqlcjlZ9KMv/eV/t8SCiBj7c
 AhXdg6lt3rcfAWv9OdVdNAl+28ZcqMw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-rWcHvRgaNyqAjojKt93d9g-1; Tue, 10 Jan 2023 08:35:16 -0500
X-MC-Unique: rWcHvRgaNyqAjojKt93d9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C5CB87B2A3;
 Tue, 10 Jan 2023 13:35:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4E54407D466;
 Tue, 10 Jan 2023 13:35:12 +0000 (UTC)
Date: Tue, 10 Jan 2023 13:35:10 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>, kraxel@redhat.com,
 Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 pbonzini@redhat.com, Eric Farman <farman@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, thuth@redhat.com,
 Halil Pasic <pasic@linux.ibm.com>,
 Michael Roth <michael.roth@amd.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ed Maste <emaste@freebsd.org>
Subject: Re: [PATCH v4 3/8] configure: replace Perl usage with sed
Message-ID: <Y71pjipeYl2ByOjt@redhat.com>
References: <20230110132700.833690-1-marcandre.lureau@redhat.com>
 <20230110132700.833690-4-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230110132700.833690-4-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 10, 2023 at 05:26:55PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Let's try to reduce our Perl usage during config/build-time.
> 
> Note: this patch might be dropped if "configure: remove
> backwards-compatibility code" is merged earlier.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Tested-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/configure b/configure
> index 2281892657..9a944698b4 100755
> --- a/configure
> +++ b/configure
> @@ -2571,11 +2571,9 @@ else
>    if test -f meson-private/cmd_line.txt; then
>      # Adjust old command line options whose type was changed
>      # Avoids having to use "setup --wipe" when Meson is upgraded
> -    perl -i -ne '
> -      s/^gettext = true$/gettext = auto/;
> -      s/^gettext = false$/gettext = disabled/;
> -      /^b_staticpic/ && next;
> -      print;' meson-private/cmd_line.txt
> +    sed -i.bak -e 's/^gettext = true$/gettext = auto/g' \
> +      -e 's/^gettext = false$/gettext = disabled/g' \
> +      -e '/^b_staticpic/d' meson-private/cmd_line.txt

Do we really need to have a '.bak' file created ? The original
perl cmd didn't


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


