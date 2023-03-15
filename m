Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE25C6BBBA1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 19:02:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcVRw-0000Sz-FZ; Wed, 15 Mar 2023 14:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pcVRn-0000SN-NY
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 14:02:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pcVRl-0004ol-U5
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 14:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678903316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y2OQKstCmCVECcLjd3IPd4p2CkK2nEygG3dyFL8S3YM=;
 b=P0rOjsoehH89W9fUGTP5ILyaIBebwLG8bvVR1NtMhEN1JCycZfU2+Y+rgs99S7eAeUJcjK
 Jz3um7YbcaYC3OoC3dcRnmrNhSLZfU1jfW+J2XKCO5+MdM/BE+avt+nTkgLBBMgAZPSNl4
 wYGqXhr+vvOQADGFzK+/Rx/UBYS/33s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-L60DB7zkNWq-yrYcm_JEvQ-1; Wed, 15 Mar 2023 14:01:54 -0400
X-MC-Unique: L60DB7zkNWq-yrYcm_JEvQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 j36-20020a05600c1c2400b003ed245a452fso3623413wms.3
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 11:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678903309;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y2OQKstCmCVECcLjd3IPd4p2CkK2nEygG3dyFL8S3YM=;
 b=aFdxUzgZtxkornOXzwgY36avHskz7CRPn5mKhpNY1mZM97vi7TlFt6kVhbiSvHxvMN
 Sf9xtjYGmIQHKNmT/jyjZmTzai4q4WYVoGgJMEwljU9gRHh7L47pbNi4vbVQsl2k07Rg
 eXFRgJvpkrNJvzDykhgPDpPJFbncdKe+ws+sptNDQp2gjMqF8+kqIwVOfJYmHZVUwjkS
 oMLYTJhBJdyvVIK4ABHdRBX99HobbKptPhYLp+2WDLdorSb9adW2BL3fXblYMk0aguly
 MKpRu/7pcSHkGMwHL0dXVTfV8E4TnC2t35xX9CtY7zcRWXy1sNJ0vaGJ35JqzhniTkPa
 8fbQ==
X-Gm-Message-State: AO0yUKXoSck5AFfQBi2aP8wZ8u5pLGgsktzVv0ps4rb+UZP5lHxSRhpU
 qPtXBT0eUJQ3T1sLU3jbXzT4mSfrmwuXn5uZ9ExlbT376QvmXCn5CCQfso0VY69e1jpkRdqgZT+
 HcaLsLCBkcNzcpV4=
X-Received: by 2002:a05:600c:ccf:b0:3eb:36fa:b78d with SMTP id
 fk15-20020a05600c0ccf00b003eb36fab78dmr19045534wmb.23.1678903309203; 
 Wed, 15 Mar 2023 11:01:49 -0700 (PDT)
X-Google-Smtp-Source: AK7set8LHjwgpMj8XO2x2iBEWQhcUm/YiWFFTUJixHYUHyVncoJjsI+hMufoqyRc7ghNR8ySTImInA==
X-Received: by 2002:a05:600c:ccf:b0:3eb:36fa:b78d with SMTP id
 fk15-20020a05600c0ccf00b003eb36fab78dmr19045510wmb.23.1678903308910; 
 Wed, 15 Mar 2023 11:01:48 -0700 (PDT)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b003e204fdb160sm2908206wmq.3.2023.03.15.11.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 11:01:47 -0700 (PDT)
Date: Wed, 15 Mar 2023 18:01:45 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, bcain@quicinc.com,
 ling1.xu@intel.com, zhou.zhao@intel.com, jun.i.jin@intel.com
Subject: Re: [PATCH RESEND v2 1/2] migration/xbzrle: use ctz64 to avoid
 undefined result
Message-ID: <ZBIICT06hzn+2gp/@work-vm>
References: <cover.1678733663.git.quic_mathbern@quicinc.com>
 <117f3c2fdc17c319b0e04014bbd7e0c94992c197.1678733663.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <117f3c2fdc17c319b0e04014bbd7e0c94992c197.1678733663.git.quic_mathbern@quicinc.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

* Matheus Tavares Bernardino (quic_mathbern@quicinc.com) wrote:
> __builtin_ctzll() produces undefined results when the argument is 0.
> This can be seen through test-xbzrle, which produces the following
> warning:
> 
> ../migration/xbzrle.c:265: runtime error: passing zero to ctz(), which is not a valid argument
> 
> Replace __builtin_ctzll() with our ctz64() wrapper which properly
> handles 0.
> 
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/xbzrle.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/xbzrle.c b/migration/xbzrle.c
> index 05366e86c0..21b92d4eae 100644
> --- a/migration/xbzrle.c
> +++ b/migration/xbzrle.c
> @@ -12,6 +12,7 @@
>   */
>  #include "qemu/osdep.h"
>  #include "qemu/cutils.h"
> +#include "qemu/host-utils.h"
>  #include "xbzrle.h"
>  
>  /*
> @@ -233,7 +234,7 @@ int xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int slen,
>                      break;
>                  }
>                  never_same = false;
> -                num = __builtin_ctzll(~comp);
> +                num = ctz64(~comp);
>                  num = (num < bytes_to_check) ? num : bytes_to_check;
>                  zrun_len += num;
>                  bytes_to_check -= num;
> @@ -262,7 +263,7 @@ int xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int slen,
>                  nzrun_len += 64;
>                  break;
>              }
> -            num = __builtin_ctzll(comp);
> +            num = ctz64(comp);
>              num = (num < bytes_to_check) ? num : bytes_to_check;
>              nzrun_len += num;
>              bytes_to_check -= num;
> -- 
> 2.39.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


