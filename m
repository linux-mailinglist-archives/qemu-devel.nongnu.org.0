Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7708932A88C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:52:24 +0100 (CET)
Received: from localhost ([::1]:44988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9C2-0006m8-FB
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lH9BC-0006Hu-2X
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:51:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lH9B9-0006eZ-FS
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614707485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NPmfNXi0jJs743tSoQ39+0ismQEquLzll46MiGII7GM=;
 b=KQfOjjr82g+V0mH4/gXEGsCUs1sHg3e0wzfxI+0+fp6BzXVHqW2E1TYIaj/g5afaGdlUAw
 7DZmpoZIR50PnkvMT9Zi/yzNsqs63ixO/4XFgwjpS5c/WGF7TM6yb9PjWL/AfPWmCDwQUb
 DmWxZXk6Yug/OFUW4Ui43ZBX9LHr7jc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-JJJ3ZpcTPKm0ddzZBwv25g-1; Tue, 02 Mar 2021 12:51:22 -0500
X-MC-Unique: JJJ3ZpcTPKm0ddzZBwv25g-1
Received: by mail-qt1-f198.google.com with SMTP id b18so6946476qtt.6
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:51:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NPmfNXi0jJs743tSoQ39+0ismQEquLzll46MiGII7GM=;
 b=BCtqsEE0vVKJGYQmhXN3i4lOyueWYrpD1Qj+DVk8tovhQMbYXdvR9nRxgaXWlJYYQi
 V65hpS/tmykb/xQ+T0L69wVW22LCHbNVkvXKjdpFEzVs83KNV/GBQiHjP/7ISte+MyML
 ITNJ9Bht4jH/mebhjuw9rHSHKyXRItCYmnOA0aN/mlCG558oXJHLLwpyVO+MR2mqDNCp
 ClWW8bltlY7grYDLDfl5owfjMJWWhs85YvMkIAbxMNh9Dum+KyIXiaOUy0BqgY9LiRBC
 Tq1mVrxRlFMk2xOig4DFthIW5Fi9od6l4NNUKPOXEKR+aLbzi1u1/VmrunZ+8sbevnI5
 6sAw==
X-Gm-Message-State: AOAM532eP/D/WRg4sfDv/Y6M3q0Lj2L1EImliOAfoAbSBK4gSYVDWED0
 zOyw+mO6rIJvJnibAt2AWuY+FPVPhXrFsUYr6wLH1qGY26V7Ukgp/FBltKcFMwxh5Eqc3LY9WIH
 ssNQNvg+NP2F88iw=
X-Received: by 2002:ac8:5c02:: with SMTP id i2mr14387628qti.301.1614707481747; 
 Tue, 02 Mar 2021 09:51:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzi0lHT+nnV+/+3p+JwdJN+zLJqy+/l7fiLWO++tG05gDcSBG7ho2wQUzUOPK/HHXj3ACTolA==
X-Received: by 2002:ac8:5c02:: with SMTP id i2mr14387596qti.301.1614707481486; 
 Tue, 02 Mar 2021 09:51:21 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id l29sm7342918qtu.35.2021.03.02.09.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:51:21 -0800 (PST)
Date: Tue, 2 Mar 2021 12:51:12 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 8/9] util/mmap-alloc: support RAM_NORESERVE via
 MAP_NORESERVE
Message-ID: <20210302175112.GN397383@xz-x1>
References: <20210209134939.13083-1-david@redhat.com>
 <20210209134939.13083-9-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209134939.13083-9-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 02:49:38PM +0100, David Hildenbrand wrote:
> +#define OVERCOMMIT_MEMORY_PATH "/proc/sys/vm/overcommit_memory"
> +static bool map_noreserve_effective(int fd, bool shared)
> +{
> +#if defined(__linux__)
> +    gchar *content = NULL;
> +    const char *endptr;
> +    unsigned int tmp;
> +
> +    /* hugetlbfs behaves differently */
> +    if (qemu_fd_getpagesize(fd) != qemu_real_host_page_size) {
> +        return true;
> +    }
> +
> +    /* only private shared mappings are accounted (ignoring /dev/zero) */
> +    if (fd != -1 && shared) {
> +        return true;
> +    }
> +
> +    if (g_file_get_contents(OVERCOMMIT_MEMORY_PATH, &content, NULL, NULL) &&
> +        !qemu_strtoui(content, &endptr, 0, &tmp) &&
> +        (!endptr || *endptr == '\n')) {
> +        if (tmp == 2) {
> +            error_report("Skipping reservation of swap space is not supported: "
> +                         " \"" OVERCOMMIT_MEMORY_PATH "\" is \"2\"");
> +            return false;
> +        }
> +        return true;
> +    }
> +    /* this interface has been around since Linux 2.6 */
> +    error_report("Skipping reservation of swap space is not supported: "
> +                 " Could not read: \"" OVERCOMMIT_MEMORY_PATH "\"");
> +    return false;
> +#else
> +    return true;
> +#endif
> +}

I feel like this helper wants to fail gracefully for some conditions.  Could
you elaborate one example and attach to the commit log?

I'm also wondering whether it would worth to check the global value.  Even if
overcommit is globally disabled, do we (as an application process) need to care
about it?  I think the MAP_NORESERVE would simply be silently ignored by the
kernel and that seems to be design of it, otherwise would all apps who uses
MAP_NORESERVE would need to do similar things too?

Thanks,

-- 
Peter Xu


