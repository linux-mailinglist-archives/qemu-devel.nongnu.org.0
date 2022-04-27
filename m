Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F44511C8D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 19:20:16 +0200 (CEST)
Received: from localhost ([::1]:59718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njlKp-0002oO-S4
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 13:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1njlHQ-0000Nl-Bt
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:16:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1njlHI-00007M-Gw
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651079794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2k9707UL+iKKzsGcgDO7S/9hFcHzY2gyBRAx84QGQUA=;
 b=UDs1XfMy+iCzEc3HJxYbho7NRMOE3Rcph2eZY/J1rH72J3WXNXrWuSpUOochp12/8Uq8Bu
 69duQdd9x55oFWTsEL45cRJiyUTdw3PAsQnLlJKQsRE08jsvJfdVR1jEv7We5s78fpBEXB
 Rh+RDjucHfip+O4IKQO1e2NwsT2RZyc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-jhES1l59Ot-ukIt64lGqMA-1; Wed, 27 Apr 2022 13:16:32 -0400
X-MC-Unique: jhES1l59Ot-ukIt64lGqMA-1
Received: by mail-wr1-f72.google.com with SMTP id
 n17-20020adfc611000000b0020a7e397ccaso952881wrg.23
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 10:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2k9707UL+iKKzsGcgDO7S/9hFcHzY2gyBRAx84QGQUA=;
 b=yfBnJ6d+pkfrHRq1IRvi/O6FIV9O08x6E+jbsszpns9tMSyZO+iaBc+nzx0sPmJX+9
 bMZaCr3xeSqZM71/O4ECNoLwHZUbRpSOWdIcCwpA1iQAMujFTSTg8qu/PzRGkRbrIGow
 Au/pNyNG5Hn+2rfpP/6CmizvaqqNVkBYEUHsNB2uOa7vtVGnLhxhxuEbxREl5dSWilSS
 hSj3kP8zeIxbeEfJFl3LwUWes2VUfydks/yTupnbR0sHWtRcaQ3q1bxFrkMSXcCmNUlo
 AT+uRatNcut/TP1LBNGz8amdpN5x3DB8h7pPsVJUBxFYDkC8lsqfxhBbvXt6TaHl1a0I
 G/5w==
X-Gm-Message-State: AOAM530rk7tFEYeDJ6HuffOf+mOfXoQmtDrJqF4/Jo8nhWsn2V+h/e9Z
 HnKxg9SJOIDGqdjOtwaHmhHKrpPPIjimyQRjlW9OGAXpZodARqx0apf7ReJqEPkVYi74AyK1xnf
 DJ0Ju5X0f88RMdZc=
X-Received: by 2002:a05:6000:10cc:b0:20a:de6f:3c48 with SMTP id
 b12-20020a05600010cc00b0020ade6f3c48mr11545874wrx.650.1651079791417; 
 Wed, 27 Apr 2022 10:16:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjx10MxmZJP1PEmRCSCMsEqUImhy41WmKOc49jDncfas7+uri3Cwnxz69zkeU5WJxIafDvxw==
X-Received: by 2002:a05:6000:10cc:b0:20a:de6f:3c48 with SMTP id
 b12-20020a05600010cc00b0020ade6f3c48mr11545859wrx.650.1651079791202; 
 Wed, 27 Apr 2022 10:16:31 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 v8-20020adfa1c8000000b0020ae711d27fsm4079599wrv.115.2022.04.27.10.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 10:16:30 -0700 (PDT)
Date: Wed, 27 Apr 2022 18:16:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 7/8] qmp: add filtering of statistics by name
Message-ID: <Yml6bAfSs+4eGtfj@work-vm>
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-8-pbonzini@redhat.com>
 <YmkwndPwSDxqqdZA@work-vm>
 <6655dcbe-860e-b107-e63e-ff397189d178@redhat.com>
 <Ymk4U4O4CN3e7+9A@work-vm>
 <2aed3f83-5941-d723-7c27-cc657f7c257a@redhat.com>
 <YmleMMNkZ8ukENDZ@work-vm>
 <cde483f2-28ee-88fb-921d-336186ff8222@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cde483f2-28ee-88fb-921d-336186ff8222@redhat.com>
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
> On 4/27/22 17:16, Dr. David Alan Gilbert wrote:
> > * Paolo Bonzini (pbonzini@redhat.com) wrote:
> > > On 4/27/22 14:34, Dr. David Alan Gilbert wrote:
> > > > If I specify a 'vm' it's not obvious to me whether I'd get NICs and
> > > > block devices in the future?
> > > 
> > > VM would not get those (it's global statistics), but the size could balloon
> > > if you specify no target at all.
> > > 
> > > > Adding a syntax for 'all' into the vcpus list would fix that?
> > > 
> > > I don't like having special syntax.  The current QAPI just doesn't filter
> > > what is not in the arguments.
> > 
> > Is there a object that represents the set of all vcpus?
> 
> No.

If it was easy to create one then you could remove all the special
casing of vCPUs/VM target?
(It feels really like you should call a 'stats' method on the target)

> > > Yes, those would have different providers.  But a single target can support
> > > multiple providers.
> > 
> > Is that just for different implementations - kvm/hcf/tcg etc or do you
> > envisage multiple providers on an object in a running VM?
> 
> I think multiple providers are possible for a single object, for example a
> device could expose both PCI (how many MSIs, etc.) and SCSI (how many
> commands sent/succeeded/failed) statistics.

Yeh fair enough.

Dave

> Paolo
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


