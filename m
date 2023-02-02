Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0544D687E48
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 14:06:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNZIE-0000cu-9t; Thu, 02 Feb 2023 08:06:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pNZI9-0000cI-1P
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:06:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pNZI6-0003bd-LF
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:06:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675343173;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sMWywMnSzT3MdiDz3Seeibq+XuOIiSzHnNuegYJDB4c=;
 b=h35pvAHBTnnCSKkVQvaf5lAxdUXHjkJiFbMJ+H3iEgPCUF4jUIXEgtRs7OIROgtKRfYDxT
 nJpAD/SkmZQfIzzE0WoI+gL+7B140fOffyEQYL0mVBEk6KvmGQ92y1P/QfG/Wim6KjFznu
 zVo+vQvRedyMA6x2cRNsiKFe2lPzXsk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-110-WPbqrjKQOTu21fYNmGD6rQ-1; Thu, 02 Feb 2023 08:06:11 -0500
X-MC-Unique: WPbqrjKQOTu21fYNmGD6rQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 s7-20020a05620a0bc700b006e08208eb31so1280496qki.3
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 05:06:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sMWywMnSzT3MdiDz3Seeibq+XuOIiSzHnNuegYJDB4c=;
 b=xh2qsqOPC1moacua+OHGbi6Bn1QTVJdSvY1+hSFWIA3bwIyPwFleuSF5Tpypm597lU
 KI0djQs22HUe/XGTDie5z3itotQRfqO3tY2cH65y/mh9oyLabtZTbpNva2oi54EBoSS/
 4Zh+ZZN444etTMLZ9O8A8Tq2+Ct5q6BffrQZuPWsGlKo6KBdu6VJaHqw1inMLa6zw9vd
 wtiSgVgyGERuxd/bd2PAFpDVDPSzW6Fej2DtQfii70CZAnNM5rPl9FixfF6hgl81ELVm
 kq2KjkWzZYxENFqLpL4RCIirIsT8sx0tuexzX5cttaFcmKKIIjGKWEmDFKeU80dLOt9f
 8FOQ==
X-Gm-Message-State: AO0yUKVzJ3R8wdqwE/rrodLkESZp5tSlY33oU+Lt3XizjBtppwV2S4cM
 bK4DrbufoPCDLtqivZZmoK4BOuD0WR4cyE2J6tL1DzO+LE1GuC6LPbER8N/B0p6W2kyL3zx/+tT
 heRdGkqh/5T6YlHQ=
X-Received: by 2002:ad4:5dea:0:b0:53c:f76f:2e3c with SMTP id
 jn10-20020ad45dea000000b0053cf76f2e3cmr12466684qvb.46.1675343170950; 
 Thu, 02 Feb 2023 05:06:10 -0800 (PST)
X-Google-Smtp-Source: AK7set9tKaFwpHyw03/61T6vqP7Xh68ZRapJHv1kS38AUEtm0Ix9CEAh/RKM2UU/NbdYItrIO8vJBQ==
X-Received: by 2002:ad4:5dea:0:b0:53c:f76f:2e3c with SMTP id
 jn10-20020ad45dea000000b0053cf76f2e3cmr12466633qvb.46.1675343170554; 
 Thu, 02 Feb 2023 05:06:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 dt4-20020a05620a478400b006fb112f512csm7897269qkb.74.2023.02.02.05.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 05:06:09 -0800 (PST)
Message-ID: <355ed37b-9f21-942a-4eda-4ad4d7d0f73e@redhat.com>
Date: Thu, 2 Feb 2023 14:06:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PULL 08/34] hw/arm/virt: Let the virtio-iommu bypass MSIs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20200703165405.17672-1-peter.maydell@linaro.org>
 <20200703165405.17672-9-peter.maydell@linaro.org>
 <7592c27c-0c98-d52c-fecc-ac2b261ecbb3@linaro.org>
 <CAFEAcA8AXsXa7adhhmvMrh+kBoQx=tJ9PzizAnrgb=Db_vupGw@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA8AXsXa7adhhmvMrh+kBoQx=tJ9PzizAnrgb=Db_vupGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,
On 2/2/23 11:58, Peter Maydell wrote:
> On Thu, 2 Feb 2023 at 10:47, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>> Where is "len-reserved-regions" declared?
>   DEFINE_PROP_ARRAY("reserved-regions", ...)
>
> does this. For an array property "foo" the machinery creates an integer
> property "foo-len", which must be set first. Setting that
> then creates properties "foo[0]", "foo[1]", ... which can be set.

Yes. Thank you Peter!

Eric
>
> thanks
> -- PMM
>


