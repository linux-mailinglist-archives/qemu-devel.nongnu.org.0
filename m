Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AA5426A70
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 14:09:31 +0200 (CEST)
Received: from localhost ([::1]:33184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYogs-0002BM-5Y
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 08:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYoKc-0007P8-KD
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:46:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYoKW-0007VB-WB
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633693580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lh+diEwAf8U3ReLTasZgr3/j+zvIsi8Y6VYOcH4j0ls=;
 b=fh1w60f55yvNQiFBxh4nMGMyAB0OZB9cCT1g6P3flUpMnTY7LXG2YA2CnQx2qrmi1/NqFN
 VBSrQCqwHophcRpkyfjgxR2BNV5ijJ+6eP4g9aYHbuQNRlBHiHbY6gNuI8GQwtupMBmYV1
 PTNRNM1x6Z72t6YPlDd1E0NxxIVznls=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-V1pIlefOM8SoT8YzAx84Cw-1; Fri, 08 Oct 2021 07:46:19 -0400
X-MC-Unique: V1pIlefOM8SoT8YzAx84Cw-1
Received: by mail-wr1-f72.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso7097226wrg.1
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 04:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Lh+diEwAf8U3ReLTasZgr3/j+zvIsi8Y6VYOcH4j0ls=;
 b=RB7ejCeMplVux+1ukfZKf4IjIBHufdNL4KwL830sXNO07nLm0XcRyb8Fz2HUHV3u5Q
 lSoQ7VqoHJl05v90mcjk/ETtx6FF+/v5P2m/I9JBT9VsEBEBFXRWqjkO3VtDkxWVO20N
 oTU/ojAnNyoMTle6q/JS62tPwgDL7ZhLjVcLocEDY4rXLbAGwBWBffXG0SuAs90sLAIz
 xY39UGAAQuQAe0xKQ+A+rqitPH5yhaAFM7mr2MkrQGAFyKIoQ0EoBknrdIE36mPzpJwx
 tz94LAGjWFUQcT+tPhcg/KBAfZz7hbhFgZk1u2P6xfDOx3W8jbynHrfUo1QbCPVcQv5B
 Kfog==
X-Gm-Message-State: AOAM5318g086Rpty3C90I8I2XVnCSq0QQosB9hd81QwhyWBCvX9Q6JZa
 yErGsviOEGo4pXvDvvNo2ckfuaOXuTfIpCv3I9ry6dkX9EIugJAJhd9IVq1nXtmqMh3Tu3I6O4j
 M0BxRSR7ICM5k0z4=
X-Received: by 2002:a5d:4eca:: with SMTP id s10mr3354524wrv.290.1633693578100; 
 Fri, 08 Oct 2021 04:46:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxen0P/zZgCn2jHENZdGynWMKtpMJlE0YDux4vIqlCdyBrGUI/ELpDzW2sAkC1c700Lwvbrzw==
X-Received: by 2002:a5d:4eca:: with SMTP id s10mr3354491wrv.290.1633693577894; 
 Fri, 08 Oct 2021 04:46:17 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o8sm12665914wme.38.2021.10.08.04.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 04:46:17 -0700 (PDT)
Message-ID: <8c3b3841-1daa-64aa-b2be-8f0e54a96df3@redhat.com>
Date: Fri, 8 Oct 2021 13:46:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 16/23] target/i386/sev: Remove stubs by using code
 elision
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
 <20211007161716.453984-17-philmd@redhat.com> <YV8pS2D8e14qmFBq@work-vm>
 <6080fa16-66aa-570e-93c8-09be2ced9431@redhat.com> <YV8s2r+lNyP/sX7u@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YV8s2r+lNyP/sX7u@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>, kvm@vger.kernel.org,
 Brijesh Singh <brijesh.singh@amd.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/10/21 19:22, Dr. David Alan Gilbert wrote:
> So that I'm fine with, the bit I'm more worried about is the bit where
> inside the if () we call functions (like sev_get_cbit_position )  which
> we know the compiler will elide; I'm sure any sane compiler will,
> but.....
> 
> Looking at your example, in cpu.c there's still places that ifdef around
> areas with tcg_enabled.

I think that's just because nobody tried changing it; it should work 
there as well.

Paolo


