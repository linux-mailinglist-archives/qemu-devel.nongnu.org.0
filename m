Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF81D3A9B76
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:05:18 +0200 (CEST)
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltVEL-00067O-Qw
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltV9r-0002yy-CI
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:00:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltV9l-0007ZB-2i
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623848432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fuHxE5gDo7/XbdAnGnxyp1NMDngxtAIZPGLpI3m59ok=;
 b=Zv+eFP5pSp4YsKJTbYqElNElGFlx+t/0VLcbl1iDErFntcgW6FKKYKG8GoN8ipyIFTA+4j
 Q4uclkUOwOGLLyFi02NbpOgNcgBXXQOPmoVDx6fWR8gRNT1/jWTUuEbdhGc2V1oyi3qrXt
 TsXjWS1CPWUm4Vw5SiS36gucymploFA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-HNLFDp47Ng6KpZrC55aQjA-1; Wed, 16 Jun 2021 09:00:30 -0400
X-MC-Unique: HNLFDp47Ng6KpZrC55aQjA-1
Received: by mail-ej1-f71.google.com with SMTP id
 j26-20020a170906411ab02904774cb499f8so640698ejk.6
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 06:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fuHxE5gDo7/XbdAnGnxyp1NMDngxtAIZPGLpI3m59ok=;
 b=Bm61Ss9xFwl3yL0wNOQHUJLZm648K4Io4PLrjcK2nJR4Jh90DHz+aXccyKjc0bm1L3
 nLEXQZcGzLRZPFYLHlIF24eN67SShQ1/hHa2vlT6ZzqtccdgC2elMUk5Bz+VDHBAU2Aw
 XjfegvkAsWoyjEcHTUBsivJ4Xz+Pj1Ku5/OBOOby/SSfEOssEQ49Mxkh2R2UgR5ERby9
 INlOTJGx1cbuRyndujk7/8OP5noX1nc5vsy7Dt3L+UuxFAiFoH5huMW/rVcvoKQaegpf
 JFZxHKqh/3YQatNubEXsiGdU4iqUpMOTnDzpWJWSGzdkAy6zvMPtkmFapW1kVzQBmXYF
 PSJQ==
X-Gm-Message-State: AOAM530tmutch2XfOBhX8uBKh9k6iFI52OU0cAVO+Mt7QN9nix1xjaMP
 3pYhtsydm8zlLFuWWEb5gNonG/x3e42TOHbh1wG/T5Hi6lACIRBQrHYucMuQftFOdo/aKBr4SbM
 H/16MbUUWRE1SaM4clkkyGWjfrfnSutYXHEqow3SYBAzJIl1ysbhLyiv3WVdFnHR5jaQ=
X-Received: by 2002:a05:6402:27d0:: with SMTP id
 c16mr2854753ede.60.1623848429383; 
 Wed, 16 Jun 2021 06:00:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrxYC2bmypwoZ061srBPyAMYS7YauMDfWSkEZokQ+R392igvvnwDRJf5HpKR/IZYuyE823zw==
X-Received: by 2002:a05:6402:27d0:: with SMTP id
 c16mr2854720ede.60.1623848429112; 
 Wed, 16 Jun 2021 06:00:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j1sm1126394eds.27.2021.06.16.06.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 06:00:28 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] target/i386: Start fixing kvm-unit-tests for svm
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210616123907.17765-1-laramglazier@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b6efbb2b-f8e3-216d-71c2-27d0d851d723@redhat.com>
Date: Wed, 16 Jun 2021 15:00:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616123907.17765-1-laramglazier@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.17, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/06/21 14:39, Lara Lazier wrote:
> Following the APM2 I added some checks to
> resolve the following tests in kvm-unit-tests for svm:
> 
>    * vmrun_intercept_check
>    * asid_zero
>    * sel_cr0_bug
>    * CR0 CD=0,NW=1: a0010011
>    * CR0 63:32: 180010011
>    * CR0 63:32: 1080010011
>    * CR0 63:32: 10080010011
>    * CR0 63:32: 100080010011
>    * CR0 63:32: 1000080010011
>    * CR0 63:32: 10000080010011
>    * CR0 63:32: 100000080010011
>    * CR0 63:32: 1000000080010011
> 
> v1->v2: introduced cpu_svm_has_intercept to avoid defining bitmasks for
>          intercepts
> 
> Lara Lazier (4):
>    target/i386: Refactored intercept checks into cpu_svm_has_intercept
>    target/i386: Added consistency checks for VMRUN intercept and ASID
>    target/i386: Added consistency checks for CR0
>    target/i386: Added Intercept CR0 writes check
> 
>   target/i386/cpu.h                    |   5 ++
>   target/i386/svm.h                    |   2 +
>   target/i386/tcg/sysemu/misc_helper.c |   9 ++
>   target/i386/tcg/sysemu/svm_helper.c  | 127 ++++++++++++++++-----------
>   4 files changed, 93 insertions(+), 50 deletions(-)
> 

Looks good.  I fixed the small issue in patch 1 and queued it, thanks. 
It will appear in a pull request later this week.

Paolo


