Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF98D466975
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:54:42 +0100 (CET)
Received: from localhost ([::1]:53684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msqI5-0004Kv-Hv
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:54:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1msqCt-0006Fh-Ds
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 12:49:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1msqCp-0004VC-Si
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 12:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638467354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jnQNVgrYR9Uo6g284kt6WlLug4i0W/gDzANZAp4iwAM=;
 b=GMou3D6s+tW0Uu8eAJ72Wt86CTTDhp3HkU7LFSCZ598l2Mk2SgnKmbuiP/+L+roVfWWM4f
 IxjZKXRgZHQRFXulIBOEpKyPX8H33RolWLdkDQxsqT15YrSx0E9+9Rs1jLsjY8IMh9KFko
 rQcI8Av/YYdUlHAPtxnJ+vvRoRd2X0U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-L0OQzatMPxqf4Uenllw_lw-1; Thu, 02 Dec 2021 12:49:13 -0500
X-MC-Unique: L0OQzatMPxqf4Uenllw_lw-1
Received: by mail-wr1-f70.google.com with SMTP id
 h7-20020adfaa87000000b001885269a937so43641wrc.17
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 09:49:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jnQNVgrYR9Uo6g284kt6WlLug4i0W/gDzANZAp4iwAM=;
 b=587JkZUE0ZtXyRmidQnej3rmePpWJ1Tx+h8dvN5jJMz+WFloaUUK11XuOsIRzhRd/5
 PzCAzDtMlbLJozAlXpcCLL64jGig1tI7w6nu+knPoHT264GAOG/e7e5DiBJs6bwgMvFi
 bbjIUlddLeTZl6osl1Fb2BVpAUeQ5eNNI6iE00ERyok4V3ZckYOaavr/WcjuYs7Ja9oK
 esa8OlvTw/clPOfPA/LCB/5YKXyxfINzQSF8aqNrUkF3mE9DgkAQeE2wLzgAwazxzzE/
 D42s0jBsrz1LzTG0lMdEmhEIJkOFPudXB0+9QCmgDV3IkbgN3ztEHX1lRktF+BC429f0
 1LEA==
X-Gm-Message-State: AOAM530kKcVauJFDqNNmFzmObBV9KYW1vku/YGlaYrxaM+w04hlCNNME
 SsoDcc+5ZbdvOQkjY43h6BCLnvK5OcjFu7ykDW9uSFyAVfQlf47NIknJ+5EcsVd2qMAFFJCGNLT
 j9S0XJiAprbcTPt0=
X-Received: by 2002:adf:dd87:: with SMTP id x7mr16291653wrl.158.1638467351821; 
 Thu, 02 Dec 2021 09:49:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDjycK8gBEM5dCVkhqn7hIvgmrzgi2aj3/oxK/8bQppvmuRpxbHh9skdoyxSsOPsXy8+yZAg==
X-Received: by 2002:adf:dd87:: with SMTP id x7mr16291624wrl.158.1638467351562; 
 Thu, 02 Dec 2021 09:49:11 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id 138sm2828039wma.17.2021.12.02.09.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 09:49:11 -0800 (PST)
Date: Thu, 2 Dec 2021 17:49:09 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 23/23] migration: Use multifd before we check for the
 zero page
Message-ID: <YakHFVxJ7NhOWV/D@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-24-quintela@redhat.com>
 <Yaj+V6LstcnNERaZ@work-vm> <87fsragb58.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87fsragb58.fsf@secure.mitica>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > * Juan Quintela (quintela@redhat.com) wrote:
> >> So we use multifd to transmit zero pages.
> >> 
> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> >> ---
> >>  migration/ram.c | 22 +++++++++++-----------
> >>  1 file changed, 11 insertions(+), 11 deletions(-)
> >> 
> >> diff --git a/migration/ram.c b/migration/ram.c
> >> index 57efa67f20..3ae094f653 100644
> >> --- a/migration/ram.c
> >> +++ b/migration/ram.c
> >> @@ -2138,6 +2138,17 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
> >>      ram_addr_t offset = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
> >>      int res;
> >>  
> >> +    /*
> >> +     * Do not use multifd for:
> >> +     * 1. Compression as the first page in the new block should be posted out
> >> +     *    before sending the compressed page
> >> +     * 2. In postcopy as one whole host page should be placed
> >> +     */
> >> +    if (!save_page_use_compression(rs) && migrate_use_multifd()
> >> +        && !migration_in_postcopy()) {
> >> +        return ram_save_multifd_page(rs, block, offset);
> >> +    }
> >> +
> >>      if (control_save_page(rs, block, offset, &res)) {
> >>          return res;
> >>      }
> >
> > Although I don't think it currently matters, I think that should be
> > after the control_save_page.
> 
> This needs to be improved to be compatible with old versions.
> 
> But .... if we don't care about RDMA, why do we care about
> control_save_page()?

That's why I said I don't think it currently matters; but the patch
seemed a little odd since it changed this order which isn't what
it said.

Dave

> Later, Juan.
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


