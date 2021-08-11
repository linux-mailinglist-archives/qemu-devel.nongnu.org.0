Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415C53E89FC
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 08:04:33 +0200 (CEST)
Received: from localhost ([::1]:45840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDhLr-000467-EL
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 02:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDhKI-0003NH-49
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:02:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDhKD-0006iW-O5
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:02:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628661768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eyDuor82UlP9rHYQn5WqmyPGRNVkDo4zIzeOfKO1TfE=;
 b=GrbuMHbcBqcSf/JB/Bot+M4GK4o8PtkG7wy3nkk6tm1mGTBll6OoElayuKI15IiESdrb2A
 oQ1Qr7OaVTzbfPJPJG0TIiJAX9jmjHaSZ+bcg+J8WY8OInXqker1ymuccFnu6EDdg5oe0J
 DR7JMuZj7SRb9cqFmX7Zps3vQ51L9OI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-Cn0keln5MN-gGcMFzXVxcQ-1; Wed, 11 Aug 2021 02:02:47 -0400
X-MC-Unique: Cn0keln5MN-gGcMFzXVxcQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m37-20020a05600c3b25b02902b5a02478adso923819wms.0
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 23:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eyDuor82UlP9rHYQn5WqmyPGRNVkDo4zIzeOfKO1TfE=;
 b=CQMkGmllWE3QONN692ZHtypcFMvpXIXISUTXqlTEAbBzWwTTE2xwCEOHrQtx+hBZ4T
 ameYTrRKJcyEuyC6oTFguJ9rYLHu+7BNSeLi66w83E524CJoz5QRUv5mebDP7gQSgzXo
 zDieVkftWC8R6NZQxPGteKLTXLNs/3O6FJKuMI7G+VwDO3mqXtbWobq5I9QfcdgPPTUG
 sq+0lGVrYpoiiFB02O5vD1sJSjUfRllH7RedvY422YFYFm2d9nZ8wpp7nhvPXcDZZTs7
 +19xyUzxnTANCzcd6Zcf63fUxepxTvHfiBPDEL+rXtRFQdD9syCTfDlCMsssADqgcFCH
 9VpA==
X-Gm-Message-State: AOAM531Opta4rY/95KKjYyKRoByFw+QoDjWFoTtCDU7D86UB7bQZPORd
 VCxXoyuu6oOqXnS4gTQ0W1cxxtzqj7XWJcsutE0pLi6bkzghoidVSCj3sWAfEvgPFzQ3b/smmcF
 nlQf5oSRxYIv9bq8=
X-Received: by 2002:adf:f403:: with SMTP id g3mr8428388wro.222.1628661765874; 
 Tue, 10 Aug 2021 23:02:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWzwvqYiUfaAe7nwqZ24yDptFA0+Zf81Ss8ABHCKQXg7Tfp1uRhi98TlshK7FSfhYO0FV7rg==
X-Received: by 2002:adf:f403:: with SMTP id g3mr8428372wro.222.1628661765696; 
 Tue, 10 Aug 2021 23:02:45 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id k186sm5865358wme.45.2021.08.10.23.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 23:02:45 -0700 (PDT)
Subject: Re: [PATCH] build: remove redundant 'check-build' make target
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210810164416.3981147-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c4e62272-4662-14ef-28e8-9585196f0d63@redhat.com>
Date: Wed, 11 Aug 2021 08:02:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210810164416.3981147-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/08/2021 18.44, Daniel P. Berrangé wrote:
> The 'check-build' make target was added as a way to build all the unit
> test binaries, since the standard 'all' target would not trigger this.
> 
> Since the switch to meson, however, 'all' will now include the 'test'
> binaries. As a result, 'check-build' is a no-op:
> 
>     $ make all check-build
>     ..snip lots of output...
>     make: Nothing to be done for 'check-build'.

I think it would be better to restore the previous behaviour, so that "all" 
does not build the test files by default. Most normal users don't need the 
tests, so compiling them by default wastes precious CPU cycles.

See also:

 
https://lore.kernel.org/qemu-devel/8d5714d1-d92b-60fc-531f-73eb05852c8f@gmail.com/

 
https://lore.kernel.org/qemu-devel/472c9809-8987-3c2c-c2b5-b99d637ace0f@redhat.com/

  Thomas



