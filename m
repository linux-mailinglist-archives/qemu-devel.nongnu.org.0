Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E9B4BFDCC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 16:54:46 +0100 (CET)
Received: from localhost ([::1]:47776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXUz-0003vZ-FK
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 10:54:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nMWd0-0001Hq-PN
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 09:58:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nMWcx-0000LH-OY
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 09:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645541934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=POlxMWX8Gzu1ByjoTTpb43vj1qNOrCaIJq5NivNPMAo=;
 b=Hr36rs9nzIzy0XqIiTreLxg6y66KCRZ3zEad5Kw5HvwOQYGR3ouQqvr/ypTpI6U5QzQAEx
 s7nuAFIMbuxSHAzGIkvsrS0UAciDabmNu5ZNOdwAq37LF8QvEoM6A+LBjoLaQPGlt0bqhi
 QnB1zFB8n7QBmZDK7H5F0RK6AOuoAhE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-rEdE3UPlPy6_MAxu5kpzUA-1; Tue, 22 Feb 2022 09:58:53 -0500
X-MC-Unique: rEdE3UPlPy6_MAxu5kpzUA-1
Received: by mail-ej1-f70.google.com with SMTP id
 kw5-20020a170907770500b006ba314a753eso5847187ejc.21
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 06:58:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=POlxMWX8Gzu1ByjoTTpb43vj1qNOrCaIJq5NivNPMAo=;
 b=Kd1ipPaguADckcsIbh41AssH2R1UE6C4kkYO0PC+zakKWankRo5zkdxnbJA2rR1B1g
 3AVmpg8dted2J7f0rE5rMWLdXJcjVqshdfiyfTu6XbeSNrlAG2AKpIbtj62Xe8Vz5dC9
 3i6Vtx+xtQmH4YmeN5XcdPGQU/6dInKXidKTbPiWcTdhd+C5Xk9OrC7RlEXSdVr7FZs2
 GIxuUhXSYZtdTHiLRWxi04Yirm8l3qhN1EljlhPgnwGHQrMH5dPYX76FmvPY5bn6jcTv
 8KusewbWwqVZqhC2aa+HcFLC8lKOg8y8eURL/07lO4wG2swXjLAKpjLzkQXe9wlQwi8H
 oP4A==
X-Gm-Message-State: AOAM530dy/OrT0kKfz0LE8UKQiMe9ytYuLOuxqOe5HO9x3hy8D6niMZA
 TJ2Xa+ro/9eB0CMnPbPAwmwOw77IDg6hzyVTeUU5fy7iNZrvzcFxfQqfMQ3ycVFQZldfUnR3PkV
 7/CVh1jKu3nF8Yik=
X-Received: by 2002:a17:906:3e09:b0:6ce:d86c:91a3 with SMTP id
 k9-20020a1709063e0900b006ced86c91a3mr19539186eji.255.1645541932260; 
 Tue, 22 Feb 2022 06:58:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJym6UTFbsDtjNviu5RmNp8PD+3SUlpFTupcptfNF2+gRJVxN7Z1PRLPOtKoAsgKQhFh64aX9Q==
X-Received: by 2002:a17:906:3e09:b0:6ce:d86c:91a3 with SMTP id
 k9-20020a1709063e0900b006ced86c91a3mr19539173eji.255.1645541932036; 
 Tue, 22 Feb 2022 06:58:52 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1?
 ([2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1])
 by smtp.gmail.com with ESMTPSA id c11sm10743717edx.42.2022.02.22.06.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 06:58:51 -0800 (PST)
Message-ID: <93a45ab0-5b28-7205-1ad4-69af403181a9@redhat.com>
Date: Tue, 22 Feb 2022 15:58:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] block/curl.c: Check error return from curl_easy_setopt()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220128165535.2550899-1-peter.maydell@linaro.org>
 <a26290d8-558c-ba85-ccf9-b56051a6dd75@redhat.com>
 <CAFEAcA8_=dTPqAAptA_Ua8fAr15d8PtVQP_TWxHzN7y7NXBhAw@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFEAcA8_=dTPqAAptA_Ua8fAr15d8PtVQP_TWxHzN7y7NXBhAw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.02.22 20:45, Peter Maydell wrote:
> On Tue, 1 Feb 2022 at 11:25, Hanna Reitz <hreitz@redhat.com> wrote:
>> On 28.01.22 17:55, Peter Maydell wrote:
>>> Coverity points out that we aren't checking the return value
>>> from curl_easy_setopt() for any of the calls to it we make
>>> in block/curl.c.
>>>
>>> Fixes: Coverity CID 1459336, 1459482, 1460331
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> Big fat disclaimer: tested only with 'make check', which I suspect
>>> may not be exercising this block backend. Hints on how to test
>>> more thoroughly are welcome.
>>>
>>>    block/curl.c | 90 +++++++++++++++++++++++++++++++++-------------------
>>>    1 file changed, 58 insertions(+), 32 deletions(-)
>> One problem I see in general is that most of the setopt functions are
>> (indirectly) called from `curl_open()`, which is supposed to return an
>> error message.  Its `out` label seems to expect some error description
>> in `state->errmsg`.  The error handling here doesn’t set such a description.
> Ah, yes, I hadn't noticed that -- it's a pre-existing bug, where
> we do this:
>
>      if (curl_init_state(s, state) < 0) {
>          goto out;
>      }
>
> and curl_init_state() already has an error path (for when curl_easy_init()
> fails) that can take that goto without setting state->errmsg...
>
>> Then again, there are enough existing error paths that don’t set this
>> description either, so it isn’t quite this patch’s duty to fix that
>> situation.
> ...as you've already noticed :-)
>
>> I guess it would be nice if we had a wrapper for
>> `curl_easy_setopt()` with an `Error **` parameter, so we could easily
>> generate error messages that describe key and value (and then
>> `curl_init_state()` should have an `Error **` parameter, too).
>>
>> But this patch doesn’t make anything worse than it already is, so that’d
>> rather be an idea for future clean-up.
>>
>>> diff --git a/block/curl.c b/block/curl.c
>>> index 6a6cd729758..aaee1b17bef 100644
>>> --- a/block/curl.c
>>> +++ b/block/curl.c
>> [...]
>>
>>> @@ -879,7 +902,10 @@ static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
>>>
>>>        snprintf(state->range, 127, "%" PRIu64 "-%" PRIu64, start, end);
>>>        trace_curl_setup_preadv(acb->bytes, start, state->range);
>>> -    curl_easy_setopt(state->curl, CURLOPT_RANGE, state->range);
>>> +    if (curl_easy_setopt(state->curl, CURLOPT_RANGE, state->range)) {
>>> +        curl_clean_state(state);
>>> +        goto out;
>> I think we need to mark the request as failed by setting `acb->ret` to a
>> negative value (and probably also clear `state->acb[0]` like the error
>> path below does).
> OK; or I could roll the two curl calls into the same if:
>
>      if (curl_easy_setopt(state->curl, CURLOPT_RANGE, state->range) ||
>          curl_multi_add_handle(s->multi, state->curl) != CURLM_OK) {
>          /* existing error handling and goto-out code */
>      }

Sure, that sounds perfectly good to me.

Hanna


