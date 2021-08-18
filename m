Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC103F0B40
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 20:49:09 +0200 (CEST)
Received: from localhost ([::1]:46260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGQcd-0003gg-NN
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 14:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mGQbH-00030b-I0
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 14:47:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mGQbD-0002st-ND
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 14:47:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629312458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OVNioJaOKPWVJ7c7+1D/LBLnpm63OprbvZqC7b3Xz44=;
 b=PWPFDi2Up2r0ouYs+fm2rZBUTvspyKU7Ui95PYOyUTT/OqOGIGMUhOvbcCNXTtg7BlAgl8
 VHinD3RE9J/w1glQr3Xk29IAQs3BB1JLTlIPlLGU68GvDY4xEymt84XzYdPmgMD2jjz9IL
 dV3D7BbceM3mNRkBUp4E6+q66ElDQc8=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-8aViOUAkO-ikTtqaIvKvgQ-1; Wed, 18 Aug 2021 14:47:35 -0400
X-MC-Unique: 8aViOUAkO-ikTtqaIvKvgQ-1
Received: by mail-oi1-f199.google.com with SMTP id
 s10-20020a056808008a00b00268c82cc7a0so980808oic.14
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 11:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OVNioJaOKPWVJ7c7+1D/LBLnpm63OprbvZqC7b3Xz44=;
 b=JJRAp4Vnp7KejqNxzxC/ff40EQKSFrw6/P9I2p3fVpG1SDfYa+mhKfIsNG6FF9nhnS
 v/sQ0h1nbxl/EYsChvvWhtpp9fkqrlGZGSllfkNgqPYyXl9ra6NNIpyhIGLqPAQjxzOu
 YR2z1tkUeB0W9kz6fl+GTbk6W1N0Wrphh+dj4yo1CJK4u61ib+dGxPcrE16oSqdcbvU6
 2FNAVso+N7jCEWIfCbQfgL9IlafyKRuTK7vzAGJ1d9jK6q6ngrqf2LorSgLH9EijPl3D
 LkV31dLb4PWjG0nLngxCpJljhThr4q+vE7JbOg2OfGWEcwMI8d+cmqtCuqOpcOyPr0ZF
 oX9g==
X-Gm-Message-State: AOAM532T/k/fLs7rqtfRlygO1gYRXdixS6Zx8Ml9W4az8LnSrCQPbRUP
 NplLxufWafENHqZjFsLU78vZmvz8Tc59rq4JcuGEyfSE1MaBlJxICsQu/iFKTk5I/qogs8j/4m4
 cSCAYEpQGbtcUvcY=
X-Received: by 2002:a05:6830:214c:: with SMTP id
 r12mr7109201otd.200.1629312454446; 
 Wed, 18 Aug 2021 11:47:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0M19Zpp2UQXQUfOyBx2TYWszgiysxG81+zFhJU+ILUiPBBc0AE/s8MqPwbAkTwU0WtHFgpQ==
X-Received: by 2002:a05:6830:214c:: with SMTP id
 r12mr7109189otd.200.1629312454215; 
 Wed, 18 Aug 2021 11:47:34 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id d11sm113134ooh.8.2021.08.18.11.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 11:47:33 -0700 (PDT)
Date: Wed, 18 Aug 2021 12:47:32 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Message-ID: <20210818124732.2fcc6180.alex.williamson@redhat.com>
In-Reply-To: <e9fa92081e0faf49089f4afb9a45187e49ea4bad.1629131628.git.elena.ufimtseva@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <e9fa92081e0faf49089f4afb9a45187e49ea4bad.1629131628.git.elena.ufimtseva@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: john.g.johnson@oracle.com, jag.raman@oracle.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Aug 2021 09:42:37 -0700
Elena Ufimtseva <elena.ufimtseva@oracle.com> wrote:

> diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
> index da9af297a0..739b30be73 100644
> --- a/hw/vfio/meson.build
> +++ b/hw/vfio/meson.build
> @@ -8,6 +8,7 @@ vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
>    'display.c',
>    'pci-quirks.c',
>    'pci.c',
> +  'user.c',
>  ))
>  vfio_ss.add(when: 'CONFIG_VFIO_CCW', if_true: files('ccw.c'))
>  vfio_ss.add(when: 'CONFIG_VFIO_PLATFORM', if_true: files('platform.c'))

Wouldn't it make sense to be able to configure QEMU with any
combination of vfio-pci and/or vfio-user-pci support rather than
statically tying vfio-user-pci to vfio-pci?  Not to mention that doing
so would help to more formally define the interface operations between
kernel and user options, for example fewer tests of vbasedev->proxy and
perhaps more abstraction through ops structures.  Thanks,

Alex


