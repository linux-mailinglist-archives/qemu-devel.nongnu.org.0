Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705C82C89C7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 17:42:18 +0100 (CET)
Received: from localhost ([::1]:50012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjmFl-0006z3-1M
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 11:42:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kjmEG-0006F0-SV
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:40:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kjmEF-0003MQ-4D
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606754442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xWrerGzW9vFb22q3mPBOk3dhBRuTvnT68QYW1Ys2s40=;
 b=I4bmIb38ZxMjzJxOIlBQA9tcJIO0NQs5Q73p9qKcu6buM2ceHGpGaoZ9InLVMz9yGzjz7C
 zNT0PFjbn+5nmMvddfah+OPPK9OHFTkgYmHuH5CYTXpX4pUq4D23v+xJMwSF5viGjfittJ
 4OzYjdO99sVuav4OAF1itpVy88FIXkE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-nv-M0bQXPPCCa8a_9r_gzg-1; Mon, 30 Nov 2020 11:40:40 -0500
X-MC-Unique: nv-M0bQXPPCCa8a_9r_gzg-1
Received: by mail-qt1-f200.google.com with SMTP id t22so8748106qtq.2
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 08:40:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xWrerGzW9vFb22q3mPBOk3dhBRuTvnT68QYW1Ys2s40=;
 b=atdFVcA+SRWB2R0yhUAPOE1KWY3E0blDOmq91v/CoZDRla3vJQGaOr9czpkwQnUUOn
 Ubj9ISxqrOCIvLBw5XRLyNKfdACy+Wc63bCn1zRuKG1uZ1tcZ86HFbMqJqRr3BN6HvbE
 oI021VKio1dajMjbnwXDhKjcxfJ4+pcvTM9J0ipHoDI4c9FwZx0thBSIb90tB4bHF2rQ
 NZUFqneP5gxP+o5A62lI9N+sau4yY8Psh7W7V/5+Rm8S5iNZZVZekuKqYxWmL/wg5ioo
 Lp5kM38OLTyR0tCGtXYgYJ1WtofZhpPwXFNotIfbHmNWoYAIUmHUTpir+yanOjSROW/r
 D1Tg==
X-Gm-Message-State: AOAM531UOAv+dPKRHIH2eLRLRaDjYX6CQssG25OES1fDZuCA2qG9NrOc
 O1+1bMCxftB20qHxkahEOPO//3BOnKHCEgiFRMo3hhCatf/O/ItjmyWpCw99VAwOl4xL7HwN/PD
 /l9R2q5gWwoX7yt4=
X-Received: by 2002:a37:5444:: with SMTP id i65mr11753081qkb.263.1606754439685; 
 Mon, 30 Nov 2020 08:40:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7wEjD/Xb9wWbVZU7KSI2knr+CUIykjkBAl2p2+T4k3nzj6JK79uumgFNfYJGDQldO010nAQ==
X-Received: by 2002:a37:5444:: with SMTP id i65mr11753060qkb.263.1606754439433; 
 Mon, 30 Nov 2020 08:40:39 -0800 (PST)
Received: from xz-x1 ([142.126.81.247])
 by smtp.gmail.com with ESMTPSA id b3sm15476458qte.85.2020.11.30.08.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 08:40:38 -0800 (PST)
Date: Mon, 30 Nov 2020 11:40:37 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v4 6/6] introduce simple linear scan rate limiting
 mechanism
Message-ID: <20201130164037.GC3277@xz-x1>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126151734.743849-7-andrey.gruzdev@virtuozzo.com>
 <20201127222811.GJ6573@xz-x1>
 <ab27e287-b737-25a7-cfed-2d70e0042537@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <ab27e287-b737-25a7-cfed-2d70e0042537@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 30, 2020 at 11:11:00AM +0300, Andrey Gruzdev wrote:
> On 28.11.2020 01:28, Peter Xu wrote:
> > On Thu, Nov 26, 2020 at 06:17:34PM +0300, Andrey Gruzdev wrote:
> > > Since reading UFFD events and saving paged data are performed
> > > from the same thread, write fault latencies are sensitive to
> > > migration stream stalls. Limiting total page saving rate is a
> > > method to reduce amount of noticiable fault resolution latencies.
> > > 
> > > Migration bandwidth limiting is achieved via noticing cases of
> > > out-of-threshold write fault latencies and temporarily disabling
> > > (strictly speaking, severely throttling) saving non-faulting pages.
> > 
> > So have you done any measurements out of it, as we've talked in previous
> > version?  Thanks,
> > 
> 
> Sorry, not done yet.

So do you still plan to? :)

And if not, could you describe the rational behind this patch?  For example,
what's the problem behind (e.g., guest hangs for xxx seconds, maybe?) and
what's the outcome (guest doesn't hang any more)?

Thanks,

-- 
Peter Xu


