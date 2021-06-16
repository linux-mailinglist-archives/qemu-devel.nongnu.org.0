Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2E23AA1CA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:49:15 +0200 (CEST)
Received: from localhost ([::1]:51320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYj4-0001t6-On
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ltYhb-0000ff-PC
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:47:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ltYhV-0001bh-L6
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:47:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623862057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xasjze83TRidvCvAEoHXZsbCAdjMOeiZT4WBOYUGWWU=;
 b=EJDn10DURTNQc/2Gs6N/NxppgvtBIZWkxP8RFH5E3FaUJdybhymTHH+vLT77hxnwI0iBKE
 2OuCVbh37bAStusxliHiBQuLDyOR2eiUWBXQNAJgUZtShhtvk+N7qrttAJBAekVDtc2VXY
 2rUcw284gPANGpjoHCGwERGJGE0vNdU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-EFIKYylEPCq2e30UFzJIbQ-1; Wed, 16 Jun 2021 12:47:35 -0400
X-MC-Unique: EFIKYylEPCq2e30UFzJIbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF1235721D
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 16:47:34 +0000 (UTC)
Received: from [10.10.113.126] (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64E9910013D7;
 Wed, 16 Jun 2021 16:47:34 +0000 (UTC)
Subject: Re: [PATCH] qapi: Fix crash on missing enum member name
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210616072121.626431-1-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <784c3328-3f4b-01c7-eade-04ca1dbe476b@redhat.com>
Date: Wed, 16 Jun 2021 12:47:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616072121.626431-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.17, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 3:21 AM, Markus Armbruster wrote:
> New test case enum-dict-no-name.json crashes:
> 
>      $ python3 scripts/qapi-gen.py tests/qapi-schema/enum-dict-no-name.json
>      Traceback (most recent call last):
>      [...]
>        File "/work/armbru/qemu/scripts/qapi/expr.py", line 458, in check_enum
> 	member_name = member['name']
>      KeyError: 'name'
> 
> Root cause: we try to retrieve member 'name' before we check for
> missing members.  With that fixed, we get the expected error "'data'
> member misses key 'name'".
> 

Whoops! Good spot.

> Fixes: 0825f62c842f2c07c5471391c6d7fd3f4fe83732
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>   scripts/qapi/expr.py                     | 2 +-
>   tests/qapi-schema/enum-dict-no-name.err  | 2 ++
>   tests/qapi-schema/enum-dict-no-name.json | 2 ++
>   tests/qapi-schema/enum-dict-no-name.out  | 0
>   4 files changed, 5 insertions(+), 1 deletion(-)
>   create mode 100644 tests/qapi-schema/enum-dict-no-name.err
>   create mode 100644 tests/qapi-schema/enum-dict-no-name.json
>   create mode 100644 tests/qapi-schema/enum-dict-no-name.out
> 
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 496f7e0333..cf98923fa6 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -455,8 +455,8 @@ def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
>                     for m in members]
>       for member in members:
>           source = "'data' member"
> -        member_name = member['name']
>           check_keys(member, info, source, ['name'], ['if'])
> +        member_name = member['name']
>           check_name_is_str(member_name, info, source)
>           source = "%s '%s'" % (source, member_name)
>           # Enum members may start with a digit
> diff --git a/tests/qapi-schema/enum-dict-no-name.err b/tests/qapi-schema/enum-dict-no-name.err
> new file mode 100644
> index 0000000000..3ce0c16987
> --- /dev/null
> +++ b/tests/qapi-schema/enum-dict-no-name.err
> @@ -0,0 +1,2 @@
> +enum-dict-no-name.json: In enum 'Enum':
> +enum-dict-no-name.json:2: 'data' member misses key 'name'
> diff --git a/tests/qapi-schema/enum-dict-no-name.json b/tests/qapi-schema/enum-dict-no-name.json
> new file mode 100644
> index 0000000000..5952a8662e
> --- /dev/null
> +++ b/tests/qapi-schema/enum-dict-no-name.json
> @@ -0,0 +1,2 @@
> +# enum member lacking a name
> +{ 'enum': 'Enum', 'data': [ {} ] }
> diff --git a/tests/qapi-schema/enum-dict-no-name.out b/tests/qapi-schema/enum-dict-no-name.out
> new file mode 100644
> index 0000000000..e69de29bb2
> 


