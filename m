Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE92E2D2E9C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 16:50:11 +0100 (CET)
Received: from localhost ([::1]:49188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmfFi-0001FP-8b
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 10:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kmfDv-0000HB-Q3
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 10:48:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kmfDJ-0002ks-3P
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 10:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607442459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sXOlL+lMhoOEt33T/eIPa4tYyAMeBP358e6hGa7+GZI=;
 b=IoKTIU5e5wmJvivAxhaqqPA/sy3mGCPXOjBz67zL5tjQunN722kC3oA18M96D5u3+XlnIo
 rGr+XDmzWUKBiB5K16xijH1UAd3IW2pvO3sSP0pS33r4CfDa4eVfY9vJOF0B+15XPwjOiN
 aErAz9iyUWT04k4YkhxbTzXaWA/LOqI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-r53MvuKEP9e-p_fvKx9FLQ-1; Tue, 08 Dec 2020 10:47:38 -0500
X-MC-Unique: r53MvuKEP9e-p_fvKx9FLQ-1
Received: by mail-qv1-f69.google.com with SMTP id o16so14552759qvq.4
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 07:47:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sXOlL+lMhoOEt33T/eIPa4tYyAMeBP358e6hGa7+GZI=;
 b=FN7qjuCQRI5LFHc0uTLkptQKKK52cVKUq0eX0kkC0TI+GYlGCGosBFEiNktnsyRIke
 /MHUpYR6+LESGWeJztI7tQEwSLARl/v09ADxxLKhJkAXyYOD+Mf5jGd8bS6qVD1oElGX
 REeQfVrbcDDr4AqyTR839L7zOMgKvjWB08Exj0zFy80ZhZYqbGoo+waeJ3I83z10q/Dp
 gQbiFoEJnO4meJ6cTQBXAJKpZzNczpbvTxnaa96qb6O4kDwEQwbFRkRM5Bh6+lWAS4v2
 ygAiee2/UwFFG5I2YB+6t9kOxmtVcsOdUBsQ52y7We1vIpZTxguZPT8qcpNnqIRfEpkn
 KHXw==
X-Gm-Message-State: AOAM533jIiQonPz2heqGtm9zcdj3vS8dlg2U3uaP7cmhT2tfs/dTef//
 RSkLvN6UrJLTZprbtvENZ7XCean+tuWF7vvgk0StsBSXLNckh9KR3fvb618iGf/4Z6Pv0QYoFLN
 YqIRac3hg+5qdJ5E=
X-Received: by 2002:a05:620a:1489:: with SMTP id
 w9mr30984054qkj.43.1607442457574; 
 Tue, 08 Dec 2020 07:47:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJl1EILToxIYrEU0JsJlhjZtMf48j3W/yD2GILUQIbkTcU56ZKjuDxboaAmWcfAO6KHhL2Wg==
X-Received: by 2002:a05:620a:1489:: with SMTP id
 w9mr30984029qkj.43.1607442457355; 
 Tue, 08 Dec 2020 07:47:37 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id x65sm671224qkc.130.2020.12.08.07.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 07:47:36 -0800 (PST)
Date: Tue, 8 Dec 2020 10:47:35 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v5 1/4] migration: introduce 'background-snapshot'
 migration capability
Message-ID: <20201208154735.GA21402@xz-x1>
References: <20201204093103.9878-1-andrey.gruzdev@virtuozzo.com>
 <20201204093103.9878-2-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201204093103.9878-2-andrey.gruzdev@virtuozzo.com>
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

On Fri, Dec 04, 2020 at 12:31:00PM +0300, Andrey Gruzdev wrote:
> +static
> +WriteTrackingSupport migrate_query_write_tracking(void)
> +{
> +    static WriteTrackingSupport wt_support = WT_SUPPORT_UNKNOWN;

Better to be non-static - consider uncompatible memory can be hot plugged after
it's once set.

With static removed (I think most of below if clauses can be unwrapped too, but
your call), feel free to add:

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

> +
> +    /* Check UFFD-IO and memory backends for compatibility only once */
> +    if (wt_support == WT_SUPPORT_UNKNOWN) {
> +        wt_support = WT_SUPPORT_ABSENT;
> +        /* Check if kernel supports required UFFD features */
> +        if (ram_write_tracking_available()) {
> +            wt_support = WT_SUPPORT_AVAILABLE;
> +            /*
> +             * Check if current memory configuration is
> +             * compatible with required UFFD features.
> +             */
> +            if (ram_write_tracking_compatible()) {
> +                wt_support = WT_SUPPORT_COMPATIBLE;
> +            }
> +        }
> +    }
> +
> +    return wt_support;
> +}
> +#endif /* CONFIG_LINUX */

-- 
Peter Xu


