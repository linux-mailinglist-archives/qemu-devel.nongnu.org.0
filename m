Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AFD3D2BA3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 20:01:34 +0200 (CEST)
Received: from localhost ([::1]:56834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6d0n-0000wS-HB
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 14:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6ct6-0007VT-Hy
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6ct2-0002d4-O1
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=goPIQXYK/DFw8OEXLsDnPAwSK6aFUoV5iM0rGEZcve4=;
 b=ca9Ny6T2KZxzxjqYJD4usT9fOH4SGu+GDx7YOAXGPto1foTY/EF5d0d0Lrd/mxaLh195Gn
 rBthDY8FbLNPzQbOFLMaqLjRJm/RYIZwevYberZR6991dLqqsAnIfPjS7pkXeWzQNnit2X
 XtrGIZjGzrT2lM6syYTMVJwk/NOAZyc=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-KgUF7QdyPSm5NquIikjLiA-1; Thu, 22 Jul 2021 13:53:29 -0400
X-MC-Unique: KgUF7QdyPSm5NquIikjLiA-1
Received: by mail-ot1-f71.google.com with SMTP id
 c12-20020a056830348cb02904d078cdc9abso4138429otu.23
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=goPIQXYK/DFw8OEXLsDnPAwSK6aFUoV5iM0rGEZcve4=;
 b=OKvskXrKqHX1T4dkRXSJfBCwNC8vzsrpAMRqviQnVcDp887j+wGXQ+vCAYpXVTjvdR
 Yih/F+AdDZiB5iuFdpoh/ezCMgtnrCCW1maJIz9c1r/cY97HxbNYUDN3u5eFpAzkfJU3
 wg1MrNYGD9mjDD5dGiNuz8SCMALLsmNBIXpgNEKDR1vsZthAZYvXQC1/XyngrX+2gh7B
 M2pWP6HU7bNd4umf9RwRe8ACgo6wEK5+Yx223iFaDodpIJiavu2SHM8ABTudHyjHcy/v
 AccxyjKt0WM8x0hHzbsvoawZN+PqKXiNGD9VjPLD1AIzMkkHLS6lN6DIhZz+Ay+S4z8e
 tAsA==
X-Gm-Message-State: AOAM532nZ6v17PSCyDuPm7IOr/cvAfPawJBnY7fPXxjK/OQUHkeUEA+1
 ctiA1G5ZyRjvcz7mFN2xagahboB1z0HfnXA0ZTD2ddm32KXBs6Acigl6KvGzPRWJFCRooNo9GZi
 HEaely8CoOZqHU+U=
X-Received: by 2002:a9d:c67:: with SMTP id 94mr638271otr.344.1626976408269;
 Thu, 22 Jul 2021 10:53:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0/4rDUJ5QsQwh5b/vrnNR7o/qqhiIVkiRUlwu1yZ7R+x1acnO6FfIOQlFiEg38eNqdDaXEw==
X-Received: by 2002:a9d:c67:: with SMTP id 94mr638259otr.344.1626976408044;
 Thu, 22 Jul 2021 10:53:28 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-176.ks.ok.cox.net. [68.102.25.176])
 by smtp.gmail.com with ESMTPSA id q13sm4996825oov.6.2021.07.22.10.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 10:53:27 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [RFC PATCH v2 06/44] hw/i386: Introduce kvm-type for TDX guest
To: isaku.yamahata@gmail.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 alistair@alistair23.me, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, cohuck@redhat.com, mtosatti@redhat.com,
 xiaoyao.li@intel.com, seanjc@google.com, erdemaktas@google.com
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <04c08d0770736cfa2e3148489602bc42492c78f3.1625704980.git.isaku.yamahata@intel.com>
Message-ID: <9ae8bb84-7e6b-28d2-b240-7c07d14f6f50@redhat.com>
Date: Thu, 22 Jul 2021 12:53:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <04c08d0770736cfa2e3148489602bc42492c78f3.1625704980.git.isaku.yamahata@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 7:54 PM, isaku.yamahata@gmail.com wrote:
> From: Xiaoyao Li <xiaoyao.li@intel.com>
> 
> Introduce a machine property, kvm-type, to allow the user to create a
> Trusted Domain eXtensions (TDX) VM, a.k.a. a Trusted Domain (TD), e.g.:
> 
>   # $QEMU \
> 	-machine ...,kvm-type=tdx \
> 	...
> 
> Only two types are supported: "legacy" and "tdx", with "legacy" being
> the default.
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Co-developed-by: Sean Christopherson <sean.j.christopherson@intel.com>
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>

I am not a QEMU command line expert, so my mental model of this may be
wrong, but:

This seems to have a very broad scope on the command line and I
am wondering if it's possible to associate it with a TDX command
line object specifically to narrow its scope.

I.e., is it possible to express this on the command line when
launching something that is _not_ meant to be powered by TDX,
such as an SEV guest? If it doesn't make sense to express that
command line argument in a situation like that, perhaps it could
be constrained only to the TDX-specific commandline objects.


