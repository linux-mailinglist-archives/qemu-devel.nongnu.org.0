Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F366E2DCA
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 02:07:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnTQr-0000nR-99; Fri, 14 Apr 2023 20:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3b-o5ZAYKClQE0w95y2AA270.yA8C08G-z0H079A929G.AD2@flex--seanjc.bounces.google.com>)
 id 1pnTQk-0000n6-J0
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 20:06:14 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3b-o5ZAYKClQE0w95y2AA270.yA8C08G-z0H079A929G.AD2@flex--seanjc.bounces.google.com>)
 id 1pnTQh-00081Y-JS
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 20:06:13 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 w184-20020a6382c1000000b0050bed8b0b61so8353011pgd.11
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 17:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681517167; x=1684109167;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=27SavXWsOz2fFOmzF4nHb+ZNB/DHHSIE/WtD2FW1frE=;
 b=B6rYc8U7DGbKYNVYius6Nr1xFvfOgiOlW1pJgKmS1NVqaLzVhoraHcl1dTphDfkPeJ
 VC5xCv4i9COcEmzeOrD7NEAO9JflKku7ibWDLxlUZ7QUcBWfleeW76yKHqP1vsjsIBmS
 xOBlD3he/x1UVQg1EYc85ePh47AslSrznw1re6kKlcbBm07C50pD2jDiYbewN+qZWOeG
 EnLYD2OvDfZ5pDFaBqAkHKIhzuWoraoXAEemxILSM5u/iZ8A2ZqHiRuKc9YACWyOhPPn
 KTvKxPW2ojdNtXyipa/8Ht7nOBbNdsa/g4dO2xbQne+AS2SegO8N4SXpGOfagfMUjir5
 TCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681517167; x=1684109167;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=27SavXWsOz2fFOmzF4nHb+ZNB/DHHSIE/WtD2FW1frE=;
 b=EQcLbLfFSreWebnjScE7zT1T5CGRLLB08uh6Rytckgcgx2HNJMUhRMSN/wRPP6zOHi
 Jywy7sdBGcS37Oxc4FQ0eKcLcGKuBoOYCQ16D8TLEspn97khDAZ+BmocrUPA/WfIgZjh
 x1CHTYatBYVOsyhdFZj3yqxa8SmLKWGXeo1q22jQYmnqEryyzwI1RaIVD7d3ZZh4AAma
 RTihMrdYWKMMqp23gxs3G+P4ZPhIQ5696ZbwjEtXtOpzDSM5XUv/hTMYyjzqzyUW29O9
 Qo983nKGa7GAXEyAbNEyrOj2roihuG9w3GcQGqmzKBLeyows/eFvLwzXPK3LXl0tbGVL
 MKaw==
X-Gm-Message-State: AAQBX9dX0JiFPKMdFwFCUPpXhJAQy4RRFNpkIj4vnuMEpIV0rnQqHpqb
 MbowGBTsE25+zM3b8d8laYO/Gdzx/1E=
X-Google-Smtp-Source: AKy350aWKg8kIKC0roeA72FaEe4HTb/wQtFuJp2chTATT/qvNt2jfzRorHJiQbnz3aOgwdrTNO7tZU5ONkg=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:9c3:b0:246:f8f7:f568 with SMTP id
 61-20020a17090a09c300b00246f8f7f568mr2063266pjo.0.1681517167336; Fri, 14 Apr
 2023 17:06:07 -0700 (PDT)
Date: Fri, 14 Apr 2023 17:06:06 -0700
In-Reply-To: <ZDnhMQ2aoVYh6Qr2@google.com>
Mime-Version: 1.0
References: <ZDiCG/7OgDI0SwMR@google.com>
 <diqzbkjqnl6t.fsf@ackerleytng-cloudtop.c.googlers.com>
 <ZDnhMQ2aoVYh6Qr2@google.com>
Message-ID: <ZDnqbqykWot4+617@google.com>
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: brauner@kernel.org, kirill.shutemov@linux.intel.com, 
 chao.p.peng@linux.intel.com, hughd@google.com, kvm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 linux-kselftest@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
 vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com, 
 joro@8bytes.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
 x86@kernel.org, hpa@zytor.com, jlayton@kernel.org, bfields@fieldses.org, 
 akpm@linux-foundation.org, shuah@kernel.org, rppt@kernel.org, 
 steven.price@arm.com, mail@maciej.szmigiero.name, vbabka@suse.cz, 
 vannapurve@google.com, yu.c.zhang@linux.intel.com, luto@kernel.org, 
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com, 
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com, 
 dhildenb@redhat.com, qperret@google.com, michael.roth@amd.com, 
 mhocko@suse.com, songmuchun@bytedance.com, pankaj.gupta@amd.com, 
 linux-arch@vger.kernel.org, arnd@arndb.de, linmiaohe@huawei.com, 
 naoya.horiguchi@nec.com, tabba@google.com, wei.w.wang@intel.com
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3b-o5ZAYKClQE0w95y2AA270.yA8C08G-z0H079A929G.AD2@flex--seanjc.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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

On Fri, Apr 14, 2023, Sean Christopherson wrote:
> On Fri, Apr 14, 2023, Ackerley Tng wrote:
> > Sean Christopherson <seanjc@google.com> writes:
> > > 	if (WARN_ON_ONCE(file->private_data)) {
> > > 		err = -EEXIST;
> > > 		goto err_fd;
> > > 	}
> > 
> > Did you intend this as a check that the backing filesystem isn't using
> > the private_data field in the mapping?
> >
> > I think you meant file->f_mapping->private_data.
> 
> Ya, sounds right.  I should have added disclaimers that (a) I wrote this quite
> quickly and (b) it's compile tested only at this point.

FWIW, here's a very lightly tested version that doesn't explode on a basic selftest.

https://github.com/sean-jc/linux/tree/x86/upm_base_support

