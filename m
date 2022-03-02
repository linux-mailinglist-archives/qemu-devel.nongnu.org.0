Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E554CA633
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:42:59 +0100 (CET)
Received: from localhost ([::1]:57856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPFq-0002jt-Ld
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:42:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPNuz-0000ns-OO
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:17:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPNuy-0001VR-1P
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:17:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646223437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BdgL6w9f8LNCpRBsPDcjkA0TLUZVCMAZS5ZII8l6s44=;
 b=IfGzhSU8r8vifgJdCLCZKufMWt9zOXyv4CKtpjWPMhXrGiPIydIiT1ZyaXCy/4KgXfRFFq
 mvwH34ab+AVffkzSgYR5CXTJ1JyQJXyoZVR5avG0lL05No2PuOHzDUuJ5/X6Bz+/MSWl9l
 OFMv4PsY+B5yR+Zn6oHsBR2a+/oG6QA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-pC4aQdTSOKWOeb5I9ePPQA-1; Wed, 02 Mar 2022 07:17:16 -0500
X-MC-Unique: pC4aQdTSOKWOeb5I9ePPQA-1
Received: by mail-wr1-f71.google.com with SMTP id
 z16-20020adff1d0000000b001ef7dc78b23so572055wro.12
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:17:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BdgL6w9f8LNCpRBsPDcjkA0TLUZVCMAZS5ZII8l6s44=;
 b=0vALefx4wA73WivTWnYxlwelIzwhyIA/xjKNzRm2CctGDDx34WFScxNWtK+hvTXnjz
 icX3d3b+ltOWVA8IudxFcnf3dP0gz2Lg4wr28O4HViad1IhjA8b7MQyU8zo9vpbEqyQ7
 FAPca2PFsFPodYzIIzx9LOo2Opq5+vqqoOGCgxL6cegxqdnvXdbq4P2XAtFohOC0mo2X
 InB77hYktloznKMpDY157HR5Vz4oqa3s3kDnmt5aXGuolAC6jWncDYrdpkQgICumNyhN
 nQggxgvrDNehH5WLeZDAMZW+OWJM8DggG5PyLvAuLmfo/pf4nmCMYwgVPaTRJrY1osu6
 /GRQ==
X-Gm-Message-State: AOAM530Fj4hardjbeUIrLHT0LAhxUyzpz8uQlob0/ywS93MQBQfbAlmK
 tyG7B4lMxOMjQWUCcYi4WZSNpV4X88HlHKX5pNe7dRKsTRQpWtNicxToiKNk5MgcIA0jVfzekEW
 U8d+go4JWibII3zs=
X-Received: by 2002:a05:600c:4e0a:b0:37b:c548:622a with SMTP id
 b10-20020a05600c4e0a00b0037bc548622amr21331530wmq.55.1646223435408; 
 Wed, 02 Mar 2022 04:17:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzd/Eq4RA4eSKHhSTUpxR9tuHkdFUggXyR7xq30QB2zcXsITLVVqpFqbCmGlnLl5goQnc4haA==
X-Received: by 2002:a05:600c:4e0a:b0:37b:c548:622a with SMTP id
 b10-20020a05600c4e0a00b0037bc548622amr21331507wmq.55.1646223435111; 
 Wed, 02 Mar 2022 04:17:15 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 m14-20020a05600c4f4e00b0038181486018sm6676877wmq.40.2022.03.02.04.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 04:17:14 -0800 (PST)
Date: Wed, 2 Mar 2022 12:17:12 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH] migration: NULL transport_data after freeing
Message-ID: <Yh9gSMGDNtopEpHq@work-vm>
References: <20220217170407.24906-1-hreitz@redhat.com>
 <Yg76z1DYyu8DuJEM@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <Yg76z1DYyu8DuJEM@xz-m1.local>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Thu, Feb 17, 2022 at 06:04:07PM +0100, Hanna Reitz wrote:
> > migration_incoming_state_destroy() NULLs all objects it frees after they
> > are freed, presumably so that a subsequent call to the same function
> > will not free them again, unless new objects have been created in the
> > meantime.
> > 
> > transport_data is the exception, and it shows exactly this problem: When
> > an incoming migration uses transport_cleanup() and transport_data, and a
> > subsequent incoming migration (e.g. loadvm) occurs that does not, then
> > when this second one is done, it will call transport_cleanup() on the
> > old transport_data again -- which has already been freed.  This is
> > sometimes visible in the iotest 201, though for some reason I can only
> > reproduce it with -m32.
> > 
> > To fix this, call transport_cleanup() only when transport_data is not
> > NULL (otherwise there is nothing to clean up), and set transport_data to
> > NULL when it has been cleaned up (i.e. freed).
> > 
> > (transport_cleanup() is used only by migration/socket.c, where
> > socket_start_incoming_migration_internal() sets both it and
> > transport_data to non-NULL values.)
> > 
> > Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> 
> I had a similar fix here:
> 
> https://lore.kernel.org/qemu-devel/20220216062809.57179-15-peterx@redhat.com/
> 
> Though there it was because I need migration_incoming_transport_cleanup()
> for other purposes, so the fix came along.
> 
> My guess is this small fix will land earlier, if so I'll rebase. :)

Actually it didn't; so since I've pulled a chunk of Peter's series in
anyway I took the one from Peter's series.

Dave

> Thanks,
> 
> -- 
> Peter Xu
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


