Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3139F4ACAC7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 21:54:46 +0100 (CET)
Received: from localhost ([::1]:34866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHB24-0000X8-Qf
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 15:54:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nHAzT-0007Oz-Kk
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 15:52:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nHAzL-0006BR-Ks
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 15:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644267066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=af3CK1DzYB4S1RzQl6idffNjPLk4AylkAsxkg/ZdcVk=;
 b=FkEi80gUnEDyJE7O2dU8hNcjRCKsD3gpAOw+btBitwDftc4AwVPt428AtGBVPfB9P9mat0
 LjIP+l5atMD423OSGeqJ0o28lxMtWp516Dd+jfdB1Am1txRC/4gGheOhDOiq+SPISFGjSP
 /WAmI5PcrVTR5IP2DnxMarVOtzwZuAg=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-0TqZ17CQNkWVRryDajfhTQ-1; Mon, 07 Feb 2022 15:51:05 -0500
X-MC-Unique: 0TqZ17CQNkWVRryDajfhTQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 bd23-20020a05651c169700b0023bc6f845beso4990325ljb.17
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 12:51:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=af3CK1DzYB4S1RzQl6idffNjPLk4AylkAsxkg/ZdcVk=;
 b=Pk1wBSJeV58AryPrx44CopopsA5Xu+hSkg4lvp6T7Lf8jh0jQOrGKUibi9LvPe6BvM
 QcyUJ+2BLer71mMnRZDgNoVyAAv67n++OCx/rx2vg1AfNEasFsUx2WYgBU6OE4k7ozX6
 Gop/U77+K6vraAoz+2C0wpqgSB4EikGY+cRxiX1k37TjrQypQXLvuylatyu1Ze56aG3O
 YydCBPEq6gNSwK0kec+02Pa0ne+PLmXHkVLpnI6kaYSrYuG1dBv/XMI8Wp2e4so+rEB+
 4qQl7jI/zOV5z5mpPR02+Zqn4HOel2nplYVHSyBahNN40xgWTDtZAB5GkHjrWxKYLgAF
 b1Yw==
X-Gm-Message-State: AOAM5317U5prfjGC4i9NYm/ZWOsl3/9JtceZc9d5FoNTKQDTU3SyE9S1
 FTnOwa33u6RGCsDymqyImRVgwMdMXqjY/kV4CrvTRqxwCsDqvRU6iHHk2Q4zhkTloyj9VwQ7htb
 POpnjfLk6wEV3scsdmkIv60csMVYHYNA=
X-Received: by 2002:a05:651c:b13:: with SMTP id
 b19mr804837ljr.162.1644267063055; 
 Mon, 07 Feb 2022 12:51:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSERA74jRNCsf+9qgR3BeCyKRCixDBBHZmRkWS0DJ0BUwg49gTcJ2m4ZBbw2BNr6djKsYn/Gp9/ISBgf38mFc=
X-Received: by 2002:a05:651c:b13:: with SMTP id
 b19mr804807ljr.162.1644267062683; 
 Mon, 07 Feb 2022 12:51:02 -0800 (PST)
MIME-Version: 1.0
References: <20220201062901.428838-1-leobras@redhat.com>
 <20220201062901.428838-2-leobras@redhat.com>
 <YgEVbygBVE/FpTtq@xz-m1.local>
In-Reply-To: <YgEVbygBVE/FpTtq@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 7 Feb 2022 17:50:51 -0300
Message-ID: <CAJ6HWG638ScLn55o+8UcHCJ_sbBm76rs9mzcU6ZaxmrqmtrV8g@mail.gmail.com>
Subject: Re: [PATCH v8 1/5] QIOChannel: Add flags on io_writev and introduce
 io_flush callback
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Hello Peter,

On Mon, Feb 7, 2022 at 9:50 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Feb 01, 2022 at 03:28:59AM -0300, Leonardo Bras wrote:
> > Add flags to io_writev and introduce io_flush as optional callback to
> > QIOChannelClass, allowing the implementation of zero copy writes by
> > subclasses.
> >
> > How to use them:
> > - Write data using qio_channel_writev*(...,QIO_CHANNEL_WRITE_FLAG_ZERO_COPY),
> > - Wait write completion with qio_channel_flush().
> >
> > Notes:
> > As some zero copy write implementations work asynchronously, it's
> > recommended to keep the write buffer untouched until the return of
> > qio_channel_flush(), to avoid the risk of sending an updated buffer
> > instead of the buffer state during write.
> >
> > As io_flush callback is optional, if a subclass does not implement it, then:
> > - io_flush will return 0 without changing anything.
> >
> > Also, some functions like qio_channel_writev_full_all() were adapted to
> > receive a flag parameter. That allows shared code between zero copy and
> > non-zero copy writev, and also an easier implementation on new flags.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
>
> With Dan's comment addressed on removing the redundant assertion:
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>

Thank you for reviewing!

I think I am now missing reviewing only on patch 5/5 before sending
the next version.
Could you and/or Daniel help me with that? Just to check if I am
missing anything?

Best regards,
Leo


