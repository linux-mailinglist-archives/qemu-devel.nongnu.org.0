Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081923FF6CD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 00:03:36 +0200 (CEST)
Received: from localhost ([::1]:44210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLuo2-0007L6-Hb
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 18:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLugi-0002N4-0u
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 17:56:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLugW-0001VJ-5M
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 17:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630619746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+quMpSkIy/ZsUZQkPqHlJ62056sq3wF2WCD1hvUJU9c=;
 b=g3a6+rRiMIfst1YrNwW4tEnqZZ7BKMvH7Perr8poFpaY29s6/mnnLZBDYudDMutokS6/Bk
 h4BsZz1fxTLYN2uX7DNpf4mbozRT9TEe+7NpGydvr+L/cnWxqWSwRjv157YVog2WUsKGsz
 5eWev/Dxx0MNRIudFM3JAWGhis+Htfc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-gGM-7WgHOK2dMjVM59JGyw-1; Thu, 02 Sep 2021 17:55:45 -0400
X-MC-Unique: gGM-7WgHOK2dMjVM59JGyw-1
Received: by mail-qt1-f200.google.com with SMTP id
 z16-20020ac86b90000000b0029eec160182so3224124qts.9
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 14:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+quMpSkIy/ZsUZQkPqHlJ62056sq3wF2WCD1hvUJU9c=;
 b=Gr7GQstzvC54jwrXyJUNa02aYUraX2uRDktVUVyigV4blQvcjrzVjSLRge0aGHQyM8
 uL6vYXhW2KFjVL6NBetlw3caNS+cwQKaFjEGsne6MrbCtEnT8OtMj2+13NSzP4UynOxV
 RSso1QonID5+P1e7ssGjOFXWcGgf+EcNVD60Ob2hI5ixUzuBSP+TrKpsyHIBGfCcxFlY
 eS12D99+K5Y/2h7sFDPljncfJ6QYyFXI6z1hI/PWWYL3TNi9/1K7PWo887znN7xvHU/y
 WhxBMX6bGVCn70gHUQbqL3vc4wFeaISBDmhKUN+o5By6InBVRV4QEZeY62RPZU6rdHHQ
 F65A==
X-Gm-Message-State: AOAM5335YknRLaNpWTPRwSSPn8lmDX5XKykWrtD8SRvodLaZPdken0RT
 9IxjfrYtp2LFagn1YBUk7zuCZJnnFK+brHS3A25dIZLTcbaMpKgYO4iJJ5wHqn+kDxjqhOic4bP
 TIL2W41SDiCik3Jw=
X-Received: by 2002:a0c:f74d:: with SMTP id e13mr531623qvo.40.1630619744677;
 Thu, 02 Sep 2021 14:55:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrSy+MWqZeGIdUKZ4fqFswcjeP+Uw8YQ3Q5dFVdPVw6E5LctiB8b/eaQOZULkGjJjTcUj/9g==
X-Received: by 2002:a0c:f74d:: with SMTP id e13mr531607qvo.40.1630619744498;
 Thu, 02 Sep 2021 14:55:44 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id i2sm2551502qkf.3.2021.09.02.14.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 14:55:44 -0700 (PDT)
Date: Thu, 2 Sep 2021 17:55:42 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 2/2] memory: Have 'info mtree' remove duplicated
 Address Space information
Message-ID: <YTFIXrxd0i6GZbtG@t490s>
References: <20210902062604.182620-1-philmd@redhat.com>
 <20210902062604.182620-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210902062604.182620-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Phil,

On Thu, Sep 02, 2021 at 08:26:04AM +0200, Philippe Mathieu-Daudé wrote:
>   address-space shared 4 times:

I commented on the format of the output, I saw that it's switched back to the
v1.  Any reason?

Although I still think what I proposed looks better, I don't have a strong "no"
to this either.  Just want to know the motivations.

E.g., for a script parsing this output, it can easily skip and identify
duplications when scanned "address-space:" following another "address-space:".
Now it needs to understand two layouts, and that "N times" looks superfluous.

>     - bcm2835-dma-memory
>     - bcm2835-fb-memory
>     - bcm2835-property-memory
>     - dwc2
>     0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
>       0000000000000000-000000003fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       0000000040000000-000000007fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-peripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
>       0000000080000000-00000000bfffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       00000000c0000000-00000000ffffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
> 
>   address-space: bcm2835-mbox-memory
>     0000000000000000-000000000000008f (prio 0, i/o): bcm2835-mbox
>       0000000000000010-000000000000001f (prio 0, i/o): bcm2835-fb
>       0000000000000080-000000000000008f (prio 0, i/o): bcm2835-property

-- 
Peter Xu


