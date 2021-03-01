Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0613C3278D3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 09:02:50 +0100 (CET)
Received: from localhost ([::1]:33550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGdVw-0001H7-VN
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 03:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGdTt-00082w-Sd
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:00:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGdTq-0000ZB-N8
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:00:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614585637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=60tYB2XHVk5xIawihUXhE0e2S9Fg/lphWntPqsOROPk=;
 b=Ubp8MW769uNGW+3Lwx6W5WYu1syXfYqD6BED6AKbecGqGwT72V1M8rNchMWY/JZ+/C/EHv
 f/n5FnVdC0UADvum4jeonh6mu+/Ga+v/eUtGgVjBWGL7fPWhjo1fK8HT4XlCFUHO+7r6rS
 vlTHTNqBlrl9NVzHzNKhs0wKqpKFUOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-xrz7wu5GORWIjwsMSbX1eQ-1; Mon, 01 Mar 2021 03:00:35 -0500
X-MC-Unique: xrz7wu5GORWIjwsMSbX1eQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 161F8107ACE4
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 08:00:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB8CE18A60;
 Mon,  1 Mar 2021 08:00:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4E9FC113860F; Mon,  1 Mar 2021 09:00:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 27/29] vl: deprecate -writeconfig
References: <20210226080526.651705-1-pbonzini@redhat.com>
 <20210226080526.651705-28-pbonzini@redhat.com>
Date: Mon, 01 Mar 2021 09:00:33 +0100
In-Reply-To: <20210226080526.651705-28-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Fri, 26 Feb 2021 09:05:24 +0100")
Message-ID: <87r1kzl2vy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> The functionality of -writeconfig is limited and the code
> does not even try to detect cases where it prints incorrect
> syntax (for example if values have a quote in them, since
> qemu_config_parse does not support any kind of escaping)
> so remove it.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/system/deprecated.rst | 7 +++++++
>  qemu-options.hx            | 7 +------
>  softmmu/vl.c               | 1 +
>  3 files changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 2fcac7861e..561c916da2 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -146,6 +146,13 @@ library enabled as a cryptography provider.
>  Neither the ``nettle`` library, or the built-in cryptography provider are
>  supported on FIPS enabled hosts.
>  
> +``-writeconfig`` (since 6.0)
> +'''''''''''''''''''''''''''''
> +
> +The ``-writeconfig`` option is not able to serialize the entire contents
> +of the QEMU command line.  It is thus considered a failed experiment
> +and deprecated, with no current replacement.
> +
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------
>  
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 34be5a7a2d..252db9357c 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4335,13 +4335,8 @@ SRST
>  ERST
>  DEF("writeconfig", HAS_ARG, QEMU_OPTION_writeconfig,
>      "-writeconfig <file>\n"
> -    "                read/write config file\n", QEMU_ARCH_ALL)
> +    "                read/write config file (deprecated)\n", QEMU_ARCH_ALL)
>  SRST
> -``-writeconfig file``
> -    Write device configuration to file. The file can be either filename
> -    to save command line and device configuration into file or dash
> -    ``-``) character to print the output to stdout. This can be later
> -    used as input file for ``-readconfig`` option.
>  ERST
>  
>  DEF("no-user-config", 0, QEMU_OPTION_nouserconfig,
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index b219ce1f35..6d8393b6f7 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3356,6 +3356,7 @@ void qemu_init(int argc, char **argv, char **envp)
>              case QEMU_OPTION_writeconfig:
>                  {
>                      FILE *fp;
> +                    warn_report("-writeconfig is deprecated.  It will go away in QEMU 6.2 with no replacement");
>                      if (strcmp(optarg, "-") == 0) {
>                          fp = stdout;
>                      } else {

Forgot to tweak the warning to "-writeconfig is deprecated and will go
away without a replacement"?


