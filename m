Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E9D3323B0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:12:24 +0100 (CET)
Received: from localhost ([::1]:49160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJaHn-0000Py-4i
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJaC5-00014b-EU
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:06:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJaC3-0001BF-T6
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:06:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615287987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Pq8EJfDiYJYoqlSdSD0m0FRouDJg2ncmxP8m2FxexU=;
 b=iyrn5j9W/C8BztwqvaolVkTGe0WQlnZaxnY9QQeTBQnyOe/V7vF/QR2OAo/DYKgUw70PEC
 1VjmAc8S7L+mhbDYjwwQFjoYqYgNisg8RMFnpj01YY1AVJp6bEzRvf3u5baEnniJWb0uKn
 Ck7KXhTk4WrVetADQaFxU075rHQAnG4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-rKPryh8sNs2rwAL31R4uXw-1; Tue, 09 Mar 2021 06:06:25 -0500
X-MC-Unique: rKPryh8sNs2rwAL31R4uXw-1
Received: by mail-ed1-f70.google.com with SMTP id m8so844245edv.11
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 03:06:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Pq8EJfDiYJYoqlSdSD0m0FRouDJg2ncmxP8m2FxexU=;
 b=NUBPQrN7XGWbl0U99BKd6rF+pa97CU0hxomuLRU+Uen9PoH2CRvgY2v187U6d4sONU
 +iuF9WiVHlfsHRo9wWQZRek5Y4xJcG8uuZEJgmeDk3Sujimaw3jUI93sYhb+DS83eFtu
 /5Zx1f90K9+2c8vqmM51QWyhuBUtx9MiNKWBdCc2nMTTayxxXMe+rFulTRZaC+pJjjC4
 8G/MyMu5Bv1+s28mi6tmwTBIhajZPuxh9JJEIiIxGtFKkU77Y9oVe8+taf3bx30wQzNX
 +hvi6M66DjDZIBYlVF7oGIML5HRkpA0jV9yKnQJXnouuRdh+HLUVOqj6e6twcZ79sh9t
 pI5w==
X-Gm-Message-State: AOAM530OZPDbgWDcEfuYHGX0eTHk1iQtpdrgTFUu2zaWTLLTGe8d/pk7
 YWTm1E1nxTYuV5vEte6wr//um5SG/8hk+tXput1IY7SKOZXmEN5NCyPY8NuKLwby0dQjZ2YRudI
 wTQ0VnNphnXSY7wQ=
X-Received: by 2002:a05:6402:10c6:: with SMTP id
 p6mr3369179edu.241.1615287984394; 
 Tue, 09 Mar 2021 03:06:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmVQmxIid/9+cJnyAJTiWybcARV8/wC0f4zztpxz9WF/+w9SX4U4B2b2BYcH/aGZ3ctmiCTQ==
X-Received: by 2002:a05:6402:10c6:: with SMTP id
 p6mr3369160edu.241.1615287984182; 
 Tue, 09 Mar 2021 03:06:24 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cy5sm8804048edb.46.2021.03.09.03.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 03:06:23 -0800 (PST)
Subject: Re: [RFC PATCH 4/4] coroutine/rwlock: Wake writers in preference to
 readers
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210309102157.365356-1-david.edmondson@oracle.com>
 <20210309102157.365356-5-david.edmondson@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8de7f2e6-825f-a803-cf12-870559b5e787@redhat.com>
Date: Tue, 9 Mar 2021 12:06:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309102157.365356-5-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/21 11:21, David Edmondson wrote:
> -        /* The critical section started in qemu_co_rwlock_wrlock.  */
> -        qemu_co_queue_restart_all(&lock->queue);
> +        /* The critical section started in qemu_co_rwlock_wrlock or
> +         * qemu_co_rwlock_upgrade.
> +         */
> +        qemu_co_queue_restart_all(&lock->wqueue);
> +        qemu_co_queue_restart_all(&lock->rqueue);

Hmm, the devil is in the details---this is a thundering herd waiting to 
happen.  But fortunately this can be fixed while making the unlock 
primitive even simpler:

     if (lock->reader) {
          self->locks_held--;

          /* Read-side critical sections do not keep lock->mutex.  */
          qemu_co_mutex_lock(&lock->mutex);
          lock->reader--;
          assert(lock->reader >= 0);
      }

      /* If there are no remaining readers wake one waiting writer
       * or all waiting readers.
       */
      if (!lock->reader && !qemu_co_queue_next(&lock->wqueue)) {
          assert(!lock->pending_writer);
          qemu_co_queue_restart_all(&lock->rqueue);
      }

Thanks,

Paolo


