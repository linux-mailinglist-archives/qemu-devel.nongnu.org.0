Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C15555545
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 22:15:57 +0200 (CEST)
Received: from localhost ([::1]:34682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o46lY-00034g-5g
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 16:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o46jW-0002Kn-4A
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:13:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o46jT-0007h8-8p
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:13:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655928825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KETpwkfGQqFytGXyxabztc4bBFlC0RnbDwzekuH6wVA=;
 b=dZyugWv5rhWl5f17Z+ImNP8VnEm8Hrz2jOX/45a0Bj+Dt3Tx2+2Ly4FdAHj12sCHsutIDf
 MLPTK9rmGIoxk4gkZp49loDAoWRglfEJWHylIeCP+n0Rv/sXi4PooEIxwuJZvkVTPx6e19
 4Wc5MAZR8Fappp1BWfwiOEpMCN+8BCQ=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-kQ70oX_1Ns-S7cu6LJ25UA-1; Wed, 22 Jun 2022 16:13:44 -0400
X-MC-Unique: kQ70oX_1Ns-S7cu6LJ25UA-1
Received: by mail-io1-f72.google.com with SMTP id
 206-20020a6b14d7000000b006727756373cso792302iou.1
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 13:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KETpwkfGQqFytGXyxabztc4bBFlC0RnbDwzekuH6wVA=;
 b=ANxAKJcP5snn/yHx6cuUzQV+7W3xwP/WIi2L2AYx1bBB6D4X+egifv++Vw8DmedS9L
 /ZPrXrXT4x5ah+UAL8SYpP+pQ0Ub8A6zYH8arRKBLWSJ2a/iVJGUlyD4PQhGJsgzMYV4
 l5RtjoMdHoz5x7GUh+x7tvYs51nsTxajl9yqu6ks3p+UV+jQQxKcWW9F9nI+Djpvyipt
 hr8ty3YSBjHLokSPwMvj6f5zTFopJVSoHTho+qTLTTCTCP3wfIIIcbQwuDp+bXeMKjiE
 t12Ap3ni/D2ke3ndO+WrkDdCPwtR/RWyvXV7xR3dJIvv8/7jzk7cszDaV3WiBeNmGnB1
 gwgw==
X-Gm-Message-State: AJIora9W/b6Y9Jnn2Fy1PLcVTKen74bFqx+B4xR2LwLnEwRX36IaLklZ
 V+geY+xs8g/qYbyA4xFhGh9rCeLiqQfKrX81JLTUaRKsojLPN9XZ5khTAtwzp/fuK5SPG5aim/G
 kIyOPxmGUbfSxwUA=
X-Received: by 2002:a05:6638:3043:b0:314:7ce2:4a6e with SMTP id
 u3-20020a056638304300b003147ce24a6emr3232851jak.258.1655928822469; 
 Wed, 22 Jun 2022 13:13:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s5j0X7oNdS1trDCIa6CDUk4AkyuhTzgkUbbsN+atfh1HpAKFJwlDnrfPHKHDRtdiAPMCypKg==
X-Received: by 2002:a05:6638:3043:b0:314:7ce2:4a6e with SMTP id
 u3-20020a056638304300b003147ce24a6emr3232841jak.258.1655928822241; 
 Wed, 22 Jun 2022 13:13:42 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a92d287000000b002d94a7ff974sm569218ilp.19.2022.06.22.13.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 13:13:41 -0700 (PDT)
Date: Wed, 22 Jun 2022 16:13:39 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, jdenemar@redhat.com
Subject: Re: [PULL 22/33] migration: remove the QEMUFileOps 'get_buffer'
 callback
Message-ID: <YrN381XWrhTFStlp@xz-m1.local>
References: <20220622183917.155308-1-dgilbert@redhat.com>
 <20220622183917.155308-23-dgilbert@redhat.com>
 <YrNu3KesFVVvoWVb@xz-m1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YrNu3KesFVVvoWVb@xz-m1.local>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Wed, Jun 22, 2022 at 03:34:52PM -0400, Peter Xu wrote:
> On Wed, Jun 22, 2022 at 07:39:06PM +0100, Dr. David Alan Gilbert (git) wrote:
> > diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> > index 74f919de67..e206b05550 100644
> > --- a/migration/qemu-file.c
> > +++ b/migration/qemu-file.c
> > @@ -377,8 +377,22 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
> >          return 0;
> >      }
> >  
> > -    len = f->ops->get_buffer(f->ioc, f->buf + pending, f->total_transferred,
> > -                             IO_BUF_SIZE - pending, &local_error);
> > +    do {
> > +        len = qio_channel_read(f->ioc,
> > +                               (char *)f->buf + pending,
> > +                               IO_BUF_SIZE - pending,
> > +                               &local_error);
> > +        if (len == QIO_CHANNEL_ERR_BLOCK) {
> > +            if (qemu_in_coroutine()) {
> > +                qio_channel_yield(f->ioc, G_IO_IN);
> > +            } else {
> > +                qio_channel_wait(f->ioc, G_IO_IN);
> > +            }
> > +        } else if (len < 0) {
> > +            len = EIO;
> 
> This should be -EIO.
> 
> > +        }
> > +    } while (len == QIO_CHANNEL_ERR_BLOCK);
> 
> It's failing only with the new TLS test I added for postcopy somehow (at
> least /x86_64/migration/postcopy/recovery/tls).. I also verified after the
> change it'll work again.

Hmm, when I wanted to run the whole bunch of the migration-test again I
found that precopy tls test hangs (/x86_64/migration/precopy/unix/tls/psk).
Though for this time it also hangs for me even with the master branch, so
maybe not anything wrong with this specific pull req but still something
needs fixing..

-- 
Peter Xu


