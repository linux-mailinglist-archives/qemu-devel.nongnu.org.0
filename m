Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C1D345F8C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:21:14 +0100 (CET)
Received: from localhost ([::1]:34070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgy9-0000Hf-9c
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOgxD-0008DD-Fi
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:20:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOgxA-0001uK-SB
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616505611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+vett5CQ0FK/f6HhG9tn8V3p2Mz+efoRYhj+zl8eM/U=;
 b=hpCwN2CVtACsvLbIHQKELmmhozLXH5APVCs/4ozxbwvrPgU1ImcNKlyyIxCNqyk2BwG53V
 GkdaFcHmYhTxugj+/ZqV1C7MY2h94/x2JIcbJ7ALsdsQQRNkfGOLDJYB3He31AUm6Tf0Oc
 ypN/BGQgiEbyNeQGgnTbtt4cGnLfwvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-WPL-fDwbOBmmAlTNbY_XPg-1; Tue, 23 Mar 2021 09:20:09 -0400
X-MC-Unique: WPL-fDwbOBmmAlTNbY_XPg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7081310866A4;
 Tue, 23 Mar 2021 13:20:08 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB8489CA0;
 Tue, 23 Mar 2021 13:20:04 +0000 (UTC)
Subject: Re: [PATCH 06/28] tests/qapi-schema: Tweak to demonstrate buggy
 member name check
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-7-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <f72dbb52-059e-f773-63ad-385b9c9d9e6c@redhat.com>
Date: Tue, 23 Mar 2021 09:20:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323094025.3569441-7-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
> Member name 'u' and names starting with 'has-' or 'has_' are reserved
> for the generator.  check_type() enforces this, covered by tests
> reserved-member-u and reserved-member-has.
> 
> These tests neglect to cover optional members, where the name starts
> with '*'.  Tweak reserved-member-u to fix that.
> 
> This demonstrates the reserved member name check is broken for
> optional members.  The next commit will fix it.
> 

The test without an optional member goes away. Do we lose coverage? (Do 
we care?)

> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   tests/qapi-schema/reserved-member-u.err  |  2 --
>   tests/qapi-schema/reserved-member-u.json |  3 ++-
>   tests/qapi-schema/reserved-member-u.out  | 14 ++++++++++++++
>   3 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qapi-schema/reserved-member-u.err b/tests/qapi-schema/reserved-member-u.err
> index 231d552494..e69de29bb2 100644
> --- a/tests/qapi-schema/reserved-member-u.err
> +++ b/tests/qapi-schema/reserved-member-u.err
> @@ -1,2 +0,0 @@
> -reserved-member-u.json: In struct 'Oops':
> -reserved-member-u.json:7: 'data' member 'u' uses reserved name
> diff --git a/tests/qapi-schema/reserved-member-u.json b/tests/qapi-schema/reserved-member-u.json
> index 1eaf0f301c..15005abb09 100644
> --- a/tests/qapi-schema/reserved-member-u.json
> +++ b/tests/qapi-schema/reserved-member-u.json
> @@ -4,4 +4,5 @@
>   # This is true even for non-unions, because it is possible to convert a
>   # struct to flat union while remaining backwards compatible in QMP.
>   # TODO - we could munge the member name to 'q_u' to avoid the collision
> -{ 'struct': 'Oops', 'data': { 'u': 'str' } }
> +# BUG: not rejected
> +{ 'struct': 'Oops', 'data': { '*u': 'str' } }
> diff --git a/tests/qapi-schema/reserved-member-u.out b/tests/qapi-schema/reserved-member-u.out
> index e69de29bb2..6a3705518b 100644
> --- a/tests/qapi-schema/reserved-member-u.out
> +++ b/tests/qapi-schema/reserved-member-u.out
> @@ -0,0 +1,14 @@
> +module ./builtin
> +object q_empty
> +enum QType
> +    prefix QTYPE
> +    member none
> +    member qnull
> +    member qnum
> +    member qstring
> +    member qdict
> +    member qlist
> +    member qbool
> +module reserved-member-u.json
> +object Oops
> +    member u: str optional=True
> 


