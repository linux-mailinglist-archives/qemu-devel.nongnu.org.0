Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859706C3320
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:44:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pecGd-0004iP-5K; Tue, 21 Mar 2023 09:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pecGW-0004i5-Ro
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:43:04 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pecGV-0004Jp-1g
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:43:04 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3ed3080d17bso19975e9.0
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679406181;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ALNJ6QnzCc0WDuONE1PqNhGYUbQM9BtvwcxrNEwcJto=;
 b=XbdnJTaHubm/wpqxQD0zN/E1OomChOpqHWhZ9qSsoknwavsCJN/JYEGvwfkfjCKVPl
 Rl/gTUvny4Fz1j9YzN8z4ifCqg2+C4EKPznoX1KnvGbdlyxi5sX+rLVbvqOXrb82UpS0
 2xYl+J7v7IhdGzZe2CPd/Ol0kfV5eMk6cGbqElM0VX1L2xQshLOddJ/NQ66xLIXMCGtu
 cJlFJRLsxODYImls1rZC0NvHYLGF68kqZqdU/GarjvkgPNWtp3kLPQSlhWNylC/Ce0j4
 7G3+pEmkTy2SzA8612FYJyHWSOZHxnbfEHJZyXEtILpTE8+5sv1YBga5gHz2wE8+CZu8
 bSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679406181;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ALNJ6QnzCc0WDuONE1PqNhGYUbQM9BtvwcxrNEwcJto=;
 b=Gnebt2QLzi3kbxP/9xKdiboQLXzmDs02Dqhy5GTmmBp+RYbo/gPCiueAsmPviIxth9
 soiv/RymwRRvKvF3PSINdk8e81G+RyZNSEO9dArseNBn1GWS6GAynm/eQrkjHa1VV+xi
 YJg+UGC0NEVVqPEljN39LvcLntVTVCC6+LkJaN7uNCR8r/z/iuDhjAmKd2v6UMVoziaH
 wBVNOnP8X27hE4E+TekvD/foVlVHoy8Q0n2BfjnsTeBmUDL3n5tcsHzrN/+mLdckg7SW
 9xF0acUxEPo2GpT1Im1uWINm7WOm5pax9no+qLIykBIXQWY6O4rMEljbGJLEvBTAkUeg
 pztA==
X-Gm-Message-State: AO0yUKXUbI7RunX1aRljq5Dq8t6i3gxNFz5I1kc9ApsiCsa/CFzY40+B
 SyfDIMpsTbF58gn1WwARqyV2Mw==
X-Google-Smtp-Source: AK7set+gLxbfZ5rEpaWNzxaQ3WTH7VKTARVma4QxjvBGzJH6HNuen5K3/FhUlIiMNykQLrnym2F9Qg==
X-Received: by 2002:a05:600c:4585:b0:3ee:113f:5832 with SMTP id
 r5-20020a05600c458500b003ee113f5832mr192790wmo.0.1679406181360; 
 Tue, 21 Mar 2023 06:43:01 -0700 (PDT)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 o11-20020adfeacb000000b002cfefad9c1dsm11383301wrn.66.2023.03.21.06.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 06:43:01 -0700 (PDT)
Date: Tue, 21 Mar 2023 13:42:56 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger@redhat.com, qemu-devel@nongnu.org, jean-philippe@linaro.org,
 qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [RFC PATCH v2 10/11] hw/arm/smmuv3: Populate OAS based on CPU
 PARANGE
Message-ID: <ZBm0YP1Mh0XCItYY@google.com>
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-11-smostafa@google.com>
 <6e6810c3-c01a-5a2f-4fed-64c9391e22ba@redhat.com>
 <ZBmruj7OME3Pfbh1@google.com>
 <d2e9d8d5-1cf6-67fe-e780-41038fcaa376@redhat.com>
 <CAFEAcA_NZiby7=DWaDBu7b5Dbo5sXF9N7T-0_wskZ46FR9Esxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_NZiby7=DWaDBu7b5Dbo5sXF9N7T-0_wskZ46FR9Esxw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

Hi Peter,

On Tue, Mar 21, 2023 at 01:34:55PM +0000, Peter Maydell wrote:
> > >>> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, oas);
> > >> I am not sure you can change that easily. In case of migration this is
> > >> going to change the behavior of the device, no?
> > > I see IDR registers are not migrated. I guess we can add them in a
> > > subsection and if they were not passed (old instances) we set OAS to
> > > 44.
> > > Maybe this should be another change outside of this series.
> > Indeed tehy are not migrated so it can lead to inconsistent behavior in
> > both source and dest. This deserves more analysis to me. In case you
> > would decide to migrate IDR regs this would need to be done in that
> > series I think. Migration must not be broken by this series.
> 
> Jumping in here without having read much of the context, but why
> would we need to migrate the ID registers? They are constant, read-only,
> so they will be the same value on both source and destination.

Currently OAS for SMMU is hardcoded to 44 bits, and the SMMU manual says
"OAS reflects the maximum usable PA output from the last stage of
AArch64 translations, and must match the system physical address size.
The OAS is discoverable from SMMU_IDR5.OAS."
This patch implements OAS based on CPU PARANGE, but this would break
migration from old instances that ran with 44 bits OAS to new code that
configures it based on the current CPU.
So one idea is to migrate the IDRs (or atleast IDR5).
Maybe that is not the best solution, we just need a way to know if the
old instance needs to be 44 bits or not.


Thanks,
Mostafa

