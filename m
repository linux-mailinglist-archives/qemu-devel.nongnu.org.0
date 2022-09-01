Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C695A9B34
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 17:07:36 +0200 (CEST)
Received: from localhost ([::1]:39402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTln5-0001ff-QZ
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 11:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTlh9-0005fS-7G
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 11:01:27 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTlh5-0003bm-1I
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 11:01:26 -0400
Received: by mail-wr1-x42d.google.com with SMTP id k9so22781011wri.0
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 08:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=OgCHwfXoVgRL+SmzB8hEajq34UrKRayOSy2P3ivNm28=;
 b=aiEvYoIwReHj3+E7PHR2ZBqGYv5fmz6674WH8keK5PsfRAJvzAcmJlCcfX2JwXJaJ/
 M4f5nn8Hnya0008c2HhhwJX+0xv6FodsqNq93pwRdA9oYpGgJ3lJhCXQySgBmEn2kzv1
 /glYFrovjjAXG/K6dbLYgGMZvaYMlG71hPe+RKJf9RLzky5BhE+pTRy4+riSglhFim8b
 GvUsQBPF2jj06IHKt1rpaX3zza0dq6anDmMochz213k0Uccf0KEcXL4snZfuaukIWLc/
 r4UohYE3vjHhsWXUKFx3zjcA1yniStTYilgjnbjtJZPLjDlO4fiTPl8mX9hJvBarNRYt
 pnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=OgCHwfXoVgRL+SmzB8hEajq34UrKRayOSy2P3ivNm28=;
 b=ezqVMAuP1SMSsuPv2URxTRMH0hluqF4mCdVyZ3Kt8FIRRAcO+mg3znYU7RqhNPS4p9
 tvoi6svECfsGhfvVD7c4/5sIsIuizJvP5KZDbMhQk+NqFd+c9w8wxZjUybEu7U1Mp8z0
 F0tEPt5niZK0xbYOsVxwNO35bHwCsm11u092vYYmKn4fhe7oNgQhj9A8w9zMhX1Gd36f
 tZNIsgHuSplCtMJc7mio5xtsf6Ka7fLGnr8Ywjn3JS6W0Fa/dKKl25BUbRLZcJoEp/i4
 8CeDM2NXunRG85cGWlATYrnH4QyVlzvPO5S7itGyyoNolRWYai8hHWNtqVCUQ6Whti/r
 Il+Q==
X-Gm-Message-State: ACgBeo2y72h8ZCPXPY6cVBn3ju+uvQXSsneAT2U19bq0EOkRERywY08q
 NnKVI4SNzCeUht94zQBPVTB0Tyn+NVAW+W5R
X-Google-Smtp-Source: AA6agR4GpP67bhmXNDoetK8RxVr5Up0vRTth1xl5PxiBAiH5YeyakBKcSGV3xh5Dnai5Buw+J0bing==
X-Received: by 2002:adf:e74d:0:b0:226:d514:8c29 with SMTP id
 c13-20020adfe74d000000b00226d5148c29mr12930651wrn.664.1662044481355; 
 Thu, 01 Sep 2022 08:01:21 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c0a0700b003a5c1e916c8sm14148840wmp.1.2022.09.01.08.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 08:01:21 -0700 (PDT)
Date: Thu, 1 Sep 2022 16:01:18 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com
Subject: Re: [PATCH 09/10] hw/arm/virt: Fix devicetree warnings about the
 SMMU node
Message-ID: <YxDJPlKkCjxxRC2q@myrica>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-10-jean-philippe@linaro.org>
 <CAFEAcA96dPtH2tAotFCdkR1CzZHU6bAnNyUXqKUrNh++5Ecd+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA96dPtH2tAotFCdkR1CzZHU6bAnNyUXqKUrNh++5Ecd+Q@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 24, 2022 at 08:45:05PM +0100, Peter Maydell wrote:
> On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > dt-validate reports three issues in the SMMU device-tree node:
> >
> >   smmuv3@9050000: $nodename:0: 'smmuv3@9050000' does not match '^iommu@[0-9a-f]*'
> >   smmuv3@9050000: interrupt-names: 'oneOf' conditional failed, one must be fixed:
> >         ['eventq', 'priq', 'cmdq-sync', 'gerror'] is too long
> >         'combined' was expected
> >         'gerror' was expected
> >         'gerror' is not one of ['cmdq-sync', 'priq']
> >   smmuv3@9050000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> >   From schema: linux/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> >
> > Fix them by:
> > * changing the node name
> > * reordering the IRQs
> > * removing the clock properties which are not expected for the SMMU node
> 
> Why does dt-validate insist on a fixed interrupt order here?

I think the binding can be relaxed, since the driver must always look at
interrupt-names and can't assume a specific order (given that all except
gerror are now optional).

Thanks,
Jean

