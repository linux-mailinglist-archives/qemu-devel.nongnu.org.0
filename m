Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700B831255F
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 16:33:45 +0100 (CET)
Received: from localhost ([::1]:45484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8m4G-0007Bt-49
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 10:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l8m2j-0006S5-5z
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 10:32:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l8m2g-0005CE-86
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 10:32:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612711924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2UjLOUqj0EfB9CymFpH/j4xRYiYtp35clgSk/6jjcas=;
 b=GLat/f46MvkH4x1dftU2oGF95t39/l2sy8XCvEBW26UIC4WtPozI0wMbu1nsHNP/ahjdcF
 gKo7IHeDAVxoRQG7iZe9FDW6/DQBa5ertzEl+6mXiPFrtMu7MMHfgFGiOQca0GRB3D0+3Z
 yArrVFeKV5HEGhsqKU0ZetGflnX1g9c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-PI5sDnNpPfGkYyM6F-hXWw-1; Sun, 07 Feb 2021 10:32:02 -0500
X-MC-Unique: PI5sDnNpPfGkYyM6F-hXWw-1
Received: by mail-ed1-f72.google.com with SMTP id f21so9076230edx.10
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 07:32:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2UjLOUqj0EfB9CymFpH/j4xRYiYtp35clgSk/6jjcas=;
 b=ULKjRZJQ1biX8dzNwSI2n+L3dbhninTOHGmK7QVNKeRioHgJNOUzdJLSxC9LLQPE1M
 j17rCNFGb76IDvO047cibX3Fuq46glZSrkhM2lKohbJmQqQ306yLfy8RN3B2rPgahpi+
 9H8gNllWY5xZ9GX7rB9yHmpJgewCcFK+Wwjz26MNW28DB1usqDiFp1RJIUTmbxMy7+n7
 h5QUF1C2eYaowZYTB0CG6sWFUSXVtQJW6e91g+/rVq+kMjpOHjQ17oE1AJArmIxA/D7l
 BH1GWmLAZvlwfdsCxxsV2Ow4XRJBKrJixPR8tPV0zt7weuadqNsmdZKH64+wVPkw9wWA
 xKBw==
X-Gm-Message-State: AOAM533NxtuUeq9hgKw0QnJb2pA2SrDtl1yjAqdqJFjG+SP5Igv1Qol6
 BDsvdxuclDMm+N0UKBd1lLSrizBfH0f5e32OehHaDE5IZg70sBUWkpDywWVGJ1/PY/q3nGUBB4f
 LYWu8Zm+YbPDD46M=
X-Received: by 2002:a17:907:35cb:: with SMTP id
 ap11mr2834193ejc.459.1612711921401; 
 Sun, 07 Feb 2021 07:32:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQkIi96PLvRTjidFSXBcnIqXjmyN9qbjyQ2DUKLlk0EmMqqCqdAmUcodxoCPzm5mx2HwNsow==
X-Received: by 2002:a17:907:35cb:: with SMTP id
 ap11mr2834183ejc.459.1612711921239; 
 Sun, 07 Feb 2021 07:32:01 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id w26sm2041003edq.46.2021.02.07.07.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 07:31:59 -0800 (PST)
Date: Sun, 7 Feb 2021 10:31:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Programmingkid <programmingkidx@gmail.com>
Subject: Re: Help with Windows XP in qemu-system-i386
Message-ID: <20210207103150-mutt-send-email-mst@kernel.org>
References: <BD39B53C-E0C0-4D80-B80C-08E0F2CA6500@gmail.com>
 <20210205154819-mutt-send-email-mst@kernel.org>
 <80B1ABAB-B593-4B79-8DA4-03F64371A84E@gmail.com>
MIME-Version: 1.0
In-Reply-To: <80B1ABAB-B593-4B79-8DA4-03F64371A84E@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 04:08:26PM -0500, Programmingkid wrote:
> 
> 
> > On Feb 5, 2021, at 3:49 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
> > 
> > On Fri, Feb 05, 2021 at 03:25:00PM -0500, Programmingkid wrote:
> >> Hi, I'm noticing that my Windows XP Service Pack 3 VM is causing qemu-system-i386 to experience 100% host cpu usage even when the guest is at idle. I was wondering if you are seeing this issue as well on any version of Windows guest? Windows 2000 doesn't seem to have this problem so I'm wondering if this is a bug with QEMU or a problem with my VM. Any help would be appreciated.
> >> 
> >> Thank you.
> > 
> > Just tried an xp guest, stays below 10% for me. Suggest discussing this
> > on the mailing list.
> 
> Thank you for the reply. Which service pack is your Windows XP VM using?

SP3


