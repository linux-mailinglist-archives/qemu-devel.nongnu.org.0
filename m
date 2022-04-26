Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182EC510553
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:23:10 +0200 (CEST)
Received: from localhost ([::1]:48604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOu4-0004U9-TG
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1njOEo-0006gu-8s
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1njOEm-0005Tq-3p
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650991227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DlUTzmlWWXWmOEa2ZTqBWhIO5l/xYHB68zWCwfFziHs=;
 b=JYcUYni/gH4G7uB0KWNnWRcRTS/oltYxewHXWYd9BrKP8QFkvQmFbkx4/oN6e1GPaygm4q
 zS0IbWqhI4Q5uGyjqKxu2lOoNEesqYZ54p2bKYpuqdvsrOkUsPzX9vi2qs0ynd45fKdJJt
 kdw8bNuR+36QcbKSF98id1Tqps6MY2k=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213--ZHx1b7lO26KD6SKfljlNA-1; Tue, 26 Apr 2022 12:40:25 -0400
X-MC-Unique: -ZHx1b7lO26KD6SKfljlNA-1
Received: by mail-ua1-f72.google.com with SMTP id
 ay28-20020a056130031c00b003627ed11df0so4233915uab.7
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DlUTzmlWWXWmOEa2ZTqBWhIO5l/xYHB68zWCwfFziHs=;
 b=L5d7GLYs7oXGF//s/NVSWmuaH0NyfkbNMxlfFSKaOsK0L4AyXD7Yhv8RF3yBEUwbIz
 xcJ6OS/0vkIGQpQEpVpLVdKwzUgFEL4TDWFTCDrG7iZH1aBlBr7ZK+rbaBh3Qau5ZR53
 RX4ZFr2e/IYBoUgFX3jDiTSiOceBrgg6094tkVB3HF7ToFGM929DZ7leNCojWhbYQNZm
 SKSSxAxRWe+T/goJ7UEGnP0CreWQ/2u9Y1PGfSTEpaa8MKlVHpDcB6SImt8wpOXqicqj
 rJKrpqzVSh5eF8ab7LyWNB4XbfL4ov8LHx84r9IrpnL0Z8hSxHbar7wgOxglRSLNWplK
 uf6w==
X-Gm-Message-State: AOAM532azbNDsiTs6x2tv+R1SkVTmOVoUIw6aLKGRfPUvVtuXjWsJ6np
 VRzFhFSt6eu0YdrBFS2FYPMor9DY+TV2Rf3uEf2jgJAKSR3Lq3FucHATbsRODY2W5iwbOAR2f8p
 i5L4TcQB3IOTeMZhUwh02lr6cUYn+XHc=
X-Received: by 2002:a67:c19e:0:b0:32a:4bc5:6e46 with SMTP id
 h30-20020a67c19e000000b0032a4bc56e46mr7070477vsj.35.1650991225273; 
 Tue, 26 Apr 2022 09:40:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJcu++uiFy0xdZdkYFceQhLH8itz6A23jfuxRd1ZKGkCeFtLSgP0EiPmrrjXsIlK63fDRIuKUf8hW00lbFrQQ=
X-Received: by 2002:a67:c19e:0:b0:32a:4bc5:6e46 with SMTP id
 h30-20020a67c19e000000b0032a4bc56e46mr7070471vsj.35.1650991225071; Tue, 26
 Apr 2022 09:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220418211504.943969-1-jsnow@redhat.com>
 <697e0e13-ed61-ec6c-b863-6959ac8e15cf@redhat.com>
In-Reply-To: <697e0e13-ed61-ec6c-b863-6959ac8e15cf@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Apr 2022 12:40:14 -0400
Message-ID: <CAFn=p-aNX-NxzPJUC1-C+48Vw0Vb+W7kvc9kPY1YTVEcpuzKKw@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] iotests: add enhanced debugging info to qemu-io
 failures
To: Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 25, 2022 at 8:31 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 18.04.22 23:14, John Snow wrote:
> > GitLab: https://gitlab.com/jsnow/qemu/-/commits/iotests_qemu_io_diagnostics
> >
> > Howdy,
> >
> > This series does for qemu_io() what we've done for qemu_img() and makes
> > it a function that checks the return code by default and raises an
> > Exception when things do not go according to plan.
> >
> > This series removes qemu_io_pipe_and_status(), qemu_io_silent(), and
> > qemu_io_silent_check() in favor of just qemu_io().
> >
> > V3:
> >
> > - Rebased
> > - Squashed the patches that I said I would
>
> Thanks, applied to my block branch:
>
> https://gitlab.com/hreitz/qemu/-/commits/block
>
> Hanna
>

Thanks! Please pester me if something comes up as a result of these patches. :)

--js


