Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4C456509C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:21:41 +0200 (CEST)
Received: from localhost ([::1]:44442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8IGy-0000JL-T9
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8IFS-0007VS-N4
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:20:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8IFC-0002po-Qw
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:20:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656926389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F4ypiTir8M/1lp88U6IE6FosVdPrWME5Vwb6HtqB+78=;
 b=d+TBp0SwX/MtfMrO3XWJtY/PFCmD+THOI9LDRHwpUoWriJG6zhczGxi5Yuo9vfH11FC5Y9
 SX2Hy6Bp9Dr/B4gKb9/6nKND8Fkg9OKvaRiE3QXqvkfCGzigDuMOsttDRXxJui281V6+PV
 YAvqgonPRKnbbHUGAHRR/ao8a8YYRfk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-mqqkaQChOr6Jh_PU0nckBw-1; Mon, 04 Jul 2022 05:19:47 -0400
X-MC-Unique: mqqkaQChOr6Jh_PU0nckBw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so5074712wmj.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=F4ypiTir8M/1lp88U6IE6FosVdPrWME5Vwb6HtqB+78=;
 b=4ZReyS22b5Y3W6JXFiVOzbyTMCXyJHnJh/3Pe/AN5+EgpPJR5iJpDXFUMPpZJqUVTb
 DQdFbWeqW4JT5omCQcNgYp1hwCaCZsFaw7mpa07/A/GS0X9thsY2X7qWDkWD+WL0uvmc
 eIv/fvrq/0ceixsJP/gh5aoQM8x+IyTe2fcmUKad9T3xikF+faYWyBIwqB+k+ZCVZN6y
 yDQ8RRy/XWQNobKXsmN7ggq4nChBLXHPuZ22JS8CxShuUcPZ6SLxiMSeVAzPKqrSJIiB
 5ZpSbwbDnxPZeuiX6/owTIKwFW/15DRh2yUuL5Z7XL0STnTaAqZSQ7GxdoOz7Gp0JRPK
 jXIA==
X-Gm-Message-State: AJIora9a71kQ7lKm3jL0escmUYakWSI13ilkqpEcflsLv4vQignpBpSu
 gm36KQ+y5j4C73IW6WVHjzygOduax2gd5y8opVrjHlpDiHu/zxAX/0PgCwyM+3A4X/MsShhzhVW
 DfVhQKeocsUU17bs=
X-Received: by 2002:a05:600c:1549:b0:3a1:6f35:c431 with SMTP id
 f9-20020a05600c154900b003a16f35c431mr28415892wmg.74.1656926386653; 
 Mon, 04 Jul 2022 02:19:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1szaSo+zOr0spSq8KC4HBD6NfEX1BrVHQNf2V26PjClao1V2BAjkypGEV3cbzW89MjppyA5nQ==
X-Received: by 2002:a05:600c:1549:b0:3a1:6f35:c431 with SMTP id
 f9-20020a05600c154900b003a16f35c431mr28415863wmg.74.1656926386380; 
 Mon, 04 Jul 2022 02:19:46 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o4-20020a5d6484000000b0020d02262664sm29403313wri.25.2022.07.04.02.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:19:45 -0700 (PDT)
Date: Mon, 4 Jul 2022 10:19:43 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 2/2] migration/multifd: Warn user when zerocopy not
 working
Message-ID: <YsKwrz8t6VgKhm4V@work-vm>
References: <20220628010908.390564-1-leobras@redhat.com>
 <20220628010908.390564-3-leobras@redhat.com>
 <YrqzhFAePnnEl8A8@redhat.com>
 <CAJ6HWG5UGpgBqK-7OTA6Gxu0LKMfGq5gVvYffOaSMWO1bfyjVw@mail.gmail.com>
 <Yrr77NfKtKcXTVCr@redhat.com> <YrsHgWbhifokl6yL@work-vm>
 <CAJ6HWG7hXNzuJ8rKc0NzLC_GguEOtVxGGUz8gDqizyZUy=Yieg@mail.gmail.com>
 <Yrsy2MzluKDvc5xK@work-vm>
 <66da1d2d1617c61012a515fc3104866ee5d49f69.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66da1d2d1617c61012a515fc3104866ee5d49f69.camel@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

* Leonardo Brás (leobras@redhat.com) wrote:
> On Tue, 2022-06-28 at 17:56 +0100, Dr. David Alan Gilbert wrote:
> > * Leonardo Bras Soares Passos (leobras@redhat.com) wrote:
> > > On Tue, Jun 28, 2022 at 10:52 AM Dr. David Alan Gilbert
> > > <dgilbert@redhat.com> wrote:
> > > > 
> > > > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > > > On Tue, Jun 28, 2022 at 09:32:04AM -0300, Leonardo Bras Soares Passos
> > > > > wrote:
> > > > > > On Tue, Jun 28, 2022 at 4:53 AM Daniel P. Berrangé
> > > > > > <berrange@redhat.com> wrote:
> > > > > > > 
> > > > > > > On Mon, Jun 27, 2022 at 10:09:09PM -0300, Leonardo Bras wrote:
> > > > > > > > Some errors, like the lack of Scatter-Gather support by the
> > > > > > > > network
> > > > > > > > interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to fail
> > > > > > > > on using
> > > > > > > > zero-copy, which causes it to fall back to the default copying
> > > > > > > > mechanism.
> > > > > > > 
> > > > > > > How common is this lack of SG support ? What NICs did you have that
> > > > > > > were affected ?
> > > > > > 
> > > > > > I am not aware of any NIC without SG available for testing, nor have
> > > > > > any idea on how common they are.
> > > > > > But since we can detect sendmsg() falling back to copying we should
> > > > > > warn the user if this ever happens.
> > > > > > 
> > > > > > There is also a case in IPv6 related to fragmentation that may cause
> > > > > > MSG_ZEROCOPY to fall back to the copying mechanism, so it's also
> > > > > > covered.
> > > > > > 
> > > > > > > 
> > > > > > > > After each full dirty-bitmap scan there should be a zero-copy
> > > > > > > > flush
> > > > > > > > happening, which checks for errors each of the previous calls to
> > > > > > > > sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-copy,
> > > > > > > > then
> > > > > > > > warn the user about it.
> > > > > > > > 
> > > > > > > > Since it happens once each full dirty-bitmap scan, even in worst
> > > > > > > > case
> > > > > > > > scenario it should not print a lot of warnings, and will allow
> > > > > > > > tracking
> > > > > > > > how many dirty-bitmap iterations were not able to use zero-copy
> > > > > > > > send.
> > > > > > > 
> > > > > > > For long running migrations which are not converging, or converging
> > > > > > > very slowly there could be 100's of passes.
> > > > > > > 
> > > > > > 
> > > > > > I could change it so it only warns once, if that is too much output.
> > > > > 
> > > > > Well I'm mostly wondering what we're expecting the user todo with this
> > > > > information.
> > > 
> > > 
> > > My rationale on that:
> > > - zero-copy-send is a feature that is supposed to improve send
> > > throughput by reducing cpu usage.
> > > - there is a chance the sendmsg(MSG_ZEROCOPY) fails to use zero-copy
> > > - if this happens, there will be a potential throughput decrease on
> > > sendmsg()
> > > - the user (or management app) need to know when zero-copy-send is
> > > degrading throughput, so it can be disabled
> > > - this is also important for performance testing, given it can be
> > > confusing having zero-copy-send improving throughput in some cases,
> > > and degrading in others, without any apparent reason why.
> > > 
> > > > > Generally a log file containing warnings ends up turning
> > > > > into a bug report. If we think it is important for users and/or mgmt
> > > > > apps to be aware of this info, then it might be better to actually
> > > > > put a field in the query-migrate stats to report if zero-copy is
> > > > > being honoured or not,
> > > > 
> > > > Yeh just a counter would work there I think.
> > > 
> > > The warning idea was totally due to my inexperience on this mgmt app
> > > interface, since I had no other idea on how to deal with that.
> > 
> > Yeh it's not too silly an idea!
> > The way some of these warning or stats get to us can be a bit random,
> > but sometimes can confuse things.
> > 
> > > I think having it in query-migrate is a much better idea than a
> > > warning, since it should be much easier to parse and disable
> > > zero-copy-send if desired.
> > > Even in my current qemu test script, it's much better having it in
> > > query-migrate.
> > > 
> > > > 
> > > > > and just have a trace point in this location
> > > > > instead.
> > > > 
> > > > Yeh.
> > > > 
> > > 
> > > Yeap, the counter idea seems great!
> > > Will it be always printed there, or only when zero-copy-send is enabled?
> > 
> > You could make it either if it's enabled or if it's none zero.
> > (I guess you want it to reset to 0 at the start of a new migration).
> > 
> > Dave
> 
> Thanks for this feedback!
> 
> I have everything already working, but I am struggling with a good property
> name. 
> 
> I am currently using zero_copy_copied (or zero-copy-copied in json), but it does
> not look like a good Migration stat name. 
> 
> Do you have any suggestion?

Shrug; I'm not going to fuss over the name too much as long as it's
reasonable. 'zero-copied' might be OK.

Dave

> Best regards,
> Leo
> 
> 
> > 
> > > 
> > > Best regards,
> > > Leo
> > > 
> > > > Dave
> > > > 
> > > > > With regards,
> > > > > Daniel
> > > > > --
> > > > > > : https://berrange.com      -o-   
> > > > > > https://www.flickr.com/photos/dberrange :|
> > > > > > : https://libvirt.org         -o-           
> > > > > > https://fstop138.berrange.com :|
> > > > > > : https://entangle-photo.org    -o-   
> > > > > > https://www.instagram.com/dberrange :|
> > > > > 
> > > > --
> > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > > > 
> > > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


