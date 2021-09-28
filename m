Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132A041ADA4
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 13:12:24 +0200 (CEST)
Received: from localhost ([::1]:38128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVB27-0000IW-4L
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 07:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAsN-0006KR-SF
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:02:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAsF-0002mh-Nh
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:02:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1+yOt0WiPspryEx5AGixJ03Jo6YXDu6P2uhPaytnRLQ=;
 b=U/j7WfWv4PWLcZGYcBmoMyPW8UW20jOWqiONUCHGyAq/RABpcWLzGNt/wv7g9JcqpVsqyL
 sS7V2K0uOyMJS+DwZMVF2Ij5xAk7m8ewk4+J038yOUgzGF3AIDIRVZ+8Dpt6DYPo0DZQS3
 hPKK13dou+k5UwMjakh53bPTvLwlYK4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-c6LK9malNHKT3oj8_XKLhQ-1; Tue, 28 Sep 2021 07:02:09 -0400
X-MC-Unique: c6LK9malNHKT3oj8_XKLhQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 z15-20020adfec8f000000b001606a799300so1144847wrn.19
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 04:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1+yOt0WiPspryEx5AGixJ03Jo6YXDu6P2uhPaytnRLQ=;
 b=FFu7b4kbEtG8Ts6H0XgYZKnnGoKaiZDPzdjix9hyJqdnHw2n0ItBYcbDjb8QtW3lYX
 ZT+UWjmvSIU6P+frCcKoa3isIDnIKidT7MdTKgXi6q87/AmZFseuw3BHLG5xc3fvxS6B
 KymTSPIAR6/2mRUO63TXkziEv9ye2fYgnkCg0SmP4a/yshcMJcrh/fb2bY9Crg2uBz9x
 6/GlvNWiUX08qib7naJUJwGJIsXS/ki9diXwtyymwMGFIrrF2Rpk1qrvniDkBxHb8YcB
 MCMw3OQb/7iIkwaPtAX1c2INuvDYTfP+NQBoZvz6uxSvB2G0WM4mYo6YOutXh3a/AUt3
 9kIg==
X-Gm-Message-State: AOAM530PNOUEgjJseuiu0a2Iu0UVT2AjavFITDr2QYj1iBfw/i6OCLH+
 tZvjXR2HSwnh7Ogbgi9k7tETPB1CFgIvwcLo37/KBmF8Dt6BSl3BDJo8duODzmRQ4iAGsBu+R8K
 ppSkbtjzkK9L1UFA=
X-Received: by 2002:a5d:64cf:: with SMTP id f15mr5547395wri.284.1632826928095; 
 Tue, 28 Sep 2021 04:02:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzac5G6DPP+QOLxIq6kDi/dk34rUC0IRV5x9fMK2qRSK6VkB7T87lEsX4TS9h6B9GBCu6dQPA==
X-Received: by 2002:a5d:64cf:: with SMTP id f15mr5547351wri.284.1632826927878; 
 Tue, 28 Sep 2021 04:02:07 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id j27sm2550812wms.6.2021.09.28.04.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 04:02:07 -0700 (PDT)
Message-ID: <9aabb237-c256-757a-90e7-681f947fd2f4@redhat.com>
Date: Tue, 28 Sep 2021 13:02:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v11 11/14] machine: Make smp_parse generic enough for all
 arches
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-12-wangyanan55@huawei.com>
 <2652509f-97d7-f999-a36f-47fc3b5ca346@redhat.com>
 <YVL1UuCQ6+KiPwfR@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YVL1UuCQ6+KiPwfR@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 12:58, Daniel P. Berrangé wrote:
> On Tue, Sep 28, 2021 at 12:57:21PM +0200, Philippe Mathieu-Daudé wrote:
>> On 9/28/21 05:57, Yanan Wang wrote:
>>> Currently the only difference between smp_parse and pc_smp_parse
>>> is the support of dies parameter and the related error reporting.
>>> With some arch compat variables like "bool dies_supported", we can
>>> make smp_parse generic enough for all arches and the PC specific
>>> one can be removed.
>>>
>>> Making smp_parse() generic enough can reduce code duplication and
>>> ease the code maintenance, and also allows extending the topology
>>> with more arch specific members (e.g., clusters) in the future.
>>>
>>> Suggested-by: Andrew Jones <drjones@redhat.com>
>>> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>> ---
>>>  hw/core/machine.c   | 91 +++++++++++++++++++++++++++++++++++----------
>>>  hw/i386/pc.c        | 84 +----------------------------------------
>>>  include/hw/boards.h |  9 +++++
>>>  3 files changed, 81 insertions(+), 103 deletions(-)
>>
>>> +/*
>>> + * smp_parse - Generic function used to parse the given SMP configuration
>>> + *
>>> + * Any missing parameter in "cpus/maxcpus/sockets/cores/threads" will be
>>> + * automatically computed based on the provided ones.
>>> + *
>>> + * In the calculation of omitted sockets/cores/threads: we prefer sockets
>>> + * over cores over threads before 6.2, while preferring cores over sockets
>>> + * over threads since 6.2.
>>> + *
>>> + * In the calculation of cpus/maxcpus: When both maxcpus and cpus are omitted,
>>> + * maxcpus will be computed from the given parameters and cpus will be set
>>> + * equal to maxcpus. When only one of maxcpus and cpus is given then the
>>> + * omitted one will be set to its given counterpart's value. Both maxcpus and
>>> + * cpus may be specified, but maxcpus must be equal to or greater than cpus.
>>> + *
>>> + * For compatibility, apart from the parameters that will be computed, newly
>>> + * introduced topology members which are likely to be target specific should
>>> + * be directly set as 1 if they are omitted (e.g. dies for PC since 4.1).
>>> + */
>>>  static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>
>> Can we have it return a boolean instead?
> 
> That's unrelated to this change, so ought to be a separate commit if
> done.

Sure, fine by me.


