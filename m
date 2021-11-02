Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1506444346D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 18:13:51 +0100 (CET)
Received: from localhost ([::1]:51206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhxM6-0004yz-8H
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 13:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhxH3-0005Rq-Fs
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:08:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhxGz-0001Wi-TE
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635872913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pvJ6o3zZHACO1ouSOpAFXhMfRRmNeZvfO55UPbwaJWM=;
 b=RZon2Xpn8JFmAZql/jlOA0TMXBa85J9XoWsKNN+HQWVMyjlgAvAzZdGPvuwRWXLcGmQYUn
 B1yFfSMVmRXR1p/4XYlUFZY9qSU7NJaib+MjLEXQkW9XC+bO3XOQABwYB85qYksWNHzAEt
 FABJw7oNXJrGX4c5GHpWnkJaB7hqrrc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-QKxj7aJ5Nj27SJcR3Rxl-g-1; Tue, 02 Nov 2021 13:08:31 -0400
X-MC-Unique: QKxj7aJ5Nj27SJcR3Rxl-g-1
Received: by mail-ed1-f71.google.com with SMTP id
 u10-20020a50d94a000000b003dc51565894so19437464edj.21
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 10:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pvJ6o3zZHACO1ouSOpAFXhMfRRmNeZvfO55UPbwaJWM=;
 b=f/iB1HUsJK1szrqxxv+FaIEqwKCbloLUP0seMpuv8bEQguVfEilZghLpgX/zkES2xg
 0ThBYUTuX3UOhUHFx+s31XAh+znkPfxWunovdVefOv3gKQ32QeaY2K0zFnzKckCa4BHf
 C/7YN+skokcHj27IFdlXJx3cPr4WHogHSoSADTBBjbb48ttlUu8d9LiRvyoAk8JNekF8
 sVTcI3nlN9xXbQUyYauuhdECcYf9DlQSx0yfiqn20if+RUwq7ad7g3d3J9o79yLvmuUr
 XjbeGOp+9B19k4gfZADah069m/nByNq0VzmOkzLN2gMynKc75lOuRwKyIlHv+L389Pe5
 kMBw==
X-Gm-Message-State: AOAM531Atv+WR1obcpzv1c0iCtntLiFT39eLI1Il44WFMyFmWqvHTcZJ
 1eDgepPG/IJLinfu7y8D9PECZ66cf0fVBn2oiNR53lFEpSI6WtCaxTa5HATvjYjqvSQaotPjyJy
 KBZynGKC+CViCJN4=
X-Received: by 2002:a17:906:c448:: with SMTP id
 ck8mr41350047ejb.252.1635872910162; 
 Tue, 02 Nov 2021 10:08:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNC7H3hVfmM/1xSZJysHCeacYrZxk5IhKa2DIQtptWuDVJOxuSLe0nUhAi5T0tBdL+Zpvd0w==
X-Received: by 2002:a17:906:c448:: with SMTP id
 ck8mr41349980ejb.252.1635872909550; 
 Tue, 02 Nov 2021 10:08:29 -0700 (PDT)
Received: from redhat.com ([2.55.17.31])
 by smtp.gmail.com with ESMTPSA id cs20sm4230466ejc.105.2021.11.02.10.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 10:08:29 -0700 (PDT)
Date: Tue, 2 Nov 2021 13:08:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 2/2] failover: don't allow to migrate a paused VM that
 needs PCI unplug
Message-ID: <20211102130811-mutt-send-email-mst@kernel.org>
References: <20210929144311.1168561-1-lvivier@redhat.com>
 <20210929144311.1168561-3-lvivier@redhat.com>
 <20211102110043-mutt-send-email-mst@kernel.org>
 <5139c0a8-6aa0-48df-f353-84a15ffc4dd1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5139c0a8-6aa0-48df-f353-84a15ffc4dd1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 02, 2021 at 06:06:51PM +0100, Laurent Vivier wrote:
> On 02/11/2021 16:04, Michael S. Tsirkin wrote:
> > On Wed, Sep 29, 2021 at 04:43:11PM +0200, Laurent Vivier wrote:
> > > As the guest OS is paused, we will never receive the unplug event
> > > from the kernel and the migration cannot continue.
> > > 
> > > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > 
> > Well ... what if user previously did
> > 
> > pause
> > start migration
> > unpause
> > 
> > we are breaking it now for no good reason.
> > 
> > Further, how about
> > 
> > start migration
> > pause
> > 
> > are we going to break this too? by failing pause?
> > 
> > 
> 
> TL;DR: This patch only prevents to migrate a VFIO device as failover allows
> to start a migration with a VFIO device plugged in.
> 
> Long Story:
> 
> * before this patch:
> 
> - pause and start migration and unpause-> fails if we unpause too late
> because we migrate a VFIO device, works otherwise


confused about this one. can you explain pls?

> - start migration and pause before we unplug the card -> hangs forever
> - start migration and pause after we unplug the card -> it works fine
> 
> * After this patch:
> 
> - pause and start migration and unpause-> fails if we unpause too late
> because of the new error checking, works otherwise
> - start migration and pause before we unplug the card -> fails because of
> the new error checking
> - start migration and pause after we unplug the card -> it works fine
> 
> Thanks,
> Laurent
> 


