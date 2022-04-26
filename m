Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6601E510C61
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 01:01:18 +0200 (CEST)
Received: from localhost ([::1]:57812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njUBI-0005gp-Mi
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 19:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1njU8b-0004y4-D4
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 18:58:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1njU8X-0007G4-GI
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 18:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651013904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sqg/iCltEfMXJGnOuQmYBp4h62JguDi0G/Yb+qi04DI=;
 b=GSC+lf1DH4izsEvEnG6kmBt8T+exr19Ew0zL9D144raYZY9NauFmmh5Ws5ytNF6d/u0Afj
 JCGuJF93b4kR55xn4dXnCkx5+0o4D+7e+RG1tv4JAPDqlNYDTTREaI4CMJnXv6pCqm35jd
 g+NNSpypIceUH03TukZr8yhYsqF+o5s=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-cBJHieobNZye4cb_RMdqAw-1; Tue, 26 Apr 2022 18:58:23 -0400
X-MC-Unique: cBJHieobNZye4cb_RMdqAw-1
Received: by mail-lj1-f198.google.com with SMTP id
 m5-20020a2e8705000000b0024f0fca4516so119923lji.3
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 15:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sqg/iCltEfMXJGnOuQmYBp4h62JguDi0G/Yb+qi04DI=;
 b=Hb8vX+Vz3JFAv3jnAKdurtzk1cV2aMhErRkwF3VJawj354+It+1z1wbmBhhi7mf9oq
 9H5/4jqTU9omtyM14oA0H8E9qCDnq9fUpFB+bDTNDNEyf4MAVYUlV3DHilVgb1o3FBqP
 6vQp9FUMq20g82GpoExmXTJfb5tba1gVVl3eqNsPaBDw0SMKSrWATlAFLXW054+2boFH
 lXCyztTic8YNoiyfLAKP+n9giAByKSuBbRLipuJcoZe12ttyCfTVDznLiMZ2wqUoKjX7
 tMrIdrTGvNkbJjg0zJk6+4C/8q3u1giIJhfzWWsRk5PL12wlNCIQmAwSwyGHE+42Q5kc
 MWDA==
X-Gm-Message-State: AOAM532lkkL62lsURAEY8aOAqTTC96qfaBawtdaV6X6r9+lCWMsBe+as
 /83iG8JcVj+tnx7eS4uIfGBmxyArfrK5Pn/hos/cOGnKsZzJNlVbMVTpyDhTGCpq1BU030PdrnB
 H7gx1OGJJGQ+AkaQ5GQoFhxnWjODqtJs=
X-Received: by 2002:a05:6512:1287:b0:472:2646:88c9 with SMTP id
 u7-20020a056512128700b00472264688c9mr1013721lfs.169.1651013901403; 
 Tue, 26 Apr 2022 15:58:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQ4TOYwKpgrTM2AEgQhWue4scp2gCeu3+Y/epQtERA1eCwbDPIzH2ecEG8bJZ7cSJh0wGsXvjxMejJnMn1//U=
X-Received: by 2002:a05:6512:1287:b0:472:2646:88c9 with SMTP id
 u7-20020a056512128700b00472264688c9mr1013696lfs.169.1651013901022; Tue, 26
 Apr 2022 15:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220425215055.611825-1-leobras@redhat.com>
 <20220425215055.611825-8-leobras@redhat.com>
 <YmgXhEI0AdQ2SILO@xz-m1.local>
In-Reply-To: <YmgXhEI0AdQ2SILO@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 26 Apr 2022 19:58:09 -0300
Message-ID: <CAJ6HWG6Qu_-RV42Aj17gONHA5seUfPFmzLzmPf9-TuG=64Yhcw@mail.gmail.com>
Subject: Re: [PATCH v9 7/7] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter, thanks for helping!

On Tue, Apr 26, 2022 at 1:02 PM Peter Xu <peterx@redhat.com> wrote:
>
> Leo,
>
> This patch looks mostly good to me, a few nitpicks below.
>
> On Mon, Apr 25, 2022 at 06:50:56PM -0300, Leonardo Bras wrote:
[...]
> >      }
> > +
> > +    /*
> > +     * When using zero-copy, it's necessary to flush after each iteration to
> > +     * make sure pages from earlier iterations don't end up replacing newer
> > +     * pages.
> > +     */
> > +    flush_zero_copy = migrate_use_zero_copy_send();
>
> Would you mind inline it if it's only used once?

It's not obvious in the diff, but this is used in a loop bellow, so I inserted
the variable to avoid calling migrate_use_zero_copy_send() for each
multifd channel.

>
> It's great to have that comment, but IMHO it could be more explicit, even
> marking a TODO showing that maybe we could do better in the future:
>
>   /*
>    * When using zero-copy, it's necessary to flush the pages before any of
>    * the pages can be sent again, so we'll make sure the new version of the
>    * pages will always arrive _later_ than the old pages.
>    *
>    * Currently we achieve this by flushing the zero-page requested writes
>    * per ram iteration, but in the future we could potentially optimize it
>    * to be less frequent, e.g. only after we finished one whole scanning of
>    * all the dirty bitmaps.
>    */
>

Thanks! I will insert that in the next version.

The thing here is that I was under the impression an iteration was equivalent to
a whole scanning of all the dirty bitmaps. I see now that it may not
be the case.

[...]
> > @@ -688,10 +708,9 @@ static void *multifd_send_thread(void *opaque)
> >                  p->iov[0].iov_base = p->packet;
> >              }
> >
> > -            ret = qio_channel_writev_all(p->c, p->iov + iov_offset,
> > -                                         p->iovs_num - iov_offset,
> > -                                         &local_err);
> > -
> > +            ret = qio_channel_writev_full_all(p->c, p->iov + iov_offset,
> > +                                              p->iovs_num - iov_offset, NULL,
> > +                                              0, p->write_flags, &local_err);
>
> I kind of agree with Dan in previous patch - this iov_offset is confusing,
> better drop it.

Sure, fixed for v10.

>
[...]
> --
> Peter Xu
>

Best regards,
Leo


