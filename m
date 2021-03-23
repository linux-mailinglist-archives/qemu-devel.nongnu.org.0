Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C7A346161
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:22:56 +0100 (CET)
Received: from localhost ([::1]:55802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhvr-0001hZ-NT
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOhu6-0000JI-9W
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:21:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOhtz-0003bR-5p
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616509257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/0l+mwG7GuX4EQayhVDWqTYFJKs83wXJuKXpKM5c/g=;
 b=YjjJl+rWSiLCcxYvK28BiqUVU8Roxv7aKdKkZI3PZI55g8RoLS7Uzh9fPkz43DranqHWia
 CEDsp4Yh9KtFDVI+TDiVD0WMk1E3LzCwYOpjPLZCS7eewJPQxjqYB6ogZ7rg+O3D3DYhba
 sJKuI7vWcIETEy6cEHqcm2hdLhHpKY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-prRRBlKtORSiZxv6SeDGpA-1; Tue, 23 Mar 2021 10:20:55 -0400
X-MC-Unique: prRRBlKtORSiZxv6SeDGpA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3CCE81620;
 Tue, 23 Mar 2021 14:20:53 +0000 (UTC)
Received: from [10.3.112.201] (ovpn-112-201.phx2.redhat.com [10.3.112.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C2DD10023AF;
 Tue, 23 Mar 2021 14:20:50 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-11-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 10/28] qapi: Rework name checking in preparation of
 stricter checking
Message-ID: <ed036808-1666-8efd-14d4-dfe0863dfa4a@redhat.com>
Date: Tue, 23 Mar 2021 09:20:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323094025.3569441-11-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: michael.roth@amd.com, jsnow@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 4:40 AM, Markus Armbruster wrote:
> Naming rules differ for the various kinds of names.  To prepare
> enforcing them, define functions to check them: check_name_upper(),
> check_name_lower(), and check_name_camel().  For now, these merely
> wrap around check_name_str(), but that will change shortly.  Replace
> the other uses of check_name_str() by appropriate uses of the
> wrappers.  No change in behavior just yet.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/qapi/expr.py | 51 +++++++++++++++++++++++++++++++-------------
>  1 file changed, 36 insertions(+), 15 deletions(-)
> 

> +++ b/scripts/qapi/expr.py
> @@ -21,11 +21,12 @@
>  from .error import QAPISemError
>  
>  
> -# Names must be letters, numbers, -, and _.  They must start with letter,
> -# except for downstream extensions which must start with __RFQDN_.
> -# Dots are only valid in the downstream extension prefix.
> -valid_name = re.compile(r'^(__[a-zA-Z0-9.-]+_)?'
> -                        '[a-zA-Z][a-zA-Z0-9_-]*$')

I'm assuming python concatenates r'' with '' in the obvious manner...

> +# Names consist of letters, digits, -, and _, starting with a letter.
> +# An experimental name is prefixed with x-.  A name of a downstream
> +# extension is prefixed with __RFQDN_.  The latter prefix goes first.
> +valid_name = re.compile(r'(__[a-z0-9.-]+_)?'
> +                        r'(x-)?'
> +                        r'([a-z][a-z0-9_-]*)$', re.IGNORECASE)

...but like your explicit use of r'' r''.

Splitting out special handling of r'(x-)?' does not change behavior, but
is not otherwise mentioned in your commit message.  I suspect you did it
to make it easier to permit x-EVENT_NAME in later patches where upper is
handled differently from lower or camel, so I won't withhold R-b, but it
may be worth a tweak to the commit message.


>  
>  def check_defn_name_str(name, info, meta):
> -    check_name_str(name, info, meta, permit_upper=True)
> +    if meta == 'event':
> +        check_name_upper(name, info, meta)
> +    elif meta == 'command':
> +        check_name_lower(name, info, meta, permit_upper=True)

Why do commands need to permit upper?  I guess just downstream FQDN
extensions?

Otherwise the patch makes sense.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


