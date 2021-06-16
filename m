Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8763A9B09
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 14:51:35 +0200 (CEST)
Received: from localhost ([::1]:56700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltV14-0000Ia-69
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 08:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ltUzR-0007xr-6t
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:49:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ltUzO-0002wr-Ar
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623847786;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gWPlZJBvwtSA2vk821BYSwrC3h/YnaYIa/TyvGCnj1s=;
 b=bTbxlgM7SI50LPZZlibV/zXZH663wryjum0X6IXMz0oF/k9Ho5ZnSYO002Lfv/h2Sw67zN
 810L7C1EZPgxVUM0DCXZK3LZyRn/XGD8iqt8CwmOpWZmP4Pcw1dEh5dgO2eHbtn6cJMhm7
 6AIrAvjMuQEJv67RRH9n/u3QHfDq2/A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-DUKgEKGtOni3YQHqj6gf1A-1; Wed, 16 Jun 2021 08:49:45 -0400
X-MC-Unique: DUKgEKGtOni3YQHqj6gf1A-1
Received: by mail-wm1-f70.google.com with SMTP id
 o32-20020a05600c5120b02901d23584fd92so723682wms.5
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 05:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=gWPlZJBvwtSA2vk821BYSwrC3h/YnaYIa/TyvGCnj1s=;
 b=U68DTYWXmZvMPVqG1leb0xMv3rxXxVGpykIFlMHctpiHhHkCVFOEHmrRtkKl4Hklu+
 3kdHB1NPMqdE6uErDZmus66+4sRZyAZpILPGjleDz9+2PokO68rkjI12iD+cmCUQVEiz
 EcUYStkNhG6RIq6owUE9g/wr+kSzjdB89wxJtCVtPyuX3HCcmCkpfarcdN6movUEeOYm
 d+Q34cnhlcs91l5nyM3FmkuYqOsS6siWRy4aOVA0WJA1GS/SiqY4dC8lzH1+BiEzuD6Y
 i8ZGRJmX8MzqxeIUf5xt05PyvZ4T19RNr9demMO/NnF+4jljO60sYE1pxHb4By0j6zqq
 rmRA==
X-Gm-Message-State: AOAM532JbZqlfvaNcQFdy/zTg5vk0/XONeTlu9pcURDO0pUW3I6sQ4Xd
 ZAJ6kx13I/qdNqxqyayLHwZBdkiVqn8YRJu6mLc1HajxPs8K27/A1JmPSqtdzQln4yVJ9YFC8sf
 jtDfVEbrx+Ar5lSU=
X-Received: by 2002:a7b:cd92:: with SMTP id y18mr10533341wmj.44.1623847784415; 
 Wed, 16 Jun 2021 05:49:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHTi5zJDxWM9WlrXcPZcL45+4LAalcBZrqOLyBy7DeYgnN4ly7xxoihbAkBL1fdtlxRLqGNA==
X-Received: by 2002:a7b:cd92:: with SMTP id y18mr10533319wmj.44.1623847784198; 
 Wed, 16 Jun 2021 05:49:44 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id t9sm2002091wmq.14.2021.06.16.05.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 05:49:43 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 1/2] tests: migration-test: Still run the rest even
 if uffd missing
In-Reply-To: <20210615175523.439830-2-peterx@redhat.com> (Peter Xu's message
 of "Tue, 15 Jun 2021 13:55:22 -0400")
References: <20210615175523.439830-1-peterx@redhat.com>
 <20210615175523.439830-2-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Wed, 16 Jun 2021 14:49:42 +0200
Message-ID: <87tuly0yah.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> Currently we'll skip the whole migration-test if uffd missing.
>
> It's a bit harsh - we can still run the rest besides postcopy!  Enable them
> when we still can.
>
> It'll happen more frequently now after kernel UFFD_USER_MODE_ONLY introduced in
> commit 37cd0575b8510159, as qemu test normally requires kernel faults.  One
> alternative is we disable kvm and create the uffd with UFFD_USER_MODE_ONLY for
> all postcopy tests, however to be simple for now just skip postcopy tests only
> by default.  If we wanna run them use "sudo" or root, they'll still work.  In
> all cases, it's still better than running nothing for migration-test.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

A shame we can't check postcopy without being run.


