Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6FD57BAAA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 17:42:24 +0200 (CEST)
Received: from localhost ([::1]:59682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEBqA-0006RT-So
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 11:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEBmf-0002yq-Ip
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:38:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEBmd-0007sk-Gu
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:38:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658331522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ymGXklXtyhQMYXmhqyNAriQtgbSKlN07rOtaJxcHEgg=;
 b=hJq9HUhJSZI82n+fMnCKWYxCt28p2S1VRCPreZLv91GfCflMDe9ovm60ZYeOEarLno+8iq
 o1rDWXjuonuV7kjj5MwGzOYs7QqueMoqJUr1IovYh6qQen5Cjv3lcjKVL5H16JasnwRpR4
 MXufVZWjrXFr5wJLY+yJU9ZOR7p3yjE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-L-pCIrPEPfi1vUT3MZVEuw-1; Wed, 20 Jul 2022 11:38:41 -0400
X-MC-Unique: L-pCIrPEPfi1vUT3MZVEuw-1
Received: by mail-wr1-f72.google.com with SMTP id
 n10-20020a5d6b8a000000b0021da91e4a64so3206718wrx.8
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 08:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ymGXklXtyhQMYXmhqyNAriQtgbSKlN07rOtaJxcHEgg=;
 b=7VrxTXjMsXmj8CAZPuu4KTwxIdkuvvXoN9cO+wePHDZkOebuJrVYbJYgdvFvksqKbv
 Sk05AIBHkaOo7RJ9vTx5OINjvWWJ3LViqe+zv8EXPV6Mn9DUygCoI34VoUO305SYCBvY
 vcbFVEAJCwbWSIT7aWdRgR5kNPhPbt1kZle3KkViuwhcE2g6N3TlGoSGOPa3VOnRd77e
 kUHg4oUTzStOIDkP15yoNm+CMXlPEu50tZ3E0byKDnhwF07u3p9NIAv3Mke/h2OZhFP+
 MFlWU8LlqIEdF6EULaCA+Mg8J4okSUlvsQ0oOr2B8je81nz6UtkxP5d6j8IWV7bcSsqr
 NngQ==
X-Gm-Message-State: AJIora8xSLqUVlX47QO4VlCvLJXQT2nc8KjDW0LZriO/LoSeQtt/E4c6
 bQx09GEIyY9lOrIDV40HVQjWKpK53hd+HvI9D658bkPmdNV5wJEQk+gyY14MLsGqhNcaSML6dRD
 HWO0pa/vMndHvcX0=
X-Received: by 2002:a05:6000:1447:b0:21d:c92f:99d3 with SMTP id
 v7-20020a056000144700b0021dc92f99d3mr23269601wrx.503.1658331520494; 
 Wed, 20 Jul 2022 08:38:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1slT3cOZXuUco5aMPMh4Gh8Jgfd7stufTU2OcsJJcKJNHtdoO29K8Kcop+LlFmEMoWIVk9UXA==
X-Received: by 2002:a05:6000:1447:b0:21d:c92f:99d3 with SMTP id
 v7-20020a056000144700b0021dc92f99d3mr23269582wrx.503.1658331520283; 
 Wed, 20 Jul 2022 08:38:40 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 k6-20020adfd846000000b0021d8b1656dfsm16229284wrl.93.2022.07.20.08.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 08:38:39 -0700 (PDT)
Message-ID: <13e74bbc-0b72-ef20-98b8-92aaec6b8ff1@redhat.com>
Date: Wed, 20 Jul 2022 17:38:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/5] configure: Drop dead code attempting to use
 -msmall-data on alpha hosts
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220720152631.450903-1-peter.maydell@linaro.org>
 <20220720152631.450903-5-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220720152631.450903-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 20/07/2022 17.26, Peter Maydell wrote:
> In commit 823eb013452e93d we moved the setting of ARCH from configure
> to meson.build, but we accidentally left behind one attempt to use
> $ARCH in configure, which was trying to add -msmall-data to the
> compiler flags on Alpha hosts.  Since ARCH is now never set, the test
> always fails and we never add the flag.
> 
> There isn't actually any need to use this compiler flag on Alpha:
> the original intent was that it would allow us to simplify our TCG
> codegen on that platform, but we never actually made the TCG changes
> that would rely on -msmall-data.
> 
> Drop the effectively-dead code from configure, as we don't need it.
> 
> This was spotted by shellcheck:
> 
> In ./configure line 2254:
> case "$ARCH" in
>        ^---^ SC2153: Possible misspelling: ARCH may not be assigned, but arch is.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   configure | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/configure b/configure
> index c05205b6085..d0e9a51462e 100755
> --- a/configure
> +++ b/configure
> @@ -2251,13 +2251,6 @@ if test "$fortify_source" = "yes" ; then
>     QEMU_CFLAGS="-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $QEMU_CFLAGS"
>   fi
>   
> -case "$ARCH" in
> -alpha)
> -  # Ensure there's only a single GP
> -  QEMU_CFLAGS="-msmall-data $QEMU_CFLAGS"
> -;;
> -esac
> -
>   if test "$have_asan" = "yes"; then
>     QEMU_CFLAGS="-fsanitize=address $QEMU_CFLAGS"
>     QEMU_LDFLAGS="-fsanitize=address $QEMU_LDFLAGS"

Reviewed-by: Thomas Huth <thuth@redhat.com>


