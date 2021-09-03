Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 580CE400015
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 14:58:43 +0200 (CEST)
Received: from localhost ([::1]:49318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM8mH-0003Uq-Sa
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 08:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salvatore.bonaccorso@gmail.com>)
 id 1mM8kI-0002ie-ES; Fri, 03 Sep 2021 08:56:38 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <salvatore.bonaccorso@gmail.com>)
 id 1mM8kG-0004nt-NT; Fri, 03 Sep 2021 08:56:38 -0400
Received: by mail-wm1-x333.google.com with SMTP id e26so3456771wmk.2;
 Fri, 03 Sep 2021 05:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bM7LuNi9U+MRKLiBstABt5WWtqc8m1BJMaZpi4o2Nhc=;
 b=Sukbv/UkApnNLCotA4HIDWgDw4C37x77nDpHi60Zelzu7nDa0WBrcJ+1TKq+2zoOPU
 Khm3hce+cwweMUxfWwvjP3FxAPXyFMbc7o0E1jFHphdAf82Dc48M3mog69gUveWWP/TK
 qwWSvOYcUF+IympHEJDv7eUHWQVwBYHQKDwS0niYILPCjLS0Ur+eIklrDkTqapTNloNK
 QjL+Y8/Dl2LRtn1UoJ2sYxW+9joVRGagkXlqobupWXFIvXqE1Ox436+AtOGoZnZIAgJb
 xnYyzxtebqFlEeDpRfsRNNlg6qjWFEDxtgG7IFy9CitqSe2+ylik/gYp5CSCAnxeGWD/
 to+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=bM7LuNi9U+MRKLiBstABt5WWtqc8m1BJMaZpi4o2Nhc=;
 b=LLZ0rKJbJghGLngHdhMzrhH8Zl7MLhgsgkiv3FSx3LbDb/0mgNa/R2E+7t3yKlOXKm
 MOa6RnD7UVHUo+0luluXIona9FlnRn9oJGoXi3yJfZJVxam5ikJxGNW//2a0kT36ueeE
 7N/cEloxRfcZmgvZcw5pNJ55dt8O3xMq5GHEf59G+tbi+x/GneDVy5HMMuPwow4iu+5H
 dmBJ//Sadqat+I4j+kTuBWG02J2Lc9g0SXwa/MAGBVBjvmIViLZUaOrbppXT+cxGgJ+a
 83p0glFiyz99UhR9q6pL0CmFfvggFivKmQN/3ToH2Ql2uZLoS19o1TujQmBMKU6Gpo3c
 DIYg==
X-Gm-Message-State: AOAM533ntjlMNdSRWmMhk1xeBdq3DPrCL2PB7YIR6tTyBkfzN2p2b/Zo
 7EBqw+vRRw/ATgK6WvqJCrg=
X-Google-Smtp-Source: ABdhPJxgGcGuvsb8WWFThQFQrSyPx4/F6pFlsCT0ukKCBwaxnwm750Cnry4/AMbRJXQDQXEEpDgLKA==
X-Received: by 2002:a05:600c:4fcd:: with SMTP id
 o13mr265985wmq.32.1630673794427; 
 Fri, 03 Sep 2021 05:56:34 -0700 (PDT)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
 by smtp.gmail.com with ESMTPSA id m30sm2356362wrb.3.2021.09.03.05.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 05:56:33 -0700 (PDT)
Date: Fri, 3 Sep 2021 14:56:32 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Li Qiang <liq3ea@gmail.com>
Subject: Re: [PATCH v2] fdc: check null block pointer before r/w data transfer
Message-ID: <YTIbgNzyZBsUwCHg@eldamar.lan>
References: <20200922092722.344518-1-ppandit@redhat.com>
 <CAKXe6SLOgvwBtTthhB0zLv_cxB==jrT8eZcGioKTk1u=Rpio5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKXe6SLOgvwBtTthhB0zLv_cxB==jrT8eZcGioKTk1u=Rpio5w@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=salvatore.bonaccorso@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 Ruhr-University <bugs-syssec@rub.de>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 22, 2020 at 06:42:22PM +0800, Li Qiang wrote:
> P J P <ppandit@redhat.com> 于2020年9月22日周二 下午5:29写道：
> >
> > From: Prasad J Pandit <pjp@fedoraproject.org>
> >
> > While transferring data via fdctrl_read/write_data() routines,
> > check that current drive does not have a null block pointer.
> > Avoid null pointer dereference.
> >
> >  -> https://ruhr-uni-bochum.sciebo.de/s/NNWP2GfwzYKeKwE?path=%2Ffdc_nullptr1
> >     ==1658854==Hint: address points to the zero page.
> >     #0 blk_inc_in_flight block/block-backend.c:1327
> >     #1 blk_prw block/block-backend.c:1299
> >     #2 blk_pwrite block/block-backend.c:1464
> >     #3 fdctrl_write_data hw/block/fdc.c:2418
> >     #4 fdctrl_write hw/block/fdc.c:962
> >     #5 portio_write ioport.c:205
> >     #6 memory_region_write_accessor memory.c:483
> >     #7 access_with_adjusted_size memory.c:544
> >     #8 memory_region_dispatch_write memory.c:1476
> >
> > Reported-by: Ruhr-University <bugs-syssec@rub.de>
> > Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> 
> Reviewed-by: Li Qiang <liq3ea@gmail.com>

Did this one just felt through the cracks, or was it not further
considered?

Regards,
Salvatore

