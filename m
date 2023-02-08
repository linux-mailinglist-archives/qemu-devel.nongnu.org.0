Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE92068F7ED
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:22:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPq1L-0003ot-7C; Wed, 08 Feb 2023 14:22:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPq1H-0003ob-3a
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:22:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPq1E-0005ER-DR
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:22:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675884130;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qYzGwxxPXTYPKdE4Xr18Ej5weo8rpsXvWZxPRLJlp/k=;
 b=QkwyJJCIDK3Y6C4AeYkcnh5qlJs/ycEfOeixTEOrYZjH6LjwA1WLhn7LGLFxBW0d/yHy7d
 k7tp4ooSgCMAAihZu3cjhCN4FEVmlemrRQza2pCx/p8DYSfXm0JHYvrf7zsi5JZM/lQtKj
 WMv7m0Nrx1ScSMWeu6ohbMDunhI7PAE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-e6rDZRBJPR6thqhak9MlSw-1; Wed, 08 Feb 2023 14:22:08 -0500
X-MC-Unique: e6rDZRBJPR6thqhak9MlSw-1
Received: by mail-wm1-f71.google.com with SMTP id
 a20-20020a05600c349400b003dfecb98d38so1643166wmq.0
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 11:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qYzGwxxPXTYPKdE4Xr18Ej5weo8rpsXvWZxPRLJlp/k=;
 b=WdMoInsHLDj7SZV41RRWH0I08eQ/mFH7GziC42A+sLhxtyDWGZWT58W7zsRO7CLseE
 PHvB+jE6nEpLECxMTXqrZO2bbDzJ95T56WoQzGHAwOn1roLoDBrfJhpDLn/WiBSjdSwE
 uQDTnZTJBuBqvyNIAr94WAjaNfXAaztwG0aqONpICQxoqjKXmjlTSzVDg1iP14TV2ri9
 YOvnTUMBjpCEqJH/z0Q0gI37qA+dPI9239BbNBiqZI/2IVvgws6Qj9lOieKSTAM4odOR
 +mDiML0AdI1iBQzo2JXwlUnuxoaHJQk+RlNnAhhVw8hZRA0W22KXCjRpZezxCy94IcmE
 96sw==
X-Gm-Message-State: AO0yUKW1M/N9F4rfZ35bnz2qOnwFqW0jmHrpbDTB6afp+KM8AS+eE8z+
 hqwA+pTEeKpcCZkUoKdvLII8EpLpP59gJ2k2sPwTIQDRjoR1LZi70oXfuQ591z5OCX/7a1ovh3/
 8q7XqZ97z6rkpY3g=
X-Received: by 2002:a05:600c:2b46:b0:3dc:50dd:361b with SMTP id
 e6-20020a05600c2b4600b003dc50dd361bmr7379718wmf.5.1675884127624; 
 Wed, 08 Feb 2023 11:22:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8LhAITnCEOky0ngWziw3y91lkArW15QZfZKridUow5iN1SKpXDk9bLtIEJqHYivRy1aqQgNA==
X-Received: by 2002:a05:600c:2b46:b0:3dc:50dd:361b with SMTP id
 e6-20020a05600c2b4600b003dc50dd361bmr7379710wmf.5.1675884127458; 
 Wed, 08 Feb 2023 11:22:07 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 x2-20020a1c7c02000000b003df30c94850sm2769798wmc.25.2023.02.08.11.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 11:22:06 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,  "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>,  Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH v2 3/3] migration: Postpone postcopy preempt channel to
 be after main
In-Reply-To: <20230202212458.726496-4-peterx@redhat.com> (Peter Xu's message
 of "Thu, 2 Feb 2023 16:24:58 -0500")
References: <20230202212458.726496-1-peterx@redhat.com>
 <20230202212458.726496-4-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 08 Feb 2023 20:22:05 +0100
Message-ID: <87h6vw9d42.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> Postcopy with preempt-mode enabled needs two channels to communicate.  The
> order of channel establishment is not guaranteed.  It can happen that the
> dest QEMU got the preempt channel connection request before the main
> channel is established, then the migration may make no progress even during
> precopy due to the wrong order.
>
> To fix it, create the preempt channel only if we know the main channel is
> established.
>
> For a general postcopy migration, we delay it until postcopy_start(),
> that's where we already went through some part of precopy on the main
> channel.  To make sure dest QEMU has already established the channel, we
> wait until we got the first PONG received.  That's something we do at the
> start of precopy when postcopy enabled so it's guaranteed to happen sooner
> or later.
>
> For a postcopy recovery, we delay it to qemu_savevm_state_resume_prepare()
> where we'll have round trips of data on bitmap synchronizations, which
> means the main channel must have been established.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

But I still think that our channel setup is overcomplex (famous last
words, specially thinking that I designed it, sniff).

Later, Juan.


