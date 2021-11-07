Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7A7447298
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 11:54:39 +0100 (CET)
Received: from localhost ([::1]:42920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjfor-0003bl-Qb
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 05:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mjfo2-0002vp-Ep
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 05:53:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mjfny-0005s1-DZ
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 05:53:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636282420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KduvtXb+fKziR3SatNVMCMUC1urqWHpoLYZZABDYaYs=;
 b=YUh8JIvJj0dJffp1R+uzaXoqSxeoWOP+E8LPz4eP2G7/WpFMfmOlupkFCXhnODv/a76p2q
 wz7Y9bgeEwibEsLfKxly3knz3I3ba5oTLo9Oo+dwMG28tlDH/hwqBJNaVGN733DpwBaTrl
 8wEESXwmwKxLp3IF9jG3zw9k5fopuHc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-sYTG3kJfPwCyg-FeK2qOew-1; Sun, 07 Nov 2021 05:53:37 -0500
X-MC-Unique: sYTG3kJfPwCyg-FeK2qOew-1
Received: by mail-wm1-f69.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso8750541wme.5
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 02:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=KduvtXb+fKziR3SatNVMCMUC1urqWHpoLYZZABDYaYs=;
 b=uwSOl3zwGd4kSaIWdNGoV0r+Wd74kSw6X8rnwPrD1A0TF8IZYGUnJYLctkWNjfdMm+
 W8ZPOIRTxLvXrqfjW9tMaTpz6fyQpfEidep/IqFI4ZGcQGAD0gOB9r1gEvXNnDrqv44U
 YqkCO1RQ5oIcbg0ms1kCv8gbdAZRnqbePdnSNBOMKfLNx6gNieeQVIlWjwKkWPpbFPGi
 mg3wffkKX75/LsOjAMFVeJ4naej59rWjjLr4kKHmmv94GD8CS5B6SsGFHH60MZ4cHesg
 Hy0phCmFjGRdJJKMITOcdlbAy8TMTC1tSpETJ8oaceSLFgRAmNqoeQYeXdclwD01luXM
 UcZg==
X-Gm-Message-State: AOAM533gqZZ90qTM8VIesU1DuzoIhmJVqy9J64q61oOVj1xFy/uPSQQZ
 40d4v3dL9j+0HlTJhTFe19fslaZ1V7qYkKI9umq1BOXw8YAK7mZC8TuO9/IWFb+1SBxBrdxlQiR
 ve48MqN409/ihaWc=
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr92980047wrr.11.1636282416131; 
 Sun, 07 Nov 2021 02:53:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsfVHowFIVVIa9m/d8WdUd/IzGs4m4KlW24FzqjhCQS6jtAQo0HhLCIkup0A9/ySoDDeBmWg==
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr92980019wrr.11.1636282415887; 
 Sun, 07 Nov 2021 02:53:35 -0800 (PST)
Received: from ?IPV6:2003:d8:2f0c:a000:3f25:9662:b5cf:73f9?
 (p200300d82f0ca0003f259662b5cf73f9.dip0.t-ipconnect.de.
 [2003:d8:2f0c:a000:3f25:9662:b5cf:73f9])
 by smtp.gmail.com with ESMTPSA id z11sm12993555wrt.58.2021.11.07.02.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 02:53:35 -0800 (PST)
Message-ID: <41f72294-b449-2a42-d8b8-cf3de9314066@redhat.com>
Date: Sun, 7 Nov 2021 11:53:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20211027124531.57561-1-david@redhat.com>
 <20211101181352-mutt-send-email-mst@kernel.org>
 <a5c94705-b66d-1b19-1c1f-52e99d9dacce@redhat.com>
 <20211102072843-mutt-send-email-mst@kernel.org>
 <171c8ed0-d55e-77ef-963b-6d836729ef4b@redhat.com>
 <20211102111228-mutt-send-email-mst@kernel.org>
 <e4b63a74-57ad-551c-0046-97a02eb798e5@redhat.com>
 <20211107031316-mutt-send-email-mst@kernel.org>
 <f6071d5f-d100-a128-9f66-a801436aa78a@redhat.com>
 <20211107051832-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 00/12] virtio-mem: Expose device memory via multiple
 memslots
In-Reply-To: <20211107051832-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.039, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Hui Zhu <teawater@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.11.21 11:21, Michael S. Tsirkin wrote:
> On Sun, Nov 07, 2021 at 10:21:33AM +0100, David Hildenbrand wrote:
>> Let's not focus on b), a) is the primary goal of this series:
>>
>> "
>> a) Reduce the metadata overhead, including bitmap sizes inside KVM but
>> also inside QEMU KVM code where possible.
>> "
>>
>> Because:
>>
>> "
>> For example, when starting a VM with a 1 TiB virtio-mem device that only
>> exposes little device memory (e.g., 1 GiB) towards the VM initialliy,
>> in order to hotplug more memory later, we waste a lot of memory on
>> metadata for KVM memory slots (> 2 GiB!) and accompanied bitmaps.
>> "
>>
>> Partially tackling b) is just a nice side effect of this series. In the
>> long term, we'll want userfaultfd-based protection, and I'll do a
>> performance evaluation then, how userfaultf vs. !userfaultfd compares
>> (boot time, run time, THP consumption).
>>
>> I'll adjust the cover letter for the next version to make this clearer.
> 
> So given this is short-term, and long term we'll use uffd possibly with
> some extension (a syscall to populate 1G in one go?) isn't there some
> way to hide this from management? It's a one way street: once we get
> management involved in playing with memory slots we no longer can go
> back and control them ourselves. Not to mention it's a lot of
> complexity to push out to management.

For b) userfaultfd + optimizatons is the way to go long term.
For a) userfaultfd does not help in any way, and that's what I currently
care about most.

1) For the management layer it will be as simple as providing a
"memslots" parameter to the user. I don't expect management to do manual
memslot detection+calculation -- management layer is the wrong place
because it has limited insight. Either QEMU will do it automatically or
the user will do it manually. For QEMU to do it reliably, we'll have to
teach the management layer to specify any vhost* devices before
virtio-mem* devices on the QEMU cmdline -- that is the only real
complexity I see.

2) "control them ourselves" will essentially be enabled via "memslots=0"
(auto-detect mode". The user has to opt in.

"memslots" is a pure optimization mechanism. While I'd love to hide this
complexity from user space and always use the auto-detect mode,
especially hotplug of vhost devices is a real problem and requires users
to opt-in.

I assume once we have "memslots=0" (auto-detect) mode, most people will:
* Set "memslots=0" to enable the optimization and essentially let QEMU
  control it. Will work in most cases and we can document perfectly
  where it won't. We'll always fail gracefully.
* Leave "memslots=1" if they don't care about the optimization or run a
  problematic setup.
* Set "memslots=X if they run a problemantic setup in still care about
  the optimization.


To be precise, we could have a "memslots-optimiation=true|false" toggle
instead. IMHO that could be limiting for these corner case setups where
auto-detection is problematic and users still want to optimize --
especially eventually hotplugging vhost devices. But as I assume
99.9999% of all setups will enable auto-detect mode, I don't have a
strong opinion.

-- 
Thanks,

David / dhildenb


