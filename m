Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5BB526779
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:51:45 +0200 (CEST)
Received: from localhost ([::1]:42568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npYW0-0001oK-M1
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1npYMR-0007MC-6F
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:41:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1npYMN-0001gh-SY
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:41:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652460105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MAcgJFN0O3xFylri2fastoQaypyFCvTlf/U9vcsmDbc=;
 b=POS9KoM1a/pEXneW0r/vCdWWRN/Uc+eiuMwcyntzsAq3zfU2WmfTMoweguYbD+9B+qdd8u
 36hK7ohLb5c3DkPWhqpGBHsWYUhCqZePB4klpHzhhOXifp2iznUINPapwQwupVcuLQ/Cyh
 7dwHZwy8TjdvbdqL5fG4l5SKqkRivOg=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-AUifP4zpPNaAmUuqjR2APQ-1; Fri, 13 May 2022 12:41:44 -0400
X-MC-Unique: AUifP4zpPNaAmUuqjR2APQ-1
Received: by mail-io1-f69.google.com with SMTP id
 r17-20020a0566022b9100b00654b99e71dbso5097941iov.3
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 09:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MAcgJFN0O3xFylri2fastoQaypyFCvTlf/U9vcsmDbc=;
 b=DWhUTHIFBKiguQeKWjEgqhiokz+ze48wDtrvyB43aGZJQoVra+3nxw66xuC8MJwWxZ
 pKMX4S6wrMTpfDHce+7JLHCAKbmYgeGHXIXYvlUx6VbE3U+A6ffLdPcvaYIL9TRrTAKf
 tWwHZ2w8YFvQYOsW0OTSM66Yq/ou5rrww5e2YQsMlwRvhWUnomzfV1Spq/STd1ov6Doe
 w30zEWeXs8oA/G2RYoUiFCNWeq//9Tkao+z30IXUbWIftWzQyn3INs7EAssyKaLQF1cy
 wU7JnM2g3v0YumSJRkhj5B5iHqLy97kROQgXP9vKQFYUKdSKkobVcGbPO7fkNW2+WZDr
 sksA==
X-Gm-Message-State: AOAM533JvhtT3ZuVE02bzOo1g7T37MC6RoFR0Lt+PXXXaxvOkRHf8Zlu
 ICcUVyrG9DgelH5gel08PHoC72P8YkjVepeud9NxFxs9izW3DGBAPWcqFJkMAkaid79oSgDvBIE
 tuihNkQ+Fi9/qZdQ=
X-Received: by 2002:a6b:400b:0:b0:64c:77aa:40a6 with SMTP id
 k11-20020a6b400b000000b0064c77aa40a6mr2568349ioa.101.1652460103810; 
 Fri, 13 May 2022 09:41:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8EfnYFWufvE408AHIscCydnMWu4LNa4USo7dpaXTXq0sNG0slUVBJ0ePehzpEoY6PmrJ5og==
X-Received: by 2002:a6b:400b:0:b0:64c:77aa:40a6 with SMTP id
 k11-20020a6b400b000000b0064c77aa40a6mr2568336ioa.101.1652460103529; 
 Fri, 13 May 2022 09:41:43 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 d198-20020a6bb4cf000000b0065a47e16f5asm770143iof.44.2022.05.13.09.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 09:41:42 -0700 (PDT)
Date: Fri, 13 May 2022 12:41:40 -0400
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Cc: wucy11@chinatelecom.cn, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Hildenbrand <david@redhat.com>, f4bug@amsat.org,
 tugy@chinatelecom.cn, dengpc12@chinatelecom.cn,
 yuanmh12@chinatelecom.cn, baiyw2@chinatelecom.cn
Subject: Re: [PATCH v2 2/4] kvm: Dirty ring autoconverge optmization for
 kvm_cpu_synchronize_kick_all
Message-ID: <Yn6KROrT6lKzxQhg@xz-m1.local>
References: <cover.1648091539.git.wucy11@chinatelecom.cn>
 <ee39636fb5d2fc95b90942b13b7a65ed55aa227f.1648091540.git.wucy11@chinatelecom.cn>
 <2f1232c1-6238-94c5-73ec-775b9e428e9c@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f1232c1-6238-94c5-73ec-775b9e428e9c@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, Apr 02, 2022 at 03:22:21PM +0800, Hyman Huang wrote:
> 在 2022/3/28 9:32, wucy11@chinatelecom.cn 写道:
> > @@ -879,7 +862,9 @@ static void kvm_dirty_ring_flush(void)
> >        * First make sure to flush the hardware buffers by kicking all
> >        * vcpus out in a synchronous way.
> >        */
> > -    kvm_cpu_synchronize_kick_all();
> > +    if (!cpu_throttle_get_percentage()) {
> > +        qemu_kvm_cpu_synchronize_kick_all();
> > +    }
> For the code logic itself, kvm_dirty_ring_flush aims to flush all existing
> dirty pages, same as i reviewed in v1's first commit "kvm,memory: Optimize
> dirty page collection for dirty ring", we shouldn't consider the migation
> logic in this path.

I agree with Yong's analysis.  I'm afraid this patch is breaking the api
here.

Say, memory_region_sync_dirty_bitmap() should be the memory api to flush
all dirty memory, we can't simply ignore the flushing just because it's
slow when we're throttling the cpus.  Things will already start to break,
e.g., the dirty rate calculation based on dirty ring relies on all dirty
pages be accounted after the sync() call and this patch will make the
reported value smaller than the reality.  It's not a major deal breaker in
dirty rate measurements but it's just one exmample that we're potentially
breaking the memory api.

AFAIU this is probably another reason why I don't really like the
auto-converge old solution because it's kind of brutal in this case by
putting the thread into a long sleep.

One fix could be that we do periodically sleep in auto-converge code so
that the vcpu threads can still handle any cpu sync requests, though I
didn't really check the cpu code path.

It's also racy in that cpu_throttle_get_percentage() is racy itself:
imagine a case where cpu_throttle_get_percentage() always return >0 _but_
it starts to return 0 when migration_complete() - we'll not call
qemu_kvm_cpu_synchronize_kick_all() even for completion and it can crash
the VM.

-- 
Peter Xu


