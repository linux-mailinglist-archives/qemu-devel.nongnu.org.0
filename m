Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367B841AD51
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 12:52:50 +0200 (CEST)
Received: from localhost ([::1]:59080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVAjB-00080E-8s
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 06:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAh0-0005wz-Pp
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:50:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAgs-0001HR-FO
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:50:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KAwYqDZlugOnAtw9hBaQ/R0okDTCizvJ/y4xT6C3bEo=;
 b=GkMj0mkdAKNM1SSNokhaIabwsFMqWHMDQw5zyVNS5vU+rdnKLCh8onEUCl4Cm1BtRBE0m4
 xoJgots+8Gv3ITpJMbyC1bgWOhqx2AJkn61FvDvJfUOcc3Ar2nO8FqyQDCQ7soQI7xrPnS
 0PvJWOIH96L1KLIIW5zZx8BwMHLqR6c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-RLjqZAB5MV-8ZpQUQGlqJQ-1; Tue, 28 Sep 2021 06:50:22 -0400
X-MC-Unique: RLjqZAB5MV-8ZpQUQGlqJQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so1867279wrg.10
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 03:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KAwYqDZlugOnAtw9hBaQ/R0okDTCizvJ/y4xT6C3bEo=;
 b=GhvxwIUCin+aB4aCU1PGFsXbJz1A1mirL/03kNw71POnYi1RqS44zTZVeYEWx5Fskq
 IrKXnfQi9W+x6i/PqsDj/EgYprwIGMsvnxDFyMIgmruGhgGwQbJ9HXejE0rbgZovtvFH
 vVMBtjHy+ZIP36OkiOVfF3QGVAhJPvTKazoLJrnWzEw1Fy0H9tWOwGJiLWJ1Y7KR/XG2
 Bzx5X5yDibnXWlpjoB2WFG6R2g9TSSSbbPK+7+FqFDmUhR1kJ6pR0TZPit4i6yvOKHLS
 zmeoE8KYf7iA+SDuOYS39pMso43htRcvTPZD/enWUSw40CZJS6mlEDwm4Dw1vaLLfMw0
 6xvg==
X-Gm-Message-State: AOAM532D5TToVCRGhZ4jCrFtEyRlROhBeAsORGCHOa8HAOo6xujCMim5
 JiMgmigmyJ9h5brLMcsPCpHF1BquWPA1yDkFz4x2B71LEVzF1RYLc8OQhrD118rPVA7wbkM/TGy
 tUp6IrRlfYFuBnvQ=
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr3949905wmh.61.1632826221417;
 Tue, 28 Sep 2021 03:50:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/IaGD3g3wTm5dlZnHxq6wupH1bIn65OUWi8OG42+t1FWcB8K6+od1UfOvLM7mpXTkbHG/Og==
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr3949873wmh.61.1632826221151;
 Tue, 28 Sep 2021 03:50:21 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id s13sm2337610wmc.47.2021.09.28.03.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 03:50:20 -0700 (PDT)
Message-ID: <62d3c39e-5ba5-b608-feb0-c7817de08ca5@redhat.com>
Date: Tue, 28 Sep 2021 12:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v11 05/14] machine: Improve the error reporting of smp
 parsing
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-6-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210928035755.11684-6-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
> We have two requirements for a valid SMP configuration:
> the product of "sockets * cores * threads" must represent all the
> possible cpus, i.e., max_cpus, and then must include the initially
> present cpus, i.e., smp_cpus.
> 
> So we only need to ensure 1) "sockets * cores * threads == maxcpus"
> at first and then ensure 2) "maxcpus >= cpus". With a reasonable
> order of the sanity check, we can simplify the error reporting code.
> When reporting an error message we also report the exact value of
> each topology member to make users easily see what's going on.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> ---
>  hw/core/machine.c | 22 +++++++++-------------
>  hw/i386/pc.c      | 24 ++++++++++--------------
>  2 files changed, 19 insertions(+), 27 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


