Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1D74309EE
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 17:01:21 +0200 (CEST)
Received: from localhost ([::1]:36580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mc7f5-0001Nt-TK
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 11:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mc7cg-0000Zb-L6
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 10:58:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mc7cc-0006q9-Hy
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 10:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634482724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4QTq/v2C16PRuCQjDGpRYshFI+XDm37nDpOzKY1VYDg=;
 b=WRur7q6EgF03wd4/0mmQ/WjUwpeMh2h8+ZBkXnk0PPjqi1JeVzQcOsoQEq+GpJoAOc3WWM
 65I1zu9WkWYDQs72qADYanwNMrXpALiGr6LfwQkDKL0rKM/yZNLWpi2QyBCX/rRl1BtvpZ
 qWII2B2GUtupVJV7/Chw/L6O3e9MCug=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-aRz6Eh5SM5WavMlO3qNUPQ-1; Sun, 17 Oct 2021 10:58:41 -0400
X-MC-Unique: aRz6Eh5SM5WavMlO3qNUPQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 d7-20020a1c7307000000b0030d6982305bso2327097wmb.5
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 07:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=4QTq/v2C16PRuCQjDGpRYshFI+XDm37nDpOzKY1VYDg=;
 b=5DHs/lrCyHNVhvhy8hdojp5OS0CkCogkDqJMA47uBuwCkntJJ85EeTnZ6r5eBrkJX4
 J5mtsofjsKela0O9U00XhJ7PnajAIt5rcAQ1LHQtLnLhE2G6S86Oe7AAcIsfX6n8tlvd
 YQ9KSP+dzQngS8n6tprKNfuc/kC1VtuDScn3ZlfSgORozCr0gbtVxyhC6jXafKIYX1sN
 YToDDsbQiLT1QoPBMyjFD9ctN7Lpf1LGfaILu3OgK0CcInbSIMFujL0/I8CxsyqL+9Gc
 uin7ZkQecvnrHCgRuddxInnx6C/YenxekAcZf5cdfRBdA3z8bNb99lZLN7ze/EtRoVUe
 i59Q==
X-Gm-Message-State: AOAM5329x7/wfmMSiUofBgKMV8+wgBMm6S+0g4v/kFBDHMB5kBIXiuiq
 f15AWPzJqoG6O1AM1tMlAKJfN+VWTQhsHxjEVrr+M57YylKAX6iBS4AFY29TFPAtF85mjtNkRb0
 Ave9DyS1QgC35u3I=
X-Received: by 2002:a05:600c:358b:: with SMTP id
 p11mr38266436wmq.156.1634482720141; 
 Sun, 17 Oct 2021 07:58:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfh02MtkmXBegsg0klQ/fwDHfpWNe0PYldHB6gCB9XcwW1c6h48Ax/q0rU3ruCYVZ34mmflg==
X-Received: by 2002:a05:600c:358b:: with SMTP id
 p11mr38266417wmq.156.1634482719948; 
 Sun, 17 Oct 2021 07:58:39 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id f184sm9510655wmf.22.2021.10.17.07.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 07:58:39 -0700 (PDT)
Message-ID: <d06193c1-eb84-f27d-cebf-7cde80b3d5ec@redhat.com>
Date: Sun, 17 Oct 2021 16:58:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: gitlab build-edk2 failures
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <95c44864-c316-4396-5863-09e46dfa4671@linaro.org>
 <16cc6428-9a4c-87d0-f092-b7a21f64b0b8@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <16cc6428-9a4c-87d0-f092-b7a21f64b0b8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/16/21 09:27, Paolo Bonzini wrote:
> On 16/10/21 04:04, Richard Henderson wrote:
>> I've seen a lot of failures on this job recently, and they're all
>> timeouts cloning the git submodules.  Would it be better to mirror
>> these to gitlab?
>>
> 
> They're not timeouts, they're issues with edk2's _own_ submodules.
> 
> fatal: unable to access
> 'https://git.cryptomilk.org/projects/cmocka.git/': server certificate
> verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile:
> none
> fatal: clone of 'https://git.cryptomilk.org/projects/cmocka.git' into
> submodule path 'UnitTestFrameworkPkg/Library/CmockaLib/cmocka' failed
> 
> roms/edk2 is already mirrored to gitlab, so we'd have to add mirrors for
> all of these and make edk2.yml configure the mirrors in .git/config.  I
> think the edk2 project should do the mirroring instead...

IIUC QEMU EDK2 scripts don't require cmocka... IMHO (short term) we
should update the 'git submodule update' line in roms/Makefile.edk2
to only update the submodules we require.


