Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AF668EF68
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 13:58:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPjFP-0004gB-Hv; Wed, 08 Feb 2023 07:08:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pPjF9-0004eC-As
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:08:11 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pPjF3-0004gA-Lq
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:08:05 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d14so16505530wrr.9
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 04:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sUIpEF/iWSLj26NrRU6xGtIxKlImqvjrsPnikTLgT7k=;
 b=VYAGeJaeL66tZAT6Pocl4WHZ7/trlw79w+EpnpvJ4+efTwRtBO+L+T6VqumDcVUYMu
 OovJW/YVhpcYGM1DovHOqT2v3h990LEKceinIjSs4S38MUuJjEJlkfHcYDGJmzvdmuDK
 UH9Cfa+NGKCs9t5JTnFLcO1/czRM4gSnHUKiUBEjEBdFmZkPjsiX2VOZIwVuESPBburx
 1HnxowhZD4Rw/GK9QWArcKWyUrsnZ9dnAeY+hz+SPurzAHJMTO10CJ666rPjvN26tqQ7
 aiqT+qTunlyrtgxmXblJTaksZ0b5yYvAIJUe964ebKQevNDU9mM8SQtJEVSK5IfLK5VL
 onyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sUIpEF/iWSLj26NrRU6xGtIxKlImqvjrsPnikTLgT7k=;
 b=n+5EaAjfHQS3kIvaDfcbbA06dTT1+FvhdUZBln5kO7yzjkMpVTOdevTvMg/63hSHkB
 RAUTCwewrf6u0Sg8Ps44jtZjj8kSldzutmQ3N4iFIAey+Rh526AMVL3L2uJHQYk2lhWc
 fDD32MQlo1OL+YLvfEkXlV57PvOEhT0yM3KMOkKQw2wts8yco6YTEeTu4XkgCaqOQL6y
 LbkCP6UQ3unwH1MYaJEtfU3KycrtLn4yHyl4Xt2JlaDlCkbYpNaZ5Jvt4A0MhvqAbd05
 PqfPqMTGftUqmlTOQTlkVAbBNaBIpvUoR7BH455DOxSH+PSzfjKYt9VrQRaXzPCb1IY1
 TkYQ==
X-Gm-Message-State: AO0yUKWKGhk+Dh04HE4pDfZO4Q7/2Cv2SamAJrOl1FpSBcrdkHE64ZB1
 MCXYfIYK4JVPJ0XhGgrgKCN90w==
X-Google-Smtp-Source: AK7set/BxQ1swWtEyv8ANvFXM1Db4iFDVYbVYNWfjUFWbEu+YeRL1x0hLIw+hZeGMUHTlOLwTrd8Pw==
X-Received: by 2002:adf:f3cc:0:b0:2c3:ea59:a8b with SMTP id
 g12-20020adff3cc000000b002c3ea590a8bmr6788414wrp.24.1675858078463; 
 Wed, 08 Feb 2023 04:07:58 -0800 (PST)
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
 by smtp.gmail.com with ESMTPSA id
 d5-20020adfef85000000b002c3e600d1a8sm8025281wro.95.2023.02.08.04.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 04:07:57 -0800 (PST)
Date: Wed, 8 Feb 2023 12:07:53 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, alex.bennee@linaro.org
Subject: Re: [RFC PATCH 03/16] target/arm/kvm-rme: Initialize realm
Message-ID: <Y+OQmbzYYqo+5HZb@myrica>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-4-jean-philippe@linaro.org>
 <5a713862-5bc5-3d2b-e54f-70cf5b484493@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a713862-5bc5-3d2b-e54f-70cf5b484493@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi Richard,

Thanks a lot for the review

On Fri, Jan 27, 2023 at 10:37:12AM -1000, Richard Henderson wrote:
> At present I would expect exactly one object class to be present in the
> qemu-system-aarch64 binary that would pass the
> machine_check_confidential_guest_support test done by core code.  But we are
> hoping to move toward a heterogeneous model where e.g. the TYPE_SEV_GUEST
> object might be discoverable within the same executable.

Yes, I'm not sure SEV can be supported on qemu-system-aarch64, but pKVM could
probably coexist with RME as another type of confidential guest support
(https://lwn.net/ml/linux-arm-kernel/20220519134204.5379-1-will@kernel.org/)

Thanks,
Jean

