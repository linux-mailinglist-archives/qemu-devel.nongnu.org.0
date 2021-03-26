Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA3534A607
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 11:58:33 +0100 (CET)
Received: from localhost ([::1]:35522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPkAi-0005qZ-Bg
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 06:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPk9W-00058l-TU
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 06:57:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPk9R-00050v-TJ
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 06:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616756231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fE7H2f+wwXbZdQKTCHVe4untUMHRFIWOjpdBIY1Fon4=;
 b=FyuA6bP9/1C4T1nRv1KES2L7jRSa5X5AhsbIn0fv5qCanEXF7TrmQ3sXtTDk/Ip/O96+ER
 RQ4A1sfuecBgnFPH+1zBlzJj7GLKO7NVF/BmRiSL9wvyC6HljLnVztjCrcMycvhcgaSPYm
 Loi4ccyvrMWCAV6WLrQ8gxnfV7tsSSA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-9bDO_N4MMf2_ep3PHWbqHg-1; Fri, 26 Mar 2021 06:57:10 -0400
X-MC-Unique: 9bDO_N4MMf2_ep3PHWbqHg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09C54180FCA6;
 Fri, 26 Mar 2021 10:57:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC85F36807;
 Fri, 26 Mar 2021 10:57:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 518BF11327E1; Fri, 26 Mar 2021 11:57:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-6.0] qapi: qom: do not use target-specific conditionals
References: <20210326100357.2715571-1-pbonzini@redhat.com>
Date: Fri, 26 Mar 2021 11:57:07 +0100
In-Reply-To: <20210326100357.2715571-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Fri, 26 Mar 2021 06:03:57 -0400")
Message-ID: <87r1k2tc70.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> ObjectType and ObjectOptions are defined in a target-independent file,
> therefore they do not have access to target-specific configuration
> symbols such as CONFIG_PSERIES or CONFIG_SEV.  For this reason,
> pef-guest and sev-guest are currently omitted when compiling the
> generated QAPI files.  In addition, this causes ObjectType to have
> different definitions depending on the file that is including
> qapi-types-qom.h (currently this is not causing any issues, but it
> is wrong).
>
> Define the two enum entries and the SevGuestProperties type
> unconditionally to avoid the issue.  We do not expect to have
> many target-dependent user-creatable classes, so it is not
> particularly problematic.
>
> Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qapi/qom.json | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 2056edc072..db5ac419b1 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -733,8 +733,7 @@
>              '*policy': 'uint32',
>              '*handle': 'uint32',
>              '*cbitpos': 'uint32',
> -            'reduced-phys-bits': 'uint32' },
> -  'if': 'defined(CONFIG_SEV)' }
> +            'reduced-phys-bits': 'uint32' } }
>  
>  ##
>  # @ObjectType:
> @@ -768,14 +767,14 @@
>      { 'name': 'memory-backend-memfd',
>        'if': 'defined(CONFIG_LINUX)' },
>      'memory-backend-ram',
> -    {'name': 'pef-guest', 'if': 'defined(CONFIG_PSERIES)' },
> +    'pef-guest',
>      'pr-manager-helper',
>      'rng-builtin',
>      'rng-egd',
>      'rng-random',
>      'secret',
>      'secret_keyring',
> -    {'name': 'sev-guest', 'if': 'defined(CONFIG_SEV)' },
> +    'sev-guest',
>      's390-pv-guest',
>      'throttle-group',
>      'tls-creds-anon',
> @@ -831,8 +830,7 @@
>        'rng-random':                 'RngRandomProperties',
>        'secret':                     'SecretProperties',
>        'secret_keyring':             'SecretKeyringProperties',
> -      'sev-guest':                  { 'type': 'SevGuestProperties',
> -                                      'if': 'defined(CONFIG_SEV)' },
> +      'sev-guest':                  'SevGuestProperties',
>        'throttle-group':             'ThrottleGroupProperties',
>        'tls-creds-anon':             'TlsCredsAnonProperties',
>        'tls-creds-psk':              'TlsCredsPskProperties',

No branch for tag value 'pef-guest', i.e. no tag-specific members.
There are two more: can_bus, s390_pv_guest.  I assume this is
intentional.

Links a bit of dead code into the other qemu-system-FOO, but that's
okay.

If we genuinely needed (or wanted) target-dependent -object, we'd split
qom-target.json off qom.json, and put the target-dependent parts there,
including the enum and the union, with the obvious ripple effects.  Not
now, maybe not ever.

Would adding "only for CONFIG_MUMBLE" to the doc comments make sense?
It's what we did before we had 'if'.


