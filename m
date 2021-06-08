Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F4D39F952
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:38:12 +0200 (CEST)
Received: from localhost ([::1]:35314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcrr-00029p-OH
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqcqg-0000Dg-Gh
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:36:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqcqd-000745-Pz
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623163015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VL6+l3wKLGjMGfm7gE4hwGjp6kySXrCs/qv9TUuboiY=;
 b=LZ08+uDqx+Pjfaqv7DMtaM7gCslEf9axZmnvAvjLCh3U8S6KBBNTrA8MB6wC3/juIXO/V+
 rynEOKDg8p8Tud7BVP5biAVVihXox0dFouKfCzkKgJqZl2tN2bnDfjQNFyezql+HBlnIhv
 0nmscdU+XrJyr7qUgm69l7l7uvQ1qfc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-OLBtpNPjN4GObxY5JsgGlA-1; Tue, 08 Jun 2021 10:36:51 -0400
X-MC-Unique: OLBtpNPjN4GObxY5JsgGlA-1
Received: by mail-wr1-f72.google.com with SMTP id
 e9-20020a5d6d090000b0290119e91be97dso1299094wrq.1
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 07:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VL6+l3wKLGjMGfm7gE4hwGjp6kySXrCs/qv9TUuboiY=;
 b=WGlWloYxK2sZ9vdofFqomhREWAfTatQ17H3RPjGlFQ+GMXQ2ObIRmTz2D8hZcJuWc8
 i4LojxIGmGAh3CnhpmTmFNdLSbbAhddROgfsvfFUEQQm9ymHgKZU3d7omrRi0CAWTWWY
 9Fr2sA/1jr+GXRq4rHtzh5uy6poa1x7MlDjPWYXyv6N/SeTAcPpcOtQA9FFlpAEq/rUT
 V3mn9eNhxqSx5fJElq1FOmxv1Ns+0Nf80K6/gm+WMw6It6O91iEG6oFOScwdCFSdogVE
 I9hDsdssxk2CM0vI+km9J1/SzrYUer3yq9SP5TnBqE4FTrbR5ObI7VHsFhDX0ZkgmFLK
 fjzg==
X-Gm-Message-State: AOAM532EMT/hCi+F0gCHIas2Slq2xwaAS36wYx11Beqn4u4cHp6gl3fT
 8+yUhWWb11tnEYGeTlYrAnIZe16bFlhs1ZPd9BMOfkY2Lrutd0eBldw+NINOjMBfJfKlbEexhli
 QfIj8vre6X/H/2AU=
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr4642717wmg.116.1623163010692; 
 Tue, 08 Jun 2021 07:36:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXLmQdUWNH5LwEBtionXBzPAlPZt+qwSFXL6/wkzN4O1pfLdCaE/6qzf2lH0oWJxFTKBK4JQ==
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr4642694wmg.116.1623163010534; 
 Tue, 08 Jun 2021 07:36:50 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83d80.dip0.t-ipconnect.de.
 [217.232.61.128])
 by smtp.gmail.com with ESMTPSA id b15sm19128700wru.64.2021.06.08.07.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 07:36:50 -0700 (PDT)
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <83b32ad3-18a6-c9d4-6561-c3c880234e09@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8f6c0b14-16da-4699-a279-fcbacd1e862d@redhat.com>
Date: Tue, 8 Jun 2021 16:36:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <83b32ad3-18a6-c9d4-6561-c3c880234e09@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, "open list:IDE" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/06/2021 15.42, John Snow wrote:
> On 6/4/21 11:53 AM, Alex Bennée wrote:
>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>> machines is about to be broken and besides it's not likely this is
> 
> What's changing? I'm not deeply familiar with aarch64. Why is this 
> assumption about to be broken?

That's also quite a surprise to me. Do you have any pointers?

>> improving out coverage by much. Test the "virt" machine for both arm
>> and aarch64 as it can be used by either architecture.
>>
> 
> Sounds fine to me, but I didn't write this part of the test. Thomas, you 
> wrote this section IIRC -- does this reduce coverage in any meaningful way?

I think we built only aarch64 in a couple of our CI pipelines, assuming that 
it covers all normal arm machines, too ... so we might want to revisit our 
CI pipelines to check whether we then need more test coverage for 
qemu-system-arm instead. But apart from that, the patch looks ok to me.

  Thomas


