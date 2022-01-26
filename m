Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDE849CFA3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:26:23 +0100 (CET)
Received: from localhost ([::1]:54644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCl7m-00024L-Sg
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:26:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nCl07-0001JM-C9
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:18:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nCl01-0001DE-VU
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:18:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643213897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kr9gvfp6dTfx7fp6+TAkstZ2bLWScP7Wfj4S8E96jtA=;
 b=TJRcZ2gsIXe7QBsjnafOJkPHn7GZB/KZYp52ZIXCedc02fBPbxVMvozAfYc6+whAgmpEPF
 s0AM7YdYljdqPZ8QtCqcUITQBeyPdre+XLgp3FrMsikK+uUOg/F2DsE5/ink1EMtOLcpiV
 SCbvt24pd+fUiNemz0mwDq0HLAWgCb8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-yzYJWFRjNH-lJ8L2zjCwEg-1; Wed, 26 Jan 2022 11:18:16 -0500
X-MC-Unique: yzYJWFRjNH-lJ8L2zjCwEg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg32-20020a05600c3ca000b00349f2aca1beso85999wmb.9
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 08:18:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kr9gvfp6dTfx7fp6+TAkstZ2bLWScP7Wfj4S8E96jtA=;
 b=5EtaBK/ayHs/WCvEydrWFQaE1VnblGmFNi5/+nxssl0otFnGscttVjcNxhV3nvc+4o
 Bx41tjnRBwp6d4GGMImqpQU6LZl4l9QG8izeh7TEosgPpzDWrwTmNwlAbHDkHDHRquaB
 LYOg/c24udRdhGlsR4uJmkA+Glscdxj2zUTneeejz0dmfZ/sfZZ87hAPCu/M2S7NgmsO
 3nkPk9aSRQGcOLSoLndzQZZBl/KD3j360W647/GWxvNDLDnYmpHsq9Nj6Vbn2PjKP6E2
 vStEwqeywz0M8eZETDLnClijyFBEEeoI5/Q3kBgM0CW+L5pIujBUoEjmc97ZCCg4eatP
 YuTw==
X-Gm-Message-State: AOAM530R0kBFxPAQiyFgoO3kYtIlZsb13VVtLWlE/L68vl7jPamAyFG0
 nYAZ0ZDlPtryENEz2sgnOYR3ro0GjXTMwQi2r+s48przrKE7jwkXhESRrncqVa5LbuTg7o8xyvT
 hHbOdNJ9HmxN93e0=
X-Received: by 2002:a05:600c:1443:: with SMTP id
 h3mr8143604wmi.37.1643213895549; 
 Wed, 26 Jan 2022 08:18:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9M0pdkQ1+C9EeqPpdeQY3IS9Da+7VB6RvAwgUaZ5dvkVtfGqpXzcDeGUeMXqVqidd7f/bfA==
X-Received: by 2002:a05:600c:1443:: with SMTP id
 h3mr8143568wmi.37.1643213895273; 
 Wed, 26 Jan 2022 08:18:15 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id 1sm12299745wry.52.2022.01.26.08.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 08:18:14 -0800 (PST)
Message-ID: <76355724-2c99-fbd3-6f6f-3dff908fd053@redhat.com>
Date: Wed, 26 Jan 2022 17:18:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 09/16] jobs: remove aiocontext locks since the
 functions are under BQL
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-10-eesposit@redhat.com>
 <bd1bcce3-1a9b-dca6-7373-af2ca42e949b@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <bd1bcce3-1a9b-dca6-7373-af2ca42e949b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 19/01/2022 12:09, Paolo Bonzini wrote:
>> @@ -3707,15 +3707,11 @@ BlockJobInfoList *qmp_query_block_jobs(Error
>> **errp)
>>         for (job = block_job_next(NULL); job; job =
>> block_job_next(job)) {
>>           BlockJobInfo *value;
>> -        AioContext *aio_context;
>>             if (block_job_is_internal(job)) {
>>               continue;
>>           }
> 
> block_job_next, block_job_query, etc. do not have the _locked suffix. Is
> this because all block_job_ functions need the job_mutex held, or just
> laziness? :)
> 

I wasn't really sure whether to touch that API naming or not (+ laziness
:D )

But it makes sense to add _locked also there. Will do.

Thank you,
Emanuele


