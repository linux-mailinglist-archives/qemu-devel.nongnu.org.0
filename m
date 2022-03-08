Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9BE4D1572
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:03:14 +0100 (CET)
Received: from localhost ([::1]:55034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRXcS-0001t5-9I
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:03:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRXal-0000R4-B1
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:01:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRXad-0008Sh-NT
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:01:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646737274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3cDgG1xFwm9F6+zegV0Jn7D5WObxJn+gJIVy1DQjlcM=;
 b=A7bZQHWOcXO4L58yJHaTmA3dYUjcQu6R5SyoFy3t8O0++SLZccvRU1+wGaiVCDV/UzJ7vD
 RJ3fELJ/4ILBySWhrYFzYFpsBvg9Kvi2NfOAbP6xtrmS3gptO5DwV3rcgA8c+/dY6YAwiH
 OIKzkKfexcJO4qxVIeG5aFwMy+T5urQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-DJzBQ-DpN36G43-PJK2pQQ-1; Tue, 08 Mar 2022 06:01:13 -0500
X-MC-Unique: DJzBQ-DpN36G43-PJK2pQQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 x15-20020a5d6b4f000000b001ee6c0aa287so5351700wrw.9
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3cDgG1xFwm9F6+zegV0Jn7D5WObxJn+gJIVy1DQjlcM=;
 b=lw12ArAxShOm/+DU9QB0nJC3idMhUtwD6eRa2bWW8lZTzW11v36wOaDTKrrC3tY8Bn
 AXRXefRV6qQoUqxfRjqhsmWsophgWH95d3xGeM11ySOGT4lqeGOSlxNj5Nx/aXvYUTAV
 e7DKhj3Ul1JyER/7iMCkzzXsCKTburzU0oktGcnXvF//ZwgfBAXe+Xr5vrMbnNQtgWQq
 b2dul1DZwPrnOqtKxoqhZ6tu1fyO9w7SuURom1KnM1LDPN1tfWbWccE1iocvoGEs6k/5
 H9/o0rp+L3dxt0vASrwVxC+ZL6lwZZ+6wnA0U4kfRUl8pzugtPLwN/u+aO8aCoO2+mKP
 PQxA==
X-Gm-Message-State: AOAM531qGdSE/7BV1GxkuF6LnUOi7Qb2ftE+ehTratJCEYYbUChvtl5k
 A05fjNL+Sdo8OD+5fVlqkNPDxF0TMBHYC2BPJx5jDKidmxExiufoXOpEz6G7T6qt7W60jxNbnRZ
 fgcIUR1jNW4Q9z0I=
X-Received: by 2002:a05:600c:14c2:b0:381:80db:c3b2 with SMTP id
 i2-20020a05600c14c200b0038180dbc3b2mr3139596wmh.56.1646737271560; 
 Tue, 08 Mar 2022 03:01:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSc7D92f+XfLj1pg1wGbzRQvOOag4YlZDUrl/9A47DfMtJFGMJ+iJf9w0m3M1P9DPzMI/2lQ==
X-Received: by 2002:a05:600c:14c2:b0:381:80db:c3b2 with SMTP id
 i2-20020a05600c14c200b0038180dbc3b2mr3139583wmh.56.1646737271313; 
 Tue, 08 Mar 2022 03:01:11 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 y4-20020adff144000000b001f022290737sm13362255wro.6.2022.03.08.03.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:01:10 -0800 (PST)
Date: Tue, 8 Mar 2022 06:01:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/47] virtio,pc,pci: features, cleanups, fixes
Message-ID: <20220308055639-mutt-send-email-mst@kernel.org>
References: <20220307100058.449628-1-mst@redhat.com>
 <CAFEAcA94Uu=kyinf+pLUT2cY05326EDX=TKUeiSJH_aEY-kPVg@mail.gmail.com>
 <CAFEAcA_wO6dkr6=HUYsOS7RxGErrAvsNnNqhKfM733Q=4v6cdw@mail.gmail.com>
 <20220307174713-mutt-send-email-mst@kernel.org>
 <CAFEAcA9qUMuDupNRCYeH5rzBY+J7D3XXN_92PJjhBYxF70kF=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9qUMuDupNRCYeH5rzBY+J7D3XXN_92PJjhBYxF70kF=w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 08, 2022 at 09:05:27AM +0000, Peter Maydell wrote:
> On Mon, 7 Mar 2022 at 22:52, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Mar 07, 2022 at 05:13:16PM +0000, Peter Maydell wrote:
> > > Also fails on cross-win64-system:
> > >
> > > https://gitlab.com/qemu-project/qemu/-/jobs/2172339938
> > >
> > > ../hw/virtio/virtio.c: In function 'qmp_x_query_virtio_vhost_queue_status':
> > > ../hw/virtio/virtio.c:4358:30: error: cast from pointer to integer of
> > > different size [-Werror=pointer-to-int-cast]
> > > 4358 | status->desc = (uint64_t)(unsigned long)hdev->vqs[queue].desc;
> > > | ^
> > > ../hw/virtio/virtio.c:4359:31: error: cast from pointer to integer of
> > > different size [-Werror=pointer-to-int-cast]
> > > 4359 | status->avail = (uint64_t)(unsigned long)hdev->vqs[queue].avail;
> > > | ^
> > > ../hw/virtio/virtio.c:4360:30: error: cast from pointer to integer of
> > > different size [-Werror=pointer-to-int-cast]
> > > 4360 | status->used = (uint64_t)(unsigned long)hdev->vqs[queue].used;
> > > | ^
> > > cc1: all warnings being treated as errors
> 
> > I dropped these for now but I really question the value of this warning,
> > as you can see the reason we have the buggy cast to unsigned long
> > is because someone wanted to shut up the warning on a 32 bit system.
> >
> > Now, I could maybe get behind this if it simply warned about a cast that
> > loses information (cast to a smaller integer) or integer/pointer cast
> > that does not go through uintptr_t without regard to size.
> 
> This *is* warning about losing information. On 64-bit Windows
> pointers are 64 bits but 'long' is 32 bits, so the path
> pointer -> long -> uint64_t drops the top half of the pointer.
> 
> thanks
> -- PMM

Yes obviously. My point is that this:
(uint64_t)hdev->vqs[queue].avail
is always harmless but it warns on a 32 bit system.

And someone trying to fix that *is* what resulted in
(uint64_t)(unsigned long)hdev->vqs[queue].avail


IOW I don't really see how
(uint64_t)(uintptr_t)hdev->vqs[queue].avail
is better than
(uint64_t)hdev->vqs[queue].avail

except as a way to say "yes I do intend to cast pointer to integer
here, I did not forget to dereference the pointer". But if that
latter is what gcc is trying to warn about, then it should
just warn about any cast to integer except to uintptr_t,
without respect to size.

-- 
MST


