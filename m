Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B63373C70
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:32:11 +0200 (CEST)
Received: from localhost ([::1]:45844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHdK-0007QR-OM
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remy.noel@blade-group.com>)
 id 1leHaZ-0005py-K8
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:29:20 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <remy.noel@blade-group.com>)
 id 1leHaU-0004YB-Bi
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:29:15 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d4so1840090wru.7
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 06:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blade-group.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kPDpgENHrmTqjKHX191uVRu4X3rz2E6kCHLEbBR1mpo=;
 b=LOkRboCoLIOaU5/x8mbOWTc3Bq8ka6HZiXSWvmu3TdWUv43Ypu8rmS9d/NjaZfyf+p
 h6i1TZk2cnThkYDRz80piqgxaI+mlL1EjCNgf9KI/dZKQvtT+ng8FAew0q3wWrZ8TowF
 ygG4YVENuaTIOAO4ONuFEfQQf00kY8HGj8nzRsj9E4VRdSL/rCrlubIEd8CawA1M2tCH
 LH0jdzg1FRxPj/nC/ovwGk1LJ2ARLLD0crX8Zs7GHBaxtGDy6FBmuSAeqkbSTzR2/7Ji
 nGIeq82LYJIo7eGEZTeGoc85Zqj9AogEcwFZgVfXn+1ebau+FplFIitH9Q0thBahly9o
 S9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kPDpgENHrmTqjKHX191uVRu4X3rz2E6kCHLEbBR1mpo=;
 b=EMOTdaKLTRjVirL2LD3VRIYfbVyzDFpz9sIZa9FRp0vyT//eeN23U85OUYi3OzAbUb
 M1EU6yLdxPHcFxoWJXluod59Iw22smaYeYamOWN9CExZxj7HFhKmtA6Y+q5I2y9UW8P0
 TkmY6KERWVDu8qv3whniNVm/7xHFl3geR96pcLEwx7gGGxqWjHrhU3aSrxtkot03ckz9
 5G9uE2YTLu7cFDe0MV8CCBhiCdin4BUjkLpjbBveCpVi5h5RdOxjyM7ZckYAU90aQHVv
 tRgMnx5/BW1y6C90YLXCUImf8HxG6s+jj2mOsuc7EuoqFYinj3MuNJS+evBMPi4YHBxC
 DvZg==
X-Gm-Message-State: AOAM530Z6iMVK6IF/jaMR1cxgxVBTOjB/KY0pP+N4LYJr3uLH8K6EvcU
 BBvmlE94lQ21JnhVK8wOKatuPg==
X-Google-Smtp-Source: ABdhPJyH0WoXrFO3tg692NGLb480qblzRvw4jF0c2s4iOzbiUzNOYzdBmzAVWgJjGCTplIf3yVFKvg==
X-Received: by 2002:adf:e906:: with SMTP id f6mr39453743wrm.200.1620221352117; 
 Wed, 05 May 2021 06:29:12 -0700 (PDT)
Received: from gmail.com ([2001:41d0:fc88:4700:250:b6ff:fe1f:8e7])
 by smtp.gmail.com with ESMTPSA id k10sm6625548wmf.0.2021.05.05.06.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 06:29:11 -0700 (PDT)
Date: Wed, 5 May 2021 15:29:10 +0200
From: Remy Noel <remy.noel@blade-group.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PULL 4/6] usb/redir: avoid dynamic stack allocation
 (CVE-2021-3527)
Message-ID: <20210505132910.myokkgilp4md6jit@gmail.com>
References: <20210505130716.1128420-1-kraxel@redhat.com>
 <20210505130716.1128420-5-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210505130716.1128420-5-kraxel@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=remy.noel@blade-group.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 05, 2021 at 03:07:14PM +0200, Gerd Hoffmann wrote:
>[...]
>diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
>index 17f06f34179a..6a75b0dc4ab2 100644
>--- a/hw/usb/redirect.c
>+++ b/hw/usb/redirect.c
>@@ -620,7 +620,7 @@ static void usbredir_handle_iso_data(USBRedirDevice *dev, USBPacket *p,
>                 .endpoint = ep,
>                 .length = p->iov.size
>             };
>-            uint8_t buf[p->iov.size];
>+            g_autofree uint8_t *buf = g_malloc(p->iov.size);
>             /* No id, we look at the ep when receiving a status back */
>             usb_packet_copy(p, buf, p->iov.size);
>             usbredirparser_send_iso_packet(dev->parser, 0, &iso_packet,
>@@ -818,7 +818,7 @@ static void usbredir_handle_bulk_data(USBRedirDevice *dev, USBPacket *p,
>         usbredirparser_send_bulk_packet(dev->parser, p->id,
>                                         &bulk_packet, NULL, 0);
>     } else {
>-        uint8_t buf[size];
>+        g_autofree uint8_t *buf = g_malloc(size);
>         usb_packet_copy(p, buf, size);

Won't this allows us to malloc then write an arbitrary amount of heap 
memory, allowing a guest driver to abort the qemu ?

Remy

