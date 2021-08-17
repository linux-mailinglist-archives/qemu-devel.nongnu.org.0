Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 459953EF02C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 18:30:01 +0200 (CEST)
Received: from localhost ([::1]:46684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG1yS-0007X7-AN
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 12:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mG1wr-0006K1-CE
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 12:28:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mG1wp-00080W-KF
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 12:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629217698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aX9fYUp8Bnps3b3KLSGFLkJzQmdpPbyDeYWUQoEFU6c=;
 b=ajar0NvIhvr+1nEIcVkGFXWteWWOS7YFT/FvjwEXuVFDnZk6p1PIZYLgfAz+4EEKsJXbwS
 4O8b4IP8fo81awNcaw8wgprnFJsfKaSjIrOxb772MYaVJ/bcz4h9DfkTDbbF7wHQSUvdCg
 ++g++QkL0uyX2y5nQ7kdb97mPzj67R4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-AOnL0Qc-NXePrAk5X-j2ow-1; Tue, 17 Aug 2021 12:28:15 -0400
X-MC-Unique: AOnL0Qc-NXePrAk5X-j2ow-1
Received: by mail-ej1-f71.google.com with SMTP id
 s11-20020a170906060b00b005be824f15daso1673215ejb.2
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 09:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aX9fYUp8Bnps3b3KLSGFLkJzQmdpPbyDeYWUQoEFU6c=;
 b=SpvoyTc2xhUNu2m2ThoeO4trw5OymD0IZSllmMmlZ4XgMIMv/UWmKsmDmttDNO2uFq
 3Ie4jVTg3jJPwYrSFB2v5qbG13AgxlTNSAQoVahTzARVXg+fYm3o7zaEcDBqhsj39ywQ
 CFH4Z6BRxdJgzrjcS0OUrvjJ57gTHUbm9kzX08jO90LDe9e0fmBndwP7CvbJWidLLhN5
 V9ECYuvgAX+afX38Iycsf0iWEDqHpB80Q8xhHiYC9gWoTtUY/0gx1pimLoT2+8Wn2Juo
 LXTK8Vw48pumQSfEhkzVDsb7tWe8JECTWMBD55HDt5xC/pn0IUCY+cjVBZ3A7UY772dP
 BX4Q==
X-Gm-Message-State: AOAM530fPh8BtP+p3bOxQm/ZYkMMPM5s7/+OvS2qWdN2R9BytWvMdMmM
 Fpi2T2HQwsb3V3ibG5mqxzZrXuLKc2B4ThWAO0IGuO8nwmDfcC5VrSFPUxWos8Nx/gt9XrzsWsu
 FsWbF2qrQJnuptkQ=
X-Received: by 2002:aa7:de98:: with SMTP id j24mr5130718edv.139.1629217694020; 
 Tue, 17 Aug 2021 09:28:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQmwG0i0QKnELomNfTCgrckzEGnPfpJ3PE6yG4M7RZIjgDtwBR3LsgH170Pn3fDuU5ZjUxiA==
X-Received: by 2002:aa7:de98:: with SMTP id j24mr5130699edv.139.1629217693825; 
 Tue, 17 Aug 2021 09:28:13 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id d16sm1300380edu.8.2021.08.17.09.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 09:28:13 -0700 (PDT)
Date: Tue, 17 Aug 2021 18:28:11 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
Message-ID: <20210817162811.u3i5hcx7eg52akyq@gator.home>
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
 <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
 <20210812091650.i5np3szvdoelu2cx@gator.home>
 <20210812092517.mwcfhksoe4cgy3cl@gator.home>
 <TYCPR01MB6160B0A6E08CAE7CB2C6D8F0E9FE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <20210817115635.d2wxvnvis5kupegh@gator.home>
 <667f9384-cd28-8e4d-ebd1-4ed4b651676a@linaro.org>
 <20210817153639.o5fxdgmuhjusvyhq@gator.home>
 <3846b738-719f-a9a1-a59d-d7f54e71009c@linaro.org>
MIME-Version: 1.0
In-Reply-To: <3846b738-719f-a9a1-a59d-d7f54e71009c@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 17, 2021 at 05:53:34AM -1000, Richard Henderson wrote:
> On 8/17/21 5:36 AM, Andrew Jones wrote:
> > On Tue, Aug 17, 2021 at 05:23:17AM -1000, Richard Henderson wrote:
> > > On 8/17/21 1:56 AM, Andrew Jones wrote:
> > > > I guess it's fine. You could easily create a new cpu_arm_set_sve_vq()
> > > > which would forbid changing the properties if you wanted to, but then
> > > > we need to answer Peter's question in order to see if there's a
> > > > precedent for that type of property.
> > > 
> > > I don't see the point in read-only properties.  If the user wants to set
> > > non-standard values on the command-line, let them.  What is most important
> > > is getting the correct default from '-cpu a64fx'.
> > > 
> > 
> > So maybe we should just go ahead and add all sve* properties, but then
> > make sure the default vq map is correct.
> 
> I think that's the right answer.
> 
> Presently we have a kvm_supported variable that's initialized by
> kvm_arm_sve_get_vls().  I think we want to rename that variable and provide
> a version of that function for tcg. Probably we should have done that
> before, with a trivial function for -cpu max to set all bits.
> 
> Then eliminate most of the other kvm_enabled() checks in
> arm_cpu_sve_finalize.  I think the only one we keep is the last, where we
> verify that the final sve_vq_map matches kvm_enabled exactly, modulo max_vq.
> 
> This should minimize the differences in behaviour between tcg and kvm.

That's a good idea. I'll send a patch with your suggested-by.

Thanks,
drew


