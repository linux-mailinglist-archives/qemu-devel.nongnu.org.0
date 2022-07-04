Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13039565698
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:10:04 +0200 (CEST)
Received: from localhost ([::1]:47530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Lpz-0006hz-1i
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Lg2-0004km-K5
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:59:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Lfw-0007YM-BN
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4aKh0zAZJmiRQddU7s3L0MedE92Xa4UrgTfveTlRaO8=;
 b=YL1ji7PZmwusPGkMe4RWWh1ogel6ewenS7VQvIsEHThUVtHOsq1YpSbrGm6J/3kJXbxQJL
 T8Oq+ZDRsEtZIfdQC1pwFPwhOLlAyrIFm8A6LiH7+VjGMjouwBkKEO3Sfj9hitVHIijeev
 Klif+dgAJEBAgQ76rv7KtvqC8A8KGbU=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-9KaB1fLjMA6ryCYQcfJmlg-1; Mon, 04 Jul 2022 08:59:38 -0400
X-MC-Unique: 9KaB1fLjMA6ryCYQcfJmlg-1
Received: by mail-il1-f197.google.com with SMTP id
 h28-20020a056e021d9c00b002dc15a95f9cso895626ila.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4aKh0zAZJmiRQddU7s3L0MedE92Xa4UrgTfveTlRaO8=;
 b=rH54naulpcmEgS/rQt26w/Psp5nPeg5Jq2aYb1cmfbGLH1RIxV896MxX3Jhd/bWVC2
 TRYAUDMxgfH1HfqoZ3p6zIlwtTgkvrFCf5OkKSi6soRkLk6A5FNU/K9mnSzFv1ofjskN
 ZFZ6Xy2lYLqRFLtBdoSU1Rca/PG/5e/fDt6IFiMcdwbVSdYX3cYiThwSOPJ06SzoVhro
 SjCqb6IfQb2B/kEeMi8fLglNAIiV6iWyLsUXCVME5CHdLff0QglL2wxGeoQFRdy4ayHY
 pnO0qL6naOImdULaIVp9fYwPzkT9C8LvMXOaE1wdZOrApv30HHncsRLxHOIOarmPWwj6
 Y0kQ==
X-Gm-Message-State: AJIora97lSAZV9mH0aG2oycas6DFxcxVUT4EJNne8cgTHuzgKsb7snfr
 412ombPDkVLrddUxklcxLxUPh+leZ9DlMn555VeDJ03blmTBLobCObKoBXwn8mWLTW8ZM5YYDHh
 IzklI6KQsqy52//W6zFbC44RTnYDGLB8=
X-Received: by 2002:a05:6e02:216b:b0:2da:c09b:179f with SMTP id
 s11-20020a056e02216b00b002dac09b179fmr16973788ilv.0.1656939577901; 
 Mon, 04 Jul 2022 05:59:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1snpVDnhvhfftDWFAdONQKEX/4fVFMB/cHCA0jOjqv6YwE0HaAB2Mxc9NJTtBNL+H7v/f01qUcs6BRAI1jJxyA=
X-Received: by 2002:a05:6e02:216b:b0:2da:c09b:179f with SMTP id
 s11-20020a056e02216b00b002dac09b179fmr16973782ilv.0.1656939577778; Mon, 04
 Jul 2022 05:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-12-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-12-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 13:59:02 +0100
Message-ID: <CAELaAXz2+Mg_1OxOmrwc1NFVu1cWctNasM1erNSjSAKfKjc6kg@mail.gmail.com>
Subject: Re: [PATCH v2 11/26] nfs: add missing coroutine_fn annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 9, 2022 at 11:46 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Alberto Faria <afaria@redhat.com>


