Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FAD3D66D7
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 20:42:14 +0200 (CEST)
Received: from localhost ([::1]:50678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m85YK-00057b-VX
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 14:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m85X8-0003ub-LH
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 14:40:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m85X6-0006yL-Co
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 14:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627324855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bsVG8cbp21h0uSsz0yACWufxcxeVw9LXGXHttddYjR0=;
 b=QnHHCG+dvJ2cJz+840RQE1rvsKXWVQzGCDICTHCqedz4nTG6x7rKN21WlhgrzzIpf+ylBl
 y38zNjYbttQiyOAJRqKSOvI38Dw3ZC/2v7COCye2T0Ud70ts7/8nETn742hgoK3RdBhtf2
 lVwvziVSZZsK2PDNoaDbDq6/EuMVBLk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-oAYvP-I_OGW9QvYCEMYgxQ-1; Mon, 26 Jul 2021 14:40:54 -0400
X-MC-Unique: oAYvP-I_OGW9QvYCEMYgxQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 j12-20020a05620a146cb02903ad9c5e94baso9673653qkl.16
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 11:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bsVG8cbp21h0uSsz0yACWufxcxeVw9LXGXHttddYjR0=;
 b=lZGxDlOWKpNRVdpgczW3gvbe5Ca3k12U4J2DomfSQvsp0pMrlOLYiSdG5dXSMEgTvh
 5+TXcibuZt3Lt4xA7f4uNym6JROUjzMP1G9ESKFpJEN01hh4QvSFQ7HvHxLvNfcFlO2b
 qXHtzZMsrN3b7flpqLhKGwR9wLANURHPArKCcUKCVOy8t9C0zAxuW6P94InlRNJZMt1i
 8WtDCctNWJb20lMMG3wLWgJoOWeulej/lGVvnifLQbSD/KI2a3QKIsFrkLHOQXJI7sny
 SxsFyHhO5QbyHA4hpAnJeSbDdogBOUJ13vqGcH/0G4ybuPuBOg25bmCgdSqp0AZ0vCO0
 /iOA==
X-Gm-Message-State: AOAM533FXFUPcBucZBwMBm1pYjIqUo8aoPTzmx5/bCNr29QMzljO3Rlx
 +yoTEOuO2DeaY03DNUtg6VvzOAa5qezuMMYpQtcF7I0E+7+TSU3ezp60sajt/VYceKd9QT1ZzG8
 fYhlugdyJ/gXPsLo=
X-Received: by 2002:a05:620a:319:: with SMTP id
 s25mr18488305qkm.411.1627324854016; 
 Mon, 26 Jul 2021 11:40:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzOwsell9kqVfLBSUuY1RUofMj4wyD5XxWJ/zTFD6ctKhOhDS9W/iNdsKExV7YILlXJ4FAmg==
X-Received: by 2002:a05:620a:319:: with SMTP id
 s25mr18488285qkm.411.1627324853768; 
 Mon, 26 Jul 2021 11:40:53 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id 82sm440326qkl.97.2021.07.26.11.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 11:40:53 -0700 (PDT)
Date: Mon, 26 Jul 2021 20:40:51 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 3/3] target/arm: Add sve-default-vector-length cpu
 property
Message-ID: <20210726184051.qn4k3ii4bhkmgotp@gator>
References: <20210723203344.968563-1-richard.henderson@linaro.org>
 <20210723203344.968563-4-richard.henderson@linaro.org>
 <20210726145951.g3ywwhcfstmsi7vi@gator>
 <df4f3bdc-5110-b321-e173-1a911b7e7c4b@linaro.org>
MIME-Version: 1.0
In-Reply-To: <df4f3bdc-5110-b321-e173-1a911b7e7c4b@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 26, 2021 at 08:33:52AM -1000, Richard Henderson wrote:
> On 7/26/21 4:59 AM, Andrew Jones wrote:
> > > +SVE User-mode Default Vector Length Property
> > > +--------------------------------------------
> > > +
> > > +For qemu-aarch64, the cpu property `sve-default-vector-length=N` is
> > > +defined to mirror the Linux kernel parameter file
> > > +`/proc/sys/abi/sve_default_vector_length`.  The default length, `N`,
> > > +is in units of bytes and must be between 16 and 8192.
> > 
> > Hmm. If a user inputs anything greater than 256, then won't it get
> > silently reduced to 256?
> 
> Yes.
> 
> > > +If not specified, the default vector length is 64.
> > > +
> > > +If the default length is larger than the maximum vector length enabled
> > > +with `sve<N>` properties, the actual vector length will be reduced.
> > 
> > Here it's pointed out that the default may be reduced, but it implies that
> > that only happens if an sve<N> property is also given. Won't users wonder
> > why they're only getting vectors that are 256 bytes large even when they
> > ask for more?
> 
> I guess adding that 256 is the maximum length supported by qemu should be sufficient?
>

Works for me.

Thanks,
drew 


