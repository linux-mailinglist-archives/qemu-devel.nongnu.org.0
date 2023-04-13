Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0649B6E0B98
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 12:42:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmuNt-00044D-JO; Thu, 13 Apr 2023 06:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pmuNm-00043l-19
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 06:40:50 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pmuNj-0008Pl-Pv
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 06:40:49 -0400
Received: by mail-wr1-x430.google.com with SMTP id v6so13730000wrv.8
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 03:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681382445; x=1683974445;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Wt8QYWYgXcWDb0H4PzSCSB86AxQEfmL5GXKTxvwufWc=;
 b=vgr124BoHwdFxO+8XR7kdg8rVvjTn0NVgvqh2IRic5l3kYQUOHhoQTaVNENat3MtFT
 m04F+OZzwB9jdXFcnIsy4aWQ3aKr0ztkHTOY6lQZ0EIMXvg5dVLnUFVklSWIiXyUg4so
 TPyVIYoQ1qePdYzwdUatim3ab6+GMl+0NJj8xfSvKLwJQnSK51k2RUJ7jcnHU8E/hRB/
 BKNyh1LoGZg8FGwx9Hl1BU7tjqrmd6G8BpbRurNdgS7Iv9KFU3t9Z9C/31kJSRwapfUb
 Cgvxo+ND0LV1gCZDa3V6SUHKfqXrfdHaqn3DoKaK9742YoxMJDoe4T2PQI3CKdzzH6ru
 7PvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681382445; x=1683974445;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wt8QYWYgXcWDb0H4PzSCSB86AxQEfmL5GXKTxvwufWc=;
 b=kumCyiqRUC+J0AYNPQnMOSaPVZCz6AysqY5saS5tWjihnBYHho5lgOq1zyvg07a/EX
 qtBeDS/wsGEr+qst0NyHkU18uNj92rS5AkMizA5KbXFGyUr7CbDcgTiv8w+5LtAIAu7Y
 x5Wc2NTTQTHGaAxZp5EK0Xxj/kt3NSBgQUm8YHF2D8gH8NKXgFbn6sBSYYYCyoxbEo4m
 p0I/g9Y5a6Gzki1MDnwby9pbZ0tZ6s7klNYkJOIgS5wPAizwfhJkS6nk/w0HIwzJi/Ao
 xDcJoA5u5UbL7SCkmxtk2prSbEFPi3Cw4P7uImGlmFiUB5yBNm4S7XKrW/fnPwTEak6T
 t9bw==
X-Gm-Message-State: AAQBX9f+cFk7vr9i7o+QOpplAW8waLvR6B3dn+JRKvPagdu8+CDJYsCb
 jcf7sbYFrWf9kGxi27mmYNRSxQ==
X-Google-Smtp-Source: AKy350ZKTDVRuGJL5YYI5HJoiDXvklp7EVihRfgojTs66okpvLm6QBr1zfRfZkA+Oait71i9Hok2BQ==
X-Received: by 2002:adf:e352:0:b0:2ef:b1bd:786 with SMTP id
 n18-20020adfe352000000b002efb1bd0786mr1002307wrj.13.1681382444786; 
 Thu, 13 Apr 2023 03:40:44 -0700 (PDT)
Received: from myrica ([5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 z1-20020a5d4d01000000b002e5f6f8fc4fsm990119wrt.100.2023.04.13.03.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 03:40:44 -0700 (PDT)
Date: Thu, 13 Apr 2023 11:40:41 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Eric Auger <eric.auger@redhat.com>, virtio-dev@lists.oasis-open.org,
 virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org
Subject: Re: virtio-iommu hotplug issue
Message-ID: <20230413104041.GA3295191@myrica>
References: <15bf1b00-3aa0-973a-3a86-3fa5c4d41d2c@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15bf1b00-3aa0-973a-3a86-3fa5c4d41d2c@daynix.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hello,

On Thu, Apr 13, 2023 at 01:49:43PM +0900, Akihiko Odaki wrote:
> Hi,
> 
> Recently I encountered a problem with the combination of Linux's
> virtio-iommu driver and QEMU when a SR-IOV virtual function gets disabled.
> I'd like to ask you what kind of solution is appropriate here and implement
> the solution if possible.
> 
> A PCIe device implementing the SR-IOV specification exports a virtual
> function, and the guest can enable or disable it at runtime by writing to a
> configuration register. This effectively looks like a PCI device is
> hotplugged for the guest.

Just so I understand this better: the guest gets a whole PCIe device PF
that implements SR-IOV, and so the guest can dynamically create VFs?  Out
of curiosity, is that a hardware device assigned to the guest with VFIO,
or a device emulated by QEMU?

> In such a case, the kernel assumes the endpoint is
> detached from the virtio-iommu domain, but QEMU actually does not detach it.
> 
> This inconsistent view of the removed device sometimes prevents the VM from
> correctly performing the following procedure, for example:
> 1. Enable a VF.
> 2. Disable the VF.
> 3. Open a vfio container.
> 4. Open the group which the PF belongs to.
> 5. Add the group to the vfio container.
> 6. Map some memory region.
> 7. Close the group.
> 8. Close the vfio container.
> 9. Repeat 3-8
> 
> When the VF gets disabled, the kernel assumes the endpoint is detached from
> the IOMMU domain, but QEMU actually doesn't detach it. Later, the domain
> will be reused in step 3-8.
> 
> In step 7, the PF will be detached, and the kernel thinks there is no
> endpoint attached and the mapping the domain holds is cleared, but the VF
> endpoint is still attached and the mapping is kept intact.
> 
> In step 9, the same domain will be reused again, and the kernel requests to
> create a new mapping, but it will conflict with the existing mapping and
> result in -EINVAL.
> 
> This problem can be fixed by either of:
> - requesting the detachment of the endpoint from the guest when the PCI
> device is unplugged (the VF is disabled)

Yes, I think this is an issue in the virtio-iommu driver, which should be
sending a DETACH request when the VF is disabled, likely from
viommu_release_device(). I'll work on a fix unless you would like to do it

> - detecting that the PCI device is gone and automatically detach it on
> QEMU-side.
> 
> It is not completely clear for me which solution is more appropriate as the
> virtio-iommu specification is written in a way independent of the endpoint
> mechanism and does not say what should be done when a PCI device is
> unplugged.

Yes, I'm not sure it's in scope for the specification, it's more about
software guidance

Thanks,
Jean

