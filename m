Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853384F7C36
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 11:56:45 +0200 (CEST)
Received: from localhost ([::1]:37682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncOse-00029J-4B
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 05:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ncOpN-0007Yg-1T
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:53:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ncOpJ-0003YP-MC
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:53:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649325197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wQ6i1gh5L1tSoVPzY24MEa0A2/yfj3Sn0gX9Dxyu0kE=;
 b=B5CJEpnhlcNmXx82okpEBeq/DeKbEIJ6uXv0GRjYgW8ET478Bgu3K7JNb5dY0lBEkLQT/2
 13UY/8EHxUqccYlXjL4x+tpVSfieN0/jqu6vzB4QNKXSQ+87b9KXOwFySRpqrBnsoBWbMp
 bzCcif5nz64p/FPxhxSgiFeXWJA9hKM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-judsNxWEMIClsffcWleqew-1; Thu, 07 Apr 2022 05:53:16 -0400
X-MC-Unique: judsNxWEMIClsffcWleqew-1
Received: by mail-wm1-f71.google.com with SMTP id
 a16-20020a05600c349000b0038e6392a346so2733093wmq.4
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 02:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wQ6i1gh5L1tSoVPzY24MEa0A2/yfj3Sn0gX9Dxyu0kE=;
 b=mOqQj0VJk7mLbLvGvU4sbIECuUL9sZwTC6Alqrpu7boxBJopOyYrXqapYfYv4+f548
 Fto+f83efeynBwKLfpr6u88kV+kgzBKRtS9SExIW7yj4rstOj0R1Hy8Qmof26Udfoz87
 ftNC6Jx9I5/ocDgXWu02BAlP72yCuUx40UbMMUwxGdhDrPEw9Q+E4cTxz0mEjkiRpbWs
 cLVTt0yeb/TIPuD7Lgnn3xNQxKiMJgpeIx24M4BjewCWCqACX7Bum4vgibP5OQXX+pm6
 4CGrV9G/8pH035MT2CTWNFitGNp8IQrP8zqXEBKOFVa/UD03UgyP8N7K/jUfpMiwKXAu
 9F6A==
X-Gm-Message-State: AOAM530FvnDq6uLaNiecmH/FBtCYzAQ5dVcjnA03G6yNJmU2QA01zkPV
 ZbXKfQFpq43zbuHyquXyrzb2neTSQWul2tqrDEUxU/hzlXD0Xvmh9KNddrQEwwWtRi0pD1j8qaa
 A5yFBohroTZsH39w=
X-Received: by 2002:a05:6000:2c9:b0:204:1cdb:8f8d with SMTP id
 o9-20020a05600002c900b002041cdb8f8dmr10576176wry.49.1649325194564; 
 Thu, 07 Apr 2022 02:53:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHxT6KKxOEHxZv4rBsjm6xdSzw0mGiX1Nyv50jpwZl3fnCs9ZJgPvqfQa0YbiquPxHY/F3QQ==
X-Received: by 2002:a05:6000:2c9:b0:204:1cdb:8f8d with SMTP id
 o9-20020a05600002c900b002041cdb8f8dmr10576162wry.49.1649325194372; 
 Thu, 07 Apr 2022 02:53:14 -0700 (PDT)
Received: from redhat.com ([2.55.139.64]) by smtp.gmail.com with ESMTPSA id
 e37-20020a5d5965000000b0020610e2631esm10532744wri.107.2022.04.07.02.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 02:53:13 -0700 (PDT)
Date: Thu, 7 Apr 2022 05:53:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/3] virtio,pc: bugfixes
Message-ID: <20220407055201-mutt-send-email-mst@kernel.org>
References: <20220406211137.38840-1-mst@redhat.com>
 <CAFEAcA8ndeUiV_pph78H-LoSFWJ7DzvzXnLr-uQBD0D-V9PJQA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ndeUiV_pph78H-LoSFWJ7DzvzXnLr-uQBD0D-V9PJQA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Thu, Apr 07, 2022 at 10:18:24AM +0100, Peter Maydell wrote:
> On Wed, 6 Apr 2022 at 22:11, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The following changes since commit 128e050d41794e61e5849c6c507160da5556ea61:
> >
> >   hw/acpi/microvm: turn on 8042 bit in FADT boot architecture flags if present (2022-03-07 17:43:14 -0500)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > for you to fetch changes up to f556b9a0cd20d41493afd403fb7f016c8fb01eb3:
> >
> >   virtio-iommu: use-after-free fix (2022-04-06 17:11:03 -0400)
> >
> > ----------------------------------------------------------------
> > virtio,pc: bugfixes
> >
> > Several fixes all over the place
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> RC3 has gone. We're not taking any more changes unless they
> are absolutely release-critical, which means that you need
> to be clearly describing in the pull request cover letter
> what the changes are and why they are release critical.
> 
> thanks
> -- PMM

You know, after looking at it critically ;) I just sent the release critical
patch on list. Feel free to pick it up.

-- 
MST


