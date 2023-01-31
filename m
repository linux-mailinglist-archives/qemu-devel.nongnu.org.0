Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DA568305A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:01:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMr5L-0005Ei-RC; Tue, 31 Jan 2023 08:54:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMr5K-0005EM-EX
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:54:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMr5J-0008Tu-2p
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:54:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675173244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XM8pJ/h1Z42sddToV52faYVlVXAPSAueffR8JcFDOyI=;
 b=CKEfdQ9lwLtILndZfq4ylLJRtlZh86/BBjkteQgpfLvnD1SQ5/vlkAZYmR2sh/dqgKPQMU
 /sZqRDKzKAq50LjDv1gaP9mv7i4cRguaUB+DPxtbm3I55yCLDu+9zZx2yb+otF9gFe0GAg
 Eola21/MWkM3/aOepb1IyZM7NG9/Sqw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-251-fDUQHDYoN_mvlHp3-IjewA-1; Tue, 31 Jan 2023 08:54:03 -0500
X-MC-Unique: fDUQHDYoN_mvlHp3-IjewA-1
Received: by mail-qv1-f72.google.com with SMTP id
 jh2-20020a0562141fc200b004c74bbb0affso8369728qvb.21
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 05:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XM8pJ/h1Z42sddToV52faYVlVXAPSAueffR8JcFDOyI=;
 b=tHp5Qz11MvWJUGQLT2GCYCtd27/2soMFyv8Ab4tZOTShruHLvvLF47b1BRHd+AdsGq
 EMy8YoJyMnQF8IU4V15Xodlzz5NH+2WW9Ww5XXfe750Eenb0vptyzjQElH6fVsKfR/Xa
 B5L70WnWBRPLAgIIIhtFl59IWt7q9glz6JrbCdFtl5zX/Eijxguh8FBvpUpQuosEj2CR
 hW7Q0vuFPVfXpaQbwA2MqMXfRfxlG7hhyWojBPhJdx0kHZvNWvWu+U2HcNcu0VW+2lnu
 cxuEvK9mrxEDZf6wyGf/tFZUrrRflcc3qVEi1erxQ6kSW5IlpVfl2qCYFlWBSjUU6Zja
 CaUA==
X-Gm-Message-State: AFqh2krBSq6sOxlgQdT8PYdc1WPhgmVp8JxioB0j9stjY6zD1Sw7mq8k
 dZamrblPfAk0m1zPNfWAOs75J1lVU2Mk59fjxsURapWwh77x9q9RfjOMdskOPd6lO50Fhyzm0I3
 LFtJkKq+IWEcZqOg=
X-Received: by 2002:a05:622a:22a6:b0:3b6:2b4b:5688 with SMTP id
 ay38-20020a05622a22a600b003b62b4b5688mr77040135qtb.11.1675173242585; 
 Tue, 31 Jan 2023 05:54:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsEGrUMIlc/vlwPKYh6dm36lIDXlGj4MHBl4dG3G9F308JkaSyLtre9PMWT3hUOmwngnS4HNg==
X-Received: by 2002:a05:622a:22a6:b0:3b6:2b4b:5688 with SMTP id
 ay38-20020a05622a22a600b003b62b4b5688mr77040115qtb.11.1675173242344; 
 Tue, 31 Jan 2023 05:54:02 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 z1-20020ae9e601000000b0071f0d0aaef7sm4112931qkf.80.2023.01.31.05.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 05:54:01 -0800 (PST)
Message-ID: <db96c4f9-bb10-0e16-6222-2614edd0c231@redhat.com>
Date: Tue, 31 Jan 2023 14:53:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 04/20] hw/i386/pc_q35: Resolve redundant q35_host
 variable
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org
References: <20230131115326.12454-1-shentey@gmail.com>
 <20230131115326.12454-5-shentey@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230131115326.12454-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 31/01/2023 12.53, Bernhard Beschow wrote:
> The variable is redundant to "phb" and is never used by its real type.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc_q35.c | 26 ++++++++++++--------------
>   1 file changed, 12 insertions(+), 14 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


