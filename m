Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1442D346635
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:23:27 +0100 (CET)
Received: from localhost ([::1]:40078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkkY-000550-1M
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOjso-0006RS-8F
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:27:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOjsm-0006FA-Cw
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:27:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616516871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UomIJiViRDLpB/38NQpEDEblyDfO+gKWTg0I/Dz+Ve4=;
 b=LTim/ylwPLtiKHfvOv94auO/kzI0D91p+m11fzZvlcb4tqTxGf9Z4I7n0Hpq++ASwDzF4H
 QrphH34DtgN5Lkpg6T098cNxnSmwadokaYppZxjz9jAP66xpKPMdD8vZzMC31iPpbUL4uG
 ncndtMugrkrYFJ56hlCPb44cVdiPsgE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-zaNciy94Nl2djzmB94G9Og-1; Tue, 23 Mar 2021 12:27:49 -0400
X-MC-Unique: zaNciy94Nl2djzmB94G9Og-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5660783DD2B;
 Tue, 23 Mar 2021 16:27:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 160D0197F9;
 Tue, 23 Mar 2021 16:27:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9DEDF11327E1; Tue, 23 Mar 2021 17:27:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 14/28] qapi: Enforce type naming rules
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-15-armbru@redhat.com>
 <d2b8e84e-74d8-553c-681e-b0c8a3ae3934@redhat.com>
Date: Tue, 23 Mar 2021 17:27:43 +0100
In-Reply-To: <d2b8e84e-74d8-553c-681e-b0c8a3ae3934@redhat.com> (Eric Blake's
 message of "Tue, 23 Mar 2021 09:50:22 -0500")
Message-ID: <87pmzpomww.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: michael.roth@amd.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 3/23/21 4:40 AM, Markus Armbruster wrote:
>> Type names should be CamelCase.  Enforce this.  The only offenders are
>> in tests/.  Fix them.  Add test type-case to cover the new error.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
>> +++ b/scripts/qapi/expr.py
>> @@ -61,7 +61,8 @@ def check_name_lower(name, info, source,
>>  
>>  def check_name_camel(name, info, source):
>>      stem = check_name_str(name, info, source)
>> -    # TODO reject '[_-]' in stem, require CamelCase
>> +    if not re.match(r'[A-Z]+[A-Za-z0-9]*[a-z][A-Za-z0-9]*$', stem):
>
> Requires one or more leading capital, and at least one lowercase.  This
> permits oddballs like PCIELinkSpeed in common.json that are eventually
> camel case but with a rather long all-caps start.
>
> As written, the + isn't necessary, you'd match the same set of strings
> with it omitted.  But leaving it doesn't hurt.

I'll drop it.

>> +++ b/tests/qapi-schema/doc-bad-union-member.json
>> @@ -11,9 +11,9 @@
>>    'data': { 'nothing': 'Empty' } }
>>  
>>  { 'struct': 'Base',
>> -  'data': { 'type': 'T' } }
>> +  'data': { 'type': 'FrobType' } }
>
> No single-character type names is fallout from the tighter rules, but is
> fine with me.

I was unsure whether to complicate the regexp slightly so
single-character type names keep working.  Then I decided against it.

>> +++ b/tests/qapi-schema/type-case.json
>> @@ -0,0 +1,2 @@
>> +# Type names should use CamelCase
>> +{ 'struct': 'not-a-camel' }
>
> You should probably include a 'data':{...} here, to ensure that we
> aren't rejecting this for missing data (yes, the .err file does test our
> actual error message, but no reason to not be otherwise compliant to
> what we normally expect).

Yes, that's prudent.

> Such a tweak is minor enough that I'm fine with
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


