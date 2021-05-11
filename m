Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBF437A348
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:17:36 +0200 (CEST)
Received: from localhost ([::1]:41990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOWF-000254-Tx
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNtL-0005v1-74
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:37:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNtI-0005rP-3q
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620722238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=svJ5hOg+rgWn/tV7EHnXWBZasQW00ag1evk1MqWljEU=;
 b=C8bqXCTnhMgXbmTuESM+0pfLTdnOT7qeF/E7x0pCyIhjEaOiDlJ9Nywko6iNI0DxX2Y5we
 EBfuMRlzhlC0bk2Rw/AF2bEZfNW8Idsk+o4G4RiNHnFdPUm9IN/Lvq3sH4pGBb3OpxcxUl
 KK8qJvclaPuygKvR6HUgVnVse/qpagc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-mML9Q6HpMdqmg7gu7u5cFQ-1; Tue, 11 May 2021 04:37:17 -0400
X-MC-Unique: mML9Q6HpMdqmg7gu7u5cFQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 w20-20020aa7dcd40000b02903886b9b0013so10544687edu.22
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 01:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=svJ5hOg+rgWn/tV7EHnXWBZasQW00ag1evk1MqWljEU=;
 b=QBRkoPWW414hkBcJx4nTH+rUrhLIfTS8pFQOM1ky77/TnWSllmA82jLsYuXgPjQ2Lk
 FUM+WJqEMWo1aQVPM6nyC//EY/BPAr+XKtDs/ShicPYB05v03ugU7NUFfDxrwdyXQzOu
 nUl7ld3kY7tFDvbIXWQzTnb9uCIgLtmyrtheOTd12c/bbTXfPQwor5EQj8JhUXRTM5qW
 sBeHXwXsjzRA+yPFmtn86jAhEx6160Noy3HpVv0X1hIIdLxLG1UOYpKQj9Lo6ZWdLAoF
 6PaEYJpBpUHoq3XRuIY5OZrk3Z6O6hbwXW23WngBNBWaw9FFrU1VoBA63qNDrCfahDF6
 w3Mg==
X-Gm-Message-State: AOAM530KRbnVgMFMKCK0pRKZSYH+yo1i7fq8+6QsjKbHk9zXwumfX+7C
 7tnk/Lf33X24C/p/couv/ho8zDS6nEATqqeF2l/kIQfwf8nc/yN395e3dOjllfZv/GmQPxReIq+
 Se4GC+6V7Ioe1TSM=
X-Received: by 2002:a05:6402:17d8:: with SMTP id
 s24mr34488818edy.155.1620722236073; 
 Tue, 11 May 2021 01:37:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyxg5Pf+RocnQF3l6NU6bVmaK/YbLPfl9lq+H9Q26PKqcEgQhBSQPT2NGXOmIO9V59dp+laQ==
X-Received: by 2002:a05:6402:17d8:: with SMTP id
 s24mr34488801edy.155.1620722235897; 
 Tue, 11 May 2021 01:37:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g11sm6375121edt.85.2021.05.11.01.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 01:37:15 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] blkdebug: protect rules and suspended_reqs with a
 lock
To: Eric Blake <eblake@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210507151203.39643-1-eesposit@redhat.com>
 <20210507151203.39643-6-eesposit@redhat.com>
 <55310f7a-583c-3001-141c-4eac4afd185c@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b53155c7-a332-79f3-0798-abf128a06f3c@redhat.com>
Date: Tue, 11 May 2021 10:37:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <55310f7a-583c-3001-141c-4eac4afd185c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/05/21 17:29, Eric Blake wrote:
>> +    qemu_mutex_lock(&s->lock);
>>       QLIST_FOREACH(r, &s->suspended_reqs, next) {
>>           if (!strcmp(r->tag, tag)) {
>> +            qemu_mutex_unlock(&s->lock);
>>               return true;
>>           }
>>       }
>> +    qemu_mutex_unlock(&s->lock);
>>       return false;
> Would code like this be easier to write by using QEMU_LOCK_GUARD from
> lockable.h?

Yes, this one would.  In other cases (rule_check) it's not so clear cut. 
  It depends whether you prefer to have the simplest code, or rather to 
have homogeneous use of either guards or lock/unlock.

Paolo


