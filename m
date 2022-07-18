Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4360A5785A8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:41:32 +0200 (CEST)
Received: from localhost ([::1]:45424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRwB-0004Zb-CH
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRQA-0007Fe-Ik
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:08:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRQ9-0004Sd-8M
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:08:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658153304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fjBX/M3VUQYW/3IstOcq0FchP7CfVgdwV5UVREED5xA=;
 b=CZhoiBwIc2h7jZcvr/GkdLiQmAEMDAYTVersHMPjCwkJkH94we2ofRQa5p92A8M65aJLPs
 aURiX96EflRm+awlXSCkcECtsaszP2yKiJwr9t4OUm2CVvfkXKkt70u9bqUVrGpB6JJQER
 /EupSvR7LaHf6t5kP0QBPIr7oV+SiFU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-qbWly9n4OLecbBO-3YWKkQ-1; Mon, 18 Jul 2022 10:08:23 -0400
X-MC-Unique: qbWly9n4OLecbBO-3YWKkQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 w15-20020a056402268f00b0043ac600a6bcso7900344edd.6
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 07:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fjBX/M3VUQYW/3IstOcq0FchP7CfVgdwV5UVREED5xA=;
 b=W8xjVDWCx7TBpJP0Hb/UspPwWpMY3ilKpOjSBOhJ3rKWS5bJCQemxVSZuo+RU9WSTo
 8g+0iJjBjFGjReYOqDBoXod0GTsKcxfhIpHJzhhRivfXSrhTnBEt+P+7SN/BDf1/ZCIw
 GTn4+74RzL79FAWFlPOWt5rZOq4VBLr/a0QPcW8wJYhlykwW5kTXb7HCSAakP+EC11xx
 jG+63LFbAS7QqBjz6LjCoQTini6SzTRZirQYwQMrHaf5c+SuqjLRNqfEa9DcZgXBXTZT
 aHEGER6knr69qOlAAopJNZISWGetBGont605Y8lOqNmqxCjBlJWHP2o1Osuz3B9q97w3
 tNag==
X-Gm-Message-State: AJIora+ogUdUfYm/RF3uwW3HhyfpM/hKGEWeyvmVbytxO8Ma3AxzUYko
 QkR+H1Vz2XlKyh2YGvzJjF7R0gnSuQKTPLg1LYfk0G17oqSrAbiuXtVEPqxvw0igSv7znaW3Y4B
 y7Fx6q+i16sud3lo=
X-Received: by 2002:a05:6402:51ce:b0:43a:d409:b3e8 with SMTP id
 r14-20020a05640251ce00b0043ad409b3e8mr36889869edd.166.1658153287100; 
 Mon, 18 Jul 2022 07:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v6rRvT78ot8W7xBOhot9wJxQX6OlxoT+9LhLj0gLqiSrzLlxPObp4GsceKIszB4I0Oe/D0ww==
X-Received: by 2002:a05:6402:51ce:b0:43a:d409:b3e8 with SMTP id
 r14-20020a05640251ce00b0043ad409b3e8mr36889638edd.166.1658153284788; 
 Mon, 18 Jul 2022 07:08:04 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a170906d11200b0072b4e4cd346sm5486158ejz.188.2022.07.18.07.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 07:08:04 -0700 (PDT)
Date: Mon, 18 Jul 2022 16:08:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Hesham Almatary <hesham.almatary@huawei.com>
Cc: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>,
 <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <wangyanan55@huawei.com>, <marcel.apfelbaum@gmail.com>,
 <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, <mst@redhat.com>
Subject: Re: [PATCH 4/8] tests: acpi: q35: update expected blobs
 *.hmat-noinitiators
Message-ID: <20220718160803.06febe5b@redhat.com>
In-Reply-To: <20220711104436.8363-5-hesham.almatary@huawei.com>
References: <20220711104436.8363-1-hesham.almatary@huawei.com>
 <20220711104436.8363-5-hesham.almatary@huawei.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jul 2022 11:44:32 +0100
Hesham Almatary <hesham.almatary@huawei.com> wrote:

> From: Brice Goglin <Brice.Goglin@inria.fr>
> 
[...]
> Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
> ---

>  tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
[...]
>  tests/data/acpi/q35/FACP.acpihmat-noinitiator | Bin 0 -> 244 bytes
drop these 2 tables, they are the same as default ones (i.e.without suffix)
so test will fallback to default ones when there is no matching file with suffix.

also fixup 2/8 to account for that

>  tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
>  tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h   |   5 -----
>  6 files changed, 5 deletions(-)


