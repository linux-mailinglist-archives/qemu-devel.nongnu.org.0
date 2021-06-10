Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176A53A27F7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:12:16 +0200 (CEST)
Received: from localhost ([::1]:40698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrGjX-0002eN-61
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lrGiY-0001qE-Cx
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:11:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lrGiW-0000hj-VF
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623316272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P89WH58UfaFloX6ByQo9Lwv0BF8eJNvp0fcsPdAC1a0=;
 b=ahFI/XW/B+FtxsI34uMxfzAWwBFPaBdGFE29d7xL9+lDeX3CR1kh+IQ1t8lSxzLKq72YlS
 z7gL/8VxFyin3IumsAmvOvOHPBos37xzRCvPjb/8ET8Q0AgtkhZPpA64kIe2f0pm6+IeTE
 VbdICmihYph0IqS+/4a2kjifFL0I0F0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-OuZHYv3bM_S3C0BF_joIeQ-1; Thu, 10 Jun 2021 05:11:11 -0400
X-MC-Unique: OuZHYv3bM_S3C0BF_joIeQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 u20-20020a0560001614b02901115c8f2d89so592094wrb.3
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 02:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P89WH58UfaFloX6ByQo9Lwv0BF8eJNvp0fcsPdAC1a0=;
 b=CF/KW/weLPVDyBh+nf339Jecw6C/Y5fDoi8rTb16e9XK9ddELyneIDGkD6PwV3fbmu
 imB50SzkKSaMHZASq2KgHGjnmtbjsklGtqk4dWSVsce2SWDuYztrS9zV6V5JWrJkdScA
 Hd0kc/yGtb7e+OBVq23Atw/3npMOMW9MfLYfjQqj5gGK2FdifMcFHQUtf28DE1lVs9Jy
 kiLlllK3BxvesH7eO+plbMjMJYXaF2Nmz7JLziBfSU5sVMT1EcnXw8ygo5FnblCaAP0p
 JDXu0Zakm5s/QVNKdp/VXVSqjJ4ge/d+h27O1lXY1L6aqYv01+cBelbTJjTPjZHbjQOc
 0G3w==
X-Gm-Message-State: AOAM530jopnH3++WAlJT63/0IhNjouI0La5xaTlfdgVVl55qFo3Tcya/
 J2/tF1ktC+lQyX7SRdoo+cjB24DGhDSAzuUE89y53yf0mhkLhdujitYNsmkZchaioc12/gB7ONw
 2/OaNSGGIAMbXlP8=
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr4110713wrz.256.1623316269866; 
 Thu, 10 Jun 2021 02:11:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcT7mLakU1NWluOSrkiCvI0l8vtW8hcSPDhVey7VoAlvHjrMwmpugZEledzvqYYqfDw42FHA==
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr4110694wrz.256.1623316269715; 
 Thu, 10 Jun 2021 02:11:09 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id y8sm9329730wmi.45.2021.06.10.02.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 02:11:09 -0700 (PDT)
Date: Thu, 10 Jun 2021 11:11:07 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 4/7] vhost-user-blk: Add Error parameter to
 vhost_user_blk_start()
Message-ID: <20210610091107.4kuw67r6o774vug5@steredhat>
References: <20210609154658.350308-1-kwolf@redhat.com>
 <20210609154658.350308-5-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210609154658.350308-5-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 05:46:55PM +0200, Kevin Wolf wrote:
>Instead of letting the caller make up a meaningless error message, add
>an Error parameter to allow reporting the real error.
>
>Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>---
> hw/block/vhost-user-blk.c | 31 +++++++++++++++----------------
> 1 file changed, 15 insertions(+), 16 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


