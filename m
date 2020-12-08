Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32922D327B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:00:43 +0100 (CET)
Received: from localhost ([::1]:34212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmiE6-0007Gm-UV
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:00:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmi2G-0004Zw-Bg
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:48:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmi2A-0003Qp-OG
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607453300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1L/YtWRmk47XedjpXtusdOKmONc8+KOrdegsh8RD/rU=;
 b=dmDLWJ0MdezB1DrlCxi6t5XQ4cc/byMedxKC46xejshJr4/Kx1rv3HrKWSwi4uyPqCyS0r
 j2oyBb6Ohde+/HvExX0GmrPD3llApMn1aB66Y6XFDxw5HIFkVkW5Kd0g4ho5oN12/uhdMa
 Zqq0nMZQyla843W7GfL+OH/7msh++tM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-eTB5zXkzOUO3vD4akMZJMw-1; Tue, 08 Dec 2020 13:48:17 -0500
X-MC-Unique: eTB5zXkzOUO3vD4akMZJMw-1
Received: by mail-wm1-f69.google.com with SMTP id f12so1230610wmf.6
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:48:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=otFFGOyoxc9G+vDBKOmXKY5ZKdIsoxMt0j58sru+fwM=;
 b=f0ud/X3P6ZN4FSCpmfr6BW43tY4GXg0nbVCcIQUbeEDAh2Ozp2IcBjKvNMpWUOnc4H
 DbZn8YE/zcu4Yolpd2egIufb51ag5HJBVJnce/wseHsBJxVhDN4uw6dG7HCwys0ZTie/
 lAZ+zwe3nKPYt95wV9M8UQbQ0P+aUKhcfqIREK3ZH5pKk8kDIlBJHYHqwKO9LFtwzRvn
 4zhZmdzaGBQFL5gNzYJmKypr0yYtGzp9qcF6Yjf1AetIr7fsYsSftb2IEXWjCenC4b97
 pX8Ur8/UX8p5XWh6dOMWmTvm9B0iJx2fBNqJgoYBKHcoV12bWpOIo2/zq9h91TqInDP2
 gY8w==
X-Gm-Message-State: AOAM533dre2ncYS9MLU+AG1ygA73SdCQoS1Au75SyIYjixhfxbrvpSGA
 whPUwhF5vREvKUmlfmmZqZ/RjcPKHMXv7BdLC5gJMixtzhxEG/gH3A8KlWEXijLfFHVzgzd4Xsa
 8mdeJceSdwgizBxM=
X-Received: by 2002:adf:a2ce:: with SMTP id t14mr2022642wra.308.1607453296008; 
 Tue, 08 Dec 2020 10:48:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaMhVm5gQot31WmtwHV5rnElNg9dy8nNWZRzeIdCpu3XvTB/9XuVXhMva8z/pcrJGAuU7AQQ==
X-Received: by 2002:adf:a2ce:: with SMTP id t14mr2022615wra.308.1607453295684; 
 Tue, 08 Dec 2020 10:48:15 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id w12sm5091891wre.57.2020.12.08.10.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:48:14 -0800 (PST)
Date: Tue, 8 Dec 2020 13:48:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 01/27] migration: Network Failover can't work with a
 paused guest
Message-ID: <20201208134711-mutt-send-email-mst@kernel.org>
References: <20201202061641-mutt-send-email-mst@kernel.org>
 <20201202112639.GE2360260@redhat.com>
 <20201202063656-mutt-send-email-mst@kernel.org>
 <20201202120121.GF2360260@redhat.com>
 <20201203061907-mutt-send-email-mst@kernel.org>
 <20201203113253.GD2952498@redhat.com>
 <20201203063452-mutt-send-email-mst@kernel.org>
 <20201203114341.GB2919@work-vm>
 <20201203070339-mutt-send-email-mst@kernel.org>
 <20201203121624.GG2952498@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201203121624.GG2952498@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 12:16:24PM +0000, Daniel P. Berrangé wrote:
> On Thu, Dec 03, 2020 at 07:11:17AM -0500, Michael S. Tsirkin wrote:
> > On Thu, Dec 03, 2020 at 11:43:41AM +0000, Dr. David Alan Gilbert wrote:
> > > Another way to solve this would be to remove the unplugging from the
> > > migration layer and leave it as a problem for the management layer to do
> > > the unplug.
> > 
> > Daniel described the problem with modular management tools which expect
> > pausing or slowing down guest to cause migration to converge.
> > 
> > Point is, it actually *will* make it converge but only if you
> > pause it after unplug.
> > 
> > As it is, these tools fundamentally can not handle failover
> > requiring guest cooperation. Moving code between layers won't help.
> > Introducing failure modes as this patch does won't help either
> > especially since Daniel wrote there are countless tools like this.
> > We just break them all but have no resources to fix them,
> > this does not help at all.
> > 
> > We can just leave the situation as is.
> > 
> > Or if we do want to be nice to these tools, how about we
> > unpause the guest until unplug, then pause it again?
> > This actually addresses the problem instead of
> > shifting the blame, does it not?
> 
> This is a very bad idea because it changes the execution status of the
> guest behind the apps/admins back, and that cannot be assumed to be a
> safe thing todo.
> 
> Regards,
> Daniel

My question is this: management gets an error since guest was paused
presumably by someone (admin?) outside its control.
How does it know when it is unpaused?


> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


