Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9474B37F019
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:52:47 +0200 (CEST)
Received: from localhost ([::1]:33378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgyek-0005lf-Lb
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgydY-0004x0-M0
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:51:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgydW-0005K3-Pn
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620863489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=esB72gugQvbf7TrzQxu+nCdSFDnpO+fbJr2wf8YkUl0=;
 b=d+0ic5VZVGSDIR927hxOjwEvUfE3EAut6rVivGyMl8xotW1w5+qM3PaM7lnaNBcV+ebWAp
 Lnkwr8DZLjrGft7hoT+3kd5dYZHDobpMfkYCFA8xiq5lReVBjPPtIa/SJ/6RLq28IMleQH
 wMo9JihZ8oh7ZnNPaCq5opawu72/sho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-gaLl87CTPZWp3xSJLnxwUQ-1; Wed, 12 May 2021 19:51:25 -0400
X-MC-Unique: gaLl87CTPZWp3xSJLnxwUQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C06AEFC93
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 23:51:24 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D00FC19D9F;
 Wed, 12 May 2021 23:51:17 +0000 (UTC)
Subject: Re: [PATCH v3 7/9] qapi: convert 'if' C-expressions to the new syntax
 tree
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-8-marcandre.lureau@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <4ed66620-1e7a-fbc1-78c2-1919484a7ff2@redhat.com>
Date: Wed, 12 May 2021 19:51:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210429134032.1125111-8-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 9:40 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   qapi/machine-target.json | 20 ++++++++++++++++----
>   qapi/misc-target.json    | 13 ++++++++++++-
>   2 files changed, 28 insertions(+), 5 deletions(-)
> 
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index e7811654b7..9b56b81bea 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -213,7 +213,9 @@
>   ##
>   { 'struct': 'CpuModelExpansionInfo',
>     'data': { 'model': 'CpuModelInfo' },
> -  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET_ARM)' }
> +  'if': { 'any': [ 'defined(TARGET_S390X)',
> +                   'defined(TARGET_I386)',
> +                   'defined(TARGET_ARM)'] } }
>   
>   ##
>   # @query-cpu-model-expansion:
> @@ -252,7 +254,9 @@
>     'data': { 'type': 'CpuModelExpansionType',
>               'model': 'CpuModelInfo' },
>     'returns': 'CpuModelExpansionInfo',
> -  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET_ARM)' }
> +  'if': { 'any': [ 'defined(TARGET_S390X)',
> +                   'defined(TARGET_I386)',
> +                   'defined(TARGET_ARM)' ] } }
>   
>   ##
>   # @CpuDefinitionInfo:
> @@ -316,7 +320,11 @@
>               'typename': 'str',
>               '*alias-of' : 'str',
>               'deprecated' : 'bool' },
> -  'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
> +  'if': { 'any': [ 'defined(TARGET_PPC)',
> +                   'defined(TARGET_ARM)',
> +                   'defined(TARGET_I386)',
> +                   'defined(TARGET_S390X)',
> +                   'defined(TARGET_MIPS)' ] } }
>   
>   ##
>   # @query-cpu-definitions:
> @@ -328,4 +336,8 @@
>   # Since: 1.2
>   ##
>   { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
> -  'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
> +  'if': { 'any': [ 'defined(TARGET_PPC)',
> +                   'defined(TARGET_ARM)',
> +                   'defined(TARGET_I386)',
> +                   'defined(TARGET_S390X)',
> +                   'defined(TARGET_MIPS)' ] } }
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 0c7491cd82..2891df6890 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -23,7 +23,18 @@
>   ##
>   { 'event': 'RTC_CHANGE',
>     'data': { 'offset': 'int' },
> -  'if': 'defined(TARGET_ALPHA) || defined(TARGET_ARM) || defined(TARGET_HPPA) || defined(TARGET_I386) || defined(TARGET_MIPS) || defined(TARGET_MIPS64) || defined(TARGET_MOXIE) || defined(TARGET_PPC) || defined(TARGET_PPC64) || defined(TARGET_S390X) || defined(TARGET_SH4) || defined(TARGET_SPARC)' }
> +  'if': { 'any': [ 'defined(TARGET_ALPHA)',
> +                   'defined(TARGET_ARM)',
> +                   'defined(TARGET_HPPA)',
> +                   'defined(TARGET_I386)',
> +                   'defined(TARGET_MIPS)',
> +                   'defined(TARGET_MIPS64)',
> +                   'defined(TARGET_MOXIE)',
> +                   'defined(TARGET_PPC)',
> +                   'defined(TARGET_PPC64)',
> +                   'defined(TARGET_S390X)',
> +                   'defined(TARGET_SH4)',
> +                   'defined(TARGET_SPARC)' ] } }
>   
>   ##
>   # @rtc-reset-reinjection:
> 

I suppose these are necessary to convert because they were a single 
giant string, and not actually a list.

If you're going to keep the list-of-strings sugar, is it worth just 
changing these to a list of strings?

(How does your rust generator handle the defined(xxx) strings? does it 
strip the defined(...) off somehow?)

Tested-by: John Snow <jsnow@redhat.com>

--js


