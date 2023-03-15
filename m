Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952D46BA6F1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 06:18:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcJWi-0001Su-O0; Wed, 15 Mar 2023 01:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1pcJWS-0001SP-Ri
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 01:18:04 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1pcJWR-0007Cc-2W
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 01:18:00 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso708377pjb.0
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 22:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678857475;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y8QmKYcJg57HlzpunFUH9MGPifRoNDq8hXq0hFkxBNA=;
 b=abtA9w7+N9PnFhqJMTS1vxekyB+/9TRZH757nvWjC02O4HuYQfEbGMmD6ICW7rMFjY
 /VmGD+DSb6byIkc6ilrxJg1Z62GJqLpixlq583fSkrd9N8zzlEq+PUYLqbCjGsD6pZzr
 lNMKud71kSuDbnS5pru+h7MQGeq3nXJGF1+5NYUsY0V54O243pKtc5WzZ0NVCCDd6+Rw
 3bhP/Nawtapv3spmtMwhDzE3512ZNUdt9CaHz4T4WJge5hudYtFOTxOrQLUGqX4uXum5
 MVBH2rVWKsGPVjryEipxT4zwgFRep8zhaSYlfOQGnMfpK3v0H9FUXboiFoC4LXZ5B6gr
 0UYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678857475;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y8QmKYcJg57HlzpunFUH9MGPifRoNDq8hXq0hFkxBNA=;
 b=JMakQ7jxEnkKzvMK61OEmUpOJVMgUEwsdtyB+GmGZPNCqWXXgcLNvWzsAeyb0NgFE5
 W7EoAGhCxwG73zXmKp9NCCThMqFSDQYUSlny+bWCMR3yAdjSGZ6at8MxJ+oH8f8i6LOj
 yj+4qt8WBbxJ5y3Xisa//L+cl0UvhkrGYTxLFvIXL6WdyrmLVHnKLZ7x+b1WggdsN4QX
 /fcc/w9iC/X5P4ffRtg4s+Hz/V+IY8Bc9xZ+JAuhJ94AQ7+vEbzoSP9Nc22y73nkJoCg
 NcFJLc4GCK+rsNaQBYvv44BSw5WPmQImJ/hB1v+QhxLzvxPYr+wjuI1tBfTdwQQTXxVI
 Sp3A==
X-Gm-Message-State: AO0yUKWPUK/6lVkN7URh33lCHiV8g+vp6YMLpG6bRrwu7uESDTDJkEvH
 7HIcYPrc3b9057zLT/SK1GM9crQLeMANj3u4k+4=
X-Google-Smtp-Source: AK7set+v+08YLmgVZIkdUoqQNIHkvJTCWU5NZ9zfOm8OmZpJiNuz6CJzunAVmSRk/ShmWB32e+7zgw==
X-Received: by 2002:a05:6a20:7a1f:b0:d6:f0:85a with SMTP id
 t31-20020a056a207a1f00b000d600f0085amr1351227pzh.17.1678857475344; 
 Tue, 14 Mar 2023 22:17:55 -0700 (PDT)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 bn9-20020a056a00324900b0062578514d6fsm1856054pfb.58.2023.03.14.22.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 22:17:54 -0700 (PDT)
Date: Wed, 15 Mar 2023 10:47:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V3 0/2] qemu: vhost-user: Support Xen memory mapping quirks
Message-ID: <20230315051752.2owlp26mq72dqel2@vireshk-i7>
References: <cover.1678351495.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678351495.git.viresh.kumar@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09-03-23, 14:20, Viresh Kumar wrote:
> Hello,
> 
> This patchset tries to update the vhost-user protocol to make it support special
> memory mapping required in case of Xen hypervisor.
> 
> The first patch is mostly cleanup and second one introduces a new xen specific
> feature.
> 
> V2->V3:
> - Remove the extra message and instead update the memory regions to carry
>   additional data.
> 
> - Drop the one region one mmap relationship and allow back-end to map only parts
>   of a region at once, required for Xen grant mappings.
> 
> - Additional cleanup patch 1/2.

Stefan,

Does this version look better ?

-- 
viresh

