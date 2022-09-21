Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 035445BF5B4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 06:57:06 +0200 (CEST)
Received: from localhost ([::1]:43206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oarnF-00042Q-0b
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 00:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oarkB-000172-Nj
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 00:53:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oarjw-0006MN-19
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 00:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663736018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m2oPux/AHFI6vMK5so4TExYuH+Aj/zZ/EaoHxvFBiyo=;
 b=N+ycNSQSJf3MLP+3lzDnIBYDg/6H5ttI4qYkBSttBBdkp/UCSAzowNU1oMw7DVYIplR2qj
 YWuKsvUAdhFOvqSaPsn1x2NycqLnK7pwzyjCY43g36MSWsnQ/XfZZtSdK8KREvsgvvTPl/
 jlNtvokuaJtzZsT9AR26HeEjR1PRg0g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-sbkmM5uZM7mvKH8-eONswQ-1; Wed, 21 Sep 2022 00:53:36 -0400
X-MC-Unique: sbkmM5uZM7mvKH8-eONswQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FCC92999B45;
 Wed, 21 Sep 2022 04:53:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4259C492CA2;
 Wed, 21 Sep 2022 04:53:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 28F9021E6900; Wed, 21 Sep 2022 06:53:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Wang Liang <wangliangzz@126.com>
Cc: Alberto Garcia <berto@igalia.com>,  qemu-devel@nongnu.org,
 qemu-block@nongnu.org,  pbonzini@redhat.com,  stefanha@redhat.com,
 silbe@linux.vnet.ibm.com,  Wang Liang <wangliangzz@inspur.com>
Subject: Re: [PATCH] ratelimit: restrict the delay time to a non-negative value
References: <20220920123350.205391-1-wangliangzz@126.com>
 <w51h712i3pd.fsf@igalia.com>
 <f4b8e638285a7cfd2bd2e94c0bf9a1176cca0cb7.camel@126.com>
Date: Wed, 21 Sep 2022 06:53:34 +0200
In-Reply-To: <f4b8e638285a7cfd2bd2e94c0bf9a1176cca0cb7.camel@126.com> (Wang
 Liang's message of "Wed, 21 Sep 2022 09:47:32 +0800")
Message-ID: <87edw5gwfl.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wang Liang <wangliangzz@126.com> writes:

> On Tue, 2022-09-20 at 13:18 +0000, Alberto Garcia wrote:
>> On Tue 20 Sep 2022 08:33:50 PM +08, wangliangzz@126.com wrote:
>> > From: Wang Liang <wangliangzz@inspur.com>
>> > 
>> > The delay time should never be a negative value.
>> > 
>> > -    return limit->slice_end_time - now;
>> > +    return MAX(limit->slice_end_time - now, 0);
>> 
>> How can this be negative? slice_end_time is guaranteed to be larger
>> than
>> now:
>> 
>>     if (limit->slice_end_time < now) {
>>         /* Previous, possibly extended, time slice finished; reset
>> the
>>          * accounting. */
>>         limit->slice_start_time = now;
>>         limit->slice_end_time = now + limit->slice_ns;
>>         limit->dispatched = 0;
>>     }
>> 
> This is just a guarantee. 

Smells like an invariant to me.

> If slice_end_time is assigned later by
>     limit->slice_end_time = limit->slice_start_time +
>         (uint64_t)(delay_slices * limit->slice_ns);
> There may be precision issues at that time.

What are the issues exactly?  What misbehavior are you observing?

Your commit message should show how delay time can become negative, and
why that's bad.


