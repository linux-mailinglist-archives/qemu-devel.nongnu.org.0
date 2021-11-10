Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C03944C42D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 16:17:48 +0100 (CET)
Received: from localhost ([::1]:32768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkpMA-0002VA-UN
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 10:17:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mkpHJ-0004zV-IE
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:12:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mkpHD-0002KC-0D
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636557158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BGKl/Bv95wW/tJskZew89d4B8zJUxZKtWv7ydVfxKlY=;
 b=GfMjCmUWzUfnKKltiGJ6sL+JnzeoJ2srkGpM5nC0sT27AJBORz0UGP2pZzLcCLKG7c8ewb
 pvTMVIgq4KYP0C6mYMO2eOC9qJ+x9S5JzHgC74ZwrME6HXSCtSJDybM+aZSSTqxOpNolfm
 pmihDplNJYLYZsScOUKlEx42ej+a1Xg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-SC9i1YOLPKiAM-zPXCWIvw-1; Wed, 10 Nov 2021 10:12:36 -0500
X-MC-Unique: SC9i1YOLPKiAM-zPXCWIvw-1
Received: by mail-wm1-f69.google.com with SMTP id
 o10-20020a05600c4fca00b0033312e1ed8bso1335812wmq.2
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 07:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BGKl/Bv95wW/tJskZew89d4B8zJUxZKtWv7ydVfxKlY=;
 b=lsIy2oHJ1v8tFEGKmVEGbxSoQreOJAEFviPT4M5xrGpq5wnbSm+L/EHCkFJx4DMgr2
 vPUO9OyD7nuXNsqYAl/FP5uGue3LzmQBf/wzmcP8QqWX++Bl6wouhhzg2qjB17UDN6wP
 trQedueOD0MgsBBjgzMm78gz+b7kT/9uG5+w66sXEpgzSJxB39+kGh1TovrgqsInc8qA
 03DGFzpX53gAjxArPfh/fL9J7k5KY28QkxMDAem9DBxeRVgfxEmq0znhySshl+RfbiOB
 qezJOaCzwEOSLFw71cYegJZKl9o/n3lSE62o8snWM40BgdbaCu7wQX/2utjtrH/EbH4r
 mvxw==
X-Gm-Message-State: AOAM530B4B1a0dHm5yudHWEd2l2tEncrIZtCQQALUHRLkwdea+/NyiiV
 zHla38ReilMlKSzKrqSuwf08eiwvuT8e1FSzUdaC9C5jF6VS6XxUWbaDSskQl+OSw/WhmOVU7Xo
 rsDgMl2DSzSfW+Sc=
X-Received: by 2002:adf:d84c:: with SMTP id k12mr591530wrl.24.1636557155725;
 Wed, 10 Nov 2021 07:12:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+zfuXTbELkX1yirJ6vcdCzvoqFHHawlAc4j6lAo/ZXtVcPAbYOy5mAFHw6nCZYSIGCKGFSw==
X-Received: by 2002:adf:d84c:: with SMTP id k12mr591500wrl.24.1636557155539;
 Wed, 10 Nov 2021 07:12:35 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id i17sm23887wmq.48.2021.11.10.07.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 07:12:35 -0800 (PST)
Message-ID: <2d455772-b384-6af7-f548-3ddaa5bea042@redhat.com>
Date: Wed, 10 Nov 2021 16:12:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/7] block: Manipulate children list in .attach/.detach
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211104103849.46855-1-hreitz@redhat.com>
 <20211104103849.46855-3-hreitz@redhat.com>
 <0a45f660-e3d7-7d23-fdaf-ef9e613b19db@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <0a45f660-e3d7-7d23-fdaf-ef9e613b19db@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.11.21 13:51, Vladimir Sementsov-Ogievskiy wrote:
> 04.11.2021 13:38, Hanna Reitz wrote:
>> The children list is specific to BDS parents.  We should not modify it
>> in the general children modification code, but let BDS parents deal with
>> it in their .attach() and .detach() methods.
>>
>> This also has the advantage that a BdrvChild is removed from the
>> children list before its .bs pointer can become NULL.  BDS parents
>> generally assume that their children's .bs pointer is never NULL, so
>> this is actually a bug fix.
>>
>> Signed-off-by: Hanna Reitz<hreitz@redhat.com>
>
>
> Interesting that nor child_root neither child_job do similar things in 
> .attach / .detach ... Should we do something with it?

Well, it’s up to them, I thought. :)

A BB only has a single child, so it doesn’t need a list.  Jobs do have 
their own child list (BlockJob.nodes).  I thought a bit about this when 
writing this series, and I figured perhaps they don’t need to care about 
that in .attach() and .detach(), because they don’t really expect nodes 
to be detached or attached anyway; child_job.stay_at_node is true, after 
all.

Hanna


