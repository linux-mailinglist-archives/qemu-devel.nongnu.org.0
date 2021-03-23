Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A69346A7B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 21:54:58 +0100 (CET)
Received: from localhost ([::1]:58924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOo3F-0000o9-5u
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 16:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOo0S-0007UB-2Z
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:52:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOo0Q-0007eG-5h
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616532721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5RjugbA4EoDbVuOFcbTNyO2AAeWK3onGdBCyltyTZGY=;
 b=P5z9hZnJR14OrfSRkkBf8hn2NkUJCWx7LgJKGaxq1iP7LQznqcgVO2tyA23maROi3l/n8Q
 m1xxN0DPFBZ4G4tRlRSzv4mYy8UEbxj+04ZSm/ep2KLm7GK4Z8C77U76e64q9/NBi0Uaow
 OMf38Im25ScHZhUzplKQ/c5EsDjsK5g=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-EvrQixUwPQmZx_Gx2WH3yw-1; Tue, 23 Mar 2021 16:51:59 -0400
X-MC-Unique: EvrQixUwPQmZx_Gx2WH3yw-1
Received: by mail-qt1-f199.google.com with SMTP id r32so1973074qtd.16
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 13:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5RjugbA4EoDbVuOFcbTNyO2AAeWK3onGdBCyltyTZGY=;
 b=Pu6Re1ZXVolBCgcydvz99EG4FHTkU4/Iez4SI54dYN7p4tZ5NhuNQPmTWvu1EXKFbc
 IE0JHKMUQXifNAcosrHa5iQIOSSYt+IDKvr2B2wO0LLLj0HtyXFvL5oefn3nokeAlXTp
 B/YoEUQ25Ur6z+j0C7cZBs9iZgVZ8OKIVAiY377wsdMiqA818gar6jIvZTcEt+9Pjjtc
 m/Urs5gOnI0RJcwNijKCjGRjxwQ+7wFV4LWBvubN0yDGtVfH+46b95HG4yO1okPCweYY
 5cCjG2J87wdChfBBKsz0pvyrw18zLHGdnlxut1MOP5lHX1aBa68s/e9lggs23bLpLsoe
 0M7g==
X-Gm-Message-State: AOAM531hhry87FC368KH04mFuxyN/8v9Tlgu4hRvn1xe1I4k/sHNoF4V
 xtjJiAhRK7TWMI4OPUV3YfWBl2Q3zFGtoMjI2Ln9OdHZux666L9r0Q5WZTG5c7OWaKoqYsloJkX
 OT4rHQaB62XL8e5I=
X-Received: by 2002:a37:b6c4:: with SMTP id g187mr7583038qkf.162.1616532718793; 
 Tue, 23 Mar 2021 13:51:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrdzggcdFiFecSolV5/GhsXf/wfrbM6g0GJ1ZlwvC0gIxLm03LqIkGCjZoqQ2xSw47QjL9BQ==
X-Received: by 2002:a37:b6c4:: with SMTP id g187mr7583025qkf.162.1616532718591; 
 Tue, 23 Mar 2021 13:51:58 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id 77sm53350qko.48.2021.03.23.13.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 13:51:58 -0700 (PDT)
Date: Tue, 23 Mar 2021 16:51:56 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 10/14] memory: Introduce RAM_NORESERVE and wire it up
 in qemu_ram_mmap()
Message-ID: <20210323205156.GM6486@xz-x1>
References: <20210319101230.21531-1-david@redhat.com>
 <20210319101230.21531-11-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210319101230.21531-11-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 19, 2021 at 11:12:26AM +0100, David Hildenbrand wrote:
> Let's introduce RAM_NORESERVE, allowing mmap'ing with MAP_NORESERVE. The
> new flag has the following semantics:
> 
> "
> RAM is mmap-ed with MAP_NORESERVE. When set, reserving swap space (or huge
> pages if applicable) is skipped: will bail out if not supported. When not
> set, the OS might do the reservation, depending on OS support.
> "
> 
> Allow passing it into:
> - memory_region_init_ram_nomigrate()
> - memory_region_init_resizeable_ram()
> - memory_region_init_ram_from_file()
> 
> ... and teach qemu_ram_mmap() and qemu_anon_ram_alloc() about the flag.
> Bail out if the flag is not supported, which is the case right now for
> both, POSIX and win32. We will add Linux support next and allow specifying
> RAM_NORESERVE via memory backends.
> 
> The target use case is virtio-mem, which dynamically exposes memory
> inside a large, sparse memory area to the VM.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


