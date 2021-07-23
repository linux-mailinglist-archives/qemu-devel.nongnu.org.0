Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F25E3D3A24
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 14:24:30 +0200 (CEST)
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6uE9-00039l-6Z
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 08:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6uCG-0001Pt-Ui
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 08:22:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6uCD-0007fg-27
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 08:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627042948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XBLwXyfu2eHuAwjZStpOCiAdl2G1Wj/qVI5YbHLj+mM=;
 b=MsWq2t0WQZ9Kh5daBEKQU3+rD3YoshDNs4zpvjNTRav67pEHaXGUTuI9uVc355qj9KLBls
 g+q1yTtXLBN2i0wDj4FqjLJEP9CiJ7l1Ts2pPNaDS3/DJYvA9H+8DYf4i3APbgpCI9N+0B
 GI2Guhh1ZQg9W/JvlStJN0W0yTJCAvg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-5ekgShtTOhWaDKlNtECFNA-1; Fri, 23 Jul 2021 08:22:25 -0400
X-MC-Unique: 5ekgShtTOhWaDKlNtECFNA-1
Received: by mail-qv1-f69.google.com with SMTP id
 7-20020a0562140d47b02902d89f797d08so1637115qvr.17
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 05:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XBLwXyfu2eHuAwjZStpOCiAdl2G1Wj/qVI5YbHLj+mM=;
 b=aHDFWGdyglAC/t/olNX5+LPQ7FmtP5vuoQxxOREezYNEFlaXzpsb3hG3OW0j9vg8JW
 VzCbKX56XjobJJr9aujz5SQIGWGPRQcFV16ofJe2NfcIcJ02ppOL6UMLtu3AswgRXB3e
 47KOd1gKRPiU5Dg4AE+LmsCHOzH0yZlXKnV1IDYEvgYcZo6i5aAW8nAZ1MTsRpF61BHv
 rpyUqkjdL/aeyA2suypBJxeKfev97apNHn5nAfJclnKb/C2sP3OI12QejffHroCKs3fr
 EwxWg79pC1VByA2pk7oyEyHtuD4ksrvyqjEOfkI1JOl4kQjrU9YdMU2lUpa+mQNxjWYi
 zzNg==
X-Gm-Message-State: AOAM533AhQxSSwZyI7GCDSTaX7Ba3mM9pw0UbGc3+V1zFNJCC6oETEJ8
 BHA46/hKeP0+7vV9IyavxCia2LUtI1CHkMdVLZXgvgeWjIIIymts8JZqa2iX2OdPTwwfUPclJgt
 GV0G/Q3CJV3ox3FU=
X-Received: by 2002:a05:6214:cac:: with SMTP id
 s12mr4201955qvs.29.1627042944775; 
 Fri, 23 Jul 2021 05:22:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzY9PxZXfUtjr9EfgReM2wj540QZQ/Ci6z1v3JyN6gjzd6zl0jq1gGRPq5MvJsdZ04378LaAQ==
X-Received: by 2002:a05:6214:cac:: with SMTP id
 s12mr4201944qvs.29.1627042944611; 
 Fri, 23 Jul 2021 05:22:24 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id a11sm7607312qkl.125.2021.07.23.05.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 05:22:23 -0700 (PDT)
Date: Fri, 23 Jul 2021 08:22:22 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: Add memory_mapping.h and
 memory_mapping.c to "Memory API"
Message-ID: <YPq0fpEP1Y6XXK3o@t490s>
References: <20210723100532.27353-1-david@redhat.com>
 <20210723100532.27353-4-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210723100532.27353-4-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 12:05:32PM +0200, David Hildenbrand wrote:
> Both files logically belong to "Memory API" and are not yet listed
> anywhere else explicitly. Let's add them to "Memory API".
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


