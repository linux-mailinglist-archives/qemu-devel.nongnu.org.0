Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944D969968B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:01:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSep7-0004n0-Ey; Thu, 16 Feb 2023 09:01:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSep4-0004cG-RC
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:01:18 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSep3-0003Ea-5G
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:01:18 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso1720441wms.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jBtUNnX1GENvx9SCrPHKpHN+rPvOGE2/lvcOESUiwG8=;
 b=i2T0A1FY5ZJysyzZchnUQGeODHTMmT8ztmuG3tAuJru51EIwMz0T+8raSds1i5k5My
 rvT0SCW2DnlaITcDm3avSHxCXNft68IusH5rDqPbRwPFarZO8ZmOzAT5XR+XP0LqXxzH
 I5nBwOV7g4QNUblyIn+pz1ksNeZM9hSJnoHz5nE4tRoD1OF1juBBqQL1DrDvmMLdp/S0
 2lCNStly5zFJMUXeVjDpGYBUbfOUI7swdnKXOd938Yu3uOpAZcAmrEU3nS5QAlZqcfv8
 OYTpGEiyDrN2W9BIu4t+nsjNjn9Ao4oj7CZuTGG7vePsiAi4MX0PmK8ZIF26U8HXnJOA
 b71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jBtUNnX1GENvx9SCrPHKpHN+rPvOGE2/lvcOESUiwG8=;
 b=WifxlVN/HDqqT2kOncwTh2JODlkFrS9kVjlY4eA9WzCk+A7cojfvDI67yVaZ7LgCtO
 BwRgVjdajKauacGxqlUQ0gQRer5tsV2czos+H3f9viifFpomLUzKyl8FxSufCucCbKkI
 Cjii+kbg1GGQczcL8FoL6XVTkmuO1jjSUdX13kSoR0sTVOAr5CB0A8PJra2CNiy7DpGq
 DqNhS5pSPNA1jq4sc75DXEhTeOfCri4Wk2usQv7X7qPN7WMSG1hmtH+5zit0rZRDP9Sm
 BHKwvwLbbrO6fYJkjbRF04wlfXtJCnqukVW9SIqy9hgGgFUS17WueSyyTMOKp1QlWxUe
 GNHA==
X-Gm-Message-State: AO0yUKUcHcq1it7g18oqiAhYV4e5lLBHkpXKzdUIqt9SFFnmgUHadU8o
 XBBTi8TV/BXtq63WXoB7ZLeNCQ==
X-Google-Smtp-Source: AK7set/0d4sBwADvNC+1H6So5WjjxJJLmFZKup2imfDRJl6DTV0utR11yfP4ELv0pXTnSMq3ssAJAQ==
X-Received: by 2002:a05:600c:556f:b0:3de:b7ba:f8ce with SMTP id
 ja15-20020a05600c556f00b003deb7baf8cemr174589wmb.1.1676556069595; 
 Thu, 16 Feb 2023 06:01:09 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 g9-20020adff3c9000000b002c54d8b89efsm1678290wrp.26.2023.02.16.06.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 06:01:09 -0800 (PST)
Date: Thu, 16 Feb 2023 14:01:04 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 15/16] hw/arm/smmuv3: Add fault configuration for
 stage-2
Message-ID: <Y+43IHck9kcfWeUS@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-16-smostafa@google.com>
 <7300b312-d58b-fdab-a72e-6ee9d0a1aa95@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7300b312-d58b-fdab-a72e-6ee9d0a1aa95@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=smostafa@google.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Wed, Feb 15, 2023 at 07:55:27PM +0100, Eric Auger wrote:
> > record_faults. However when nested translation is supported we would
> > need to separate stage-1 and stage-2 faults.
> same here, please squash that code in the STE decoding and possible add
> those above comments in the commit msg
I will update it in V2.

Thanks,
Mostafa

