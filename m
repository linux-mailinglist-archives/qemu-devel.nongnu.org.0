Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898CB50D576
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 23:58:08 +0200 (CEST)
Received: from localhost ([::1]:41974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikF4-0003tz-Vl
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 17:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nikCV-0002ye-8Q
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 17:55:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nikCR-0000Qx-Us
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 17:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650837322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zI4twzW85N9REhSnLYvLOQU6YwhUM+ZOOApUrn5a1sI=;
 b=cmtdz7+FWvPR7XpnfRoYvmchHbINlh7xHOI5Uy5mcTMQ4izwgZEvfOi1VZZ44QD8DEtn6o
 4P0iEfqeT4n8HS5cW8gzv//Zk8YUbpIeyvKjl8pbXIdO8B16+v43KLg8d0ZaIeWwsgBflC
 vHYHxqSuq50WCgoMIjl7BOVg52MYkZo=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-JeUnO6MtPCmhjXJpT9h1UQ-1; Sun, 24 Apr 2022 17:55:20 -0400
X-MC-Unique: JeUnO6MtPCmhjXJpT9h1UQ-1
Received: by mail-io1-f71.google.com with SMTP id
 h10-20020a05660224ca00b0064c77aa4477so10231883ioe.17
 for <qemu-devel@nongnu.org>; Sun, 24 Apr 2022 14:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zI4twzW85N9REhSnLYvLOQU6YwhUM+ZOOApUrn5a1sI=;
 b=TO8k8SeOmZxSB1wRFknyyQJfz57F+Secfea6uv56zsWIAOzAmiXSmtRSzxsK4e01jj
 2ex5aA8QolWnMyrQyUj0rW4qV3ZrHd3aIG58Qu7irWlSuZJQxwZBeA9la8EBnQk+4h96
 jtUbfdGRcnrbUa4COeFlC/aVAvad2CeFGs3TuFUKHTcrpfXPQV3ak6w9jeskVmmzl8MZ
 igo/NE7zc2DML9xwo34oTWMt+OHuEQDktQZeBfiPvY/F83DYU580uXjej7BwvC8318ec
 YiejlUUwnpA2RMXWnpcK4Ob015iJl5gQWTBShYNq2rZ8hFa7gYIyX9Ji6MftsoRSl7aw
 2T2w==
X-Gm-Message-State: AOAM530mK8YfcgvyLAREgYckKVAU+xnr1Znoh5oOB6nOCTxsgE3fSr2e
 QFALdU75XJ7571JYwGKCK/dxzGXK7CGh/ibPAVsCT8VA4mv5v7gpa9+l/ksk37uzVw4fyQXlzA7
 M88OBPCyw/2TWVDU=
X-Received: by 2002:a5d:9318:0:b0:649:a18:dab8 with SMTP id
 l24-20020a5d9318000000b006490a18dab8mr6259236ion.96.1650837319982; 
 Sun, 24 Apr 2022 14:55:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwl8PWR39HooI6gVYMPgkiJLyAFopdU+qG2cdrZPm4CjGRrdx33nkNyW/AGKjBFYCcVXXxBXQ==
X-Received: by 2002:a5d:9318:0:b0:649:a18:dab8 with SMTP id
 l24-20020a5d9318000000b006490a18dab8mr6259223ion.96.1650837319742; 
 Sun, 24 Apr 2022 14:55:19 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 p184-20020a6b8dc1000000b00650b95043e8sm6181280iod.33.2022.04.24.14.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 14:55:19 -0700 (PDT)
Date: Sun, 24 Apr 2022 17:55:18 -0400
From: Peter Xu <peterx@redhat.com>
To: Hyman <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v22 0/8] support dirty restraint on vCPU
Message-ID: <YmXHRrZZA21Sxfv7@xz-m1.local>
References: <cover.1648748793.git.huangy81@chinatelecom.cn>
 <fb74d6af-49e7-ffd9-6bb0-66acb7407c8c@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fb74d6af-49e7-ffd9-6bb0-66acb7407c8c@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Yong,

On Mon, Apr 25, 2022 at 12:52:45AM +0800, Hyman wrote:
> Ping.
>  Hi, David and Peter, how do you think this patchset?
>  Is it suitable for queueing ? or is there still something need to be done ?

It keeps looking good to me in general, let's see whether the maintainers
have any comments.  Thanks,

-- 
Peter Xu


