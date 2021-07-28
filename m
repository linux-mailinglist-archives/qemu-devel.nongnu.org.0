Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB863D9829
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 00:06:07 +0200 (CEST)
Received: from localhost ([::1]:55000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8rgk-0001E7-Ep
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 18:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8rdr-00081N-Pc
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 18:03:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8rdo-0007Tc-UW
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 18:03:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627509784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0mnuDjqLrdhZXoCrGMR0jbsKZL8fev6lorBCTh1TH30=;
 b=h2zLtM0S8/z99u38WxtPO5vYgMvXLPEzlES8jcI9QauDU6miQMGqvJXhY3vTelsUqZ6nmg
 L68bY+XShVxhU7yY+L76CZOtg0nmJ3r1TKZrfL6wZnAgZYyT9hwJ3G8unPSdCCZCqnQ/AB
 uoxFsznIkg6pN5zUneyK3oNomM4lPDg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-l5qht1ZpOg-nsLjwtO-W0g-1; Wed, 28 Jul 2021 18:03:01 -0400
X-MC-Unique: l5qht1ZpOg-nsLjwtO-W0g-1
Received: by mail-qt1-f200.google.com with SMTP id
 l12-20020a05622a050cb029025ca4fbcc12so1746596qtx.18
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 15:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0mnuDjqLrdhZXoCrGMR0jbsKZL8fev6lorBCTh1TH30=;
 b=Ed7nYQbddnPE0x41ayl+mBb7tgCO8j+0pB1f8pwh0lKaUHTZizGjKsblKfAA4kyviR
 HoxSX6/1ndB4r9gat0foYx+nFQtnQXMobUWxzzVRv7BywVSczq9t1JXzhwOtZN3VJVDj
 JaadluU5Z3aEucXMOusO2TA8PLMZP8k/mr0h0zyoR/QnyK3EU1U9EM1qF04yDFA5rgBi
 vFPXTRIAZATkVDV+d2Y8Gl2CGxBosGpBKNvdum1uR9KpDtqdm2VvA68ZNLoIccNgXIJl
 jlDcF91QrfjBgv8h9I0UbE1h/Fe9AVeeAR+22gnhu8Q3byddfvgBFnrewgheqX63D+Ks
 sIyw==
X-Gm-Message-State: AOAM530z9Lf382i3ZTsUJZ1rsa/q/FJYI614s1G8DtioLfjpMz9c5mdT
 ObFsb8SbBClqE+owL40GfXp8PC1HVeA56uNIkNxLhK6ZGYBK8/s3vRYMgqm85XW5f8zYZNH5LCK
 nAt5CisFMWZCHrDyNy6z+aOeavmn73nXQk90Oz6zt6X3W3llZ7Qg63uzqgLMO8R/9
X-Received: by 2002:ae9:ebd5:: with SMTP id b204mr1916407qkg.183.1627509780298; 
 Wed, 28 Jul 2021 15:03:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8kTuEmws8JHoXUhVs5KKgN95tztip/A1dIkeIkjyvVEEwOD6bvIvBJx/fCIrHjyPu8gieqA==
X-Received: by 2002:ae9:ebd5:: with SMTP id b204mr1916380qkg.183.1627509780016; 
 Wed, 28 Jul 2021 15:03:00 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id i67sm697152qkd.90.2021.07.28.15.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 15:02:59 -0700 (PDT)
Date: Wed, 28 Jul 2021 18:02:58 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] tests: Fix migration-test build failure for sparc
Message-ID: <YQHUEiGZ/a3aH9Cv@t490s>
References: <20210728214128.206198-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210728214128.206198-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 28, 2021 at 05:41:28PM -0400, Peter Xu wrote:
> No need to have "Fixes" as the issue is just introduced very recently.

And.. This is only true if this patch can be merged in 6.1...

I should have added "for 6.1" in the subject but I forgot.  Sorry.

-- 
Peter Xu


