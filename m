Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66DA33C220
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:36:41 +0100 (CET)
Received: from localhost ([::1]:47268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqCu-0004ZL-Ia
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lLq6M-0002eN-8F
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:29:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lLq6J-0006rQ-AS
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:29:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615825789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X6K3oAPhmKnODfvnq4/dL+y+R9mzdW/rmfwnTKaQ1c0=;
 b=fp3EgGu865wLbIitVvSUMD8g8do555k1h0/8EPNmapPg9mz2rGmUQr4xVJ7rHv4wJholCH
 ym6jNdJkrzvXRMx6NGdd3rtgZZ76O3zQly8kJbxx98xz2JJR3PgVeQQaUFucVguPfhIKwH
 4rU2AwoZi77pPrM5imAIJVFlKGyRFNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-HtGPMoY4PtWtG-H-ke6meA-1; Mon, 15 Mar 2021 12:29:48 -0400
X-MC-Unique: HtGPMoY4PtWtG-H-ke6meA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA958800C78;
 Mon, 15 Mar 2021 16:29:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA15F5C3E6;
 Mon, 15 Mar 2021 16:29:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 39EF31132C12; Mon, 15 Mar 2021 17:29:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v6 01/10] qemu-options: New -compat to set policy for
 deprecated interfaces
References: <20210312153210.2810514-1-armbru@redhat.com>
 <20210312153210.2810514-2-armbru@redhat.com>
 <f9740848-f374-c242-90f9-475f38cacf0a@redhat.com>
Date: Mon, 15 Mar 2021 17:29:45 +0100
In-Reply-To: <f9740848-f374-c242-90f9-475f38cacf0a@redhat.com> (Eric Blake's
 message of "Mon, 15 Mar 2021 10:41:19 -0500")
Message-ID: <87a6r4crd2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 3/12/21 9:32 AM, Markus Armbruster wrote:
>> New option -compat lets you configure what to do when deprecated
>> interfaces get used.  This is intended for testing users of the
>> management interfaces.  It is experimental.
>> 
>> -compat deprecated-input=<input-policy> configures what to do when
>> deprecated input is received.  Input policy can be "accept" (accept
>> silently), or "reject" (reject the request with an error).
>> 
>> -compat deprecated-output=<out-policy> configures what to do when
>> deprecated output is sent.  Output policy can be "accept" (pass on
>> unchanged), or "hide" (filter out the deprecated parts).
>> 
>> Default is "accept".  Policies other than "accept" are implemented
>> later in this series.
>> 
>> For now, -compat covers only syntactic aspects of QMP, i.e. stuff
>> tagged with feature 'deprecated'.  We may want to extend it to cover
>> semantic aspects, CLI, and experimental features.
>> 
>> Note that there is no good way for management application to detect
>> presence of -compat: it's not visible output of query-qmp-schema or
>> query-command-line-options.  Tolerable, because it's meant for
>> testing.  If running with -compat fails, skip the test.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> ---
>
>> +++ b/qapi/compat.json
>> @@ -0,0 +1,51 @@
>> +# -*- Mode: Python -*-
>> +
>> +##
>> +# = Compatibility policy
>> +##
>> +
>> +##
>> +# @CompatPolicyInput:
>> +#
>> +# Policy for handling "funny" input.
>> +#
>> +# @accept: Accept silently
>> +# @reject: Reject with an error
>> +#
>> +# Since: 5.2
>
> 6.0
>
>> +##
>> +{ 'enum': 'CompatPolicyInput',
>> +  'data': [ 'accept', 'reject' ] }
>> +
>> +##
>> +# @CompatPolicyOutput:
>> +#
>> +# Policy for handling "funny" output.
>> +#
>> +# @accept: Pass on unchanged
>> +# @hide: Filter out
>> +#
>> +# Since: 5.2
>
> and here
>
>> +##
>> +{ 'enum': 'CompatPolicyOutput',
>> +  'data': [ 'accept', 'hide' ] }
>> +
>> +##
>> +# @CompatPolicy:
>> +#
>> +# Policy for handling deprecated management interfaces.
>> +#
>> +# This is intended for testing users of the management interfaces.
>> +#
>> +# Limitation: covers only syntactic aspects of QMP, i.e. stuff tagged
>> +# with feature 'deprecated'.  We may want to extend it to cover
>> +# semantic aspects, CLI, and experimental features.
>> +#
>> +# @deprecated-input: how to handle deprecated input (default 'accept')
>> +# @deprecated-output: how to handle deprecated output (default 'accept')
>> +#
>> +# Since: 5.2
>
> and here
>
>> +##
>> +{ 'struct': 'CompatPolicy',
>> +  'data': { '*deprecated-input': 'CompatPolicyInput',
>> +            '*deprecated-output': 'CompatPolicyOutput' } }
>> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
>> index 3441c9a9ae..4912b9744e 100644
>
> R-b still stands once you make the necessary tweaks.

I thought I had updated these...  Thanks for catching my mistake!


