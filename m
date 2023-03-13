Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4A36B7033
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 08:41:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbcmJ-0001yN-BO; Mon, 13 Mar 2023 03:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbcmE-0001xx-JC
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 03:39:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbcmC-0000YI-Mk
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 03:39:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678693163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KfJQT6wt9BLV5t3CsqEhoeQoCIZ6o4H8JXLrnrIg4s0=;
 b=evAPk5ADDuQQpY8JmWh16zKovnvYaNsbpOsJob3SylOH1n+sc1Hk/ZPqBG2CkqdVqfTc3w
 uQOIyV7ZHyX6XEUETSsVQhWFR8FPeZs2aCcGu4moOfPrxJBO+nY3mFuaZ6gb1UN65I6NqL
 wVUgI+YVojBP/mdVde+fxvytFO2Bi2w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-_InWPJbRPZS1jGDUD02L1g-1; Mon, 13 Mar 2023 03:39:22 -0400
X-MC-Unique: _InWPJbRPZS1jGDUD02L1g-1
Received: by mail-wm1-f70.google.com with SMTP id
 s18-20020a7bc392000000b003deaf780ab6so4051553wmj.4
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 00:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678693161;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KfJQT6wt9BLV5t3CsqEhoeQoCIZ6o4H8JXLrnrIg4s0=;
 b=OrmNVkI+Y6IgOJMR+QRT1J7c7q+tvHP6E3LAVG5AD7FUL4dTtCMLoLi4v8jl6KLUNT
 /aR9K3FgHfDT3BF2mggUxF8rKwREgNl9pChTsgMq5NwdjLeHWghr0ZslFsvzhNtEA5gU
 VmZ0glFa+V5KGKfMyjjL7XvXnbKIkGaeMFzTFoJDyknAy2k3UKKx0/FW8Ap97G6ua82c
 oXgeTVF2yz9PGKnGB7jDYFwmUVF5c98N1A2H5xZBgfl/+DJJvB84KcjwUOgZqejWX45D
 TJ7do8rwvbK4V3SJQ2drfKCEF/j6/jmKEFUrF25JWBiq9dPTALX/ymIPEsZwQPyGpDhH
 RAag==
X-Gm-Message-State: AO0yUKVKWJvU3SPaAuM2qX5EreaesycQTaZLe2EZCVxeUYjXRSB/bgIg
 KPrUVJOBR8C4FFU3Rxmafd50sluUhJ5Av7pqoXS3+k+7k5Jfcx8uDo2qJzowaEEgNXAzKuv1ul7
 a/bR9eZzkXCKOa4Q=
X-Received: by 2002:a05:600c:4f02:b0:3eb:39c3:8844 with SMTP id
 l2-20020a05600c4f0200b003eb39c38844mr10324489wmq.12.1678693161029; 
 Mon, 13 Mar 2023 00:39:21 -0700 (PDT)
X-Google-Smtp-Source: AK7set9x3Gk25PDIi1TClUENi6DiWWRggZVfB0D5j7BG5SUkL9Wpn+PUMH7vPhBEBobczyzMOjCuWw==
X-Received: by 2002:a05:600c:4f02:b0:3eb:39c3:8844 with SMTP id
 l2-20020a05600c4f0200b003eb39c38844mr10324468wmq.12.1678693160775; 
 Mon, 13 Mar 2023 00:39:20 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-26.web.vodafone.de.
 [109.43.179.26]) by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c2cce00b003df7b40f99fsm8832349wmc.11.2023.03.13.00.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 00:39:20 -0700 (PDT)
Message-ID: <66323001-8ed0-2e55-50cd-dc090bdf85d4@redhat.com>
Date: Mon, 13 Mar 2023 08:39:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] cpu, qapi, target/arm, i386, s390x: Refactor
 query-cpu-model-expansion
Content-Language: en-US
To: Dinah Baum <dinahbaum123@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20230312210624.2326264-1-dinahbaum123@gmail.com>
 <20230312210624.2326264-2-dinahbaum123@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230312210624.2326264-2-dinahbaum123@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/03/2023 22.06, Dinah Baum wrote:
> This patch enables 'query-cpu-model-expansion' on all
> architectures. Only architectures that implement
> the command will return results, others will return an
> error message as before.
> 
> This patch lays the groundwork for parsing a
> -cpu cpu,help option as specified in
> https://gitlab.com/qemu-project/qemu/-/issues/1480
> 
> Signed-off-by: Dinah Baum <dinahbaum123@gmail.com>
> ---
>   MAINTAINERS                      |   1 +
>   cpu.c                            |  20 +++++
>   include/exec/cpu-common.h        |   8 ++
>   qapi/machine-target-common.json  | 129 +++++++++++++++++++++++++++++++
>   qapi/machine-target.json         | 129 +------------------------------

Could you please elaborate in the patch description, why you apparently had 
to move lots of code from one file to another? Why is that necessary?

  Thomas


