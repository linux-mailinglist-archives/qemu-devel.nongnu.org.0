Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533A2511BD7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 17:23:43 +0200 (CEST)
Received: from localhost ([::1]:34096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njjW2-0004R5-Fl
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 11:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1njjOl-0007rh-TJ
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 11:16:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1njjOi-0006pj-9W
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 11:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651072566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RdOY8msxCQchv5i7h3VB3lT12FfIjXjfVyzC1eJZQN8=;
 b=aMCXSyEF16tDsYgQGe7XaLcZFTOF91PzU/adUSB1b3NI64W692rYGD68HUT58ndvZ+KCpF
 29BEGk7E8o9DOT88wp1mOig0e41rssjN8EuiO/z3rqTCn8KjfWO8Ldqja/vDB6NT4feQii
 1wHy3KxHYMflc+N/MQbKwiuI4E82Kuc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-C2b59Ve-MOGDiFgnfTNlNQ-1; Wed, 27 Apr 2022 11:16:05 -0400
X-MC-Unique: C2b59Ve-MOGDiFgnfTNlNQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 l33-20020a05600c1d2100b00394059572d6so639933wms.8
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 08:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RdOY8msxCQchv5i7h3VB3lT12FfIjXjfVyzC1eJZQN8=;
 b=jw+9EUSFAWv79GV60Vu3qONDA+S8s6KdkKhdxZHhg0r+/UBNqxxs0kg5M+5/6/pMZv
 ZngiuTQUHaLMNFcakw/gbLv9hdFDkIfvHE4aTOixsrNt4Gz2rWFRMFyDc+9muhCSFQmV
 sd/Zk7dECRnrmaAid+Hl2QrNb8EaVSB2OZxeKUS7FGlAD3AwoqUe8rRFeB8KSme/WWMr
 2zyDOmSlm8mHeACk/mnTGb8aHpSGTkoVuC8w/0fm9gFTiAXlMBg+6Uzpas8kIFUjLt/+
 acTWcfYWVPvyhzcV3t0ssjnjjMG+57+7SBKJl3yeka4MlMe+6fd61OKv4TyL4Ow8BDUq
 PKxw==
X-Gm-Message-State: AOAM533G3pJOQbKn08OU89nJcZjeAz7rFalIiVemsbnxCL3O4SFwdgYE
 Rl5b8REBeA2coolLWa1PGV1MSCW8le9QefAsyFCMZp3cir8FlaL5cQbxmotj5aWVNNjwJlsYCwm
 LwsRP/siXcA6pQEo=
X-Received: by 2002:a05:600c:20c7:b0:38e:bf41:edef with SMTP id
 y7-20020a05600c20c700b0038ebf41edefmr35829165wmm.173.1651072564076; 
 Wed, 27 Apr 2022 08:16:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhHrvUgODnWNA4/p59t2cFma7YYrrhPP2TreE9s9FwSwEkucr8EbR0pXe1zqvu8A1+k9MORQ==
X-Received: by 2002:a05:600c:20c7:b0:38e:bf41:edef with SMTP id
 y7-20020a05600c20c700b0038ebf41edefmr35829141wmm.173.1651072563781; 
 Wed, 27 Apr 2022 08:16:03 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 9-20020a056000154900b0020a849e1c41sm16797926wry.13.2022.04.27.08.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 08:16:02 -0700 (PDT)
Date: Wed, 27 Apr 2022 16:16:00 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 7/8] qmp: add filtering of statistics by name
Message-ID: <YmleMMNkZ8ukENDZ@work-vm>
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-8-pbonzini@redhat.com>
 <YmkwndPwSDxqqdZA@work-vm>
 <6655dcbe-860e-b107-e63e-ff397189d178@redhat.com>
 <Ymk4U4O4CN3e7+9A@work-vm>
 <2aed3f83-5941-d723-7c27-cc657f7c257a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2aed3f83-5941-d723-7c27-cc657f7c257a@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> On 4/27/22 14:34, Dr. David Alan Gilbert wrote:
> > If I specify a 'vm' it's not obvious to me whether I'd get NICs and
> > block devices in the future?
> 
> VM would not get those (it's global statistics), but the size could balloon
> if you specify no target at all.
> 
> > Adding a syntax for 'all' into the vcpus list would fix that?
> 
> I don't like having special syntax.  The current QAPI just doesn't filter
> what is not in the arguments.

Is there a object that represents the set of all vcpus?

> > > >       "providers": [
> > > >          { "provider": "kvm",
> > > >            "names": [ "l1d_flush", "exits" ] } } }
> > > > 
> > > > It's not clear to me whether the "target" should also be specific
> > > > to a given provider.
> > > 
> > > No, the target is a QEMU concept, such as a CPU or a device backend.  It is
> > > identified by either a QOM path or a unique id.
> > 
> > But doesn't 'kvm' as a provider only make sense for vcpus and VMs; if
> > you're imagining block devices and other things as targets it would seem
> > wrong to have that set of providers separate.
> 
> Yes, those would have different providers.  But a single target can support
> multiple providers.

Is that just for different implementations - kvm/hcf/tcg etc or do you
envisage multiple providers on an object in a running VM?

Dave
> Paolo
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


