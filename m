Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58336B9FD2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 20:32:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcANJ-0004m7-JV; Tue, 14 Mar 2023 15:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcANH-0004lw-GY
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 15:31:55 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcANG-0005ea-1a
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 15:31:55 -0400
Received: by mail-pl1-x62a.google.com with SMTP id u5so17723495plq.7
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 12:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678822310;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g+o08R8ztwIKW8gjvhyeNMRkyLD45f0MBdsCtTVCOzU=;
 b=K0hviaaJkh1pTBM9f0ueKngfvAFV+zXPI4bdk+KaZaOq4+QaPgUQJtfmN8zWArg2wf
 j6LMzDAkpqUsOaLJ5EZEN90saGttsZnMABO0tKnO3MozMteV+1Begdo77nT3VPL3R2k6
 xVCeyLew0960rR98a79kG8OT91/8ofa41xAgsl6UdhsrTnRdWmj4nzvrrVMvnRLZ+v0k
 Z3NunBNfujO2o+hH8CbjmgVXpdicUPvnN3YQEyCYAhGN6gjyJjJ3JpG/mqAZq2vQ8RFI
 6AudUeldA2E69Oyu8HJrPj4qoSZJlZgvYT3tkCUXHMjFTeHELxHSL37Zmsnd5MUY2W+1
 K2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678822310;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g+o08R8ztwIKW8gjvhyeNMRkyLD45f0MBdsCtTVCOzU=;
 b=5DqNgAq7YmefvcnjJv88ynMyLYNzx0UQlqBPBhQCD7gPU92PVA5ninVzp8UrCx5CzO
 GGBMIcoGXZxvF0d4CirMDiQAIAeq15vmoU/A4Inrbf9xOENPtakEXLccci8qAZgVFqJg
 LE/n4bddOC+O+FvPuWK6ArXbMnWRg0Fxd4AM9+TZScLIQVyrw8P5IOy0TDINC8UyY9mt
 PGIbENtRZbAJB/Lp802q0vdp+y/AC77O0osb+23RF1+IX/t5fmnS9rH8TTrQeWjKgdmW
 6o9BRxtZAfho/84t80dz2kpSZ1Xkd1B1VVPymauY42hj7Z2xJAPNi1lnQ496pcBRLKrt
 JPHw==
X-Gm-Message-State: AO0yUKVg+PR/LnodBxw1bDSEOKXpjtaES8yNVMIfv24LAbd9oO2ucI70
 ZBB6dYc6qP99dV9GvT3ydgEVLgU7/rb2oOxcwjpCcg==
X-Google-Smtp-Source: AK7set/rkNjI1N+Ue8G2OLZe1L0nw2SxeBblfc4IhytmcKEfVNBA0brabsn9oc69dYAI9ZA2o+5i6mwHBhHQPrBZ/Zs=
X-Received: by 2002:a17:90a:2b81:b0:23d:59d:a419 with SMTP id
 u1-20020a17090a2b8100b0023d059da419mr3107954pjd.1.1678822309765; Tue, 14 Mar
 2023 12:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <CAFEAcA_Pf11W3FuaLHvzQ7yrkh6KC556HDfvXpZYaHqN4iMvsg@mail.gmail.com>
 <CAFEAcA92kLBwgJoAc9HCr4oX=S0V=RmdO4+rOnKPJn32hQAf4Q@mail.gmail.com>
 <CAFEAcA-UaJsoA-rqmwEqh1j6xcCc=ifCctvN-jaW40VckRdp9Q@mail.gmail.com>
 <CAFEAcA-q1UwPePdHTzXNSX4i6Urh3j6h51kymy6=7SzDAFU87w@mail.gmail.com>
 <ZBBIaX+cZD5Ud2wQ@work-vm> <ZBCk6rMT5wmxwIuZ@x1n>
In-Reply-To: <ZBCk6rMT5wmxwIuZ@x1n>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Mar 2023 19:31:38 +0000
Message-ID: <CAFEAcA8C9SjtvejcyJwEp+PkWLU+jZG+1fE53OYc2NmVFaSDpA@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
To: Peter Xu <peterx@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 14 Mar 2023 at 16:46, Peter Xu <peterx@redhat.com> wrote:
> I've attached that simple fix.  Peter, is it easy to verify it?  I'm not
> sure the reproducability, fine by me too if it's easier to just disable
> preempt tests for 8.0 release.

If you all are happy that the fix is correct, I think the easiest thing
is just to get it into master (via the usual migration tree, or I can
apply it directly if you like), and we'll see if it helps.

thanks
-- PMM

