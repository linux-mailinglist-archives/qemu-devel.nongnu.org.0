Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7BE4B7B79
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 00:56:35 +0100 (CET)
Received: from localhost ([::1]:33708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK7gQ-0006wr-Ez
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 18:56:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK7eX-0005gB-AS
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 18:54:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK7eV-0005Iv-SB
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 18:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644969275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sv7obimQI43CFNdIjjHJlg1XEUE3Ki6ag5MwzFaH5Fo=;
 b=HhyS9CsySxm9Ebo2UWGW7wln3LDQ1WzblYdF12+iJcz10OLzkILTF+R/cVzh6bUDRbfD0i
 mXToToCV+dl2MJwzh+vUzHyP9eNAE5vzL1OvzZeAOWDRiGssg+QbkoajfUE0YjlEIrBHX8
 g6iYisFY3u9AUEL5wSP6WcGyh8amVCI=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-NkOe9yWuNIW3UMEwMPiZTw-1; Tue, 15 Feb 2022 18:54:34 -0500
X-MC-Unique: NkOe9yWuNIW3UMEwMPiZTw-1
Received: by mail-vk1-f200.google.com with SMTP id
 m194-20020a1fa3cb000000b0031fdcfe55e7so146833vke.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 15:54:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sv7obimQI43CFNdIjjHJlg1XEUE3Ki6ag5MwzFaH5Fo=;
 b=RIrjystAqWeemsLnixnWFCBEaxfQ2bKztv0HXX5IrhbDUKe/s5zxoJYPkUCJeeCqVS
 auc2g7MTtRBDQXCREkIcCWh2GbAX50QwvkesfrcCHXXqMouDL6CBj9NRlxxqW6UuzW+r
 nTbCxfWJvZ/fg1b50KqEslV4WqmGCE/AsfvFmmhu+JvsLvFOcex//vAI6+BRWhKzCQud
 P5ctsne8lC2vWRm/Tg2nLNla2R0AsECN69KYTRS0pHfQk5VTOpldoDltEHjlaUW+tHDp
 UbH4z7JLbmwdyWohGqqfGDIage2Aa3OCmQNYV4sxWWWX+gIHY6QiIxJ1jI85ARVKD1ul
 0V6w==
X-Gm-Message-State: AOAM532uisgyinVu/AH1I+qgHTWEkhOC9TCpBlrpcFkEatzFgzMkmCTq
 4qbem4vOXVq8M1wQDPC4Vb4dodg/F39bEMUOg5n4bIjmbI2C568wDtAKzKRPH6gzEskVsjctJmM
 x5hCDmleVrdspvtD5LgPZ9NYuwr4gUYc=
X-Received: by 2002:ab0:48b2:0:b0:30b:883e:d88a with SMTP id
 x47-20020ab048b2000000b0030b883ed88amr33243uac.87.1644969273766; 
 Tue, 15 Feb 2022 15:54:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybH18liTFKINuqgEytyno+s/BtkVWRm6/rW7hVBlnP9eMgDJnqS2mqzJaJ+Vp8aYBtpySmIk1CDVIgf10UNBg=
X-Received: by 2002:ab0:48b2:0:b0:30b:883e:d88a with SMTP id
 x47-20020ab048b2000000b0030b883ed88amr33233uac.87.1644969273542; Tue, 15 Feb
 2022 15:54:33 -0800 (PST)
MIME-Version: 1.0
References: <20220215220853.4179173-1-jsnow@redhat.com>
 <20220215220853.4179173-3-jsnow@redhat.com>
 <20220215225818.stzmm2ui2yp345v6@redhat.com>
In-Reply-To: <20220215225818.stzmm2ui2yp345v6@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 15 Feb 2022 18:54:22 -0500
Message-ID: <CAFn=p-ZH0HWA8yJWxF_0nZvfL2=abhQMf-oPGv8yVfQxqUPMYw@mail.gmail.com>
Subject: Re: [PATCH 2/4] iotests: add VerboseProcessError
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 5:58 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Tue, Feb 15, 2022 at 05:08:51PM -0500, John Snow wrote:
> > This adds an Exception that extends the garden variety
> > subprocess.CalledProcessError. When this exception is raised, it will
> > still be caught when selecting for the stdlib variant.
> >
> > The difference is that the str() method of this Exception also adds the
> > stdout/stderr logs. In effect, if this exception goes unhandled, Python
> > will print the output in a nice, highlighted box to the terminal so that
> > it's easy to spot.
> >
> > This should save some headache from having to re-run test suites with
> > debugging enabled if we augment the exceptions we print more information
>
> This didn't parse well for me.  Maybe
> s/enabled/enabled,/ s/print more/print with more/
>

*cough* copy-paste failure. Two drafts collided here. Oopsie.


