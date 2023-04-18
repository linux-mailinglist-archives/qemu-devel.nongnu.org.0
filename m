Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1E76E5F3E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 13:00:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poj3u-0007zB-Of; Tue, 18 Apr 2023 06:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poj3t-0007yu-Om
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 06:59:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poj3s-0001zK-1C
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 06:59:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681815586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ss0v4o3o4URqv8/1lfIm1k+QjT2KHPLUGdNubVkez9s=;
 b=IVRcrKUmNhM/5RyqsFIHlvVGTwpyaa/eRWtwcvP6HQuxyBmBGVcnqmxYAXu0fGPVCNM5QV
 EF/n4WA79+aV7UpOQTi85MXr7aMR7M7ddyEeRa/lH+XBT2xryQ6/qqRHlXqyUkDB9QAOl/
 QnpO+csQ94zuI/Ca5SczPiEDabobBj4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-fAQuuxR3PaOFo-NewycreA-1; Tue, 18 Apr 2023 06:59:45 -0400
X-MC-Unique: fAQuuxR3PaOFo-NewycreA-1
Received: by mail-wm1-f72.google.com with SMTP id
 hg16-20020a05600c539000b003f09d1918aaso8916367wmb.4
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 03:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681815584; x=1684407584;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ss0v4o3o4URqv8/1lfIm1k+QjT2KHPLUGdNubVkez9s=;
 b=Joe6IrTIbMP6l+toQnwi/mXfrVwChosg0w1P5NXR3/dQybNcRbheGSeoPdiVjTPERR
 Glrs92wjtG9GfKmyzwJvb1hjzmlzhrWhk/g6Zg3U1+lKQ0yBZ3fGpw8UJ3Vp0hoGdpXu
 lpol2oCwDkZ7s9C6wIPLJaojYPd1tkbNC2DfKn9e5AiRmE3+U8wvGiaIAuhw7vQoKPt3
 uVeIdTVQLHaxZNh5kI0y04fMKlQj7RVHU4ouMIKr3rrPAaNM2w7K0LNkAmuJliBtJ/iV
 j+KKM8IyzdlDjOSZqoRT6uQMDo1O9PsL5VU6udXLPlXpKP3xFFmMWPqr1Geq8KEukThd
 d6EA==
X-Gm-Message-State: AAQBX9f4+L2hpazQQWzA0isIP9z8oTvdmoovgakMaGVoIBT29XCmbFWy
 5qYah8or86pPAZXTF0pSKLl5D9Nw1awRyYQd1NSMrty7SDy+1cQpH87IfgDFUO96qAit8Z7nR4D
 8xiMPjFbew8nrVWQ=
X-Received: by 2002:a1c:770c:0:b0:3ed:307f:1663 with SMTP id
 t12-20020a1c770c000000b003ed307f1663mr14308569wmi.15.1681815584232; 
 Tue, 18 Apr 2023 03:59:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350byn1htOghwbaVgPYSvBYTlZ0K0JMYBUYZb6KU+X0swdAaVEtmnvIW/c6Vl6MRvCNzRiyXRZg==
X-Received: by 2002:a1c:770c:0:b0:3ed:307f:1663 with SMTP id
 t12-20020a1c770c000000b003ed307f1663mr14308558wmi.15.1681815583948; 
 Tue, 18 Apr 2023 03:59:43 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-59.web.vodafone.de.
 [109.43.176.59]) by smtp.gmail.com with ESMTPSA id
 v3-20020a1cf703000000b003f04646838esm14703305wmh.39.2023.04.18.03.59.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 03:59:43 -0700 (PDT)
Message-ID: <3a601ee8-15f0-39ec-3436-69ecc5b25886@redhat.com>
Date: Tue, 18 Apr 2023 12:59:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/2] tests/migration: Fix migration-test slowdown
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230412142001.16501-1-quintela@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230412142001.16501-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/04/2023 16.19, Juan Quintela wrote:
> Since commit:
> 
> commit 1bfc8dde505f1e6a92697c52aa9b09e81b54c78f
> Author: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Date:   Mon Mar 6 15:26:12 2023 +0000
> 
>      tests/migration: Tweek auto converge limits check
> 
>      Thomas found an autoconverge test failure where the
>      migration completed before the autoconverge had kicked in.
>      [...]
> 
> migration-test has become very slow.
> On my laptop, before that commit migration-test takes 2min10seconds
> After that commit, it takes around 11minutes
> 
> We can't revert it because it fixes a real problem when the host
> machine is overloaded.  See the comment on test_migrate_auto_converge().

Thanks, your patches decrease the time to run the migration-test from 16 
minutes down to 5 minutes on my system, that's a great improvement, indeed!

Tested-by: Thomas Huth <thuth@redhat.com>

(though 5 minutes are still quite a lot for qtests ... maybe some other 
parts could be moved to only run with g_test_slow() ?)


