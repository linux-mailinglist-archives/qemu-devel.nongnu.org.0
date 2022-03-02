Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E829F4CA6C2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:56:30 +0100 (CET)
Received: from localhost ([::1]:33958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPSv-0008Du-IJ
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:56:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nPOBg-00063o-E6
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:34:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nPOBe-0002Rm-Ha
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:34:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646224474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xswrpCozDA0Gf0v3IIdvbuKcM1k7rGLTeQWwUU9ASug=;
 b=IHet5oKRADpR4WrcsXj0hq2C+VN3IzOy1jacVfQFlMlP7vMtW5XLZOsmeInLc9GqB/Dz7T
 LYQlr7IEucf08gHDgRZaj0VazgOitpdnBb3dzHGb/PZEY0ji0jo/gjC9MNCaPwsx9+/32b
 9Y1kR9IG0+eaqRrOuwGvO/uckCkI2kE=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-5GBf6SvjNFmAP7JlHoEPrQ-1; Wed, 02 Mar 2022 07:34:32 -0500
X-MC-Unique: 5GBf6SvjNFmAP7JlHoEPrQ-1
Received: by mail-pf1-f199.google.com with SMTP id
 x128-20020a626386000000b004f65834af08so639368pfb.7
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:34:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xswrpCozDA0Gf0v3IIdvbuKcM1k7rGLTeQWwUU9ASug=;
 b=F43BdqMZarSgOWTR3iOxK2Wk7ZtAyRScNGeabfDXS5kbo79Y/EzG9hsbVo4QHrYkNK
 aRRr+eFZnwcdyNWDu5QWivnJRa+qxprpfFAWaKW+85g2DujjjHeoK0h7A61BVndqxWpZ
 uc7PiOlf8OpHlJLI7T0/Vd+QV9puX72Nn7rsYq/6Fcez9610YZ8BnVBGGC9M2a+Fmcbd
 YsIxk+UK1fqyQCfHTvAS68EcFdYzmt6pEwyd0mENauc96B0PzvPejAM6bf782SwYLn0B
 gFYvhORY9qITgZpI6XzyhAIsfC8ziE77eTcA7sCrU0Uh6rWcfJDgFa5lUWhXD0uuQK1v
 47dQ==
X-Gm-Message-State: AOAM533aPJxCJbk4Odc+xoxh1xkg1Ajs+ugK9RhAkNPYL8n5GABzVcmh
 Hra682/sXvNeKzP9EijQt7DOj1usANG69Y46XybFcSqK1HMoOgvE7iepmR53MhRdb/3ZF2dsnnk
 0GmfT8l1z3eJtRw0=
X-Received: by 2002:a17:902:db05:b0:151:61c0:a3c2 with SMTP id
 m5-20020a170902db0500b0015161c0a3c2mr16477442plx.38.1646224471525; 
 Wed, 02 Mar 2022 04:34:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxS4CRevGyhMRYJSIKGi8yMpJ1y6DfnMQTkWj1givGswpOrPq3Df7AX+/ZcyCI3JAl5KEbo6g==
X-Received: by 2002:a17:902:db05:b0:151:61c0:a3c2 with SMTP id
 m5-20020a170902db0500b0015161c0a3c2mr16477416plx.38.1646224471174; 
 Wed, 02 Mar 2022 04:34:31 -0800 (PST)
Received: from xz-m1.local ([94.177.118.101]) by smtp.gmail.com with ESMTPSA id
 u11-20020a056a00124b00b004e11307f8cdsm20325705pfi.86.2022.03.02.04.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 04:34:30 -0800 (PST)
Date: Wed, 2 Mar 2022 20:34:24 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 00/25] migration: Postcopy Preemption
Message-ID: <Yh9kUIKFJoE3vpGi@xz-m1.local>
References: <20220301083925.33483-1-peterx@redhat.com>
 <Yh9fpg0AMdL5sPXd@work-vm>
MIME-Version: 1.0
In-Reply-To: <Yh9fpg0AMdL5sPXd@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 02, 2022 at 12:14:30PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > This is v2 of postcopy preempt series.  It can also be found here:
> > 
> >   https://github.com/xzpeter/qemu/tree/postcopy-preempt
> > 
> > RFC: https://lore.kernel.org/qemu-devel/20220119080929.39485-1-peterx@redhat.com
> > V1:  https://lore.kernel.org/qemu-devel/20220216062809.57179-1-peterx@redhat.com
> 
> I've queued some of this:
> 
> tests: Pass in MigrateStart** into test_migrate_start()
> migration: Add migration_incoming_transport_cleanup()
> migration: postcopy_pause_fault_thread() never fails
> migration: Enlarge postcopy recovery to capture !-EIO too
> migration: Move static var in ram_block_from_stream() into global
> migration: Add postcopy_thread_create()
> migration: Dump ramblock and offset too when non-same-page detected
> migration: Introduce postcopy channels on dest node
> migration: Tracepoint change in postcopy-run bottom half
> migration: Finer grained tracepoints for POSTCOPY_LISTEN
> migration: Dump sub-cmd name in loadvm_process_command tp

They all look pretty safe to merge, thanks!

We could even consider to postpone merging of below two patches:

  migration: Move static var in ram_block_from_stream() into global
  migration: Introduce postcopy channels on dest node

Because fundamentally if we want to only merge postcopy preempt as a whole,
then these two patches do not bring anything beneficial to the existing
code but should be accounted for part of the impl of the preempt mode.

Said that, I think it's still fine to merge them too, as long as we're very
sure we'll finally merge preempt code when tls side of thing is ready.

-- 
Peter Xu


