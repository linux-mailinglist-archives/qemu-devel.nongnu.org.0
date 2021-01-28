Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF43E3071D9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:46:10 +0100 (CET)
Received: from localhost ([::1]:53790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52wL-0002j7-QI
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:46:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l52u9-0001bl-GG
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:43:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l52u3-0003OM-Rp
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:43:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611823426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D/e7TnOWmxRXxLy/nsQzHLpX6QnNr8wx+NoXtTK+n7A=;
 b=Su6AgwQwCh7Mc6Gh+mKXmf9K1llaEuoC8aR2116v/hz7lHYJCjeBP6lugm87G+0JUqi3jY
 Jae6DTH25U4GJMk7nTOixmqcOaxSAhCT4hinGdUOibkwtwwA2X19dt5TvBMeQY6N5bb2ey
 FkqUeYLgpYg+MlgakIWJ48exdMAh+W4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-m3UAJ_E0MuiSd1V9Z1d7jg-1; Thu, 28 Jan 2021 03:43:44 -0500
X-MC-Unique: m3UAJ_E0MuiSd1V9Z1d7jg-1
Received: by mail-ej1-f72.google.com with SMTP id h18so1870791ejx.17
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:43:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D/e7TnOWmxRXxLy/nsQzHLpX6QnNr8wx+NoXtTK+n7A=;
 b=ZY4VXrAczNrb2kXhnOxOHaH0NOF1bE9VZ/ZvGLa/58aUuuAlsOrg/etuKdQnlN4j0u
 YwGdXqoTM+XoUhvddd2pDOGd5hcV/ZK3QFZ/KUcd5uD3/WoailjdwgdXxwKnFfW7PuWY
 tSbsUAdy53QGnBi2l86ZLpKWz2V5wyco5cLc8j7UY5mMofrSK98nY17Jg9Y9jQXJhCPU
 nq+45p9efVZL+v9bJVB5Sx7pUCJ8HE0q8kGxecpBZk7N4FvH9EBjjIzg+paKak0Eq1GM
 18E6z91tbxpQLDFIwUrYGAySVfP+ycy9Gmoacz2ZZMepCbjZWPf7ywsBbdZl4kQmlnte
 QoGg==
X-Gm-Message-State: AOAM533WY4AW4dQ1vKUQTl2TfwEy3Twafli/qvQbjU7LxZNs7o6r+rsi
 6uA6E9QhDHVf13g0qOzZuNCMuRgpTNAB0idEeHLaBCCNAhBAFYkiG5Pknzmg302LR7Vb5A9lBaF
 7EQcz4DtosUjN56U=
X-Received: by 2002:a17:906:9497:: with SMTP id
 t23mr10336944ejx.523.1611823423326; 
 Thu, 28 Jan 2021 00:43:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKbrZ6MMDSlL/JWJZri8Wo0IadrGtZkVbXLuKUMuoh4ENmW+J4VwnilA9gRJs79AC69pQMMQ==
X-Received: by 2002:a17:906:9497:: with SMTP id
 t23mr10336934ejx.523.1611823423135; 
 Thu, 28 Jan 2021 00:43:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f13sm1959356ejf.42.2021.01.28.00.43.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 00:43:42 -0800 (PST)
Subject: Re: [PATCH] target/i386: Fix decoding of certain BMI instructions
To: David Greenaway <dgreenaway@google.com>, qemu-devel@nongnu.org
References: <20210114063958.1508050-1-dgreenaway@google.com>
 <CAPs2x8=H+mMgnRWPO5WxS9z8ZvbVr3hPaGFqHjaPQDc+0ASG1A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <45fa6907-c652-c159-4b29-10b1ec12d8bb@redhat.com>
Date: Thu, 28 Jan 2021 09:43:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAPs2x8=H+mMgnRWPO5WxS9z8ZvbVr3hPaGFqHjaPQDc+0ASG1A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/01/21 23:54, David Greenaway wrote:
> On 14 Jan 2021, David Greenaway <dgreenaway@google.com> wrote:
>> This patch fixes a translation bug for a subset of x86 BMI instructions
>> such as the following: [...]
> 
> Gentle ping.
> 
> The patch is up at:
> 
> https://patchwork.kernel.org/project/qemu-devel/patch/20210114063958.1508050-1-dgreenaway@google.com/
> 
> if that helps.
> 
> Cheers,
> David
> 

Hi, I didn't have time to write a test yet (for tests/tcg).  I'll take a 
look now.

Paolo


