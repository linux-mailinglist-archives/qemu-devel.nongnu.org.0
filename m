Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314AF6E17C1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 00:55:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn5ou-0002OC-IH; Thu, 13 Apr 2023 18:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <35Ic4ZAsKCv0fhpjwqj3ysllttlqj.htrvjrz-ij0jqstslsz.twl@flex--ackerleytng.bounces.google.com>)
 id 1pn5os-0002Nm-AU
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 18:53:34 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <35Ic4ZAsKCv0fhpjwqj3ysllttlqj.htrvjrz-ij0jqstslsz.twl@flex--ackerleytng.bounces.google.com>)
 id 1pn5on-0005cW-20
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 18:53:34 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 19-20020a630113000000b0051b61a0035bso664521pgb.10
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 15:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681426404; x=1684018404;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=z8guo045Q+5eAEwhfUr30hz0PJkqMwxW7HV3gxeLbUM=;
 b=Rjwp4Xdm6ZLaEPgG8cQHjLF9ituKkBuE4Kg1flS/uBoAlJ5LElw7Yfif+urjga4Z1k
 Id9XGYBIPjUILBU5HRcXu81p8pDXA/u7T7lfZ53bFi0pGFkAASoZMc1FKWQlhEzWj7g7
 M8ApiMQugbqBdsiM2beP1Zmsfm7UP5aAC4H3s81SX9hYygeAlfdJWkF78OhRMgmv5bOY
 YVoHszS0N47VwRyOsgUt/J/+QeiNlvAv36oX5BxahWlc22nXKEGI9AqKs9w9dhKamSyI
 7JyyYvDzq5fdoA1a6pagi9+JsHhlJPaWALPTL0IkyyyP5IWH3eftfLt0+7o6zZeS826/
 vf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681426404; x=1684018404;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z8guo045Q+5eAEwhfUr30hz0PJkqMwxW7HV3gxeLbUM=;
 b=WytAIpzYUie8k4AAuPqxKxzerXA1eLWJirK+KShRbzmeVfwib9AF6IIvClq/6NdbXn
 +FgA+xouC9kVHVi1bAwmVR4UeM0/oHmQA5apHlAzCKsYlm+kKesZ2+cpMZRTW9MfZFnr
 EV5I/qG+9/5kgkVH3b9TvZ99aIP+/MiRjoUQX++RPw9r0c1R9u4eMc0yAYglqMv6a3kP
 csh/AeWUL14RexJPY2Y3429QacBMEnrauOUkyYzM7Xnx1LwaurK5uX2Xf8qYZHMPg5kk
 0HDIv2qnnltITnNoKSyIx6GX0lDEbuUVNNqwyQRSKGet8A7W64eg3h74SnHejMAcSoxq
 1NlA==
X-Gm-Message-State: AAQBX9d745Ywn6Z6SpsOWjkj2eQc6ERZ1Pa/9oAvjH7jtpEZBZwIfhhk
 G0xKJP2fUWvmbC+TCl4QjXrEX5cMLCfceTkQNQ==
X-Google-Smtp-Source: AKy350ZDf9SfJRuS6hlT3xzlEOA5lECkBtR1nsxMCxij1QGPtfZHXE7tqJcIaT1y2UkRtOi3D6c9Q8ilUDsupR7kxA==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a17:90a:3ea7:b0:246:f5c3:576 with SMTP
 id k36-20020a17090a3ea700b00246f5c30576mr979461pjc.6.1681426404283; Thu, 13
 Apr 2023 15:53:24 -0700 (PDT)
Date: Thu, 13 Apr 2023 22:53:22 +0000
In-Reply-To: <20230412-kurzweilig-unsummen-3c1136f7f437@brauner> (message from
 Christian Brauner on Wed, 12 Apr 2023 11:59:52 +0200)
Mime-Version: 1.0
Message-ID: <diqzedono0m5.fsf@ackerleytng-cloudtop.c.googlers.com>
Subject: Re: [RFC PATCH v3 1/2] mm: restrictedmem: Allow userspace to specify
 mount for memfd_restricted
From: Ackerley Tng <ackerleytng@google.com>
To: Christian Brauner <brauner@kernel.org>
Cc: kvm@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, qemu-devel@nongnu.org, 
 aarcange@redhat.com, ak@linux.intel.com, akpm@linux-foundation.org, 
 arnd@arndb.de, bfields@fieldses.org, bp@alien8.de, 
 chao.p.peng@linux.intel.com, corbet@lwn.net, dave.hansen@intel.com, 
 david@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, hpa@zytor.com, 
 hughd@google.com, jlayton@kernel.org, jmattson@google.com, joro@8bytes.org, 
 jun.nakajima@intel.com, kirill.shutemov@linux.intel.com, linmiaohe@huawei.com, 
 luto@kernel.org, mail@maciej.szmigiero.name, mhocko@suse.com, 
 michael.roth@amd.com, mingo@redhat.com, naoya.horiguchi@nec.com, 
 pbonzini@redhat.com, qperret@google.com, rppt@kernel.org, seanjc@google.com, 
 shuah@kernel.org, steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
 vannapurve@google.com, vbabka@suse.cz, vkuznets@redhat.com, 
 wanpengli@tencent.com, wei.w.wang@intel.com, x86@kernel.org, 
 yu.c.zhang@linux.intel.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=35Ic4ZAsKCv0fhpjwqj3ysllttlqj.htrvjrz-ij0jqstslsz.twl@flex--ackerleytng.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Christian Brauner <brauner@kernel.org> writes:

> On Wed, Apr 05, 2023 at 09:58:44PM +0000, Ackerley Tng wrote:

>> ...

>> > > Why do you even need this flag? It seems that @mount_fd being < 0 is
>> > > sufficient to indicate that a new restricted memory fd is supposed  
>> to be
>> > > created in the system instance.


>> I'm hoping to have this patch series merged after Chao's patch series
>> introduces the memfd_restricted() syscall [1].

> I'm curious, is there an LSFMM session for this?

As far as I know, there is no LSFMM session for this.

