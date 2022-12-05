Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF6D642AC3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 15:56:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Crv-0002pE-V2; Mon, 05 Dec 2022 09:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2Crd-0002mJ-Dm
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 09:54:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2Crb-0003BX-Mo
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 09:54:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670252074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pB7Dmg8l8BdUikoZjeJxAjnb6+wQ513sTDh7zv2Uu6M=;
 b=gHy8hZasmu7hZDyL1Jax2meXAcfb9dyN8uf17j2iG5hdaxXhRrQFb+alsaTQ6VZzAlEh5D
 CXTL1igHl/k/BxpdmeMkDVJ9HU413qRBFi9vkrQk+DlItlZQ18sWEX7o2vy93BxR28/Xp/
 C8Ukkhq3HAgxck/jFbGLuu24P7uGRGM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-189-ClEmce1XPJWeU9sRSGG5sw-1; Mon, 05 Dec 2022 09:54:33 -0500
X-MC-Unique: ClEmce1XPJWeU9sRSGG5sw-1
Received: by mail-qk1-f200.google.com with SMTP id
 bi42-20020a05620a31aa00b006faaa1664b9so16839511qkb.8
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 06:54:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pB7Dmg8l8BdUikoZjeJxAjnb6+wQ513sTDh7zv2Uu6M=;
 b=Ni20OtfPk69cikCN5Qzwoe3cL+R9moz6ST9XWSzI14U0sWWmxFnurc1A1rjc3SsdJq
 a28p8wF4R88XK3zcEDzbS4BmhPZQYySvtteFP0uCMEeBQ9WmMp8j1VOwqoI4MKXUK6TN
 2whyY+Wi9Oq77vVYZL5qlucItbO6beS4uakfTk7JGVThYv3JJ2YDFvPGXHsXLqWcrjKa
 dUDL7UUOkB9yYB8M9DTSYTvHmnntlzlTtJJyf9fpK6N5/8jP7Xpy42UKEdaddT6HqHWX
 JdHOn6aGe1Sswqv8v+7bnRNWxzK8AGha/XxkkVmAKfF4VVMSM+C6i/srZKiZ5NjjgXxL
 ET4g==
X-Gm-Message-State: ANoB5pllu5LFtVmsqspltz5sFSL2akLbNqVCb4+l99hqpbEwQLTkZjqf
 Ro9WS68/NIQnH/NGWIrffbpjYHCneNU/FMJBLnslEC7oh1Dclj6AYKpdeE/ms6EiDMj6xhD1cSl
 b+J9Rou7pVb7faiQ=
X-Received: by 2002:ae9:e018:0:b0:6fb:b1ff:85e with SMTP id
 m24-20020ae9e018000000b006fbb1ff085emr73681697qkk.8.1670252072827; 
 Mon, 05 Dec 2022 06:54:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4M2b6ub8EB0IsD+YvKpXdVOXm/g12O4wBp+OyYZ2ZUQ/05EOrj1uxOs6Md9ilhiConAS9IfA==
X-Received: by 2002:ae9:e018:0:b0:6fb:b1ff:85e with SMTP id
 m24-20020ae9e018000000b006fbb1ff085emr73681679qkk.8.1670252072557; 
 Mon, 05 Dec 2022 06:54:32 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 h6-20020a05620a400600b006fc2e2198easm901827qko.95.2022.12.05.06.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 06:54:31 -0800 (PST)
Date: Mon, 5 Dec 2022 09:54:30 -0500
From: Peter Xu <peterx@redhat.com>
To: Ted Chen <znscnchen@gmail.com>
Cc: pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] memory: dump HPA and access type of ramblocks
Message-ID: <Y44GJiKiNIaanLep@x1n>
References: <20221205120712.269013-1-znscnchen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221205120712.269013-1-znscnchen@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Mon, Dec 05, 2022 at 08:07:12PM +0800, Ted Chen wrote:
> It's convenient to dump HVA and RW/RO status of a ramblock in "info ramblock"
> for debug purpose.
> 
> Before:
>             Offset               Used              Total
> 0x0000000000000000 0x0000000400000000 0x0000000400000000
> 
> After:
>             Offset               Used              Total                HVA  RO
> 0x0000000000000000 0x0000000400000000 0x0000000400000000 0x00007f12ebe00000  rw
> 
> Signed-off-by: Ted Chen <znscnchen@gmail.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


