Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383CA533E49
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 15:52:43 +0200 (CEST)
Received: from localhost ([::1]:50888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntrRJ-0004eD-V1
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 09:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1ntrOA-0003iV-SE
 for qemu-devel@nongnu.org; Wed, 25 May 2022 09:49:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1ntrO7-00048t-PL
 for qemu-devel@nongnu.org; Wed, 25 May 2022 09:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653486562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CsQZJVD93vjCxhsZeh62nc14teJ5newsOMGeFQ9awvQ=;
 b=JNr+X/IlND7pKY268jJm3Tdjw/xSxxIRUuJ11fDAFAfvqSLe4LD67W+IW721BDMG83GkZG
 n1PVuejFhmdZ29tIxOtzy74D3XfBxtpCrM/jKKbYNRSU3dO+4HmZLU52YsPrTZC91ZVQff
 NgSJtPo1btNnzKqnoQO4kGGN8Sx9K6U=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-5LjJ0cwgOVGpZKn2lB70Zw-1; Wed, 25 May 2022 09:49:21 -0400
X-MC-Unique: 5LjJ0cwgOVGpZKn2lB70Zw-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2f4e17a5809so178756447b3.2
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 06:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=CsQZJVD93vjCxhsZeh62nc14teJ5newsOMGeFQ9awvQ=;
 b=5vmsGz2rQC6E6cO49cW/JAnVzRBen7jeXi2//iylsGe8rzeK18+V1a9W/pOTnt4PH7
 VwvWquQsOzc2ZkQG/wCl7kLgM+HlQmJ/4q8jirmVsQtHe1M2K7QfUEdWAhj80YCIsci6
 FAGwxsX7IUnq3x0vDgiuX3ZupQdqofpwkLqHBSwAQe+m36O5BZbNcsUq31W3mvoOEmti
 gyB/3ecKC3wW9EGvcuYYQr3TBCT7VID0F0eBwQANwvNSau079Bb+2NEUimjK/Wr15IhG
 TH4Ji/Xy3zrbpvZEZgzbuo1qoIcSPcBI52WdO6eeBuyAOOrtfJj6tx1BhVG5qKztLVwD
 SZ3g==
X-Gm-Message-State: AOAM532H7kU6PxVk1eFHptOA7o/QBMTWUYiiRNe4fNe6Xyl/oTqlIzNq
 zaJhe2eGC1tw6Qqui3tk5QLccbdngfJbohiOVa3cIoZ23KBD4nN63XByv5pQ71n1lXCh7n94XJk
 0hoq7t2fk+KU/p866MTz373eBWZmtGOc=
X-Received: by 2002:a81:2143:0:b0:2fb:1274:247e with SMTP id
 h64-20020a812143000000b002fb1274247emr33240661ywh.384.1653486560293; 
 Wed, 25 May 2022 06:49:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyv9MIeUZvUJ2+DH8JHg2D/lr+DDquR6oO6fN30Sx5LR3t+FjkAIbnxT5yvq1tMdDCP+WTAN2gwmp4Z7Sh9KaA=
X-Received: by 2002:a81:2143:0:b0:2fb:1274:247e with SMTP id
 h64-20020a812143000000b002fb1274247emr33240624ywh.384.1653486559932; Wed, 25
 May 2022 06:49:19 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 May 2022 08:49:19 -0500
From: Andrea Bolognani <abologna@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
 <87lev9mw7j.fsf@pond.sub.org> <YnpbuzKo681VwDkn@redhat.com>
 <87r150dugw.fsf@pond.sub.org> <20220518085548.gri7ojvp5ezrstsj@tapioca>
 <87mtffm3ak.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87mtffm3ak.fsf@pond.sub.org>
Date: Wed, 25 May 2022 08:49:19 -0500
Message-ID: <CABJz62Oi4Yq3n8Mf4uikycD_BZrDhCj8zG1pFVNhv+N2-Q8naw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
To: Markus Armbruster <armbru@redhat.com>
Cc: Victor Toso <victortoso@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 18, 2022 at 02:30:11PM +0200, Markus Armbruster wrote:
> Victor Toso <victortoso@redhat.com> writes:
> > IMHO, at this moment, qapi-go is targeting communicating with
> > QEMU and handling multiple QEMU versions seems reasonable to me.
>
> It's targeting communicating in *QMP*.  QMP is designed to support
> communicating with a range of QEMU versions.  Full compatibility is
> promised for a narrow range.  Outside that range, graceful degradation.
>
> *If* you want to widen the full compatibility range, do it in *QMP*.  Or
> do it on top of QEMU, e.g. in libvirt.
>
> > Perhaps libvirt can use qapi-go in the future or other generated
> > interface. That would be cool.
>
> "Would be cool" and a dollar buys you a cup of bad coffee.
>
> Is it a good use of our limited resources?
>
> How much will it delay delivery of Go bindings compared to less
> ambitious version?

Yeah, this thread has basically branched to cover three topics:

  1. what an MVP Go interface for QMP should look like;
  2. how to make sure said interface uses pretty names;
  3. how to make it work across multiple QEMU versions.

All of these are important in the long run, but as far as I'm
concerned only 1. is an actual blocker to making progress.

If we get to the point where we can generate a reasonably complete
and well-typed Go interface that can be used to communicate with a
single version of QEMU, we should just plaster EXPERIMENTAL all over
it and get it merged.

Basically get the MVP done and then iterate over it in-tree rather
than trying to get everything perfect from the start.

Sounds reasonable?

-- 
Andrea Bolognani / Red Hat / Virtualization


