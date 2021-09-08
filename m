Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D38403401
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 08:02:10 +0200 (CEST)
Received: from localhost ([::1]:37224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNqev-0004yU-4S
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 02:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNqdQ-0004BX-HP
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:00:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNqdO-0000T3-V8
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631080833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfMrgJQ8gxjqVU9wN+A3jzGmbT0BrW96uXcGLeYtnz8=;
 b=PJ6gflOdZp0PdKFi+B9h5q+duMe/lxRPVoP2p3QEhYK0NzsVo+MYnkr6cXqIv8n+4E57OJ
 TqZpZMdNR1LMyfyCSh4u8IMO9JyiiTnsTi++qaewXtVwOsTYE2HkqQ1eAR4lSVftWtCqrj
 RVHtSPSmPl+k0GAgsMjEQtDBgF7uVE4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-aS3YmcDuOC6DI2eAlZ9rrw-1; Wed, 08 Sep 2021 02:00:18 -0400
X-MC-Unique: aS3YmcDuOC6DI2eAlZ9rrw-1
Received: by mail-ed1-f71.google.com with SMTP id
 ch11-20020a0564021bcb00b003c8021b61c4so495389edb.23
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 23:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VfMrgJQ8gxjqVU9wN+A3jzGmbT0BrW96uXcGLeYtnz8=;
 b=F80iSkBDg5i3H+dHxrYLsPG0x1p4LaeafksM2l1KPc2DmpN7x5WYeYWApOwk73Xo9j
 xjHqQFvyKTmZx1FOJp0VFyHN4CtbaOPvxplQC/BIDloOLT2ICFBeAqqf9cO0byFLm0OK
 d70Of0v7I7+ygnHWLw2vzH4CHLsHtPcctkSfgbuWJLWBaWpGT9khKSnXNon5dUx9S3Hb
 ZZKPL2DzD+IxsmOcpOjHZV+YmHlHsh9jGofjjPDGg2zFE+i59Y5FTHIOooqlc5obHSLx
 p/0Ms8bNNyFvto/5BsNkF5Qhw0j7EtTWJsQYQoHmldUJ0F5MV7A+7gYWUPBWru/6xgb6
 flcQ==
X-Gm-Message-State: AOAM5324Ezi3ZFPuhX0XW0NAf4boJBwaAs7UTkItlOkvYHwDXfbu1mzb
 l/MqdmWJ9TKraiR3tgqIbq4S9MtVNSNPLekM29/KAyjSjAZkrpEaxWlGS2csKQf3ZPvSSypwYEw
 u1WbzuhcJ+B2gQQw=
X-Received: by 2002:a17:906:49d5:: with SMTP id
 w21mr2408141ejv.30.1631080816657; 
 Tue, 07 Sep 2021 23:00:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhMQLdmqIYvWDQu9pjkAFqsvyUX4nY0ZeWtGrhQQB105JpgvOfWzlyFYKmYU5+bPdJcSCB8g==
X-Received: by 2002:a17:906:49d5:: with SMTP id
 w21mr2408088ejv.30.1631080816100; 
 Tue, 07 Sep 2021 23:00:16 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k12sm526820edo.9.2021.09.07.23.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 23:00:15 -0700 (PDT)
Subject: Re: [PATCH v4 00/33] Qemu SGX virtualization
To: Yang Zhong <yang.zhong@intel.com>
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <CABgObfYSXDvif5Rd8Bz-9VOjhj4sBai5msnwVySbXj6e1=Wa4A@mail.gmail.com>
 <20210907095120.GC18368@yangzhon-Virtual>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ecb7dd63-5df9-281c-aedc-149b9d964cef@redhat.com>
Date: Wed, 8 Sep 2021 08:00:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907095120.GC18368@yangzhon-Virtual>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: seanjc@google.com, jarkko@kernel.org, eblake@redhat.com,
 qemu-devel@nongnu.org, kai.huang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/09/21 11:51, Yang Zhong wrote:
>    
>    Paolo, I have moved hmp and qmp codes to target/i386/monitor.c and also
>    fixed the issue with test tool(tests/qtest/test-hmp). This issue is caused
>    by 'machine none' test in the hmp, the previous patches only covered qmp
>    test in 'machine none' with Libvirt.
> 
>    So, the next issue:
>    1) re-send all sgx basic patches(including monitors patches) to you?
>    2) only send monitor patches in the next phase when the basic sgx patches
>       are merged?

You can post them now, including

Based-on: <20210907071349.116329-1-pbonzini@redhat.com>

in the cover letter.

Paolo


