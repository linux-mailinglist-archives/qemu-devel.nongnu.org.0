Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5562E32B916
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 17:10:02 +0100 (CET)
Received: from localhost ([::1]:46092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHU4X-0006QN-Cz
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 11:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lHU3i-0005k5-Sh
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 11:09:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lHU3d-000430-68
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 11:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614787742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R+lu4V4XtgYs7fGf9p8u12VDpZiTIZSy1nj6/BSQ4ek=;
 b=XNPKtO98sX7M6fk6t5DmVTDdJOowitdq0MbqsaCy5t3h4IwfbhcHVEGYUvmxQ08sfzI/y6
 LNLmahyXU7qBM3WkkJVfjID40H65aZxk2oz/xBN4cOydtFZ+y6/Hs/tDpQ7U7aD8OvbAcC
 KKgFCfX9+iM18zdDkuyQXyQDZ2HVhyM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-_QT0ZEESM_CHjcgekjTtAg-1; Wed, 03 Mar 2021 11:08:58 -0500
X-MC-Unique: _QT0ZEESM_CHjcgekjTtAg-1
Received: by mail-ed1-f70.google.com with SMTP id a2so4469057edx.0
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 08:08:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R+lu4V4XtgYs7fGf9p8u12VDpZiTIZSy1nj6/BSQ4ek=;
 b=E8FSt4NP7Dg7/rYv+xb7P0/QuAxLuivQ4DmDINIH8R51Ba+cJngvfop8wuCYZPtNak
 3ofo5AUuG1wbrElWnqy3b8TdraZIRaxnc1JAvKcLGT0oWBTyK/0p9GAUre2Kkic3sPHR
 uwEej2jMPTipDCFKHKQ5QVEvFeZ+lBLtOPmD+fEmBAYoETEY2K5yR5fy5tAZo1zuajH2
 iNtwvergvDIVrhCVH0d3vlxgHpnt1bO+idWxx8KH0fqTJn6tKPICDNiwJhVCAROs6CpF
 5bzfEigd81TRxlN5eh1tSQzTH/COvCaeN1i9GU6P0J4lGG/e/fX6Jbjl/8K14pgI0uh2
 bNRQ==
X-Gm-Message-State: AOAM533kmy57ZrhP+eA3KSGXmy5sjkytv2/JzDFK4nAhDCe1nsjTWi6L
 wB8t6/6jFss9AqZtdYexQAjQFKTZ/8nxvySkE60MWfe5x89D0/+ZcEST1V8x4KrRIXBX9UPkkz9
 3fX8Bv0ENYWbSWBI=
X-Received: by 2002:a17:906:5498:: with SMTP id
 r24mr26703567ejo.29.1614787734327; 
 Wed, 03 Mar 2021 08:08:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzx25I6AlZlksC7YYcnVypTFtezjUUFHKlqp73KXhhQNcPhlOSFrEobRDSiepf/W4SpIYPDZA==
X-Received: by 2002:a17:906:5498:: with SMTP id
 r24mr26703433ejo.29.1614787732551; 
 Wed, 03 Mar 2021 08:08:52 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id r17sm1849894edt.70.2021.03.03.08.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 08:08:52 -0800 (PST)
Date: Wed, 3 Mar 2021 11:08:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: Inconsistent virtio-net-pci MSI vector count
Message-ID: <20210303110742-mutt-send-email-mst@kernel.org>
References: <YD9qmto5pHys+jEm@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YD9qmto5pHys+jEm@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 03, 2021 at 10:53:14AM +0000, Stefan Hajnoczi wrote:
> Hi Jason,
> I stumbled across something strange with virtio-net multi-queue today.
> It doesn't seem to be a bug in practice, just an inconsistency. Here are
> the details in case you think something needs to be changed:
> 
> libvirt uses the vectors = 2 * N + 2 formula from
> https://www.linux-kvm.org/page/Multiqueue to calculate the number of PCI
> MSI vectors, where N is the number of rx/tx queue pairs.
> 
> QEMU's virtio-net-pci device has 3 MSI vectors by default. This is
> inconsistent with the formula that libvirt uses (should be 4 instead of
> 3).
> 
> Luckily, the Linux virtio_net.ko driver does not configure a callback
> function for the control virtqueue. Therefore it can still use MSI with
> only 3 vectors (config, rx, tx) instead of 4 (config, rx, tx, ctrl).
> 
> But other driver implementations might need the ctrl vq vector and would
> not have enough MSI vectors.

At a guess control vq can share a vector with config.
Linux is not clever enough to do it yet but it's possible.

> Perhaps new QEMU machine types should set vectors to 4 by default?
> 
> Stefan



