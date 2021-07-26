Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BDE3D53A8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 09:15:11 +0200 (CEST)
Received: from localhost ([::1]:41170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7upS-00009v-EJ
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 03:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m7ulp-00037x-I5
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 03:11:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m7ulo-0005iO-5N
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 03:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627283483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQW5EdNWYsSAKmBO7uBQCqRMkqpBvMDyooh4DcoS2Ww=;
 b=T/5ZEDH3gBnuCwaVqciGePWnmMLq3Rd9ODsV43PQiapkZgnDv10o+yrSIfB6GJ8ZgVVISF
 K/Xj1Cf638/Q/uMHsXf1LOjgVXXPdK9t2SSlv/ZjQiN5kGEIRw54dEoUnisLbahbleYLoo
 X7ueqkR6eKveR2v7mPK4IKcP/vRwSXU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-vJNJcDH5MnC9A6WG0NEc3A-1; Mon, 26 Jul 2021 03:11:22 -0400
X-MC-Unique: vJNJcDH5MnC9A6WG0NEc3A-1
Received: by mail-wr1-f70.google.com with SMTP id
 p2-20020a5d48c20000b0290150e4a5e7e0so4296451wrs.13
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 00:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CQW5EdNWYsSAKmBO7uBQCqRMkqpBvMDyooh4DcoS2Ww=;
 b=Im9CnYqK+IDJWfmTpGJqbmqBnAUG63n4nGM6Bt16GOQQbKKvXTGrlzVCT6MqBTBthr
 1GiJpwfXbq5DggceluPKAzNong1slG5rjLs1oJw0Kb+AoZUEFSZvLX0FhDxk0HHaHp1B
 y7YSitMk2N0VdmhV79afxACR2mUaLN8LbWIB7AlnWkwxsUaNiHQ87BcdyW/kMefxNYY+
 J2cQ6W7KtF8hat118QM/pve8yNKuiuNZ18PvgzzI0lj5jbQ99JgMxdLz6ayNnoILCWIu
 krNOyZ57l2zzWIV/ztthPIkLIznhTPlUW0P56n5a4OFxOBRsw8Ii3ljBRng7+DPp/B8V
 ZH0Q==
X-Gm-Message-State: AOAM530dh2xfC8gwkk3+DyDw0z2igxYDHE9kLSUEB+jZ9aoPhK43PFR4
 Hl6bh7IGmc2koLbOWIEM4wHS60Cixrq2WkcYx0BNbI/9YnRrWUiYJwWlAlm8sGmXtAtob86kL83
 NRV07o3SQmkSCD2Q=
X-Received: by 2002:a1c:9ace:: with SMTP id c197mr4161788wme.170.1627283480833; 
 Mon, 26 Jul 2021 00:11:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLoF94W2IjYzZBlSmEXANhBA7kte3thjkqHtnmLWXUx6RlhTbdPUCCrH4tpK/zRlIFm3mwjA==
X-Received: by 2002:a1c:9ace:: with SMTP id c197mr4161763wme.170.1627283480651; 
 Mon, 26 Jul 2021 00:11:20 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 j15sm4875561wms.20.2021.07.26.00.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 00:11:20 -0700 (PDT)
Subject: Re: [PATCH for-6.1? 1/6] mirror: Keep s->synced on error
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210722122627.29605-1-mreitz@redhat.com>
 <20210722122627.29605-2-mreitz@redhat.com>
 <09dec00d-0ffc-f30c-2edd-c6ef886de05f@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <ff9fc44a-a40d-04f7-0091-99a1cb40b472@redhat.com>
Date: Mon, 26 Jul 2021 09:11:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <09dec00d-0ffc-f30c-2edd-c6ef886de05f@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.091, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.07.21 18:25, Vladimir Sementsov-Ogievskiy wrote:
> 22.07.2021 15:26, Max Reitz wrote:
>> An error does not take us out of the READY phase, which is what
>> s->synced signifies.  It does of course mean that source and target are
>> no longer in sync, but that is what s->actively_sync is for -- s->synced
>> never meant that source and target are in sync, only that they were at
>> some point (and at that point we transitioned into the READY phase).
>>
>> The tangible problem is that we transition to READY once we are in sync
>> and s->synced is false.  By resetting s->synced here, we will transition
>> from READY to READY once the error is resolved (if the job keeps
>> running), and that transition is not allowed.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   block/mirror.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/block/mirror.c b/block/mirror.c
>> index 98fc66eabf..d73b704473 100644
>> --- a/block/mirror.c
>> +++ b/block/mirror.c
>> @@ -121,7 +121,6 @@ typedef enum MirrorMethod {
>>   static BlockErrorAction mirror_error_action(MirrorBlockJob *s, bool 
>> read,
>>                                               int error)
>>   {
>> -    s->synced = false;
>>       s->actively_synced = false;
>>       if (read) {
>>           return block_job_error_action(&s->common, s->on_source_error,
>>
>
> Looked through.. Yes, seems s->synced used as "is ready". Isn't it 
> better to drop s->synced at all and use job_is_read() instead?

Sounds good, though I think for the change to be clear, I’d like to keep 
this patch and then drop s->synced on top.

Max

> Hmm, s->actively_synced used only for assertion in 
> active_write_settle().. That's not wrong, just interesting.


