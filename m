Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7056641F170
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:45:36 +0200 (CEST)
Received: from localhost ([::1]:60006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKj9-0006jg-Fr
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWKb0-0003cZ-L3
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:37:10 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWKay-0001tV-38
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:37:10 -0400
Received: by mail-wr1-x429.google.com with SMTP id h15so14509611wrc.3
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 08:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cQCevr38VkmvxBMkIKgm/Oi7Yl74szXWqySQ1f/yrkc=;
 b=BaafzbZ6I+HJ+URLrx4Nl2GZ27APtH/dzq8B2NBVdtsBAVOYc5WvXuuR7qX2dnjFlm
 yMf3DgytkaB9gcdhnwUxMecnqKqGlnNMtLsaiWU3mGzWQJQrjcKhre8wm/Qfgwf0Radj
 mAuO5Ix/PP8QBMryFxU1KsSWCibmhfzg+tcL6cdNxAYwjrmZQonLk323t+uEr3Vot1Vs
 KQwknW2WL803d/Qp5u02otYwM2E2XrrG5etRdLCMQAQ0ceu42BHp4oY75hFupSJGYAjM
 +J2uZDtykLrHubcB4/aDqARL8Yo7R9b0SzPBpQSklmXc+0w7Y+sNhdpScb4HKAT2Yb62
 7NBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cQCevr38VkmvxBMkIKgm/Oi7Yl74szXWqySQ1f/yrkc=;
 b=TWvPL8iygeco5xuFDqHa1pVRx9SMtkDLK6i3BYQxQsn4raWn2V5yd+uxqpqtRPJSe2
 bub5z7Vcl+ga82jgjL+Y92elHhEqPICpRdo8qYioSwx6DsFu4A+GxlNriiVGnSq7BiBL
 Lgx355Z2PBHGrTpAgRdhs65GxLIbfk6ua0BNcC8G6v0k9Ji6btA+Ovla7Z3yf8SkQ8v/
 xFc9SdLDP4H+xt1NlOs/Oo641UpAAOZnx5SmndhmPx+X/YOqM7KdSdXbIavbItkbbYFk
 XiPMZDDIvO0k2xHbF8yS0d6zA3lEkw+9B+uVOn7ENh3HBBWJcRy1vmbBrMA3cwpsXgfX
 hpXg==
X-Gm-Message-State: AOAM531nbt5AqVGc2xvX/yUtX2et9kGUeB5juUfL7MnG4l9MopBvtX/n
 x5Tn60FTsnn/4WcClV395VyOZg==
X-Google-Smtp-Source: ABdhPJx9VjIJct2Pq/VJZonx9ZQP1a7zeB8/3Q4auUZdZzI/SrzUAxJ8X+stGml/oHEZY4tqTR25TA==
X-Received: by 2002:a5d:6b89:: with SMTP id n9mr12917211wrx.372.1633102626321; 
 Fri, 01 Oct 2021 08:37:06 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id z12sm7626010wmf.21.2021.10.01.08.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 08:37:05 -0700 (PDT)
Date: Fri, 1 Oct 2021 16:36:44 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 05/10] pc: Allow instantiating a virtio-iommu device
Message-ID: <YVcrDI3hOMsRUP1y@myrica>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
 <20210914142004.2433568-6-jean-philippe@linaro.org>
 <20210920102440.1eea4f46@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920102440.1eea4f46@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 20, 2021 at 10:24:40AM +0200, Igor Mammedov wrote:
> > +    if (pcms->virtio_iommu && x86_iommu_get_default()) {
> > +        error_report("QEMU does not support multiple vIOMMUs for x86 yet.");
> > +        exit(EXIT_FAILURE);
> > +    }
> 
> previous patch does similar check, doesn't it?
> So is why it's not implement the same way?

The existing check for Intel and AMD IOMMUs is in x86_iommu_set_default(),
but virtio-iommu isn't an X86IOMMUState (because it already inherits
virtio object, and because X86IOMMUState is used for IRQ remapping which
isn't supported by virtio-iommu).

I'll move the check from X86IOMMUState into pre_plug to avoid the
duplication.

Thanks,
Jean


