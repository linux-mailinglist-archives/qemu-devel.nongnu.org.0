Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8DE64ECE0
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 15:31:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6BjX-0000zH-Lo; Fri, 16 Dec 2022 09:30:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p6BjN-0000sw-Nu
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 09:30:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p6BjG-0002fh-BZ
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 09:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671201023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tZK3vuXvz3aviHU8piPVuRxQwyn0IxPWklXnqlREHKQ=;
 b=P8kJSI4EfJm6rJWF7ODo9DgIhg/Og9qGWTNhPon+UXY3Pe1IMYi7FXnUuxZPCoGlZHsAuV
 3nWGUtZVG0W4WBe50YGkQuQjnhhIjH+PXgvI1Rg4B0yK027ntMkOwVVH9U2TyjtzEvsgHa
 gjHZjBBDEDGW1zYUVDtBvZqukxkKjx8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-4tjc-JOTO4iAf7xZXCbdzg-1; Fri, 16 Dec 2022 09:30:21 -0500
X-MC-Unique: 4tjc-JOTO4iAf7xZXCbdzg-1
Received: by mail-qk1-f197.google.com with SMTP id
 x2-20020a05620a448200b006fa7dad5c1cso1927126qkp.10
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 06:30:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZK3vuXvz3aviHU8piPVuRxQwyn0IxPWklXnqlREHKQ=;
 b=RpsBD2N4bXV4CXFFckAawQLuQYz/m4iQFgnnh+jBzrpe5bWyrY1PdgzQA/bkIZW7+U
 DqS/DSGaab7QuiKprtfc0PZ62i65G2UQbrYGzDsB7hB47Ztbo78zc6t88GjeDhKbobUY
 xiZJh3nS/nFR/JfTsAOF3cCgvA7MiNO5cvBLXoNxjuRlqvzjc64eoEyCEuv3vScPE44K
 UxA5y7JtJLFc3ChgxNuD/UjwpK2laz+o+vV3HAb+g3sdiM6jUSvdQRNbIMYZmKhngW4w
 qCOAYCB59GnaPxrFsVx74FDWQpwYLA6x0gLRh9PqevTmLloMfuxuJJqGSpNfwLUPSKWX
 rsAQ==
X-Gm-Message-State: ANoB5plcQ6FQzN6XPUnlS0RfYW2pw8vjEkhUSitBzwMo4gqG231LSEBj
 5o9myAz3Jo6EpW4RFXARnn4qoOerKvmEF1w1nRDtIQXIGPad14+LAkyg4evucQgEO6vJLg5EdBM
 zSNVK9kARLkzounc=
X-Received: by 2002:ad4:4353:0:b0:4e8:c749:7f3a with SMTP id
 q19-20020ad44353000000b004e8c7497f3amr20138564qvs.50.1671201021216; 
 Fri, 16 Dec 2022 06:30:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf76KPfxTsMbwJWrbCeo1g8vV/GbsE5fiIxT/adLpc+6pwAcQT57hGAW3jLI/Y2Izo+VTjOx6g==
X-Received: by 2002:ad4:4353:0:b0:4e8:c749:7f3a with SMTP id
 q19-20020ad44353000000b004e8c7497f3amr20138538qvs.50.1671201020998; 
 Fri, 16 Dec 2022 06:30:20 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-45-70-31-26-132.dsl.bell.ca.
 [70.31.26.132]) by smtp.gmail.com with ESMTPSA id
 i22-20020a05620a075600b006ffb452b10asm1563424qki.13.2022.12.16.06.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 06:30:20 -0800 (PST)
Date: Fri, 16 Dec 2022 09:30:19 -0500
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 1/5] io: Add support for MSG_PEEK for socket channel
Message-ID: <Y5yA+64lVSmG5nQk@x1n>
References: <20221213213850.1481858-1-peterx@redhat.com>
 <20221213213850.1481858-2-peterx@redhat.com>
 <Y5mT4V3iYlcH56/H@redhat.com> <Y5pAiFv/JHQvgxha@x1n>
 <Y5rrmRyhRjEiHtAe@redhat.com> <Y5ta3jGHhN0nrIf6@x1n>
 <400814c5-f179-2566-e513-543ae4ae34e4@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <400814c5-f179-2566-e513-543ae4ae34e4@nutanix.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 16, 2022 at 04:10:22PM +0530, manish.mishra wrote:
> Yes sorry, noticed it now, should i send another patch to update it. Also
> in our internal testing we noticed multifd_init was skipped for 1 case,
> so if this patch series is not yet submitted should i send another
> version of it early morning monday?

I think yes.

Thanks,

-- 
Peter Xu


