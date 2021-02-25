Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB1F324DC2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:16:39 +0100 (CET)
Received: from localhost ([::1]:41724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDhG-0004DX-DZ
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:16:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFDcm-00080g-CQ
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:12:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFDci-00078z-VV
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614247915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gyXeW7z4wi2TO1+0uLDyxXxM7ZWtnR9ka0eoMYBD1BY=;
 b=hyipn2qaETAa7WGHvlEp2tbbIpDiEaQXzcZy4A9QOOuEU0KWXIqhKSACNPY/G/MENqZX5Q
 DaKfT9X9BfpVTn1/AFbNTXQV8ZfQgddX6B1LhQY1cT9RkdF73AFHrxT5/7/GpCzABAM90E
 YVlwHd/pMDefd9PWzE+5KOPdABZuxec=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-QtYBlzPhNXmPOdZ6s4V94w-1; Thu, 25 Feb 2021 05:11:53 -0500
X-MC-Unique: QtYBlzPhNXmPOdZ6s4V94w-1
Received: by mail-wr1-f72.google.com with SMTP id p15so2411389wre.13
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 02:11:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gyXeW7z4wi2TO1+0uLDyxXxM7ZWtnR9ka0eoMYBD1BY=;
 b=TvQzayAqsgyC1BuFW/SgcgG5fR9sLKOqyn4QsuQZ24SmpILFaFX7EnALkZReY7n7q4
 xXs9v3akSeA0ZRUAB7rwzPvb2fEXs1Lg66w27CTu7lOAGSJdmNeItpDCzTA2nlcSKNYO
 BLy2aOEEUVtgmAGzxWOGbDqFBs8deFmCvbclED9TSvMYecpeGwEStz62kiUKiajpjQDV
 ME3ET3f4p6fY9bQJIZ3GPX42kBLlco+fazo+HKMkPKU0RL028NLdN4FMRUFrAT0ObbEp
 OMl9TwbcPdScaRYriBg9w6HNuQc7Oa3ERp9KNeYlLIeh9G6yuI7EoQtbPKEnuQhyYyHm
 yxVw==
X-Gm-Message-State: AOAM5338OgknQrsrOvmhE6kl58vdgbWjDeDdJSqKL1+snCITJomZe74u
 KRqTIdClASiX2+cnvZSiQvW/BsKalGHE7PHuoirMLv4/gamOm1Rv1tcnW6/ETm4alXR34uRI9tI
 gHY2AGHiO9u1QgjM=
X-Received: by 2002:adf:f785:: with SMTP id q5mr2565259wrp.375.1614247912571; 
 Thu, 25 Feb 2021 02:11:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyytJm9H5IQkYsNqHGDMMweGNa7gyTcAyxfcLI53Oq9G4ClkPRz4CyelRWNskXlSfF7YXZ9fw==
X-Received: by 2002:adf:f785:: with SMTP id q5mr2565216wrp.375.1614247912157; 
 Thu, 25 Feb 2021 02:11:52 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m17sm6742929wmq.5.2021.02.25.02.11.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 02:11:51 -0800 (PST)
Subject: Re: [PATCH v2 7/7] hw/arm/smmuv3: Uniformize sid traces
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 jean-philippe@linaro.org, peterx@redhat.com, jasowang@redhat.com,
 pbonzini@redhat.com
References: <20210225091435.644762-1-eric.auger@redhat.com>
 <20210225091435.644762-8-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <47032051-b00c-0780-519e-fb60059e03c4@redhat.com>
Date: Thu, 25 Feb 2021 11:11:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225091435.644762-8-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 10:14 AM, Eric Auger wrote:
> Convert all sid printouts to sid=0x%x.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/trace-events | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


