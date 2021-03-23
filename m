Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE153461DF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:52:24 +0100 (CET)
Received: from localhost ([::1]:59760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOiOO-0007w9-1v
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOiLY-00058x-Bc
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:49:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOiLW-0001lR-Eh
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616510965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iPN4r97cZShcdBzTfDytQ5w1ZPE+Iuqa00avVT3ry10=;
 b=URGeN93pGzghzbne/Xw1GXwWlbF7ZLWVfNJ0stCf+uvkV9X2c+jxOhCE3vRIKUZIzU2vFB
 nvGMWyNli8CPReL2YbHbvavRcXTsPZ49KxTIp1XzTpz25kdiUKieT8egdSt3GVUTHHYEXy
 w74JG1ZSabKQ25GYc9L9TJA9/FO41l0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-odrMG2BwPKWgptEr4trUfQ-1; Tue, 23 Mar 2021 10:49:23 -0400
X-MC-Unique: odrMG2BwPKWgptEr4trUfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4176881624;
 Tue, 23 Mar 2021 14:49:22 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AD825C1C5;
 Tue, 23 Mar 2021 14:49:17 +0000 (UTC)
Subject: Re: [PATCH 08/28] qapi: Support flat unions tag values with leading
 digit
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-9-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <b84d5e36-de4a-9178-43d1-7a9e489e7b6c@redhat.com>
Date: Tue, 23 Mar 2021 10:49:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323094025.3569441-9-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 5:40 AM, Markus Armbruster wrote:
> Flat union tag values get checked twice: as enum member name, and as
> union branch name.  The former accepts leading digits, the latter
> doesn't.  The restriction feels arbitrary.  Skip the latter check.
> 
> This can expose c_name() to input it can't handle: a name starting
> with a digit.  Improve it to return a valid C identifier for any
> input.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Anything in particular inspire this?

> ---
>   scripts/qapi/common.py | 8 ++++----
>   scripts/qapi/expr.py   | 4 +++-
>   2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index 11b86beeab..cbd3fd81d3 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -18,7 +18,6 @@
>   #: Magic string that gets removed along with all space to its right.
>   EATSPACE = '\033EATSPACE.'
>   POINTER_SUFFIX = ' *' + EATSPACE
> -_C_NAME_TRANS = str.maketrans('.-', '__')
>   
>   
>   def camel_to_upper(value: str) -> str:
> @@ -109,9 +108,10 @@ def c_name(name: str, protect: bool = True) -> str:
>                        'not_eq', 'or', 'or_eq', 'xor', 'xor_eq'])
>       # namespace pollution:
>       polluted_words = set(['unix', 'errno', 'mips', 'sparc', 'i386'])
> -    name = name.translate(_C_NAME_TRANS)
> -    if protect and (name in c89_words | c99_words | c11_words | gcc_words
> -                    | cpp_words | polluted_words):
> +    name = re.sub(r'[^A-Za-z0-9_]', '_', name)

The regex gets a little more powerful now. Instead of just . and - we 
now translate *everything* that's not an alphanumeric to _.

Does this have a visible impact anywhere, or are we constrained 
somewhere else?

> +    if protect and (name in (c89_words | c99_words | c11_words | gcc_words
> +                             | cpp_words | polluted_words)
> +                    or name[0].isdigit()):

Worth touching the docstring?

:param protect: If true, avoid returning certain ticklish identifiers 

                 (like C keywords) by prepending ``q_``. 


I know the formatting is a hot mess, but I still intend to get to that 
"all at once" with an "enable sphinx" pass later, so just touching the 
content so it gets included in that pass would be fine (to me, at least.)

>           return 'q_' + name
>       return name
>   
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index cf09fa9fd3..507550c340 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -246,7 +246,9 @@ def check_union(expr, info):
>   
>       for (key, value) in members.items():
>           source = "'data' member '%s'" % key
> -        check_name_str(key, info, source)
> +        if discriminator is None:
> +            check_name_str(key, info, source)
> +        # else: name is in discriminator enum, which gets checked

I suppose the alternative would be to have allowed check_name_str to 
take an 'allow_leading_digits' parameter (instead of 'enum_member') and 
set that to true here and just deal with the mild inefficiency.

I might have a slight preference to just accept the inefficiency so that 
it's obvious that it's checked regardless of the discriminator 
condition, buuuuut not enough to be pushy about it, I think.

>           check_keys(value, info, source, ['type'], ['if'])
>           check_if(value, info, source)
>           check_type(value['type'], info, source, allow_array=not base)
> 


