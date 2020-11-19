Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C502B957F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 15:52:49 +0100 (CET)
Received: from localhost ([::1]:47152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kflIm-0005L7-Ml
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 09:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kflCs-0007lg-IR
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:46:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kflCq-0005Wf-Lh
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605797198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nBU9vCty/xUTtvWiRTKM3SNaAnXZsWQI+V6F25yzTt8=;
 b=iJuu0Gy8dmv3n58FCRdKZUa3alplE+joOIjsBy1ehpNcMnP/EL+/+3XZF1S4hEcvBBx0Yx
 6ai2rDZl3Z/o47IHgw6/KgsbLSk36SOSz5/5ZKgStlA9xVwts8uVNJeIcIjnEC7nwd3wAv
 BXiqsKJ41SwORbrTXI+BKEcYJTn4188=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-U3sUP7BWNmujxRBD9M-Cfw-1; Thu, 19 Nov 2020 09:46:34 -0500
X-MC-Unique: U3sUP7BWNmujxRBD9M-Cfw-1
Received: by mail-wr1-f70.google.com with SMTP id z13so2105601wrm.19
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 06:46:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nBU9vCty/xUTtvWiRTKM3SNaAnXZsWQI+V6F25yzTt8=;
 b=nGosDEJVjyTL4/4HB9wUxe+R2dK0YI/xWTK4EpZ2dwYXpPzKmHSIzBeSwf7QdSLP4n
 XaN43B4eRKGyPBtFXolVC/auwl7daVO3b0rFvDdYypjxjbj4YZWQbgH64Aqp9y38R2/e
 gYBM7Imn9ejV4eQRXIMVuJ8Jz+3G69tDoEpXiZQNgN2iRzcQBiOkGqN5mH3Jg/WSdn2x
 Ewa2reeofNfGx66GAdPGwDxtcVMnY2C5FdMCRDeelQwY6Gc2BdeTQRaLpBhDGbcmD0Pd
 ykdmRFjmbMohTnBdGIgzzvtb7Vn8qEHOuHlj3dGi9YvIlmYXGgWJ/RBJe33oTyrdvJ1h
 AYdQ==
X-Gm-Message-State: AOAM5332ZTI8CwdExAfnw3Jv9NaHeoofltdzlECx//hiXpbFI5TbREt8
 f1eV5h/ctveU3w3rcPfKLs/A4Cr0VIOlPaUGR8dERe18TjnkIWyVFMlHZ3mOgzcVQJBaIKgIGkb
 CpRrXcGsBB/scero=
X-Received: by 2002:a1c:e0c3:: with SMTP id x186mr4948928wmg.21.1605797193263; 
 Thu, 19 Nov 2020 06:46:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvmGgl1ENR3sYN4BkxpKKT1u0hPsLZxxmf1t2xm1+WIEcjQ7FNbjFySAZs3x19GfjQiwVI5Q==
X-Received: by 2002:a1c:e0c3:: with SMTP id x186mr4948910wmg.21.1605797193047; 
 Thu, 19 Nov 2020 06:46:33 -0800 (PST)
Received: from redhat.com (bzq-109-64-91-49.red.bezeqint.net. [109.64.91.49])
 by smtp.gmail.com with ESMTPSA id
 l13sm41378138wrm.24.2020.11.19.06.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 06:46:31 -0800 (PST)
Date: Thu, 19 Nov 2020 09:46:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 00/10] vhost/qemu: thread per IO SCSI vq
Message-ID: <20201119094315-mutt-send-email-mst@kernel.org>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <20201117164043.GS131917@stefanha-x1.localdomain>
 <b3343762-bb11-b750-46ec-43b5556f2b8e@oracle.com>
 <20201118113117.GF182763@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201118113117.GF182763@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, linux-scsi@vger.kernel.org, jasowang@redhat.com,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 target-devel@vger.kernel.org, pbonzini@redhat.com,
 Mike Christie <michael.christie@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 11:31:17AM +0000, Stefan Hajnoczi wrote:
> > My preference has been:
> > 
> > 1. If we were to ditch cgroups, then add a new interface that would allow
> > us to bind threads to a specific CPU, so that it lines up with the guest's
> > mq to CPU mapping.
> 
> A 1:1 vCPU/vq->CPU mapping isn't desirable in all cases.
> 
> The CPU affinity is a userspace policy decision. The host kernel should
> provide a mechanism but not the policy. That way userspace can decide
> which workers are shared by multiple vqs and on which physical CPUs they
> should run.

So if we let userspace dictate the threading policy then I think binding
vqs to userspace threads and running there makes the most sense,
no need to create the threads.

-- 
MST


