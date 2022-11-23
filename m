Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AA66364CE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 16:53:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxs2n-0007iT-B2; Wed, 23 Nov 2022 10:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oxs2l-0007iK-RS
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:52:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oxs2k-00075n-1h
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:52:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669218727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MUOTcqHx2mIi86NbInIQZNNqogoGyS5ndarTTII2Wo8=;
 b=TOMysaI+ZdfR1iUpGk/YGb1YJX5qV5fFss1WsOc5e6cKJNMCU655V2vgSGzMzO8z3lURFd
 9ItMCls1cCOd/K3ltTnu1+SfXB/i6jaBuxz5NGAO7gez+cb2O4frbSLxsiYJ7qvLEzIZs8
 DpDHpOokCoScS7etfx3SeXAPTKlTDd8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-204-DLQF057HNxOsiqo1PvmfnQ-1; Wed, 23 Nov 2022 10:52:04 -0500
X-MC-Unique: DLQF057HNxOsiqo1PvmfnQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 de43-20020a05620a372b00b006fae7e5117fso22723665qkb.6
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 07:52:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MUOTcqHx2mIi86NbInIQZNNqogoGyS5ndarTTII2Wo8=;
 b=iybirDlov5dwVYd2ReqLQX0t58m0kpRDNnkDa8LkdCrtzdo/Ek4yEWyqWeNaYeXMwb
 K/7PnLnHndMMcc3Zp6l4UJqpipbRWv+EUjqEG/AHbZVCPnCC0fvNG8hpngtqzrFqmcOD
 HCNREqpahB0uBzlDbunbbG7bKUCQawxQ9IIQWmJH0oov+j7MOj/DDJNf1GBMKs+qS0Ds
 cHQxOpdJXjM5OGFsseTfLG46AYEyb5aAd9XIc7SQK1kV0yHmySVu93ylmRAIw2yvPk4H
 69AEwQ8OTyYVgAEyCvZ7NAl5wiGt+B7BVuxL5pf2fZJ/MCTwujXl7zY1e+iIzIvInNJG
 I+5g==
X-Gm-Message-State: ANoB5pl4DYTkONYOyuQEVmWnMVwC3Z05FM1FdMhGeQTealZCmFC+PHmR
 UKfqsHfeJon5rMHJu+Z5Cdc2dWlqz6XWvz00PPjMLU0ZNxgBRCBYB+la5aBLqaa3C2FnofHLPQ3
 ihKxsOEgJeUFSX0A=
X-Received: by 2002:a37:4043:0:b0:6ee:b095:a047 with SMTP id
 n64-20020a374043000000b006eeb095a047mr25574218qka.524.1669218722940; 
 Wed, 23 Nov 2022 07:52:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4fDWl+CNGmJNhU89zcHfgfQvXubZRkI+G++akQOZzS8nQOCHZbJImNsZXOfnO12GLsl0SzMw==
X-Received: by 2002:a37:4043:0:b0:6ee:b095:a047 with SMTP id
 n64-20020a374043000000b006eeb095a047mr25574200qka.524.1669218722715; 
 Wed, 23 Nov 2022 07:52:02 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 m21-20020a05620a24d500b006ce0733caebsm12593386qkn.14.2022.11.23.07.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 07:52:02 -0800 (PST)
Date: Wed, 23 Nov 2022 10:52:01 -0500
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
Subject: Re: [PATCH v4 2/2] migration: check magic value for deciding the
 mapping of channels
Message-ID: <Y35BoSi9NUmbFoCk@x1n>
References: <20221123150527.24608-1-manish.mishra@nutanix.com>
 <20221123150527.24608-3-manish.mishra@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221123150527.24608-3-manish.mishra@nutanix.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Wed, Nov 23, 2022 at 03:05:27PM +0000, manish.mishra wrote:
> +int migration_channel_read_peek(QIOChannel *ioc,
> +                                const char *buf,
> +                                const size_t buflen,
> +                                Error **errp)
> +{
> +   ssize_t len = 0;
> +   struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
> +
> +   while (len < buflen) {
> +       len = qio_channel_readv_full(ioc, &iov, 1, NULL,
> +                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
> +
> +       if (len == QIO_CHANNEL_ERR_BLOCK) {

This needs to take care of partial len too?

> +            if (qemu_in_coroutine()) {
> +                /* 1ms sleep. */
> +                qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 1000000);
> +            } else {
> +                qio_channel_wait(ioc, G_IO_IN);
> +            }
> +            continue;
> +       }
> +       if (len == 0) {
> +           error_setg(errp,
> +                      "Unexpected end-of-file on channel");
> +           return -1;
> +       }
> +       if (len < 0) {
> +           return -1;
> +       }
> +   }
> +
> +   return 0;
> +}

-- 
Peter Xu


