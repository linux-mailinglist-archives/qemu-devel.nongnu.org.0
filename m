Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6483584A8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 15:27:30 +0200 (CEST)
Received: from localhost ([::1]:38612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUUgz-0005hm-JW
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 09:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lUUfQ-0004T2-Ng
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:25:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lUUfO-00046I-RC
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:25:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617888350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CalHGNi17Eqii6/q400v+adCnMrmFiYK7k2HM9Paen0=;
 b=JQlOfZGDm3i/6PcpKp37I36T+uto7b+XWh3V5vrm0flWuAUM9sj/MA8h27p8CTICHE4wG2
 1QVIOBK0irU5As3BkgBivfrESb0i8ghU6luPUPZ7c2L/tzf5Ae9fxJWbZg41n3PrYDudvB
 AH9+o/gbPQYsA02j3/0B5iQxMkVTWYg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-YpeDq_FSP_SQpv14tBMp8g-1; Thu, 08 Apr 2021 09:25:48 -0400
X-MC-Unique: YpeDq_FSP_SQpv14tBMp8g-1
Received: by mail-ed1-f72.google.com with SMTP id r19so1035107edv.3
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 06:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=CalHGNi17Eqii6/q400v+adCnMrmFiYK7k2HM9Paen0=;
 b=o2/gqWFk/CKSZnvHY+/bkeZifMpFZPQ8iLKbHOo4erzO6owyDtzVMgwCVqAFrszuIp
 4aGyo7BVimCHFIH420tFUp8Hr1FU9RypIkJM+8QCkgHqqfNsJfUBuIELItiOaeJHQQhU
 zC6DQZTt3PAZciDnxMJ5ZfSOf/9bdcwPjkO/JyncTrAiq/HlolYmbtZ599JeIFuQeIPF
 sFV8jETIBoLcxW+4TC18JFbNn2ZHfZjnE+vJt7BP9ZVvrpD/WtOsW1pQu692L7ZjfET2
 1qpM9sp7AyHAhDw/8FWa1UkeFfjcFm/suo+HdFWaWbFsV56uXVs+gr56bGcjHaRS8IcB
 i4EA==
X-Gm-Message-State: AOAM5302VH6YtpXvgCjzxtCIcTbb7vQ/T+0va1I+AsJjXXq4QNLY6maD
 nCy8jr/T9Y67UlIK0Dvv1MCc95f0BvP+Ioo2gehtIvDibZaiM+oT4vRBVieOKNu5+uRY3IVU15L
 3WKuWUxnMAcrZb9o=
X-Received: by 2002:a17:906:704a:: with SMTP id
 r10mr10409235ejj.312.1617888347329; 
 Thu, 08 Apr 2021 06:25:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAknoRcjTb94/flXdq07O9xXEaFxFdANkYdd2oe3OMFXEEzQVrN0eA8Q1E0/uztophbDOQEg==
X-Received: by 2002:a17:906:704a:: with SMTP id
 r10mr10409216ejj.312.1617888347191; 
 Thu, 08 Apr 2021 06:25:47 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id w13sm11079682edc.81.2021.04.08.06.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 06:25:46 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Wen Pu <puwen@hygon.cn>
Subject: Re: [PATCH RFC] target/i386: Add Intel CPU model versions
 supporting 'xsaves'
In-Reply-To: <e6500701-19e5-d779-0326-376a110c5514@hygon.cn>
References: <20210407154342.640584-1-vkuznets@redhat.com>
 <e6500701-19e5-d779-0326-376a110c5514@hygon.cn>
Date: Thu, 08 Apr 2021 15:25:46 +0200
Message-ID: <875z0w9acl.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wen Pu <puwen@hygon.cn> writes:

> On 2021/4/7 23:43, Vitaly Kuznetsov wrote:
>> Hyper-V 2016 refuses to boot on Skylake+ CPU models because they lack
>> 'xsaves'/'vmx-xsaves' features and this diverges from real hardware. The
>> same issue emerges with AMD "EPYC" CPU model prior to version 3 which got
>> 'xsaves' added. EPYC-Rome/EPYC-Milan CPU models have 'xsaves' enabled from
>> the very beginning so the comment blaming KVM to explain why Intel CPUs
>> lack 'xsaves' is likely outdated.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>> The only CPU model where I keep the original comment and don't add
>> a version supporting 'xsaves' is "Hygon Dhyana" as I don't know much
>> about it.
>
> Hi Vitaly,
>
> Hygon Dhyana supports 'xsaves', could you please add a version supporting
> 'xsaves' for Hygon "Dhyana"?
>

Sure, will do! Thanks for the confirmation!

-- 
Vitaly


