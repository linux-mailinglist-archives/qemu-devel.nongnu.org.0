Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34824267BB
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 12:24:48 +0200 (CEST)
Received: from localhost ([::1]:42706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYn3X-0001ur-Bc
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 06:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYn0z-00078d-1g
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 06:22:09 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYn0t-0004CW-PU
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 06:22:07 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e12so28215468wra.4
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 03:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0k0PzestVC6LZv3Pn2FtfyK91M0uOT1WRxF/jnvjYWo=;
 b=hijJtV4FNapadjpQSsYhEZhAakYWqcBodFB2OOX5d4xj07GAYj+oVa3e2fad7wZLUR
 hEp2tnzJpD3v50XYmTZP/FKVOpJP4thvRCmLJP3hMYktMETrH505Lpqb/DU0rkOQ7KOt
 F6xC2MuD+nORUC7qv2Z+bRYDjLcLyq7kouEAM7Qf7FJQ1HUwniAp+DJrmWFoYPAGZqQO
 RV7UbEufEZJmVGGhl8xIqJZK/xqr8lZKSkx8wLWVn8Ynzm+66gcPfjVMpR7TUKtSV0iu
 /aydExCMzVNh/RlBTBzcW1kJwzZI/NUbtIufe/M1sckHpbqKOnpdsHVIxfejnR+ymjk+
 GBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0k0PzestVC6LZv3Pn2FtfyK91M0uOT1WRxF/jnvjYWo=;
 b=CHV47czt5rt/paY2Zjaz/z/nzZyNnQkmwno5WcpCHdqrMq+25Zt4sSTIDay04zicjU
 O0oB+X3rll8tQX1L2TrYb+Fo4QjKsmdOCHjPBUYrxntZQxXP3JWLPaf04knOEaHcFfxZ
 Mf5F5LDpUNhKtdPLvhX3uiD6UiVHdQOLsMVpJHMcuXx1i/8oB9tiDPoNK8EquBqMofyz
 wg04iv/LYvczZchuR8IUnoTw1JJhyv6c5XKVrAkGBe78qK6DD6kSwk8SzxWRmWvoK5Cn
 +B/GMpuy0YbXQN8j2uFwodwK4we0ps1J+LiV40CZBbU5oj4KDZf+6hfQrwtZrUg7jZIu
 nCPg==
X-Gm-Message-State: AOAM530bB4Owa6NnOgXbXCc3d6NZ24efcpexB4ONnnjE+Bo7n0iOtYth
 1/3xnVvF3N1uTUzeqfg41fTG1g==
X-Google-Smtp-Source: ABdhPJx7m8N3dEqKegYGRttttW6S7pjJT9dOht1r6WG9fLCUJ4URUgmBb1qB8BlOKJ+HqCwFOZGuzw==
X-Received: by 2002:adf:a390:: with SMTP id l16mr2969194wrb.104.1633688520984; 
 Fri, 08 Oct 2021 03:22:00 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id f22sm2053604wrd.8.2021.10.08.03.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 03:22:00 -0700 (PDT)
Date: Fri, 8 Oct 2021 11:21:38 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 2/3] virtio-iommu: Default to bypass during boot
Message-ID: <YWAbsnxt2YY4Etbs@myrica>
References: <20210930185050.262759-1-jean-philippe@linaro.org>
 <20210930185050.262759-3-jean-philippe@linaro.org>
 <8fc7acc5-2ce5-293a-0db3-40ff52b91803@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fc7acc5-2ce5-293a-0db3-40ff52b91803@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 06, 2021 at 03:04:15PM +0200, Eric Auger wrote:
> > +    if (config.bypass != dev->config.bypass) {
> > +        if (!virtio_vdev_has_feature(vdev, VIRTIO_IOMMU_F_BYPASS_CONFIG)) {
> > +            virtio_error(vdev, "cannot set config.bypass");
> > +            return;
> > +        }
> > +        if (config.bypass != 0 && config.bypass != 1) {
> > +            warn_report("invalid config.bypass value '%d'", config.bypass);
> > +            dev->config.bypass = 0;
> Shouldn't we leave the old value instead. The spec proposal says it
> takes 0 though.

Yes keeping the old value is better, I'll change the spec. Writing a
different value is a driver bug since new values for the bypass field will
be keyed off a new feature bit.

Thanks,
Jean


