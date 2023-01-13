Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1377669C9E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:41:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGLyL-0006d3-V4; Fri, 13 Jan 2023 10:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pGLyJ-0006cL-Dm
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:27:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pGLyI-0001r2-2K
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673623677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cMqlHWO1r4NB1EWe+W10rFPtJJxIGAhlT2rBlm6Wdig=;
 b=cpEtyBedWpoaJvh9s8SYmtXvnryrqfBGV6Fbc+hUMcLneLvSVAT8/W7jGGlRl2wJQQYd3E
 kqmR4h9R1Stqlzwv65xJR1OCn1ofdiYtdIzCKEy2FCp/N0vtW2mOI4of6bS17vykuZqlJK
 YrIbogpGUT8J3+qMVCwkqSBypJkntjg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-A80ctmVyPRW7bspH1EGWRQ-1; Fri, 13 Jan 2023 10:27:55 -0500
X-MC-Unique: A80ctmVyPRW7bspH1EGWRQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 i4-20020a05620a248400b006febc1651bbso15261363qkn.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:27:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cMqlHWO1r4NB1EWe+W10rFPtJJxIGAhlT2rBlm6Wdig=;
 b=rtmSAlvRwIqEsxiTOP2yICUKbeE4Ju+3xoUiAR7TArbO9b9c30IHRKc0zcYB9WSOlX
 +yCDOuCdayLJvdIpzbvRZdi8pnpp7GGWj3ixK9RijWhNn9QHcnEvlfmDReafOypfiLOt
 p+iGblfMSgSx5uOTXdO49HA1ad4fg61GpvRJds/XJgnYQX/M3l6ov8kSSn3l/dGj22iL
 j+EiWNwvRBcvcxAU17SEOfXivEPsjmUWbzJbqawX4ZsS5sK0DoM6YWiero2J0NFmcH2U
 i0RVHXEjuEIIoaN+guS3988/9+tTtpITHqL83iWohupMQVRgOVgiGv0jRTKBH3DS8Pkj
 Nx+g==
X-Gm-Message-State: AFqh2korjMyqOeDQNhnB7Vigz2+/V95fO/UNMk//8J9d75Tie+BxlEs1
 qvw9CmQA0QAlcD1Ph0F3qhrq4dPoHn8+RMeq1hIsydz869/8x4sO0ptCLJ39t4Do35lzwTGx3Vy
 qt8DnmiSayfFud0A=
X-Received: by 2002:ac8:7c8d:0:b0:3a9:763b:4a61 with SMTP id
 y13-20020ac87c8d000000b003a9763b4a61mr106398557qtv.28.1673623675355; 
 Fri, 13 Jan 2023 07:27:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvcwk48oiNnRvYfbHscX14Xr05t8ik9fcS5g5xi3Zo1hX5P1V7Z/zBXoWEMnQ96kQKrx4wIpA==
X-Received: by 2002:ac8:7c8d:0:b0:3a9:763b:4a61 with SMTP id
 y13-20020ac87c8d000000b003a9763b4a61mr106398540qtv.28.1673623675132; 
 Fri, 13 Jan 2023 07:27:55 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 b3-20020ac86bc3000000b003ab7aee56a0sm10693666qtt.39.2023.01.13.07.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 07:27:54 -0800 (PST)
Date: Fri, 13 Jan 2023 10:27:53 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 3/8] migration/savevm: Allow immutable device state to
 be migrated early (i.e., before RAM)
Message-ID: <Y8F4eXdyBRKYeY4I@x1n>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-4-david@redhat.com>
 <Y8BJ02EiHNSr6xMv@work-vm>
 <11b7237a-000a-5ad7-3747-246825188d83@redhat.com>
 <Y8BlCeViRSzyTQ8+@work-vm> <Y8CGYZ3F/h1oXV+d@x1n>
 <Y8CJf7hCy76AtfcF@x1n>
 <fa21267a-c1aa-2d43-799d-eb955318aec3@redhat.com>
 <Y8F2v+ikvEJa5+qc@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8F2v+ikvEJa5+qc@x1n>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Fri, Jan 13, 2023 at 10:20:31AM -0500, Peter Xu wrote:
> On Fri, Jan 13, 2023 at 02:47:24PM +0100, David Hildenbrand wrote:
> > I'd prefer to not go down that path for now. QEMU_VM_SECTION_START without
> > QEMU_VM_SECTION_PART and QEMU_VM_SECTION_END feels pretty incomplete and
> > wrong to me.
> 
> That's fine.
> 
> > 
> > If we want to do that in the future, we should conditionally send
> > QEMU_VM_SECTION_START only if we have se->ops I assume?
> 
> Yes.  START/FULL frames are mostly replaceable afaiu in the stream ABI, so
> we always have space to change no matter what.  Let's leave that as-is.

If so, please consider adding one more paragraph describing the difference
in vmsd early_setup comments (on using FULL for early vmsd and START for
save_setup), hopefully it'll make things clearer.

Thanks,

-- 
Peter Xu


