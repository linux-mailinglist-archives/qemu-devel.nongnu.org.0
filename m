Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172D833F6B8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:26:39 +0100 (CET)
Received: from localhost ([::1]:48200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZwH-0003PC-Ve
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMZq5-0006s3-5P
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:20:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMZq1-0008Hd-Q2
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:20:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616001603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NHYGsw8lUM7jrUNE6dQorQDl1mORYGIVwiYeTtSNAn0=;
 b=ctEmPL6rdWx6M8hBOTpWKlgrfWzejwhQ6o9sjMYReeKHinP3b8fK18nb13wDj8WyXpAe2p
 zK6DNb103eCapiu0HhUIy1qGxnXO7Z+8mIrfe/ct23j2wgWQ5+9HDE1dgHkvCTlXAt5Ocb
 vsnI+tDPM0LLf/dp7C1KKKvKKeAG63I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-rwwgjcHQOC6cM7XdzvPNJQ-1; Wed, 17 Mar 2021 13:20:01 -0400
X-MC-Unique: rwwgjcHQOC6cM7XdzvPNJQ-1
Received: by mail-wr1-f72.google.com with SMTP id n16so17640779wro.1
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 10:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NHYGsw8lUM7jrUNE6dQorQDl1mORYGIVwiYeTtSNAn0=;
 b=WQk6F4bfy6DTEVHqxX7/3GAYOnSnyE0zbd0tKTzJ2tWtaLO43wkLzmLXKtM5zPKxQ0
 7X7UaJVz6TSzrEDMgiDuv/SQkWuwyBT+v+43QBwUzsTQw/VLhQB46iHgsAjeQqDnON2k
 fhW5NnZVLxbj94s4y/JA10M045iejChfWfG8sVXHJoWCRiS693JTIrM/htZpqXz+9cVW
 Z5zdHkV+hrAppzcniPXIX8f45evi1apAyvV/UD1l86VRCDn6wDga7poLCs4SoEUg6jqh
 UdeY1m1lyaXJJCUDf4k/VVSsOlbvqPRKF74p+QT215i6c6M4ws+qVMGBy4Rrpo9Irbec
 LToA==
X-Gm-Message-State: AOAM531dJ4AekSihtwQhQdlYa3TPzRot6p1KQSf6oGhtUAVdDRQW+fxP
 kKVqdO6kzDB2RGCscWmOUwuNZlpDLE3fFa3IRuCSftPrbbUhmIPiwOaHUDAGUKdSPW5aWefGjA9
 XuAuamdTA/tYJ/r8=
X-Received: by 2002:a5d:42cb:: with SMTP id t11mr5472746wrr.280.1616001600484; 
 Wed, 17 Mar 2021 10:20:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR5p0hE+69eUCq1NA3f03Qg0FVh3E6Ouc3Ws/L3Fzyk8RI00gcWdtEnjSZ/PnI/XCnIBnHPg==
X-Received: by 2002:a5d:42cb:: with SMTP id t11mr5472715wrr.280.1616001600139; 
 Wed, 17 Mar 2021 10:20:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a6sm3682399wmm.0.2021.03.17.10.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 10:19:59 -0700 (PDT)
Subject: Re: [PATCH 4/6] coroutine-lock: reimplement CoRwLock to fix downgrade
 bug
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210317121641.215714-1-pbonzini@redhat.com>
 <20210317121641.215714-5-pbonzini@redhat.com> <cun5z1pvmgi.fsf@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3146529c-788a-2d64-0369-cb6f28be2151@redhat.com>
Date: Wed, 17 Mar 2021 18:19:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cun5z1pvmgi.fsf@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/03/21 16:17, David Edmondson wrote:
>> +    if (tkt) {
>> +        if (tkt->read) {
>> +            if (lock->owners >= 0) {
>> +                lock->owners++;
>> +                co = tkt->co;
>> +            }
>> +        } else {
>> +            if (lock->owners == 0) {
>> +                lock->owners = -1;
>> +                co = tkt->co;
>> +            }
>> +        }
>> +    }
>> +
>> +    if (co) {
>> +        QSIMPLEQ_REMOVE_HEAD(&lock->tickets, next);
>> +        qemu_co_mutex_unlock(&lock->mutex);
>> +        aio_co_wake(co);
>> +    } else {
>> +        qemu_co_mutex_unlock(&lock->mutex);
>> +    }
> 
> This block could be pushed up into the earlier block, but I imagine that
> the compiler will do it for you.

I guess I could do

     if (!tkt || (tkt->read ? lock->owners < 0 : lock->owners != 0)) {
         qemu_co_mutex_unlock(&lock->mutex);
         return;
     }
     if (tkt->read) {
         lock->owners++;
     } else {
         lock->owners = -1;
     }

     co = tkt->co;
     QSIMPLEQ_REMOVE_HEAD(&lock->tickets, next);
     qemu_co_mutex_unlock(&lock->mutex);
     aio_co_wake(co);

but I find it less readable.  So that leaves only the of/or typo, right?

Paolo


