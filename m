Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF2F480B06
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 17:00:48 +0100 (CET)
Received: from localhost ([::1]:39952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2Eu6-0003NN-Uc
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 11:00:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2Erd-0002He-1B
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 10:58:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2Era-0006el-39
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 10:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640707089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9+TKXXn456JTKpa2QllacDt3a1HqFcgf7yI3+X2lAhw=;
 b=eQwHQ03jdPqIHDoe+m6jAgpTwCVV1AyI5No5ZkYpMqfq3oQS4r1ig/0kk4ek5viRNjh8/o
 Ml59WNEN9ncdp9wGjNOe7cdPKyRqB/sOZ3Pe/NboQu1x7twhmEAVGS/cy7Zthy0ZkokhIp
 1FLjy9ft0FMy+brW5rm4iMTlZo35ss8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-IVSH_Jl3OtWSmRMIr7tKig-1; Tue, 28 Dec 2021 10:58:08 -0500
X-MC-Unique: IVSH_Jl3OtWSmRMIr7tKig-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adf9b8d000000b001a2aa837f8dso4013343wrc.3
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 07:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9+TKXXn456JTKpa2QllacDt3a1HqFcgf7yI3+X2lAhw=;
 b=huOA9G23nQ/WMJRGsu58ixBGDiPYqmL5Uaa/OlYcdW0teFZTNKPHFzhS4P/uQd94es
 P5PSZbUdxkjN00NrDnA4JEhZ3y97Wj5C2KJFLOBF0oiBR7rM+xH0cqdMDQU6Ks6EAyO7
 yZLQ8rCqqkJqfGAlEQziyQUrGPD/GGqzUcYl4l9K0ZJF8mP3XlWuChqOw/gJx3wMyq0A
 EFmzvuiGqAOKPvwFinY5rg3B22udHHTXgyPtV8wnZlTtvNf62XycVbwj2Vw4EtT8G5CA
 9eM4f4Qf3tFh5sXjxP2ePiT5j90v1kEf7aRTEvhyGmBGrTegYJoWdTQzNe2aWHkaJmzb
 ofNw==
X-Gm-Message-State: AOAM533HHlC24UW0ZOaxooxwpHZV1jbb6xCHUYtpiNfYrq5Uz/a4sLis
 7LkpVkMnGCXOUm8c3xzNzp+zyPrPnPN2b4Ldgl5Oijfjno7IiJ/tCXmL0M24yK7RZq5mN5JPSrc
 5fMHektyA9QD8sRQ=
X-Received: by 2002:a05:6000:1085:: with SMTP id
 y5mr17462675wrw.696.1640707087284; 
 Tue, 28 Dec 2021 07:58:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8SY4YoH+YDT6RAkrrhhNABa8r8akes03d0HGZnb/F2otKnldzQW7zoCDNV9hlrtSgeKoEjQ==
X-Received: by 2002:a05:6000:1085:: with SMTP id
 y5mr17462641wrw.696.1640707086985; 
 Tue, 28 Dec 2021 07:58:06 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id c8sm18384343wrp.40.2021.12.28.07.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 07:58:06 -0800 (PST)
Message-ID: <10e4c8af-e09b-4777-9670-7a5090974514@redhat.com>
Date: Tue, 28 Dec 2021 16:58:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 05/14] tests/unit/test-smp-parse: No need to explicitly
 zero MachineClass members
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-6-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211228092221.21068-6-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.573,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/21 10:22, Yanan Wang wrote:
> The default value of the MachineClass members is 0, which
> means we don't have to explicitly zero them. Also the value
> of "mc->smp_props.prefer_sockets" will be taken care of by
> smp_parse_test(), we don't necessarily need the statement
> in machine_base_class_init() either.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/unit/test-smp-parse.c | 10 ----------
>  1 file changed, 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


