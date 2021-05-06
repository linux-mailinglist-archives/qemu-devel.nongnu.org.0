Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A245375BEF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:44:48 +0200 (CEST)
Received: from localhost ([::1]:37090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejvT-0001So-NQ
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lejtf-0000S6-LZ
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:42:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lejtc-0005QL-Ur
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:42:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620330171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eraw/UcYLb3IMC/zDSK6jL0qoObBOVSM50npVJ+FeZo=;
 b=MCoiCRWotYOCu90FjbQjU1emcDfjqC3mKmPiFjju/JQ80nJWTCY6RNSZEkL5zyZicCuVc+
 uGt7/dWQCa0vEJfDr5FbgnCNfb8YaYUvkFTfbycdWn8JS9UHqu3UnxhBeq1TJK1Q4IJgXX
 XLgtaykdhBPS41p9ozPVWCEyYzz637I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-s3iOfwGENPqcYg11fv6QdQ-1; Thu, 06 May 2021 15:42:50 -0400
X-MC-Unique: s3iOfwGENPqcYg11fv6QdQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j3-20020a1c55030000b029012e7c06101aso1182230wmb.5
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 12:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eraw/UcYLb3IMC/zDSK6jL0qoObBOVSM50npVJ+FeZo=;
 b=JWEN7sb+JwlZKhh5QO8nsAUbXv2fpJs+4BbZ9hglKBGpE8+UwV4ES+F05prQNk1z2l
 cqyD4bgVLvdXcsqbZ4+bAYBnWet7tA/HGlqmgfOzxyd2wLnqs+sbuQacOBKvIa4zlL4L
 3Bpu9u1bBnGX5+44TLjab/ba4XWwy59r4hNc4VPIbk35Q5DrVO+qpe0Pxx2I9UDbH2rd
 4GBriA70mTXTsbhmsljZYWq7UfqH5dNqOOKHUECNozYUbU6/m08NX5YYXGru54guWB/S
 CZb3KGnp+ahiwy27YYT5CN9jf9RqMt+mx0DNRnEpBCJNf2gjvM+auxhL1X3eSegB0VoA
 Heuw==
X-Gm-Message-State: AOAM533CGnlxkUc9q3CMLtIEN73MrMO2hsSln+KeBKlCrMWGwwTqg2WX
 0vP4Enx3q+4UxR2aa161Jm3rMZpFL1gIvzUv3zE3IBco66M2g8HcUWl689fJpHLGTSq06kZZiB6
 hBRuUtK0TEFQqMaU=
X-Received: by 2002:a5d:4386:: with SMTP id i6mr7517744wrq.207.1620330168932; 
 Thu, 06 May 2021 12:42:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybGGwg96Gl/8F4LwrCaxZn8kuuGbkG7H/lTWm+y40xAAWp1qAJzNjSiTz5nXyHEICPDQ5ZAg==
X-Received: by 2002:a5d:4386:: with SMTP id i6mr7517717wrq.207.1620330168757; 
 Thu, 06 May 2021 12:42:48 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id u9sm4738917wmc.38.2021.05.06.12.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 12:42:48 -0700 (PDT)
Subject: Re: [PATCH] virtio-blk: Convert QEMUBH callback to "bitops.h" API
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210506155419.1796056-1-philmd@redhat.com>
 <fdf97a71-1359-e186-a895-3383c31ca20c@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <20266f2d-00e2-339a-0fdf-122c32ae4da1@redhat.com>
Date: Thu, 6 May 2021 21:42:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <fdf97a71-1359-e186-a895-3383c31ca20c@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Li Hangjing <lihangjing@baidu.com>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Chai Wen <chaiwen@baidu.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xie Yongji <xieyongji@baidu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 8:22 PM, Richard Henderson wrote:
> On 5/6/21 8:54 AM, Philippe Mathieu-Daudé wrote:
>>   static void notify_guest_bh(void *opaque)
>>   {
>>       VirtIOBlockDataPlane *s = opaque;
>> -    unsigned nvqs = s->conf->num_queues;
>> -    unsigned long bitmap[BITS_TO_LONGS(nvqs)];
>> -    unsigned j;
>>   -    memcpy(bitmap, s->batch_notify_vqs, sizeof(bitmap));
>> -    memset(s->batch_notify_vqs, 0, sizeof(bitmap));
>> -
>> -    for (j = 0; j < nvqs; j += BITS_PER_LONG) {
>> -        unsigned long bits = bitmap[j / BITS_PER_LONG];
>> -
>> -        while (bits != 0) {
>> -            unsigned i = j + ctzl(bits);
>> +    for (unsigned i = 0; i < s->conf->num_queues; i++) {
> 
> Is this bitmap dense enough that you want to iterate by index,

By 'iterate by index' do you mean the actual iteration with 'j'?

> or is it
> sparse enough to iterate via find_first_bit/find_next_bit?

I looked at find_first_bit/find_next_bit() but they seemed to do
a lot more than test_and_clear_bit(). As Stefan said this is hot
path, I thought this would be cheaper, but haven't profiled the
performance.

> In either case, leave the copy of  s->conf->num_queues to a local variable.

That is sensible to do :)


