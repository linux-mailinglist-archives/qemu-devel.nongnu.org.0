Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EB2687A88
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:45:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNX4t-00028l-5j; Thu, 02 Feb 2023 05:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pNX4r-00028V-4o
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:44:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pNX4p-0006xi-D5
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:44:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675334662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zk689njywsUoTOAdolT0FFFPb72OxAcJiOLt6/D1p1Y=;
 b=VtjgfRa+dmBZtqaeHFEBkn3W/JMwl1JBzykiPvlcN9ERe+2iSpAfDgpvYXQ7aNBad5oeda
 OYUOFVfIE/0I0hqAwsX5joqZITFQ1co9e2Q3ED/r5qLStlW9+0shIIoQ4Okhpo0otOUgX9
 2HICbmDVoL8LjJOwypoSB0dc8oTz0yk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-nNLXoFqEMH6s3o1e8beciQ-1; Thu, 02 Feb 2023 05:44:13 -0500
X-MC-Unique: nNLXoFqEMH6s3o1e8beciQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 s7-20020ae9f707000000b007294677a6e8so1057759qkg.17
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 02:44:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zk689njywsUoTOAdolT0FFFPb72OxAcJiOLt6/D1p1Y=;
 b=lCOdz4Eg5TvCK47dU98IeYTmT1lnd2sO+UHTX+69wuHudDY27ZCy+ZUCasrRGg0vMd
 kgkEzZRlovjwxg2bI/LeR7TSNp9tX5iUWed9mE+FwmrcVBpIvrgJdw7mPMAsXSGP3CsM
 oixfSHSQqRWXiiZvO86cDu4ou6gQNWEJoWhtZ/qbkO8Y2hqOfqHNOJ1RgyzEiU52lXnA
 0n6Z5Nfw8T4zY/bq+Zun25bsCsY9yPWX/1ElwRnD79iiHLiAoShet+Ca9sofRpz4U82T
 DTq2VrGErS28q4tX6zjRZ3+1f7tnhbpVLiQ7bQxdiRDqgs4DXzOlTAG1hRLTBuQqf/eZ
 W85Q==
X-Gm-Message-State: AO0yUKV0hJdsn9W4cTfPUNVpd7vRTe01b1GliWGu1A2jbORs4DabivDc
 yRAZU7GsCHvd3wuxD2/6L3Xyv5h6HUwfF/mU8BK38DHaP0WEz6m6WVEqXQmnIckqyGf/NvzBSx5
 2S5bOOJCN6mTQthg=
X-Received: by 2002:ac8:5dce:0:b0:3b8:6043:daf8 with SMTP id
 e14-20020ac85dce000000b003b86043daf8mr10801141qtx.47.1675334653106; 
 Thu, 02 Feb 2023 02:44:13 -0800 (PST)
X-Google-Smtp-Source: AK7set8xkxlLPup3tabY+V7Eq+5TTe5ay44NvoGI6jckJeZL6u8e/vKinxcibffe2Q4BFy26U/9Rrg==
X-Received: by 2002:ac8:5dce:0:b0:3b8:6043:daf8 with SMTP id
 e14-20020ac85dce000000b003b86043daf8mr10801121qtx.47.1675334652853; 
 Thu, 02 Feb 2023 02:44:12 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-146.web.vodafone.de.
 [109.43.177.146]) by smtp.gmail.com with ESMTPSA id
 137-20020a37088f000000b0071aacb2c76asm10849689qki.132.2023.02.02.02.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 02:44:12 -0800 (PST)
Message-ID: <8f5980bd-bbc3-ba78-cf1e-60afb26fb887@redhat.com>
Date: Thu, 2 Feb 2023 11:44:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-2-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v15 01/11] s390x/cpu topology: adding s390 specificities
 to CPU topology
In-Reply-To: <20230201132051.126868-2-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 01/02/2023 14.20, Pierre Morel wrote:
> S390 adds two new SMP levels, drawers and books to the CPU
> topology.
> The S390 CPU have specific toplogy features like dedication

Nit: s/toplogy/topology/

> and polarity to give to the guest indications on the host
> vCPUs scheduling and help the guest take the best decisions
> on the scheduling of threads on the vCPUs.
> 
> Let us provide the SMP properties with books and drawers levels
> and S390 CPU with dedication and polarity,
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---

Apart from the nit:
Reviewed-by: Thomas Huth <thuth@redhat.com>


