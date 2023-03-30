Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDFE6D0638
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:14:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phs6a-0004Nm-9b; Thu, 30 Mar 2023 09:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phs6W-0004NU-HT
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:14:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phs6V-00017o-1a
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:14:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680182050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RPKX8l79QPeND+AbkZ2nzeqhQ/OU8LAbf3DGBmkfvvQ=;
 b=J+dS0k0VS/r30gFiNwbeZHTzDbFrT1x0np1G5m6rr0Gyep6lxcVL5gHFxCy4Gyj7LOxSXt
 atrklFq2rU55pGBZXsGnhORyYDt6fWapyYdUia0eW6wMC8P/HYREG++FrYjEhzxRynpPsM
 PyqwE0jho/avcLyU4LXr7iGZAcRK2hU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-vrAb8-hNPFehderu_Divbw-1; Thu, 30 Mar 2023 09:14:09 -0400
X-MC-Unique: vrAb8-hNPFehderu_Divbw-1
Received: by mail-qv1-f70.google.com with SMTP id
 q1-20020ad44341000000b005a676b725a2so8182579qvs.18
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 06:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680182048;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RPKX8l79QPeND+AbkZ2nzeqhQ/OU8LAbf3DGBmkfvvQ=;
 b=Z64eYI4PyD+HXtwEve6RZEJuNG3zLjKuYuNDkrptVVtAzq/3Na2mGFUAGQShEKpWhh
 C0Fapl4P/AxlvBY6uxCdhWLx7NFdjgvTQMiUGX3jOIEjoPd4i1cIcZWYym5mBV1hXY8X
 Q4Aq1A3TcsO08RJerdyK000vKVi4qPpmnSXcx0/t9QYMM7M6uKpoaHlcWvnRmUk5goxx
 a4JoChbuS6kQ/tz1sKQ+d3TJnWMoA0Ll4CgfgM67SXMXqI+h0J8U2g5elKqQotZZts6C
 LVpCbkm7Mc3fT06hhWigm7lUTlScQ786QYetfhWA+wK17xUMF+k0nF2SQGz+MaJo+tCx
 R7gQ==
X-Gm-Message-State: AO0yUKVH6IZWRURUQUUq02t+vCV/dE4GN0h7MEQGn/dICnvQ+nkGBN9P
 kzKsjiLnFpkcsWvd+SB39iOeeEd5MEzBdppiFxoTPXlglfeJxKeHRe4DQTUiJMRvnvIsJBhrO9J
 D8NNwMouTY+CH0Dw=
X-Received: by 2002:a05:622a:1302:b0:3e3:9621:bd2f with SMTP id
 v2-20020a05622a130200b003e39621bd2fmr32400921qtk.53.1680182048522; 
 Thu, 30 Mar 2023 06:14:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set+wMR03ydg/IJSAHJI7vxQOZP2g+r8CI6zmTW9TQ+pTvd2MyA5l//pqQ70JOn6yqhwsI/5qgQ==
X-Received: by 2002:a05:622a:1302:b0:3e3:9621:bd2f with SMTP id
 v2-20020a05622a130200b003e39621bd2fmr32400884qtk.53.1680182048257; 
 Thu, 30 Mar 2023 06:14:08 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 w23-20020ac87197000000b003e4dab0776esm4295410qto.40.2023.03.30.06.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 06:14:07 -0700 (PDT)
Message-ID: <bd2d0283-121f-8270-4b48-7b0ff5ab612f@redhat.com>
Date: Thu, 30 Mar 2023 15:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR
Content-Language: en-US
To: Rob Landley <rob@landley.net>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 balaton@eik.bme.hu, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
 <aa1e6559-55ae-0f7b-80cb-890bb34b9544@linaro.org>
 <20230320165821.GA4064187@dev-arch.thelio-3990X>
 <edea2619-8fe9-638e-cfa0-684123f7ee99@linaro.org>
 <037d00b7-9df9-e888-a4d7-235e6d08f784@landley.net>
 <89504c25-5265-d6c5-6e48-dcdc0be43ea0@linaro.org>
 <0ae35be3-794a-deee-1c96-507d5be2306c@landley.net>
 <cf1deca3-49ef-06a3-0f20-92c25968ae7d@linaro.org>
 <c8fd4b42-7c7b-8e65-5fe6-ed7d02644725@landley.net>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <c8fd4b42-7c7b-8e65-5fe6-ed7d02644725@landley.net>
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

On 30/03/2023 15.12, Rob Landley wrote:
...
>> I expect if you run your test with QEMU v7.2.0-873-g65cc5ccf06-dirty
>> on any big-endian *host* (like a s390x), the test fails.
> 
> I don't have powerpc mac hardware, which seems the easiest way to get such a
> test system.
> 
> (Well, ok, the EASY way would be to feed qemu-system-s390x a couple gigs of ram
> and then build and run qemu within qemu. While I do have a native toolchain for
> s390x, qemu's grown an insane dependency stack these days that would be a pain
> to bootstrap under a musl beyond-linux-from-scratch environment...)

If you've got a github account, you can still run QEMU tests on a real s390x 
machine via Travis, see e.g. my recent run here:

  https://app.travis-ci.com/github/huth/qemu/builds/261557106

  Thomas


