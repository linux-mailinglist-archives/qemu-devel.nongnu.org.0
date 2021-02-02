Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3597F30C4FB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:11:31 +0100 (CET)
Received: from localhost ([::1]:59220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yH4-0005mT-2R
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:11:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l6xzZ-0001q4-31
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:53:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l6xzR-0000Ny-8k
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:53:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612281195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vpsO2w9lnPP6DHccoeHYn0W/xrzM4c/R4LOoqxf/lpQ=;
 b=L0K4+aZjpbhxQr/12Mr5tgaw5mjfyK+/e/R27rrLv8ffazYl1idyw6NWbjq965NwGQNV25
 ifpnyURUBV7wQUV5RgWTzSrQiqoS574WKEuo0fPFCP57ZZwUDCOWfyuHqMTSBlw1MAuC8J
 I9nLHmiAK4umTmVJuu3b0JiXRlM/O6w=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-7n5wi-weNreiQzLYRtcCCQ-1; Tue, 02 Feb 2021 10:53:13 -0500
X-MC-Unique: 7n5wi-weNreiQzLYRtcCCQ-1
Received: by mail-qv1-f69.google.com with SMTP id e17so15207262qvo.9
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 07:53:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vpsO2w9lnPP6DHccoeHYn0W/xrzM4c/R4LOoqxf/lpQ=;
 b=rBZaWlv4jI+nGqd431RW1MBehfEWY77GYc3dX7WmWboYDkYUyQC3jmo2tz3sRY+WU4
 BbtHtlUq4RCLI0t/ArGpzsafE0VNft0ZCyIsSudgCOBVo/JZ1AFuHO7MfdfIndlOjyu9
 EDYSq8DvVnovRC9oUGLM4qWCfZ1jhAGvaiYRLRDInWBKRcVHnT++LOSWAWivYBzGlOoe
 Na4ypI/DUy0BAEgbz4K+lMfGQFfPgjRUjrcEvJls8/cWdy7dBuaW+FPLBgOZsPR+pSCT
 vVupKXes65SISDynBUt0dAw78+g2GxZruPjO4hrrAKj1sgfWW/qLbnKt/QmCgSGAMH/t
 oJzA==
X-Gm-Message-State: AOAM533Spf55JUB99sEaxijIrnALtlrFUfKpERWrdGenECXuvhtiP3Lu
 oPBBGXFa9Z8tfrqaVjbVHl88D17JfQt4wkyFMT3ks1ULscEoXROmHXMxUvH+eGU/IXjM7kJ/B7w
 8kKbWR+5buLp4xL8=
X-Received: by 2002:ac8:5c13:: with SMTP id i19mr20688322qti.97.1612281192627; 
 Tue, 02 Feb 2021 07:53:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSkwLv2TuG5s6eypuf2pwMcCN5mTSWg2CpZpUGy8ZuvPkqsABbixbMne789aiRbQJcCCZXQw==
X-Received: by 2002:ac8:5c13:: with SMTP id i19mr20688309qti.97.1612281192462; 
 Tue, 02 Feb 2021 07:53:12 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id g186sm17535813qke.0.2021.02.02.07.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:53:11 -0800 (PST)
Date: Tue, 2 Feb 2021 10:53:10 -0500
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 2/2] migration: Display the migration blockers
Message-ID: <20210202155310.GC6468@xz-x1>
References: <20210202135522.127380-1-dgilbert@redhat.com>
 <20210202135522.127380-3-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202135522.127380-3-dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: alex.williamson@redhat.com, qemu-devel@nongnu.org, laine@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 01:55:22PM +0000, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Update 'info migrate' to display migration blocking information.
> If the outbound migration is not blocked, there is no change, however
> if it is blocked a message is displayed with a list of reasons why,
> e.g.
> 
> qemu-system-x86_64 -nographic  -smp 4 -m 4G -M pc,usb=on \
>  -chardev null,id=n -device usb-serial,chardev=n \
>  -virtfs local,path=/home,mount_tag=fs,security_model=none \
>  -drive if=virtio,file=myimage.qcow2
> 
> (qemu) info migrate
> globals:
> store-global-state: on
> only-migratable: off
> send-configuration: on
> send-section-footer: on
> decompress-error-check: on
> clear-bitmap-shift: 18
> Outgoing migration blocked:
>   Migration is disabled when VirtFS export path '/home' is mounted in the guest using mount_tag 'fs'
>   non-migratable device: 0000:00:01.2/1/usb-serial
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


