Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73CC32B698
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:31:38 +0100 (CET)
Received: from localhost ([::1]:38936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHOn3-00016M-Ug
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:31:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHOly-0000Af-E9
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:30:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHOlw-0005rb-Pw
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:30:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614767428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yBa1/4EcCarKUVBt1NUymXi6rS3yHrCuTpax9oeU97A=;
 b=OCFjudjcRSkejD5eTP6iAU6f1SG6mt+/sMCvOrEcPyoDhMHEyPGhTgGYIlxhn8Tz9kXNrd
 fYGwWL0zViqI1ui5vKEm/85QWjGNIwHWgir2tXbO2yrICv/v11ODcjGrJxKF+NOEhZAEbp
 Gq+fYk5o250mKbNUttsbCwKRK7lXNUQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-6AtuLbKANZCXP6LmZADfyg-1; Wed, 03 Mar 2021 05:30:25 -0500
X-MC-Unique: 6AtuLbKANZCXP6LmZADfyg-1
Received: by mail-ed1-f69.google.com with SMTP id h5so2082961edf.17
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 02:30:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yBa1/4EcCarKUVBt1NUymXi6rS3yHrCuTpax9oeU97A=;
 b=k8MOlHNc65tkx4Si8KA5UehgeiFXbnXSuKfcWJD/MRu01REm/Uth7FAPR+XQqiBPI8
 Wc0OqgckCSb8tATDgaHI7eW9iIWq3SsE5/QTPqTyTToQnBzs8LGqnfgetkKNAyXnaThp
 +x+km+yqw4c3zn/h1DVasQabRPUcnQP7FSbKsY/ssD2dkWj5QkU11xqnUs4hOQIJzeWZ
 i239L6cX9xiqUC9kmwc1FTw40EXLQZoVL0R2DcfmM0cc7kglDkMa3Iu8V5iyFKc+oed7
 /35p5c8TmlTVSGT27dbDu8V5PNL4n3SyRWWY9vf77Vz+voAVb4WlotsC8V9BARh781vy
 VzSg==
X-Gm-Message-State: AOAM532zmYqL5NCm4OK99NNPMQsbgVeTxWtR0g/EEmJBZfX8nOmlM+Dk
 R2OnD0+8kV6wSKdHxHUx/yLs2VlD4khm8gBo/BFEwZrbTjdURIYDy6rPxBKythZgp7hkNDxLR93
 neJqVpaGuIvKXdyc=
X-Received: by 2002:a17:906:1754:: with SMTP id
 d20mr24771233eje.221.1614767424536; 
 Wed, 03 Mar 2021 02:30:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSEL5vY4aj2jtim4LY5F0lOjq8oHtgdKDpxU+mAT960ic012x9vTW5nCfrTzP/VqA/nslYtQ==
X-Received: by 2002:a17:906:1754:: with SMTP id
 d20mr24771219eje.221.1614767424409; 
 Wed, 03 Mar 2021 02:30:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g2sm20957837ejk.108.2021.03.03.02.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 02:30:23 -0800 (PST)
Subject: Re: [PATCH v2 0/8] misc: Replace the words 'blacklist/whitelist'
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210205171817.2108907-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0200b600-b683-b939-4c46-eeaf9356243a@redhat.com>
Date: Wed, 3 Mar 2021 11:30:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205171817.2108907-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

On 2/5/21 6:18 PM, Philippe Mathieu-Daudé wrote:
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the words "blacklist"
> and "whitelist" appropriately.
> 

> Series expected to go via the qemu-trivial@ tree.

I forgot to Cc qemu-trivial@ :/ The series is now fully reviewed :)

> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> 
> Philippe Mathieu-Daudé (8):
>   ui: Replace the word 'whitelist'
>   tools/virtiofsd: Replace the word 'whitelist'
>   scripts/tracetool: Replace the word 'whitelist'
>   scripts/device-crash-test: Replace the word 'whitelist'
>   seccomp: Replace the word 'blacklist'
>   qemu-options: Replace the word 'blacklist'
>   tests/fp/fp-test: Replace the word 'blacklist'
>   hw/vfio/pci-quirks: Replace the word 'blacklist'


