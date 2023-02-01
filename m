Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD79686E9B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 20:05:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNIOy-0007Wb-7Y; Wed, 01 Feb 2023 14:04:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNIOu-0007WH-Ni
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:04:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNIOj-0005H4-Fg
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:04:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675278225;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ndcsymLJ41iNhb8Y/1uIBhstoeUzpay0P7dBEgw1V6U=;
 b=RKT0P+5MKKn/Ur8lYYL57Es/Ug0o9d5Wh2FZN7R+2ikWEN68aojWgvp5L3ob7iEMju054q
 ePIuOxS9YtEmwaXkKF+4bRa3i/UoCIJl14hcQymbzYnXbuULs10WPybWUUGphT5wVuHmb2
 kIFpEgtQupPjvPAu553Ru6Lq+RjWU3o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-4PTts_zxO_yZGT6nRSCnkw-1; Wed, 01 Feb 2023 14:03:44 -0500
X-MC-Unique: 4PTts_zxO_yZGT6nRSCnkw-1
Received: by mail-wm1-f69.google.com with SMTP id
 l5-20020a1ced05000000b003db300f2e1cso1449085wmh.0
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 11:03:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ndcsymLJ41iNhb8Y/1uIBhstoeUzpay0P7dBEgw1V6U=;
 b=PyWbve+yVkewxPXPFwADcT00Z8nBX7eoHbaUuhJJWNvyWL1A4ExyDtwYn+kBqeVEkH
 XA98pyTDkaRGBqAbDdYsmp6kf5edWQ+2PeoSZKwl2747kX4n617wRIS95ixsrX6rBng9
 RbGeHP/NpbEiS1p6ZYNhb3ziUrZLPlvFYDREx8QSXGl5bklfpZPKWxQnTdK0BCG7liAB
 8WSr0wEUYr1qt/T7Y4LnQmdfBrl8ttHD8YuCLhQAXKAOVhEmwuOQXbpx35emM7AQKQG5
 7uzUb2+X+q5CpuOCqCbk7IwV46Jj3NJ/cXoICq4n2UZqg71gUCEfRXiBRtCiF/UFig8v
 dOfQ==
X-Gm-Message-State: AO0yUKXcXqblY1HP7+hIEUF97qIwsbTat+DKZNhzdPfBFzYHAuC/IG39
 FYgy1/iY2UFvX5AafPtKPPp7GV4B6e2wwUCkRDnX8WXW5M05zoU4fSkcISWa/IAnGUJxiDv3ewa
 V6hsuoPGYvlqgMUw=
X-Received: by 2002:a05:600c:190f:b0:3d3:49db:d95 with SMTP id
 j15-20020a05600c190f00b003d349db0d95mr3240682wmq.37.1675278223292; 
 Wed, 01 Feb 2023 11:03:43 -0800 (PST)
X-Google-Smtp-Source: AK7set8wTTRyn6hHzv/Urc0TA42nRM6HIMcNh47NLtevhZ0aXfbfUxdinCCMfu29GEVcWKJDJkXUAA==
X-Received: by 2002:a05:600c:190f:b0:3d3:49db:d95 with SMTP id
 j15-20020a05600c190f00b003d349db0d95mr3240662wmq.37.1675278223098; 
 Wed, 01 Feb 2023 11:03:43 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c351400b003dc22ee5a2bsm2766944wmq.39.2023.02.01.11.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 11:03:41 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 17/21] migration: Rework ram discard logic for
 hugetlb double-map
In-Reply-To: <20230117220914.2062125-18-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:09:10 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-18-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 20:03:40 +0100
Message-ID: <87r0v9w6lv.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> Hugetlb double map will make the ram discard logic different.
>
> The whole idea will still be the same: we need to a bitmap sync between
> src/dst before we switch to postcopy.
>
> When discarding a range, we only erase the pgtables that were used to be
> mapped for the guest leveraging the semantics of MADV_DONTNEED on Linux.
> This guarantees us that when a guest access triggered we'll receive a MINOR
> fault message rather than a MISSING fault message.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>
>                       length >> qemu_target_page_bits());
>      }
>  
> -    return ram_block_discard_range(rb, start, length);
> +    if (postcopy_use_minor_fault(rb)) {
> +        /*
> +         * We need to keep the page cache exist, so as to trigger MINOR
> +         * faults for every future page accesses on old pages.
> +         */
> +        return ram_block_zap_range(rb, start, length);
> +    } else {
> +        return ram_block_discard_range(rb, start, length);
> +    }

This is a question of style, so take it or leave as it as you wish.

You can change:

if (foo) {
    return X;
} else {
    return Y;
}

into:

if (foo) {
    return X;
}
return Y;

It is one line less of code, and in my eyes, makes it easier to see that
one exits in all cases.  But as said, this is a question of taste, and
that is as personal as it gets.

Later, Juan.


