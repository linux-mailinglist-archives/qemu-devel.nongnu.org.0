Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F034C6EAA
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:57:21 +0100 (CET)
Received: from localhost ([::1]:33386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgWe-0001s8-Qs
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:57:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nOgRY-0005oT-Lb
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:52:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nOgRU-0001CN-V2
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646056318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hNfeQF+Ke97iviMK+eCEkshbz1HnncC11f/cHx/poQo=;
 b=HZRoKyPyCLdfBwFRAqo0nvi77OJeQ1iRRCB6mMGrnLRVJxh2RuOOJanfdGc/lMKF9eysLw
 GJNelFVg+bHmJSWxXuRwAZkU29UOOhAFB6EquGsqyhGjxm8hAoDUYsl1PzZD/JAHUCvWnm
 gFtGGU0MK3HEYNQ5ZW9dGoGR8GiH0II=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-pNe29V1aPbm8bZVp-yG1-g-1; Mon, 28 Feb 2022 08:51:51 -0500
X-MC-Unique: pNe29V1aPbm8bZVp-yG1-g-1
Received: by mail-ed1-f72.google.com with SMTP id
 h17-20020a05640250d100b004133863d836so5931798edb.0
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 05:51:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hNfeQF+Ke97iviMK+eCEkshbz1HnncC11f/cHx/poQo=;
 b=WcGk0EbmyDLM37FgqYc/EPgsMVtzEe/VIa26LJl1Zq8BVNVndngQtxR87Foo43eEcs
 R98TEFzK51s+hpu68co47rz6iuEininWGBR8JmHbtUCN3/G+TrjmVmnKMtGCuLjUzBSG
 EWi6QNbJhIbitNhsVIC/M52tjhzEdO8l8XftpJnx+r0+8ouH87VOAA8El9W0+tgSQryp
 FIP/30Ygyd1avFxL+jqv09LSa9iMEICgsBkmruL/hromerIqfTOZx8G2Kac0BrkEMnFu
 ub2mUPj4Lkkcthswk6uuJ/kcB/vy6WTNHcXbNZcZa1DXW61VJvMPApozMHAI6LXWG8ro
 lsew==
X-Gm-Message-State: AOAM531Bah/nhqNPlr8sTECPXdAMw3FEyhGeUzEFKacEjOmzLPCjWT04
 soP4Bn9yusOKGqGrtR445yfthnl+YHfAiMqBqBEjAHsTVTcqORet/Y/0yfi5q+RomUo6erX9nEW
 fzdWHObHATEV0UCY=
X-Received: by 2002:a05:6402:b4e:b0:413:486b:4126 with SMTP id
 bx14-20020a0564020b4e00b00413486b4126mr19489312edb.410.1646056310460; 
 Mon, 28 Feb 2022 05:51:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIA2Fnl3R0zzdU/uOQ7zuXvz9XyLahLf6z5ZEiqoftq+ONkVHErSO/jQaQSzz2Idr1v/Udmg==
X-Received: by 2002:a05:6402:b4e:b0:413:486b:4126 with SMTP id
 bx14-20020a0564020b4e00b00413486b4126mr19489286edb.410.1646056310186; 
 Mon, 28 Feb 2022 05:51:50 -0800 (PST)
Received: from redhat.com ([2.53.153.125]) by smtp.gmail.com with ESMTPSA id
 dn14-20020a05640222ee00b00410b88abd6fsm6085889edb.45.2022.02.28.05.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 05:51:49 -0800 (PST)
Date: Mon, 28 Feb 2022 08:51:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] qom: assert integer does not overflow
Message-ID: <20220228085104-mutt-send-email-mst@kernel.org>
References: <20220225140955.63949-1-mst@redhat.com>
 <YhjpOHSW9L+RIX5A@redhat.com>
 <20220228070913-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220228070913-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Victor Tom <vv474172261@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 28, 2022 at 07:16:56AM -0500, Michael S. Tsirkin wrote:
> On Fri, Feb 25, 2022 at 02:35:36PM +0000, Daniel P. Berrangé wrote:
> > On Fri, Feb 25, 2022 at 09:10:44AM -0500, Michael S. Tsirkin wrote:
> > > QOM reference counting is not designed with an infinite amount of
> > > references in mind, trying to take a reference in a loop will overflow
> > > the integer. We will then eventually assert when dereferencing, but the
> > > real problem is in object_ref so let's assert there to make such issues
> > > cleaner and easier to debug.
> > 
> > What is the actual bug / scenario that led you to hit this problem ?
> 
> E.g. if during code development I call object_ref but not object_unref,
> the counter eventually overflows. If this triggers in an error flow
> and not a good path this kind of bug might thinkably make it through QE
> into release code.
> 
> > I'm surprised you saw an assert in object_unref, as that would
> > imply you had exactly  UINT32_MAX calls to object_ref and then
> > one to object_unref.
> 
> Any imbalance with # of unrefs > # refs
> will trigger an existing assert in unref.
> 
> However, an imbalance with # of refs > # unrefs does not trigger an
> assert at the moment.
> 

A vsock patch Stefano just posted would be one example where this can happen.

> > > Some micro-benchmarking shows using fetch and add this is essentially
> > > free on x86.
> > > 
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  qom/object.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/qom/object.c b/qom/object.c
> > > index 4f0677cca9..5db3974f04 100644
> > > --- a/qom/object.c
> > > +++ b/qom/object.c
> > > @@ -1167,10 +1167,14 @@ GSList *object_class_get_list_sorted(const char *implements_type,
> > >  Object *object_ref(void *objptr)
> > >  {
> > >      Object *obj = OBJECT(objptr);
> > > +    uint32_t ref;
> > > +
> > >      if (!obj) {
> > >          return NULL;
> > >      }
> > > -    qatomic_inc(&obj->ref);
> > > +    ref = qatomic_fetch_inc(&obj->ref);
> > > +    /* Assert waaay before the integer overflows */
> > > +    g_assert(ref < INT_MAX);
> > 
> > Not that I expect this to hit, but why choose this lower
> > bound instead of g_assert(ref > 0) which is the actual
> > failure scenario, matching the existing object_unref
> > assert.
> 
> The earlier we catch it the better, if we overflowed to 0 some other
> thread might already be confused.
> 
> 
> > Regards,
> > Daniel
> > -- 
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


