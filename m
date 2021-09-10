Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC3F406E7B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 17:41:08 +0200 (CEST)
Received: from localhost ([::1]:49556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOieI-00060g-JP
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 11:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOicx-0005KZ-IW
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:39:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOicu-0003OW-4N
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631288378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2iR5Uy5CY35slV8aLu9OJED6WBsAe4SQMKUUxqztxbQ=;
 b=Oul/p/g/8u1vkrH4TY50gjnVjIG9LqufhnMsLDEKl90Ln3CcFgIYvS6EiZtzoI0fuRdP6l
 666SOGXzq9GGvtFkSUS5obfF+/ElV+VkrR7XPInW/GeUuWmSQUReoSEoGEG3Fdw0qLJIAW
 ULfaHHYLdxgPO9A+i/axTBxlm+AUBk4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-2LOA29MMN5mUEY_6mLAoPg-1; Fri, 10 Sep 2021 11:39:36 -0400
X-MC-Unique: 2LOA29MMN5mUEY_6mLAoPg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so995874wma.4
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 08:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2iR5Uy5CY35slV8aLu9OJED6WBsAe4SQMKUUxqztxbQ=;
 b=IDScWN71xOPFeaH3K9waWVi3+krz47YZP0VoYMUG5wfz/Edr708T/tlcJWgTF5ESI1
 /paf/VJDE/EwuWoUQgRgdlaHANpE1yXs4O+B/iSKUPt6l4zwKB5TiwUhj4v4AqwSjh7l
 9TN/6hN8cdcA6sBlQSGtOY0aMmXZS6nbnsPKOjIiVCOBtdGe3svmlgUSt9SMkwvFYxdX
 uIAtowUmIXoybBVYO4FVUlBD38hJ7fdW85WqMZL62WGKFqmi7HcggINqayy/CX4Hx7v/
 YdmSqIrLCth148L8kYYbfLIgVheqLNTwTbbj+uXaixdPniaOVP5Fon6AxINH8MCYt7De
 HWIg==
X-Gm-Message-State: AOAM533QaXjIEH6jZZn4fpRCWRYKCW5j0ZEr4vrgwphMgVHWgNj428NT
 She+2irqYu5MVWFYIs+k8R8jYvCPxITnKZxA4DYEMS730ba77/T+jGLKJc2DD4mDLeT04uI7gyG
 gpOkbGGKWIZHia3M=
X-Received: by 2002:adf:ea4d:: with SMTP id j13mr10416777wrn.86.1631288375561; 
 Fri, 10 Sep 2021 08:39:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfM7KHvArXLYKtZ08KsM2TspOGuxowXFb7UAkGUAGpF5I5GIG257gV5QiV0Ximj2ADOFWgzQ==
X-Received: by 2002:adf:ea4d:: with SMTP id j13mr10416760wrn.86.1631288375299; 
 Fri, 10 Sep 2021 08:39:35 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id y24sm5084976wma.9.2021.09.10.08.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 08:39:34 -0700 (PDT)
Subject: Re: [qemu-web PATCH 0/6] Small header/footer layout changes
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210908122814.707744-1-berrange@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c13cfa65-6062-64ea-91d7-854d0095b81f@redhat.com>
Date: Fri, 10 Sep 2021 17:39:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908122814.707744-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/09/21 14:28, Daniel P. Berrangé wrote:
> I previously sent a large series to more fully re-design the
> website, especially the front page
> 
>    https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg08205.html
> 
> Paolo had some feedback on that which I want to take into account
> but playing with CSS / layout always takes me way too long. I
> figured it could still be beneficial to take some of the simpler
> patches in that series.
> 
> So essentially this small series is the part of that large series
> that changes the header and footer. The changes to the front page
> body content are cut out until I can get them working better.
> 
> In a slight change from the previous posting for the "edit page"
> link at the bottom, I've now used an icon to represent it and
> moved its position, such that the layout is more visually
> pleasant.
> 
> The slight downside with only taking the header/footer changes
> is that some of the links I removed from the footer, would have
> been added in the page body of the front page instead. I think
> that's probably ok not to have them regardless though, as they
> are just a single jump away in an obvious place from the navbar
> header.

Yeah, some of them may be useful for easier access to contribution 
information and documentation, but it's okay to remove them for now.

I merged this part, thanks!

Paolo


