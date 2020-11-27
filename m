Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D690A2C6D31
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 23:28:44 +0100 (CET)
Received: from localhost ([::1]:54508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kimEN-0003N2-UQ
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 17:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kimCl-0002Sf-2F
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 17:27:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kimCi-0002R5-Iy
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 17:27:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606516019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SINIu2eKq/JA/G/pN9xUPAC+XnFMrMJAvjeNioK+Dh4=;
 b=aFnW99MhfqlVbZCfI13PuwisT8CsY3dsW1INm9TCb3UEIm7u9ELHJQ8glbVyXOGukKIwCT
 Pn2Jl/CJ5jo03pYxwZFS+AU0OTZnKJy28EsX96PNPrEygW42eBLX0vLYf9/rjOJlxXfQGx
 nPKpP9XVc50/kfXspD1YNf7rr/KLWRs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-BHJ6dB0mOfm1Knl0vEW7PA-1; Fri, 27 Nov 2020 17:26:56 -0500
X-MC-Unique: BHJ6dB0mOfm1Knl0vEW7PA-1
Received: by mail-qv1-f70.google.com with SMTP id q6so3744524qvr.21
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 14:26:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SINIu2eKq/JA/G/pN9xUPAC+XnFMrMJAvjeNioK+Dh4=;
 b=dll1790T3Oy7olPPLrCqvoNYnhSwoMuRuG2UcEStjsIz2wlxlYVgUL+Uw8GsLNoIno
 8XEoyWGFZDuh5joDzM08DkzRzmi+BjPuHaMUL37IEfNCgPZg+hm2PWYKYTK7VxOhmQ8z
 GrFwP4M9Ie75H62O5sPZvIUBKIrtlgqaBWbEAvHRMTA+7MgdLSIgKdgG8cBLJtHkSnnb
 3/X3vkcqUUvKbznyY7bewIu2R3V+lO6M6DkhsidjWXwtFJTZM97YZ+Vay5CmrVxWRRaA
 Vf5WqkvMq1Qnj5q5Ip3uQv4OhmvVOf9PPwORssshE4P/dGrkFSJBx2n8nldf7q96NYqz
 ey4g==
X-Gm-Message-State: AOAM53234MTv0QQkcpF2VcanXlYKrDmBAiWUmjBBF8H7ApH1mXSRPLPJ
 8iQ1/KTlNntzxGU0axtLhEhVgZ95WzExRyUpLnVwQuUBre/XdISUagRS/AbSei63Fvdg6Up3T7C
 myHqBxrNouMsneSM=
X-Received: by 2002:ac8:5c47:: with SMTP id j7mr10528777qtj.160.1606516016253; 
 Fri, 27 Nov 2020 14:26:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpnt1wM2utXERNM2uz/0kqQgAk0mCvSt2FHVuwndVn11FlV6zGGiIvIcpNIoyX8j5FGAyjyA==
X-Received: by 2002:ac8:5c47:: with SMTP id j7mr10528760qtj.160.1606516016076; 
 Fri, 27 Nov 2020 14:26:56 -0800 (PST)
Received: from xz-x1 ([142.126.81.247])
 by smtp.gmail.com with ESMTPSA id k188sm7676368qkd.98.2020.11.27.14.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 14:26:55 -0800 (PST)
Date: Fri, 27 Nov 2020 17:26:53 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v4 5/6] the rest of write tracking migration code
Message-ID: <20201127222653.GI6573@xz-x1>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126151734.743849-6-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201126151734.743849-6-andrey.gruzdev@virtuozzo.com>
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

On Thu, Nov 26, 2020 at 06:17:33PM +0300, Andrey Gruzdev wrote:
> Implementation of bg_migration- iteration/completion/finish.
> 
> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>

Both patch 4 & 5 look good to me in general.  Maybe you can even squash this
patch into 4?  It's not scarily hugeas a single patch, but a complete one.

-- 
Peter Xu


