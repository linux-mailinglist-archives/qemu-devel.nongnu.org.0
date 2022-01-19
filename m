Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD61493FAC
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 19:12:19 +0100 (CET)
Received: from localhost ([::1]:36446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAFRT-00008l-1Z
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 13:12:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAFN2-00075C-8y
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 13:07:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAFMz-0002dn-UX
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 13:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642615660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XMao+zBCBs4+IETnYCzzWJxZxalsCZ8dMeh0FiXfjMY=;
 b=SmQcH5SClsnF/5aMTOrMuh9FyIAoogSP1DlNX36KrVdDliU3pMXtvfkRfNoWgE4dPfNT8v
 uOjcJHk3q3quVcaA2H2qCpBPftSdbD3xXSCQr7U5XwhS0CA6TKWPAIhGLwPwCXQEsQojv3
 1AUjIElR1qeTAgdRtPAvMpk1K+R9xlE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-tR-CM3kaPUiK4iyivAbglA-1; Wed, 19 Jan 2022 13:07:39 -0500
X-MC-Unique: tR-CM3kaPUiK4iyivAbglA-1
Received: by mail-ed1-f71.google.com with SMTP id
 z9-20020a05640240c900b003fea688a17eso3428006edb.10
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 10:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XMao+zBCBs4+IETnYCzzWJxZxalsCZ8dMeh0FiXfjMY=;
 b=o/YQDo8EaUnen2zVANnTRCUqxiDN0h4i1mXRYm70FgMEr6wt001srUos6+omG5GkqN
 Sbi+A48k/DM55OdseU7Oe7Gx88hRx7yTAsisckpcR+BDx19T4m3rQTazA4VSrzz5GKXd
 9DLYiBevtklXLnVLRztplodUhv0PD6CY5Q3JuBoUiQ+5aR+jQabXVmdOzvPKG739aVtF
 ZsLlDTgm0vBUnlYiFHzO8MeflDwSmq9wmx1Dp7BhpTdMP8GQQS7x0sr6Yph0Rt8ICtO7
 iVra8LlrJ8Q75yOHlY6ChDsc0AJewUgN3FFsaya5o6zPTn38uVpxbX4E5I7Na0kMnyXk
 00OQ==
X-Gm-Message-State: AOAM533YTWTiyIyi1qAPZPafjr5FWFq9zLNxptfz32+RFGQYqSm3ZJdz
 Q0nbp15wOdr9MyJ/bOrYwJC6vTiguYj9LrCSK5tmTALdZWRb8o3Bff685SgG36G6RGQ0LRv+tjn
 p4z+Iv+xgSm8X0rSP98YPpoKvXM8GgF0=
X-Received: by 2002:a2e:8053:: with SMTP id p19mr25474507ljg.318.1642615657130; 
 Wed, 19 Jan 2022 10:07:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykkuN7eF1vYI2xW0nU5RTYuZGZtgDs4dFT+wM83A/LRdzj5GBmeigkw6EqSmvE6yoQFuW8J1AybgMlLdSUFK0=
X-Received: by 2002:a2e:8053:: with SMTP id p19mr25474475ljg.318.1642615656706; 
 Wed, 19 Jan 2022 10:07:36 -0800 (PST)
MIME-Version: 1.0
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-5-leobras@redhat.com>
 <YeAk48s3ckQrd1F0@redhat.com>
In-Reply-To: <YeAk48s3ckQrd1F0@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 19 Jan 2022 15:07:25 -0300
Message-ID: <CAJ6HWG6K9Rjfc=VLYQpfaka5goWyr7KoAVeKk_nOg3_MSPbpWw@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] migration: Add migrate_use_tls() helper
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Daniel,

On Thu, Jan 13, 2022 at 10:11 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Thu, Jan 06, 2022 at 07:13:41PM -0300, Leonardo Bras wrote:
> > A lot of places check parameters.tls_creds in order to evaluate if TLS =
is
> > in use, and sometimes call migrate_get_current() just for that test.
> >
> > Add new helper function migrate_use_tls() in order to simplify testing
> > for TLS usage.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > Reviewed-by: Juan Quintela <quintela@redhat.com>
> > ---
> >  migration/migration.h | 1 +
> >  migration/channel.c   | 6 +++---
> >  migration/migration.c | 9 +++++++++
> >  migration/multifd.c   | 5 +----
> >  4 files changed, 14 insertions(+), 7 deletions(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>

Thanks!

> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

Best regards,
Leo


