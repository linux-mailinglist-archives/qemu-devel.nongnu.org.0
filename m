Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAB04C27C3
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 10:14:48 +0100 (CET)
Received: from localhost ([::1]:55822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNAD1-0002wJ-Ib
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 04:14:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNA0Q-00043e-8A
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:01:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNA0N-0002NT-L6
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:01:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645693302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FqSLDGhn+oTkmLdc5sWjBNWSQ1GqXJVnqHo6LxWAPY4=;
 b=Qmv8Wnfce/KsMMBRqoqwK/cOih5jpR8gH2sZmiuPEY1bPApOFczOTM2P+dW2JuosD4nxdJ
 CjkmuMufZbHEmEB9yI1zrFl9FjR5OimMA/XBIimjTPICP5VRk8ZbubYk03N/QcjV7hBBHX
 DsdnIiOKnA8HnRP4HGyhh/i0DZFrT/k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-IRfuSvX_M_Gzc-ZWjRF--g-1; Thu, 24 Feb 2022 04:01:41 -0500
X-MC-Unique: IRfuSvX_M_Gzc-ZWjRF--g-1
Received: by mail-ed1-f70.google.com with SMTP id
 e10-20020a056402190a00b00410f20467abso433136edz.14
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 01:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FqSLDGhn+oTkmLdc5sWjBNWSQ1GqXJVnqHo6LxWAPY4=;
 b=wc5zRAzKuSmLvIF2v/eCP0Wa7vNYF6VYybuzocPUTZZhvxt+1yRMdHFRXQxktsIbns
 v1e0294Jo9r5oJhrDsBRIjlsFu4uQAGSqNsm1t1FugCYSM+LAHX2doTW8O73GiX3x50M
 Dkozw0E2E/QaGhOFL4BQSiX7n279RE5ttVTLRkAy2/FPh7PSOPfHMaFmXRXP5BV1RPuM
 /r55PNoa3zklAYV6g5XbDMlei1vvry5GeQEeH6I26zm1Pwz7g7WBVh5B3LqXeAX3LNgF
 75MsejY58YjxmU11LsLZq9LvHUkeSMqNH/dj1VvxoNZsudihsnPlbQnX8WAfvjY5x0MX
 lb0Q==
X-Gm-Message-State: AOAM531CEmaZnhHeFIKxnN1h+f9EYJGG0+vabJ4A5yPXDrlknYBJm0Ao
 VGxBLVTkTsFY2sZEo3LXyaUQcWVgetYU94rnBmxxWfRZhUdt/Zznfe6gX7hvO3HBqy3PcSHDiRx
 D4AUmasgnCMBAfCA=
X-Received: by 2002:a05:6402:358c:b0:412:e44e:f62c with SMTP id
 y12-20020a056402358c00b00412e44ef62cmr1349135edc.206.1645693300518; 
 Thu, 24 Feb 2022 01:01:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCkA+SwacVcR6f1NSPV1mj5KzJBpPghScxQdfgTKYTp1dCYM6HEADNm9B36J+avj8lW69DFQ==
X-Received: by 2002:a05:6402:358c:b0:412:e44e:f62c with SMTP id
 y12-20020a056402358c00b00412e44ef62cmr1349102edc.206.1645693300261; 
 Thu, 24 Feb 2022 01:01:40 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id i14sm1006251ejp.181.2022.02.24.01.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 01:01:39 -0800 (PST)
Date: Thu, 24 Feb 2022 10:01:38 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFCv2 3/4] i386/pc: warn if phys-bits is too low
Message-ID: <20220224100138.0ddab7b9@redhat.com>
In-Reply-To: <04efb316-e231-7abd-0eb6-5b0241afd5f2@oracle.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-4-joao.m.martins@oracle.com>
 <20220214160325.62b6436d@redhat.com>
 <f627c202-5281-affb-c439-ea394c3ab70a@oracle.com>
 <04efb316-e231-7abd-0eb6-5b0241afd5f2@oracle.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Feb 2022 17:18:55 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 2/14/22 15:18, Joao Martins wrote:
> > On 2/14/22 15:03, Igor Mammedov wrote:  
> >> On Mon,  7 Feb 2022 20:24:21 +0000
> >> Joao Martins <joao.m.martins@oracle.com> wrote:
> >>  
> >>> Default phys-bits on Qemu is TCG_PHYS_BITS (40) which is enough
> >>> to address 1Tb (0xff ffff ffff). On AMD platforms, if a
> >>> ram-above-4g relocation happens and the CPU wasn't configured
> >>> with a big enough phys-bits, warn the user. There isn't a
> >>> catastrophic failure exactly, the guest will still boot, but
> >>> most likely won't be able to use more than ~4G of RAM.  
> >>
> >> how 'unable to use" would manifest?
> >> It might be better to prevent QEMU startup with broken setup (CLI)
> >> rather then letting guest run and trying to figure out what's
> >> going wrong when users start to complain. 
> >>  
> > Sounds better to be conservative here.
> > 
> > I will change from warn_report() to error_report()
> > and exit.
> >   
> 
> I was running through x86_64 qtests prior to submission
> and it seems that the inclusion of a pci_hole64_size in
> the check added by this patch would break tests if we were
> to error out. So far, I'm keeping it as a warning over
> compatibility concerns, not limited these 5 test failures
> below. Let me know otherwise if you disagree, or if you
> prefer another way.

can you check what exactly breaks tests?

> Summary of Failures:
> 
>  1/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/qom-test               ERROR           0.07s
>   killed by signal 6 SIGABRT
>  4/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-hmp               ERROR           0.07s
>   killed by signal 6 SIGABRT
>  7/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/boot-serial-test       ERROR           0.07s
>   killed by signal 6 SIGABRT
> 44/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-x86-cpuid-compat  ERROR           0.09s
>   killed by signal 6 SIGABRT
> 45/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/numa-test              ERROR           0.17s
>   killed by signal 6 SIGABRT
> 


