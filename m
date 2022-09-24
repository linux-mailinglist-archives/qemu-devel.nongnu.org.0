Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98A45E86FF
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 03:28:39 +0200 (CEST)
Received: from localhost ([::1]:45712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obty9-0004Sm-Sx
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 21:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1obtwz-00032t-5V
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 21:27:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1obtwv-0005LA-NZ
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 21:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663982840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wl3Q4ir2RBmi2owavOGOvuTCfqNyZTq9RTvNXsRZtqE=;
 b=A/ugd2puG+u+XxtcXJeK+gZrUBeRIx+5ZHZSn6CBm0UXh9pyoP3Y52E+C5gGKj6jztu/O6
 UNVG4GfXY10fcTz3yD/ZF1VAM4jUhtAlCFLFeCWMh6RSdoY8/Z13WJBl/MylsyoywnUMen
 NKVJpKOPEE+Vcj4ewP5yGHhkH61pxEw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-215-4HzyYzsmOzSFsPjPqTTD1w-1; Fri, 23 Sep 2022 21:27:10 -0400
X-MC-Unique: 4HzyYzsmOzSFsPjPqTTD1w-1
Received: by mail-qv1-f69.google.com with SMTP id
 f9-20020ad442c9000000b004ac7f4fde18so974704qvr.14
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 18:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=wl3Q4ir2RBmi2owavOGOvuTCfqNyZTq9RTvNXsRZtqE=;
 b=a0sknPnGh7PJJJMmeXFECZU7BeIVEUnPBXWmpUd6CU/PHa1QucB09qrC+LDIewvNwx
 Jzb/Yv06HPQwlRywiRjTPg+/tdsgaNSt6q7tpfL3HvIPD6KF9fsIS6mBUryz8L0Vzrl+
 N66nelDNP6+UwNAu4tRMLO38Y7JNFNIssFUL+QfQ+mqMv++7GzbaG70bRqNYWgSITC+T
 ng6ZI627hOW8nPcdu9SYbghZx9BBslNSBZBi5ZfMiDmxKNswuZB7Xb9mI853h8bN6bOY
 8UKsIKyM9cUvWUY4fYJgMrCOpZQtg/QCZoGRxqcki6b6h8C0a8E9GpVG4PaO4s+G/SVh
 7/tw==
X-Gm-Message-State: ACrzQf2ORO0WN0j77mTDFYP7JDaRWDTN/QgFIyx0EPcc9WnIe9yn6vgk
 me0HvDEXPiUvQp2j3ODZYV+Ztw0fgn6kmF95+8m/23XE2WarDMpucRJX5rTgsSbZ6q0oMPmtnoJ
 KolaxO49hiD3etjc=
X-Received: by 2002:a05:620a:4726:b0:6ce:9ea8:4c23 with SMTP id
 bs38-20020a05620a472600b006ce9ea84c23mr7415860qkb.127.1663982830503; 
 Fri, 23 Sep 2022 18:27:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6NT5fYvEA+2OjsO5KD+vsyByz5EcLKOO97yiDRSU80Vr+/EUUxmylkcBOsTT0rnhxD0htjKA==
X-Received: by 2002:a05:620a:4726:b0:6ce:9ea8:4c23 with SMTP id
 bs38-20020a05620a472600b006ce9ea84c23mr7415847qkb.127.1663982830306; 
 Fri, 23 Sep 2022 18:27:10 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 cm21-20020a05622a251500b0035bb6298526sm6506588qtb.17.2022.09.23.18.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 18:27:09 -0700 (PDT)
Date: Fri, 23 Sep 2022 21:27:08 -0400
From: Peter Xu <peterx@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH] Revert "intel_iommu: Fix irqchip / X2APIC configuration
 checks"
Message-ID: <Yy5c7M10df3OINwH@x1n>
References: <20220921161227.57259-1-peterx@redhat.com>
 <20220922154617.57d1a1fb@redhat.com> <YyyP4b2uKghi1EHL@xz-m1.local>
 <20220923102034.6579b66c@redhat.com>
 <20220923104159.39576159@redhat.com> <Yy4tQAeOUd49DpX6@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yy4tQAeOUd49DpX6@x1n>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 23, 2022 at 06:03:44PM -0400, Peter Xu wrote:
> On Fri, Sep 23, 2022 at 10:41:59AM +0200, Igor Mammedov wrote:
> > It's worth putting history excavation with explanation what is broken and why
> > compat stuff is being ignored in the patch.
> 
> Makes sense, I'll amend the commit message and repost.  Thanks,

There's actually one way to slightly remedy this single case, mostly for
any QEMU 7.1.0 user with -smp <=8 and the intel iommu (as 77250171bdc02 is
merged only in 7.1.0).

We can have one compact parameter x-eim-enable-kvm-x2apic, setting it "on"
by default, "off" for 7.1, and "on" for 7.0-.

I'm not very sure whether that'll worth it.  Any thoughts?

-- 
Peter Xu


