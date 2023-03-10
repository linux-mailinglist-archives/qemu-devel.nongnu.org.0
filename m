Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC4F6B479F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 15:52:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pae5v-0006NM-57; Fri, 10 Mar 2023 09:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pae5t-0006NA-57
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 09:51:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pae5r-0004eg-PP
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 09:51:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678459898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gk9Uobz3Wpvg+CpBFQM98UVNnhUxqbl9se3YL0JUJrc=;
 b=XoijYcW4gn9q2iSDNL5XTDTlZh8frmPCVZF5OfD/d8I0NiKPWuGgMtM/6YgqfTQi3Ax6T8
 oTxADPT84nhBFri7BxwgpEQNY5cuEJT6zl3knULnb3qgRBZWginXIccx8vWJjJ9z8aMSxc
 gFJPd+bi8jnLfqiW1IoioqAELGT/o10=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-Uz6U4I4CM0ekL6ypi_fEFQ-1; Fri, 10 Mar 2023 09:51:34 -0500
X-MC-Unique: Uz6U4I4CM0ekL6ypi_fEFQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 m1-20020a05621402a100b004bb706b3a27so3030008qvv.20
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 06:51:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678459894;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gk9Uobz3Wpvg+CpBFQM98UVNnhUxqbl9se3YL0JUJrc=;
 b=CYkqgRf5nsUN1oXtWw23bxI8JnHX1b6tnFV+2IUeQHjny9v3RYPZDSn/rurfSNjOBv
 hoy6jL0n/H+gYLabq4C8w0j5v/ziwML8cRPbyiqrKvz7gt/6E1ok0k6M9JE0Xo76Gf23
 A0PXCUxGD8UJlB45mIqnvBQQ3SW/2/sJpd8/rCwN1txWScOTb7RapwwF8riJDuHFpSIs
 QuKBKG0g8HYp+d32sTga7NPntU7F9wLTMw26zq0WsAdAFdgiEnoI5b3lUzW7/htmUUgp
 4TCvFWi1k94EPeh4F6gsEHMGlQikc2dCsYHZlDac/x18PIflYfG2gpOFOaRawIclnG/h
 CYUg==
X-Gm-Message-State: AO0yUKXvgUDGal51Z5HqVnkxqIQEYabYz0Z9iO0ENxHE9XbA/jalFk1k
 mIkqxvpjU0AN4N/RK8PW1WpBTk4Ge3cUf+2ANG4OcfCF2Ex5MuqMwQ45NLBPXy5LiT+N3H4GIpX
 /LsTZrEVdPf6fBIo=
X-Received: by 2002:a05:6214:1308:b0:57d:747b:1f7 with SMTP id
 pn8-20020a056214130800b0057d747b01f7mr5181576qvb.1.1678459894174; 
 Fri, 10 Mar 2023 06:51:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+kpwnRnOgQpcTDFxzaxQR+6DLlSgUoy8eQjxOAzZyY+qHrGA2DcMEwwIo2Z1ptTOuZlH52hw==
X-Received: by 2002:a05:6214:1308:b0:57d:747b:1f7 with SMTP id
 pn8-20020a056214130800b0057d747b01f7mr5181549qvb.1.1678459893925; 
 Fri, 10 Mar 2023 06:51:33 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 n189-20020a3740c6000000b007426b917031sm1393846qka.121.2023.03.10.06.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 06:51:33 -0800 (PST)
Date: Fri, 10 Mar 2023 09:51:32 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [PATCH v7 3/6] memory: Introduce
 memory_region_transaction_do_commit()
Message-ID: <ZAtD9BZ4x2QwYUaH@x1n>
References: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
 <20230310022425.2992472-4-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230310022425.2992472-4-xuchuangxclwt@bytedance.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Fri, Mar 10, 2023 at 10:24:22AM +0800, Chuang Xu wrote:
> Split memory_region_transaction_do_commit() from
> memory_region_transaction_commit().
> 
> We'll call do_commit() in address_space_to_flatview() in the later patch.
> 
> Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>

[...]

> +void memory_region_transaction_commit(void)
> +{
> +    assert(memory_region_transaction_depth);
> +    assert(qemu_mutex_iothread_locked());

This context has nothing to assert BQL, so this can be dropped I think (you
have one in do_commit).

> +
> +    --memory_region_transaction_depth;
> +    if (!memory_region_transaction_depth) {
> +        memory_region_transaction_do_commit();
> +    }
>  }

With above dropped:

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


