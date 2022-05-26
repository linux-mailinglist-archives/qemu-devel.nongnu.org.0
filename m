Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8EA534FB9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 15:01:15 +0200 (CEST)
Received: from localhost ([::1]:55106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuD75-00065Q-0b
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 09:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nuCaL-0001SS-2b
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:27:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nuCaJ-0003Qf-DB
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:27:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653568042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nrTQOOTW0bmDUXDN6mxa3gLlkwl1a9ANaXQ1WS9Hgm8=;
 b=RCF1xAsTq11OYTSOSFRHV6JJTihYAeVzRXzkf3/T1fa6ybFhrnW6LhO+G33vBRYB3WjHNN
 zUuSQtv+8wut3rtWpPlPg93svIs2dRs7k4nT1AtBGH7+3MSJ53QpaX8u7sLJUtnbCgZV+b
 4FwqMAcjma6c1qOyaXI3UihEkT7J75A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-nychKIfOMlelBaq-YoGeUg-1; Thu, 26 May 2022 08:27:16 -0400
X-MC-Unique: nychKIfOMlelBaq-YoGeUg-1
Received: by mail-ej1-f70.google.com with SMTP id
 tc8-20020a1709078d0800b006ff04b9bac4so755870ejc.15
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 05:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nrTQOOTW0bmDUXDN6mxa3gLlkwl1a9ANaXQ1WS9Hgm8=;
 b=jrNvhlU2Lm56aO+O+7U1Qlp7LCKxv42+lFiFf+J2Bw2gzI3reNW8+mob/quvN3KmvB
 L4u1mXTvgu01SNbY5vOiStFW0/xFHHFO6EY3kA5Vbciy0DRrN1N/G1OEFkEl+/Zollgq
 SAGBN4h4t9dlwlgMvjLECD8y296JX5LWB5tDxxPvwmAPIcoNnTJis+CRn4/QIFZ6kzfa
 gOMmGB83f/f6rLrrKhHIO6zjuMajbJv/+98q+ll/jfj3IRzeQNiNoBboio/zrwyr4psm
 WZgjSEBDrUC4pUvRAOEP9UfBvnCO1RPv3yaP6uUTMfyUmhkQ66lUBtJ1cU8UeDU6zoJf
 9YnA==
X-Gm-Message-State: AOAM530MJouVo1F31v5wIgot3An7AcJeQSmvn7dar4wqsTbjm7i5nDes
 /x6EQbXC2M8y/HKmhzWULp7sPdlKfAQls9XZF/PNSgUn8kWyQDzJiGM6x1H3uUVrly6FGHyx3qi
 vbeBQGy+C6Q3mxlA=
X-Received: by 2002:a05:6402:2382:b0:42b:7fec:1abf with SMTP id
 j2-20020a056402238200b0042b7fec1abfmr14711093eda.111.1653568035003; 
 Thu, 26 May 2022 05:27:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvUfEunANS5+5+fqm/+q3u2SEHTTy9RBRVbahcU+1fT3AbAsSwinfWsd7hO34WKdG3YZ7oFg==
X-Received: by 2002:a05:6402:2382:b0:42b:7fec:1abf with SMTP id
 j2-20020a056402238200b0042b7fec1abfmr14711069eda.111.1653568034813; 
 Thu, 26 May 2022 05:27:14 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a170906828500b006fec8e5b8a9sm465871ejx.152.2022.05.26.05.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 05:27:14 -0700 (PDT)
Date: Thu, 26 May 2022 14:27:12 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 ani@anisinha.ca, drjones@redhat.com, wangyanan55@huawei.com,
 Jonathan.Cameron@Huawei.com, peter.maydell@linaro.org, berrange@redhat.com,
 thuth@redhat.com, eduardo@habkost.net, lvivier@redhat.com,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 0/3] hw/acpi/aml-build: Fix {socket, cluster, core} IDs
 in PPTT
Message-ID: <20220526142712.3bab443c@redhat.com>
In-Reply-To: <5719fb28-0ab8-d8f8-c2c3-2e600451d6d8@redhat.com>
References: <20220518092141.1050852-1-gshan@redhat.com>
 <5719fb28-0ab8-d8f8-c2c3-2e600451d6d8@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
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

On Thu, 26 May 2022 19:37:47 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor, Yanan and maintainers,
> 
> On 5/18/22 5:21 PM, Gavin Shan wrote:
> > The {socket, cluster, core} IDs detected from Linux guest aren't
> > matching with what have been provided in PPTT. The flag used for
> > 'ACPI Processor ID valid' is missed for {socket, cluster, core}
> > nodes. In this case, Linux guest takes the offset between the
> > node and PPTT header as the corresponding IDs, as the following
> > logs show.
> > 
> > 
> >    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64    \
> >    -accel kvm -machine virt,gic-version=host -cpu host       \
> >    -smp 8,sockets=2,clusters=2,cores=2,threads=1
> >      :
> >      
> >    # cd /sys/devices/system/cpu
> >    # for i in `seq 0 15`; do cat cpu$i/topology/physical_package_id; done
> >      36  36  36  36  36  36  36  36
> >      336 336 336 336 336 336 336 336
> >    # for i in `seq 0 15`; do cat cpu$i/topology/cluster_id; done
> >      56  56  56  56  196 196 196 196
> >      356 356 356 356 496 496 496 496
> >    # for i in `seq 0 15`; do cat cpu$i/topology/core_id; done
> >      76  76  136 136 216 216 276 276
> >      376 376 436 436 516 516 576 576
> > 
> > This fixes the issue by setting 'ACPI Processor ID valid' flag for
> > {socket, cluster, core} nodes. With this applied, the IDs are exactly
> > what have been provided in PPTT. I also checked the PPTT table on my
> > host, where the 'ACPI Processor ID valid' is set for cluster/core nodes,
> > but missed from socket nodes.
> > 
> >    host# pwd
> >    /sys/devices/system/cpu
> >    host# cat cpu0/topology/physical_package_id; \
> >          cat cpu0/topology/cluster_id;          \
> >          cat cpu0/topology/core_id
> >    36 0 0
> > 
> > Gavin Shan (3):
> >    tests/acpi/virt: Allow PPTT ACPI table changes
> >    hw/acpi/aml-build: Fix {socket, cluster, core} IDs in PPTT
> >    tests/acpi/virt: Update PPTT ACPI table
> > 
> >   hw/acpi/aml-build.c       |   9 ++++++---
> >   tests/data/acpi/virt/PPTT | Bin 96 -> 96 bytes
> >   2 files changed, 6 insertions(+), 3 deletions(-)
> >   
> 
> Could you help to review this tiny series? Thanks in advance.
done, so far I'm not convinced that it's QEMU's fault. see comment on 2/3

> 
> Thanks,
> Gavin
> 


