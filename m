Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F7132B921
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 17:14:42 +0100 (CET)
Received: from localhost ([::1]:54198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHU93-0001ZH-Di
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 11:14:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lHU7T-00013f-BL
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 11:13:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lHU7Q-0004gi-Ip
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 11:13:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614787979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iKxOe0cVDwRwGc8cE+CkRkoDBoPfFii02VLZdZzMkzc=;
 b=YIB14XmrrxX/IFwaWdaP1Yt9iWBlMa5HSnvvk5DP7ezrJk1lER2D8XQzWDc2epcjVn6Vk5
 ZxgYbcas1IZ5suWNhz5LDu1oYqrv+iSiHPWGqFG/yV/GQSmGJu8YsSgCYwVb/00YKf/wkS
 kVV3YPfl8LQXGzlvD2aIfZkNJ6WOb9U=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-6Fl-6gnkOLmMakakxZ4DAg-1; Wed, 03 Mar 2021 11:12:57 -0500
X-MC-Unique: 6Fl-6gnkOLmMakakxZ4DAg-1
Received: by mail-ej1-f72.google.com with SMTP id p8so4468409ejl.0
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 08:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iKxOe0cVDwRwGc8cE+CkRkoDBoPfFii02VLZdZzMkzc=;
 b=DSKmN4eZFLMTqDe/4A/aX+BX7Z4IVM7NxxxYzDN14ErjEd7W66b5+2961KZkCbRaXd
 JJfziESY2z9UFb+msUyJXn1iD+2KRZSGX8Jr5BQD7sthx+klObk09a8p4AcjSKShJvoX
 Juee2S/nyUGiJX4+3YIMHUg+W3qlkj5C6tvy2H0OCmRtUCnznklzOQOEV15ni6veSCJX
 gm/Z7F+6aQJTfK/oJM/1grcQOu49fEkFT1MfuInyjiKXQbNT0X5L1NYHMCt1YY91PMlE
 j0L9OhuqYoLo8Asf5/hcr3L1do3e3Ch5rdrjSYZ02ogEea+YkUejQcORVbnSFmvtfs1V
 ZLLg==
X-Gm-Message-State: AOAM533ay3aWRLEjmEvV7kErGgB+MMOezZC4TevXZr1AKcItpIJAQzPM
 jlGNVmIC/JgwgYq1zygX7iCUEw8mEgyp8qkc6Rg3emxuY5ta+5CYUR5H6qDI2Hi54jIDtJb26Uv
 31zjOMolNWWxx4c8=
X-Received: by 2002:a17:906:38d2:: with SMTP id
 r18mr19172157ejd.104.1614787976401; 
 Wed, 03 Mar 2021 08:12:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMjp9fWFfzH6faU0uHJQtThI12FcAkQyWLSSCUrn8qhlo+6V21eERpdXKq8SOqlM+HIj2i5g==
X-Received: by 2002:a17:906:38d2:: with SMTP id
 r18mr19172055ejd.104.1614787975337; 
 Wed, 03 Mar 2021 08:12:55 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id k9sm22497000edo.30.2021.03.03.08.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 08:12:54 -0800 (PST)
Date: Wed, 3 Mar 2021 11:12:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: Inconsistent virtio-net-pci MSI vector count
Message-ID: <20210303111216-mutt-send-email-mst@kernel.org>
References: <YD9qmto5pHys+jEm@stefanha-x1.localdomain>
 <e8c8874f-6b1a-ac0e-5ab6-826611cd3ef3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e8c8874f-6b1a-ac0e-5ab6-826611cd3ef3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 03, 2021 at 09:08:27PM +0800, Jason Wang wrote:
> 
> On 2021/3/3 6:53 下午, Stefan Hajnoczi wrote:
> > Hi Jason,
> > I stumbled across something strange with virtio-net multi-queue today.
> > It doesn't seem to be a bug in practice, just an inconsistency. Here are
> > the details in case you think something needs to be changed:
> > 
> > libvirt uses the vectors = 2 * N + 2 formula from
> > https://www.linux-kvm.org/page/Multiqueue to calculate the number of PCI
> > MSI vectors, where N is the number of rx/tx queue pairs.
> > 
> > QEMU's virtio-net-pci device has 3 MSI vectors by default. This is
> > inconsistent with the formula that libvirt uses (should be 4 instead of
> > 3).
> 
> 
> Yes.
> 
> 
> > 
> > Luckily, the Linux virtio_net.ko driver does not configure a callback
> > function for the control virtqueue. Therefore it can still use MSI with
> > only 3 vectors (config, rx, tx) instead of 4 (config, rx, tx, ctrl).
> > 
> > But other driver implementations might need the ctrl vq vector and would
> > not have enough MSI vectors.
> > 
> > Perhaps new QEMU machine types should set vectors to 4 by default?
> 
> 
> Or it's time to accept this:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2014-03/msg01330.html
> 
> Thanks

okay, please repost. If possible please add code comments
explaining the math.

Thanks!

> 
> > 
> > Stefan


