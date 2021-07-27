Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCF13D753C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 14:42:50 +0200 (CEST)
Received: from localhost ([::1]:49662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8MQ5-0007yl-2E
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 08:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8MOl-0007IQ-F8
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 08:41:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8MOh-00013T-AQ
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 08:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627389681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jN/U5RJZn89IqmlyiRatgKzRTdphbvGYzPdReCcVsXM=;
 b=ICycgWWnmOIAl+nqmsAR4LdlGpv7s2mLbYZ9MQnl2XUu/iVLgE+U2+eSsyyLSJwn2797Xw
 3B14HhQIzY6jkMfRFc6170ZSP9B0MD0FCzZW4RWyIzucEsEkx59Dvcwde9LcLWbwkmWBBC
 oqvrhB80SJVrd0FFbwtXI7QrZrDAxtM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115--_g8YxW7MSOf_9la0ehSfQ-1; Tue, 27 Jul 2021 08:41:19 -0400
X-MC-Unique: -_g8YxW7MSOf_9la0ehSfQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 o4-20020a05600c5104b029024b7cd56259so463453wms.1
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 05:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=jN/U5RJZn89IqmlyiRatgKzRTdphbvGYzPdReCcVsXM=;
 b=Few/3ZbCZegI0bfRsrH84U3z43eKdEaFWbJnVolamXMV77JiqmJ5p1ejPxv6BxVpLe
 1tdrYLqPpc/uTd+lChYVoTRk5yLBoGzfYNTQE2ebGdG89OFEw1gxee2dIgqC/k6VHqVh
 UNOkCoAaJoOpwerZHCDUwk8MYQjuIgxU5+sSPJV5dRS6Szg3LvWbAm44tL6VwBrjSewf
 oV39VCSCrbYEiJAbmzLvnpH5ZyxROj7niMQ2ISyz5G/ZTWt89U8ZPpfgz4JtLtaqyS9D
 Q7kZ3W1qHM/2qZT61LBUQiPvhfJZMKco/+m7yaYuAAxE6zt28lXiZiHTtHT8BZFmBp62
 8DLA==
X-Gm-Message-State: AOAM531ZZe86cWf8Sar/2/pBR9omOiBLaW/N7Cuc3jIV7j2/9tfvS1JD
 Ic4RHn9Mg+G2dOYGhO2JH3cJ8IV/k5meLWAda8GhuWvL0oEvAnfk0zf38mrWwoo7/6LiON4RzJf
 Exws+GaRWFDm8oPk=
X-Received: by 2002:a05:600c:144a:: with SMTP id
 h10mr15557612wmi.57.1627389678426; 
 Tue, 27 Jul 2021 05:41:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmQvuew9xY0l6JpuFdI1rrURlFptQU+hNMvBBbNPLv385fYxgYEybVQNAVo+C30HkBXyGxgQ==
X-Received: by 2002:a05:600c:144a:: with SMTP id
 h10mr15557583wmi.57.1627389678199; 
 Tue, 27 Jul 2021 05:41:18 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c36.dip0.t-ipconnect.de. [79.242.60.54])
 by smtp.gmail.com with ESMTPSA id
 y19sm2606311wma.21.2021.07.27.05.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 05:41:17 -0700 (PDT)
Subject: Re: [PATCH v2 0/9] memory: Sanity checks memory transaction when
 releasing BQL
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210723193444.133412-1-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <7f056d75-51a1-17a8-e946-1aeccb3e1308@redhat.com>
Date: Tue, 27 Jul 2021 14:41:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723193444.133412-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.07.21 21:34, Peter Xu wrote:
> This is v2 of the series.  It was actually got forgotten for months until it
> was used to identify another potential issue of bql usage here (besides it
> could still be helpful when debugging a previous kvm dirty ring issue in that
> series):
> 
> https://lore.kernel.org/qemu-devel/CH0PR02MB7898BBD73D0F3F7D5003BB178BE19@CH0PR02MB7898.namprd02.prod.outlook.com/
> 
> So I figured maybe it's still worth to have it, hence a repost.
> 
> There're some changes against v1:
> 
>    - patch "cpus: Introduce qemu_cond_timedwait_iothread()" is dropped because
>      it's introduced in another commit already (b0c3cf9407e64).
> 
>    - two more patches to move do_run_on_cpu() into softmmu/ to fix a linux-user
>      compliation issue.
> 
> Please review, thanks.
> 
> === Original Cover letter ===
> 
> This is a continuous work of previous discussion on memory transactions [1].
> It should be helpful to fail QEMU far earlier if there's misuse of BQL against
> the QEMU memory model.
> 
> One example is run_on_cpu() during memory commit.  That'll work previously, but
> it'll fail with very strange errors (like KVM ioctl failure due to memslot
> already existed, and it's not guaranteed to trigger constantly).  Now it'll
> directly fail when run_on_cpu() is called.
> 

Functions that silently drop the BQL are really nasty. I once fall into 
a similar trap calling pause_all_vcpus() from within 
memory_region_transaction_begin(), while resizing RAM blocks.


-- 
Thanks,

David / dhildenb


