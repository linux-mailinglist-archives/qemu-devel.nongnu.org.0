Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42EC4D4F55
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 17:32:01 +0100 (CET)
Received: from localhost ([::1]:56276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSLho-00057S-Qy
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 11:32:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSLgw-0003uk-3h
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 11:31:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSLgs-0004ig-U8
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 11:31:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646929857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3tdMs0Dpg5ullGujxW0c27mxVdvZwIcXYi93Hx0GA1g=;
 b=DSsY01ib+VfrbZPEl1MR+63nXRNzybwcF5QRwFXXtXN6b73z98jr5CEB8FtktCZTiXTLKR
 Ikc24iu3SKlB1WBPjp+TKeCRfwAxuuVqX6pBt9wPUb23P2tVv6GQN+uV0Q77LAxnn85u7G
 M8Re+7VobTh4aro7LIFhsy8Yd2B4IZ0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-jvqpRS6_ObS_Uib4rRi45A-1; Thu, 10 Mar 2022 11:30:56 -0500
X-MC-Unique: jvqpRS6_ObS_Uib4rRi45A-1
Received: by mail-ej1-f71.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso3404710ejs.12
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 08:30:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3tdMs0Dpg5ullGujxW0c27mxVdvZwIcXYi93Hx0GA1g=;
 b=XON4Wua1zfLMO6PkOgv/CKQisif3BJuw7e3E2o0hORDImMpDHsu48TAhPuug+ixrzf
 BiBWNzWf9IBDNWTQMiid0c69ikwcghRhMDHyKapkGk07xjQL2NIJ323nDRxpn9+EVNVs
 VX4B/LTb4wEzNGlIjNv75grYZiYaoa/km21BJeTwRt0vKotKhX0ig1kq/jEusNPNTvPw
 5bN5hCJUNAFip+ZETmAOvkb2VYSmV/GTmSYU8SXp0y6tQgdLNEFM4xj5PJ2YQRAhClKc
 XwU2RlzuIOQoJkk/45Votz0fHk8WEoji9MOxAiPBTnBqypihChQA53fxRBYLf3tpx4uL
 AqYA==
X-Gm-Message-State: AOAM5336o9eEOvDNbjPCklwemQtpq5lX0PRQPcbVp8acGg9rgHyJ1VbU
 iDcYNqbrjcFPPXHm4RcFChaD0t/P+FinQ5yKvnmU0fii1eAM1FM+tMcAN74T0mwbfwABSXmLl/E
 V9GyEyV7KEnMaPhk=
X-Received: by 2002:a17:906:974a:b0:6db:4f47:58f5 with SMTP id
 o10-20020a170906974a00b006db4f4758f5mr5043760ejy.38.1646929855367; 
 Thu, 10 Mar 2022 08:30:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPVLqYsEJSoEaql/Au1NVwHFYop50T8Ca627y377n23+Ml23JTsqmLplnM6EBI/EQhpuqcvQ==
X-Received: by 2002:a17:906:974a:b0:6db:4f47:58f5 with SMTP id
 o10-20020a170906974a00b006db4f4758f5mr5043748ejy.38.1646929855141; 
 Thu, 10 Mar 2022 08:30:55 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a056402115500b00413c824e422sm2144664edw.72.2022.03.10.08.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 08:30:54 -0800 (PST)
Date: Thu, 10 Mar 2022 17:30:53 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: QEMU device refcounting when device creates a container MR
Message-ID: <20220310173053.5eb97f20@redhat.com>
In-Reply-To: <CAFEAcA8Nvr-7QYHv2-K+zN37i=ZXa8_Skb53PaTJzSdhXaBq3g@mail.gmail.com>
References: <CAFEAcA87VaeHzW4qbHn+UKjh9gMQbKNcN5ytXBS1MUPSapdhYw@mail.gmail.com>
 <4eb4bb05-814b-c28c-c2f4-0f5f5582301b@redhat.com>
 <CAFEAcA-Wg5LKVRQ4dKX6Hsyb=1VVxfGBDB_=Q6iCxycJzLPRhg@mail.gmail.com>
 <CAFEAcA8ytELEkGfwCV3WEZYCCtYdyG9_2uANk8UXGV-=iOnfqw@mail.gmail.com>
 <20220310163610.7f782922@redhat.com>
 <CAFEAcA8Nvr-7QYHv2-K+zN37i=ZXa8_Skb53PaTJzSdhXaBq3g@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do On Thu, 10 Mar 2022 16:05:24 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 10 Mar 2022 at 15:36, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Wed, 9 Mar 2022 16:56:21 +0000
> > Peter Maydell <peter.maydell@linaro.org> wrote:  
> > > ...also, in the device-introspect-test where I see this problem,
> > > unrealize is never going to be called anyway, because the device
> > > is only put through "instance_init" and then dereffed (which
> > > does not result in instance_finalize being called, because the
> > > refcount is still non-zero).  
> >
> > question is why introspected device is deferred instead of being
> > destroyed if it's no longer needed?  
> 
> ...because the reference count is not zero.
> 
> What is supposed to happen is:
>  * device is created (inited), and has refcount of 1
>  * introspection code does its thing
>  * introspection code derefs the device, and it gets deinited
> 
> This bug means that when the device is inited it has a refcount
> that is too high, and so despite the code that creates it
> correctly dereffing it, it's still lying around.

looks like ref count leak somewhere, instance_finalize() take care
of cleaning up instance_init() actions.
Do you have an example/reproducer?

> thanks
> -- PMM
> 


