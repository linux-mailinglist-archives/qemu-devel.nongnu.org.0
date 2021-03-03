Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239C932B7C6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:23:42 +0100 (CET)
Received: from localhost ([::1]:43660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQXV-0001Bm-7I
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHQWN-0000l5-VD
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:22:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHQWL-0007mh-Fx
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614774147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9s5GC4y87GvNIu1NXT9AGKaOTfZB+fQGJbGlPoK4USE=;
 b=BoT8m/NrOw/negF9uKnFF9mJxXIcw0VqfOYpPwlx98BjG4pORohLoWr8qISMRFFxZtWtao
 TwL/O5p+BYB82hegQeinad3lHZxuF6t8mqx38aPoL8lzpwPLxlBXbmsPoqPjd7LvHqE5oa
 vpolHnbWW+Cvdi26fdKGr/ghQO1C5qA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-nRd7XiAGOZmkj-ClrLacIA-1; Wed, 03 Mar 2021 07:22:26 -0500
X-MC-Unique: nRd7XiAGOZmkj-ClrLacIA-1
Received: by mail-wr1-f69.google.com with SMTP id e29so12558765wra.12
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 04:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9s5GC4y87GvNIu1NXT9AGKaOTfZB+fQGJbGlPoK4USE=;
 b=l/Qk6EpBuVsuf/gUcks2jeAbjUud1lOrDpSQwFK6pyVjzw/W1NYn+xWDtHviXkN0QX
 FhGPfRBJ153QHRwJQNYW4iXpKROwMHl6fmGPyQhqt9yFGuZ3cX7ef8HwMdxdqyVIVxbG
 cLuJModgpcHRS+Mx1prUcDbJNUSjcWhirQ4HmkKyDQojrCEWk9YntNM5OmqhAgjMqAHD
 +z7DPvlUuoDsjzP87pvzcArUJM1FYJgvtVlPob56hqSzc7XougQ9g9GsswYGinv32nE0
 Zr78WqUqw0NG2XjKg45tTUH6yfoewBegCGLhMdiisfRErdZ8k9hXWDrWhTofki9Ay3uY
 R9ZQ==
X-Gm-Message-State: AOAM5315GaGCkPUJ/xM6YelAohGHy4049CUSxGBegCDIlygYAWFqiSJr
 DfLJtS5/1KqajXjSM7IRqf05xXMmBJnPPGwqAtCZZQXUmUSUakUFGQ2jviDDMcVQpDPQu641VOH
 ifRgnQ5Cgcfz9c9EfM3YUKfnpspfZFiAygoWA5HkZ96zXeB0SOwRJyOe7AQnlrocWDOE=
X-Received: by 2002:a7b:c151:: with SMTP id z17mr7666991wmi.189.1614774144089; 
 Wed, 03 Mar 2021 04:22:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/k7R6fZenKZVoP9apAtApA9Ylo5FmlnsUckqvDmAwyKFZd7cFprSJNRf/pwUvRp9AwJshuA==
X-Received: by 2002:a7b:c151:: with SMTP id z17mr7666970wmi.189.1614774143856; 
 Wed, 03 Mar 2021 04:22:23 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm33509618wru.64.2021.03.03.04.22.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 04:22:23 -0800 (PST)
Subject: Re: [PATCH] meson: add tests option
To: Romain Naour <romain.naour@gmail.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
References: <20210226220715.3103110-1-romain.naour@gmail.com>
 <eabd866e-71c5-3ac3-7688-0318fc758f94@redhat.com>
 <14d34883-5e97-972d-87d1-49b47324cac5@redhat.com>
 <8d5714d1-d92b-60fc-531f-73eb05852c8f@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <472c9809-8987-3c2c-c2b5-b99d637ace0f@redhat.com>
Date: Wed, 3 Mar 2021 13:22:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <8d5714d1-d92b-60fc-531f-73eb05852c8f@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/03/21 22:14, Romain Naour wrote:
>> I disagree, without a use case the right thing to do is to check for fenv.h.
>> It's as easy as this:
> Is it ok if I take your patch to disable fp tests when fenv.h is missing and
> resend my patch with an updated commit log to disable all tests to save some
> build time?

To save build time you could also mark the tests as "build_by_default: 
false".  They should be built lazily when you run "make check".

Paolo


