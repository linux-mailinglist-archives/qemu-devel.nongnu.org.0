Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F834BB6E1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 11:28:29 +0100 (CET)
Received: from localhost ([::1]:53074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL0V2-0003rc-82
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 05:28:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nL0Ry-00014K-Nq
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 05:25:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nL0Rj-0003U4-IM
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 05:25:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645179902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cSBdhMECmJ9YMNmaqL0a4W6e7DWb374obOnnEOysK+M=;
 b=XImN+dvF7V8mRzSxc5ExFfqtaKlL5cSviYThrEDyQuwuNAH2B9b/8AuE2K8IoqMml0/eZ4
 FEEFWsMwVa+fo55vfSvR27gCPr0XAHvU6ifCiIhthwjfZrGRSFO+ue2O2oXp45GZCBgBTG
 1/RXLKUwkZs+tlXLEaY76kRj5Xr4m/k=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-Wa10MHwiNLWVTX7ozKBqBg-1; Fri, 18 Feb 2022 05:25:00 -0500
X-MC-Unique: Wa10MHwiNLWVTX7ozKBqBg-1
Received: by mail-qk1-f197.google.com with SMTP id
 k23-20020a05620a139700b0062cda5c6cecso1531126qki.6
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 02:25:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cSBdhMECmJ9YMNmaqL0a4W6e7DWb374obOnnEOysK+M=;
 b=7jmAn3QSAAy61PmBbQDNyXd6q59LqC6NlPDPZz09REx2pZQnfbqcwI3smnn/vpP29Y
 YlmdEqNKhiw8SNnlHPFrfLdbGdPdm8ciTDmEgLRPQms5GteMLd2hYe6f9daMeZkWhPZX
 6BU19aQbM2aXtfRYxDSoVL9JEsFmaqgYZeEyFnLxWupTolm5WYIzuT98WQFjLWrH98ek
 K/8Wy2rktKkxhtmq2wVZERPzURXvms/VaVBZBeE0AgEocYYKvTEapXheUuXl12LlKo7G
 vU7G//JeFhuT9b2rioyyyc/PIuHXuZcsv4Zxvy/j80jnsogtf1WBLgnZcau7PlKYkroj
 QsWQ==
X-Gm-Message-State: AOAM533rMkEdpIqEpiG1trOJ4bOUqZO31uElHwOASc8oCc9Zw/itiFJJ
 u3qMF5qt0bTg/Igfj13Z+KD78VqU/QZMrSwXixhXccL7a9jO2IV6FSQ524V/gPDT0bmtGVp991E
 cZKQChqBY11ZRgsoRzswdqTkkpK9ZZ1Y=
X-Received: by 2002:a05:622a:5ce:b0:2d6:b556:5aac with SMTP id
 d14-20020a05622a05ce00b002d6b5565aacmr5793036qtb.403.1645179899828; 
 Fri, 18 Feb 2022 02:24:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8dWTUDvIS2nK72hN/wAfzeRlvQogZASJr7ts0YY9XZVPfRPHPMNDFnkle+ZLHJMxu2ncwvKy9BrW/l9g09vg=
X-Received: by 2002:a05:622a:5ce:b0:2d6:b556:5aac with SMTP id
 d14-20020a05622a05ce00b002d6b5565aacmr5793022qtb.403.1645179899637; Fri, 18
 Feb 2022 02:24:59 -0800 (PST)
MIME-Version: 1.0
References: <20220215072231.2498-1-gdawar@xilinx.com>
 <20220215072231.2498-3-gdawar@xilinx.com>
 <20220217023150-mutt-send-email-mst@kernel.org>
 <20220217142910.eovyddvvpxkvzchf@sgarzare-redhat>
In-Reply-To: <20220217142910.eovyddvvpxkvzchf@sgarzare-redhat>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 18 Feb 2022 11:24:23 +0100
Message-ID: <CAJaqyWe-FSKSVYyDr_cMzGWQreTi+bkY9O6eaOvF5NmJoTBx9w@mail.gmail.com>
Subject: Re: [PATCH 2/2] Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa
 devices
To: Stefano Garzarella <sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Martin Petrus Hubertus Habets <martinh@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, tanujk@xilinx.com, pabloc@xilinx.com,
 Gautam Dawar <gautam.dawar@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 3:29 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Thu, Feb 17, 2022 at 02:32:48AM -0500, Michael S. Tsirkin wrote:
> >On Tue, Feb 15, 2022 at 12:52:31PM +0530, Gautam Dawar wrote:
> >> This patch adds the ability to negotiate VIRTIO_F_IN_ORDER bit
> >> for vhost-vdpa backend when the underlying device supports this
> >> feature.
> >> This would aid in reaping performance benefits with HW devices
> >> that implement this feature. At the same time, it shouldn't have
> >> any negative impact as vhost-vdpa backend doesn't involve any
> >> userspace virtqueue operations.
> >>
> >> Signed-off-by: Gautam Dawar <gdawar@xilinx.com>
> >
> >Having features that hardware implements but qemu does not
> >means we can't migrate between them.
> >So I'd rather see a userspace implementation.
>
> FYI Jason proposed to support VIRTIO_F_IN_ORDER in QEMU/Linux as an idea
> for the next GSoC/Outreachy. I offered to mentor and prepared a project
> description [1], if anyone else is interested, it would be great to have
> a co-mentor :-)
>

I'd be happy to co-mentor for sure, should I edit the wiki to reflect it?

Thanks!

> Thanks,
> Stefano
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg04032.html
>


