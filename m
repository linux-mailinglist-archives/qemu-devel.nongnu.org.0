Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B4F41AD57
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 12:54:17 +0200 (CEST)
Received: from localhost ([::1]:35908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVAka-00032q-Px
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 06:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAhh-0006wL-KZ
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:51:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAhd-00023y-5d
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:51:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B4QN6ffkNwssEPSKL8eMRkp+TnFcUhVX73cjOE6tgSE=;
 b=h+jlU+mfSZ9xpt0a7Q+L9voiMBIWgXLEtRH6FCIhGq5vbFqc0aVDkOU5vqhVrT6CN2l3/Y
 OqOLHJi+KOBcTpBjr82q0NUeIghm54qSp1/xesDo7TTCTOWrHfFXZmdHbjqUyd4jhPnAnB
 AWDIihenJvAS/DJ9uym8u38I2Vf0b0Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-qcP6qzvwPI2ML4dj1SidQA-1; Tue, 28 Sep 2021 06:51:04 -0400
X-MC-Unique: qcP6qzvwPI2ML4dj1SidQA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so1820346wma.4
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 03:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B4QN6ffkNwssEPSKL8eMRkp+TnFcUhVX73cjOE6tgSE=;
 b=CbUF2YXWZ+7lXbzXniaJsLehzY0w4cq7NhfdJKwVhMHU0IINPbhY5DZtdonBE+NRxr
 z48C9bhylXmwjQcOxxj/G3CveCZU6+u+vJyrSn+Ql4ZCOcVQ7DwnhtaPgG7tzqRHinUe
 BS/9ROFg3flsJVqYYTQYxuUnP98KoeT940C28EqSecNQBT5K0Dl6zJXfddmPAp8XK+Wm
 mVTaqP/597u5yqaatMdSDrOCTuNKzR8HxAf+h/Pn8VIDfUqlF16WVQEfxAOinEpm4Juh
 p+xqHIugvnPK7gkWtTM7PH6E4iYXQCpzlrHF/B5m3HOVtuVLMscX09JMOZhZ/LFsHOo9
 PevA==
X-Gm-Message-State: AOAM532TG85r0y+qLZxaav7HggkZqPQx1nfNAYNWXZxe5OCl9TLEQehA
 PLUJgFDdGtxyIHM7iE6k0tElA1jeV9Adrb32aSO3BNcEEz9PxwKe26VzZ/8u8iEZ/Bhmgd0h7mF
 T+PmGpe+BrwzpP/U=
X-Received: by 2002:adf:de02:: with SMTP id b2mr5832915wrm.42.1632826263358;
 Tue, 28 Sep 2021 03:51:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5b4qbF41yZIZaouJ9jIx10OiEzZsddN57n6hSwBfP2mtVmUl64dFhlkn/I9doqwDag3AkJQ==
X-Received: by 2002:adf:de02:: with SMTP id b2mr5832891wrm.42.1632826263219;
 Tue, 28 Sep 2021 03:51:03 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id y11sm23401304wrg.18.2021.09.28.03.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 03:51:02 -0700 (PDT)
Message-ID: <643d326d-ab10-9ea0-f9e0-5cca32a8fbc5@redhat.com>
Date: Tue, 28 Sep 2021 12:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v11 06/14] qtest/numa-test: Use detailed -smp CLIs in
 pc_dynamic_cpu_cfg
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-7-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210928035755.11684-7-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.562,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 05:57, Yanan Wang wrote:
> Since commit 80d7835749 (qemu-options: rewrite help for -smp options),
> the preference of sockets/cores in -smp parsing is considered liable
> to change, and actually we are going to change it in a coming commit.
> So it'll be more stable to use detailed -smp CLIs in testing if we
> have strong dependency on the parsing results.
> 
> pc_dynamic_cpu_cfg currently assumes/needs that there will be 2 CPU
> sockets with "-smp 2". To avoid breaking the test because of parsing
> logic change, now explicitly use "-smp 2,sockets=2".
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
>  tests/qtest/numa-test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


