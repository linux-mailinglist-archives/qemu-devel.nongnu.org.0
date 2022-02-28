Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F774C787E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 20:08:14 +0100 (CET)
Received: from localhost ([::1]:45788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOlNV-0007mz-70
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 14:08:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nOlLS-0006w8-RE
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:06:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nOlLN-0007BE-LP
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:06:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646075156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2JLqrxW3naEU4KqjPH8Ma5Wxik5fbmoI7F3Xd4tigNc=;
 b=W2eUrmmhv53e8MnJ8K6kNd5FS7zmuiOpQw2VIC13Uxa9V6DG2RGrjcxDcVLjEGgKJnzsFi
 f/2Jle7sxX7xmvedMh24Rfkt3B4bnAZ6rHg1Emtc9leACTurwKYO+KAeL44RtDpyVLp7dD
 etAY+MDM67rKPAjwtgWa/wuGc2DcYqs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-CdHf-cQ7O-i9DVwn5-etVg-1; Mon, 28 Feb 2022 14:05:55 -0500
X-MC-Unique: CdHf-cQ7O-i9DVwn5-etVg-1
Received: by mail-wm1-f71.google.com with SMTP id
 w3-20020a7bc743000000b0037c5168b3c4so6858617wmk.7
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 11:05:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=2JLqrxW3naEU4KqjPH8Ma5Wxik5fbmoI7F3Xd4tigNc=;
 b=rAHzAOX292DKeqqbIUvWwieUnUQqYmg3LRLMjKghT6m4Hh/wG8R41OTehUJS835dBG
 8t4l8Hp03yCSh3mZ2dyezpYV3RGtIlp0KrleYybpBzf4MHLjB9GfQaxFU7mj7MuRS8MS
 BUEZWcj7xwCVhwAjAa2poFJW4W3TwHl1BPl065p3Mn2aO3KRJ68AJjy4XIFCnNPk719N
 01N2o6FPviN7yuC2EXO00YaHW8M3zOizxF1Q9+b2Q6VZdrzIgYkorruZayThrB3ecx2u
 +/Wzpbsf6gHE/DzKS+iegPC9jncfw8uJPprO7gGF1JIc7yh6PD5tCrf6c5i1oREl/1Ny
 wmSw==
X-Gm-Message-State: AOAM533X58RJA0eJAO8Kk4e4htFynU1MGuPrKqoga7gttNT/rjuP3q2/
 ILPSiMwSfQjdzjXki+zT9dmw3+ISn7eKeltNksxy3pULEH2mG8+iuDwfnB2D9dR9hEWdCDf6S/M
 K2zmHbj9227w7U+M=
X-Received: by 2002:a05:6000:1c1c:b0:1ef:e989:260 with SMTP id
 ba28-20020a0560001c1c00b001efe9890260mr3046253wrb.668.1646075154158; 
 Mon, 28 Feb 2022 11:05:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsG8Z8mujpBolCia5Wa4nqExuyPTSsGj1J06fTsQ9rewDvYO7VbuVYT8pPiSFk2WbAvwLX2w==
X-Received: by 2002:a05:6000:1c1c:b0:1ef:e989:260 with SMTP id
 ba28-20020a0560001c1c00b001efe9890260mr3046224wrb.668.1646075153849; 
 Mon, 28 Feb 2022 11:05:53 -0800 (PST)
Received: from ?IPv6:2a0c:5a80:1b14:b500:abb:f9d1:7bc2:3db8?
 ([2a0c:5a80:1b14:b500:abb:f9d1:7bc2:3db8])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05600c190c00b00380ead5bc65sm304329wmq.29.2022.02.28.11.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 11:05:53 -0800 (PST)
Message-ID: <b5f5ab5d9d5216a8df08715a9b18ba448a42fe75.camel@redhat.com>
Subject: Re: [PATCH 1/3] util & iothread: Introduce event-loop abstract class
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Date: Mon, 28 Feb 2022 20:05:52 +0100
In-Reply-To: <YhdUcRNi95PY0X98@stefanha-x1.localdomain>
References: <20220221170843.849084-1-nsaenzju@redhat.com>
 <20220221170843.849084-2-nsaenzju@redhat.com>
 <YhdUcRNi95PY0X98@stefanha-x1.localdomain>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, eduardo@habkost.net,
 hreitz@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan, thanks for the review.

On Thu, 2022-02-24 at 09:48 +0000, Stefan Hajnoczi wrote:
> On Mon, Feb 21, 2022 at 06:08:43PM +0100, Nicolas Saenz Julienne wrote:
> > diff --git a/qom/meson.build b/qom/meson.build
> > index 062a3789d8..c20e5dd1cb 100644
> > --- a/qom/meson.build
> > +++ b/qom/meson.build
> > @@ -4,6 +4,7 @@ qom_ss.add(files(
> >    'object.c',
> >    'object_interfaces.c',
> >    'qom-qobject.c',
> > +  '../util/event-loop.c',
> 
> This looks strange. I expected util/event-loop.c to be in
> util/meson.build and added to the util_ss SourceSet instead of qom_ss.
> 
> What is the reason for this?

Sorry I meant to move it into the qom directory while cleaning up the series
but forgot about it.

That said, I can see how moving 'event-loop-backend' in qom_ss isn't the
cleanest.

So I tried moving it into util_ss, but for some reason nobody is calling
'type_init(even_loop_register_type)'. My guess is there's some compilation
quirk I'm missing.

Any suggestions? I wonder if util_ss is the right spot for 'event-loop-backend'
anyway, but I don't have a better idea.

> >  ))
> >  
> >  qmp_ss.add(files('qom-qmp-cmds.c'))
> > diff --git a/util/event-loop.c b/util/event-loop.c
> > new file mode 100644
> > index 0000000000..f3e50909a0
> > --- /dev/null
> > +++ b/util/event-loop.c
> 
> The naming is a little inconsistent. The filename "event-loop.c" does
> match the QOM type or typedef name event-loop-backend/EventLoopBackend.
> 
> I suggest calling the source file event-loop-base.c and the QOM type
> "event-loop-base".

Agree.

> > @@ -0,0 +1,142 @@
> > +/*
> > + * QEMU event-loop backend
> > + *
> > + * Copyright (C) 2022 Red Hat Inc
> > + *
> > + * Authors:
> > + *  Nicolas Saenz Julienne <nsaenzju@redhat.com>
> 
> Most of the code is cut and pasted. It would be nice to carry over the
> authorship information too.

Yes, of course.

> > +struct EventLoopBackend {
> > +    Object parent;
> > +
> > +    /* AioContext poll parameters */
> > +    int64_t poll_max_ns;
> > +    int64_t poll_grow;
> > +    int64_t poll_shrink;
> 
> These parameters do not affect the main loop because it cannot poll. If
> you decide to keep them in the base class, please document that they
> have no effect on the main loop so users aren't confused. I would keep
> them unique to IOThread for now.

OK, I'll keep them unique then.

Thanks!

-- 
Nicolás Sáenz


