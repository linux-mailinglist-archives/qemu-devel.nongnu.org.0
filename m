Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E575432EF43
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:45:13 +0100 (CET)
Received: from localhost ([::1]:34382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICdc-0002Mh-TF
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lICW7-0002ud-6O
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:37:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lICW2-0003bG-Eg
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:37:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614958640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VM5usnxbwbdMQmAkNqSEXWFDqDsME8ZUFNJtssClblc=;
 b=PiW2vWDPZgOiTqpV86s3ePg3NORGvFCU6N9AoBM7u0Y6zguEvtv5TGJp5Eoz2s6088AS3d
 r9Zwhyku7yg5Vr9Mel73RH04k+eIIj6U9Vomp8214yEt4Chj4dirDshuQslw6JU1P5Yr65
 xpULVl/L7Omcfd2V8teA1QSb4xpSt/o=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-M-MCHRUcP0elOzyfFnEkGA-1; Fri, 05 Mar 2021 10:37:16 -0500
X-MC-Unique: M-MCHRUcP0elOzyfFnEkGA-1
Received: by mail-qt1-f200.google.com with SMTP id k4so1884099qtd.20
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 07:37:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VM5usnxbwbdMQmAkNqSEXWFDqDsME8ZUFNJtssClblc=;
 b=Qpx5yMtj59jXlAMShWIDeY23OEcyS2j5Vc5EmfOKJH0OwIVhNJSv+SmDg5UqnrfCMv
 dztOl+DsxgISQyOCSHKYSCKTRO5J1Y5E9VlFTCTMT0BOwsZO54GV0wFbyMZB2CDZnczK
 NAWAE5SQ3kX827+Rzi1F/8+r86jyS+q3SSBfILW+f/HIs2HK8hU9r7SsV8hBJlrcMoTc
 vxiRn5u+mhKQEpyAZeR/mpUKDWR2Ag+fqifiHNGKmt1fXv5N4NuTedSFtQtVAFcyqUkr
 K51NcDYyDhclFEzLqrWxU45dz6f9s6vhOSrGF1pIHIr4/f0l4UuHRNtH3ZhI9K1SVQ2J
 f04g==
X-Gm-Message-State: AOAM5304uf6SqCSF9ri0EXuH7ovE3/dNp7nMPVUU3IG98mYkC5zWklQJ
 SR3kQwjPH3fG0LefEGBlOBwEsQpN/W7bqkQNI+uvnPJp2JMfkuwxPmI5D5dL3dJv8RHMwR63PlJ
 twsTnbL4a0DeAAyo=
X-Received: by 2002:a05:6214:aae:: with SMTP id
 ew14mr9540449qvb.24.1614958636122; 
 Fri, 05 Mar 2021 07:37:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyB4JZtMASx0k65cuavabY0PrSoysqOM6feB49hI/cytiY6dkQjJwkq5kXlzFeukx6oQdfC4A==
X-Received: by 2002:a05:6214:aae:: with SMTP id
 ew14mr9540423qvb.24.1614958635882; 
 Fri, 05 Mar 2021 07:37:15 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id a9sm1995727qtx.96.2021.03.05.07.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:37:15 -0800 (PST)
Date: Fri, 5 Mar 2021 10:37:13 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 7/9] memory: introduce RAM_NORESERVE and wire it up in
 qemu_ram_mmap()
Message-ID: <20210305153713.GG397383@xz-x1>
References: <20210305101634.10745-1-david@redhat.com>
 <20210305101634.10745-8-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210305101634.10745-8-david@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
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

On Fri, Mar 05, 2021 at 11:16:32AM +0100, David Hildenbrand wrote:
> Let's introduce RAM_NORESERVE, allowing mmap'ing with MAP_NORESERVE. The
> new flag has the following semantics:
> 
>   RAM is mmap-ed with MAP_NORESERVE. When set, reserving swap space (or
>   huge pages on Linux) is skipped: will bail out if not supported. When not
>   set, the OS might reserve swap space (or huge pages on Linux), depending
>   on OS support.
> 
> Allow passing it into:
> - memory_region_init_ram_nomigrate()
> - memory_region_init_resizeable_ram()
> - memory_region_init_ram_from_file()
> 
> ... and teach qemu_ram_mmap() and qemu_anon_ram_alloc() about the flag.
> Bail out if the flag is not supported, which is the case right now for
> both, POSIX and win32. We will add the POSIX mmap implementation next and
> allow specifying RAM_NORESERVE via memory backends.
> 
> The target use case is virtio-mem, which dynamically exposes memory
> inside a large, sparse memory area to the VM.
> 
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Stefan Weil <sw@weilnetz.de>
> Cc: kvm@vger.kernel.org
> Cc: qemu-s390x@nongnu.org
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


