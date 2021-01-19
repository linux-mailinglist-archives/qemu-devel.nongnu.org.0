Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B742FBD6E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:22:45 +0100 (CET)
Received: from localhost ([::1]:49370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uiK-0001Sa-GL
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1uWl-0008IW-3r
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:10:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1uWg-0004w2-PO
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611076241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+CDSwg9Vwmj6xctRfvjgWOPJynFJuKMFrxQMdZ0W/pY=;
 b=ElivsjO8+jGG962qkGXWGjQrD93x1FYiutNkTCpcgtd75GQkuJJ9YUlXzfe/uu9F0UgHNI
 mLUWWB73wiZQ87QQqNy6z1JEF+ui2jGBOkYbbIbdg3/Eo8so2uF71VXHjQkfXgUT7C77Ki
 F+1NFWHJ6tBWz6ceBFYf7OwfhZTl+iU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-cJaYFrUGOvqY6X9toynBBg-1; Tue, 19 Jan 2021 12:10:39 -0500
X-MC-Unique: cJaYFrUGOvqY6X9toynBBg-1
Received: by mail-wr1-f71.google.com with SMTP id e12so10178363wrp.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:10:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+CDSwg9Vwmj6xctRfvjgWOPJynFJuKMFrxQMdZ0W/pY=;
 b=YALSnjD2fM0NOiNGof1oZYDWl3A4Z5dopnxm4kT2UvsIe0ndgm9r2RqR2O7h5wWa11
 cV8X9dMSIET6gCUTmDqLM5uPyBjCMQCI5dKFdh0HW/y5FtTOzdi/ZpHzGJCRHLI8x60+
 WeAXbbdbcIFGVb6oer9H0aEJkLeFIUxvyaYVGl/xunmqcb28Cb/AgIbBgGXt1cFQrvMb
 7y3lErhGJvIlAILf5RVDaQT2ayOtYh08xugYlnqo2MB+937NNqUZ1sSEf1NBlmQ9fsfd
 qczrGkEXuFvTukJdmSkrrBurClTZWPnREEeQAMmMiYjHoZoxjgSpjvFReSTFW56Y/+NZ
 bN6w==
X-Gm-Message-State: AOAM533akPijIENZq/Bwjkp22DuRcZ/ZebL22thtAI72QZsodQMLZOnS
 lKfRRmQDj9zh9nIIjWs9TOgJh0ez47ofZ5Xtffkz42vSJNQExtC9rjMHT45hCGVxxI33uM8ASzv
 18BKOovatizCkmHs=
X-Received: by 2002:adf:a319:: with SMTP id c25mr5442661wrb.262.1611076237324; 
 Tue, 19 Jan 2021 09:10:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZBshepC1PCpBgP5BRGiPc2DRKhlJlWoGuJQLEXPvdkf4wt2VSxK4MeDuwXujyJIRT5FCG3w==
X-Received: by 2002:adf:a319:: with SMTP id c25mr5442645wrb.262.1611076237170; 
 Tue, 19 Jan 2021 09:10:37 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x7sm5030801wmi.11.2021.01.19.09.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 09:10:35 -0800 (PST)
Subject: Re: [PATCH] pci: add romsize property
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Haibin Zhang <haibinzhang@tencent.com>,
 David Edmondson <david.edmondson@oracle.com>
References: <20201218182736.1634344-1-pbonzini@redhat.com>
 <b9b7e55a-0f90-6680-8e15-992997afdd38@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7f0cf9f5-f820-0571-f0f7-b409af19bd1f@redhat.com>
Date: Tue, 19 Jan 2021 18:10:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <b9b7e55a-0f90-6680-8e15-992997afdd38@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Markus Armbruster <armbru@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 dgilbert@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/01/21 17:51, Philippe Mathieu-Daudé wrote:
>> +    if (pci_dev->romsize != -1 && !is_power_of_2(pci_dev->romsize)) {
>> +        error_setg(errp, "ROM size %d is not a power of two", pci_dev->romsize);
>> +        return;
>> +    }
> Some cloud providers already complained the pow2 check in the pflash
> device (wasting host storage). Personally I find using pow2 easier
> and safer.

This check only applies to the value that is specified on the command 
line or in a global property, not to the file (the purpose of the 
property is exactly to override the file size, no matter if the file 
size is a power of two or not).

Even if there is no value for the property, non-power-of-two ROMs files 
are accepted and changed into the next power of two:

	pdev->romsize = pow2ceil(size);

> The pow2 check looks like a separate change however, maybe add in a
> separate patch? Or maybe not:)

Not a separate patch for the above reason: the check is on the 
newly-introduced property.

Paolo


