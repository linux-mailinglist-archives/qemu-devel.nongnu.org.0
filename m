Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6BC2F4D19
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:29:35 +0100 (CET)
Received: from localhost ([::1]:51924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzh9S-0005E0-Bi
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:29:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kzgxn-00054X-Qg
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:17:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kzgxi-0008Sq-Ou
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:17:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610547446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qsKgoSsBPHBafxq+IO1/8gsOoDt/jc36Bb72jePkO88=;
 b=EalX6Tk0tYmMG1lMJfoQiEgo0xZyTp4Ube1FdzFvje9zns3DgwPna/dNMzxoSGyx42gTHn
 ZTWNBctayFIFRLdVDOSBCduETIW37JSoMlPhAhY1CjrRzzlmKMYC2ikYxMswbSGvHUCm7M
 iOBA5C3U6czaFKDDgcBxfa2uEkvsz4c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-b5OymlsGMIGFYoR3ghOFkQ-1; Wed, 13 Jan 2021 09:17:24 -0500
X-MC-Unique: b5OymlsGMIGFYoR3ghOFkQ-1
Received: by mail-wm1-f69.google.com with SMTP id r5so888390wma.2
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 06:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qsKgoSsBPHBafxq+IO1/8gsOoDt/jc36Bb72jePkO88=;
 b=Oy4jQO7ohruUHV3kLBHOnezmnw3MKYvCCRyoMpTKb3ggAnKzcZl2qodFXvtZv/tX4S
 OlDjJU2Q/PpaU1V7YpKGmdJxiBIMY2YDW4ZF/iuBedCWYJeqjQg7rrt/PG9t2e8VaUoQ
 16/6ktbsc4jWRs/8Prh4LSO6tulGw/9EcayrbJICnI6oiAEFZW1Qrfx0I5nkHKWWhiQK
 qGaf0jZ6H7GdR80AznymMbm9laeTk3hp/rkCr/avU3jVVjr1R08dNZDrFcdMUW6xUZIx
 34CwvjaAHPCp97/c5coKxHRGI3vS2NnyMDxr6j9ECLtnfA9Xq0SFsEkWJKel3a6igSox
 RmzA==
X-Gm-Message-State: AOAM5331U+D7Y741nl8ih5xw8dl5qFfCWyQE4qFglV6vuM8hsm5sZTIX
 puRGfHWPKtYvDWVn5g2V40CL5itvOxxMzsiU5juZ/zykjriQsBwX6G1Tb/Zy7TgTAZ6iBYBHTIh
 ZXp1MW0vtVQVuUt8=
X-Received: by 2002:a7b:c145:: with SMTP id z5mr2416572wmi.164.1610547443421; 
 Wed, 13 Jan 2021 06:17:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyA92qztUUeMjCjpKpMkyM9ERkrG2eeoO8uqsj4wo3xf4dM9HGEPbXyIwOFnuknGIsNVVfwiw==
X-Received: by 2002:a7b:c145:: with SMTP id z5mr2416539wmi.164.1610547443116; 
 Wed, 13 Jan 2021 06:17:23 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id u6sm3960698wrm.90.2021.01.13.06.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:17:22 -0800 (PST)
Date: Wed, 13 Jan 2021 09:17:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Marian Posteuca <posteuca@mutex.one>
Subject: Re: [PATCH v3] acpi: Permit OEM ID and OEM table ID fields to be
 changed
Message-ID: <20210113091555-mutt-send-email-mst@kernel.org>
References: <20201230221302.26800-1-posteuca@mutex.one>
 <20210106182430.6bf1823a@redhat.com> <87bldvldsl.fsf@mutex.one>
MIME-Version: 1.0
In-Reply-To: <87bldvldsl.fsf@mutex.one>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 11, 2021 at 04:59:54PM +0200, Marian Posteuca wrote:
> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > overall looks good.
> > Please add a test case for it, see
> > tests/qtest/bios-tables-test.c for description how to do it
> > an/or at
> >   "[PATCH v3 08/12] tests/acpi: allow updates for expected data files"
> > and follow up patches on the list.
> When you say add a test case, do you mean only updating the binary
> files in tests/data/acpi/{microvm,pc,q35,virt} according to the steps
> at the start of the file bios-tables-test.c? Or do you also mean an actual
> test case to be added in bios-tables-test.c?
> 
> Also the step 6 described in bios-tables-test.c mentions that the diff of
> the ACPI table must be added to the commit log, but my change touches
> all the tables for all architectures so that would mean that I would
> have to create a huge commit log. How should I approach this?

If the changes are the same, you can just write:
the change is the same across all architectures,
and show it.

Something I just tripped over: make sure not to
include "---" lines in the diff. Otherwise git am
can not apply the resulting patch.

-- 
MST


