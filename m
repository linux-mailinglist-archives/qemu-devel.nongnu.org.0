Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763F053536C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 20:38:26 +0200 (CEST)
Received: from localhost ([::1]:52852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuINN-0008QK-5z
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 14:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nuIMR-0007cW-Em
 for qemu-devel@nongnu.org; Thu, 26 May 2022 14:37:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nuIMO-0004dG-IX
 for qemu-devel@nongnu.org; Thu, 26 May 2022 14:37:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653590243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iZXZyOBj9K/G+WFDwIrle6dO9n3UzwXZHEEzIr/nzYk=;
 b=EcN/9lvQ2vCfiG/e2xYWoODYOQEkXUaYtUvRX8268CA1WFkXVfs8Auaql9IoYONSvGMBJ2
 6mBRqFgpr/pG17PrvReBn5zLlg5IX/OcoO4i8GXSCQbuDVXT7FP6pM8DtGv6bu6c+vKTFY
 TgD6/kjuAvbgplcnNHYCZRAbPn5ChMU=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-o6Y_R8uzO2iFB1pntZjEgA-1; Thu, 26 May 2022 14:37:21 -0400
X-MC-Unique: o6Y_R8uzO2iFB1pntZjEgA-1
Received: by mail-io1-f71.google.com with SMTP id
 y13-20020a056602164d00b0065a9dec1ef2so1465611iow.23
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 11:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iZXZyOBj9K/G+WFDwIrle6dO9n3UzwXZHEEzIr/nzYk=;
 b=i7SlwH85A/jWB/IaTOGvPDVb0e1yUhh4egGadLOpXQvAI70Jg49j5ADUIP+9aM+/55
 JlqX/c/zsw2UuDmUZX47fkM9MoJL7SYNXFCPjMh1bcLTAP2Y8+yVFKroZqYsu7iv/gv0
 ScD9VKtWsdNo9cTaRlr8IMivEiOB7ALIGRZAAXckbBzDKp4NYvrUCw8InRA4DJcLr7O7
 dIuI6Dduk1wS5vRvJzzIdw8H70vzBP95TwLdAkvh/pPTa3jKquIdnuf9yOg2PGzAf6jk
 8ongn/gfSwKQ4C2Z49gcKuUx5LbWWTxbm8C/f2PBBfZ2D0s31AHmIyrvkALyWYQRkSK5
 C1cw==
X-Gm-Message-State: AOAM533hEb4FZJyCwQE07w+zsnmiiRBH+tT9l/rO2U/e3khiMs4d7rlI
 qXrLzDsS6EspBi51kXxyLtWl1y44tBVTld8EYCGdlQtmlavUNEjubdd09So9VWLrx4bf+78AF7Y
 MGuiMLDKRkL49C2E=
X-Received: by 2002:a05:6638:4901:b0:32f:d52c:924c with SMTP id
 cx1-20020a056638490100b0032fd52c924cmr6248113jab.8.1653590241277; 
 Thu, 26 May 2022 11:37:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpP2TSvS6e9NpQEMUP3qCECYxWtAnkzb4ugRqwUnJ/Y/Oan//xTqCMVr3HgbEkayorckxxRg==
X-Received: by 2002:a05:6638:4901:b0:32f:d52c:924c with SMTP id
 cx1-20020a056638490100b0032fd52c924cmr6248102jab.8.1653590241044; 
 Thu, 26 May 2022 11:37:21 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 x89-20020a0294e2000000b0032e43cb7344sm575684jah.146.2022.05.26.11.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 11:37:20 -0700 (PDT)
Date: Thu, 26 May 2022 14:37:18 -0400
From: Peter Xu <peterx@redhat.com>
To: Jue Wang <juew@google.com>
Cc: pizhenwei@bytedance.com, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, jasowang@redhat.com,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 mst@redhat.com,
 HORIGUCHI =?utf-8?B?TkFPWUEo5aCA5Y+jIOebtOS5nyk=?= <naoya.horiguchi@nec.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 0/3] recover hardware corrupted page by virtio balloon
Message-ID: <Yo/I3oLkd9OU0ice@xz-m1.local>
References: <CAPcxDJ5pduUyMA0rf+-aTjK_2eBvig05UTiTptX1nVkWE-_g8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPcxDJ5pduUyMA0rf+-aTjK_2eBvig05UTiTptX1nVkWE-_g8w@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 25, 2022 at 01:16:34PM -0700, Jue Wang wrote:
> The hypervisor _must_ emulate poisons identified in guest physical
> address space (could be transported from the source VM), this is to
> prevent silent data corruption in the guest. With a paravirtual
> approach like this patch series, the hypervisor can clear some of the
> poisoned HVAs knowing for certain that the guest OS has isolated the
> poisoned page. I wonder how much value it provides to the guest if the
> guest and workload are _not_ in a pressing need for the extra KB/MB
> worth of memory.

I'm curious the same on how unpoisoning could help here.  The reasoning
behind would be great material to be mentioned in the next cover letter.

Shouldn't we consider migrating serious workloads off the host already
where there's a sign of more severe hardware issues, instead?

Thanks,

-- 
Peter Xu


