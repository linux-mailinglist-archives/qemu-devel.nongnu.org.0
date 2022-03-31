Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FDD4ED982
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 14:19:04 +0200 (CEST)
Received: from localhost ([::1]:33272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZtlX-0001Hp-5v
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 08:19:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZtWe-0007ZY-BM
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 08:03:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZtWb-0001z5-KK
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 08:03:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648728216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JLgYnDfljMvooIYuiGfBx+Yv1CFeOjBII1QAKft3+rc=;
 b=b5SfJSeMduNKXOeU+cQPAuBNYN3kxf/TROT6/D1NRpxzc2I4MKafgJjAf0yIxCvefqKnrK
 zfSJ5TeOuEwG+dwR7HajfY9k1B78pRz78GLZxhWc1sOny8GAbArh7Phu4h29boD901E04Y
 w10aXa5yOpJSZcCU4oT/I8m5uzLt0Ts=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-uJwkQ8OHNl-hNcOH-ExNCw-1; Thu, 31 Mar 2022 08:03:29 -0400
X-MC-Unique: uJwkQ8OHNl-hNcOH-ExNCw-1
Received: by mail-ed1-f71.google.com with SMTP id
 x1-20020a50f181000000b00418f6d4bccbso14865379edl.12
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 05:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JLgYnDfljMvooIYuiGfBx+Yv1CFeOjBII1QAKft3+rc=;
 b=bCC6HiCqoAt83zhFqc7V39MxOiyNuu9T6RpMM7ZhVjfbfnkbZnB5PMcjRWeoG6W+Od
 wDvYvRMOZnIqj7cWabsVVUPNwK5H3ZLFEEAmA/KYl1HGmJbxdoclgH0toLa44+KiUO8Z
 RquYjskEwblDqPqKBYPmmebI4dJZVQ7dIJNI5ZY/pTHFqGOLXDiNF5X2pK95Gzn4F1a6
 Qiyg1U/vaEnq04bhB1W15SfNUKjoNA2W0tufHokTUouZGhR2Y3WuelC+2b2lJLRU+DKv
 hwD/zc7OszfdtGYRDer6nsLCWjVzCKxE3hkqd5+8BOA6HuDRElPCP2cmIVRDUL3ojWkU
 rLCg==
X-Gm-Message-State: AOAM5322VKG2Ero6Zn+UtzEVZEIonPsk8Dt7c87ifi29zArAcoeUn2J1
 3qSRaEjn4sWLDK4IXZGTNEg2kMvMiJN8aCUjRdkDaiuyqJmzfU0PKD/LkQ0zKFIubalqoZYHiu2
 cbk6mGJ2gK3ig+qk=
X-Received: by 2002:a17:906:4fc7:b0:6da:92b2:f572 with SMTP id
 i7-20020a1709064fc700b006da92b2f572mr4732656ejw.184.1648728208065; 
 Thu, 31 Mar 2022 05:03:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4H2tZxpNtKpztd5mC8NMc7c/aXiDuMG+ZmWxFs4VLjJAomzJ3FpN+Ay/xrFK4PCPAFgs+rg==
X-Received: by 2002:a17:906:4fc7:b0:6da:92b2:f572 with SMTP id
 i7-20020a1709064fc700b006da92b2f572mr4732624ejw.184.1648728207781; 
 Thu, 31 Mar 2022 05:03:27 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 hs12-20020a1709073e8c00b006dfd7dee980sm9390783ejc.30.2022.03.31.05.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 05:03:27 -0700 (PDT)
Date: Thu, 31 Mar 2022 14:03:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Subject: Re: [PATCH 0/2] Init vNVDIMM LSA if applicable
Message-ID: <20220331140325.5fc23fd8@redhat.com>
In-Reply-To: <1648537663-126032-1-git-send-email-robert.hu@linux.intel.com>
References: <1648537663-126032-1-git-send-email-robert.hu@linux.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, jingqi.liu@intel.com,
 qemu-devel@nongnu.org, ani@anisinha.ca, robert.hu@intel.com,
 dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Mar 2022 15:07:41 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> QEMU option "-device nvdimm,...,label-size=" designates a vNVDIMM with
> Label Storage Area (LSA), where stores the namespace labels and conforms to
> some format and rules defined by NVDIMM label protocol[1].
> 
> Recent guest Kernel, will by validating LSA to determine if the NVDIMM is
> label-capable. So without initialization, guest Kernel will judge it
> label-less, though it actually support label.
> 
> This patch set, is to init vNVDIMM's LSA, so that guest Kernel can
> correctly identify and use it.
> 
> [1]:

> https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf,
> Section 13.19.
perhaps there is a typo here,
In above spec, chapter 13 is "ACPI SYSTEM MANAGEMENT BUS INTERFACE SPECIFICATION"
and there is only 13.1-13.3 there.

> 
> Robert Hoo (2):
>   NVDIMM: rename NVDIMM::label_size to NVDIMM::lsa_size
>   NVDIMM: Init vNVDIMM's LSA index block if it hasn't been
> 
>  docs/nvdimm.txt         |   4 +-
>  hw/acpi/nvdimm.c        |  14 +-
>  hw/mem/nvdimm.c         | 381 ++++++++++++++++++++++++++++++++++++++--
>  include/hw/mem/nvdimm.h | 108 +++++++++++-
>  4 files changed, 485 insertions(+), 22 deletions(-)
> 
> 
> base-commit: 27fc9f365d6f60ff86c2e2be57289bb47a2be882


