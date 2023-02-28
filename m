Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452C96A6147
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:33:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7aj-0003LK-TK; Tue, 28 Feb 2023 16:32:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX7ag-0003Jg-GV
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:32:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX7af-0007rI-6k
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:32:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677619972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Pc860YSulk9fikEVG+B4aKAm8X5/+wGLcWnCvldhAU=;
 b=ZEVBf1UwYtMW9eUpGkDrsmOMrmPUweSfGu0FrlJzw/V9vLtvmfWkpjmIutzVi6LeNhnkjg
 /njyLueejpLTeKJ3IXHIcE6aOBUj0oxIN0/O8zYaVujvZezKShF3dH6wNVr5KvWWYTthEw
 It2ABeWxaTaES+FKYKVEgu+wIjra1uY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-673-UdISlaVtPtCUXVHAGgfnKQ-1; Tue, 28 Feb 2023 16:32:49 -0500
X-MC-Unique: UdISlaVtPtCUXVHAGgfnKQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n15-20020a05600c500f00b003dd07ce79c8so4746210wmr.1
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 13:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677619968;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Pc860YSulk9fikEVG+B4aKAm8X5/+wGLcWnCvldhAU=;
 b=FhELbJxFoc72C0eNa/15DY2QGPpOuBYWUiqcRToMToR8nJ5Nd7Snrf+Y/WUljG/Bkz
 k8nDNtT1mX7XPCCu2AyteKjvyHzRybeb80KpVRCLMW5EHAo/2r/YP0S/cJYZAwggAIXQ
 MKAttpINet8ELHE9RO7vXk2O/SAUp+WxHK85YRvV5GHggvsgnqcPHb7EJ/rraW44v+MW
 BsvGLOC9M3kEesgFLjeyVWJphvWeVvoZNbn42p8+lSc8YN1G+cJ+O6P/CYXT9u8Ld8ll
 CLZ3dlgMPw980oE95tRd32V5tYORgBpFHNgJrUzGXhLbGjDARk8yF+QKGetLDaXnF9ow
 BqMg==
X-Gm-Message-State: AO0yUKVqQBBZbRmK2iQuG1qGxQxhgx0X5dyT/E7Bpj3HaYziBtbouBwB
 h1cJ87+74YSncTsIOc2ycwF4pkdKjF3WAmbTZOIB7djTu5MnnzN3CkKoPm3TNDs8TPdG+noKkgN
 ORmLX5hpi0QrRjGY=
X-Received: by 2002:a5d:67cc:0:b0:2c6:e827:21c1 with SMTP id
 n12-20020a5d67cc000000b002c6e82721c1mr3043372wrw.50.1677619968656; 
 Tue, 28 Feb 2023 13:32:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+qz21qmC81CB8YlJDWkxwTaOAI0Hras+SGhZGbBgfG8gObN7oaGqTNlhYS4sY6pCkJX1a75w==
X-Received: by 2002:a5d:67cc:0:b0:2c6:e827:21c1 with SMTP id
 n12-20020a5d67cc000000b002c6e82721c1mr3043357wrw.50.1677619968315; 
 Tue, 28 Feb 2023 13:32:48 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 w15-20020adfee4f000000b002be5bdbe40csm10742578wro.27.2023.02.28.13.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 13:32:47 -0800 (PST)
Date: Tue, 28 Feb 2023 16:32:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
Message-ID: <20230228162938-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <Y/z4rwv09Ckhbtfp@redhat.com>
 <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
 <Y/3C+jC3Lk5MJxfu@redhat.com>
 <99a83e65-273a-ea1b-e7d9-bbdd8ca32145@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99a83e65-273a-ea1b-e7d9-bbdd8ca32145@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Feb 28, 2023 at 09:05:16PM +0100, Thomas Huth wrote:
> Well, without CI, I assume that the code will bitrot quite fast (considering
> that there are continuous improvements to TCG, for example).

We have lots of hosts which we don't test with CI.  They don't bitrot
because people do testing before release. This is what RCs are for.
We did releases before CI - it is a cost/benefit thing.

-- 
MST


