Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E52476C3A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 09:53:02 +0100 (CET)
Received: from localhost ([::1]:53628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmVZ-0001Jb-1s
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 03:53:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mxmQO-00035f-4p
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:47:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mxmQM-0003cy-9i
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639644457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3aF2bcZ/YX1nFwYaRdoYyovSpd9ttOChaM2u5O2hEkg=;
 b=O9FUvAi/W45D5hw5FWd9aX6Y3I2oERU9IK5w7t0ZSODMgdb5JhPWAF2SIB3Npwcw5+yV2o
 7uQiyukpRotmxNkfhKqXJIOd9CnFWPATyBsTzVm66Xu8r3EyGU3LTA2zEoPNQpyRnnD9Xp
 bd4nTrYQIofwr1BlONvQjO9UVx7FDGI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-RuEjERY2PB2DJLM2F5xLVQ-1; Thu, 16 Dec 2021 03:47:36 -0500
X-MC-Unique: RuEjERY2PB2DJLM2F5xLVQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 f13-20020adfe90d000000b001a15c110077so1901035wrm.8
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 00:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3aF2bcZ/YX1nFwYaRdoYyovSpd9ttOChaM2u5O2hEkg=;
 b=PVhPTXEb0ZQuav6gahPrrjhXRYpl8ZQ5ajT6Gnz69gKqGD1abK1ecPzDcGph2Id4iP
 kieIiACK4YQK1OUUq3U0en3h/0yNE9xKSQrYUXDVpoEdA3RS8rbH532+ehoUHIlbY6UY
 VwhPeRBw5F0/zXbyNkz9aScMf/1A+rKvjQmODiXuNca5jub9UWfnD64Xk/o1jRX5tF+a
 QouJ6MHGnQmVwSPiGz4lyEg8qqZWpWjQfBDmRD7LVP4dW1WygaeN9FNoLkS55i4c1w+y
 HYjWuwmJiS/Zt1O5lOontDsBxPM2ybYysI+D2SvhfwJA5FOlzS+5orXBkCny11ZF09S5
 P08g==
X-Gm-Message-State: AOAM531WDx/mtL76CPXZlLdl7tW4DCBSXaXlzvVGhcViu1IBolNObwsb
 UQMHm9KlhUuai3tg6wbjvqc53xoZ5eF1B/G3PhGePvatfLaAUSCBndLTJRieGFllVJ8FE5ts5Fh
 T+vzEKorze5Xxw0A=
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr8114557wrd.323.1639644455166; 
 Thu, 16 Dec 2021 00:47:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYRPwQ6/aG59Ien/n2wCmHAytBndcwdkmI0hS+IBvughy9MoLzIj45YQrEDoZElO6yEn65Mw==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr8114543wrd.323.1639644455013; 
 Thu, 16 Dec 2021 00:47:35 -0800 (PST)
Received: from xz-m1.local ([64.64.123.12])
 by smtp.gmail.com with ESMTPSA id a9sm4129960wrt.66.2021.12.16.00.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 00:47:34 -0800 (PST)
Date: Thu, 16 Dec 2021 16:47:28 +0800
From: Peter Xu <peterx@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 2/4] intel_iommu: Support IR-only mode without DMA
 translation
Message-ID: <Ybr9IBVQCOrkVHWv@xz-m1.local>
References: <20211209220840.14889-1-dwmw2@infradead.org>
 <20211209220840.14889-2-dwmw2@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20211209220840.14889-2-dwmw2@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 09, 2021 at 10:08:38PM +0000, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> By setting none of the SAGAW bits we can indicate to a guest that DMA
> translation isn't supported. Tested by booting Windows 10, as well as
> Linux guests with the fix at https://git.kernel.org/torvalds/c/c40aaaac10
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Acked-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


