Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B9B24C4DB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 19:53:36 +0200 (CEST)
Received: from localhost ([::1]:59818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8okp-0003t3-F7
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 13:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k8ojr-0002Zg-73
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 13:52:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35121
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k8ojp-00053q-Ht
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 13:52:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597945952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q0JnO9S8Q31sL3Ots3YQgvCxsRneTWalPDDkUl8qm4c=;
 b=fKUFwHkADUo61swNLUDakVup2cvrC4RiAJYkYCNHyyncaQHEiw9X/98qMYoucrJGd0G9hj
 8NVXiVEZZ2cSguoYpVtaznNe4+zd3+ZGOu4qs7vpNPduWeSeg0DlkeiZgbD8M/s3/p0WTg
 N4rSN+yoTzwTUwL9HbgWNbfpIYqbWCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-F1VsZ1xbP1GeppRwijK21A-1; Thu, 20 Aug 2020 13:52:28 -0400
X-MC-Unique: F1VsZ1xbP1GeppRwijK21A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFE478030C9;
 Thu, 20 Aug 2020 17:52:27 +0000 (UTC)
Received: from [10.3.114.63] (ovpn-114-63.phx2.redhat.com [10.3.114.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DBEA7E306;
 Thu, 20 Aug 2020 17:52:27 +0000 (UTC)
Subject: Re: [PATCH v2] configure: add support for pseudo-"in source tree"
 builds
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20200820173124.243984-1-berrange@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <653438ac-0445-36a8-7546-b945fd42e781@redhat.com>
Date: Thu, 20 Aug 2020 12:52:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820173124.243984-1-berrange@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 03:03:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/20 12:31 PM, Daniel P. Berrangé wrote:
> Meson requires the build dir to be separate from the source tree. Many
> people are used to just running "./configure && make" though and the
> meson conversion breaks that.
> 
> This introduces some backcompat support to make it appear as if an
> "in source tree" build is being done, but with the the results in the

s/the the/the/

> "build/" directory. This allows "./configure && make" to work as it
> did historically, albeit with the output binaries staying under build/.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
> 

> 
> In v2:
> 
>   - Use a marker file so we don't blow away a build/ dir
>     we didn't create
>   - Silence the distclean rule
>   - Fix broken use of error_exit that's not defined yet
>   - Add comment to GNUmakefile
> 
>   .gitignore |  2 ++
>   configure  | 48 +++++++++++++++++++++++++++++++++++++++++++++---
>   2 files changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/.gitignore b/.gitignore
> index 92311284ef..4ccb9ed975 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,3 +1,5 @@
> +/GNUmakefile
> +/build/
>   /.doctrees
>   /config-devices.*
>   /config-all-devices.*
> diff --git a/configure b/configure
> index cc5f58f31a..cdffe221c7 100755
> --- a/configure
> +++ b/configure
> @@ -11,6 +11,51 @@ unset CLICOLOR_FORCE GREP_OPTIONS
>   # Don't allow CCACHE, if present, to use cached results of compile tests!
>   export CCACHE_RECACHE=yes
>   
> +# make source path absolute
> +source_path=$(cd "$(dirname -- "$0")"; pwd)

Our mails crossed; my 1 comment about CDPATH impacting this is still valid.

> +
> +if test "$PWD" == "$source_path"

and s/==/=/ for non-bash

> +then
> +    echo "Using './build' as the directory for build output"
> +
> +    MARKER=build/auto-created-by-configure
> +
> +    if test -e build
> +    then
> +	if test -f $MARKER
> +	then
> +	   rm -rf build
> +	else
> +	    echo "ERROR: ./build dir already exists and was not previously created by configure"
> +	    exit 1

TAB damage.

> +	fi
> +    fi
> +
> +    mkdir build
> +    touch $MARKER
> +
> +    cat > GNUmakefile <<EOF
> +# This file is auto-generated by configure to support in-source tree
> +# 'make' command invokation

invocation

> +
> +ifeq (\$(MAKECMDGOALS),)
> +recurse: all
> +endif
> +
> +.NOTPARALLEL: %
> +%: force
> +	@echo 'changing dir to build for \$(MAKE) "\$(MAKECMDGOALS)"...'
> +	@\$(MAKE) -C build -f Makefile \$(MAKECMDGOALS)
> +	@if test "\$(MAKECMDGOALS)" = "distclean" && test -e build/auto-created-by-configure ; then rm -rf build GNUmakefile ; fi
> +force: ;
> +.PHONY: force
> +GNUmakefile: ;
> +
> +EOF

Quote the first EOF to avoid having to quote all $ in the heredoc

> +    cd build
> +    exec $source_path/configure "$@"
> +fi
> +
>   # Temporary directory used for files created while
>   # configure runs. Since it is in the build directory
>   # we can safely blow away any previous version of it
> @@ -297,9 +342,6 @@ ld_has() {
>       $ld --help 2>/dev/null | grep ".$1" >/dev/null 2>&1
>   }
>   
> -# make source path absolute
> -source_path=$(cd "$(dirname -- "$0")"; pwd)
> -
>   if printf %s\\n "$source_path" "$PWD" | grep -q "[[:space:]:]";
>   then
>     error_exit "main directory cannot contain spaces nor colons"
> 

With corrections, this is looking good; I'm okay if v3 includes:
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


