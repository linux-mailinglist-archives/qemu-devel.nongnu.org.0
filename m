Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4EF49B9AC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 18:08:06 +0100 (CET)
Received: from localhost ([::1]:46518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCPIb-0005QE-GY
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 12:08:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCOsX-0002tm-Hs
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:41:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCOsU-0007qZ-Hc
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:41:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643128865;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xd2iJ+kOBVbi8g1JjppUEpmyYWG+P3BqcYqwStylD5c=;
 b=cxOLQBtQfMej/J+Ilod4N/PObPkgIqr4yL0FgeqIpVjZG3fUdklcPHbaB2WtoCIvRfPRkU
 y92qMO88h2X/KbPFkVmf0t9Z1cB7tufc2tdi0Uj60k+Z8rdMaAjfi/wEXhsi4kjVVQjqLk
 UYmmc3dAHa6yRHgDAOSGN4qjFe3WmVU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-B6b6MXnuPPaGVeuinykufw-1; Tue, 25 Jan 2022 11:41:03 -0500
X-MC-Unique: B6b6MXnuPPaGVeuinykufw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg32-20020a05600c3ca000b00349f2aca1beso1733498wmb.9
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 08:41:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=xd2iJ+kOBVbi8g1JjppUEpmyYWG+P3BqcYqwStylD5c=;
 b=Iva9zsp7DJ6g8hcBJm8tS1x8pOb2Trh1t7Qji7tsCQnHpl3wDavK0+B5fy5cFY2NA7
 4z/IF+vTNoZOy34QxVZFEp1YQSEaT3EReM860wV+wj0d7g4GFa0g+MnfAmSqJjp2TgCZ
 XxhaWSCCwnleaYuAW3FK+E9Rznxbaq08fxcMR2BujMzllu0Dkt4mCFTpSuLlR30Gfuqh
 BTtPtfM3CBAVqU2vvMeRfZL98lWq2TyyjISLnFf/5sSI/W7Wrp5jZweu3OMnjqIse/dZ
 9E5ULdGqln/YL03jHBPB5D4v8nL8ZfzQgx4OpjSkTxpQ3W1m5w9gOxLaXOhiXVbz+5hP
 qUPw==
X-Gm-Message-State: AOAM530X9W9XEd182WhcxKMHa5g/aZIz0KJt1lv7wMbMnxBY11NUki07
 Ti5nEfDMXzRP9jfLNPJUvhUabf5jE6OFdfn4u8j3Pdq3BW/z9fW+HeT+jq4Lm3UoGWlbKeDTVch
 KAdWiOLa5wCZkP/w=
X-Received: by 2002:a5d:608c:: with SMTP id w12mr18554784wrt.313.1643128862025; 
 Tue, 25 Jan 2022 08:41:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPu5bbVO0Sbr+n4WfTfdT8jjkPffILQqZVx9MHejWuC/mdWjfGKfDdN8hgo8M+I441xVnkKw==
X-Received: by 2002:a5d:608c:: with SMTP id w12mr18554771wrt.313.1643128861849; 
 Tue, 25 Jan 2022 08:41:01 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id s9sm16970988wrr.84.2022.01.25.08.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 08:41:01 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>
Subject: Re: KVM call minutes for 2022-01-25
In-Reply-To: <87k0enrcr0.fsf@secure.mitica> (Juan Quintela's message of "Tue, 
 25 Jan 2022 17:39:15 +0100")
References: <87k0enrcr0.fsf@secure.mitica>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 25 Jan 2022 17:41:00 +0100
Message-ID: <87a6fjrco3.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Juan Quintela <quintela@redhat.com> wrote:
> Hi
>
> Today we have the KVM devel call.  We discussed how to create machines
> from QMP without needing to recompile QEMU.
>
>
> Three different problems:
> - startup QMP (*)
>   not discussed today
> - one binary or two
>   not discussed today
> - being able to create machines dynamically.
>   everybody agrees that we want this. Problem is how.
> - current greensocs approach
> - interested for all architectures, they need a couple of them
>
> what greensocs have:
> - python program that is able to read a blob that have a device tree from the blob
> - basically the machine type is empty and is configured from there
> - 100 machines around 400 devices models
> - Need to do the configuration before the machine construction happens
> - different hotplug/coldplug
> - How to describe devices that have multiple connections
>
> As the discussion is quite complicated, here is the recording of it.
>
> Later, Juan.
>
>
> https://redhat.bluejeans.com/m/TFyaUsLqt3T/?share=True

And now the link that works without a login.

https://bluejeans.com/s/KetOlwoxLa3

Later, Juan.


