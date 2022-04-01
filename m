Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913184EEDF7
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:18:57 +0200 (CEST)
Received: from localhost ([::1]:42904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHB2-0002nb-Mi
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:18:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1naH6H-0004ZE-Ap
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:14:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1naH6F-0005W6-1j
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:14:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648818837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8nslTy/f2ynLpTR5w4r0l7Hzy6pCQiKS2MnfCisVBbU=;
 b=RVs8xW+D8VJ3I259Ohq8LFQwkQkQDXzCsrEDHQv9QL4HswZ3eiDuQrpKui/eo48QTHwCCv
 vMF4dQdr2FyswQu8QP0mZjafYSsaySMhkphYKw316tWJXya92S5WIZaOMPCIdwW5EIvcqd
 7L/6OZ1Z2fn783w2AFkPAyLfArEYpe8=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-OshvVYiOMZ6JNW57VsR5iw-1; Fri, 01 Apr 2022 09:13:56 -0400
X-MC-Unique: OshvVYiOMZ6JNW57VsR5iw-1
Received: by mail-io1-f71.google.com with SMTP id
 u10-20020a5ec00a000000b00648e5804d5bso1703507iol.12
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8nslTy/f2ynLpTR5w4r0l7Hzy6pCQiKS2MnfCisVBbU=;
 b=nxmLhzxIFr3UUHzW1M1vT6eAkL/KoHl+Kzt02mbPLL023dkfXNssQ6hT1ku6xv1Rmz
 7Zif63dDfteplMUHcJRQ28f8lmhFMYvHTp6+UG/TjI8q0y77IDVB3qEguqn5GygY5C46
 fXwdZ3CGAmgchLf8tTvkwqVkdvMdoRfm4K5hQ+T69wUb3hk2IYBCt21MvNf1vBBep90/
 V5v5guqJ4lJB8+VBHaXkf4Mw45kytVnQHstor/fqfsyHO4LNsRL0RPCWEZEpCJMFgPsX
 UKbMlmT45sDg2yxH1UDatGP6QGcNSq8fPzSFkciwxbu8GsNTWiDqr3uCm2e60wJoMlNa
 umcA==
X-Gm-Message-State: AOAM533KQFOxzuVHXw1YUywA4+UrePaEshBnV18YKgH6ZM+soM1O+OaI
 cDaGDYNKEjRd+y2jjmaDDgfVcAMyXYwXrIsnfwlFF7n4aZCbrBjrr1kGsQksUmj+ggM3CRKsFSJ
 1qkdOtt/qgEtUI8A=
X-Received: by 2002:a05:6638:3472:b0:319:e0d3:9027 with SMTP id
 q50-20020a056638347200b00319e0d39027mr5398534jav.263.1648818835668; 
 Fri, 01 Apr 2022 06:13:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuybN+i844x8CFNzuvQWRKwRjKWeG+4ImwQrUwebYV/E3IRGLL0zgch8umg4I6aC/JNfouMw==
X-Received: by 2002:a05:6638:3472:b0:319:e0d3:9027 with SMTP id
 q50-20020a056638347200b00319e0d39027mr5398517jav.263.1648818835395; 
 Fri, 01 Apr 2022 06:13:55 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 q197-20020a6b8ece000000b00648d615e80csm1354323iod.41.2022.04.01.06.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 06:13:55 -0700 (PDT)
Date: Fri, 1 Apr 2022 09:13:53 -0400
From: Peter Xu <peterx@redhat.com>
To: wucy11@chinatelecom.cn
Subject: Re: [PATCH v2 0/4] Dirty ring and auto converge optimization
Message-ID: <Ykb6kZrGUnjpu3Pn@xz-m1.local>
References: <cover.1648091539.git.wucy11@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <cover.1648091539.git.wucy11@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: yuanmh12@chinatelecom.cn, tugy@chinatelecom.cn,
 David Hildenbrand <david@redhat.com>, huangy81@chinatelecom.cn,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, dengpc12@chinatelecom.cn,
 Paolo Bonzini <pbonzini@redhat.com>, baiyw2@chinatelecom.cn, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Chongyun,

On Mon, Mar 28, 2022 at 09:32:10AM +0800, wucy11@chinatelecom.cn wrote:
> From: Chongyun Wu <wucy11@chinatelecom.cn>
> 
> v2:
> -patch 1: remove patch_1
> 
> v1:
> -rebase to qemu/master
> 
> Overview
> ============
> This series of patches is to optimize the performance of
> online migration using dirty ring and autoconverge.
> 
> Mainly through the following aspects to do optimization:
> 1. Dynamically adjust the dirty ring collection thread to
> reduce the occurrence of ring full, thereby reducing the
> impact on customers, improving the efficiency of dirty
> page collection, and thus improving the migration efficiency.
> 
> 2. When collecting dirty pages from KVM,
> kvm_cpu_synchronize_kick_all is not called if the rate is
> limited, and it is called only once before suspending the
> virtual machine. Because kvm_cpu_synchronize_kick_all will
> become very time-consuming when the CPU is limited, and
> there will not be too many dirty pages, so it only needs
> to be called once before suspending the virtual machine to
> ensure that dirty pages will not be lost and the efficiency
> of migration is guaranteed .
> 
> 3. Based on the characteristic of collecting dirty pages
> in the dirty ring, a new dirty page rate calculation method
> is proposed to obtain a more accurate dirty page rate.
> 
> 4. Use a more accurate dirty page rate and calculate the
> matched speed limit throttle required to complete the
> migration according to the current system bandwidth and
> parameters, instead of the current time-consuming method
> of trying to get a speed limit, greatly reducing migration
> time.

Thanks for the patches.

I'm curious what's the relationship between this series and Yong's?

If talking about throttling, I do think the old auto-converge was kind of
inefficient comparing to the new per-vcpu ways of throttling at least in
either granularity or on read tolerances (e.g., dirty ring based solution
will not block vcpu readers even if the thread is heavily throttled).

We've got quite a few techniques taking care of migration convergence
issues (didn't mention postcopy yet..), and I'm wondering whether at some
point we should be more focused and make a chosen one better, rather than
building different blocks servicing the same purpose.

Thanks,

-- 
Peter Xu


