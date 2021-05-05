Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8F33736A0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:51:10 +0200 (CEST)
Received: from localhost ([::1]:36710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDFN-000355-Bf
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1leDDy-0002L9-Pk
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:49:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1leDDv-0001p8-Q8
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620204577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=76ohqy4ZzjgefDiKCnvjEQfGeTfIviHMJ2MbCGtzspc=;
 b=Y8zAtqeJ1gARn5aMU5R2Zz2KqWbDAi/exBm8wGa2FOYwi0THfKOVKYYnqpxe4SVnD/RFY9
 w3Oo8zPX93Fmse86D5CGR/FAtscyjf/Bs44YJOYnEqa8wJtJAfRagMZz66nV2HDLDh0WY4
 e9lINC00cydwTjUvh37Y6JjZalkFW5s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-dUcLZaBmNoSfoB7qq0MZQA-1; Wed, 05 May 2021 04:49:35 -0400
X-MC-Unique: dUcLZaBmNoSfoB7qq0MZQA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j136-20020a1c238e0000b029014675462236so341736wmj.7
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 01:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=76ohqy4ZzjgefDiKCnvjEQfGeTfIviHMJ2MbCGtzspc=;
 b=hAxD0PyP2i97ly6QrwK4dujjx6XA6wVewusrNNv2IQOQvXj/61AL8ArNdHAQ74WWCQ
 03mQzgVQYCxzbtXybDri4aeC31WkFljgPHpIemzU+rjcMGEg/+DUfkEX7tB3I16fb6pu
 Ve13xUCEmHX5ccyoZroDexQOOnAEoAKOpV4GAIbbNo8E+Iy5hW8roRFf919xXPW6b9bX
 Z9alGSvilCRMWgSuQZZmWpBP12EM1MHewQr8SRz4PpDvvgAZJSBlVaQSsrP6y8u320os
 vV5Swf7ZqM0OYSzHL227HJ2DmajRooAfBvvcQsaQmSbnCuRuJbQU8jW74uX3oCrx5diD
 vQ9g==
X-Gm-Message-State: AOAM5305xdFjSbWdzHY8ZlA3s/HwgC4LhJbpY7TljQmu0HKtfFfKN1D/
 6kvj6NfCF0KHzwSysLN/FvgqP5nlT7Of9J4QzxL+0rXrdR2PuYMXRsdPdGpn8TMP6tiG7eBRrAf
 n75lAh+6SBnKMAFc=
X-Received: by 2002:a5d:64e4:: with SMTP id g4mr36860266wri.366.1620204574725; 
 Wed, 05 May 2021 01:49:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQFGhPh+W+zePLZCYcDq4wB8YWfDYtjzma1ZaQD1c/bnTUIE4t3+ftJXY0/uO04ZYlRqhwlw==
X-Received: by 2002:a5d:64e4:: with SMTP id g4mr36860241wri.366.1620204574498; 
 Wed, 05 May 2021 01:49:34 -0700 (PDT)
Received: from thuth.remote.csb (pd9575e3e.dip0.t-ipconnect.de. [217.87.94.62])
 by smtp.gmail.com with ESMTPSA id d127sm4823456wmd.14.2021.05.05.01.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 01:49:34 -0700 (PDT)
To: John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <166fe72a-c209-fd08-5f31-db15e4f3a8b9@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Gitlab Issue Tracker - Proposed Workflow
Message-ID: <c278c5cb-f9d2-081f-3451-9ae38cd33bcf@redhat.com>
Date: Wed, 5 May 2021 10:49:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <166fe72a-c209-fd08-5f31-db15e4f3a8b9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/05/2021 20.33, John Snow wrote:
[...]
> - Gitlab will automatically close issues that reference the gitlab issue 
> tracker from the commit message, but it won't apply the "Merged" label, so 
> it's at risk of falling out of sync.
> 
> Closed issues retain their "Workflow::" labels, but won't show up in the 
> issue search by default unless you ask to include closed issues as well.
> 
> I think we can likely just drop this label, and have bugs go directly from 
> whatever state they're in to "Closed". The issue board will look cleaner and 
> there's less custodial work for maintainers.
> 
> - Similarly to the above concern, "Released" is extra paperwork for us to 
> maintain.
Others replied already, but I wanted to add some of my personal views here, 
too: Hunting down the issues to close them after we published a new release 
was a very tedious and time consuming task. Most people simply forget to 
close tickets that they've opened or solved. So I was always doing most of 
the dirty work here, using a script to hunt down bug URLs in commit messages 
and looking for bugs that were stuck in "Fix committed" state - but 
honestly, I feel like I've also got better things to do in my spare time.
So from my point of view: Let's close bugs automatically with the 
"Resolves:" keyword in the commit messages. I think users are smart enough 
to realize that the fix will then be available with the next release. So we 
really don't need a "Merged" and "Release" state anymore and I vote for 
dropping them.

  Thomas


