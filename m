Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04BB4EDC2F
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 16:55:55 +0200 (CEST)
Received: from localhost ([::1]:41038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwDK-0004OD-L4
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 10:55:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZwAU-0000zj-86
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 10:52:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZwAR-0006vS-SK
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 10:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648738374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAnxoiBGsodwGSee2CH/Ydwc1vP7Ff7yLSLVvYh/Ljw=;
 b=B0PZ129Ekgc40DPBsubjJC7MgYQxI+1zNDDe5QoBgE7SnQnhzVOPDHrVhTEdqmW0YeoKOQ
 9eZd+yFQOlolcnJCyktAoC7r1c+k05vpq//af4NOrb9QAkKR/7B3W4IXZYn4Gzh9At2qTM
 tDCukMrS/NK8RD4GizpNgb85zHsSYII=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-W4txmPi3PvqBQRPQ_huYqQ-1; Thu, 31 Mar 2022 10:52:51 -0400
X-MC-Unique: W4txmPi3PvqBQRPQ_huYqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79422108C1BA;
 Thu, 31 Mar 2022 14:52:49 +0000 (UTC)
Received: from [10.39.192.58] (unknown [10.39.192.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F154B53CD;
 Thu, 31 Mar 2022 14:52:37 +0000 (UTC)
Message-ID: <de14d27b-23ae-ec9a-2f51-992ca6a78e2c@redhat.com>
Date: Thu, 31 Mar 2022 16:52:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] target/s390x: Fix determination of overflow condition
 code after addition
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20220323162621.139313-1-thuth@redhat.com>
 <20220323162621.139313-2-thuth@redhat.com>
 <2b82de5e-a259-576c-5ea5-eb5c10e6bbeb@redhat.com>
 <bfca5877-a673-f720-f58f-a65b8c956472@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <bfca5877-a673-f720-f58f-a65b8c956472@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Bruno Haible <bruno@clisp.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/03/2022 16.03, Richard Henderson wrote:
> On 3/30/22 02:52, David Hildenbrand wrote:
>>>   static uint32_t cc_calc_add_64(int64_t a1, int64_t a2, int64_t ar)
>>>   {
>>> -    if ((a1 > 0 && a2 > 0 && ar < 0) || (a1 < 0 && a2 < 0 && ar > 0)) {
>>> +    if ((a1 > 0 && a2 > 0 && ar < 0) || (a1 < 0 && a2 < 0 && ar >= 0)) {
>>
>>
>> Intuitively, I'd have checked for any overflow/underflow by comparing
>> with one of the input variables:
>>
>> a) Both numbers are positive
>>
>> Adding to positive numbers has to result in something that's bigger than
>> the input parameters.
>>
>> "a1 > 0 && a2 > 0 && ar < a1"
>>
>> b) Both numbers are negative
>>
>> Adding to negative numbers has to result in something that's smaller
>> than the input parameters.
>>
>> "a1 < 0 && a2 < 0 && ar > a1"
> 
> If we're not going to just fix the >= typo,
> I'd suggest using the much more compact bitwise method:
> 
>      ((ar ^ a1) & ~(a1 ^ a2)) < 0
> 
> See sadd64_overflow in qemu/host-utils.h.

Thanks, sounds like a good idea. Anyway, I'd like to go with Bruno's patch 
for 7.0 and do the optimization in the 7.1 cycle instead.

  Thomas


