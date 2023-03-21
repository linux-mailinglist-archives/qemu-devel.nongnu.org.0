Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC2D6C32E6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:31:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pec3u-0004oO-Bu; Tue, 21 Mar 2023 09:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pec3r-0004ni-Sp
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:29:59 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pec3q-0003lH-BK
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:29:59 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3ed5cf9a455so19625e9.1
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679405396;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YKZcvo0rAxoflS0zB/bDfzj3Ox4C+TAGMHSorX8UkyA=;
 b=LgAvraKtMaJopQXtd2DoamtnMv4NpuZ+nZYodWmtWQZgk3aYW0Ejv/ruStegkT0pAg
 E3HXflvK6gnGW29/FpURWg58LaCs+47I2rdtaG53J9bD935FckLeugXo/QnlEKaF3iMm
 3pcnVsYOqt6k9HOVsVRMqscKiT7FT1JoF0rwdCxdVF2Ax3x18nMBiCh9vHhDlyP0zGPG
 wPidXvGXIO77NQRenI+Rew6cNnbKVJYjtcSTsgJhY1KLDqy6NWz1uYgXTdmfE6TGMG4s
 egHd6kfALHzIretHimX+6eLjW8Ib93Q7QbDZXWTO3yXwVvLUxRfxrXc2WfzkEVdI30j1
 DhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679405396;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YKZcvo0rAxoflS0zB/bDfzj3Ox4C+TAGMHSorX8UkyA=;
 b=za8k1Mn40lrvJnXK9b7oZwcXFoLGs7s5mq40FX60ZcTwgtpO61On74tnOoDbIXUAaU
 l/KcAn53VR+vyD0RAfeTXnSm2geFKq5NMxhrNoeD0x6eR6lsSf38+/+XxUNJhjTFL4y3
 NZ0tFpEdhmIf7y2Gjtsg9haPPqENnWEGXyVAzgojnesKh0BkvPsQDgCk1v8TVRFJx7P/
 IdUBPRg8K970R5GXLjm4kVFSuD2UJqx/gj1TdpbseLyiv/SSENHnWVa7KU++VcW2DY7W
 k0GyOh4K3W0uxB0+j58NzEbpw6ap6YGpVQzJxdP4d97B9CxEAtBED02KxQ3MMxAItnU7
 NEfA==
X-Gm-Message-State: AO0yUKUgQ4yDZDFXINYB9XmYBpR1Iz56lQnKAilGJUjE4WJ7JwCB+/mC
 58RpU/RLf8Okq6S1ayesjq3rzw==
X-Google-Smtp-Source: AK7set/c8MzX1sJV9nJdkxM+59865J/pfyIxThAuPWg7gVdWHzJPiWXIXF+W8tYj843ExOx+lX8gwg==
X-Received: by 2002:a05:600c:4694:b0:3e2:1a5e:b13c with SMTP id
 p20-20020a05600c469400b003e21a5eb13cmr192851wmo.2.1679405396701; 
 Tue, 21 Mar 2023 06:29:56 -0700 (PDT)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 ay40-20020a05600c1e2800b003ebf73acf9asm2316961wmb.3.2023.03.21.06.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 06:29:56 -0700 (PDT)
Date: Tue, 21 Mar 2023 13:29:52 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [RFC PATCH v2 10/11] hw/arm/smmuv3: Populate OAS based on CPU
 PARANGE
Message-ID: <ZBmxUISDGh8rRJKD@google.com>
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-11-smostafa@google.com>
 <6e6810c3-c01a-5a2f-4fed-64c9391e22ba@redhat.com>
 <ZBmruj7OME3Pfbh1@google.com>
 <d2e9d8d5-1cf6-67fe-e780-41038fcaa376@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2e9d8d5-1cf6-67fe-e780-41038fcaa376@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32e.google.com
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

On Tue, Mar 21, 2023 at 02:23:03PM +0100, Eric Auger wrote:
> >>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
> >>> -    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
> >>> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, oas);
> >> I am not sure you can change that easily. In case of migration this is
> >> going to change the behavior of the device, no?
> > I see IDR registers are not migrated. I guess we can add them in a
> > subsection and if they were not passed (old instances) we set OAS to
> > 44.
> > Maybe this should be another change outside of this series.
> Indeed tehy are not migrated so it can lead to inconsistent behavior in
> both source and dest. This deserves more analysis to me. In case you
> would decide to migrate IDR regs this would need to be done in that
> series I think. Migration must not be broken by this series

I agree, I meant to drop this patch from the series as it is not
really related to stage-2, and we can have another patch for this +
migration for IDR if needed after doing proper analysis.

Thanks,
Mostafa

