Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15B56AC4A7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:18:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCbC-0002up-SD; Mon, 06 Mar 2023 10:18:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZCb7-0002or-1N
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:17:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZCb5-0006wX-K4
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678115874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KDb6hUTpnFsKcz/2qalS3Rnm5NElLo0zA543ex3rVU4=;
 b=Hu4Yp1czjGScgXK/7La7jhW7SpFyqz9ciaUJQ0gzKh0v7YHm80VTzaMq0DWKca19jDml57
 FkAb66MRP33y9/P6fYLNfcIRt4jNmgJVuBttjB9WrVM0elis7swKzSXGKxwo5b6SduA87g
 76U5OfPlNtW9qQq0WttJQ5qDTog6ZZM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-FTaB3_PwNuyorckiNLN9hw-1; Mon, 06 Mar 2023 10:17:49 -0500
X-MC-Unique: FTaB3_PwNuyorckiNLN9hw-1
Received: by mail-ed1-f70.google.com with SMTP id
 b1-20020aa7dc01000000b004ad062fee5eso14131441edu.17
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:17:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678115867;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KDb6hUTpnFsKcz/2qalS3Rnm5NElLo0zA543ex3rVU4=;
 b=F4/P0RIK6fCS3H5FoyIODS+udAqUqjSdFfZ1kO+G2l872krYEtckxftQXzQZnkjzjJ
 kFqozNWE7hAw1Okvs6mUgpFnXJh367LFzAxAbcvQ/VKkY4mWL9eGUqBFDnKNt888IRGp
 wAkES3Ewz+IFUCAIT+LGqRLbw/NSuk3Cagc98Inu/sO0i1qTVjwxbXJN9CXF/+v/libn
 UIhDq04qlMiGTVsRD7hpaabOIg3fGeNbE82BE6lrjDA8/08nM7pA+yuyvfnk/eD08Ik/
 n+HStbuY7gbLKBUVhgn/E8nJtG2OdtBtKhYY9rJwopQIxbN/fEZtneZ1t+pFX06twKnp
 Srrw==
X-Gm-Message-State: AO0yUKWCs1AjmAqGMXQRVvZ5IBJuK6TEjb3heqif73IHMd6yoM4UtwkL
 1roDoq4k1IHxx9NNig4g2KB/BNeJVfWXaoZemv09/8zAiVql5bKa0rtSvVta6VqCe3ivIMzF/oj
 rKmQHZIxDaBefGwM=
X-Received: by 2002:a05:6402:1512:b0:4c2:6b68:c126 with SMTP id
 f18-20020a056402151200b004c26b68c126mr9688692edw.8.1678115867135; 
 Mon, 06 Mar 2023 07:17:47 -0800 (PST)
X-Google-Smtp-Source: AK7set9FA+Fd/cgbvboenVUeBzSp/pspsHus1x6T/AHXyDBgnRb1a1E+cGn4Ol4ALBcoXcELVoaFjg==
X-Received: by 2002:a05:6402:1512:b0:4c2:6b68:c126 with SMTP id
 f18-20020a056402151200b004c26b68c126mr9688673edw.8.1678115866838; 
 Mon, 06 Mar 2023 07:17:46 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 s26-20020a50ab1a000000b004bf999f8e57sm5209872edc.19.2023.03.06.07.17.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:17:46 -0800 (PST)
Message-ID: <090dd36c-e0dd-6933-abbe-ff4d7715e73e@redhat.com>
Date: Mon, 6 Mar 2023 16:17:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/8] qemu-thread-win32: cleanup, fix, document QemuEvent
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-4-pbonzini@redhat.com>
 <080ab2d0-1a6f-47e9-0f3f-33f5ef98d411@redhat.com>
 <5123f794-0d28-bfb6-3e79-41cfb70a9318@redhat.com>
 <b6e703b4-d89e-e74e-985e-1d0f483719a4@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <b6e703b4-d89e-e74e-985e-1d0f483719a4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/6/23 15:32, David Hildenbrand wrote:
>>
>> Thinking more about it, the intended usage of QemuEvent is either
>>
>>       qemu_event_reset();
>>       if (!check()) {
>>            qemu_event_wait());
>>       }
>>
>> or
>>
>>       if (!check()) {
>>           qemu_event_reset();
>>           if (!check()) {
>>                qemu_event_wait());
>>           }
>>       }
>>
>> If we don't care on the reset path we care much less on the wait path.
>> Should I remove it and go straight to the cmpxchg, just for peace of 
>> mind?
> 
> Sounds reasonable to me at could simplify qemu_event_wait a bit.

Hmm, it does avoid a whole system call in the Windows case, so I prefer 
to keep it.  And I prefer to keep the load-acquire on the fast path too, 
I don't think it's needed in the actual uses of QemuEvent but it's safer 
in case it's used as "just a boolean".

Paolo


