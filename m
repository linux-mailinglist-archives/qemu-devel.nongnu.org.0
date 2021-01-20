Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB242FD699
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:14:39 +0100 (CET)
Received: from localhost ([::1]:43790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2H42-0001qq-A4
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:14:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2H0c-0008OC-Sn
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:11:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2H0Y-00067s-07
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:11:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611162660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRc8ic041PgUeYpZHV+SBepczqkEE2jznFpSYAP9Wwg=;
 b=OQxaoKeeYEpedhsTX47JLIglxpzgr3sQiRocqsAPxu5aTsNNgJi/UlrXwuLSAeDcBzvXIU
 CKPImCjesxMGPo9fG0yGoRMJVzxPxuDbWQ1OhlsSTQiK1vNQrORJzzViGMWCP5eaJDGiLS
 2wZnY8tlZm9LKKYSka9O/oxYWPhhphI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-Pa0MBMr8O_KjGLFAh4DE4w-1; Wed, 20 Jan 2021 12:10:57 -0500
X-MC-Unique: Pa0MBMr8O_KjGLFAh4DE4w-1
Received: by mail-ej1-f71.google.com with SMTP id o21so751771eje.5
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 09:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eRc8ic041PgUeYpZHV+SBepczqkEE2jznFpSYAP9Wwg=;
 b=n7Ex3GNG6uJxNaghruf7BjuXlu1/6VFl0nHo7DgEJTgZHB1+ET3897tP0jVkB7u4Zp
 5aT8FVDdM9ApzUs3MU1s1uxUrtdQYTBPyffgMuuQZGjk1PYQT3A8fy0pktsE5sxi0gY7
 sle+ENYTp6ppyYnenbkm0aCylK1CanjLipznxb4tdyEi/AtKmgXTiUlAA18ufjC864uV
 jJOJZjqxN38FlwqK1AFwuL3quHMT2QfFI1vp7ip6JEDCw0qRJiEsjACtIB8R5ihTHvjm
 CATCUVqbwSmRvwIcTdJU/cqOi/+jSzfqZYBcnayfuNjK75EXx6oinf7PQVueEfowk8gq
 PBoQ==
X-Gm-Message-State: AOAM5320RLbbmWxaWI1mOYwJAkhYWTc09qRh5BDlJ9pCGtryjqyZzTrf
 jeeysKCXyQZTjLnZpObioGSebIjfaWuVt5yqLj/V0dE/QhRLB4psINuiVHk+9p+BNs+ILvqIcWu
 EaIk0OM/o/BPV+enAa5UrKLqjOBjEfqIBHXMlzL5m/hsVezzaI7kwXGtxwXmstBtrKa4=
X-Received: by 2002:a17:906:58f:: with SMTP id 15mr6631101ejn.67.1611162655656; 
 Wed, 20 Jan 2021 09:10:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzacrKh+W/JUTpaWl17cdHoptXpU2EoEeCjUlmMVph3Ah+bI6etNHIUYtSOJZH95C7xynCv/w==
X-Received: by 2002:a17:906:58f:: with SMTP id 15mr6631091ejn.67.1611162655440; 
 Wed, 20 Jan 2021 09:10:55 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j23sm1143787ejs.112.2021.01.20.09.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 09:10:54 -0800 (PST)
Subject: Re: [PATCH 0/9] meson: Clarify summary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210119185005.880322-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <25320ab3-1e26-8c24-2850-7cf8f6669492@redhat.com>
Date: Wed, 20 Jan 2021 18:10:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119185005.880322-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 19/01/21 19:49, Philippe Mathieu-Daudé wrote:
> Reorder stuffs in summary to quicker understand bug reports.
> 
> Remove information from deselected features when not necessary.
> 
> Philippe Mathieu-Daudé (9):
>    meson: Summarize generic information first
>    meson: Summarize compilation information altogether
>    meson: Summarize host binaries altogether
>    meson: Summarize accelerators altogether
>    meson: Display if system emulation is selected in summary
>    meson: Restrict system-mode specific accelerators
>    meson: Do not configure audio if system-mode is not selected
>    meson: Display if user-mode emulation is selected in summary
>    meson: Summarize block layer information altogether
> 
>   configure   |   6 +++
>   meson.build | 132 +++++++++++++++++++++++++++++-----------------------
>   2 files changed, 81 insertions(+), 57 deletions(-)
> 

Very nice.  (I'm just not sure about patches 5 and 8 since there's 
already the target directories).  A couple nits:

* sparse should go in host binaries

* WIN_SDK should go in compilation information

* It would be nice to have a comment above each of the groups

I have done the changes myself.  I will also send out for review a patch 
to further group dependencies and "other features" (vhost, modules, etc.).

Paolo


