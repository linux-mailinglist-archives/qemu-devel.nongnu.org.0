Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972841DAA97
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 08:26:31 +0200 (CEST)
Received: from localhost ([::1]:53932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbIBS-0007GT-Lc
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 02:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jbIAU-0006rf-SL
 for qemu-devel@nongnu.org; Wed, 20 May 2020 02:25:30 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25982
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jbIAT-0005Ot-Mu
 for qemu-devel@nongnu.org; Wed, 20 May 2020 02:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589955928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dDIQOF2dIqAJomq5b0gaztEmHQ8zohKEjMhNzxrhzec=;
 b=aKqJ3zYphJjqC5JdTcMcssYwnK1kTigDVrH2mW764AK9lQnoICFHtd/HYZjeYJ95VIqrgD
 Lff+YWMj18GIOToXQRaaba+w/xRlmdejITvnRzkUu1ZFJi5Zr5NLxvei/Mva44RhnFiPVB
 qcRP386IGwCjk62G3d8/KvYL8lk8xHE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-2H-omJjNOlyEJv31bIu_qw-1; Wed, 20 May 2020 02:25:26 -0400
X-MC-Unique: 2H-omJjNOlyEJv31bIu_qw-1
Received: by mail-wr1-f72.google.com with SMTP id z16so936350wrq.21
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 23:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dDIQOF2dIqAJomq5b0gaztEmHQ8zohKEjMhNzxrhzec=;
 b=UDfAUi8oulUMpa44XlWxSGLhiHzkqqoCJZTb8nj0+BsXgpKqR/Ye4cAEZSpF27Fv51
 0EkR3BMGJIkR5kbxwnU20B8WS4vUx5xEmjit9W8p4JWu/ayPtTfSLq0OgV+Grc5YzrC7
 jI7+hXX8ZPV2EgVotVcFPt3YXoLp44xztJ6F4pBOZrgxwF5Rg0rLsOJpsDweBATjuysY
 saawNVa1qq9Cn+y3KZDZ8PqBso4fSUbUZHkY3W6potr4/TzItYWuX5wg1r6sbxrc23pK
 soGGZvhdPL4WOAmwf9mHJeTDKZ8mIraeCDX7T5Rh2KzcQN8Ni0cqYDgmyadhE3JhdkQb
 Zohw==
X-Gm-Message-State: AOAM531i7E3QQn54Wco4Tu8dQjrm+DVL4ediZEGvBXGqHh6CtoqX24wk
 qGYQSDed4VyJi6j24pYnvKtlzDILdD/T3f5HkMB/qIVSadSALlzFn7t/vI05dGmwRtm8czh5INC
 fN9za14KJFGELDsI=
X-Received: by 2002:a7b:c754:: with SMTP id w20mr2996805wmk.17.1589955925545; 
 Tue, 19 May 2020 23:25:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyjnAvBJUF9alluH6j5uK7NK+UFHuW9bx7aixU/P7uTq+AY9i/eTaVau5oaf+lcQ72Q5UZSw==
X-Received: by 2002:a7b:c754:: with SMTP id w20mr2996776wmk.17.1589955925232; 
 Tue, 19 May 2020 23:25:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:591e:368f:1f3f:27d2?
 ([2001:b07:6468:f312:591e:368f:1f3f:27d2])
 by smtp.gmail.com with ESMTPSA id h20sm2001896wma.6.2020.05.19.23.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2020 23:25:24 -0700 (PDT)
Subject: Re: [PATCH 07/55] qdev: Convert to qdev_unrealize() manually
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200519145551.22836-1-armbru@redhat.com>
 <20200519145551.22836-8-armbru@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <446dad72-8600-3c16-fc8b-d4f16609c2af@redhat.com>
Date: Wed, 20 May 2020 08:25:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200519145551.22836-8-armbru@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 02:22:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: berrange@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/05/20 16:55, Markus Armbruster wrote:
> @@ -493,6 +493,11 @@ bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp)
>      return !err;
>  }
>  
> +void qdev_unrealize(DeviceState *dev)
> +{
> +    object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);
> +}
> +
>  /*
>   * Realize @dev and drop a reference.
>   * This is like qdev_realize(), except it steals a reference rather
> @@ -512,11 +517,6 @@ bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error **errp)
>      return ret;
>  }
>  
> -void qdev_unrealize(DeviceState *dev)
> -{
> -    object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);
> -}
> -
>  static int qdev_assert_realized_properly(Object *obj, void *opaque)
>  {
>      DeviceState *dev = DEVICE(object_dynamic_cast(obj, TYPE_DEVICE));

Stray change (to squash in patch 3)?

Paolo


