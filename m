Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAD72C5A12
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 18:06:59 +0100 (CET)
Received: from localhost ([::1]:40932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiKjR-0001kg-Oz
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 12:06:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kiKiB-00010h-RH
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:05:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kiKi9-0001qR-2D
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:05:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606410335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MFfPbcNOJCzRGP/wYFrU8LWxAhZjLo10hE0zy/zrOgs=;
 b=SAR5B+5rABvh1xv9RRft1L9Y9RZO47/KyIhhCS2g1Kew0peX7wHH4yYFgQwcWPnqYdHgHQ
 LGSDh1uJZs0y6KyqwM09UCdy/macE1PFlpuMzVqCinI4BBKtOoJqXYfwl1rnhOXlLcZHjs
 AzaEKHLzgq2P4PyOTmExtt4Ei6DInO8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-zP6bdRLIP9qZG88ax2b1DQ-1; Thu, 26 Nov 2020 12:05:33 -0500
X-MC-Unique: zP6bdRLIP9qZG88ax2b1DQ-1
Received: by mail-wr1-f69.google.com with SMTP id e6so1572135wrx.13
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 09:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MFfPbcNOJCzRGP/wYFrU8LWxAhZjLo10hE0zy/zrOgs=;
 b=G+yavJUrTdPaunjOisHlXUwwl4YghOs86ci8R18XCvSVW60Aoypm9NpsoBuzjscHSn
 vbF4fj67f0AsI7/ab2V0RQAMOy+oBp0pAnW5hf9M3XZ9lubfgOkoU76B+6w8fhxqSHl9
 kTQqRruU1mGct615E+RYU7ve8UYgyOCYvOYhVrO9UkhEmSN1qNEyZdGRFM3UKBmUiEyD
 utws7FPoxbOXMhZy6maMbxqb0t/PjtoR2QCzl6wTYlNc3BzlIdQv6T6Rfp/Cc+ticYBv
 RuLn83fsLVzpbuQIIYibKKbc0N5/L/5+zvL/ccppKRSc+dMZIhFilYFbK24yiI/kzJl1
 sKIg==
X-Gm-Message-State: AOAM533NKc4vR/AHmpnfhwcDl9RCnvR4xutubCyaMaKDkJf+ySwJf5Kt
 YUqUTgIYZ9YxuEycQYvGwBm2R64HE4smDp3EpWzRTruNT+nJ/jJVJ50svtpJchIiWDkI+kZRYcf
 Ow/JQZ3bUGR58iCE=
X-Received: by 2002:adf:eb08:: with SMTP id s8mr5058295wrn.12.1606410332112;
 Thu, 26 Nov 2020 09:05:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLwQz2jHNeKs2BASV4s2nZG7v2BjViWm2qZCR5frGoIi7NzbTKx8+49LArQirFl5GvSCv/dg==
X-Received: by 2002:adf:eb08:: with SMTP id s8mr5058275wrn.12.1606410331940;
 Thu, 26 Nov 2020 09:05:31 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id v64sm9635713wme.25.2020.11.26.09.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 09:05:30 -0800 (PST)
Date: Thu, 26 Nov 2020 12:05:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Antoine Damhet <antoine.damhet@blade-group.com>
Subject: Re: [DISCUSSION] Allow ACPI default OEM ID and OEM table ID fields
 to be set.
Message-ID: <20201126120350-mutt-send-email-mst@kernel.org>
References: <20201125132711.jqb7znxu5jpoanwi@tartarus>
 <20201125133251.GI30079@redhat.com>
 <20201125110221-mutt-send-email-mst@kernel.org>
 <20201125201322.urze5b7vwaa2t5sy@tartarus>
 <20201126051838-mutt-send-email-mst@kernel.org>
 <20201126125012.x6yzsou5rmlxagli@tartarus>
 <20201126082606-mutt-send-email-mst@kernel.org>
 <20201126163450.knb55wh2u7k2qgbb@tartarus>
MIME-Version: 1.0
In-Reply-To: <20201126163450.knb55wh2u7k2qgbb@tartarus>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, lersek@redhat.com,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 05:34:50PM +0100, Antoine Damhet wrote:
> On Thu, Nov 26, 2020 at 08:29:41AM -0500, Michael S. Tsirkin wrote:
> > On Thu, Nov 26, 2020 at 01:50:12PM +0100, Antoine Damhet wrote:
> > > On Thu, Nov 26, 2020 at 06:09:11AM -0500, Michael S. Tsirkin wrote:
> > > > On Wed, Nov 25, 2020 at 09:13:22PM +0100, Antoine Damhet wrote:
> > > > > On Wed, Nov 25, 2020 at 11:04:55AM -0500, Michael S. Tsirkin wrote:
> > > > > > On Wed, Nov 25, 2020 at 01:32:51PM +0000, Richard W.M. Jones wrote:
> > > > > > > On Wed, Nov 25, 2020 at 02:27:11PM +0100, Antoine Damhet wrote:
> 
> [...]
> 
> > Exactly so I ask myself whether it's worth it, their next version
> > will check CPUID and then where are we?
> 
> Then I guess they will have to admit that they are purposefully blocking
> VM use and it's not our problem anymore.
> 
> > But maybe it's time we just changed all these IDs to e.g. QEMU.
> > We are very far from bochs generated tables by now.
> 
> That's a good idea, but I still think they should be user override-able
> (unless you think it would be a heavy maintenance burden, in that case
> you are king in your castle :D )
> 
> > Question is will this cause annoyances with e.g. windows guests?
> 
> Windows 10 guests seems unaffected, I cannot say for the other
> versions/servers editions.

unaffected yes, but what about things like reactivation,
warning about system changes at boot or reinstalling
drivers? changing acpi significantly does this sometimes ...

> > Igor what's your experience with this?
> 
> [...]
> 
> -- 
> Antoine 'xdbob' Damhet


