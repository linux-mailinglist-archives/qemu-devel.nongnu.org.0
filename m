Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E702547BE2E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 11:33:37 +0100 (CET)
Received: from localhost ([::1]:39414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzcSe-000346-EZ
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 05:33:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzcRJ-0001kY-88
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 05:32:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzcRG-0000wd-ES
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 05:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640082729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=49Y4JVUxtgTLj57NbZ2ss51fWmIz76FmTTpk6vMOBxs=;
 b=SNjuJb2d9G8T14xn0lZSO+TLqSf655sI5vkkl8pHuwXS4D7WV7LcOCir//ZopHMEHzR6AG
 iFrIwbV+30kMZ6cGxJlOD7a7yXQAbwyr9ep4keG4c0sTNPsPLTmhh+MgtrUjy+iXTjLJf6
 +alekclmZGDYbc1HTw+t87YHQw6T3hY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-jxab-5y6NEuRrdlwK0bx-g-1; Tue, 21 Dec 2021 05:32:05 -0500
X-MC-Unique: jxab-5y6NEuRrdlwK0bx-g-1
Received: by mail-wm1-f72.google.com with SMTP id
 138-20020a1c0090000000b00338bb803204so2697828wma.1
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 02:32:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=49Y4JVUxtgTLj57NbZ2ss51fWmIz76FmTTpk6vMOBxs=;
 b=HnV7nORJdKgRY/QSbsdbyt/STt8rp5/POPsCLNE9f/jyqBEbfSut8GOPz0ejnlKltT
 EKjgRragV3l703v4y2t1hnscTLlMp4Xtg+qnkO3w56KjeCVNblaD5yZ6PRe5F3y72+Hc
 a0Bj1tdzfppJv1yfQXuc5ie2ySvT3SOVZBTYMqrvYRGkawFKHWmGgIymRAmNQ75dNmus
 DnZ4EslmrWDw8dn2t5v/eB4wl+Yusp1zfEuuY0g+0HBb5fJ3cSRhaqgmdj3yaDIQGVb9
 GL1J6nT6bGGimXEajfe26z2dMcC3rpo5fZSc3czWog1wdISJlIJq7fd8avV5Nu3EWVNw
 MddQ==
X-Gm-Message-State: AOAM5322AMH6E3wT21+cmwnhCDSbY5o3kfsTecWLky/LcL5ePAumM4qj
 kJ0TxVRw8ao3mNXHJs6K/lP17aKKEnLEFaqS3hVJwRiRQiwJNTQJW12wJSYjBaah+jPxE6ueMb3
 /SDLX7rzCuJ3yZkw=
X-Received: by 2002:adf:8010:: with SMTP id 16mr1987785wrk.559.1640082723977; 
 Tue, 21 Dec 2021 02:32:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlU7lLRFNcCaeYlsj3Q4AHk3obKZ1YcWLx0aY51RrBWhq4mveLSYmkRK4PeR3ds8FqFSO6iA==
X-Received: by 2002:adf:8010:: with SMTP id 16mr1987763wrk.559.1640082723754; 
 Tue, 21 Dec 2021 02:32:03 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id g5sm5786481wrd.100.2021.12.21.02.32.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 02:32:03 -0800 (PST)
Message-ID: <656b10c3-4edc-96bd-48b6-3302ddd7cb7c@redhat.com>
Date: Tue, 21 Dec 2021 11:32:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>
References: <20211220102759.311224-1-thuth@redhat.com>
 <a752f53a-f563-4d54-affa-40925f39b62f@linaro.org>
 <72a60ec5-156b-d73e-9150-91c79eb92fc7@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/qtest/virtio-net-failover: Use g_random_int()
 instead of g_test_rand_int()
In-Reply-To: <72a60ec5-156b-d73e-9150-91c79eb92fc7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/12/2021 21.02, Philippe Mathieu-Daudé wrote:
> On 12/20/21 20:26, Richard Henderson wrote:
>> On 12/20/21 2:27 AM, Thomas Huth wrote:
>>>        const gchar *tmpdir = g_get_tmp_dir();
>>>        gchar *tmpfile = g_strdup_printf("%s/failover_test_migrate-%u-%u",
>>> -                                     tmpdir, getpid(),
>>> g_test_rand_int());
>>> +                                     tmpdir, getpid(), g_random_int());
>>
>> Random numbers plus pid are irrelevant, because you still don't have
>> guaranteed uniqueness -- think stale files in /tmp.
>>
>> Use g_file_open_tmp.
> 
> Another use in test_socket_unix_abstract(),
> tests/unit/test-util-sockets.c.

Using g_file_open_tmp is certainly better ... but the tests are currently 
written in a way where they require the file name of the temporary file - so 
switching to g_file_open_tmp() (which only provides a file handle) certainly 
would need some rewrite here... Thus I'd suggest to go first with this patch 
to silence the Assert messages, and then to clean this up properly later.

  Thomas


