Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A85343C382
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 09:07:43 +0200 (CEST)
Received: from localhost ([::1]:33286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfd2E-0004qY-8f
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 03:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfd0p-00044n-4z
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 03:06:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfd0l-0001n9-VB
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 03:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635318369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lloSnkWyi+AtgcjHrghZpc855sMZjo3pKzw3uNIDEQc=;
 b=OIB3kIzpODNSms7lKXEd4SndHksXqSQeOmGMMNEZPBrREzfx0Ay5421qjzqV3AeZJOkkaO
 RPyQWKbcfRgaM5UOGwR0LtIOfqCmGgwSf+QJfNd98/ynDuMriPlmnNCfUL0EQr5FqT3Olp
 xVBdkQufeMz+fvC8VYeCdCkL9g61NVw=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-LimLrhf-P7KGIRjLZ3bTkQ-1; Wed, 27 Oct 2021 03:06:07 -0400
X-MC-Unique: LimLrhf-P7KGIRjLZ3bTkQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 on18-20020a17090b1d1200b001a04d94fd9fso759702pjb.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 00:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lloSnkWyi+AtgcjHrghZpc855sMZjo3pKzw3uNIDEQc=;
 b=jrbK+Rcyf/kIGpIEpsChGOtj7enzy/+W2eMV0U/aqfV46+r4xZZzofgIHKfdGzdCFp
 DJX+fWoswxfqGPJyH3cp79n/ZqavnS03ZuGsytK+27vgafqUtOompXkyK0zQPivrDlZU
 fVwJE8u03enKA+m5QoQnLV/Uyi5az2bSzs8l5FmzL+zZUPuP6+rBetQaBHRB7PKPHNhU
 kpzc/vrlXhcPz41FYfwOU5PuhqrejA8xxFotCrIV8pzPt4pO9JSTnOiZvH27gHhKEPyl
 RqOraxHw3MKPBGcqeuB6/Mub9sppTfnZAJcUXOVY1G+ufv91T9aZhv3/kw1z6yEEh5JV
 RnSQ==
X-Gm-Message-State: AOAM5325sq4pRF+uuRUw7GD0nepcQISb7YV6MD8S7hfm4L5hoZrJIDrE
 Y2myAnXyJkmTMFYWQSUbn300QkhjXuflVfcEiknVB0jQ+e9qOtfHrJf9moVGOvYMc2YV+XfT+1S
 J5eoo9W5bAH4mODM=
X-Received: by 2002:a05:6a00:813:b0:470:bbc2:49ae with SMTP id
 m19-20020a056a00081300b00470bbc249aemr31085976pfk.29.1635318366766; 
 Wed, 27 Oct 2021 00:06:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4NQdUKEJLLFWdppxs+8cMYY7mYgwG/TA8kVEk3No/YSenH4QX13IjomUAwh9d/3FltKFXWw==
X-Received: by 2002:a05:6a00:813:b0:470:bbc2:49ae with SMTP id
 m19-20020a056a00081300b00470bbc249aemr31085943pfk.29.1635318366352; 
 Wed, 27 Oct 2021 00:06:06 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.60])
 by smtp.gmail.com with ESMTPSA id f7sm14762128pfv.152.2021.10.27.00.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 00:06:05 -0700 (PDT)
Date: Wed, 27 Oct 2021 15:06:01 +0800
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v4 3/3] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
Message-ID: <YXj6WZHjwWlzZ+1t@xz-m1.local>
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-4-leobras@redhat.com>
 <YWZ7coem6iklY0ZC@t490s>
 <CAJ6HWG7Ep_yCKvw35n647+CRmh=W3EKFtxSHU16AxxKuz=rnrw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG7Ep_yCKvw35n647+CRmh=W3EKFtxSHU16AxxKuz=rnrw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 03:47:18AM -0300, Leonardo Bras Soares Passos wrote:
> On Wed, Oct 13, 2021 at 3:24 AM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Sat, Oct 09, 2021 at 04:56:13AM -0300, Leonardo Bras wrote:
> > > diff --git a/qapi/migration.json b/qapi/migration.json
> > > index 88f07baedd..c4890cbb54 100644
> > > --- a/qapi/migration.json
> > > +++ b/qapi/migration.json
> > > @@ -724,6 +724,11 @@
> > >  #                      will consume more CPU.
> > >  #                      Defaults to 1. (Since 5.0)
> > >  #
> > > +# @multifd-zerocopy: Controls behavior on sending memory pages on multifd migration.
> > > +#                    When true, enables a zerocopy mechanism for sending memory
> > > +#                    pages, if host does support it.
> > > +#                    Defaults to false. (Since 6.2)
> > > +#
> >
> > Shall we keep it named "@zerocopy"?  Yes we have that dependency with multifd,
> > but it's fine to just fail the configuration if multifd not set. The thing is
> > we don't know whether that dependency will last forever, and we probably don't
> > want to introduce yet another feature bit when we can remove the dependency..
> > as we can't remove the old one to be compatible.
> 
> It makes sense not wanting to create a new future bit in the future,
> but if we just add a
> "@zerocopy' , wouldn't we need to fail every migration setup that
> don't support zerocopy?
> 
> (Thinking back, to stay as it is, it would also be necessary that I
> find a way to fail other multifd setups that don't support zerocopy,
> for v5)

Yes I think so; imho we can fail either whey applying the bit, or it's okay too
to fail at the start of migration.  Thanks,

-- 
Peter Xu


