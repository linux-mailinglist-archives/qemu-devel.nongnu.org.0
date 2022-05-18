Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE4052BB5F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 15:12:31 +0200 (CEST)
Received: from localhost ([::1]:50058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrJTa-0007FO-ID
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 09:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nrJLr-0007pa-Vl
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:04:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nrJLm-00062y-62
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652879065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IPAExsb57jJXRawYX39BXtSE3NYt2x2Y+tOn2ROL5X8=;
 b=fbyS8MAATauF6vXZ+38spP+MNmqDyj4tcLWHX7KIDJ+F4+7odR16vKN1bO5SMx0TEBZSTm
 ZbGbbNsqBOu+V8u+mpVHKQSUyvKbKB/J9wP03Q+4OMn1w3MTuMHsU5OhLxgJmAUxeTxjjG
 Jz/D+yMro58KPpAhZJxVWh0MqSFXVIU=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-bKzERCmNMRevlfvsx_YZUQ-1; Wed, 18 May 2022 09:04:22 -0400
X-MC-Unique: bKzERCmNMRevlfvsx_YZUQ-1
Received: by mail-il1-f198.google.com with SMTP id
 x1-20020a056e020f0100b002c98fce9c13so1248824ilj.3
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 06:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IPAExsb57jJXRawYX39BXtSE3NYt2x2Y+tOn2ROL5X8=;
 b=X2bOz90KDZ/Baj9SULKgmMZHxG0BbrOxk/MldsxJkR3bBmYzr0MEgpOowYo8oUTOYC
 hEK/0vzVvOrU0ifeBdLYdrvAQY0WTXn+fYyO7C/kZ+zssEn1Ms4ODbuGnynXVfp0Kv06
 yIx4cNSWh78CyNqPanzf4C3tUhrR41/yH+waD+xTAJmQJzVVJJrDYEbOXZu4csZAxsFz
 i/Cdo1mt+7Su39Wih79GkH4a751aeBZkiJJpRpcWfFnNOaxdRoPZH/R0QtEswRjuuE9Y
 npMNp0anWrH8XwTP6O2uEH/psYXmMLFayx7A1EBcnag2ThMde4BJPOC0QIOoAPAhwEGu
 44Lg==
X-Gm-Message-State: AOAM533C56ByNJgpwehC6TsULNMNMxkeQvicE58qWwJOYWUye0iB/oeN
 It7ulpxLmGhUAjTcEo4qqNYc1A6w1ah7xYl1FQ9sFKp/6U5zfNddbIhixQO6MaXeQa9lmiJdzWo
 Oc1nmg4c7togSgak=
X-Received: by 2002:a05:6602:2243:b0:657:c8eb:dc44 with SMTP id
 o3-20020a056602224300b00657c8ebdc44mr12543675ioo.145.1652879061605; 
 Wed, 18 May 2022 06:04:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7/cDC0cxC3NQtBo5n5neHwSHqoh5yYO0V8hbqPAkOP6ldG7wq0xh+Y9bcnDdhZU6ws7duOw==
X-Received: by 2002:a05:6602:2243:b0:657:c8eb:dc44 with SMTP id
 o3-20020a056602224300b00657c8ebdc44mr12543664ioo.145.1652879061360; 
 Wed, 18 May 2022 06:04:21 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a02cce1000000b0032e5417e910sm516533jaq.12.2022.05.18.06.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 06:04:20 -0700 (PDT)
Date: Wed, 18 May 2022 09:04:17 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v6 07/13] migration: Add helpers to detect TLS capability
Message-ID: <YoTu0buL1LVaLUyk@xz-m1.local>
References: <20220517195730.32312-1-peterx@redhat.com>
 <20220517195730.32312-8-peterx@redhat.com>
 <YoS06H6I0fZx/uAC@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YoS06H6I0fZx/uAC@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Wed, May 18, 2022 at 09:57:12AM +0100, Daniel P. Berrangé wrote:
> > @@ -37,4 +37,8 @@ void migration_tls_channel_connect(MigrationState *s,
> >                                     QIOChannel *ioc,
> >                                     const char *hostname,
> >                                     Error **errp);
> > +
> > +/* Whether the QIO channel requires further TLS handshake? */
> > +bool migrate_channel_requires_tls(QIOChannel *ioc);
> 
> I find this name somewhat confusing, as 'requires tls' and
> 'uses tls' are just synonyms for the same thing IMHO.
> 
> What this method is actually checking is whether we still need
> to upgrade the channel from plain text to TLS, by completing a
> TLS handshake. So can we call this:
> 
>   migrate_channel_requires_tls_upgrade

Sounds good.  I'll wait for more comments on other patches.  Thanks,

-- 
Peter Xu


