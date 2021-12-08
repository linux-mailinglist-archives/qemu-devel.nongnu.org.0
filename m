Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B9346CE70
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 08:38:35 +0100 (CET)
Received: from localhost ([::1]:60600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1murX8-0005VZ-0S
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 02:38:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1murU8-0003Vz-Nr
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:35:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1murU7-0008NR-1Z
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:35:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638948926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OnhCRc19B6t7iGXffcxpgc/fI29VkReMyZtKtGJEbp0=;
 b=Atu+/4vijE/Fd2qdL6O6Q4Vj82jp3WcQnVSZm1X52ijyUHRcpuIUFRsJ3IApwwG3TLwDEJ
 ZRFZc/0tejrGBmWFIKrZfDwgZ2zYujhAQO79OpD+vQlkruhfou2SLRYjjLgtvys2+ktlyw
 K/rhy07HWGISft5pg5vAuauJu8fsWDA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-4UZH9q-TPj624ttddh1OWg-1; Wed, 08 Dec 2021 02:35:25 -0500
X-MC-Unique: 4UZH9q-TPj624ttddh1OWg-1
Received: by mail-ed1-f70.google.com with SMTP id
 eg20-20020a056402289400b003eb56fcf6easo1340499edb.20
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 23:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OnhCRc19B6t7iGXffcxpgc/fI29VkReMyZtKtGJEbp0=;
 b=Uxs/Ukl2WZDtOTpRsHDFJO0/st4l1mZNGb3WNVnZjh4/ERVdsO+FPKVlhno0dcZLp8
 SJKsg6Tq3g0vxbxBJxKC2/dJn0RQCN/T6OIdvpI6MYCzm1+LUHNJsUZHAJntnbFtL2di
 luns5poAkERQ09Ju9MW8JGwedUMJPCJfHYFX0GY7IKZGdxiuhAPndGJexxTG+kZBRDjr
 64MQyo2TTnp6j0RcsVHGUw+T64dhF0rKBem2W6lPeNUE68SnMWNkhHLZQvNa5lVWn3IJ
 SbyruWaisc9ZbjcEnauZvOt53P849rX8aSGgWbWgTrpwxDLF02m1pBRVoBDQyUI9SIB1
 rV9w==
X-Gm-Message-State: AOAM531ZFSHGyrTNBgVgIh9KozJ4tLWqedWyZJPD9/BmRwhMigWlBCHG
 ZJha/OVFN30XLMvENkIdo6XbwYcxztSYhzm76XHYAgSMb+AT/O8tB4wwSx87uNYVH2ZSGIUu/BJ
 +ypH63SpYVIpLO80=
X-Received: by 2002:aa7:d794:: with SMTP id s20mr16502011edq.305.1638948923158; 
 Tue, 07 Dec 2021 23:35:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnZucZN0tHLZucHGx4O7gO3HrxgsB91EUKrBRs6O9OqlWo/1I7uZmhOZ6Wbrdu2KSw9E80Gg==
X-Received: by 2002:aa7:d794:: with SMTP id s20mr16501997edq.305.1638948923020; 
 Tue, 07 Dec 2021 23:35:23 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107e:ebdb:5cc6:c351:b05:514f])
 by smtp.gmail.com with ESMTPSA id w24sm977929ejk.0.2021.12.07.23.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 23:35:22 -0800 (PST)
Date: Wed, 8 Dec 2021 02:35:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v7 2/4] tests/qtest: add some tests for virtio-net failover
Message-ID: <20211208023509-mutt-send-email-mst@kernel.org>
References: <20211207172342.4058491-1-lvivier@redhat.com>
 <20211207172342.4058491-3-lvivier@redhat.com>
 <0c40316f-aa00-37ff-096a-ac94279d6a8d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0c40316f-aa00-37ff-096a-ac94279d6a8d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 08, 2021 at 08:33:31AM +0100, Thomas Huth wrote:
> On 07/12/2021 18.23, Laurent Vivier wrote:
> > Add test cases to test several error cases that must be
> > generated by invalid failover configuration.
> > 
> > Add a combination of coldplug and hotplug test cases to be
> > sure the primary is correctly managed according the
> > presence or not of the STANDBY feature.
> > 
> > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > ---
> >   tests/qtest/meson.build           |   4 +
> >   tests/qtest/virtio-net-failover.c | 771 ++++++++++++++++++++++++++++++
> >   2 files changed, 775 insertions(+)
> >   create mode 100644 tests/qtest/virtio-net-failover.c
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> 
> I'll take this series through my "testing" branch (unless someone speaks up
> that it should go through some virtio/network branch instead).

Pls do.

-- 
MST


