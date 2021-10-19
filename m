Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C35433B61
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:56:34 +0200 (CEST)
Received: from localhost ([::1]:39162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrTd-0003io-VB
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcqH5-0003lZ-6b
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcqGz-0002aP-1I
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:39:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634654363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UAWXWqFNUWu/wsfSTSD6VFnfLFglsgGEuR6AodfR8eY=;
 b=G5la7FUhHXHrhF7w8SNcWUCbov2v3XzUhJKzfQ1rwTkp8GtfHdxni7dycIH+jY9QFhVrb8
 jv8KS0NbAejIGU3XiBzEnjRKr8ivzmzVkUFLfh7JIZ2wLzggY2UwwsPpdctRVJFmWRyCro
 KhF4N4VnWk0/qDdvbF0ADkOvyTHhZ+Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-EwhQ3qUNM_KZuh0_tfazNw-1; Tue, 19 Oct 2021 10:39:22 -0400
X-MC-Unique: EwhQ3qUNM_KZuh0_tfazNw-1
Received: by mail-wm1-f70.google.com with SMTP id
 l39-20020a05600c1d2700b0030dba1dc6eeso1230286wms.7
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 07:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UAWXWqFNUWu/wsfSTSD6VFnfLFglsgGEuR6AodfR8eY=;
 b=flHAzOXJVLywbrzHh5etYeEPKesIw+eLUHGefjERx1f/PsxOR6GrRStzQt9EcemR1E
 huqgMw8923gxoJbtweJz1Z9batZYVafItDcs5RmfzJKNTpYnPVH+tD5Evvo3ULBki4KX
 72fgPmPjAyAJwkHEGerG0H0vXYgTVZ2GE8J0hGWbmjbRQIkgIgtUuAzrcB8vg9D0qsqP
 fAR9sMyj3eJdtbpE6HBsVMSzlfpQMmlTeqdL6IWt922fnOti6OTtJh+ItpA8ozfyYEPh
 +MNT+Lo4pNGyxhJJkBFSQOY7/l7Tl0mZfyB5b1UwZJF8wMJetz4Yj/jl95X9PVG/mZNg
 a0UA==
X-Gm-Message-State: AOAM533ZtLVXYlPeqGMXPDWmdTwh8i5FdMoAZ27i2ffM7bKdAkTMBLO4
 xLJmVWyK4F0819nNie+jxQohdxsTWro6NanNR3q9h/0nPxf1g8Bt8PYawUjK8VAbgGH5YjbdPZv
 1HMhiICOHUz1x8RY=
X-Received: by 2002:a05:6000:1aca:: with SMTP id
 i10mr45748913wry.207.1634654361238; 
 Tue, 19 Oct 2021 07:39:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzD9mb15hc24uvH/ESjE+fnfcTZo3TcYW9J8SfXHpcthytlLwik6rlSg6hpH3ILHizdQnWVw==
X-Received: by 2002:a05:6000:1aca:: with SMTP id
 i10mr45748886wry.207.1634654361042; 
 Tue, 19 Oct 2021 07:39:21 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id n7sm9761109wrp.17.2021.10.19.07.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 07:39:20 -0700 (PDT)
Date: Tue, 19 Oct 2021 10:39:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v6] Work around vhost-user-blk-test hang
Message-ID: <20211019103834-mutt-send-email-mst@kernel.org>
References: <20211014043216.10325-1-raphael.norwitz@nutanix.com>
 <YW7O2q/UaKl3Ao09@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YW7O2q/UaKl3Ao09@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 02:57:46PM +0100, Stefan Hajnoczi wrote:
> On Thu, Oct 14, 2021 at 04:32:23AM +0000, Raphael Norwitz wrote:
> > The vhost-user-blk-test qtest has been hanging intermittently for a
> > while. The root cause is not yet fully understood, but the hang is
> > impacting enough users that it is important to merge a workaround for
> > it.
> > 
> > The race which causes the hang occurs early on in vhost-user setup,
> > where a vhost-user message is never received by the backend. Forcing
> > QEMU to wait until the storage-daemon has had some time to initialize
> > prevents the hang. Thus the existing storage-daemon pidfile option can
> > be used to implement a workaround cleanly and effectively, since it
> > creates a file only once the storage-daemon initialization is complete.
> > 
> > This change implements a workaround for the vhost-user-blk-test hang by
> > making QEMU wait until the storage-daemon has written out a pidfile
> > before attempting to connect and send messages over the vhost-user
> > socket.
> > 
> > Some relevent mailing list discussions:
> > 
> > [1] https://lore.kernel.org/qemu-devel/CAFEAcA8kYpz9LiPNxnWJAPSjc=nv532bEdyfynaBeMeohqBp3A@mail.gmail.com/
> > [2] https://lore.kernel.org/qemu-devel/YWaky%2FKVbS%2FKZjlV@stefanha-x1.localdomain/
> 
> I sent a fix for the hang so the workaround is no longer needed:
> "[PATCH] vhost-user-blk-test: pass vhost-user socket fds to QSD"
> 
> Stefan

Woot! Thanks a bunch Stefan! Great job debugging this!

-- 
MST


