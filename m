Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D726346C3C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:21:07 +0100 (CET)
Received: from localhost ([::1]:60732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpOc-0003nn-Dr
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOpFf-0000jv-On
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:11:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOpFQ-00013x-8h
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:11:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616537493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NjWGKhlV8lgbqoS7Czun/TsuLGYKTnQOxRmZQx+YSvQ=;
 b=HqS+ETJOrypeDd3rS9hPzVWCMutrn7rG90q815JGy5RJhnSQzQ5q9JHKjvDZ4vKcECsTK6
 erA2tepdzb4lBUSiG8wyu5s9cooHdY8IJ7KuctTtVGhgL9drQJGNPc4XBvMl7VJYSiJg6q
 jB+bvFyLmxaafhC6LBVbvxPIdQ8xBnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-qmydK7XNPFWhH_kdMHo5NA-1; Tue, 23 Mar 2021 18:11:31 -0400
X-MC-Unique: qmydK7XNPFWhH_kdMHo5NA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2FEA63CC1;
 Tue, 23 Mar 2021 22:11:30 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 234C45D6AD;
 Tue, 23 Mar 2021 22:11:27 +0000 (UTC)
Subject: Re: [PATCH 09/28] qapi: Lift enum-specific code out of
 check_name_str()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-10-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <53a39239-97e4-c8f1-f481-4eba98dbdf38@redhat.com>
Date: Tue, 23 Mar 2021 18:11:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323094025.3569441-10-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
> check_name_str() masks leading digits when passed enum_member=True.
> Only check_enum() does.  Lift the masking into check_enum().
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   scripts/qapi/expr.py | 23 ++++++++++-------------
>   1 file changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 507550c340..e00467636c 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -34,18 +34,11 @@ def check_name_is_str(name, info, source):
>   
>   
>   def check_name_str(name, info, source,
> -                   enum_member=False,
>                      permit_upper=False):
> -    membername = name
> -
> -    # Enum members can start with a digit, because the generated C
> -    # code always prefixes it with the enum name
> -    if enum_member and membername[0].isdigit():
> -        membername = 'D' + membername
>       # Reserve the entire 'q_' namespace for c_name(), and for 'q_empty'
>       # and 'q_obj_*' implicit type names.
> -    if not valid_name.match(membername) or \
> -       c_name(membername, False).startswith('q_'):
> +    if not valid_name.match(name) or \
> +       c_name(name, False).startswith('q_'):
>           raise QAPISemError(info, "%s has an invalid name" % source)
>       if not permit_upper and name.lower() != name:
>           raise QAPISemError(
> @@ -213,11 +206,15 @@ def check_enum(expr, info):
>                     for m in members]
>       for member in members:
>           source = "'data' member"
> +        member_name = member['name']
>           check_keys(member, info, source, ['name'], ['if'])
> -        check_name_is_str(member['name'], info, source)
> -        source = "%s '%s'" % (source, member['name'])
> -        check_name_str(member['name'], info, source,
> -                       enum_member=True, permit_upper=permit_upper)
> +        check_name_is_str(member_name, info, source)
> +        source = "%s '%s'" % (source, member_name)
> +        # Enum members may start with a digit
> +        if member_name[0].isdigit():
> +            member_name = 'd' + member_name # Hack: hide the digit

Actually, can you put in one more space here? ^

> +        check_name_str(member_name, info, source,
> +                       permit_upper=permit_upper)
>           check_if(member, info, source)
>   
>   
> 


