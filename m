Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACAB5E74C7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 09:22:37 +0200 (CEST)
Received: from localhost ([::1]:44418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obd17-00022Y-6Y
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 03:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obctI-00074T-5C
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 03:14:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obctE-0006m1-F4
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 03:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663917263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PoULoq8U+IwvURAHJ53HBSIRN4UVqjnw5zl4X4OHKCs=;
 b=fIFdLR18VTYpJ0cvFyvEgIXMM03TzbxEBl4OxNuDimj1+8ZHJg1GtWgMwKkjbwruwLAJVj
 JKRpDD/dIwiO9OqstBEVRCsf+u7sfn5aRZzQu+ZG7FxP90AEw2/WiUl6aErke/tLJnBqDB
 eNXeUdKN2esf4pnwdz4l0oCOmlmQJeA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-5uRDr54tOgK5rvhe-zQLtQ-1; Fri, 23 Sep 2022 03:14:20 -0400
X-MC-Unique: 5uRDr54tOgK5rvhe-zQLtQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA449185A792;
 Fri, 23 Sep 2022 07:14:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E305C15BA5;
 Fri, 23 Sep 2022 07:14:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2FFE121E6900; Fri, 23 Sep 2022 09:14:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Cc: Wang Liang <wangliangzz@126.com>,  qemu-devel@nongnu.org,
 qemu-block@nongnu.org,  pbonzini@redhat.com,  stefanha@redhat.com,
 silbe@linux.vnet.ibm.com,  Wang Liang <wangliangzz@inspur.com>
Subject: Re: [PATCH] ratelimit: restrict the delay time to a non-negative value
References: <20220920123350.205391-1-wangliangzz@126.com>
 <w51h712i3pd.fsf@igalia.com>
 <f4b8e638285a7cfd2bd2e94c0bf9a1176cca0cb7.camel@126.com>
 <w511qs5w38j.fsf@igalia.com>
Date: Fri, 23 Sep 2022 09:14:16 +0200
In-Reply-To: <w511qs5w38j.fsf@igalia.com> (Alberto Garcia's message of "Wed,
 21 Sep 2022 08:17:32 +0000")
Message-ID: <878rmah8af.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Alberto Garcia <berto@igalia.com> writes:

> On Wed 21 Sep 2022 09:47:32 AM +08, Wang Liang wrote:
>>> > -    return limit->slice_end_time - now;
>>> > +    return MAX(limit->slice_end_time - now, 0);
>>> 
>>> How can this be negative? slice_end_time is guaranteed to be larger
>>> than
>>> now:
>>> 
>>>     if (limit->slice_end_time < now) {
>>>         /* Previous, possibly extended, time slice finished; reset
>>> the
>>>          * accounting. */
>>>         limit->slice_start_time = now;
>>>         limit->slice_end_time = now + limit->slice_ns;
>>>         limit->dispatched = 0;
>>>     }
>>> 
>> This is just a guarantee. 
>>
>> If slice_end_time is assigned later by
>>     limit->slice_end_time = limit->slice_start_time +
>>         (uint64_t)(delay_slices * limit->slice_ns);
>> There may be precision issues at that time.
>
> Ok, on a closer look, if at the start of the function
>
>    limit->slice_start_time < now, and
>    limit->slice_end_time >= now
>
> it seems that in principle what you say can happen.

How?  Let's see.

    static inline int64_t ratelimit_calculate_delay(RateLimit *limit, uint64_t n)
    {
        int64_t now = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);

What kind of clock is QEMU_CLOCK_REALTIME?  See below.

        double delay_slices;

        QEMU_LOCK_GUARD(&limit->lock);
        if (!limit->slice_quota) {
            /* Throttling disabled.  */
            return 0;
        }
        assert(limit->slice_ns);

        if (limit->slice_end_time < now) {

This is false.

            /* Previous, possibly extended, time slice finished; reset the
             * accounting. */
            limit->slice_start_time = now;
            limit->slice_end_time = now + limit->slice_ns;
            limit->dispatched = 0;
        }

        limit->dispatched += n;

This is in theory vulnerable to wrap-around.

        if (limit->dispatched < limit->slice_quota) {

This must be false (or else we return 0, which isn't negative).

            /* We may send further data within the current time slice, no
             * need to delay the next request. */
            return 0;
        }

        /* Quota exceeded. Wait based on the excess amount and then start a new
         * slice. */
        delay_slices = (double)limit->dispatched / limit->slice_quota;

Both @dispatched and @slice_quota are uint64_t.  Conversion to double
may lose precision, but cant't change the sign.  Therefore,
@delay_slices is non-negative.

        limit->slice_end_time = limit->slice_start_time +
            (uint64_t)(delay_slices * limit->slice_ns);

Conversion from double to uint64_t has undefined behavior when the value
is not representable after truncation towards zero.  So, if the
multiplication's result truncated towards zero exceeds UINT_MAX, we're
theoretically toast.

To return a negative value, @slice_end_time must become less than @now
here.

        return limit->slice_end_time - now;
    }

This is how far I get without (laboriously!) reconstructing what the
members of struct RateLimit actually mean, and what its invariants are,
if any.  We could write down such things in comments, but we prefer to
keep things fresh and spicy, and developers confused.

Can you elaborate on the "precision issues"?

> If it's so, it would be good to know under what conditions this happens,
> because this hasn't changed in years.
>
> Berto


