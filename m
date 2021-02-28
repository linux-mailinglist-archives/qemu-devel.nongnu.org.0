Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6B13274A3
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 22:39:46 +0100 (CET)
Received: from localhost ([::1]:36762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGTmy-0002N4-El
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 16:39:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lGTlP-0001ue-No
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 16:38:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lGTlM-0002dA-Ob
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 16:38:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614548282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pAf5L974tt6AWgogipf5YDIeWdXxUPezHLrkKFYUVhk=;
 b=ElwuT+Gu7C6lqBqzQt0Yxw5i9aDtflpxq5g92vdPD5BqvmBR5viiJN7VTOWYP0rfoRJvU9
 nwzkJlCbDfwoMrG83OHnHJrOl0Cw6Q2gdo/G/ka6M1ly7Mz4QOeww6pkYEgCxXNh4SoNEV
 mjxjNIHrCAwU6sNgSGiRd93NGNa61+w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-PwpGLCE2MbuGfDFYOjwosw-1; Sun, 28 Feb 2021 16:38:00 -0500
X-MC-Unique: PwpGLCE2MbuGfDFYOjwosw-1
Received: by mail-ed1-f70.google.com with SMTP id c7so7878520ede.17
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 13:38:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pAf5L974tt6AWgogipf5YDIeWdXxUPezHLrkKFYUVhk=;
 b=KSBezCB8WRDKLm4E7/+dJYtlWfN4KE6e1ocMYrkCIxv+Pm+xg/oQgyycHpc3afGNdO
 NgSefeSu/HO07c8qlZMqOEyiINcJ9GWwXtB4zYyryTDsCY75uU0HQVrlMfgCFKDAd0lT
 BDw49cD5q4NAnwYrBK6He+OxZIcfvIt08JEBueHD6zeCKWbacbJakDSoVMEATrrV4eqc
 6ojd2FGXwv6HIYwv35IJeUej9ajN/6Y3hu7Deq8XwWPDY5oHABr1HjTIsbpiIpYWGLTF
 Vi9Hf60Db+M0I28//XL+IBA+B93NeS5mVCL/XloPBnsSIvnKE1xRJtko4HZGpgGv19R5
 PsPA==
X-Gm-Message-State: AOAM533+SaZaVH8lY4T0zrs0ci4BBYZVInoFnDl9FCQ5ZicVwl/tAJ8J
 Bkxd2x8oIKWA/w50D4JDmwhZxXqcnvxxJbnrwBUuDc15Dh2M/wGDpheXny603NsCiUkzvwv5ucV
 7ffUGkUhgpt5QFMY=
X-Received: by 2002:a05:6402:4c1:: with SMTP id
 n1mr10666770edw.199.1614548279777; 
 Sun, 28 Feb 2021 13:37:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzv8q8iGP+J03Z0seS7fsrax2vaeWE1NH2GcT9ANT68VQoEaAk6Zl1ip1DmgbFVW8q2BkmcZg==
X-Received: by 2002:a05:6402:4c1:: with SMTP id
 n1mr10666754edw.199.1614548279574; 
 Sun, 28 Feb 2021 13:37:59 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id x20sm11193094ejv.66.2021.02.28.13.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 13:37:57 -0800 (PST)
Date: Sun, 28 Feb 2021 16:37:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: vit9696 <vit9696@protonmail.com>
Subject: Re: [PATCH 1/2] i386/acpi: fix inconsistent QEMU/OVMF device paths
Message-ID: <20210228163726-mutt-send-email-mst@kernel.org>
References: <20200730155755.188845-1-mst@redhat.com>
 <5b40e1ac-03ca-7954-4d50-f5f96c339772@proxmox.com>
 <1D984D1D-0DFB-49FC-BD7F-1AAF9B862A5D@protonmail.com>
 <e36b3025-d709-1a6c-6b5a-a08bc6de819f@proxmox.com>
 <x3i3TiibtrC1qTDQUKxuOA_9qvmInzVwv6RrvzzSCSj-S21gLypbbZgEbYvJSGMxC1r8RaDrnHGgRbDI7vfpA_XuDINdZej9yKCW3_Sc4YM=@protonmail.com>
MIME-Version: 1.0
In-Reply-To: <x3i3TiibtrC1qTDQUKxuOA_9qvmInzVwv6RrvzzSCSj-S21gLypbbZgEbYvJSGMxC1r8RaDrnHGgRbDI7vfpA_XuDINdZej9yKCW3_Sc4YM=@protonmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Stefan Reiter <s.reiter@proxmox.com>,
 qemu devel list <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 28, 2021 at 09:28:26PM +0000, vit9696 wrote:
> Thomas, macOS is not really "special" here, it is rather that you will not
> frequently use boot options in a VM. One of the most popular uses for boot
> options is to switch between the operating systems, but for virtual machines
> it is rarely the case. However, macOS does indeed use boot options for itself.
> One example is to install updates. As long as the created boot option is not
> valid an automated reboot during the update installation may result in the
> wrong bootloader being chosen or in a stall within the firmware UI awaiting
> manual boot option selection.
> 
> Michael, does your suggestion mean that the default approach will be to keep
> the new behaviour, but if you manually specify an older q35 machine version it
> will provide the original behaviour. If so, it seems fair to me.
> 
> Best regards,
> Vitaly

Exactly. Vitaly, could you cook up a patch like this?

-- 
MST


