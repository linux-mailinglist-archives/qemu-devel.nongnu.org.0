Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E235669786
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 13:40:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGJLU-0001BQ-M9; Fri, 13 Jan 2023 07:39:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pGJLD-00016q-J4
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 07:39:30 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pGJLB-0006Bm-Qk
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 07:39:27 -0500
Received: by mail-ej1-x62b.google.com with SMTP id mp20so5416256ejc.7
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 04:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J61MUqZn0+MBzAAeVOxfaZtzS1HhgzXUYJt7WOYvh7c=;
 b=aHNpZZofU80g+NmYxTTXP8GscTCWmTgTxmJ5LvbiqroTPCAobrFz0EjeBIG1VCC0Gr
 ss/EU1tEqaXOC5/pW36qr+24PU7e0qalJTRokgZFZLCWaLwm1xO4UfVdeyw7AjSnuyiq
 V6gbdBXT3GP9Me6LllFGgDnO1JH4vmr+vDTL/gvR6Rbhvslt/tCS3SxmGACC4VK0up9s
 1L5f8vZeD7whI9w8F1Fd6P0SugwJdtb3y65tllU++3Qubo3vFHi4nmzt6S0soIQ4KE+s
 KMSqc2JXKosAgeNPlrquWP7lpdJtdEinRxVZYIXWamP64fZkVpbSfr9eeQx3KIlpAxCV
 hr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J61MUqZn0+MBzAAeVOxfaZtzS1HhgzXUYJt7WOYvh7c=;
 b=z3jblQiUsbLd/tsdYHdl71zRjzHh8zKvslwXSjONtN09kFchshCSe/nLEbnJHmL/i7
 x1DNECQrq8P8q5y3J4IJViaZ6+pW6MfCU1R7g5XyxGVHCdqnIWRVe2EkF60pGiZMMcDa
 96plaZE/08Ehy82hFRwK9ZxtfXRACMgTaJqRX+E2SOKlNnm/fKIKP3lLmeY8vpus2Rda
 bpQVOsuAgGf40tcvDIDCSEEUra5gQucYL6nqTj/kZRuvqMp/MYuE9LA6PlUGWOvSoLIh
 zuH/2cbpk8Ot/w8TcXKbfXWI1gGMXP55/ouSlabuGRg443JqCPnGB+Gmq6SaiTvIlbtr
 Lwgw==
X-Gm-Message-State: AFqh2kr9Rh2w5u96wt44SeNOR7JBiJdMtZUiFmk9XPGUB62tMA1g6ucC
 h2KS7SawOPvLurEiHmvEag5pdg==
X-Google-Smtp-Source: AMrXdXtp0JY/qh6I9DFPE1TkAKrrXX7h2fJYYH6rCyN/QreFnf8QLl3KUfaEDXDCh6Hu1gfFvxILOA==
X-Received: by 2002:a17:907:c28f:b0:83f:5f77:8ff9 with SMTP id
 tk15-20020a170907c28f00b0083f5f778ff9mr68670530ejc.12.1673613560723; 
 Fri, 13 Jan 2023 04:39:20 -0800 (PST)
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
 by smtp.gmail.com with ESMTPSA id
 v27-20020a17090606db00b0081d2d9a0b45sm8437848ejb.186.2023.01.13.04.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 04:39:20 -0800 (PST)
Date: Fri, 13 Jan 2023 12:39:18 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eauger@redhat.com>
Cc: qemu list <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Subject: Re: virtio-iommu issue with VFIO device downstream to a PCIe-to-PCI
 bridge: VFIO devices are not assigned any iommu group
Message-ID: <Y8FQ9li7gQ+bPiRe@myrica>
References: <0bc2f2e5-630e-e721-254d-f224d1a3bdcd@redhat.com>
 <0eb96eb5-703d-dacd-49ff-f61e02d98eb9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0eb96eb5-703d-dacd-49ff-f61e02d98eb9@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x62b.google.com
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

Hi,

On Mon, Jan 09, 2023 at 10:11:19PM +0100, Eric Auger wrote:
> > Jean, do you have any idea about how to fix that? Do you think we have a
> > trouble in the acpi/viot setup or virtio-iommu probe sequence. It looks
> > like virtio probe and attach commands are called too early, before the
> > bus is actually correctly numbered.
> 
> So after further investigations looks this is not a problem of bus
> number, which is good at the time of the virtio cmd calls but rather a
> problem related to the devfn (0 was used when creating the IOMMU MR)
> whereas the virtio-iommu cmds looks for the non aliased devfn. With that
> fixed, the probe and attach at least succeeds. The device still does not
> work for me but I will continue my investigations and send a tentative fix.

If I remember correctly VIOT can deal with bus numbers because bridges are
assigned a range by QEMU, but I haven't tested that in detail, and I don't
know how it holds with conventional PCI bridges. Do you have an example
command-line I could use to experiment (and the fix you're mentioning)?

Thanks,
Jean

