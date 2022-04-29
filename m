Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E62B51456B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 11:29:03 +0200 (CEST)
Received: from localhost ([::1]:58144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkMvt-0000j5-PU
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 05:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1nkMtw-0007c4-4j
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 05:27:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1nkMtr-0005Gp-R3
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 05:26:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651224413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J/IvZOITJBrejN7m07+fuyvLFmwoaNnVv2VK6LZsXnY=;
 b=UA8Ipu2yEbv96k0xjDJM3xBXPOeyXzuAh3oTBwGUSTjm3wsL8XfsLBUZQ038B6RFJNj0JI
 dM9+CkJ45Rr+Q9SuHliQ40eONG+XWnYdD5oNrJCHevtG+t/LVKfsDBoM4nfPuGQ29dSFeJ
 nC7BFY+iw3R8c0/wSkkH5oMjBDF04UQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-AiKyzMezPFi40YXRsbSOmw-1; Fri, 29 Apr 2022 05:26:51 -0400
X-MC-Unique: AiKyzMezPFi40YXRsbSOmw-1
Received: by mail-wr1-f70.google.com with SMTP id
 l7-20020adfbd87000000b0020ac0a4d23dso2860840wrh.17
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 02:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=J/IvZOITJBrejN7m07+fuyvLFmwoaNnVv2VK6LZsXnY=;
 b=qDM9qhH7wIiy9pbd7afLEavdgeBPtJrNI1GYGLayOsmu3thcD+JEPkbFoLeZpqvyE9
 XpvJyn++ywUVwjTwmMhySYdDsnEBMkb2o300j5UVJ4gZHMQ/PAnIKPILWp9SVAztOHBV
 WNYQjXL9lNUgnvXCDRV3UAtOrvbe50uWeGpJL9Y5UwTIUV3Ysk5wNP2YlhMUWLQdgiEP
 wVl8obDllboNAiAuFgLZ6kj8t13dPVAppb41wKn3K0Hkpv45lBFO7lYcGf8GXoK7JbKz
 DuRsEib/75Dq6UXmg2Ux5SDvRcLxYltkGV0SvDCldx8joAWjWzuHBsqs6QK28qxXW8OM
 RvyQ==
X-Gm-Message-State: AOAM533IelmGqtDYwB9t5tn8JngdIFezGDBFJrx8AGe7UjCiWxqwrR3U
 XAB2QdCgI3W1QUi5eCGbUXtVkXw5mxPamJB1FTyJrHPgH056gbua1a7lx7IAULQPt6Bn0lgjJ/R
 O3s0FCq9lX12T6XE=
X-Received: by 2002:a05:6000:1547:b0:20a:f1a4:f6c4 with SMTP id
 7-20020a056000154700b0020af1a4f6c4mr9144257wry.15.1651224410337; 
 Fri, 29 Apr 2022 02:26:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyu+rCGNq8IKj2B1ICdaH9bD4zz4OpA/vo5ygKoYlwHvFqYZIcjDcIZ2/mx7WjquUKeVxM3bw==
X-Received: by 2002:a05:6000:1547:b0:20a:f1a4:f6c4 with SMTP id
 7-20020a056000154700b0020af1a4f6c4mr9144243wry.15.1651224410134; 
 Fri, 29 Apr 2022 02:26:50 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a05600c4f5400b00393ea3bab42sm2204468wmq.19.2022.04.29.02.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 02:26:49 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 0/5] i386: Enable newly introduced KVM Hyper-V
 enlightenments
In-Reply-To: <20220429075451.292638-1-pbonzini@redhat.com>
References: <20220429075451.292638-1-pbonzini@redhat.com>
Date: Fri, 29 Apr 2022 11:26:49 +0200
Message-ID: <87pml02qau.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

>> This series enables four new KVM Hyper-V enlightenmtes [...]
>>
>> docs/hyperv.txt                | 34 ++++++++++++++++++++++
>
> Queued, thanks.  

Thanks!

> Would you please convert hyperv.txt to rST in docs/system/i386?

Sure, it's on my TODO list.

-- 
Vitaly


