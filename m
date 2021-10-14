Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27FF42D557
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 10:45:59 +0200 (CEST)
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mawNA-0005sj-G7
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 04:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mawLL-0004bj-8M
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 04:44:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mawLJ-0007iU-Md
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 04:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634201040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/UDkVnkkxFoYQMAwkp/Hh/Jm6XVxkOuKqfv/8XcaWc=;
 b=L2Q2SqDdpkrckj8U1icPu8o4TJK94kCvU218oExQf3ycNjQljvnSnu82VnYEyq8QapoP2m
 5HD9ElGD59QslFaX/YcTY5XhaeSk3JOA3G/YfXRBTqPUhR/PSR7DOVfLlSbRuXplSGww2s
 vXu36C5Y8JrYB37C3J1hS27hf8VlG6A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-60Z8Z5i1MgqemjA8bORU-g-1; Thu, 14 Oct 2021 04:43:59 -0400
X-MC-Unique: 60Z8Z5i1MgqemjA8bORU-g-1
Received: by mail-wr1-f70.google.com with SMTP id
 75-20020adf82d1000000b00160cbb0f800so3968535wrc.22
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 01:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=n/UDkVnkkxFoYQMAwkp/Hh/Jm6XVxkOuKqfv/8XcaWc=;
 b=hUad6OCIT+1FIBSCODiQrmZLt9Rv0VC2/V4obtaQMTIrOq2U+EtZNutA8jRoqRqud4
 YoGnoose4M93AGclnOdpul7QbAQOwNDNedgoLmBCQfEV7F1Y5PNGXmTPljpAnOeu/+eO
 gTUmDpV27gbEioTVNBzXhvJ2ugWrjkDK07mXDrjoiBs2YI0MwWoXGIRYI1pn0RL6rqBM
 oQ4mGnt0IZnBYScDc4YtFt+LquLJ9n2nceU3j8OGlnawJaQmIaX0PqVo3+cKOVSPEi4V
 ZNbCfOu5BcvGqgzfk1JqZ/UXTjjnZisZEXZ+BDprqOHGVBbxJTTSOdW0YiUpffKPP8qN
 AxLw==
X-Gm-Message-State: AOAM531r158nkEFnl0GrxvlVBVuSdUnpl9uygW9ZNNzslyhGvqgADCM7
 3w1K96C/D+SZQLtyAw7dJHdjeg+Z9mDXtxEOkoU+KI436Kh+KTGJsGQFgtMR6FiX9qy0Oq3082B
 DO00dzHOg8yPsD90=
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr17981661wmp.165.1634201038495; 
 Thu, 14 Oct 2021 01:43:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkzNULry+1YilCgxueWH/puzdGiaczFORMQ2aTXKw0pnfdjPpmoOj65eQSuSVRbLNG43TIGA==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr17981636wmp.165.1634201038274; 
 Thu, 14 Oct 2021 01:43:58 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c694e.dip0.t-ipconnect.de. [91.12.105.78])
 by smtp.gmail.com with ESMTPSA id
 w5sm1764412wra.87.2021.10.14.01.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 01:43:57 -0700 (PDT)
Message-ID: <9c2f1162-5e7b-f753-89b4-569eaa615693@redhat.com>
Date: Thu, 14 Oct 2021 10:43:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v1 0/9] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20211011175346.15499-1-david@redhat.com>
 <YWcYytiOeLGNh7gv@work-vm>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YWcYytiOeLGNh7gv@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.10.21 19:35, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
>> This series is fully reviewed by Peter and I hope we can get either more
>> review feedback or get it merged via the migration tree soonish. Thanks.
> 
> Yep, I think that's a full set now; we should take this via migration.

Thanks! (BTW, this is actually v6, I messed up :) )


-- 
Thanks,

David / dhildenb


