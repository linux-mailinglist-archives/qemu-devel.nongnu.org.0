Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3692E41AD6E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 12:58:42 +0200 (CEST)
Received: from localhost ([::1]:44170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVAor-0000QI-8A
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 06:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAnh-0007ek-Qs
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:57:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAne-0007J5-HE
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mXKCsPu6wY7iDMU4HgvA+TIWDkRyDj4bF8zux9JV8Ig=;
 b=iXlwscM+HxERdJ8Iui9Eu5BlkfRQyUxCU9wJAkZV7FckgMS2GvzomNR5LErN1E4rdkL2xL
 NwmSnLP/zuF+4B4Biix8OdzNvd2in5+kvMnWPSwdSz2Js5G8PCJxP33YgUDCSBlJfp3hDL
 wjqPy68mO0zLaZw19Inc76jvlUnTjmA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-LH0MoHmDN7uu6Ao9ejognA-1; Tue, 28 Sep 2021 06:57:24 -0400
X-MC-Unique: LH0MoHmDN7uu6Ao9ejognA-1
Received: by mail-wr1-f70.google.com with SMTP id
 r5-20020adfb1c5000000b0015cddb7216fso15001641wra.3
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 03:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mXKCsPu6wY7iDMU4HgvA+TIWDkRyDj4bF8zux9JV8Ig=;
 b=sg/3N5WrYMZCzIoiSM2gKFXeKp2jdJ08JPcv+L6oByJ78weHHFeCrnTdEnKhw7aV+1
 AerM4M14gzxpTTyfqjavAe5kVnflNmWMuKm8I67IqQ85WazonTh6XvtpP5EpHE8eRVIa
 vacBYOyBBv87lBVNVasgwe8By87P7mePMAiZYN6Ti8x14nZ+ITEY7nDLklb+TP4RXTcc
 lFQGhaU8LbMYNtpM5AJbBpBaLNNdFxgzXXw6piyTNVeo59RpNozBspmKTUU48pKR8Hyr
 VakdoHxo3A329gJPNZwn2G0ZPdYUYIINxqjMnVeoCOXpCYSwVLY/2IEPeJlhdx9kAcrk
 UQBg==
X-Gm-Message-State: AOAM532ULK8Fz1qPpZ0io77g2ZmDn9k+8dtZKwO2b94zaqH5G4UdEwGn
 JEl6oNEZfFvL5lixOUv8kP6PTRZKSCq2wJrei++B2fwFbf6EvOueKtz7Z5uKg49BxbRqe200bcO
 wQ5jZzaI3FwZ+Cos=
X-Received: by 2002:a1c:4b0c:: with SMTP id y12mr3947314wma.35.1632826643389; 
 Tue, 28 Sep 2021 03:57:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqXJQCex0+u8/XBOQQIsNiqf+go0yFgfoJqzR2TpeEhs+eBTBcEbuBvh3u03xA14vTdfIMLQ==
X-Received: by 2002:a1c:4b0c:: with SMTP id y12mr3947284wma.35.1632826643190; 
 Tue, 28 Sep 2021 03:57:23 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id y11sm23422869wrg.18.2021.09.28.03.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 03:57:22 -0700 (PDT)
Message-ID: <2652509f-97d7-f999-a36f-47fc3b5ca346@redhat.com>
Date: Tue, 28 Sep 2021 12:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v11 11/14] machine: Make smp_parse generic enough for all
 arches
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-12-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210928035755.11684-12-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 05:57, Yanan Wang wrote:
> Currently the only difference between smp_parse and pc_smp_parse
> is the support of dies parameter and the related error reporting.
> With some arch compat variables like "bool dies_supported", we can
> make smp_parse generic enough for all arches and the PC specific
> one can be removed.
> 
> Making smp_parse() generic enough can reduce code duplication and
> ease the code maintenance, and also allows extending the topology
> with more arch specific members (e.g., clusters) in the future.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c   | 91 +++++++++++++++++++++++++++++++++++----------
>  hw/i386/pc.c        | 84 +----------------------------------------
>  include/hw/boards.h |  9 +++++
>  3 files changed, 81 insertions(+), 103 deletions(-)

> +/*
> + * smp_parse - Generic function used to parse the given SMP configuration
> + *
> + * Any missing parameter in "cpus/maxcpus/sockets/cores/threads" will be
> + * automatically computed based on the provided ones.
> + *
> + * In the calculation of omitted sockets/cores/threads: we prefer sockets
> + * over cores over threads before 6.2, while preferring cores over sockets
> + * over threads since 6.2.
> + *
> + * In the calculation of cpus/maxcpus: When both maxcpus and cpus are omitted,
> + * maxcpus will be computed from the given parameters and cpus will be set
> + * equal to maxcpus. When only one of maxcpus and cpus is given then the
> + * omitted one will be set to its given counterpart's value. Both maxcpus and
> + * cpus may be specified, but maxcpus must be equal to or greater than cpus.
> + *
> + * For compatibility, apart from the parameters that will be computed, newly
> + * introduced topology members which are likely to be target specific should
> + * be directly set as 1 if they are omitted (e.g. dies for PC since 4.1).
> + */
>  static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)

Can we have it return a boolean instead?


