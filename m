Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCB25112B9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 09:42:34 +0200 (CEST)
Received: from localhost ([::1]:43748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njcJk-0006OH-Px
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 03:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1njcGD-0004Ch-8A
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 03:38:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1njcG9-0006RQ-Ma
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 03:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651045128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z9VFu90egQTb/MajldrWcq2sIp2eXMkNbLEeiOxBW9M=;
 b=GSRd+j3+9e8xsSmr1KRPpdCI9ecgO5bRZdTMYyhm3oppft7+R06awTw8SKTn/ijhO7a7CR
 yBZCgccwuPMUMjB/DjIbdY4mXAneuWGRAu9wKxqAbDflS4E3e6z3ttcQfbNGwQkihQYz69
 9H/4vAanE1Cq+G7U8g8MfpWjif9CN64=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-X_BSbUfoOcyGFsQqVwuznw-1; Wed, 27 Apr 2022 03:38:47 -0400
X-MC-Unique: X_BSbUfoOcyGFsQqVwuznw-1
Received: by mail-ej1-f72.google.com with SMTP id
 sc26-20020a1709078a1a00b006effb6a81b9so657399ejc.6
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 00:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z9VFu90egQTb/MajldrWcq2sIp2eXMkNbLEeiOxBW9M=;
 b=UWnox5bMySZOUF72Y/dgoD7pVMsPj7N/8LGGOex5D0Fe8DLGp8jH8+O3fZGTIrJDQN
 UnmKc4ZJEJ4EiwbgFxWdn0/yhtf5WxZ59e9QAoeUIqF6ITC16+3y+30cZwNMjFkTdqyy
 11oPbpFYCbJ+2vYkHFQW05oBBQRz5dqZHx0/JQPvBaqyWXkyaJdXrJ/0SK6jMJv3JbFX
 OZ9JIeWkjAn0gBCrtGz8rnOU4/YdRiEjd0yhR1idr71getGBPyHDiYeWCCXqYGl1Lfzd
 5mmrNmj62BQ0hNVZMqxJe4dGji2U9RqfDW8kCdwKorKqq3PJrTSaj292Lk3h7cX+WJwU
 vblQ==
X-Gm-Message-State: AOAM531qPZd+WUmU6ouSn63qqRFE4a6g/jdpRoWJaPd74GvdRnwgMPGP
 qQ64BkRBSrBuSMNaGkI9ggodzBdAHvsgyWCd1tpkSICqTY8L6bAKP59Pvpd7j/Ps+7xkJNjbvRH
 aPYSgytxYr7y1ibA=
X-Received: by 2002:aa7:c0c4:0:b0:425:c776:6f17 with SMTP id
 j4-20020aa7c0c4000000b00425c7766f17mr23634482edp.131.1651045125865; 
 Wed, 27 Apr 2022 00:38:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLjNVbBEvhhTuimLdahiMe8Ydt2NNmcoQDACwe7ZrohS2hH98hjg3O7L/6W5LrfoXFL9fRHg==
X-Received: by 2002:aa7:c0c4:0:b0:425:c776:6f17 with SMTP id
 j4-20020aa7c0c4000000b00425c7766f17mr23634460edp.131.1651045125664; 
 Wed, 27 Apr 2022 00:38:45 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a056402019000b00418ed60c332sm7746706edv.65.2022.04.27.00.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 00:38:45 -0700 (PDT)
Date: Wed, 27 Apr 2022 09:38:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Subject: Re: [PATCH 2/2] acpi/nvdimm: Fix aml_or() and aml_and() in if clause
Message-ID: <20220427093844.02e62581@redhat.com>
In-Reply-To: <20220412065753.3216538-3-robert.hu@linux.intel.com>
References: <20220412065753.3216538-1-robert.hu@linux.intel.com>
 <20220412065753.3216538-3-robert.hu@linux.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, jingqi.liu@intel.com,
 qemu-devel@nongnu.org, ani@anisinha.ca, robert.hu@intel.com,
 dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Apr 2022 14:57:53 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> It should be some typo originally, where in If condition, using bitwise
> and/or, rather than logical and/or.
> 
> The resulting change in AML code:
> 
> If (((Local6 == Zero) | (Arg0 != Local0)))
> ==>  
> If (((Local6 == Zero) || (Arg0 != Local0)))
> 
> If (((ObjectType (Arg3) == 0x04) & (SizeOf (Arg3) == One)))
> ==>  
> If (((ObjectType (Arg3) == 0x04) && (SizeOf (Arg3) == One)))
> 
> Fixes: 90623ebf603 ("nvdimm acpi: check UUID")
> Fixes: 4568c948066 ("nvdimm acpi: save arg3 of _DSM method")
> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/nvdimm.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index 7cc419401b..2cd26bb9e9 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -1040,7 +1040,7 @@ static void nvdimm_build_common_dsm(Aml *dev,
>  
>      uuid_invalid = aml_lnot(aml_equal(uuid, expected_uuid));
>  
> -    unsupport = aml_if(aml_or(unpatched, uuid_invalid, NULL));
> +    unsupport = aml_if(aml_lor(unpatched, uuid_invalid));
>  
>      /*
>       * function 0 is called to inquire what functions are supported by
> @@ -1072,10 +1072,9 @@ static void nvdimm_build_common_dsm(Aml *dev,
>       * in the DSM Spec.
>       */
>      pckg = aml_arg(3);
> -    ifctx = aml_if(aml_and(aml_equal(aml_object_type(pckg),
> +    ifctx = aml_if(aml_land(aml_equal(aml_object_type(pckg),
>                     aml_int(4 /* Package */)) /* It is a Package? */,
> -                   aml_equal(aml_sizeof(pckg), aml_int(1)) /* 1 element? */,
> -                   NULL));
> +                   aml_equal(aml_sizeof(pckg), aml_int(1)) /* 1 element? */));
>  
>      pckg_index = aml_local(2);
>      pckg_buf = aml_local(3);


