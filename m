Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6A73CEF8C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 01:03:30 +0200 (CEST)
Received: from localhost ([::1]:37520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5cIL-0001ek-Ot
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 19:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m5cF9-0006Bp-As
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 19:00:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m5cF3-0005SV-Iq
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 19:00:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626735604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dtweub69SwrUjfxqpiilTb6Y+T+lE9xKSSBR4DqBBao=;
 b=e3GEGLqyY/jWq5Yb1HKjwTApUIHhHHrkpZB4CkXycQOOL/4llOWv4rYH+WzAWLHf7jCrYD
 BGReoZ4O6BX6ocWnb460EInPDmW1YQgLT1uLDA/DKhrMlJAD314g57bLsYuZMZtU0VduY3
 1ZpLuwiKsZ1qzNC0oPUdI4WXp7ia4dA=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-6cyujU8vMVabzPUu5rbM3A-1; Mon, 19 Jul 2021 19:00:02 -0400
X-MC-Unique: 6cyujU8vMVabzPUu5rbM3A-1
Received: by mail-oi1-f199.google.com with SMTP id
 a10-20020aca4d0a0000b029025a01bc9839so14262163oib.13
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 16:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=dtweub69SwrUjfxqpiilTb6Y+T+lE9xKSSBR4DqBBao=;
 b=ciEptrbjgWoIXqZU1fl0ig+NOOdATfspil0Q+HLtd0h/EEnJR1WBjh+iLRjP6IDkQn
 zl6DFvZSNIrX+sT5F6hH47DWGBWVyhR6wGDhAXUTdolvNhqkeddSj6DLgfgFg4mkU+6H
 c9t+OV3JbPhJy4Pawe+yjtek97Dp2rF6bzlgKqwhD7pr2a4fXOTm/TDiMpIX8pxJSOCg
 C80D3g0MEMQeEIqYYcYi3dAf6koML3duUFeMruCw8V6+HG+KF0ttlZNrcOyuQ+D6KpcI
 F8irBhVd0umSvv+MMw7CWFiodhhfqz6tVb4BzbQzFsUWMHep2gAZX1+d4sdcqYuuLQgN
 aZvQ==
X-Gm-Message-State: AOAM533nmr59ainmDK1xs9XqZpvJHjUww9O4aZossQs4lDQPEhqlHG+k
 20m/XYNle0QzPhPCCS2Oit5eyie2/XWULMgcrZOLY/tV+/cwWeFf7bZQZZUwrTWCqZCnpJJfUTY
 NvVMckTpKxqYAZXo=
X-Received: by 2002:a9d:171c:: with SMTP id i28mr19983444ota.171.1626735601642; 
 Mon, 19 Jul 2021 16:00:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL6FjwZ4/60Ld5kVGuSGKUxcQKF2DC2tyOj+RH4AmO2rxgXSDl+3zvLA/tzOyICyt5w1tkvQ==
X-Received: by 2002:a9d:171c:: with SMTP id i28mr19983437ota.171.1626735601406; 
 Mon, 19 Jul 2021 16:00:01 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id o129sm4036666oif.21.2021.07.19.16.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 16:00:01 -0700 (PDT)
Date: Mon, 19 Jul 2021 16:59:59 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC 12/19] vfio-user: probe remote device's BARs
Message-ID: <20210719165959.23439f39.alex.williamson@redhat.com>
In-Reply-To: <e3db340f0300db92604f6c9611897df4d2ab901e.1626675354.git.elena.ufimtseva@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <e3db340f0300db92604f6c9611897df4d2ab901e.1626675354.git.elena.ufimtseva@oracle.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: john.g.johnson@oracle.com, jag.raman@oracle.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 18 Jul 2021 23:27:51 -0700
Elena Ufimtseva <elena.ufimtseva@oracle.com> wrote:
> @@ -3442,6 +3448,22 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>      /* QEMU can also add or extend BARs */
>      memset(vdev->emulated_config_bits + PCI_BASE_ADDRESS_0, 0xff, 6 * 4);
>  
> +    /*
> +     * Local QEMU overrides aren't allowed
> +     * They must be done in the device process
> +     */
> +    if (pdev->cap_present & QEMU_PCI_CAP_MULTIFUNCTION) {
> +        error_setg(errp, "Multi-function must be specified by device process");
> +        goto error;
> +    }
> +    if (pdev->romfile) {
> +        error_setg(errp, "Romfile must be specified by device process");
> +        goto error;
> +    }

For what reason?  PCI functions can operate completely independently,
there could be different servers for different functions, a QEMU user
may wish to apply a different option ROM image than provided by the
server.  This all creates unnecessary incompatibilities.  Thanks,

Alex


