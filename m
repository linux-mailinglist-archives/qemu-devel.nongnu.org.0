Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0D93E13D0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 13:25:32 +0200 (CEST)
Received: from localhost ([::1]:56388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBbVD-0002nz-C4
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 07:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mBbU5-00026n-MH
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 07:24:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mBbU2-00010C-MU
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 07:24:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628162657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nTaJEwoWxrq/djp24i0dg+/UCijfAZ/OwApJBnyVIVQ=;
 b=HiH+UU90beTtRmlEeFU8lBKYw7MqrbYGRzTwAiZxoN8cx+xj9G/V1Y67B40K7N/U5pgq3e
 ZpE/jlHz15/hw6jVMmhFGHT4rhTKI0tkUtqqOzs4RFATlRD/ubIFitDREM3BJ5MZxthmQx
 HxYc+kdsRePJZkGVsGinwHJ9NVgvEh4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-vQ4Z3AuXN-mu8jxL4Hj7GA-1; Thu, 05 Aug 2021 07:24:16 -0400
X-MC-Unique: vQ4Z3AuXN-mu8jxL4Hj7GA-1
Received: by mail-ed1-f71.google.com with SMTP id
 p2-20020a50c9420000b02903a12bbba1ebso2984836edh.6
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 04:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nTaJEwoWxrq/djp24i0dg+/UCijfAZ/OwApJBnyVIVQ=;
 b=tdiFPYrZ3dCTofdVaC2oaMXruno3fv4VgoAoS7ryxJAS2q9Mb/3lJ8ziFRHCmRzIj1
 GwQrlzy65vwWNWPGJ61V89wZtGPh3DSx6LVWymIQc08TeAlEfkCIwqbjQ3GTZ4n8Thb+
 uqxTM65oKig0Dk4dbVuHpbr6y3fvAZojRCKwnLL1WI0mqaJR4QmKAUQjcfWNvOiB0wNh
 JdC15DuBuX7Nh1mNvXqpgzz8/fHYDsRhuDHmzscGeK10jLs7AsECBrUU9Q++dSVrsiW0
 ihql8Rs0m/mQ5x+AS/CB8e5HKm9ulZLfe1XndqgNMJLY4AMt3M5/6cpKr/OtZBScz4/T
 hBkA==
X-Gm-Message-State: AOAM532d91rn34AGfnt8kFQYHRd6rY0X20+/nV4w/2mEJu94Pxllyeyw
 SLFVuUgaIAz5EzRSdJOeCI/X7KG5dD6Sccs7bUd5ephe4ILTWHAP62XrtaFZfjmWBS3A9U2ZnDf
 haCighFcZLeNC4jrAJ6K3KKRbATMePLGAFcLPthvEgnz5ojx49fN8tZNbejV+rlbP7W4=
X-Received: by 2002:a17:906:840f:: with SMTP id
 n15mr4399515ejx.334.1628162654548; 
 Thu, 05 Aug 2021 04:24:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3b57oA58wlEx2gu4fLmBTBIDB7N15yRCVNrMJE+gPCagJ1+cF7snyzfAWoSX/jzN4UvYILw==
X-Received: by 2002:a17:906:840f:: with SMTP id
 n15mr4399500ejx.334.1628162654276; 
 Thu, 05 Aug 2021 04:24:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s8sm2163908edy.18.2021.08.05.04.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 04:24:13 -0700 (PDT)
Subject: Re: [Bug] x86 EFLAGS refresh is not happening correctly
To: Stevie Lavern <stevie.lavern@gmail.com>, qemu-devel@nongnu.org
References: <CADV2EAvr0Sb55TE=uffkb4Z17ZHNBCZGLm0nA94qKZrx1WM35A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0d982751-7dfe-9a45-df5b-fbe57d36ccef@redhat.com>
Date: Thu, 5 Aug 2021 13:24:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CADV2EAvr0Sb55TE=uffkb4Z17ZHNBCZGLm0nA94qKZrx1WM35A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 05/08/21 11:51, Stevie Lavern wrote:
> 
> Shouldn't it be:
> eflags = cpu_cc_compute_all(env, CC_OP) | (env->df & DF_MASK);
> as eflags is entirely reevaluated by "cpu_cc_compute_all" ?

No, both are wrong.  env->eflags contains flags other than the 
arithmetic flags (OF/SF/ZF/AF/PF/CF) and those have to be preserved.

The right code is in helper_read_eflags.  You can move it into 
cpu_compute_eflags, and make helper_read_eflags use it.

Paolo


