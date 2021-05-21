Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA9838C540
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 12:49:48 +0200 (CEST)
Received: from localhost ([::1]:41876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk2ix-0002mF-0K
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 06:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lk2hu-00027N-3j
 for qemu-devel@nongnu.org; Fri, 21 May 2021 06:48:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lk2hn-0000KJ-Jg
 for qemu-devel@nongnu.org; Fri, 21 May 2021 06:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621594112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/lW1TISdxwtKvmZNgmIYKJxUPo1FAMmrHlBYZeWmG0U=;
 b=QngBES0GZxrIjzezcuSWDtCFASu2lE7XUqd4NCYLjY3Q81CIUd2pY1CVBP5PucumiBTcez
 WZT/x2bg2q/m5rbMwQAaqox+Egq/iZhFDMItlgAYFMnjYHS/gFXMWsH2xO9LdMHptJLeqX
 irTLEjNCJg0UNXgVi2C6Zgju83KC+Ac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-4LwH_y_7O3yEuBlEfQYLjg-1; Fri, 21 May 2021 06:48:29 -0400
X-MC-Unique: 4LwH_y_7O3yEuBlEfQYLjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DD11101F7D5;
 Fri, 21 May 2021 10:48:25 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-113.ams2.redhat.com [10.36.112.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8149608DB;
 Fri, 21 May 2021 10:48:22 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-5-f4bug@amsat.org>
 <5a77ade3-1a6c-2389-4a1c-2c7c2266f298@redhat.com>
 <20c001a0-60ed-df08-b67d-884022e74d04@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 4/6] gitlab-ci: Add ccache in $PATH and display
 statistics
Message-ID: <396e75d2-fe22-3054-fbee-d6de02339b2a@redhat.com>
Date: Fri, 21 May 2021 12:48:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20c001a0-60ed-df08-b67d-884022e74d04@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Kyle Evans <kevans@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/05/2021 13.27, Philippe Mathieu-Daudé wrote:
> +Stefan/Daniel
> 
> On 5/20/21 10:02 AM, Thomas Huth wrote:
>> On 19/05/2021 20.45, Philippe Mathieu-Daudé wrote:
>>> If a runner has ccache installed, use it and display statistics
>>> at the end of the build.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>    .gitlab-ci.d/buildtest-template.yml | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/.gitlab-ci.d/buildtest-template.yml
>>> b/.gitlab-ci.d/buildtest-template.yml
>>> index f284d7a0eec..a625c697d3b 100644
>>> --- a/.gitlab-ci.d/buildtest-template.yml
>>> +++ b/.gitlab-ci.d/buildtest-template.yml
>>> @@ -6,13 +6,18 @@
>>>          then
>>>            JOBS=$(sysctl -n hw.ncpu)
>>>            MAKE=gmake
>>> +        PATH=/usr/local/libexec/ccache:$PATH
>>>            ;
>>>          else
>>>            JOBS=$(expr $(nproc) + 1)
>>>            MAKE=make
>>> +        PATH=/usr/lib/ccache:/usr/lib64/ccache:$PATH
>>
>> That does not make sense for the shared runners yet. We first need
>> something to enable the caching there - see my series "Use ccache in the
>> gitlab-CI" from April (which is currently stalled unfortunately).
> 
> TL;DR: I don't think we should restrict our templates to shared runners.

I'm certainly not voting for restricting ourselves to only use shared 
runners here - but my concern is that this actually *slows* down the shared 
runners even more! (sorry, I should have elaborated on that in my previous 
mail already)

When I was experimenting with ccache in the shared runners, I saw that the 
jobs are running even slower with ccache enabled as long as the cache is not 
populated yet. You only get a speedup afterwards. So if you add this now 
without also adding the possibility to store the cache persistently, the 
shared runners will try to populate the cache each time just to throw away 
the results afterwards again. Thus all the shared runners only get slower 
without any real benefit here.

Thus we either need to get ccache working properly for the shared runners 
first, or you have to think of a different way of enabling ccache for the 
non-shared runners, so that it does not affect the shared runners negatively.

  Thomas


