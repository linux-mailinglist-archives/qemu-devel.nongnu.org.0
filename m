Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1725C5863FE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 08:20:56 +0200 (CEST)
Received: from localhost ([::1]:48850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIOnO-00060F-KG
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 02:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oIOiL-0004Hg-Id
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 02:15:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oIOiF-0006Wt-Tn
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 02:15:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659334532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oe7IiUdPVPFqyUYfXIC+ommKA/7qLve8MUKe1h+9Ii4=;
 b=RwsSO+xD8Jri2sPjspyCAgmJJ1KciZdEeCrqHjh6ib6/CAOJgmVW0EMoiLvfLkAXWe/M8u
 jLcU5FATV4Oq32EFMeHmtE72ah4DiGy/YbcJgcoYotSKIM8A84B9bxeaFTRR66//tXRtAB
 fzu7gzWfMhvQBLSm/+pet47bjlwg6tQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-a7Yv-F0NPqyRPulDJNwyBA-1; Mon, 01 Aug 2022 02:15:31 -0400
X-MC-Unique: a7Yv-F0NPqyRPulDJNwyBA-1
Received: by mail-wm1-f72.google.com with SMTP id
 p2-20020a05600c1d8200b003a3262d9c51so7658463wms.6
 for <qemu-devel@nongnu.org>; Sun, 31 Jul 2022 23:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=oe7IiUdPVPFqyUYfXIC+ommKA/7qLve8MUKe1h+9Ii4=;
 b=mNAemSxzpHCFS+6VILWwxQoF1HcTCkUuIFpcJU12L5Jl4KyDs1EPko2vyBy6sx6WhP
 kwcDSRd3TvJNuOrd5b4d1+UwGE7f7xSL5XnVi2Ps1RoAjCGAQ6QeS+LiIrXFLcJ8Ns/X
 I2g+gjYjN3XSmszJGYfpDyH02hUuXr2aK8TGizOXfKezlPD1DtRrzyEQLJMhYP/zWh4u
 Rv6xW+3g2yuALLJlWse5+vPAjPjS9/VIaqXrCcqfGiNnncD6gBWUlsdQ9khbBSXiBR+H
 V1nErNtHE2URhDUMmEghrwfSOQWAUYYCq3DLshboupe088+wuLdS+96O1c2OrWTlMQw5
 PAWQ==
X-Gm-Message-State: ACgBeo2HV+M/foTeIgCBTMwCXqKGCCBvC5YI2DO09mTwTa5zpOc/GHmf
 vhe2WsKJg27afeShf3ia4YT6Ksk8A9H5WFJJ20z0ofnTdhfGiHfoMDywV+THWfCPU9NxoP6yDhM
 qVMprbcsCqb9D/nM=
X-Received: by 2002:a5d:4b8d:0:b0:21f:cf60:c9e6 with SMTP id
 b13-20020a5d4b8d000000b0021fcf60c9e6mr5541506wrt.707.1659334530051; 
 Sun, 31 Jul 2022 23:15:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4sejenYfqjPqGuD0z7Y2277KeNeAbp4lgkBbZarx6nX9VvNjnbGOiSbmL/I41Jk8qw/TZpcg==
X-Received: by 2002:a5d:4b8d:0:b0:21f:cf60:c9e6 with SMTP id
 b13-20020a5d4b8d000000b0021fcf60c9e6mr5541491wrt.707.1659334529849; 
 Sun, 31 Jul 2022 23:15:29 -0700 (PDT)
Received: from redhat.com ([2.52.130.0]) by smtp.gmail.com with ESMTPSA id
 q186-20020a1c43c3000000b003a302fb9df7sm18092985wma.21.2022.07.31.23.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 23:15:29 -0700 (PDT)
Date: Mon, 1 Aug 2022 02:15:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: minyard@acm.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 "M : Marcel Apfelbaum" <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH] ipmi:smbus: Add a check around a memcpy
Message-ID: <20220801021500-mutt-send-email-mst@kernel.org>
References: <20220731230245.1216949-1-minyard@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220731230245.1216949-1-minyard@acm.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Sun, Jul 31, 2022 at 06:02:46PM -0500, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> In one case:
> 
>   memcpy(sid->inmsg + sid->inlen, buf, len);
> 
> if len == 0 then sid->inmsg + sig->inlen can point to one past the inmsg
> array if the array is full.  We have to allow len == 0 due to some
> vagueness in the spec, but we don't have to call memcpy.
> 
> Found by Coverity.  This is not a problem in practice, but the results
> are technically (maybe) undefined.  So make Coverity happy.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Corey Minyard <cminyard@mvista.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/ipmi/smbus_ipmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> I think this should do it.
> 
> diff --git a/hw/ipmi/smbus_ipmi.c b/hw/ipmi/smbus_ipmi.c
> index 9ef9112dd5..d0991ab7f9 100644
> --- a/hw/ipmi/smbus_ipmi.c
> +++ b/hw/ipmi/smbus_ipmi.c
> @@ -281,7 +281,9 @@ static int ipmi_write_data(SMBusDevice *dev, uint8_t *buf, uint8_t len)
>               */
>              send = true;
>          }
> -        memcpy(sid->inmsg + sid->inlen, buf, len);
> +        if (len > 0) {
> +            memcpy(sid->inmsg + sid->inlen, buf, len);
> +        }
>          sid->inlen += len;
>          break;
>      }
> -- 
> 2.25.1


