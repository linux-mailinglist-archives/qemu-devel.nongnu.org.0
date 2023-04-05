Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727646D8028
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 16:57:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk4ZA-0000bD-DP; Wed, 05 Apr 2023 10:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pk4Z6-0000b3-Gb
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:56:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pk4Z0-0007Gb-LR
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680706592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+UDc+gpqG6ZT8eH2OSPXKfLAsgQ4tvM6znTN47sGBos=;
 b=JDSsVywYf8UWO0PjFY/XfDvf1n1f9otsiVZLhGwSOsSUCX28dLJeeYACpmTjrGiq6onU+i
 V0wzfG9HY1PpGiWsEBDPFzDdpd9rGHPiFywXF0aOnsm6KIRdtvkUk4vylC/xXbNoULXtd5
 xCKL8+i4SNFkKSb9FbapW5tTmuV6fIU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-cwA-SJOSNjaUNiLoKGzuFA-1; Wed, 05 Apr 2023 10:56:31 -0400
X-MC-Unique: cwA-SJOSNjaUNiLoKGzuFA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l18-20020a05600c1d1200b003ef7b61e2fdso11606019wms.4
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 07:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680706589; x=1683298589;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+UDc+gpqG6ZT8eH2OSPXKfLAsgQ4tvM6znTN47sGBos=;
 b=iervqZcJ1ovBV5GLZN30uLTuOun/GgNQsYj8AxC4ZFn3ErmlbrUGR2Pff4lx1YYuo5
 l7d6813ekKuFwM+ed1Iseed5xdQDadAnKbRGH1RUQJCqKckhQL7bLvdtpozzErTi0VfW
 f2yFZP4R+neFicpD8tgp7yACh4If1WCdgLkFpHQbs5ztqq9dgdl/n5u/lC400jykjSSV
 p6xu6hU+rd8mtLyINTzcsCF8QNcNlVUZEn/hbmx09AQ8c+COE/Gp0QE/MdVdT35DhRsK
 +xKMahyTAjWEpW16JQuvFvUcuKBmwn4LS7XEKFbWMSUYa9pv72EDPRoq9pGvW6RwxRBW
 Hc/Q==
X-Gm-Message-State: AAQBX9dg2U27EhTpJE70jscaJrUxP0KnQYlgZghDeESwWZUSw7onrhmN
 ZIfj59HGe+kKx2zTdqRwuqstIo2g0Ts8n1hnT+QxY1UVEi9ErQkhLViusZdUNslGj3Y96R2nxgX
 2duUqf+WSAPVs3A4=
X-Received: by 2002:adf:d0ce:0:b0:2ce:ab0a:81fe with SMTP id
 z14-20020adfd0ce000000b002ceab0a81femr3778989wrh.62.1680706589500; 
 Wed, 05 Apr 2023 07:56:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350boICrWClRdC+LEbcQsf1Z233ElcKXjcItz9Jbscoc3sObLVQXUDioCOlioqdG0K9ksNUgmVQ==
X-Received: by 2002:adf:d0ce:0:b0:2ce:ab0a:81fe with SMTP id
 z14-20020adfd0ce000000b002ceab0a81femr3778973wrh.62.1680706589112; 
 Wed, 05 Apr 2023 07:56:29 -0700 (PDT)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a056000005000b002e116cbe24esm15159182wrx.32.2023.04.05.07.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 07:56:28 -0700 (PDT)
Date: Wed, 5 Apr 2023 15:56:26 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Laurent Vivier <laurent@vivier.eu>,
 Eric Blake <eblake@redhat.com>, dave@treblig.org
Subject: Re: [PATCH v2 10/10] hmp: Deprecate 'singlestep' member of StatusInfo
Message-ID: <ZC2MGswxJiBfhPR2@work-vm>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-11-peter.maydell@linaro.org>
 <87wn2s12bu.fsf@pond.sub.org>
 <CAFEAcA_v4yt1S+jjX2acyDLjb6OGTGOSLGxGUkH5XALKjBkHVQ@mail.gmail.com>
 <875yabzsmc.fsf@pond.sub.org>
 <CAFEAcA9owMUFkwy-CPC7i=ZFiqce=bzV9YJNFK9YQbh3oOAj1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9owMUFkwy-CPC7i=ZFiqce=bzV9YJNFK9YQbh3oOAj1w@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
> On Tue, 4 Apr 2023 at 14:25, Markus Armbruster <armbru@redhat.com> wrote:
> >
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> > > On Tue, 4 Apr 2023 at 09:25, Markus Armbruster <armbru@redhat.com> wrote:
> > >> Hmm.  We report it in query-status, which means it's relevant to QMP
> > >> clients.  We provide the command to control it only in HMP, which means
> > >> it's not relevant to QMP clients.
> > >>
> > >> Why is reading it relevant to QMP clients, but not writing?
> > >
> > > I suspect that neither is very relevant to QMP clients, but I
> > > thought we had a requirement that HMP interfaces went
> > > via QMP ones ?
> >
> > Kind of.  Here's my current boilerplate on the subject:
> >
> >     HMP commands without a QMP equivalent are okay if their
> >     functionality makes no sense in QMP, or is of use only for human
> >     users.
> >
> >     Example for "makes no sense in QMP": setting the current CPU,
> >     because a QMP monitor doesn't have a current CPU.
> >
> >     Examples for "is of use only for human users": HMP command "help",
> >     the integrated pocket calculator.
> >
> >     Debugging commands are kind of borderline.  Debugging is commonly a
> >     human activity, where HMP is just fine.  However, humans create
> >     tools to assist with their activities, and then QMP is useful.
> >     While I wouldn't encourage HMP-only for the debugging use case, I
> >     wouldn't veto it.
> >
> > When adding an HMP-only command, explain why it is HMP-only in the
> > commit message.
> >
> > >                If not, we could just make the HMP query
> > > interface directly look at the TCG property, the way the
> > > write interface does.
> >
> > How useful is it HMP?
> 
> Well, as usual, we have no idea if anybody really uses any feature.
> I've never used it myself but I have a vague recollection of reading
> list mail once from somebody who used it. You can construct theoretical
> scenarios where it might be nice (eg "boot guest OS quickly and then
> turn on the one-insn-per-tb mode once you get to the point of interest"),
> I guess. These theoretical scenarios are equally valid (or esoteric)
> whether you're trying to control QEMU via QMP or HMP.
> 
> I think on balance I would go for:
>  * remove (ie deprecate-and-drop) 'singlestep' from the QMP struct,
>    rather than merely renaming it
>  * if anybody comes along and says they want to do this via QMP,
>    implement Paolo's idea of putting the accelerator object
>    somewhere they can get at it and use qom-get/qom-set on it
>    [My guess is this is very unlikely: nobody's complained so
>    far that QMP doesn't permit setting 'singlestep'; and
>    wanting read without write seems even more marginal.]
>  * keep the HMP commands, but have both read and write directly
>    talk to the accel object. I favour splitting the 'read'
>    part out into its own 'info one-insn-per-tb', for consistency
>    (then 'info status' matches the QMP query-status)

If it's pretty obscure, then the qom-set/get is fine; as long
as there is a way to do it, then just make sure in the commit
message you say what the replacement command is.

Dave

> In particular, the fact that messing with this obscure debug
> functionality requires updating the reference-output for a
> bunch of io tests that have no interest at all in it rather
> suggests that even if we did want to expose this to QMP that
> the query-status command is the wrong place to do it.
> 
> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


