Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E9C443FB0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 10:55:39 +0100 (CET)
Received: from localhost ([::1]:60750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miCza-0005hu-BB
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 05:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1miCyO-00052E-Pj
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 05:54:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1miCyM-0004Mc-Vb
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 05:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635933262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SOXhRwvoYDWOT0CjiLuHjpOinLVmksUMkZEKIapwr7M=;
 b=EgnFN6nhMXsh7p4XuxBX1+wl5a5lKH5TdimRL+2k55kTcmBpJ1Z7QX3ZUvZ+sTf5PgN7ab
 vnm3+LeiADA01fIu0xxy8YLWRkNTFOK7T0m5tkDOAaWf1uPKkNgTHYlOfcuasOB5Qm87bz
 RAS7yl6Z072Y8/Wl03W+fj9Dq+b8Hiw=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-JSSNZODpP3-zddFKogwrsQ-1; Wed, 03 Nov 2021 05:53:14 -0400
X-MC-Unique: JSSNZODpP3-zddFKogwrsQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 73-20020a2e054c000000b0021668f13ce2so850196ljf.17
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 02:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=SOXhRwvoYDWOT0CjiLuHjpOinLVmksUMkZEKIapwr7M=;
 b=p5YwEo+4vEn+AqbYCC6aoWPvohHaCCtIe2NLBolyXwfyFzx2z3Cf6j1VeDwzBU2jy4
 TD04Zn/dG4fHGE/5h5nspKB1rvc2D7HYO4FVZJjmr6fyogwbdkrVtL2dq66vDvkjyQdZ
 rJK2HwRXhS3p2SqJWsovhf2L33bDSdvi18I/v71fEDxwCwCkYa4TB3k83d5pkwz/ENKb
 1wNV/hD6JuzyjdqkMbapaT/suQIKXfy/LgRenT/zBFoxG69YBiO8Lu8E5JwkpTAhZcRd
 fnMJEtvaxFr2wJFm1Z9aMR+y5ddK7vl8AJQqvM7w47UKd0OqoMfLsevnS3PbINHAl1xy
 HsHQ==
X-Gm-Message-State: AOAM531AAYHbnRgbaViyFLe9lBLRvIsO0TnOBe2DX+2SIQYxzKg/BsEe
 Iz58V99toj0E1ccol31GkdilqGZ0rzFTJYK7w7+Uy8uDmMqMUsjgB1AiTpmRvL2m/ZcDMsyQ4pm
 5CCYGr9orHHkod33XYYyciVJCshl3mSc=
X-Received: by 2002:a2e:8e76:: with SMTP id t22mr9908713ljk.81.1635933193052; 
 Wed, 03 Nov 2021 02:53:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVEDoBzaghyPsCPaorr7iqMmfKaYXRzkVH/oCbQCEhKupdP4TQQeRaNDo8ux/dr0lr8dT3zUjZXyXIbEFvULs=
X-Received: by 2002:a2e:8e76:: with SMTP id t22mr9908693ljk.81.1635933192839; 
 Wed, 03 Nov 2021 02:53:12 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Nov 2021 04:53:12 -0500
From: Andrea Bolognani <abologna@redhat.com>
References: <20211103081459.369912-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211103081459.369912-1-pbonzini@redhat.com>
Date: Wed, 3 Nov 2021 04:53:12 -0500
Message-ID: <CABJz62MhA9pSM4og_JxXyUpA3zLMMnH3tTLT-y0P2waQKuAXaQ@mail.gmail.com>
Subject: Re: [qemu-web PATCH] remove deployment phase from CI
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 03, 2021 at 09:14:59AM +0100, Paolo Bonzini wrote:
> qemu.org is now served via a reverse proxy from qemu-project.gitlab.io; it does
> not need anymore the rsync step to the QEMU project\s shell server.

*project's

-- 
Andrea Bolognani / Red Hat / Virtualization


