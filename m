Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DEF526878
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 19:28:22 +0200 (CEST)
Received: from localhost ([::1]:52246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZ5Q-0005y0-Kp
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 13:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1npZ40-0005GO-42
 for qemu-devel@nongnu.org; Fri, 13 May 2022 13:26:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1npZ3w-0000wU-NT
 for qemu-devel@nongnu.org; Fri, 13 May 2022 13:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652462807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pBn8xtxAghAP8lHbko5CnzD+aTXgbHQNBXPudXoqZM4=;
 b=aUV8l9Q+PuDNqXFmmsPFz8J/R6GlDcW922XUJGzO0JT9O0HWGEiboDEVmAJQeA4yNC7Bch
 S4uGTYABhecw74DcGbnlzj2CJAVm5v5I5hI2QbKuHD61fKJwo/nz/knGZdFv5tpz6NIOPN
 DI54jUb4i93WlwTZWmHi1Uj+gRbgiIs=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-KexoGq-jNd2hTbvc90kiDg-1; Fri, 13 May 2022 13:25:35 -0400
X-MC-Unique: KexoGq-jNd2hTbvc90kiDg-1
Received: by mail-il1-f200.google.com with SMTP id
 e3-20020a056e020b2300b002d10200d90fso760551ilu.2
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 10:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pBn8xtxAghAP8lHbko5CnzD+aTXgbHQNBXPudXoqZM4=;
 b=E36eHUJHBAXHDrL6CxBs2z8Vt8SXXyEYhKbsWVqHNRxtsQsc0nPcEUexj0pyV6gaLh
 7fawWelOTz/FWN5N9QnxbTUqfVjuHnWXi43JBnrCe6xGQD2nNZUcSIoE9aoxwAprL0/c
 bYBsIegWAbzpDBBQvK3HkwEy2MUHLYB1cPMjTkxxmAKGtijIDExfNxjtItw42G4FoiQc
 b+wYXcKrPJF70dwSd+FuwfBQT0PYNuSeiUBzxKcAJxsjfS74fr3XYkc6T+5fTLeTKTUA
 8xc9G0yxiJ6Yy0i1J8ELuGxNjdx+tc1Q4ryhEvbx+B7ENdXRGzNQBP5UUMTvAKagfYgr
 kq+A==
X-Gm-Message-State: AOAM532t95MPT/spa4wCgRXXFxSJ/TIYugSShPWDt6giqrHn5LOVr+iv
 zDlnCAXwA4U/J/sxAXSI56W84jmkv98UrE3Ip7EnRsjotNnQlyiBAXni2BphNZhqjcDyoJiasUT
 3KFxkSx7EFZdEn1U=
X-Received: by 2002:a05:6638:25c1:b0:32b:897f:1cfa with SMTP id
 u1-20020a05663825c100b0032b897f1cfamr3167258jat.70.1652462734361; 
 Fri, 13 May 2022 10:25:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGnYZgoT/Dy1Q59FlZAuCvsenT6suOSwQHUQPa17dZQQVNyrnjlj4JgEE+GCZQAFnrNpgJ9g==
X-Received: by 2002:a05:6638:25c1:b0:32b:897f:1cfa with SMTP id
 u1-20020a05663825c100b0032b897f1cfamr3167209jat.70.1652462733376; 
 Fri, 13 May 2022 10:25:33 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a02b609000000b0032dee7810cbsm814104jam.45.2022.05.13.10.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 10:25:32 -0700 (PDT)
Date: Fri, 13 May 2022 13:25:31 -0400
From: Peter Xu <peterx@redhat.com>
To: Chongyun Wu <wucy11@chinatelecom.cn>
Cc: Hyman Huang <huangy81@chinatelecom.cn>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 tugy@chinatelecom.cn, dengpc12@chinatelecom.cn,
 yuanmh12@chinatelecom.cn, baiyw2@chinatelecom.cn
Subject: Re: [PATCH v2 3/4] kvm: Introduce a dirty rate calculation method
 based on dirty ring
Message-ID: <Yn6Ui9ZAWFRwk11U@xz-m1.local>
References: <cover.1648091539.git.wucy11@chinatelecom.cn>
 <046226dadeccb0f66709c915098d7f15ab534353.1648091540.git.wucy11@chinatelecom.cn>
 <a58111a4-5674-7d47-5f7d-a29a444e36c6@chinatelecom.cn>
 <bc185240-6711-893b-6755-127e4410613d@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc185240-6711-893b-6755-127e4410613d@chinatelecom.cn>
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

On Sat, Apr 02, 2022 at 04:59:24PM +0800, Chongyun Wu wrote:
> 
> on 4/2/2022 3:28 PM, Hyman Huang wrote:
> > 
> > 
> > 在 2022/3/28 9:32, wucy11@chinatelecom.cn 写道:
> > > From: Chongyun Wu <wucy11@chinatelecom.cn>
> > > 
> > > A new structure KVMDirtyRingDirtyCounter is introduced in
> > > KVMDirtyRingReaper to record the number of dirty pages
> > > within a period of time.
> > > 
> > > When kvm_dirty_ring_mark_page collects dirty pages, if it
> > > finds that the current dirty pages are not duplicates, it
> > > increases the dirty_pages_period count.
> > > 
> > > Divide the dirty_pages_period count by the interval to get
> > > the dirty page rate for this period.
> > > 
> > > And use dirty_pages_period_peak_rate to count the highest
> > > dirty page rate, to solve the problem that the dirty page
> > > collection rate may change greatly during a period of time,
> > > resulting in a large change in the dirty page rate.
> > > 
> > > Through sufficient testing, it is found that the dirty rate
> > > calculated after kvm_dirty_ring_flush usually matches the actual
> > > pressure, and the dirty rate counted per second may change in the
> > > subsequent seconds, so record the peak dirty rate as the real
> > > dirty pages rate.
> > > 
> > > This dirty pages rate is mainly used as the subsequent autoconverge
> > > calculation speed limit throttle.
> > As Peter's advice, i think the better way is exporting or adapting the
> > existing implemenation of dirty page rate calculation instead of
> > building different blocks.
> Yes,that right. But this is a little different.
> Qemu currently already has a variety of dirty page rate calculation methods,
> which are used in different scenarios. This method is mainly to calculate
> the appropriate speed limit threshold in the process of hot migration of the
> dirty ring. It is realized by making full use of the characteristics of the
> dirty ring, that is, statistics are performed when collecting dirty pages,
> which cannot be achieved by the old bitmap method, and it will not add too
> much extra overhead, such as starting new threads, etc. There is no need to
> input parameters such as a suitable sampling period, etc., which is simple
> and convenient. Through the test, the pressure of the actual stress added
> can be relatively accurately calculated.

Please see commit 7786ae40ba4e7d5b9 and we've already have per-vcpu data.
If we want a per-vm data we'd want to do that there too together within
kvm_dirty_ring_reap_one().

Regarding "make best use of dirty ring": it's per-vcpu already and actually
when I thought about optimizing auto-converge why not start using per-vcpu
data to do per-vcpu throttling already?  I'm lost on why it goes back to a
per-vm approach?

I'm also curious what will this be compared to Yong's dirty limit approach?
Dirty limit allows setting dirty rate upon all vcpus in one shot.  From
design-wise, that does sound to be superior.. not only because it's
per-vcpu, but also because it's not sleep()ing but trapping only writes in
the vmexit with small intervals.  Would you have time to compare these two
solutions?

I fully trust and appreciate your test results and I believe it performs
better than the old auto converge, it's just that we can't merge solution A
& B if they all look similar and solving the same problem, even if both
will work better.  We need to choose a way to go at last.

Thanks,

-- 
Peter Xu


