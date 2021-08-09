Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219753E4394
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:05:26 +0200 (CEST)
Received: from localhost ([::1]:59484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD29t-0004ct-7N
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mD28y-0003o1-N5
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:04:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mD28v-0004bq-LG
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:04:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628503463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/DGBp3TpRitvnPL1lak0lkG2vtXbHNYRXcvpm+hxY+U=;
 b=EW5uesJ0Ef96WvNEr7k8Xj8WKKtP/+ryf+at0eEJZk6FH7guo1TQuPwZnMRjwV+MZqiQJP
 xuvjA/2FvnpKk6VX6biJXmU23oI8tFTznJB/AJdm0gypp38BbM8APqkQp7e0lXOz+y33QQ
 Hzncn3nYj0n9jicynNwtEizfti+Awwk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-4A-zHvXvM4C97CeeMLHzfg-1; Mon, 09 Aug 2021 06:04:22 -0400
X-MC-Unique: 4A-zHvXvM4C97CeeMLHzfg-1
Received: by mail-wm1-f72.google.com with SMTP id
 b196-20020a1c80cd0000b02902e677003785so2379944wmd.7
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 03:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/DGBp3TpRitvnPL1lak0lkG2vtXbHNYRXcvpm+hxY+U=;
 b=GwZyGoBol+bu3HZGtMccQ62sUD6ljzTFDM3na/b65uaAEquo/MDzcLzRbWodYBeWbV
 r5CwVRjOQJu94xPOcg54ZEaCALbA3d/Wtb6HUpJKlfg56fqyZea2RSgR/0AsbHeoTCWO
 8thlIJlK0AMwnWE+z4hfZ914LvyyFOLlXKfxztYBvirttYeUiqmsxF4gh8SqfTkE9OtV
 w9jGo/8asp67idNSVNXC7qKc6JyxITIT6GWDmksRv2zf/S9wLbPcOnkMoHXUKZvjkalU
 zxyxvrtVsatq3nYKRcjtPPpATe3lYs1xaQbtpntzMi6ulTz7BRiU5rnTu39v2+fqJPj1
 h0Sw==
X-Gm-Message-State: AOAM532hp8xqpS1a9y7wCJ706mwE6yOFNHyb+tvx5sX+GoRJ88zMB2+f
 xb7EhEpvxZwzbHGVim9AMh7i3ktTXHarp5cbmunl2E15vfVk+UttUgZW8OcWzjoM/PNlajlaBKY
 brz+212ISzqI8YdgW9iRiLeDHunYfmkGV9emvmRkcGyoBP7G+O7e3ys74rxLHB+KA
X-Received: by 2002:a5d:4ec4:: with SMTP id s4mr6301861wrv.245.1628503461386; 
 Mon, 09 Aug 2021 03:04:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/BK1qyP9Gd7TxOR4oiNZi0QnuLlUEGhrsnVGwR0JIvbTneYIChP6ANM1jp+/cwMnM7gsqzA==
X-Received: by 2002:a5d:4ec4:: with SMTP id s4mr6301834wrv.245.1628503461053; 
 Mon, 09 Aug 2021 03:04:21 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 z126sm13789280wmc.11.2021.08.09.03.04.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 03:04:20 -0700 (PDT)
Subject: Re: [PATCH for-6.2 v3 01/12] job: Context changes in
 job_completed_txn_abort()
To: Eric Blake <eblake@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-2-mreitz@redhat.com>
 <20210806191604.le6nsksvueq5b3tn@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <b52c1a10-d909-7bd9-337d-77e4c95973aa@redhat.com>
Date: Mon, 9 Aug 2021 12:04:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806191604.le6nsksvueq5b3tn@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.08.21 21:16, Eric Blake wrote:
> On Fri, Aug 06, 2021 at 11:38:48AM +0200, Max Reitz wrote:
>> Finalizing the job may cause its AioContext to change.  This is noted by
>> job_exit(), which points at job_txn_apply() to take this fact into
>> account.
>>
>> However, job_completed() does not necessarily invoke job_txn_apply()
>> (through job_completed_txn_success()), but potentially also
>> job_completed_txn_abort().  The latter stores the context in a local
>> variable, and so always acquires the same context at its end that it has
>> released in the beginning -- which may be a different context from the
>> one that job_exit() releases at its end.  If it is different, qemu
>> aborts ("qemu_mutex_unlock_impl: Operation not permitted").
> Is this a bug fix that needs to make it into 6.1?

Well, I only encountered it as part of this series (which I really don’t 
think is 6.2 material at this point), and so I don’t know.

Can’t hurt, I suppose, but if we wanted this to be in 6.1, we’d better 
have a specific test for it, I think.

>> Drop the local @outer_ctx variable from job_completed_txn_abort(), and
>> instead re-acquire the actual job's context at the end of the function,
>> so job_exit() will release the same.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   job.c | 23 ++++++++++++++++++-----
>>   1 file changed, 18 insertions(+), 5 deletions(-)
> The commit message makes sense, and does a good job at explaining the
> change.  I'm still a bit fuzzy on how jobs are supposed to play nice
> with contexts,

I can relate :)

> but since your patch matches the commit message, I'm
> happy to give:
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


