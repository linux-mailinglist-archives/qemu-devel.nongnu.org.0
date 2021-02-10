Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 738C03164C2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:14:10 +0100 (CET)
Received: from localhost ([::1]:59204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9nRh-00069q-Br
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:14:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9nQC-0005jT-CM
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:12:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9nQA-0003rh-9j
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:12:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612955553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4a6aws7bPujDxDy0qGTbg/Zlw8c31xqzgOW58YQa7p8=;
 b=SBpo71CaBh0cLVXms0k26NXQ1TtX5OavF2CDNmwW/ifurriP7jA0fU8H61mfdBCRnPMpTH
 XcSx6UlVPdEyl0O9lzcWSXXu4187tW4M065hfFqlDVqB6VYJYaRfQpeHi0Ta4LmoWa/25r
 ClLzIFYyIX6AvjfGYjQ619TWG/NoL4o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-XVMB_IebM5uro2I9-DAC1w-1; Wed, 10 Feb 2021 06:12:29 -0500
X-MC-Unique: XVMB_IebM5uro2I9-DAC1w-1
Received: by mail-ed1-f69.google.com with SMTP id u24so2163055eds.13
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 03:12:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4a6aws7bPujDxDy0qGTbg/Zlw8c31xqzgOW58YQa7p8=;
 b=Z92ULlyCwy5gh2ekkHnvmpuxuI50qOAXreK15StiqTnRu1qZMUtTzbODDOpjvXel90
 FQjt2JhS1EvnTXNadpdsZ6kHP9psItPu5QRYuci19x19CI3bGwb5N+dU0aLWdDh4fOHR
 M5B/Ayhb3AWGp6rXypJxWDzEuPK+u4J6ko/2/rVZf3EfZTfezOuJ9sz+OUM8KlBPWeGX
 BQMVCBjitCj9btspIGFeWPJkcnhLn0gaGaBRzRpKQlIQjaqE1bRvSkph/H2U//GlRviu
 5uokhw2toWfctYnZMSsCmTMBfIoCzEVeXJoKQ6nmxQ6IeNGyJ7mngXThi7wdF2qiMrbp
 0jmQ==
X-Gm-Message-State: AOAM531v7JRIkt0k93pFJUt/JOfOmkdtbHth+DCNs7fpTlnwYY9GQH/K
 9kSo2Ald1cR+arJjpdibra2pHCRUoCe9TUeQRmiQGG2Jl4R7513pxDdL8uqbDSdnQw4+kZIfNOy
 UVNZ3GSMW+M6OD/4=
X-Received: by 2002:a17:906:80b:: with SMTP id
 e11mr2365786ejd.269.1612955548584; 
 Wed, 10 Feb 2021 03:12:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1qRP5aat4mLe3QgRHhhMVuRdooa0RKG2Dfj1XhQyfP3/6FuJ+g+KYGDmETOC6g8z8UUrEWg==
X-Received: by 2002:a17:906:80b:: with SMTP id
 e11mr2365765ejd.269.1612955548363; 
 Wed, 10 Feb 2021 03:12:28 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id bd27sm729943edb.37.2021.02.10.03.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 03:12:27 -0800 (PST)
Subject: Re: [PATCH v2] hw/block: nvme: Fix a build error in nvme_get_feature()
To: Bin Meng <bmeng.cn@gmail.com>, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <1612952597-62595-1-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <299d3bdc-268c-eccc-66be-6605b23a2c92@redhat.com>
Date: Wed, 10 Feb 2021 12:12:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1612952597-62595-1-git-send-email-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bin,

On 2/10/21 11:23 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Current QEMU HEAD nvme.c does not compile:
> 
>   hw/block/nvme.c:3242:9: error: ‘result’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>          trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
>          ^
>   hw/block/nvme.c:3150:14: note: ‘result’ was declared here
>      uint32_t result;
>               ^

Why isn't this catched by our CI? What is your host OS? Fedora 33?

> 
> Explicitly initialize the result to fix it.
> 
> Fixes: aa5e55e3b07e ("hw/block/nvme: open code for volatile write cache")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v2:
> - update function name in the commit message
> 
>  hw/block/nvme.c | 1 +
>  1 file changed, 1 insertion(+)


