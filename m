Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0C66365C9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 17:28:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxsay-0001lH-Ui; Wed, 23 Nov 2022 11:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oxsax-0001l5-1S
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:27:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oxsav-0007mb-HD
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:27:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669220848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0kh1R/oz7vmVt7mmOM0WpKjTn12ycHcCyIKYjZPzMl4=;
 b=CXAmO6zdAP+dqgTmdrWYUcUaGMfS0mLGN1vXbKQYX95OKbxA7ps2JC2pgRUfoFF3OYAXHK
 3TQBORXPAq+UEz50G2TR25EhjbK9BNbnp5d421qTLgFg8w/wR35DgWpO2g0N7tyL+6AZEI
 5GWT7TEMOFotf1zD/C2V1j+uTRDW84w=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-203-krtmPa9OP52avDXHNBlZPA-1; Wed, 23 Nov 2022 11:27:26 -0500
X-MC-Unique: krtmPa9OP52avDXHNBlZPA-1
Received: by mail-qt1-f200.google.com with SMTP id
 s14-20020a05622a1a8e00b00397eacd9c1aso17677874qtc.21
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 08:27:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0kh1R/oz7vmVt7mmOM0WpKjTn12ycHcCyIKYjZPzMl4=;
 b=DrK9bu2OlzNzUU+wqVETcsE022jtQxcLRFGtWSTvsV1wUi2LRWId4J+sVu2vlLlWmm
 NZR8e07ic1guEQygw25ZQX/S86dchp1NhCEXXTiItpRIZMc1CgOpWxnsQq0QORVp16yY
 IXWPe9nyu0Zd+V0rQarJpmek0Gqg9HKMnvw6XMj7ykpU041FEb33H11MB09VME5/t78N
 8FpQmGFemuxN9TnDJ2TIScKnhlahuEk1BGkL1M6V5GAcpgGqKsnvocfO6koAzZWf2fzx
 +3L30K0JAScFeQ+Ncqp0khpH4TrwtuVhI/ccmOEe0tD4wxnCsjZ4AYDYiVlIJ6Nbynt2
 8zKQ==
X-Gm-Message-State: ANoB5plygC87PHAMyQrSYyuQRBuwShTNZ4dq4qXu47K0+Uv6+weVBtn5
 67mqE6e5pcW7XaKWqh5792oWQrIF0QQS7EsnTP9q9WbEebwF9zf89vLDADi+T1rAP2gJnLdmEWY
 ds/9GrbCRyu8HD+M=
X-Received: by 2002:a0c:fe90:0:b0:4c6:d886:2681 with SMTP id
 d16-20020a0cfe90000000b004c6d8862681mr5703qvs.94.1669220846426; 
 Wed, 23 Nov 2022 08:27:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4dpt0h66JjDn45Mx9pGiR6hoFRGw4cLRbuo8l2sjHseo9siqkF1n58+u8MoRwrySMLar14tA==
X-Received: by 2002:a0c:fe90:0:b0:4c6:d886:2681 with SMTP id
 d16-20020a0cfe90000000b004c6d8862681mr5677qvs.94.1669220846152; 
 Wed, 23 Nov 2022 08:27:26 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 v20-20020a05620a0f1400b006fbae4a5f59sm12292762qkl.41.2022.11.23.08.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 08:27:25 -0800 (PST)
Date: Wed, 23 Nov 2022 11:27:25 -0500
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
Subject: Re: [PATCH v4 2/2] migration: check magic value for deciding the
 mapping of channels
Message-ID: <Y35J7QC4YYj2bSyl@x1n>
References: <20221123150527.24608-1-manish.mishra@nutanix.com>
 <20221123150527.24608-3-manish.mishra@nutanix.com>
 <Y35BoSi9NUmbFoCk@x1n>
 <a1711169-fa57-ac54-33c8-4a30631f0486@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a1711169-fa57-ac54-33c8-4a30631f0486@nutanix.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Wed, Nov 23, 2022 at 09:28:14PM +0530, manish.mishra wrote:
> 
> On 23/11/22 9:22 pm, Peter Xu wrote:
> > On Wed, Nov 23, 2022 at 03:05:27PM +0000, manish.mishra wrote:
> > > +int migration_channel_read_peek(QIOChannel *ioc,
> > > +                                const char *buf,
> > > +                                const size_t buflen,
> > > +                                Error **errp)
> > > +{
> > > +   ssize_t len = 0;
> > > +   struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
> > > +
> > > +   while (len < buflen) {
> > > +       len = qio_channel_readv_full(ioc, &iov, 1, NULL,
> > > +                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
> > > +
> > > +       if (len == QIO_CHANNEL_ERR_BLOCK) {
> > This needs to take care of partial len too?
> 
> 
> sorry Peter, I did not quite understand it. Can you please give some more details.

As Daniel pointed out, I think if we peek partially it'll go into a loop.
Since we shouldn't read 0 anyway here, maybe you can directly write it as:

while (true) {
  len = read();
  if (len <= 0 && len != QIO_CHANNEL_ERR_BLOCK) {
      error_setg(...);
      return -1;
  }
  if (len == buflen) {
      break;
  }
  /* For either partial peek or QIO_CHANNEL_ERR_BLOCK, retry with timeout */
  sleep();
}

> 
> > 
> > > +            if (qemu_in_coroutine()) {
> > > +                /* 1ms sleep. */
> > > +                qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 1000000);
> > > +            } else {
> > > +                qio_channel_wait(ioc, G_IO_IN);
> > > +            }
> > > +            continue;
> > > +       }
> > > +       if (len == 0) {
> > > +           error_setg(errp,
> > > +                      "Unexpected end-of-file on channel");
> > > +           return -1;
> > > +       }
> > > +       if (len < 0) {
> > > +           return -1;
> > > +       }
> > > +   }
> > > +
> > > +   return 0;
> > > +}
> 
> Thanks
> 
> Manish Mishra
> 

-- 
Peter Xu


