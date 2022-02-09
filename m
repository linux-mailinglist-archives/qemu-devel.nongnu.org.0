Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018BD4AEF8F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 11:53:56 +0100 (CET)
Received: from localhost ([::1]:39978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHkbi-0003eP-Om
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 05:53:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nHkFC-00070Q-CE
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:30:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nHkF9-0002oR-1z
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644402631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nAvwtPb3s9sVeSO+W3MxfAcX9bWNXjvDWeMiIpP3PjI=;
 b=OnN5WLn+7qaZhf4nYow+s0rG8s5qJbYL7QStgjQ49FAdp7798KjQbuRRskwZuVgBlyqeM6
 KHS6DVkhzqBdK6bXUlM2mawdBGvlW1RvZ2mSHnLob52cQuufrIg0sGI81T5TblzF9vgtO6
 PRCgWW2UbXlcRGXd+yq41QOK5YdgcOM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-dAr3me0AOKiI0g1RcifyNQ-1; Wed, 09 Feb 2022 05:30:30 -0500
X-MC-Unique: dAr3me0AOKiI0g1RcifyNQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 z26-20020a1709067e5a00b006cbe0628826so980881ejr.10
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 02:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nAvwtPb3s9sVeSO+W3MxfAcX9bWNXjvDWeMiIpP3PjI=;
 b=ih38S8wx1CN9BGg7bdobt6uwdlddQ0X3LW4O2b78U1gjp1tYrZ/+VGE2j+5ffDwpwS
 XG6TKymrAcfm44Tnzarb3LlvjUFciY49IZDZWopVFlldoy3RX1GezfYV/SZTSd293r7P
 1215MBjnpEKq49WsixwKTUuwM+nNNS5R76SQhlTUoq5N+lhYhccLCWdaMA1rVM8jvYAP
 atMZQ6BjKIjLvvsyMZxlEmldHDIbBJsWKECW55LUeb1Ameyx2kO1VXM8/3eSayLzeRn5
 3UBTB53M/VGfXJGVWg9PpWmLj2hRfhhu+2lVROHUYOlfqRUnXmN3+T26aUvH+pPxD5fe
 9zyQ==
X-Gm-Message-State: AOAM532AaAhirQAjn+EbzWLF/0xesItnq5nhj418QveySV6gpF4sFanS
 Z7dYZRJckhh58zIYDWLtT6fw8Dt1mu63U94gkOLEbYIjmq3h0YIq5WAWPofH3FLzwxVRyqKQeyu
 /H4HUrgynyj7UKYo=
X-Received: by 2002:a17:907:72d0:: with SMTP id
 du16mr1298264ejc.506.1644402628954; 
 Wed, 09 Feb 2022 02:30:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzW6Ybo6neLKyFdbG0DIXv+A9eQR9rzkjudxTDa5B/ATKgE/bNrij7vtsRRxABqCJfBHQEFmQ==
X-Received: by 2002:a17:907:72d0:: with SMTP id
 du16mr1298243ejc.506.1644402628676; 
 Wed, 09 Feb 2022 02:30:28 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id qf6sm1918676ejc.113.2022.02.09.02.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 02:30:28 -0800 (PST)
Date: Wed, 9 Feb 2022 11:30:26 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/6] target/arm: -cpu host/max KVM and HVF fixes
Message-ID: <20220209103026.sf2tcko2w5govafq@gator>
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220204165506.2846058-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 04, 2022 at 04:55:00PM +0000, Peter Maydell wrote:
> This patchset fixes various minor bugs in KVM and HVF
> -cpu host and -cpu max:
> 
> (1) KVM -cpu max was incorrectly adding a 'sve-max-vq' property
> that wouldn't work and which doesn't exist in KVM -cpu host
> 
> (2) HVF -cpu max was using all the TCG ID fields and thus
> promising the guest more than the host CPU can actually do
> 
> (3) HVF -cpu host wasn't setting up the PAuth properties, so
> it defaulted to not telling the guest about PAuth support
> 
> This series fixes (1) by moving the '-cpu host' code to
> cpu64.c since it's aarch64-specific anyway, which lets us
> reuse it from the '-cpu max' init function. It fixes
> (2) and (3) mostly by making HVF use the same bits of code
> that KVM does for -cpu max and PAuth.
> 
> thanks
> -- PMM
> 
> Peter Maydell (6):
>   target/arm: Move '-cpu host' code to cpu64.c
>   target/arm: Use aarch64_cpu_register() for 'host' CPU type
>   target/arm: Make KVM -cpu max exactly like -cpu host
>   target/arm: Unindent unnecessary else-clause
>   target/arm: Fix '-cpu max' for HVF
>   target/arm: Support PAuth extension for hvf
> 
>  target/arm/cpu.c   |  30 -----
>  target/arm/cpu64.c | 330 +++++++++++++++++++++++++--------------------
>  2 files changed, 181 insertions(+), 179 deletions(-)
> 
> -- 
> 2.25.1
>

For the series
 
Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew


