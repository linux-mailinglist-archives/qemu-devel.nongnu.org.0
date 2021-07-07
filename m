Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA043BE768
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:49:26 +0200 (CEST)
Received: from localhost ([::1]:56408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m163R-0002Pv-Sr
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m161v-0001Aq-9z
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:47:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m161t-00086S-Jv
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:47:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625658469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YE1QFh2ToZllKnmuy07kbdvBrdTQd5vBNv7yHRkep2I=;
 b=RcO/woXJQ3Bxz3BoPqBSutZHA+1LE0+HfB9MnUsBVVhhP0nK9ombLMgP3pV5FtFE5hNyGU
 6j7jBykJXvLYYbanXiG34el8Pwy+H6f4lU0LFS8V2cM5CrmhugsNQ5nW34Nx2c+oeDh0Hs
 UChk081moyABJCHYI/gViXnAoKsiZvg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-fu5m9sVEO4KYLZ3i5mwlJQ-1; Wed, 07 Jul 2021 07:47:46 -0400
X-MC-Unique: fu5m9sVEO4KYLZ3i5mwlJQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 p4-20020a5d63840000b0290126f2836a61so693923wru.6
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 04:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YE1QFh2ToZllKnmuy07kbdvBrdTQd5vBNv7yHRkep2I=;
 b=gtFr4W8/AM5lqGZgrxUQA9PJ93RK4Nci/52D78HL9wARElfVjvEr6m4aDlZv2gZKkG
 N8UsudDGBdxV/3DmPU793BJagLlWzXR31m4JOW8E2kyDSyg8jLOUfYcpTY+h3NN0LBvn
 qhEbDQG0AXQ4PiI3detFKALUTGeJ4iDhfXkZHnrY65PTiy5BsVxeHZnFc3LcHeVgDTmC
 OWW3OArn/8GQ32Fgm/lwmmoPX2BVMkOjFbcUFnC5ewSW8sXwpNn11Z8WkkcIJbcVzlQo
 qioay+fIPbU1b06bK4+CELqDFhD5rglW6R8Juh29NK7DTv8iZ+ZZrDJmUWX/mAV1BCRZ
 +aEQ==
X-Gm-Message-State: AOAM5305nYhLufNjtmItzMkQYRfJ26IkX5cR4ogMUpEswjLr4zGC2WWV
 KfjXomXnIgoYDArx2aU9soDVf+l37EZyH2vNLBYEknqsY69TNyOqPyaIWs+Gf9zzAmQ8eY3Iu+c
 4KdjMFZ0nVcDV9zU=
X-Received: by 2002:a05:600c:4304:: with SMTP id
 p4mr6160346wme.43.1625658465529; 
 Wed, 07 Jul 2021 04:47:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyj+jUUw/vdyQjXuwH3StBbTJWFK63UhBGMeX0J4WDAASE2b14NHWemDZk3LxCoIg44wiP+8Q==
X-Received: by 2002:a05:600c:4304:: with SMTP id
 p4mr6160323wme.43.1625658465353; 
 Wed, 07 Jul 2021 04:47:45 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ead.dip0.t-ipconnect.de.
 [217.87.94.173])
 by smtp.gmail.com with ESMTPSA id c9sm13260773wrx.22.2021.07.07.04.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 04:47:44 -0700 (PDT)
Subject: Re: [PATCH v7 13/14] target/s390x: move kvm files into kvm/
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210707105324.23400-1-acho@suse.com>
 <20210707105324.23400-14-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <af500207-0171-8a23-3263-c126d24458c5@redhat.com>
Date: Wed, 7 Jul 2021 13:47:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707105324.23400-14-acho@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: cfontana@suse.com, Cornelia Huck <cohuck@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/07/2021 12.53, Cho, Yu-Chen wrote:
> move kvm files into kvm/
> After the reshuffling, update MAINTAINERS accordingly.
> Make use of the new directory:
> 
> target/s390x/kvm/
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   MAINTAINERS                        |  3 +--
>   hw/intc/s390_flic_kvm.c            |  2 +-
>   hw/s390x/s390-stattrib-kvm.c       |  2 +-
>   hw/s390x/tod-kvm.c                 |  2 +-
>   hw/vfio/ap.c                       |  2 +-
>   meson.build                        |  1 +
>   target/s390x/cpu-sysemu.c          |  2 +-
>   target/s390x/cpu.c                 |  2 +-
>   target/s390x/cpu_models.c          |  2 +-
>   target/s390x/diag.c                |  2 +-
>   target/s390x/interrupt.c           |  2 +-
>   target/s390x/{ => kvm}/kvm.c       |  0
>   target/s390x/{ => kvm}/kvm_s390x.h |  0
>   target/s390x/kvm/meson.build       | 17 +++++++++++++++++
>   target/s390x/kvm/trace-events      |  7 +++++++
>   target/s390x/kvm/trace.h           |  1 +
>   target/s390x/machine.c             |  2 +-
>   target/s390x/meson.build           | 16 +---------------
>   target/s390x/mmu_helper.c          |  2 +-
>   target/s390x/trace-events          |  6 ------
>   20 files changed, 39 insertions(+), 34 deletions(-)
>   rename target/s390x/{ => kvm}/kvm.c (100%)
>   rename target/s390x/{ => kvm}/kvm_s390x.h (100%)
>   create mode 100644 target/s390x/kvm/meson.build
>   create mode 100644 target/s390x/kvm/trace-events
>   create mode 100644 target/s390x/kvm/trace.h

Reviewed-by: Thomas Huth <thuth@redhat.com>


