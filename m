Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E0D4755FC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:14:48 +0100 (CET)
Received: from localhost ([::1]:40428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRJA-0005wI-1k
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:14:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxRHk-00053X-Bb
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:13:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxRHg-00081s-Lm
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:13:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639563196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JwmgPQRJyMa/urddIYyyhMzSOhcmehTBWft56aGsVDM=;
 b=Gw6Xuysa+0jMYsYFpajJVlwqPS0zKC3pWPo2Cfcj1VLr/ljKnEaxlhkZ3SGg0w5UznQG0T
 f1hLRMLNK4O4wtMoWWY1TPuYyde5NYJ801auaqtYEnTE8PwoW3oucsNfBjVAPhEoQmRDDx
 qTOe0A2uGI5Ut5g+OlubPAJWJQ+ZIZk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-p74IYwK9OuuVyyZMM8FGEw-1; Wed, 15 Dec 2021 05:13:07 -0500
X-MC-Unique: p74IYwK9OuuVyyZMM8FGEw-1
Received: by mail-ed1-f70.google.com with SMTP id
 l15-20020a056402124f00b003e57269ab87so19621271edw.6
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:13:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=JwmgPQRJyMa/urddIYyyhMzSOhcmehTBWft56aGsVDM=;
 b=lcuF8/vC+0HvMkz+8JuFmgVa851V0Vh5BYL1GQBC480Vb4+eF9/L8gHEaPBpUFRWek
 USbdztN79N5ZN0thSbLlymoSQfeyH7EfRajoHWDxuj0d6D4vN07ANl1iOZjK8UkaL8US
 vY8/fH1hFEPw+RuuG85VHv6ja4whVp4erW791AvuPYPcuR4mFsWPrz3djWcs6x/WkGxw
 eJ0eI3G2l39TZ34fdbQOHZyR2be5FDTowu0Z0oJ/9TwVRNzWc/bTaVfMVkWHah0w1+e9
 jFTXI04QmZoYSMDT3QJIZVwmd3WNgBkRbNiQiOwR6w3mn21G08z7OWwoNdOFgjHtHnEI
 KeGg==
X-Gm-Message-State: AOAM532nEQCHK6pE/DpYvABDCzFaOkACfyGwtJ64Lsb5z9CPlXwFT3CX
 LNtoYMNONdeY/IAevowYFP60Gg0nf2euTxluStUMzsj7w+OtL/8fE9jkDHWFQbSiQSpusDCXq73
 X4ey9h1D0GByCe7U=
X-Received: by 2002:a17:907:60cd:: with SMTP id
 hv13mr9760468ejc.712.1639563186673; 
 Wed, 15 Dec 2021 02:13:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjtW7LNkyR1cqqfvV5g6f955HTPvmnyDErlvWBrOauogrKBpC0kDc29o/XnRjbJw5oUb5qbg==
X-Received: by 2002:a17:907:60cd:: with SMTP id
 hv13mr9760438ejc.712.1639563186419; 
 Wed, 15 Dec 2021 02:13:06 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id o21sm538595ejy.181.2021.12.15.02.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:13:05 -0800 (PST)
Message-ID: <2f566e3c-58b8-f573-5862-290187a40044@redhat.com>
Date: Wed, 15 Dec 2021 11:13:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 05/31] block-backend: special comments for
 blk_set/get_perm due to fuse
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-6-eesposit@redhat.com>
 <2b924119-5bfd-d00d-169d-5cf1d7460116@redhat.com>
 <449921a0-4f53-f57a-a47b-a6707b551f67@redhat.com>
In-Reply-To: <449921a0-4f53-f57a-a47b-a6707b551f67@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 15/12/2021 09:57, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 10/12/2021 15:38, Hanna Reitz wrote:
>> On 24.11.21 07:43, Emanuele Giuseppe Esposito wrote:
>>> Fuse logic can be classified as I/O, so there is no BQL held
>>> during its execution. And yet, it uses blk_{get/set}_perm
>>> functions, that are classified as BQL and clearly require
>>> the BQL lock. Since there is no easy solution for this,
>>> add a couple of TODOs and FIXME in the relevant sections of the
>>> code.
>>
>> Well, the problem goes deeper, because we still consider them GS 
>> functions.  So it’s fine for the permission function 
>> raw_handle_perm_lock() to call bdrv_get_flags(), which is a GS 
>> function, and then you still get:
>>
>> qemu-storage-daemon: ../block.c:6195: bdrv_get_flags: Assertion 
>> `qemu_in_main_thread()' failed.

Wait... Now that I read it more carefully I am confused about this. I 
don't think the above has to do with fuse, right?
Can you share the command that makes qemu-storage-daemon fail?

raw_handle_perm_lock() is currently called by these three callbacks:
     .bdrv_check_perm = raw_check_perm,
     .bdrv_set_perm   = raw_set_perm,
     .bdrv_abort_perm_update = raw_abort_perm_update,

all three function pointers are defined as GS functions. So I don't 
understand why is this failing.

>>
>> It looks like in this case making bdrv_get_flags() not a GS function 
>> would be feasible and might solve the problem, but I guess we should 
>> instead think about adding something like
>>
>> if (!exp->growable && !qemu_in_main_thread()) {
>>      /* Changing permissions like below only works in the main thread */
>>      return -EPERM;
>> }
>>
>> to fuse_do_truncate().
>>
>> Ideally, to make up for this, we should probably take the RESIZE 
>> permission in fuse_export_create() for writable exports in iothreads.
> 
> I think I got it. I will send the RESIZE permission fix in a separate 
> patch.
> 
> Thank you,
> Emanuele


