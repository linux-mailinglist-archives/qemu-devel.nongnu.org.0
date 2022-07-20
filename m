Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5984057B2F5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 10:30:31 +0200 (CEST)
Received: from localhost ([::1]:45036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE56D-0000vD-5v
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 04:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE53k-0006z4-Ua
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 04:27:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE53h-0004HT-9E
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 04:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658305671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iiNecrtSRB45o9Esd6UzO2jA8aCspC4VO0e41JLgN64=;
 b=J1dg7cnFzqT16NmZE8R13Kh0MpLUzgGg2bM0vNsKXZnrSZPGispd01SgqbiBGP6gwgqjuj
 dCZ5VJdjN1UpJehtJxZRJt4EVEu12RO0nWhAdfA8kf4GJoxw/k5lkWX+4fHgb+TgfET6sh
 2MDN5SC+rRE09Mli295RyrhJtsyiN90=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-XF9fTY1ZOs6dMZLPwdtO3Q-1; Wed, 20 Jul 2022 04:27:50 -0400
X-MC-Unique: XF9fTY1ZOs6dMZLPwdtO3Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 i133-20020a1c3b8b000000b003a2fe4c345cso914338wma.0
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 01:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iiNecrtSRB45o9Esd6UzO2jA8aCspC4VO0e41JLgN64=;
 b=1U7hJfKRxw/tYAbRxc2AJLI5HjhPJciboh4eT1+Rf9cqUvR2FpBzcQ5VjrowpPNO0B
 tP8tqOGH539TsbPx2aRPzn27bTdJ9uNQoCTf5dzFW+ZCxXzNAFtuKZN3KjIDa6A7KkYq
 dZ8aXXtrXTR+xVeQ+0clUKAueEiAhNVoZZGHJdKQNmdMdrysYo1IkcJm5Of1ZbuyjGfO
 LZIz/t1LKNZxGcnGjE9TwZdIxu8VbxnexZL5IYoa1ylSTGar1qvOVsHk8sFqh2B3oAWl
 YhFIqUGZEBPzXT6Ug+juJI//fyy9nPIFPgypag9CoTN2C08gOZOIMxtfy0OI3gZriFRP
 BrFw==
X-Gm-Message-State: AJIora8cn2kzI/i/t6rYYXrV6D3w6vFqYzQyxwO0YA7q11lprr2N/uQe
 mMLILf74v7DUByWD/+UM7HNpTcIct7HOOAPZawo/kBrXkAx68StGlQjf3GFJyHzMO08hEyYco8M
 rN3/P4QSDevINA6I=
X-Received: by 2002:a05:600c:a4c:b0:39c:34d0:fd25 with SMTP id
 c12-20020a05600c0a4c00b0039c34d0fd25mr2822454wmq.172.1658305669564; 
 Wed, 20 Jul 2022 01:27:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s2O5EHekVh5Yapay8tBUczdNaW7BKe1JY9KRBRglbkyvC5eW05ka0o/sCw7ubaATmxQmiSxQ==
X-Received: by 2002:a05:600c:a4c:b0:39c:34d0:fd25 with SMTP id
 c12-20020a05600c0a4c00b0039c34d0fd25mr2822436wmq.172.1658305669315; 
 Wed, 20 Jul 2022 01:27:49 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c3b8900b003a2d47d3051sm1899146wms.41.2022.07.20.01.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 01:27:48 -0700 (PDT)
Date: Wed, 20 Jul 2022 09:27:46 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com,
 huangy81@chinatelecom.cn
Subject: Re: [PULL 00/29] migration queue
Message-ID: <Yte8gul3iMEjG6e+@work-vm>
References: <20220719170221.576190-1-dgilbert@redhat.com>
 <CAFEAcA9p_ngOFU6pvEXkQTNirf8Ub-pQ47+dsah-XQDrrAW6iw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9p_ngOFU6pvEXkQTNirf8Ub-pQ47+dsah-XQDrrAW6iw@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Tue, 19 Jul 2022 at 18:16, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
> >
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > The following changes since commit da7da9d5e608200ecc0749ff37be246e9cd3314f:
> >
> >   Merge tag 'pull-request-2022-07-19' of https://gitlab.com/thuth/qemu into staging (2022-07-19 13:05:06 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220719c
> >
> > for you to fetch changes up to ec0345c1000b3a57b557da4c2e3f2114dd23903a:
> >
> >   migration: Avoid false-positive on non-supported scenarios for zero-copy-send (2022-07-19 17:33:22 +0100)
> >
> > ----------------------------------------------------------------
> > Migration pull 2022-07-19
> >
> >   Hyman's dirty page rate limit set
> >   Ilya's fix for zlib vs migration
> 
> I'm processing this pullreq, but while I think about it: once
> we've got this fix in can we revert the workarounds we put in
> our CI configs to set DFLTCC? (ie commit 309df6acb29346f)

Good idea, patch coming up, if someone can ack it quickly I'll get it in
with the fix for those build problems.

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


