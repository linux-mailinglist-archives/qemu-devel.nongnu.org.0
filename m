Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1973DA0A8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 11:55:21 +0200 (CEST)
Received: from localhost ([::1]:34474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m92l5-0001y1-Tj
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 05:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m92k2-0001A3-KJ
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 05:54:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m92jy-0002HW-5M
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 05:54:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627552449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=skStFmpJ67QMVTtLU4r8jnmSP4g58NZlRw+HXmZLMAM=;
 b=JoLcIPAFllsJS6MaMhqFGtVHzTuz1QFOPaZE0laCJUkyZHKoaHuz+pLbq4KiQaj17HFpU8
 4TTdmezx5KIjKMHnCCnAsEp2lIkPcv8WNrtCDXPVKDtIgNLRSvZZmYa964emLMROIVX4AI
 y1d+XQas2vWxpxq0f3ptJIad8h1ddvw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-K0ZKzGN1OwSSa27W-vbxZQ-1; Thu, 29 Jul 2021 05:54:05 -0400
X-MC-Unique: K0ZKzGN1OwSSa27W-vbxZQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 u25-20020aa7d8990000b02903bb6a903d90so2678392edq.17
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 02:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=skStFmpJ67QMVTtLU4r8jnmSP4g58NZlRw+HXmZLMAM=;
 b=SlkrGrTB6oU6pgSiFGt/K8mfp1zuP6SsadttkOHAZrj6qNRMoLEGpyXP4xWTtbQAQW
 LmAAyYod6H1YaVtNoP2BupsgWn01m0zyFuxzJ+VxfFaKWFcOlaq3xu3rQAcALTl3wz5Q
 ElM+BtE8qGNQqw3+5KKfmptDCs/GlSy4dCSfyx4m4GQg2XlXjyuEgpIFBX4oDWgZbQOx
 0sXcfSMDXSLA/EMYGgmtcOeNz/4w/CUtrXl/NVysD4aHFiDCbHcofnlACLrY7xD8G502
 k/YaVNmofgMJ8xyj+FGYAsPNv5O4nYXAvmGusHis6j58dhM+YOdFZhWwnkHMXLK1eFyc
 d3ow==
X-Gm-Message-State: AOAM530CcPNuo9P01q1u2TRW7bKcSVRcMY6rhH6nOdaOZWAB5uxsBvQM
 W6ewZo3FBYKnqoLffHgRvu7AhsMjAenAGDw9EPvBhTNI/Ao8KbIjAao47nQFO3FEhI7K8nABpS5
 QZTeabxdFNCdDkNY=
X-Received: by 2002:a05:6402:14da:: with SMTP id
 f26mr5128124edx.259.1627552444767; 
 Thu, 29 Jul 2021 02:54:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQZrPy3ZPTfgLsh+Nd6hmR3oTXbT1ZlnE+NtZi1WIsSo84WJbKm/y9vC90yCqtwJH03+g9/A==
X-Received: by 2002:a05:6402:14da:: with SMTP id
 f26mr5128108edx.259.1627552444570; 
 Thu, 29 Jul 2021 02:54:04 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id a35sm987328edf.80.2021.07.29.02.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 02:54:04 -0700 (PDT)
Date: Thu, 29 Jul 2021 11:54:02 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH v2] block/io_uring: resubmit when result is -EAGAIN
Message-ID: <20210729095402.efmtilww4mt2qghe@steredhat>
References: <20210729091029.65369-1-f.ebner@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <20210729091029.65369-1-f.ebner@proxmox.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Linux io_uring" <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 29, 2021 at 11:10:29AM +0200, Fabian Ebner wrote:
>Linux SCSI can throw spurious -EAGAIN in some corner cases in its
>completion path, which will end up being the result in the completed
>io_uring request.
>
>Resubmitting such requests should allow block jobs to complete, even
>if such spurious errors are encountered.
>
>Co-authored-by: Stefan Hajnoczi <stefanha@gmail.com>
>Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
>---
>
>Changes from v1:
>    * Focus on what's relevant for the patch itself in the commit
>      message.
>    * Add Stefan's comment.
>    * Add Stefano's R-b tag (I hope that's fine, since there was no
>      change code-wise).

Yep, it's fine :-)

Thanks,
Stefano


