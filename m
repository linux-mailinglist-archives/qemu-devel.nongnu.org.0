Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE3964DC6E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:45:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5oXe-0005EN-I5; Thu, 15 Dec 2022 08:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1p5oXc-0005E1-J2
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:44:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1p5oXa-0002IZ-Dx
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671111889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I8Nuf00vbQv9q4bGdvu14hDYoWXvvltyRVjALxB1XF8=;
 b=ZJDFIS3tNexJASpe1mPkaSu6iJbxuVaskW5dx8qaFMwELujQ9Mox/21J3PXVJLf6EiGfv2
 0Wc5D/4QEYeo/Cm6Fb8wCYA9jJ96cNWNE/0qmgBgUvpmN1vILl/0R/5YsZIS7jdeE9tPSE
 GNvZRD0ip6m3eyeIHhTTLMtbxHOAB8c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-489-DwHjiPx-OzmDlBrR328VGg-1; Thu, 15 Dec 2022 08:44:48 -0500
X-MC-Unique: DwHjiPx-OzmDlBrR328VGg-1
Received: by mail-wr1-f70.google.com with SMTP id
 j29-20020adfb31d000000b0024237066261so657064wrd.14
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 05:44:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I8Nuf00vbQv9q4bGdvu14hDYoWXvvltyRVjALxB1XF8=;
 b=TPijL6p1Ito+Btqm7fOzeMxuy6le7kGUFqiP8QQ08PfWPaphdQpofBIEq4kobGSJaG
 PRHHZBJIg7INDjeo5WU/uiL6/eAIThdrp6JXw2xxlPqvST/RLkwhUJEXSk0hzdgqmHUL
 /lJe2tuPHLhgG4i0utPBzkb22lYkT6qyOiQoNXI1HBYWZY0SENlgm6787vWKm5mHIwN4
 8VOlRf8y8F1oSCLtwbXxcP6X/5ILLhlfr8HHQphvHY8eRwFjrjhWGRvuBttXXmXlvzP8
 z/v68CHD9W6aJcbcjDP96EnwYCDIcbOMqOYzcbZ1qD36RVYwoKJWVS/sqdjN8bHnhfKK
 rHog==
X-Gm-Message-State: ANoB5pkv4T6bnencnehfhc5mdBVL7Mdko3vbxIPRiws6xOT3UfKzODOy
 HpuipRQEuLSLT+Is03eLfTm0XaW5bdc97uFBAXhidK9nI6Cq596rLCtwR0WiS0rg8ai+cbLCHse
 zO4osO5YQyohNJhA=
X-Received: by 2002:a05:600c:5406:b0:3cf:803b:d7cc with SMTP id
 he6-20020a05600c540600b003cf803bd7ccmr9945148wmb.33.1671111886768; 
 Thu, 15 Dec 2022 05:44:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6u9XLRQeBS4UnkfGM6zQkSPH9wMRKT2NMTVuP+L/o2Yb3KpdXNuAiXSv9sNgeKElUzMZ5m2g==
X-Received: by 2002:a05:600c:5406:b0:3cf:803b:d7cc with SMTP id
 he6-20020a05600c540600b003cf803bd7ccmr9945132wmb.33.1671111886547; 
 Thu, 15 Dec 2022 05:44:46 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 f127-20020a1c3885000000b003b3307fb98fsm6245171wma.24.2022.12.15.05.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 05:44:46 -0800 (PST)
Date: Thu, 15 Dec 2022 13:44:43 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: migration qtest failure: "query-migrate shows failed migration:
 Unable to write to socket: Broken pipe"
Message-ID: <Y5sky/DfG1Dh/TVg@work-vm>
References: <CAFEAcA8x_iM3hN2-P9F+huXnXFXy+D6FzE+Leq4erLdg7zkVGw@mail.gmail.com>
 <Y5sHtDP4vyEjhIan@work-vm>
 <CAFEAcA-PHqcGYMDj9OXKdY40Hb_rHCM9eeuh1rSnFL5-SyTfhg@mail.gmail.com>
 <Y5sYlkZ6q4/B7B2v@work-vm>
 <CAFEAcA-yqYbjc_BVjQenTfS2_Bwo6OhtbQtwJb36aYgiocm+0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-yqYbjc_BVjQenTfS2_Bwo6OhtbQtwJb36aYgiocm+0Q@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 15 Dec 2022 at 12:52, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > It doesn't seem to repro running manually, my guess is that
> > > it happens because the machine is heavily loaded doing the
> > > whole build-and-test cycle.
> >
> > Yeh; I think we'll still need a backtrace or better qmp log though to
> > figure it out.
> 
> Unfortunately, often all you get is "what does 'make check' output".
> Is there a way we can improve the test so it outputs something
> more useful when it detects a failure ?

I can't think how to improve the test itself like that; could you bind
assertion failures to call/print a backtrace:

https://developer.apple.com/library/archive/documentation/System/Conceptual/ManPages_iPhoneOS/man3/backtrace.3.html

?

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


