Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D495EA5CA
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 14:18:18 +0200 (CEST)
Received: from localhost ([::1]:56790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocn3w-0001mX-GX
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 08:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocmwp-0004IJ-9Z
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 08:10:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocmwk-0008OX-Ik
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 08:10:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664194247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2yg9OCoGIxDuLDVdJERA7y7zvrL2yMQf7rG6uzSLU/E=;
 b=C8uokeb+H6sr7IzFyUbsme4Ej6sG5s9uCQywmzpa8Szhehqb18uB9wGsfhvtghcegwiHAs
 ud+q39LQaeTAbNb/N83x2GLfpZ3PFQm8EyHdbuWzsBL/ClX4DO9z+xEOr4xPim6IwuhBO1
 FU9s7sST/mg08wt1+AKonucGjRow25Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-418-Bmw6617aMx6YOc3aieFqIw-1; Mon, 26 Sep 2022 08:10:45 -0400
X-MC-Unique: Bmw6617aMx6YOc3aieFqIw-1
Received: by mail-wr1-f72.google.com with SMTP id
 v7-20020adfa1c7000000b0022ae7d7313eso1094712wrv.19
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 05:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=2yg9OCoGIxDuLDVdJERA7y7zvrL2yMQf7rG6uzSLU/E=;
 b=Mko6QT2BHt5vI4L8um5wAme3P1Xut8CasrA/FNW9ASDu18YhOCiIWnWYZq35TGc8Cm
 YiSaMsSGr6QkTe7gi0RuTwB0xn1tHO+x7kx89jR6n3Ce1Xdd4POlSM0MovsVLaIrsr3X
 ygG+d24mWanHMF++6xRZIUnw4+w6qdUuU04ZpiahUDarEehhyepWOx1ojvrOrC/ZSj3w
 X4GLaPfuRK4FtmF0x8qFr7wKl0CD8TBTtdUkr83DblTN4LNaeUWSSQmbuxObT9zevTGQ
 Y4wyKDY9YLOwSTYRxxibeIISYw2yrP+SDw5i2jNjoI1rjlgrVoHZqW/1Z81XYRrO6b/k
 6Trg==
X-Gm-Message-State: ACrzQf23oC1v33dA1LZFHex4F56rJcFKIpGIr6EZZGHGTRgHZkwvFg9W
 BStdU2xdtsuDXnM53dfNmZnSvrSUakSdD+gE+TPa0VOGG/Y2Q/KXk4wfL17pQ2HhPkFYW2NfEaV
 JnEiwQFqSRWqX1k8=
X-Received: by 2002:a7b:c4cc:0:b0:3b4:757b:492f with SMTP id
 g12-20020a7bc4cc000000b003b4757b492fmr22265038wmk.74.1664194244619; 
 Mon, 26 Sep 2022 05:10:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7CEIs0cOXB8dnaVxHZOBB/AJo2qtnKkhvVeizGcOZBZ2inraHjDUVMSGzuplvR3oQ0n7cK7g==
X-Received: by 2002:a7b:c4cc:0:b0:3b4:757b:492f with SMTP id
 g12-20020a7bc4cc000000b003b4757b492fmr22265023wmk.74.1664194244386; 
 Mon, 26 Sep 2022 05:10:44 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-251.web.vodafone.de.
 [109.43.177.251]) by smtp.gmail.com with ESMTPSA id
 y5-20020a5d6145000000b00226dedf1ab7sm13871165wrt.76.2022.09.26.05.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 05:10:43 -0700 (PDT)
Message-ID: <a6d7a7f7-bb11-c689-3aca-91bd97cc60fc@redhat.com>
Date: Mon, 26 Sep 2022 14:10:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 01/54] tests/qtest: i440fx-test: Rewrite
 create_blob_file() to be portable
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-2-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220925113032.1949844-2-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 25/09/2022 13.29, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Previously request_{bios, pflash} cases were skipped on win32, mainly
> due to create_blob_file() calling mmap() which does not exist on win32.
> This rewirtes create_blob_file() to be portable, so that we can enable
> these cases on Windows.
> 
> Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> Changes in v3:
> - Remove unnecessary "error = NULL" statements
> 
> Changes in v2:
> - new patch: "tests/qtest: i440fx-test: Rewrite create_blob_file() to be portable"
> 
>   tests/qtest/i440fx-test.c | 54 ++++++++++-----------------------------
>   1 file changed, 14 insertions(+), 40 deletions(-)

Nice clean-up!

Reviewed-by: Thomas Huth <thuth@redhat.com>


