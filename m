Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5430702DEA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:19:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXsb-0000OX-N4; Mon, 15 May 2023 09:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pyXrZ-0005G2-41
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:44 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pyXrV-0001BE-RC
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:40 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f2548256d0so350545e9.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 06:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684155814; x=1686747814;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NTzqxTQdnu4aIMicGFTrnGmIbIuidHOgsEgrDr+sZI8=;
 b=OKmZh8ef+YxnxgU922+PycX6rRHurbtaonwghxIOCnl08M0hVfOVAtkIwzV+Is4QJp
 AYsT2KzyldF5P+gjHLk/0pd6Kdn2Iuw/9LKHNUGTnqORNvk1RhILo5OWBTc/zWP7EuoX
 sc8Jkx+q1rdNPo3apXqYsz3OOb7plIvMsBL4exzWEf8fP++pRBxuQeIXXKap76L8a8Tr
 Vxs+WUOkw8ikmRlDja4C/IfJqswqbCCMonMJnNajo9+QaaJXiKqVHWEH88YTU8V60PoI
 2j2+CLhOzftYgXcaT6WcgsfKkM4xqbXEYAnTIYevJABrrmtWQfDWh0JZwhXeNhwF+gpf
 Zy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684155814; x=1686747814;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NTzqxTQdnu4aIMicGFTrnGmIbIuidHOgsEgrDr+sZI8=;
 b=FG1WxDXHuGB6IIIupMutqbI0QnDJWfCIA+AHBEOTCFPJJy5GrxaskBkTbNacRfFQno
 MkKB7rTtsqXbX7MU3VSdTRelfR66ivXhralO0Mbgaf+fGpZ3TfsJ+pMx77QmNxeVks3T
 b8/WAPUOk2VJFrRV70b7d60qWp7ecH1RnZxcUfL99wNqnZlcDzn7xKNc+lb09vqVGnrp
 K1s+Y2h/iWUMtW3v9pDjjory0lkH6tEO5wDpopRbzaGDNeXGY4ImCOjJ1vaE+manElWP
 +yA05MfAFjJNbG8FWFYDEs/JWb2LiS+nJeiHHcl8O5Oc8Gj6VfXUlZ9rESZO7FroI04U
 Swhw==
X-Gm-Message-State: AC+VfDx5HerLTckBzAWgiiNb/G8qKXKnWVsw4a+kfBjKv4MpfdnqIjmf
 9uj7iuhiKIdq/uLck0X1HBdoYmfsFoiH5AvO7oEZdQ==
X-Google-Smtp-Source: ACHHUZ7uDu1Cc4jYrM4vUzuzOjO7n+sDhPhlM9CLeHSmfLnH0Adr2J8PefIF/wuuc84WWMTEiT7ZLA==
X-Received: by 2002:a05:600c:3d93:b0:3f1:758c:dd23 with SMTP id
 bi19-20020a05600c3d9300b003f1758cdd23mr788223wmb.7.1684155814202; 
 Mon, 15 May 2023 06:03:34 -0700 (PDT)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 c17-20020a5d4f11000000b003079986fd71sm23402210wru.88.2023.05.15.06.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 06:03:33 -0700 (PDT)
Date: Mon, 15 May 2023 13:03:29 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [RFC PATCH v3 00/10] Add stage-2 translation for SMMUv3
Message-ID: <ZGItoVA+K8N92SaR@google.com>
References: <20230401104953.1325983-1-smostafa@google.com>
 <CAFEAcA8=sOzRW9QZqrpsLZh6q_erXmj2xfazfKrgg_ESR8Fy9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8=sOzRW9QZqrpsLZh6q_erXmj2xfazfKrgg_ESR8Fy9Q@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=smostafa@google.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
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

Hi Peter,

On Fri, May 12, 2023 at 03:46:43PM +0100, Peter Maydell wrote:
> 
> Mostafa: is there anything in particular here that means this
> patchset should stay an RFC and isn't ready to go into the tree?
No, I believe the series is in a good shape now.
I will remove RFC when sending v4, if Eric has not major findings.

Thanks,
Mostafa

