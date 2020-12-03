Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AC52CD535
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 13:12:14 +0100 (CET)
Received: from localhost ([::1]:50064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kknT4-0000ES-2f
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 07:12:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kknSJ-0008Fv-EY
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 07:11:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kknSH-00037L-VF
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 07:11:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606997484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A4l8ABcfMe7R7HFlKGHH01+M/ywxcYvZVmFmSk6gSe8=;
 b=IBEPA6m1i4ScGUUM0LQFscqWzYfKiSm7SpiM6MaD63CeHQmyKfOUlPXSUiA6PZU4WocpKK
 r80kjx0Qre3cOPaxIX0k/51+4fEnLVzQRzfkUvRwzJox1nEABY6+g53/xv8wMi8jGvdi4k
 XagksjE9Esw/034EV4y4gOT1DZZaztU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-Cwn8ZylCPNKInXmSi0UdsQ-1; Thu, 03 Dec 2020 07:11:23 -0500
X-MC-Unique: Cwn8ZylCPNKInXmSi0UdsQ-1
Received: by mail-wr1-f70.google.com with SMTP id p18so1152288wro.9
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 04:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A4l8ABcfMe7R7HFlKGHH01+M/ywxcYvZVmFmSk6gSe8=;
 b=WXqPNunyYCw8ZYv3VNZbX6XgAGGZi0Wz7/9DNuRK8fUXrJKmH+aKw4eo/hPcMQbZtD
 fVzBLTZAdNvRyfvIM1Ua8Mi7dV5BaqIbT0sOPLyRQqq6/tZFWCyrBYvbeFTyh8Njbee1
 0SYNiWmmE/z0uM0n/BuouXwmSbJNqcovSw1F7WLgRItaeBkPNC5Z7SZtQBVvaP8Vars+
 Y+qAIpmPleZeDTbBfYy9NTljPUgE031pfYmpUXKwouXMfqac6b6fhCGKI2wjhrc6sbOL
 k9FOtAV98e56cJn6xL78xm3C5xTjj7tpT9XaJKEbJcSGXBaSSfJ92Kyc02ODP28+9wsJ
 cHZg==
X-Gm-Message-State: AOAM53110ZZAR+kJ5G3I2CVjR9ObSULwqZlQpxIIvlDH9WeBYOK+Bah+
 OcC8bNVlA++3J2JTAIDdk1pvJxeVCSZ09FJyQds2cGl9M8955+TsdrLaVoZ9+GSLnLUVLt1xE7H
 Hh/cDxUjDf1DgV+g=
X-Received: by 2002:adf:f6c7:: with SMTP id y7mr3349364wrp.147.1606997482002; 
 Thu, 03 Dec 2020 04:11:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8dybbBsAkC4Pf3nbKW+sWcxfIEzcfbNV9pSAirAGtxSKgpRwSydBoY0Nk3/dzWbSq8t8FeQ==
X-Received: by 2002:adf:f6c7:: with SMTP id y7mr3349339wrp.147.1606997481757; 
 Thu, 03 Dec 2020 04:11:21 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id 20sm1237674wmk.16.2020.12.03.04.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 04:11:20 -0800 (PST)
Date: Thu, 3 Dec 2020 07:11:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 01/27] migration: Network Failover can't work with a
 paused guest
Message-ID: <20201203070339-mutt-send-email-mst@kernel.org>
References: <87mtywlbvq.fsf@secure.mitica>
 <20201202105515.GD2360260@redhat.com>
 <20201202061641-mutt-send-email-mst@kernel.org>
 <20201202112639.GE2360260@redhat.com>
 <20201202063656-mutt-send-email-mst@kernel.org>
 <20201202120121.GF2360260@redhat.com>
 <20201203061907-mutt-send-email-mst@kernel.org>
 <20201203113253.GD2952498@redhat.com>
 <20201203063452-mutt-send-email-mst@kernel.org>
 <20201203114341.GB2919@work-vm>
MIME-Version: 1.0
In-Reply-To: <20201203114341.GB2919@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 11:43:41AM +0000, Dr. David Alan Gilbert wrote:
> Another way to solve this would be to remove the unplugging from the
> migration layer and leave it as a problem for the management layer to do
> the unplug.

Daniel described the problem with modular management tools which expect
pausing or slowing down guest to cause migration to converge.

Point is, it actually *will* make it converge but only if you
pause it after unplug.

As it is, these tools fundamentally can not handle failover
requiring guest cooperation. Moving code between layers won't help.
Introducing failure modes as this patch does won't help either
especially since Daniel wrote there are countless tools like this.
We just break them all but have no resources to fix them,
this does not help at all.

We can just leave the situation as is.

Or if we do want to be nice to these tools, how about we
unpause the guest until unplug, then pause it again?
This actually addresses the problem instead of
shifting the blame, does it not?

-- 
MST


