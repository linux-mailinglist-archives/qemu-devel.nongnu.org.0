Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1C33EEF3D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 17:37:47 +0200 (CEST)
Received: from localhost ([::1]:40518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG19u-0005Kn-GB
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 11:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mG190-0004Sw-LA
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:36:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mG18x-0005F7-Hz
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629214605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b+VmwD56EwOvPyi/fVA5MFZG0BcmnMhP9lsat+fDEL0=;
 b=DPBG4lF9ao3Kvmpew+5moqzMYGqqHxzD6sMdma6NezmqW3PqbSZgnRa0WcCExUItCus4kK
 3SqlTl5t5g0N4qw92Wg4E6q6kbstfD5sukRUPwpW6QB1dqxkkna8MV7vU3JC5RtvfD89uQ
 rSYNBAGyAQ8NtVlG2j4bOSL35PIdwkc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215--oppnYnTOp6UM15qGHV41Q-1; Tue, 17 Aug 2021 11:36:43 -0400
X-MC-Unique: -oppnYnTOp6UM15qGHV41Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 k13-20020aa7c04d000000b003bf04c03fc4so2268343edo.22
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 08:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b+VmwD56EwOvPyi/fVA5MFZG0BcmnMhP9lsat+fDEL0=;
 b=rIDnCvSQCx8eZKJP3IMIBQh/mdGHRZwk7nG+nESonEj+CStcDmHo+eo1ZeazwboJbK
 r3ahYMUGcUZXCD0WQsQokn+3pUiG8hNSzh+gEVHqmLmTzGjSi4eZbMfvEQaE2EUhTIp3
 tGtUVsW1Vdx/lA0KbGgkkwQ/LHhPRd3FUFyFVUmI1YHtlUbORgx1O/JRMqnOU0jpPWgj
 y3H2SEtDlc9OWnrIytrhn11f4hLCJZJIiuwZHT0hzHp/ECykISF3EWXCZZbZno9OhZXD
 23X5sf0NLep9x2SLNy5ordDlCxr5Il7gSdD+DsOKmc/2CleFRZfYgqC9ZvYQynuM0HA6
 Z1NA==
X-Gm-Message-State: AOAM530kvGbKYbeFgZwgPl5lZjwgdz5OThGPc3Mka2MmkjyJSWzB1Hsp
 dF/ff9Drcoc2gjO/+RdTUvimw7JnwKjhkkXjorQ74qCazZmXcNMVuWH8znx1SntVuk/e3Vidz3t
 BdgdOfitShJcInoU=
X-Received: by 2002:a17:906:e0d2:: with SMTP id
 gl18mr4638996ejb.35.1629214601480; 
 Tue, 17 Aug 2021 08:36:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIJMYFro1Lh20r4xsqvD+ESQB9olC3GNM/3hl8YbdW8Oe8OmKLP/RRPgeVUbABj3MNesbp0A==
X-Received: by 2002:a17:906:e0d2:: with SMTP id
 gl18mr4638976ejb.35.1629214601284; 
 Tue, 17 Aug 2021 08:36:41 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id v10sm1254734edt.25.2021.08.17.08.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 08:36:41 -0700 (PDT)
Date: Tue, 17 Aug 2021 17:36:39 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
Message-ID: <20210817153639.o5fxdgmuhjusvyhq@gator.home>
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
 <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
 <20210812091650.i5np3szvdoelu2cx@gator.home>
 <20210812092517.mwcfhksoe4cgy3cl@gator.home>
 <TYCPR01MB6160B0A6E08CAE7CB2C6D8F0E9FE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <20210817115635.d2wxvnvis5kupegh@gator.home>
 <667f9384-cd28-8e4d-ebd1-4ed4b651676a@linaro.org>
MIME-Version: 1.0
In-Reply-To: <667f9384-cd28-8e4d-ebd1-4ed4b651676a@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 17, 2021 at 05:23:17AM -1000, Richard Henderson wrote:
> On 8/17/21 1:56 AM, Andrew Jones wrote:
> > I guess it's fine. You could easily create a new cpu_arm_set_sve_vq()
> > which would forbid changing the properties if you wanted to, but then
> > we need to answer Peter's question in order to see if there's a
> > precedent for that type of property.
> 
> I don't see the point in read-only properties.  If the user wants to set
> non-standard values on the command-line, let them.  What is most important
> is getting the correct default from '-cpu a64fx'.
>

So maybe we should just go ahead and add all sve* properties, but then
make sure the default vq map is correct.

Thanks,
drew


