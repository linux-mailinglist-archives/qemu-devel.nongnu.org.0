Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C71969F75C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:05:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqg4-0006zx-Q9; Wed, 22 Feb 2023 10:05:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUqg1-0006za-KO
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:05:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUqfz-0003Et-H2
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:05:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677078297;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Nse5VGvNmUp6acnPDnflP8q8zS4i9gK8VQNBbeoLZK0=;
 b=bwLZIErCcICLDRhi5S6stVrzj4aoszU0VTryX51z+yAiEdIUONMFtKsPPBwQhJGxLjBxY0
 zHMCLNHViViCY9h7FuFKbSN0yq2oHHxFBhilM0HHybTLYPowTAda82K3X6xj9xdYqDdUO5
 qY7zJqkeRMXqaSinumC8/+emjKUja0U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-5_AYwKxaNoyhllSZgA04gA-1; Wed, 22 Feb 2023 10:04:56 -0500
X-MC-Unique: 5_AYwKxaNoyhllSZgA04gA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76EC3803D7A;
 Wed, 22 Feb 2023 15:04:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D0851121314;
 Wed, 22 Feb 2023 15:04:50 +0000 (UTC)
Date: Wed, 22 Feb 2023 15:04:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, peter.maydell@linaro.org,
 thuth@redhat.com, alex.bennee@linaro.org, armbru@redhat.com
Subject: Re: [PATCH 04/10] configure: protect against escaping venv when
 running Meson
Message-ID: <Y/YvEClRN4wRmjAH@redhat.com>
References: <20230222143752.466090-1-pbonzini@redhat.com>
 <20230222143752.466090-5-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230222143752.466090-5-pbonzini@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 22, 2023 at 03:37:46PM +0100, Paolo Bonzini wrote:
> If neither --python nor --meson are specified, Meson's generated
> build.ninja will invoke Python script using the interpreter *that Meson
> itself is running under*; not the one identified by configure.
> 
> This is only an issue if Meson's Python interpreter is not "the first
> one in the path", which is the one that is used if --python is not
> specified.  A common case where this happen is when the "python3" binary
> comes from a virtual environment but Meson is not installed (with pip)
> in the virtual environment.  In this case (presumably) whoever set up
> the venv wanted to use the venv's Python interpreter to build QEMU,
> while Meson might use a different one, for example an enterprise
> distro's older runtime.
> 
> So, detect whether a virtual environment is setup, and if the virtual
> environment does not have Meson, use the meson submodule.  Meson will
> then run under the virtual environment's Python interpreter.

I fear this could be somewhat confusing to contributors. If I have
meson in my $PATH, at a sufficient version, it would be surprising
to find QEMU had been using a different version instead.

I can understand wanting to make it "just work", but should we
perhaps issue a warning from configure when we're intentionally
ignoring an otherwise valid meson installation ?

> 
> Reported-by: John Snow <jsnow@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 00415f0b48d7..4d66a958023e 100755
> --- a/configure
> +++ b/configure
> @@ -1047,8 +1047,18 @@ fi
>  # Suppress writing compiled files
>  python="$python -B"
>  
> +has_meson() {
> +  if test "${VIRTUAL_ENV:+set}" = set; then
> +    # Ensure that Meson and Python come from the same virtual environment
> +    test -x "${VIRTUAL_ENV}/bin/meson" &&
> +      test "$(command -v meson)" -ef "${VIRTUAL_ENV}/bin/meson"
> +  else
> +    has meson
> +  fi
> +}
> +
>  if test -z "$meson"; then
> -    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.61.5; then
> +    if test "$explicit_python" = no && has_meson && version_ge "$(meson --version)" 0.61.5; then
>          meson=meson
>      elif test "$git_submodules_action" != 'ignore' ; then
>          meson=git
> -- 
> 2.39.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


