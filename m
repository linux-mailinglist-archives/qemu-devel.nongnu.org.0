Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E8E40366B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:56:23 +0200 (CEST)
Received: from localhost ([::1]:42476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNtNW-0003wV-In
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNtL7-0001j0-Ct
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:53:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNtL5-0002PF-A6
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631091230;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nc4j4dl7Mfy3UaeeqIQE2VyK+XGgfMm1ZSIO7tBQvPo=;
 b=EkmBIXSVYNH40jB4BV1HnxtPVAnuOY2UWFqv9LveTLFRkFB5Tua2ExAKONbgHzEJUXhqtN
 Qs2Fd4uYUl8h5KJSyNixa+Qx8X2jIwbb5S2rAn+uQSPrfacoWWgy8mQ0Xz0DbIYu99FtKY
 k1lS+bIQA4JzNaliTTgr+GBDnKd04fU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-jQ5Ar3cAPiGhSMJTq0S9IQ-1; Wed, 08 Sep 2021 04:53:47 -0400
X-MC-Unique: jQ5Ar3cAPiGhSMJTq0S9IQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 h1-20020adffd41000000b0015931e17ccfso289167wrs.18
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 01:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Nc4j4dl7Mfy3UaeeqIQE2VyK+XGgfMm1ZSIO7tBQvPo=;
 b=U661wt0NSa6VA5dQFz4995RYKVcYJe7pEKEX74bIi26DzxFc9JtiUIFAq15lhvR57E
 tUaLzutGmvFVXEL6zmwkyJ7Vi/dIAYbY9hD54VevT6tETXuYfS858A+4n36+hybAybWC
 1MtlCK0saoxyWmbam5bNrd5L/o7xT2fsyL4Z8ZKOMiuymTj830DxL7GPadNUGOIq3iXB
 cJ3jjqAItlCUNhJOgz5Rf78eod+JXKAk6yULCVNKY2Ke54k2NbCszqtLX81hVvJTOm/4
 7W26Ms5H/3m517pYb76arPCOEX9Sr1OE9JPZ98PR5E/pYmROhpQbimmRhl+W2fNeeNKi
 HpdQ==
X-Gm-Message-State: AOAM531VSVJMgIXqBYa7bECHMYOq+0gjBMg3zz7cGCvLBdBM5eLv8X1O
 pQ8fYtIC70WvFPZBu6ReMn6zFKyH4jaOABQ8A8WJccRbVDZh5Hf+uOV+MWy4tTi3W2qaMMn9kSA
 uAKi6cJqoYHiSdaY=
X-Received: by 2002:a5d:4c4c:: with SMTP id n12mr2683929wrt.19.1631091226541; 
 Wed, 08 Sep 2021 01:53:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0OyQfyVtK5Exxd/DvtUJw960vgzgLYmRmmpe68nxixS4vZOHSGJ0zd5nIoDWIHANb9FHFng==
X-Received: by 2002:a5d:4c4c:: with SMTP id n12mr2683914wrt.19.1631091226349; 
 Wed, 08 Sep 2021 01:53:46 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id z6sm1426152wmp.1.2021.09.08.01.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 01:53:45 -0700 (PDT)
Subject: Re: [PATCH 3/3] docs/system/arm/virt: Fix documentation for the
 'highmem' option
To: Peter Maydell <peter.maydell@linaro.org>, Marc Zyngier <maz@kernel.org>
References: <20210822144441.1290891-1-maz@kernel.org>
 <20210822144441.1290891-4-maz@kernel.org>
 <CAFEAcA_J5W6kaaZ-oYtcRcQ5=z5nFv6bOVVu5n_ad0N8-NGzpg@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <fd41f05a-5ddb-6263-9efb-b130f7ac6817@redhat.com>
Date: Wed, 8 Sep 2021 10:53:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_J5W6kaaZ-oYtcRcQ5=z5nFv6bOVVu5n_ad0N8-NGzpg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: eric.auger@redhat.com
Cc: Andrew Jones <drjones@redhat.com>,
 Android Kernel Team <kernel-team@android.com>,
 QEMU Developers <qemu-devel@nongnu.org>, kvm-devel <kvm@vger.kernel.org>,
 kvmarm <kvmarm@lists.cs.columbia.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 9/7/21 2:51 PM, Peter Maydell wrote:
> On Sun, 22 Aug 2021 at 15:45, Marc Zyngier <maz@kernel.org> wrote:
>> The documentation for the 'highmem' option indicates that it controls
>> the placement of both devices and RAM. The actual behaviour of QEMU
>> seems to be that RAM is allowed to go beyond the 4GiB limit, and
>> that only devices are constraint by this option.
>>
>> Align the documentation with the actual behaviour.
> I think it would be better to align the behaviour with the documentation.
>
> The intent of 'highmem' is to allow a configuration for use with guests
> that can't address more than 32 bits (originally, 32-bit guests without
> LPAE support compiled in). It seems like a bug that we allow the user
> to specify more RAM than will fit into that 32-bit range. We should
> instead make QEMU exit with an error if the user tries to specify
> both highmem=off and a memory size that's too big to fit.

That's my opinion too

Thanks

Eric
>
> thanks
> -- PMM
>


