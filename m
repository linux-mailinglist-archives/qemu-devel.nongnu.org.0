Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AEE4CFBFD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:55:56 +0100 (CET)
Received: from localhost ([::1]:52794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRB1v-0005Rx-17
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:55:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nRAU2-0008Uc-5s
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:20:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nRAU0-0005gw-Ee
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:20:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646648451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8QcSS6QFNoAmzn+9R89cdlDOldLfQiosayFwoOc7paY=;
 b=DvPIMj8EE/NgEtlum/ygf4TeC8aT3ILmJIslnmqAOt4GSuIC1qmLcjJotA+wSpi+PW70wG
 +i3SxnX2YGD2dngzub5VZZdPgkMwLBexTFX/FycpGfhhYAZaNPv6kF9aZ74aUkLQAgdhRK
 +6O2dHcLjvZ4q2SUkjoC3/iNGpGbFDg=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-MYadQoxuMTyFdE7TvZZINQ-1; Mon, 07 Mar 2022 05:20:20 -0500
X-MC-Unique: MYadQoxuMTyFdE7TvZZINQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 mm2-20020a17090b358200b001bf529127dfso2649624pjb.6
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8QcSS6QFNoAmzn+9R89cdlDOldLfQiosayFwoOc7paY=;
 b=7LLStl8WKCyt4W5xtGPs0ZDE1DZ4nAwzs8ghlPwIJT86yeXOGCQ5b8EUO7430usE1O
 He73Kll0z1IPWHGvB1m1peaDEYBfVwPGaQx+ipginaV/G8cTBChoBdOJRg1xRGj7JHIK
 ybVxFctgwoaErpA8DuRSqH4mXnPWNme+byJuGfGB8zO93y0C0N09VLAsU1GR6rJWldqo
 Hduf1Kw18ALPDB4FKnkXk36RCoRfazfdqpA2V06WPbIatJxFBFpk6/W9oHcCmsb7Dd1q
 dvW/a0gnfUuRCXwhdVwpXj1uQiawwa0J3DbARr5SDeql4bYvOrzcUhZhJpl5pdJ3g2RY
 U3IA==
X-Gm-Message-State: AOAM5318Fv3dcRIQpS0Sov8knPwcRBlBps8u2TigSatrwfPnPNnoAAJC
 fd2ZaltaGgp9gJ3ox2MdwRaFlKIZVJeC4z+tJyuSrmzjnmBPmFMdQ2chG05hncy7kP4fiJMvqgU
 5BMh/cJFkLubwEio=
X-Received: by 2002:a17:90a:7f84:b0:1bc:aba8:f281 with SMTP id
 m4-20020a17090a7f8400b001bcaba8f281mr12129080pjl.101.1646648419509; 
 Mon, 07 Mar 2022 02:20:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSBZUzIgq0X8fn1Scvf5gHRIzHRG/kk0ugbGL9bWxL+aJVKmdfG5encVyn/hiULE2JcwhY9g==
X-Received: by 2002:a17:90a:7f84:b0:1bc:aba8:f281 with SMTP id
 m4-20020a17090a7f8400b001bcaba8f281mr12129053pjl.101.1646648419167; 
 Mon, 07 Mar 2022 02:20:19 -0800 (PST)
Received: from xz-m1.local ([94.177.118.47]) by smtp.gmail.com with ESMTPSA id
 k12-20020a056a00168c00b004e15818cda3sm16387629pfc.114.2022.03.07.02.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:20:18 -0800 (PST)
Date: Mon, 7 Mar 2022 18:20:14 +0800
From: Peter Xu <peterx@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 04/18] tests: print newline after QMP response in qtest
 logs
Message-ID: <YiXcXliJP47nMxhi@xz-m1.local>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-5-berrange@redhat.com>
 <YiWra21XaVV9Fdv/@xz-m1.local> <YiXZLzqenrNT/uKg@redhat.com>
 <57b8b146-a197-2f46-bf56-6ab80122e9bd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <57b8b146-a197-2f46-bf56-6ab80122e9bd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 07, 2022 at 11:09:37AM +0100, Thomas Huth wrote:
> On 07/03/2022 11.06, Daniel P. Berrangé wrote:
> > On Mon, Mar 07, 2022 at 02:51:23PM +0800, Peter Xu wrote:
> > > On Wed, Mar 02, 2022 at 05:49:18PM +0000, Daniel P. Berrangé wrote:
> > > > The QMP commands have a trailing newline, but the response does not.
> > > > This makes the qtest logs hard to follow as the next QMP command
> > > > appears in the same line as the previous QMP response.
> > > > 
> > > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > > > ---
> > > >   tests/qtest/libqtest.c | 3 +++
> > > >   1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> > > > index a85f8a6d05..79c3edcf4b 100644
> > > > --- a/tests/qtest/libqtest.c
> > > > +++ b/tests/qtest/libqtest.c
> > > > @@ -629,6 +629,9 @@ QDict *qmp_fd_receive(int fd)
> > > >           }
> > > >           json_message_parser_feed(&qmp.parser, &c, 1);
> > > >       }
> > > > +    if (log) {
> > > > +        g_assert(write(2, "\n", 1) == 1);
> > > > +    }
> > > 
> > > Drop the g_assert() to remove side effect of G_DISABLE_ASSERT?
> > 
> > You need to check the return value of write() otherwise you'll get a
> > compile failure due to a warn_unused_result attribute annotation.
> > 
> > I don't think G_DISABLE_ASSERT is a problem as we're not defining
> > that in our code.
> 
> You could use g_assert_true() - that's not affected by G_DISABLE_ASSERT.

Ah that's better indeed. :)

We could also fix the write() above this one too - that one captures the
retcode into len but it simply dropped it, afaict.

Thanks,

-- 
Peter Xu


