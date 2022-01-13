Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABBC48D750
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 13:16:40 +0100 (CET)
Received: from localhost ([::1]:45838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7z1z-0003qf-L7
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 07:16:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7yvN-00056V-Ly
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 07:09:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7yvK-0007iF-GX
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 07:09:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642075785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pw8lqMyzu6+uBoh/vQ7jlYJOvD6beBek+T+IVuD8Zoo=;
 b=QgjbS63yFf243g55H6fv9jGMpejISGq9BhfXbg4iKCjAPL1tDza79IyPsNsAywCqxcKiRC
 mTCa/KZdzwW5EhZhWfTrKRKC7KdWPRBbfXxPBof47mi3N8XVHrTyYERRrek4sZlgb/zl5R
 ZhzDkXopF+EHxzdjbQFLQ0ta4LHmTOA=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-FMhjmtvDPCmJSY06ExV9BQ-1; Thu, 13 Jan 2022 07:09:44 -0500
X-MC-Unique: FMhjmtvDPCmJSY06ExV9BQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 u13-20020a17090a450d00b001b1e6726fccso10441933pjg.0
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 04:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pw8lqMyzu6+uBoh/vQ7jlYJOvD6beBek+T+IVuD8Zoo=;
 b=37VlBIKOlOtNXN32yI9Zz6EUSWF9mRnieHkfKtYgKPOz8iFZGrJXviA0rl6WfTatCt
 KW43DZhLrsnLgjGFT1qFIEJPBxNCy9Tzy+Pp0Py1VIhnfdAaLZzfKDXT1ZYdYNDHBTE9
 cGWMm2z9/J6rXozo7U8BWhC0P3joz+gcX1ovu9B76bFNcQJzzy/6Lzxb8EyFhXaNPlIR
 hn18mxXIdfT1eOFIkc+vBekVSZjnE6VGAccFgcwPmgVkBcIsklY5K8ZZDwYx6KLiiuJF
 Um938p3ydxfvKtEh49eueFT7OCEBedzluDdKi9YBu7Z9Oz82D2nhv13bzoUuwhc0bZf3
 vyUQ==
X-Gm-Message-State: AOAM533AMHAUBpwrkCknQwYsMkIcP4O/zQKewAXXy+HSCCucW8+KY/ZF
 WuoQpsai2E779D/NISofwrKuM8NJFSOcktZ9mk/PlguK/5kr5RlDW5Ji9VrRYDzM+8rUSmVJyYs
 pQYvuldW97hzA/Vo=
X-Received: by 2002:a17:90b:4f46:: with SMTP id
 pj6mr4840505pjb.166.1642075783144; 
 Thu, 13 Jan 2022 04:09:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzoFXVXa/O8p7eX5UBwUytczNze8dEL/Y6z5jTtD6wajKhq75QUFAY9oS8RCKAdNY+RBC5ACw==
X-Received: by 2002:a17:90b:4f46:: with SMTP id
 pj6mr4840453pjb.166.1642075782515; 
 Thu, 13 Jan 2022 04:09:42 -0800 (PST)
Received: from xz-m1.local ([191.101.132.233])
 by smtp.gmail.com with ESMTPSA id go19sm8253810pjb.25.2022.01.13.04.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 04:09:41 -0800 (PST)
Date: Thu, 13 Jan 2022 20:09:37 +0800
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] migration: Add canary to VMSTATE_END_OF_LIST
Message-ID: <YeAWbetskblijhzo@xz-m1.local>
References: <20220112102345.79395-1-dgilbert@redhat.com>
 <CAFEAcA9b9NtkyWY2aCUpOvm2J5uRVt9qUPj6gPk3MFtkTh6ceQ@mail.gmail.com>
 <Yd6wrYdzzT/XsSSK@work-vm>
 <CAFEAcA_W9KoMiuBApJaPs9inOrWtjzr2F4L4qnnTxegvFwd_NA@mail.gmail.com>
 <Yd9+mPj6tldj3uwo@xz-m1.local>
 <CAFEAcA_weTMMNsFXc5HOQLG39y-F3XBrpcez7Ln9-ckChfO-qA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_weTMMNsFXc5HOQLG39y-F3XBrpcez7Ln9-ckChfO-qA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
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
Cc: quintela@redhat.com, marcandre.lureau@gmail.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, lsoaresp@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 11:00:20AM +0000, Peter Maydell wrote:
> On Thu, 13 Jan 2022 at 01:21, Peter Xu <peterx@redhat.com> wrote:
> >
> > On Wed, Jan 12, 2022 at 10:56:07AM +0000, Peter Maydell wrote:
> > > We could have vmstate_register_with_alias_id() iterate through
> > > and assert presence of the right terminator (probably only if
> > > qtest enabled, or some other suitable condition). Then the
> > > existing tests that do the basic "check we can instantiate every
> > > device and initialize every board model" would run that code
> > > and catch most missing terminator cases, I think.
> >
> > Agreed.  How about assert it even without qtest?  We do tons of assertion for
> > programming errors anyway in QEMU.
> 
> I don't inherently object, but in this case to do the assertion
> we'd need to do a scan over the fields arrays which we wouldn't
> otherwise need to, so the cost of the assert is not simply
> the compare-and-branch but also the loop over the array. If
> that's not significant in terms of start-up time costs we can
> just go ahead and do it (which would be nicer for debugging
> and making it really obvious to people writing new devices)
> but my remark above was a gesture towards "maybe we need to
> not do it for normal startup"..

Hmm.. Then how about put it into a "#ifdef CONFIG_DEBUG"?

We may need some extra lines in configure, though:

if test "$debug" = "yes"; then
  echo "CONFIG_DEBUG=y" >> $config_host_mak
fi

PS: I'm a bit surprised we don't have CONFIG_DEBUG already..

Thanks,

-- 
Peter Xu


