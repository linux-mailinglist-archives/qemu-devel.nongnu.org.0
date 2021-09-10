Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0115740683D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 10:19:23 +0200 (CEST)
Received: from localhost ([::1]:33478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mObko-00016N-37
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 04:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mObjW-0007bH-MM
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 04:18:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mObjT-0007Sz-SR
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 04:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631261878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X7MUuk/lmbQBjiOz5XQ5oZ0/keF6sjNrAgAK+fRRA8A=;
 b=HbSfU29i2qcbVoGIWQtWodoMAHG9B6rIyM6XLPH9OWBm8xFMPVz6JDoM+b2BLjAlyptJtz
 0okWp1cMcJpqZYYIYZkW9D7rI3t05qAVwpJDiJOlMtnPuaTUcryA4y7JVCZb812C/3tab0
 MS+//9GDFxDxjLEH1Zhyb1MGpuSlrQU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-yz7kLxtjPQ2ZpRxEc7pPtA-1; Fri, 10 Sep 2021 04:17:55 -0400
X-MC-Unique: yz7kLxtjPQ2ZpRxEc7pPtA-1
Received: by mail-wm1-f70.google.com with SMTP id
 m16-20020a7bca50000000b002ee5287d4bfso424284wml.7
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 01:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X7MUuk/lmbQBjiOz5XQ5oZ0/keF6sjNrAgAK+fRRA8A=;
 b=KcRSBpulaERrE+FxuaWpSMXbq2jYbtHJCac+2BH4KI67Ak4RnyZDGiNaRpv+eVayhx
 +Ily4USg67xi6O8+M8sHYtp9uAGHRYCg3Zi4BlMC3HfVq4RfJnk+HooFmBUUHcJB8lDH
 U2P+oN4vJlvkmsa06sn761HPcWdMIVacDYyqso+tST1omYRQ/4QTpqLK8ZK4upziAiA/
 DReC8I7dWN8JaJEFMdd/DaXVuhqHfz6bQUyJGQT+3EFdBKXTWYRRmIEsvub7v9NPUPOa
 3DICYYDY6Ro0bV2VxJkPMo4PC4NItC5xL25WlNDB80FfBVLSfq9hXI9e+Vyz7QXu39O8
 DBEw==
X-Gm-Message-State: AOAM533/5e4M4BRFO0hd4BkVAr6Qm2UJ3RQFlYQhjCvJalN/Gi9k7jjD
 PwB9HmqTcK8CclMBOkFty/DriF7pwJu4YFSHMct7qrK+GcJBTAC4W8CzKBxU8D1/IPBvbsVJGf2
 fhqX4hEgn6BH0Y9o=
X-Received: by 2002:a1c:4e14:: with SMTP id g20mr7028885wmh.64.1631261873880; 
 Fri, 10 Sep 2021 01:17:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxagXIhTBt5xMt5vfSD1AqTL0m5rqdmENpOKhSeq2DmQZ6kbg0pQ2I6UtM2VllulxyRmmX85Q==
X-Received: by 2002:a1c:4e14:: with SMTP id g20mr7028861wmh.64.1631261873754; 
 Fri, 10 Sep 2021 01:17:53 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id k18sm3622047wmi.25.2021.09.10.01.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 01:17:53 -0700 (PDT)
Date: Fri, 10 Sep 2021 10:17:51 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v9 07/16] qtest/numa-test: Use detailed -smp CLI in
 test_def_cpu_split
Message-ID: <20210910081751.jptjdea3qhuu6jsa@gator>
References: <20210910073025.16480-1-wangyanan55@huawei.com>
 <20210910073025.16480-8-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210910073025.16480-8-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, wanghaibin.wang@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 10, 2021 at 03:30:16PM +0800, Yanan Wang wrote:
> Since commit 80d7835749 (qemu-options: rewrite help for -smp options),
> the preference of sockets/cores in -smp parsing is considered liable
> to change, and actually we are going to change it in a coming commit.
> So it'll be more stable to use detailed -smp CLIs in the testcases
> that have strong dependency on the parsing results.
> 
> Currently, test_def_cpu_split use "-smp 8" and will get 8 CPU sockets
> based on current parsing rule. But if we change to prefer cores over
> sockets we will get one CPU socket will 8 cores, and this testcase
> will not get expected numa set by default on x86_64 (Ok on aarch64).
> 
> So now explicitly use "-smp 8,sockets=8" to avoid affect from parsing
> logic change.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/qtest/numa-test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> index fd7a2e80a0..90bf68a5b3 100644
> --- a/tests/qtest/numa-test.c
> +++ b/tests/qtest/numa-test.c
> @@ -42,7 +42,8 @@ static void test_def_cpu_split(const void *data)
>      g_autofree char *s = NULL;
>      g_autofree char *cli = NULL;
>  
> -    cli = make_cli(data, "-machine smp.cpus=8 -numa node,memdev=ram -numa node");
> +    cli = make_cli(data, "-machine smp.cpus=8,smp.sockets=8 "
> +                         "-numa node,memdev=ram -numa node");
>      qts = qtest_init(cli);
>  
>      s = qtest_hmp(qts, "info numa");
> -- 
> 2.23.0
>

 
Reviewed-by: Andrew Jones <drjones@redhat.com>


