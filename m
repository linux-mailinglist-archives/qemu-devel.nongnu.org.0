Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB3263FA11
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 22:51:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0rRI-0000vN-1L; Thu, 01 Dec 2022 16:49:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0rRF-0000uq-Iw
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 16:49:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0rRD-0005xA-VK
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 16:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669931386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kqGEWPAGz/6ocSGfjVJuWVVQ/mh58QbrsSwHlidcYEA=;
 b=dq2FK3DkcEfWeNi6CGUSzYsQ902Y7NRqrxe6kvTxNRFt42uIb06fG0+UtgRD6clKtQPHwT
 yqxCFfKneXNZDPG8Q3esc62o67H6ibk4LgJ5URj0FMFu5rB4UZvO3rBNWC349GnWudPCSV
 vGOf7CLtlnyhOuIRQf4m4pd0W8PyLEM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-340-lPqs6EwIOeeBCwyA8oQCFQ-1; Thu, 01 Dec 2022 16:49:43 -0500
X-MC-Unique: lPqs6EwIOeeBCwyA8oQCFQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 x10-20020a05600c420a00b003cfa33f2e7cso1459435wmh.2
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 13:49:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kqGEWPAGz/6ocSGfjVJuWVVQ/mh58QbrsSwHlidcYEA=;
 b=zrMj+GKnrmXm6rvF4H36A6mTQ77PjLqqJFSs5Bn/QHwcT20ogxKGSHgHgKi2vVyaQP
 xrrHArKA1W0OFoUFI1n7y4iov3dO+5vYt/MCYsHFjhNJAX9MYOxupW2t4A3P4w0bKyN7
 wJuIJWQhsJVsyLzFKJImwOHYtJvKSvk/uwGgHx0lQpaabo/Qn0dAf5UKZZRzCEGZqqHd
 m5ssbEY8j719dr9T3Xm8IcnflFspAeafEDkv1QlbtSc2YTW7xn56fGOs4kFwZzBmlDmV
 vRahCPgnpXunPAX/BdscAucDCYCdB+oJPr8aPArl9TCof5Y/Rqk/ke5g0fpkpG9F2N+0
 +APw==
X-Gm-Message-State: ANoB5pkF+kCAEt3PBuZsR6vcNqLtPAkVMKaQCdvZc7lFYMNcqdPJ3ctf
 44XC9CmIafwQdLzvd+X1lzUFTUPHtggqUhsbhtGQ27JyAV9zWuqpb+XHdaNonK1KX57tUH8oJN9
 uRq6bEWTb3YXU4+Y=
X-Received: by 2002:a5d:4b91:0:b0:242:131c:1051 with SMTP id
 b17-20020a5d4b91000000b00242131c1051mr15466677wrt.318.1669931382307; 
 Thu, 01 Dec 2022 13:49:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4F4QsQeDzaX8G77DLYVAr6l74CFt5OmkJ7/u2cpwPk0z7lyVRuvG1+Ai6VLVuKq9ZbvyLuJg==
X-Received: by 2002:a5d:4b91:0:b0:242:131c:1051 with SMTP id
 b17-20020a5d4b91000000b00242131c1051mr15466659wrt.318.1669931382091; 
 Thu, 01 Dec 2022 13:49:42 -0800 (PST)
Received: from redhat.com ([2.52.16.138]) by smtp.gmail.com with ESMTPSA id
 z10-20020adfec8a000000b00236576c8eddsm5483975wrn.12.2022.12.01.13.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 13:49:41 -0800 (PST)
Date: Thu, 1 Dec 2022 16:49:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, virtio-fs@redhat.com,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Fam Zheng <fam@euphon.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 German Maglione <gmaglione@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-7.2] vhost: enable vrings in vhost_dev_start() for
 vhost-user devices
Message-ID: <20221201164750-mutt-send-email-mst@kernel.org>
References: <20221123131630.52020-1-sgarzare@redhat.com>
 <Y3+5rfnNmR7R/h6/@fedora>
 <20221125081243.a3q7ep32o6g4r2vd@sgarzare-redhat>
 <Y4fFICp5tBrEPud1@fedora>
 <20221201080250.s3cugnnkf5f4kqvo@sgarzare-redhat>
 <87k03bctrj.fsf@linaro.org>
 <20221201052647-mutt-send-email-mst@kernel.org>
 <874jufcnzi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874jufcnzi.fsf@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 01, 2022 at 12:21:21PM +0000, Alex Bennée wrote:
> 
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Thu, Dec 01, 2022 at 10:14:39AM +0000, Alex Bennée wrote:
> >> Do you think rust-vmm's vhost crates have enough of the state
> >> management to manage vhost and vhost-user backends? Maybe it would be a
> >> good experiment in replacing a (small well defined) piece of
> >> functionality with rust?
> >> 
> >> That said there is a lot of deep magic in the vhost-net stuff which I
> >> think is down to the interaction with things like vdpk and other network
> >> optimisations that might be missing. For the rest of the devices most of
> >> the code is basically boiler plate which has grown variations due to
> >> code motion and change. This is the sort of thing that generics solves
> >> well.
> >
> > Not sure what you want to replace with what though, libvhost-user or
> > vhost-user bits in qemu?
> 
> The vhost-user bits in the main QEMU binary. We already don't use
> libvhost-user for most of our backends anyway ;-)

Mixing C and Rust like this is far from trivial. I'd start with
something much less ambitious that virtio.

-- 
MST


