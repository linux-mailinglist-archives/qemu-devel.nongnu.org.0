Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2F350A50D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:13:24 +0200 (CEST)
Received: from localhost ([::1]:38102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZQp-0000qO-QF
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhYbW-000270-I6
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:20:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhYbT-0006ml-Pl
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650554418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jthp+31N4/Lo795uWL4TQXB5hLE7bkLyAI8fzkswcU4=;
 b=XgYWoybW1CiyIion0JWgt/dplsR61y1HYKNYErTF+dUk1IrDjQkPSjQMndzsZe8+B45duG
 8S1MfwG004fAEr4e5lellO0f1k+zSrObt1tP2Jwp7E1/USuqrnwSKMvavVM0yvobwFBoY/
 fwrfYOCOJ1OAOrU9/192IcKc8eT8ZC4=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-MVfeMtE6NICsbGBw39Mq8g-1; Thu, 21 Apr 2022 11:20:17 -0400
X-MC-Unique: MVfeMtE6NICsbGBw39Mq8g-1
Received: by mail-il1-f199.google.com with SMTP id
 l2-20020a056e0212e200b002cc235e7488so2774905iln.21
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jthp+31N4/Lo795uWL4TQXB5hLE7bkLyAI8fzkswcU4=;
 b=j+nLd55m9wvMUGhRswDRYrC4TY06YzUAY56JvTWxwuMxMFpGqbLAGxMWcZ6WivJu1G
 nynw+CdqywfFd/JGiBTfTXVmoX/N8v09o+NJ2JTwMnv6f+dtgyIbJJCZfxM58QVzHqcj
 ApNtkoZRT0A6Qi4mOqV+vDiOMvGUIl9OBe55ECiIPwOtmHzaaUVS7TP1C0NPGtHQIeTD
 CnUg+ZsK3j0rRPFxvZt2SRb8EDEn5W3K1Lr2acd7uASOUPSnjxDOCo4/zEXzmlS56bHn
 wn4I4a/7PA5WuS5RzUzGI+KdoSqx3aOgWLQY1AttT8QnpyKNe3tT10oyEli01RMq0/VL
 SAMw==
X-Gm-Message-State: AOAM5324WuER+R+V+NYqVineRk+hXjuL0kKQyi/YdufZhU3mV6ln3AZ5
 zZRcuvmYsElUsCBf2fvfFBRgl2dCfyLdTImGdjEDAKrvmVL3QBgKbyAQsteZNlKszRgSadWHjge
 8aTkAGB9BMqyd10c=
X-Received: by 2002:a02:956a:0:b0:321:5581:220d with SMTP id
 y97-20020a02956a000000b003215581220dmr26185jah.231.1650554416547; 
 Thu, 21 Apr 2022 08:20:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyG2b0N//63vXaKUhDOjF+fzTcPkNaI8+vdwjNzj0FflNFQY0Se6j8mZ/Ewv8iUbvxKPdzJKg==
X-Received: by 2002:a02:956a:0:b0:321:5581:220d with SMTP id
 y97-20020a02956a000000b003215581220dmr26171jah.231.1650554416197; 
 Thu, 21 Apr 2022 08:20:16 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056e020cc800b002cbe990b4c1sm11847981ilj.75.2022.04.21.08.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:20:15 -0700 (PDT)
Date: Thu, 21 Apr 2022 11:20:14 -0400
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: introducing vrc :)
Message-ID: <YmF2LtN61bfvZJgz@xz-m1.local>
References: <dd5a574f-a475-a704-a827-03a014f5a586@redhat.com>
 <YmBNDddW4ODveOkZ@xz-m1.local>
 <aa3038c8-cda8-4707-ee78-63c389ed0cf5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aa3038c8-cda8-4707-ee78-63c389ed0cf5@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 21, 2022 at 05:04:52PM +0200, Paolo Bonzini wrote:
> On 4/20/22 20:12, Peter Xu wrote:
> > > a while ago I looked at tools that could be used too build a call graph.
> > > The simplest but most effective that I found was a small Perl program
> > > (called "egypt", which is rot13 for "rtlcg" aka RTL call graph) that used
> > > the GCC dumps to build the graph.
> > 
> > Do you have any plan to put it into some git repository?
> 
> Good idea, it's now at https://github.com/bonzini/vrc.
> 
> It can be installed using "pip install --user ." after checking out the
> repository.

Looks great.  Another trivial request is whether you'd like to add a
sentence to the 1st paragraph of README.md on showing why it's named "vrc"?

I'm just curious :-D

Thanks again!

-- 
Peter Xu


