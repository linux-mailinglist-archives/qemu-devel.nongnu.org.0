Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D546759D8
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 17:24:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIuAd-0001Ts-EG; Fri, 20 Jan 2023 11:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pIuAb-0001Ti-63
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 11:23:13 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pIuAZ-0002ZP-AW
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 11:23:12 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so6231985wmb.0
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 08:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kFMkJhqv6yc3ymvUnVVd9kA4kjDVwE9670tST1GhSoE=;
 b=OZ9dLnCiNn/Uu3vntdG9XkZeMAfL3HsMjBroF66IUDu16eE8tW4OaXyeDFXsLKdqtl
 Eplut69sQCW18bm3NsZBHxUJnsYqHE+FRUWBKAE570hKxcxq2OszvvBBvLDwwebee+Xi
 QRDES5zG9MV5s0/utSFy8XfO916s93Wcp5MJoeMN6RrKX5GYC3FEK0p/n2Gx/15QF4kC
 CUmvFmtOGsQMc/5H+/DvUuVljmEwq2U59R03Q2yVHMXXL0aAxuczI2fnYitwG6iUvDpJ
 /7Ce4f4EzjHeBxGH44iXGfIuy+5a4d6GzENHYuu0CLTinfgW+rU6vJqCE7KubVS/nve6
 3zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kFMkJhqv6yc3ymvUnVVd9kA4kjDVwE9670tST1GhSoE=;
 b=6TWmwM4Hx/XM+Q3gmCeVNEjPGE+xbkHp79JazdtfP015UO7NOo7ens0mggcePkPaG4
 7fOk2Qp65/D6otvRD0y1TSMTrAGTvTc8mFMACJ+ix6TPyMbaDME3MyMaNL63WX4X2hzn
 HBXLhEVmfJgORT2ghdCmNB++fpxhUOO/irgyiVtzM/aPYgCN5aGF4cWPamVJoXiR7Er2
 akR6Clftj4u8oM2Gn6nRt3kvj2wVNcvjU3+3DkJieYAVhzjpiBYA4rE7eNDcL6Pzpgvb
 D38fPW9++mwlNg0hTbLJi5eszK9EoFLdg6VSreR6hOgF5IJmVCdSSaur4lQ/CpVNJwtm
 dD8A==
X-Gm-Message-State: AFqh2kppx60rYtTDMf4sQUjf3TAoQu9glc5Fz2O/NSBk84FyqG5OR1pH
 a4tJCldc/IrOknU2TXRT9CRFXw==
X-Google-Smtp-Source: AMrXdXunfXdo5Jf80Z2TbM2R6gozBjPAGWExxD1XwWylYYj2WUpw+/qnZ8Rx6EPp9qvFbk3RMXnh0g==
X-Received: by 2002:a05:600c:c16:b0:3da:26e5:10b6 with SMTP id
 fm22-20020a05600c0c1600b003da26e510b6mr15075061wmb.30.1674231789481; 
 Fri, 20 Jan 2023 08:23:09 -0800 (PST)
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c4f0f00b003d9df9e59c4sm2996929wmq.37.2023.01.20.08.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 08:23:08 -0800 (PST)
Date: Fri, 20 Jan 2023 16:23:04 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, peterx@redhat.com,
 alex.williamson@redhat.com, jasowang@redhat.com, mst@redhat.com
Subject: Re: [RFC] virtio-iommu: Take into account possible aliasing in
 virtio_iommu_mr()
Message-ID: <Y8q/6NJhK1MhNuY9@myrica>
References: <20230116124709.793084-1-eric.auger@redhat.com>
 <Y8qzOKm6kvhGWG1T@myrica>
 <4fead092-1058-198a-b430-3dee0fffcd51@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fead092-1058-198a-b430-3dee0fffcd51@arm.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32a.google.com
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

On Fri, Jan 20, 2023 at 03:50:18PM +0000, Robin Murphy wrote:
> On 2023-01-20 15:28, Jean-Philippe Brucker wrote:
> 
> For some reason this came through as blank mail with a text attachment,

Ugh sorry about that, looks like I hit ^D in mutt before sending

> so apologies for the lack of quoting, but for reference this is a
> long-standing known issue:
> 
> https://lore.kernel.org/linux-iommu/9625faf4-48ef-2dd3-d82f-931d9cf26976@huawei.com/
> 
> In summary, yes, hanging {of,acpi}_iommu_configure() off driver probe is
> massively wrong, and pulling that step into iommu_probe_device() in a sane
> and robust manner is one of the next things to start on after getting the
> bus ops out of the way.

Right, thanks for confirming

Thanks,
Jean

