Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F156B44EC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 15:29:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1padk9-0000RN-BU; Fri, 10 Mar 2023 09:29:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1padk7-0000R9-Ud
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 09:29:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1padk6-000827-JF
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 09:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678458549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RI1WZ7oGfHhLDOpUvCw67gKaMdYEJS4JI9gYfdQ8YHc=;
 b=MaiC8NOSexa5SIiH8Jf8e55b6rOCNFAhO8SSYOIkYruGrA1rN/XB/njPGZHCXXDmhL7sS+
 P1j7b8RywjmBMugG4OIIvuttwufPEgpZAMr99075cYdgQN4p2qzyG3CoqBI7B1NZYhR+2q
 rn+Qw6gtkyMkVy/+DY0JV5RoRpDZxkk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-_yVDc-82P7uCxpGvY4FhiQ-1; Fri, 10 Mar 2023 09:29:08 -0500
X-MC-Unique: _yVDc-82P7uCxpGvY4FhiQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 c13-20020a05620a0ced00b007422bf7c4aeso3228819qkj.0
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 06:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678458548;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RI1WZ7oGfHhLDOpUvCw67gKaMdYEJS4JI9gYfdQ8YHc=;
 b=H3A4UihQG9BD3Q0GfRkJlwX4L93RYe23IJtyrEWIzmRf3lvRy94TzqfFBR7PkWwnlI
 Or2uQAqlzPee+pVhdzyR4GZyvu2MGfWTKYuvIaTrCYn0L3bmvpDsZNhpwFEyUnAlQOPh
 4Awcwk8eweHmL9q7A5EMhGIa/Un8IFBvS06p790jJ5w56JqgDbWU6Oq/fXgGgRZb/jCE
 2f/g8NHFC0SDSP/Y9iHbByz/QWNc4N0xf9vqFVWBlVyHvcSS6yC+g1Cq/q4LSh1BJOQm
 bkcUTowskZT3HDF7wBC2dLSJbG4d6A2fo51Nr9dZkdlAbrB2kh5HzIJL+lOo6DaJh97w
 rL0g==
X-Gm-Message-State: AO0yUKXc/Q4KxTDi6R1DrTuEgS/99fofw3Q53oIVue/F/d7zkR9LPYB4
 Vk/69AioQfuWFL+Z6H+d2kxwMe2tYgcEyp3TMom4fnvEWRWdak894AO+8JZeH3q9PgIYgSaQAaw
 ILO7Q38nLXPixN5E=
X-Received: by 2002:a05:622a:1821:b0:3bf:c38c:1d7a with SMTP id
 t33-20020a05622a182100b003bfc38c1d7amr5050817qtc.1.1678458548081; 
 Fri, 10 Mar 2023 06:29:08 -0800 (PST)
X-Google-Smtp-Source: AK7set++moyjPneQTbhM4m551GwJNf/OTDoU+YuJssnjvWilGhmseNGmQ266bPXGe+9lALEs2usK3g==
X-Received: by 2002:a05:622a:1821:b0:3bf:c38c:1d7a with SMTP id
 t33-20020a05622a182100b003bfc38c1d7amr5050787qtc.1.1678458547809; 
 Fri, 10 Mar 2023 06:29:07 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 h4-20020ac81384000000b003b2d890752dsm1387439qtj.88.2023.03.10.06.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 06:29:06 -0800 (PST)
Date: Fri, 10 Mar 2023 09:29:04 -0500
From: Peter Xu <peterx@redhat.com>
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] intel-iommu: Set status bit after operation completed
Message-ID: <ZAs+sPoujXt7hr5i@x1n>
References: <20230309092319.29229-1-zhenzhong.duan@intel.com>
 <ZAnzkfM8QSth9bXc@x1n>
 <SJ0PR11MB6744FE6A53BEB85BD7FD452E92BA9@SJ0PR11MB6744.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ0PR11MB6744FE6A53BEB85BD7FD452E92BA9@SJ0PR11MB6744.namprd11.prod.outlook.com>
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

On Fri, Mar 10, 2023 at 02:32:13AM +0000, Duan, Zhenzhong wrote:
> I think it may break with special designed guest OS,
> E.x: Imagine a guest write GCMD_REG and start a new thread to do further work.
> New thread find status bit in GTS_REG set and go ahead, but the address space switch
> may not finish yet if guest memory is big, which may trigger a potential race.

IMHO it's fine.  For MMIO QEMU takes the BQL so if another thread reads the
status reg it should be serialized until the current vcpu finishes.

See prepare_mmio_access().  Thanks,

-- 
Peter Xu


