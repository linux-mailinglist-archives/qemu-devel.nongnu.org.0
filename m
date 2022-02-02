Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642064A7007
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 12:34:55 +0100 (CET)
Received: from localhost ([::1]:52780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFDuX-0006Np-UU
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 06:34:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFDsH-0004vW-Go
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 06:32:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFDsE-0002oj-G5
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 06:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643801544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C7usKTkwTBXOc64N998T8Yc5RIUMsi2DSTETpWfo9ZU=;
 b=Gwxg+SyefpK4dnrc9BL/2Hr/22fLlvnLwjPt4PwDj5kHIDHfo7+06WFqpgxv33FufSA9Tt
 4OG+Qk8+itEYVT0ouQX39sAiQhlWFV88x77dtlhfIMZA7kJAdhTqdWNZhwcGs3jP1dsxtc
 zs8cmg25Y2JJnrBD/CmBNqr0loGxVaM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-EYtWwbtWO4aCYzfDy8MhEg-1; Wed, 02 Feb 2022 06:32:18 -0500
X-MC-Unique: EYtWwbtWO4aCYzfDy8MhEg-1
Received: by mail-wr1-f69.google.com with SMTP id
 c9-20020adfa709000000b001dde29c3202so6771277wrd.22
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 03:32:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=C7usKTkwTBXOc64N998T8Yc5RIUMsi2DSTETpWfo9ZU=;
 b=5TZyaSn7xu4AmJySpyPC9DDjie/XMqLZAKT7WozmAOi32YtRPmj7s7pXUaVmsYsSW1
 zM0WJAwIGY5r9l4jphqVwzaKzVR0pFhmPTl5Y0at70Ymk6+IYl1OTfKXoUy2YRqrYc94
 wK51H9ft7Q9aiaS6gK1lXEZ4VW3McDWhgT4xo9MkM8q/rbVDGe7yy483psG2n8Nph4Wr
 UZ9iY8sfe22u9+2bfNi+02ZqQA7luDHYELc5NTU83jM3KOEajp/imKt/VS6bKuAPjo7+
 pnQ2ODFOa1nHkffNW184qMtLyi78WDIF2gTYGpAvP2UulJRTXhkc+QiDEkGVHIUZuNl3
 NuHg==
X-Gm-Message-State: AOAM532xxbBBImZwZ81On/OT1coHatiKYN3dAeM81vPoRwWWUKjG/Fqq
 fEOccuilJJBiGiNs8ldT2dbfk9UL/4vxeDmGYeLn0b7CiAlPJpUCWwguYlTP/5IAbo/OIIao155
 8S1nYdDFCujgxxts=
X-Received: by 2002:a05:6000:184a:: with SMTP id
 c10mr24889887wri.212.1643801537068; 
 Wed, 02 Feb 2022 03:32:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztLSy8RarP+XazJVOJ4xgrkY/Wp+dvnwyb/XZ74wn/Z6i37V60lp/Hxsfe9z6dA1sZ5R4Y9A==
X-Received: by 2002:a05:6000:184a:: with SMTP id
 c10mr24889872wri.212.1643801536897; 
 Wed, 02 Feb 2022 03:32:16 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id t17sm16879884wrs.10.2022.02.02.03.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 03:32:16 -0800 (PST)
Date: Wed, 2 Feb 2022 11:32:14 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 3/3] migration: Perform vmsd structure check during
 tests
Message-ID: <Yfprvld4Y/GoJbhh@work-vm>
References: <20220113194452.254011-1-dgilbert@redhat.com>
 <20220113194452.254011-4-dgilbert@redhat.com>
 <87ilu6nrqe.fsf@secure.mitica> <YfK+7LCJssDhie9O@work-vm>
 <87mtjc8el9.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87mtjc8el9.fsf@secure.mitica>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: peter.maydell@linaro.org, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 peterx@redhat.com, lsoaresp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > * Juan Quintela (quintela@redhat.com) wrote:
> >> "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> >> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >> >
> >> > Perform a check on vmsd structures during test runs in the hope
> >> > of catching any missing terminators and other simple screwups.
> >> >
> >> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >> 
> >> Reviewed-by: Juan Quintela <quintela@redhat.com>
> >> 
> >> queued.
> >
> > Careful; I think that'll break with slirp until libslirp gets updated
> > first.
> 
> As expected, it broke it.
> 
> I resend the PULL request wihtout that two patches.
> 
> Once that we are here, how it is that make check didn't catch this?

Because in my local world I did the changes to libslirp; I wanted to
make sure qemu people were happy with the changes before proposing them
to libslirp.

Which I've just done:

https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/112

Dave

> Later, Juan.
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


