Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29297350255
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 16:33:06 +0200 (CEST)
Received: from localhost ([::1]:45878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRbu5-0000ea-5e
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 10:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRbrl-0007xA-Io
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 10:30:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRbrj-0007rW-VX
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 10:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617201038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hv0IgnbxuiR0iOwY5yGGC6cmDoYhM9vxCCyi77yrLBM=;
 b=fN/lLuCjur8tWvA5gI9irjfAOxRHG9mapkhnlIvkYtjeZK20UVUNi+vYd5GcHAIXtGF3i8
 ZrqAbh6ESA2cexSifMgS9HCt+umhyaUQ/Xl4Cm7j1sb1sAgYIq3Y+rMlCgSbehncrf0clw
 HpC552YKNRetd7mm8XunMrDzWg2z6Tg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-S0e7zNErNdWOagnOQT-IrQ-1; Wed, 31 Mar 2021 10:30:36 -0400
X-MC-Unique: S0e7zNErNdWOagnOQT-IrQ-1
Received: by mail-ej1-f71.google.com with SMTP id a22so870861ejx.10
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 07:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hv0IgnbxuiR0iOwY5yGGC6cmDoYhM9vxCCyi77yrLBM=;
 b=WGrx9uZhU8LConEoVJZPApsnK5SXy/T51fw7WnIGjUFbWiDUHpTtZgiWVYcVIyeSZr
 nM2oebppfiu1rEoxqMG7wxtWxkvef6OxGrBxMg5VLE2/uJM1A62kpCFiNbs899K+BEj/
 2TpZgT2B+U8ujO33TC1YqMWV65FO+JGKm02aD7cVkUzHUxgleCJZjHAQ1mDS+CJYzdbF
 SYSNsDNkv3Zh9mBJ2FWZadyAW/ZdwaevlZWiIqPcqmjK5711xs8QzljIRGqXXiVOrgpk
 mopSvxAMxWDSmeXodhh73cCU4peH/9WquuMx5gOVb6rZRbsFAkX7rncIQl58bAcUf8Xk
 tJoA==
X-Gm-Message-State: AOAM530c1vvFVnj0GKzW/8h537JmlN4AU9dm6sbkAyRtsq2bNt6ARNtE
 eLeHZqqyw04eRBxnPAqlkHtXX5tzmylMmodq4/ZXTKrMRJLbuDgSrrdE4RVUxDpBYI2PUSmL0ij
 5S7DIvE7NRbDf5KA=
X-Received: by 2002:a17:906:aac6:: with SMTP id
 kt6mr3888554ejb.260.1617201035885; 
 Wed, 31 Mar 2021 07:30:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSasrewLWfJ6FppDVgaAx9fT0iuaC1e6wtlaTqTWqruAJ3iiv68SNyQiusALpDbm30g/25ZQ==
X-Received: by 2002:a17:906:aac6:: with SMTP id
 kt6mr3888535ejb.260.1617201035734; 
 Wed, 31 Mar 2021 07:30:35 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q16sm1333459ejd.15.2021.03.31.07.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 07:30:33 -0700 (PDT)
Subject: Re: [PATCH] target/openrisc: fix icount handling for timer
 instructions
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Stafford Horne <shorne@gmail.com>
References: <161700376169.1135890.8707223959310729949.stgit@pasha-ThinkPad-X280>
 <20210330220532.GC1171117@lianli.shorne-pla.net>
 <532799f9-e9ed-1e7a-713e-0ff436721f82@ispras.ru>
 <20210331123342.GG1171117@lianli.shorne-pla.net>
 <78f2452a-5a26-472d-2bf1-1a2a338eb8d3@ispras.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3c07bc72-52b9-0ffd-4c13-c0375e32d84f@redhat.com>
Date: Wed, 31 Mar 2021 16:30:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <78f2452a-5a26-472d-2bf1-1a2a338eb8d3@ispras.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: qemu-devel@nongnu.org, proljc@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/03/21 14:48, Pavel Dovgalyuk wrote:
>> Acked-by: Stafford Horne <shorne@gmail.com>
>>
>> I am not currently maintaining an openrisc queue, but I could start 
>> one.  Do you
>> have another way to submit this upstream?
> 
> Paolo, can you queue this one?

Sure, done.

Paolo


