Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CC82C6D34
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 23:29:57 +0100 (CET)
Received: from localhost ([::1]:58228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kimFY-0004v9-8p
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 17:29:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kimE1-0003iy-I8
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 17:28:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kimDx-0002a0-Fs
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 17:28:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606516096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WBSgaYaGd3tfCFUDShj2uJr0oyzmy/JFGgvzxcBt+oQ=;
 b=Ch4mUz8P5gceJc2N0CTfs4CYqLVx5O+GZvoMabI5HH7vcvScqpZ8twNL8SGKtKz5jIFeiz
 8Oqhat7jdVfyfTBhSnJagkr/WpQYghv5CsgL2MU2E1YdaYJDcW2y08a4hpgNVdQcy0sX31
 nACB66+IiV/3z/ZNi6ooycgLLqwNGWY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-SPANPCbNOXamwEpvSRsOsQ-1; Fri, 27 Nov 2020 17:28:14 -0500
X-MC-Unique: SPANPCbNOXamwEpvSRsOsQ-1
Received: by mail-qt1-f197.google.com with SMTP id f29so2176357qtv.23
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 14:28:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WBSgaYaGd3tfCFUDShj2uJr0oyzmy/JFGgvzxcBt+oQ=;
 b=untSXdEiVMPYLoou66/Z1G21vqdsswXcJomK96gBWpZUbpDUu5GA2T1ffonQhOpm+9
 3CHWj/03q5Bw3NC4E0kXZzHMwymH2+VLanyJF2wUchyFJaKrj0zxWmX3ve/hn78Rhxt0
 L0StQM/n5ynaf5iRK2RIaZ8nAuU+U+GlxRhn8xEMrvB1XFxcdMOO3w3spesTPQuyKvZL
 TRx9Xf6EF7n+PN78PcEKCyJB3FxHdsP58swu2UanWrPiHo64UjuXsxR0RMH5N+pgKJDy
 yUwnr2/3TlFokVg/sloF0KMDOY7IoDx1GJ2rekENaP0sk3EPGzQzlUXrXx7eZSlXQU9z
 PwsA==
X-Gm-Message-State: AOAM531oLRZSZcMSRWGOcgzqSduVPkh9y2qNH/+kkAUoqyrKlr03ogGB
 27VAwtf8LJEpV0w77l6U9Z3OhqkJUn4lGSFiPMoIfLO/AA31F2fGyJAiZSgG8YRdUfa5DBSlJ7w
 FjL7wdSUmvr6VFT8=
X-Received: by 2002:a37:a8c8:: with SMTP id r191mr10707583qke.58.1606516093566; 
 Fri, 27 Nov 2020 14:28:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYBhIv0EUVHDjdw7PQVcWgc9OQU6efl1JCdYfXrpEgOjZ+vD72C9JNbnVvvrjbMQKfr8o7+A==
X-Received: by 2002:a37:a8c8:: with SMTP id r191mr10707571qke.58.1606516093395; 
 Fri, 27 Nov 2020 14:28:13 -0800 (PST)
Received: from xz-x1 ([142.126.81.247])
 by smtp.gmail.com with ESMTPSA id k32sm7527693qte.59.2020.11.27.14.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 14:28:12 -0800 (PST)
Date: Fri, 27 Nov 2020 17:28:11 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v4 6/6] introduce simple linear scan rate limiting
 mechanism
Message-ID: <20201127222811.GJ6573@xz-x1>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126151734.743849-7-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201126151734.743849-7-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 06:17:34PM +0300, Andrey Gruzdev wrote:
> Since reading UFFD events and saving paged data are performed
> from the same thread, write fault latencies are sensitive to
> migration stream stalls. Limiting total page saving rate is a
> method to reduce amount of noticiable fault resolution latencies.
> 
> Migration bandwidth limiting is achieved via noticing cases of
> out-of-threshold write fault latencies and temporarily disabling
> (strictly speaking, severely throttling) saving non-faulting pages.

So have you done any measurements out of it, as we've talked in previous
version?  Thanks,

-- 
Peter Xu


