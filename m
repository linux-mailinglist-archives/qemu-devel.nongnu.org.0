Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD6741C7D4
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 17:06:47 +0200 (CEST)
Received: from localhost ([::1]:47492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVbAT-0005GD-UW
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 11:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVb7B-0002ak-Os
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:03:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVb78-00072y-0D
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632927795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u4OgBLzP5P0di3pXlRpyDGbuVDN3bUXQg0FLjsfGDZc=;
 b=G8N7toax8aOYDmpmRIfOeyNl3D6kwxhHBB/C9dRUGrMHu2SVNhc8FuVzqlfciyNX/BOCi5
 D6Vb3ntvZlvAMzYDrrJjHnlTBaCGNhhC1XLT95QFUYUgqzDsJqpOVueL0sbIgLDqCpcl6i
 MtlnGAcXmRMQyNHTPB9AU3TkiXNOXkY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-1hu-xnGDMJSGx9dPiFD8YQ-1; Wed, 29 Sep 2021 11:03:13 -0400
X-MC-Unique: 1hu-xnGDMJSGx9dPiFD8YQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 r11-20020aa7cfcb000000b003d4fbd652b9so2703358edy.14
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 08:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u4OgBLzP5P0di3pXlRpyDGbuVDN3bUXQg0FLjsfGDZc=;
 b=LIg0+13TZwip8KoEoH9HNjGpIv/fZ3H01k9AUDvUWTBYY2d4SB0d9Ojk1qxtNYUClz
 DTUY4wKIzW+e0MbYGm3TLaIxeZS+N2r9/OyuRFLVvkPYQD2zPeFTVXtqa5PQDjEBk6/Q
 XIxLtcil/by/HywoTXLUTcURYRlwxbs/1PW+2e6+dIDUwx6/3F0tEQXYKsMQbBZRF9sD
 bZFxNeVHKP63z6EvaXcGYEsT+mi2xFtDcxInx4DTzA007W6K+kYgRCqQzpsmDS1vTKiH
 HhZDAXgk9qxUAuGGTUuMa9b4Gd8Qiv31kG/2NuW1cGjQIQSPjQaGCqSIrirJhDyyDtCN
 hgJQ==
X-Gm-Message-State: AOAM531ZmxHywflvkB9aRH0GsdLrEqp9BqTCLT7IB1A/U3TSCVOXWpvV
 Ke60PUYuBOZL8veqqsGOW0MTRG/GERiCCB03jsVMegzns5yL+LUJk7q2Yq3HBw6VNA+nIBOps3q
 Vm7lWkog9weGPAj8=
X-Received: by 2002:a17:906:64a:: with SMTP id t10mr203075ejb.5.1632927791258; 
 Wed, 29 Sep 2021 08:03:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+8IBYumanreTh7YZKPwTuvVLRFCEV4xYux6dR+vpiBe4nM5+y32NMPaiyzuSJf6uqEp10kw==
X-Received: by 2002:a17:906:64a:: with SMTP id t10mr202966ejb.5.1632927790049; 
 Wed, 29 Sep 2021 08:03:10 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 5sm69389ejy.53.2021.09.29.08.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 08:03:09 -0700 (PDT)
Message-ID: <9ba3ebe2-4d74-628f-fb76-5541f629ff9e@redhat.com>
Date: Wed, 29 Sep 2021 17:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 00/20] NBD patches through 2021-09-27
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210927215545.3930309-1-eblake@redhat.com>
 <CAFEAcA9P_xzSce_3bVKO95HOdhbf1aqVJ-eiXOkJ09Hj4ow+bg@mail.gmail.com>
 <97e67c45-21f9-2630-7173-991d01871116@redhat.com>
 <CAFXwXrnZzyUBSikVr6uFLHQeD5hWcXDq+eG=uwBC5xQ8FVivmg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFXwXrnZzyUBSikVr6uFLHQeD5hWcXDq+eG=uwBC5xQ8FVivmg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.03, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/09/21 15:58, Richard Henderson wrote:
> 
>      > /usr/bin/ld: /usr/lib64/libselinux.so: error adding symbols: file in
>      > wrong format
>      > collect2: error: ld returned 1 exit status
> 
>     Missing libselinux-devel.i686 in
>     tests/docker/dockerfiles/fedora-i386-cross.docker, I think?
> 
> But additionally, incorrect package probing, I think.

Probably Meson deciding to look at --print-search-dirs and crossing 
fingers.  But -m32 and other multilib flags should be added to 
config-meson.cross rather than QEMU_CFLAGS.

Paolo


