Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1535C400126
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 16:21:57 +0200 (CEST)
Received: from localhost ([::1]:46734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMA4o-00083L-6y
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 10:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mMA2d-0005nV-NL
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:19:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mMA2a-0003Jt-E0
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630678774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fQA+nKNyXhCe+wIVvo332z7LLSIna/DvTxL7WAd4IuE=;
 b=hH2E1B+ARpl9KO70wkSUxP3Y+LQUMLwP+6rxbjvBWVaE/IaFN/nzV6ZvvyCS5yNF/c740I
 XGHysRw7kdquxFAypEPx8SBpOTQonRy6NCY57sXr3qi0fbtFmTl93hBQJEzIfZAONiry4i
 KXSmbiAAGmPO3dIvTEtLp7FQwkhz9u0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-UG3F5bbQP8yJzv09R1vyxg-1; Fri, 03 Sep 2021 10:19:27 -0400
X-MC-Unique: UG3F5bbQP8yJzv09R1vyxg-1
Received: by mail-wm1-f71.google.com with SMTP id
 a201-20020a1c7fd2000000b002e748bf0544so2737902wmd.2
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 07:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fQA+nKNyXhCe+wIVvo332z7LLSIna/DvTxL7WAd4IuE=;
 b=XajuZ4QmpSNNRXEqwYnxxz1au+miccgJJpv4FCta3K/ylR01IkDHGQ/vycfAn28lN3
 KEPdfdcpV+MdvApwe0hTrcvzHQ/CbHy9YAt8B3tnpXRWSkMJQwl4N9sL4vTdYE1HFO5o
 lo2kLhNszoEevJCquwfeqjDQaCE/WrpEa+HKXoYrQV1a59rGFxmL9naYTC3I25zGlgM9
 6yWMK/VNEyezLKJykSpFf+UT3kc5xF/oimKhYa6ggdyfmvUjHGENovQ7Hx+ggZk6rz3k
 GP/a0HZQWmzIwCNiMfWj/oYaTdjgC1FaNKNMntwytajyh64sdwQ/twXGZchqu+QnGZa+
 2ZCw==
X-Gm-Message-State: AOAM532LUSejOVm076EOdsIY57J0hB81JggK/0oUzbmRjY9wzndd987G
 3ij0V/xORMiyhGCeUqJsWB1VJbT6+VkV5o6m2sTHzvz8BJ8qT4nXvnbuVg8NY5O62Jo9/OxXwbS
 2YDNjvcJb2+2VQ01w5FUbROebkyZGE2LTAo91tGCf3FBF2AyaizlPN4bTlB0hOT8=
X-Received: by 2002:adf:fb44:: with SMTP id c4mr4388541wrs.179.1630678766156; 
 Fri, 03 Sep 2021 07:19:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0cDmN0lIpY0QLdsTkjgHaNdU/rLd77Si4C98AHBk7Fi0s1Rb09UAzRn9ZHt1CZIlSITKWoQ==
X-Received: by 2002:adf:fb44:: with SMTP id c4mr4388514wrs.179.1630678765922; 
 Fri, 03 Sep 2021 07:19:25 -0700 (PDT)
Received: from thuth.remote.csb (pd9575948.dip0.t-ipconnect.de. [217.87.89.72])
 by smtp.gmail.com with ESMTPSA id p5sm5303355wrd.25.2021.09.03.07.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 07:19:25 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210902124911.822423-1-thuth@redhat.com>
 <CAFEAcA89mGzirJWyzH+-c3WtH3G=XYV0MqRfBK+5SnA+Hob-eA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL 00/13] Testing, build system and misc patches
Message-ID: <3090f5dd-d03d-bd2a-ce4d-ff0d796d9c5f@redhat.com>
Date: Fri, 3 Sep 2021 16:19:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA89mGzirJWyzH+-c3WtH3G=XYV0MqRfBK+5SnA+Hob-eA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.888, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/2021 15.22, Peter Maydell wrote:
> On Thu, 2 Sept 2021 at 13:49, Thomas Huth <thuth@redhat.com> wrote:
>>
>>   Hi Peter,
>>
>> the following changes since commit 59a89510b62ec23dbeab8b02fa4e3526e353d8b6:
>>
>>    Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2021-09-01-1' into staging (2021-09-02 08:51:31 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/thuth/qemu.git tags/pull-request-2021-09-02
>>
>> for you to fetch changes up to c72dc94b74fb1686decc0ca4c2b05e5bf2e5b74b:
>>
>>    softmmu/vl: Deprecate the -sdl and -curses option (2021-09-02 14:43:58 +0200)
>>
>> ----------------------------------------------------------------
>> * Add definitions of terms for CI/testing
>> * Fix g_setenv problem discovered by Coverity
>> * Gitlab CI improvements
>> * Build system improvements (configure script + meson.build)
>> * Removal of the show-fixed-bugs.sh script
>> * Clean up of the sdl and curses options
>>
> 
> This provokes a new warning from meson on a linux-static build:
> 
> Run-time dependency appleframeworks found: NO (tried framework)
> Library rt found: YES
> Found pkg-config: /usr/bin/pkg-config (0.29.1)
> WARNING: Static library 'gbm' not found for dependency 'gbm', may not
> be statically linked
> Run-time dependency gbm found: YES 20.0.8
> Dependency libpng found: YES 1.6.34 (cached)
> Dependency libjpeg found: YES unknown (cached)
> 
> If we're building statically and we can't find a static
> library then (a) we shouldn't print a WARNING and
> (b) we shouldn't then conclude that we've found gdm.

Hmmm, no clue what's wrong here, since I basically did declare it like all 
other libraries are declared, too (so this problem should have shown up 
somewhere else already?)... Paolo, do you have any ideas what's going on here?

  Thomas


