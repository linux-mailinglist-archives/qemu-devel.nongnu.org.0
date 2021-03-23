Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550D23461E0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:52:36 +0100 (CET)
Received: from localhost ([::1]:60604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOiOZ-0008KS-BT
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOiMd-0006mh-Fw
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:50:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOiMZ-0002Ou-8Z
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616511030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E0kne6DuKJ3EJG3KMYzyZu9yE4lUaGg91YTGcggQI6s=;
 b=JApIjsX8iGXNqjlIZaYX8jvYN/wn3yvFWRZy4KXHGJDA1CoepmUdwXXx48fK2xrnK3Xbrd
 7EEJII/a+Z62KaWlpePGt06vlfnZ3N02ewBE39e1gHuKiPFI5RCTWPVOlq8OkBA5YllWyT
 LfdQKg4EPphRzqe2lJz90jgThzIoDuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-z2xE3GnANryn33tqUIYHow-1; Tue, 23 Mar 2021 10:50:28 -0400
X-MC-Unique: z2xE3GnANryn33tqUIYHow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12B07100A240;
 Tue, 23 Mar 2021 14:50:27 +0000 (UTC)
Received: from [10.3.112.201] (ovpn-112-201.phx2.redhat.com [10.3.112.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3A0C5D6AD;
 Tue, 23 Mar 2021 14:50:23 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-15-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 14/28] qapi: Enforce type naming rules
Message-ID: <d2b8e84e-74d8-553c-681e-b0c8a3ae3934@redhat.com>
Date: Tue, 23 Mar 2021 09:50:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323094025.3569441-15-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
> Type names should be CamelCase.  Enforce this.  The only offenders are
> in tests/.  Fix them.  Add test type-case to cover the new error.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

> +++ b/scripts/qapi/expr.py
> @@ -61,7 +61,8 @@ def check_name_lower(name, info, source,
>  
>  def check_name_camel(name, info, source):
>      stem = check_name_str(name, info, source)
> -    # TODO reject '[_-]' in stem, require CamelCase
> +    if not re.match(r'[A-Z]+[A-Za-z0-9]*[a-z][A-Za-z0-9]*$', stem):

Requires one or more leading capital, and at least one lowercase.  This
permits oddballs like PCIELinkSpeed in common.json that are eventually
camel case but with a rather long all-caps start.

As written, the + isn't necessary, you'd match the same set of strings
with it omitted.  But leaving it doesn't hurt.

> +++ b/tests/qapi-schema/doc-bad-union-member.json
> @@ -11,9 +11,9 @@
>    'data': { 'nothing': 'Empty' } }
>  
>  { 'struct': 'Base',
> -  'data': { 'type': 'T' } }
> +  'data': { 'type': 'FrobType' } }

No single-character type names is fallout from the tighter rules, but is
fine with me.


> +++ b/tests/qapi-schema/type-case.json
> @@ -0,0 +1,2 @@
> +# Type names should use CamelCase
> +{ 'struct': 'not-a-camel' }

You should probably include a 'data':{...} here, to ensure that we
aren't rejecting this for missing data (yes, the .err file does test our
actual error message, but no reason to not be otherwise compliant to
what we normally expect).

Such a tweak is minor enough that I'm fine with

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


