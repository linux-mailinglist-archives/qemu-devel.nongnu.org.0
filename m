Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E64032EF53
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:49:03 +0100 (CET)
Received: from localhost ([::1]:44588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIChK-0006eE-AI
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lICal-0008QH-Oa
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:42:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lICah-0005j7-Aj
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:42:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614958930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vVL67c/WNgKqHQyf9emFhoJH10bfpZyRPUkSC5FmR8A=;
 b=iqeXUEnxq2bUzwr5dyzt7yyfnaOSMIOrKew994YjjGiKUUW2e/xrdn9Jg0gTgnN8CVPj4n
 9cyDnXjo1xFQKk0Bezi75oqGac67aFoZNHu3ZKzu8zwz071r9NSUjbglFTAxeYqxsbW/II
 vJCGpBRc7u2bslI3psH06EbpYYPNQR0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-POGQ5iskNN-JLX9Zjkpn_w-1; Fri, 05 Mar 2021 10:42:09 -0500
X-MC-Unique: POGQ5iskNN-JLX9Zjkpn_w-1
Received: by mail-qv1-f71.google.com with SMTP id iy2so1786500qvb.22
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 07:42:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vVL67c/WNgKqHQyf9emFhoJH10bfpZyRPUkSC5FmR8A=;
 b=WGBS+oiHFplYVQTa99JXh52k6Q3J/ihgW7KZLaEclxC2TQFi3pix5py+NaW2B1qaho
 4+A2I9hHhgXG3+zJWkKZ4iYv2DNU/z3OWjZd6ZPRciE5OuQ3PXk2qaKXpN0g4aBxqbJb
 3w0ku1zKgedhS/CNYMMgo1Q0dwtB7ZaJQr094+wI5eynr+UrScR3W9fd5GbtyeR+BbkS
 uGIH5Gyuam4ypRIme8h9S6Cla1yxGqQ2Vp3uoyeugXWu8lqflZtlT6OnYo+8widSR/yv
 5nrry/nobaiq9Q2CiorewTEXBqinHvHUwmU0kvUjIDcr+8zGMfc0FcxsVm2PZcZF2SSr
 Te3g==
X-Gm-Message-State: AOAM532jVtJTmd3PoJYleUH+qngcMfvF6MVvYBM5vdx2NVozUemEawDi
 HwIXN5nxEiZ9SReojofuyt28RIP1kIaCR2OvH1VP9TTsAztjJbKgUhPFHq1szapu+VaHFyPT25N
 LYlsZMG95oGSdXd0=
X-Received: by 2002:ac8:6988:: with SMTP id o8mr9423248qtq.24.1614958928663;
 Fri, 05 Mar 2021 07:42:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVQscX/7P2Y8WzLoPT9wNX3QRYe46tt9FPIDfoUrVfyXajcYSkOl/CZX+ZYfc3Zwa9jhnpKw==
X-Received: by 2002:ac8:6988:: with SMTP id o8mr9423226qtq.24.1614958928468;
 Fri, 05 Mar 2021 07:42:08 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id z78sm2068430qka.38.2021.03.05.07.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:42:08 -0800 (PST)
Date: Fri, 5 Mar 2021 10:42:06 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 8/9] util/mmap-alloc: Support RAM_NORESERVE via
 MAP_NORESERVE
Message-ID: <20210305154206.GH397383@xz-x1>
References: <20210305101634.10745-1-david@redhat.com>
 <20210305101634.10745-9-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210305101634.10745-9-david@redhat.com>
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

On Fri, Mar 05, 2021 at 11:16:33AM +0100, David Hildenbrand wrote:
> +#define OVERCOMMIT_MEMORY_PATH "/proc/sys/vm/overcommit_memory"
> +static bool map_noreserve_effective(int fd, bool readonly, bool shared)
> +{

[...]

> @@ -184,8 +251,7 @@ void *qemu_ram_mmap(int fd,
>      size_t offset, total;
>      void *ptr, *guardptr;
>  
> -    if (noreserve) {
> -        error_report("Skipping reservation of swap space is not supported");
> +    if (noreserve && !map_noreserve_effective(fd, shared, readonly)) {

Need to switch "shared" & "readonly"?

>          return MAP_FAILED;
>      }

-- 
Peter Xu


