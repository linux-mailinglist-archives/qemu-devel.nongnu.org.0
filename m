Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1E8444516
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 17:00:26 +0100 (CET)
Received: from localhost ([::1]:40664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIgb-00056u-4V
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 12:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1miIdQ-0002dA-P3
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1miIdM-0004bi-Qq
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635955022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zpURaI3ocEPcixhMgjZPzqzQXG2FVUSAxWsTizIgBaM=;
 b=GfG55CDyJc1IxWUd6xvdRr/aNpF/bKRpZTMKhhr1NwzsaDyTRBmf+gtdanPYBDrCFctxm+
 zlJ8pfqMOFINYabTTIOkNm9NCdmHFQrnEKwU0lRdKBu5ZuRohmjCqzdTFSJ2Zyg1NCWqhv
 b/ARN2mATB/uON5KxP3K6JTsgyvDo1g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-GOVTQoCxPGGuhNLFZfwmPA-1; Wed, 03 Nov 2021 11:57:01 -0400
X-MC-Unique: GOVTQoCxPGGuhNLFZfwmPA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k6-20020a7bc306000000b0030d92a6bdc7so1285750wmj.3
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zpURaI3ocEPcixhMgjZPzqzQXG2FVUSAxWsTizIgBaM=;
 b=aCuTa2kIBO3dqQQV9yyYKMrjQWKeYjmCX/IMXGia8/hyP7ppdB4ffrOKXYKwm7D0n1
 SK9Gyo3i0LVlqOh51YOZB+xWKquKxJ+r0uZLsAwluCNoSqu6hURUYDMPhHvLjz+Ks1fv
 4oD9ss6V6ak3CznXQdYa5ipbVtAfFmjIvChpc8qGey22gmMgybyOvo1C+zw+hrlFSRrV
 TjQsvYQ5r28DPlfRVPwpKxQUHePEJSIyA/ChF4tOrKi9ZA3iRxaG866tx3+taNxNeDbN
 PHlHYqPOEThMUK76K+IF9OnxfTLFkKv9TgdAz7qjAoZK5HSP2QI13eJelEOkeigqlOQz
 lwGQ==
X-Gm-Message-State: AOAM532OMtUTiqbzeHoBwFqsGvIIN+t2Ll02pM2bT5iy77dssJPqNurP
 U4LrLtRhzr2oHU58YD5CVY77XhUD40q/JgaodT5XF8rqq8dOF9nfOo1UvkmfbPc+BcnxBv8admI
 Pbr9/qGb4yWC+cV30zLpPleymsHb6IuKSrEeR2L0X8uD0WhDmnH/v4w9gthp0FW6RYKw=
X-Received: by 2002:adf:e984:: with SMTP id h4mr53380107wrm.149.1635955018793; 
 Wed, 03 Nov 2021 08:56:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0/tHNR1+UiJu9FYfETcigey0VJMGcO33eY5VZG9ZOtLeX0jMV2gnHLO21B3tOZGouk/jKWw==
X-Received: by 2002:adf:e984:: with SMTP id h4mr53380070wrm.149.1635955018551; 
 Wed, 03 Nov 2021 08:56:58 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 h15sm2192046wmq.32.2021.11.03.08.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 08:56:57 -0700 (PDT)
Subject: Re: [RFC PATCH 11/15] jobs: remove aiocontext locks since the
 functions are under BQL
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211029163914.4044794-1-eesposit@redhat.com>
 <20211029163914.4044794-12-eesposit@redhat.com>
 <a19af72b-3b81-7181-15ed-2bbaa50779fd@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <2bc317aa-098e-67c6-013d-e661d292d1d1@redhat.com>
Date: Wed, 3 Nov 2021 16:56:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a19af72b-3b81-7181-15ed-2bbaa50779fd@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.528, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 02/11/2021 13:41, Vladimir Sementsov-Ogievskiy wrote:
> Hmm. subject looks like it's safe to remove aiocontext locks from any 
> qmp command?
> 
> For example, commit 91005a495e228eb added aiocontext locks back to qmp 
> bitmap add/remove commands because otherwise they crashed.
> 
> So, I'm not sure that being under BQL is enough to drop aiocontext 
> locking..
> 
> 

In this specific case the aiocontext is useless there. I am not sure 
what it was used for before, but if you look at what it protects in this 
patch we have:

- block_job_query: not called by anyone else, and internally calls:
	* block_job_is_internal = checks struct job id, that is only written at 
job initialization
	* progress_get_snapshot = we made it thread safe, as you might remember
	* accesses struct job fields, that we protect anyways with job_mutex. 
Anyways the aiocontext is not used to protect jobs fields.

- job_query_single: same as block_job_query, calls progress_get_snapshot 
and accesses job fields.

So yes, I am positive that here removing the aiocontext lock does not 
break anything.

Thank you,
Emanuele


