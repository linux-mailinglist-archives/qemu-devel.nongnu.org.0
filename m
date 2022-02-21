Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D4D4BD87D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:21:57 +0100 (CET)
Received: from localhost ([::1]:36976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM4tH-00068j-LG
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:21:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM4p6-0004vJ-6o
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:17:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM4p1-0007ak-Ar
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645435049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bo0ubWtq1LqG5Rs9dm2qZ6uRUK+vz+ss4xzsp8u7Op4=;
 b=U11iP2oJMSQl6OcL7A+9Gf7Tqo2IInvaUcMeHWD++OnrhqyNUCQMfTKBzL8r1cUSLXeTLu
 sC8pIaz6z6Ipd5QR1K+fhz3i6AqZneWKLa0qQPvXakglgYYspYsbGGeMCffuWOfDGtcM/R
 xTeVnLi4jnoga9S20mEOzryGAenDISg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-_i9A-2-_MP2l1e6HZRWeog-1; Mon, 21 Feb 2022 04:17:27 -0500
X-MC-Unique: _i9A-2-_MP2l1e6HZRWeog-1
Received: by mail-wm1-f72.google.com with SMTP id
 p24-20020a05600c1d9800b0037be98d03a1so7792233wms.0
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:17:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bo0ubWtq1LqG5Rs9dm2qZ6uRUK+vz+ss4xzsp8u7Op4=;
 b=yibaOyukFMGl/cCCwVLhehbEZJ3l3o50/nhG/tRdVpV72HfnXdjPE4EQ6iolB4EJ5i
 3fMhM3wsYtVzcvVW8CMvKW0kjXDURKt6ARpMfPGoOMGeCgUi0u7c8dkOKm7HSGFhT+On
 p+B+ZlNnnDVxwoHeL+DZtdSEyI9gdCWDl/iv2620ah2ZLz4tRwXJHTGLPVd9IwvP9z7U
 NK5oZjN3MBo0Ejzh6t6wkLJsHQMmmvXS0XbFdrQ2BV1yWrENUcCO07L/oVKnlCgKFp0D
 bkdNaJUE5eg2tPdXrQGgwrP0o37zsH/twWML/3v7SNu4jrZ1dqUNwv9B1ii+tvL5FPRr
 2eYQ==
X-Gm-Message-State: AOAM533tjtog61IKdAAC5ovc1aJBFkifA0QAD0ZQMSiMmtKNwXMmxwAh
 XlnT2pQ/X1MX+uHwsq/1CzlgcZkgcEZISCvjkob+kPzj2A0koBFyl4N0pgMz4tBhF3UuybyvcoO
 ImnBY83c4KD/QwhE=
X-Received: by 2002:a5d:64e3:0:b0:1e4:a380:bb6f with SMTP id
 g3-20020a5d64e3000000b001e4a380bb6fmr15418771wri.463.1645435046763; 
 Mon, 21 Feb 2022 01:17:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxy7JFkQjdefuTUBDK8eZMh3sqsOYgny5/Espzr4pTGkf/DRDdI+bpI/4tk923U/nWcV0RkbA==
X-Received: by 2002:a5d:64e3:0:b0:1e4:a380:bb6f with SMTP id
 g3-20020a5d64e3000000b001e4a380bb6fmr15418756wri.463.1645435046544; 
 Mon, 21 Feb 2022 01:17:26 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id l11sm42400670wry.77.2022.02.21.01.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 01:17:25 -0800 (PST)
Message-ID: <412599ca-c0ad-bbc1-cb9f-891a6c1dbcee@redhat.com>
Date: Mon, 21 Feb 2022 10:17:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/7] tests/qtest: add some tests for virtio-net failover
 (part 2)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20220203141537.972317-1-lvivier@redhat.com>
 <b389e735-1802-890c-bb9e-7b5a84aa9095@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <b389e735-1802-890c-bb9e-7b5a84aa9095@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 15/02/2022 10.20, Laurent Vivier wrote:
> Ping ?

Sorry for the delay, queued to my testing-next branch now:

  https://gitlab.com/thuth/qemu/-/commits/testing-next

  Thomas

> On 03/02/2022 15:15, Laurent Vivier wrote:
>> This series adds more qtest test cases to test virtio-net failover feature.
>>
>> New tests are focused on the behavior when the feature is not available.
>>
>> Laurent Vivier (7):
>>    tests/qtest: failover: clean up pathname of tests
>>    tests/qtest: failover: use a macro for check_one_card()
>>    tests/qtest: failover: check the feature is correctly provided
>>    tests/qtest: failover: check missing guest feature
>>    tests/qtest: failover: check migration with failover off
>>    tests/qtest: failover: test migration if the guest doesn't support
>>      failover
>>    tests/qtest: failover: migration abort test with failover off
>>
>>   tests/qtest/virtio-net-failover.c | 911 +++++++++++++++++++++++-------
>>   1 file changed, 716 insertions(+), 195 deletions(-)
>>
> 


