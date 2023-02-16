Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C38699A9F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:55:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShX4-0003I9-GF; Thu, 16 Feb 2023 11:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShX2-0003Gi-G2
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:54:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShX0-0006Ef-E9
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:54:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676566489;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJJqbKC8LO7aidwKTZzO++r/gji8BZ6xzatsHk7xL9M=;
 b=XdDApNOC2C/PjV0ycfTq1R7M2DvjXNrmP85YPyPkcEd2dtLY46qIc8d+E/omnSj5OoruIG
 nZys7lf7u91FhWwHAs5DddFODumutqWH9chMhYct6U4WUnPY3gp+Tncv737b3WzDE77gqZ
 xoy8pAt25gvAXdkB/i4BinZ6jK2du5w=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-SCfIOaP9OpCRbRIueNuMFw-1; Thu, 16 Feb 2023 11:53:45 -0500
X-MC-Unique: SCfIOaP9OpCRbRIueNuMFw-1
Received: by mail-qt1-f198.google.com with SMTP id
 l21-20020ac81495000000b003bd0d4e3a50so1045360qtj.9
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:53:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rJJqbKC8LO7aidwKTZzO++r/gji8BZ6xzatsHk7xL9M=;
 b=PAg8RwhxZDYqny/cBUaRlnXE4eYFk1s4zVwMvjkr449K9UIIyjhAqIIzlWCiezI9Xg
 l+xGUjGsqqElJGAk32PF6TSi10cRCsvNxtRTcdT3laqqG3eS2gR1XThCFXkzEf6+otx2
 0NpJYSX/cHN95jbdioxu3bKl5PqkdoVca5JBgMgKKtrjsH3EmJkDqmhtdsBTAp/YRlf+
 phgjKGgDfgbRORZf5q223zn8I/d1V1//RxImj0WJV6Tpl72iCoXS83LGVwpJaxn0WfwU
 iAzXzCgpwUTL3SQskitVr3SLqJ24FMbdvDwYnAsfo7vzvrAVLJOKQ2kZgEy4yNGjs9jH
 0muw==
X-Gm-Message-State: AO0yUKXo2PejTTHlsZsC1ZlNk3yu2EJRN6IoStyCg0bn7GJFnqOIWMvI
 WfoAFDH2uzdY5Yh40Y42mqcYtvNMD/GgqUenUy8oRF96FyTqV+46Aha0C+rGBc8LUfPFKfbEg5D
 YlAN2YCF2vMa5h9Q=
X-Received: by 2002:ac8:5e06:0:b0:3bd:16cf:2f33 with SMTP id
 h6-20020ac85e06000000b003bd16cf2f33mr715018qtx.63.1676566423160; 
 Thu, 16 Feb 2023 08:53:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9LXRQuci+NMH3agap9d+YD7v29iYMbQAGCn+Wb8WxAr+z8sl8WudOt38nN+qt7d71XhLQfEA==
X-Received: by 2002:ac8:5e06:0:b0:3bd:16cf:2f33 with SMTP id
 h6-20020ac85e06000000b003bd16cf2f33mr715000qtx.63.1676566422892; 
 Thu, 16 Feb 2023 08:53:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 p26-20020ac8409a000000b003bb822b0f35sm1527230qtl.71.2023.02.16.08.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 08:53:42 -0800 (PST)
Message-ID: <b0e78b79-18ce-29bb-1362-a3bf2cf83ba9@redhat.com>
Date: Thu, 16 Feb 2023 17:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 12/16] hw/arm/smmuv3: Add VMID to tlb tagging
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-13-smostafa@google.com>
 <ae0d6155-138e-5005-733f-f3932a14c6b3@redhat.com>
 <Y+41c8x5SCoPfZck@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y+41c8x5SCoPfZck@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2/16/23 14:53, Mostafa Saleh wrote:
> Hi Eric,
>
> On Thu, Feb 16, 2023 at 11:17:34AM +0100, Eric Auger wrote:
>>>      }
>>>  
>>> -    *key = smmu_get_iotlb_key(cfg->asid, new->entry.iova, tg, new->level);
>>> +    *key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
>>> +                              tg, new->level);
>>>      trace_smmu_iotlb_insert(cfg->asid, new->entry.iova, tg, new->level);
>> you may update the trace point as well
> I can add a stage argument here, however I don’t think it is necessary
> now as TLBs are either used for stage-1 or stage-2, not both.
no I meant adding the vmid value there

Eric
>
> Thanks,
> Mostafa
>


