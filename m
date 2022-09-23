Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926165E825D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 21:07:38 +0200 (CEST)
Received: from localhost ([::1]:43210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obo1R-0003cY-D3
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 15:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obntt-000531-BP
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:59:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obntr-0003Vw-Dh
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663959586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jkp9uIojDcvTz1WAjdwqm+62cYEBiOSYUQ5dsx6Xy3c=;
 b=XPhuzPbKLWwRy6Ul7iyMPJSmqzftxDTe0lTJE2W87AgZVPr3fBwk9rYg8YyGFLup/ZOoFI
 2n9HVQ5wzPqT+NZ+spDBfE4DcSHJewHSGKGgtP80bSwIwRP31YIBZGbo8a+HI1l+P0UQVF
 2JZ8ajlZyuBRJXpId0FdTElIIXUWeq8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-286-DkAxxuODMmGXZJd1bvTrMA-1; Fri, 23 Sep 2022 14:59:45 -0400
X-MC-Unique: DkAxxuODMmGXZJd1bvTrMA-1
Received: by mail-wr1-f71.google.com with SMTP id
 e18-20020adfa452000000b00228a420c389so202995wra.16
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 11:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=jkp9uIojDcvTz1WAjdwqm+62cYEBiOSYUQ5dsx6Xy3c=;
 b=Lk2Aib38LZmwo5Fp2R7gEVsSNP6vkYmJ1tyjxCSqTRKGdzzqYyBqVszXnkWIt4OK+3
 VQ6xtq50EZwkKh1AxosTuD4gwnXVbDBxN5MP0c1E7WAhvxbnsagQenqfGWG1G/1+3CSL
 0vnnoKE3NBVQxMxDZAL3KQfiUdbdrkDXYjeqFs91Zhfs8HY0OwRe5Xy2HYZeMpNjMSE1
 WORIDlvkVAJIM8eqJB8G4v1irzgwk6siUpeRWWcoSNlaRzXdyKIhcirX2a+Gzmy57N1l
 BNozUGXwMuExBBQ9adZ22vp2INFYybu0MOD3idCBkzM10WrY1wnJZKfRUZV28pUDjlPB
 /jag==
X-Gm-Message-State: ACrzQf2HqwzcH98pbfLVWn0kEJDMLoqYgP/nOpZvT48JaYdm25Afo/xk
 wWW9HOjRgckWGEe/g1/3YyFisWY8zNFna5u1HUTZushUTLT0jceD+eZDA1uw88MsVOCwyPpZhYe
 qSqPiFStOAoHOrko=
X-Received: by 2002:a5d:550c:0:b0:22b:1942:4bf6 with SMTP id
 b12-20020a5d550c000000b0022b19424bf6mr5901936wrv.520.1663959583274; 
 Fri, 23 Sep 2022 11:59:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4CXt1Gmz2l63VsV0kLrMAmo+b3zf+Ph2eH6nv8EPj6XWnMUJUXHIU039mANC4WKldL8KEvYQ==
X-Received: by 2002:a5d:550c:0:b0:22b:1942:4bf6 with SMTP id
 b12-20020a5d550c000000b0022b19424bf6mr5901917wrv.520.1663959583071; 
 Fri, 23 Sep 2022 11:59:43 -0700 (PDT)
Received: from [192.168.8.103] (tmo-097-189.customers.d1-online.com.
 [80.187.97.189]) by smtp.gmail.com with ESMTPSA id
 g16-20020adfe410000000b0022ac13aa98fsm7849175wrm.97.2022.09.23.11.59.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 11:59:42 -0700 (PDT)
Message-ID: <c783fe07-4f4c-a52b-0445-0a4df057ffa6@redhat.com>
Date: Fri, 23 Sep 2022 20:59:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8 0/8] s390x/pci: zPCI interpretation support
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 farman@linux.ibm.com, pmorel@linux.ibm.com, richard.henderson@linaro.org,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 mst@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <20220902172737.170349-1-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220902172737.170349-1-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 02/09/2022 19.27, Matthew Rosato wrote:
> Now that the kernel series [1] is merged and the freeze is over, here is a
> refresh of the zPCI interpretation series.
>                                                             
> For QEMU, the majority of the work in enabling instruction interpretation
> is handled via SHM bit settings (to indicate to firmware whether or not
> interpretive execution facilities are to be used) + a new KVM ioctl is
> used to setup firmware-interpreted forwarding of Adapter Event
> Notifications.
> 
> This series also adds a new, optional 'interpret' parameter to zpci which
> can be used to disable interpretation support (interpret=off) as well as
> an 'forwarding_assist' parameter to determine whether or not the firmware
> assist will be used for adapter event delivery (default when
> interpretation is in use) or whether the host will be responsible for
> delivering all adapter event notifications (forwarding_assist=off).
> 
> The zpcii-disable machine property is added to allow disabling use of
> zPCI interpretation facilities for a guest. This property is set to on
> for older (pre-7.2 compat machines), but defaults to off for 7.2 and
> newer. This allows newer machines to use interpretation by default if
> the necessary kernel interfaces and hardware facilities are available,
> but also provides a mechanism for disabling interpretation completely
> for debug purposes.
> 
> As a consequence of implementing zPCI interpretation, ISM devices now
> become eligible for passthrough (but only when zPCI interpretation is
> available).
> 
>  From the perspective of guest configuration, you passthrough zPCI devices
> in the same manner as before, with intepretation support being used by
> default if available in kernel+qemu.
> 
> Changelog v7->v8:
> - Rebase onto 7.1.0
> - Move compat machine changes for patch 8
> - Refresh kernel header sync to 6.0-rc3
> 
> [1] https://lore.kernel.org/kvm/20220606203325.110625-1-mjrosato@linux.ibm.com/
> 
> Matthew Rosato (8):
>    linux-headers: update to 6.0-rc3
>    s390x/pci: add routine to get host function handle from CLP info
>    s390x/pci: enable for load/store intepretation

Typo in that subject, should be "interpretation" instead of "intepretation".

>    s390x/pci: don't fence interpreted devices without MSI-X
>    s390x/pci: enable adapter event notification for interpreted devices
>    s390x/pci: let intercept devices have separate PCI groups
>    s390x/pci: reflect proper maxstbl for groups of interpreted devices
>    s390x/s390-virtio-ccw: add zpcii-disable machine property

Thanks, patch series looks basically fine to me now. Some nits here and 
there, so if you could still fix those up and send a v9, that would be 
great! (If you are completely out of spare time for that, let me know, then 
I can also try to fix those up on my own when picking up the patches)

  Thomas


