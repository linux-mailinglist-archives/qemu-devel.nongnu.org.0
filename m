Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5824D4CDC86
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 19:32:09 +0100 (CET)
Received: from localhost ([::1]:50258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQCim-0001bp-9z
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 13:32:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nQCfX-00083t-KG
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:28:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nQCfR-0004Dz-GR
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:28:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646418520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aT571ZHY94nTrFNLacZxNd/vn1stDjS/niJ2mQL87L8=;
 b=P0zaOKmvWVkjglsaXebzJUW/FBxB0CM2GftVpR/4SWYuXgF5w18MqaNUa/MeRltwlQXE5F
 BM33YJgFfCqx4ftCbdsk2N3XSrBlZG6lsNr1fWqF4kdUcTXp4lyv+ePjAMd/qbzgHCiEQ+
 UZRY4GdpV20uQJ+at+18QEeqRTDpSwU=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-va9aKSgVNJqlTYkK5tAbcg-1; Fri, 04 Mar 2022 13:28:39 -0500
X-MC-Unique: va9aKSgVNJqlTYkK5tAbcg-1
Received: by mail-ua1-f71.google.com with SMTP id
 i39-20020a9f3b27000000b00341888cb8e8so4354408uah.5
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 10:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aT571ZHY94nTrFNLacZxNd/vn1stDjS/niJ2mQL87L8=;
 b=1VRCF15xodv7flgXLhffNAs2FImU1v5YqydR4MYtOGk/VvAoFOj7Y867IsDGVP0Ry9
 aiW4yBOC65Y3RRsm22UQ3z7f+RmQFEImwn0WZN/KWX9VoZp9b0UGtrxloHulkuHB05c2
 BwS1MMGWpi1pIL/EYhYecMNwFvbamRC6YsXllJWhuYia90JSLkjF6EsimOR8xGgBcDGE
 YVXrQKlZ+FuqmRaIp2nHM32xDkXNlAL3KZEtH7HHGjbmrqB6uAm4E2Laf6KojqCKeOPV
 y6mIL/Nl5jtduwmOOp9z7ITw7hfNgKR+tUk5VrblGzNxqJDNhpeHvIWYb3CRNeo1GO8C
 vrFA==
X-Gm-Message-State: AOAM531seKgYEjt9U9FOfOq1zYSa9k28wwl4Y66dgJKie+K88DcTaNnE
 3+8phfkjoxqkI0O1IcaYQ3lqOQkmST8avwdjdDzi1f1UMazK/tCxHmOx0eHzVl9ECU+GbBu2kR0
 eAqiLM0wg8zA7x14mJszj6xSufkZqpjs=
X-Received: by 2002:a05:6122:985:b0:32d:a8d5:7b12 with SMTP id
 g5-20020a056122098500b0032da8d57b12mr18356472vkd.3.1646418518494; 
 Fri, 04 Mar 2022 10:28:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwO8Nl8mSZjJu7juc6KrFY49Jts2xkYZ0b5q6nAOd5y9gV+0DSJoNcv/+sFbbhCXJSPlE130B68Jbz2+EivV7w=
X-Received: by 2002:a05:6122:985:b0:32d:a8d5:7b12 with SMTP id
 g5-20020a056122098500b0032da8d57b12mr18356463vkd.3.1646418518298; Fri, 04 Mar
 2022 10:28:38 -0800 (PST)
MIME-Version: 1.0
References: <20220225205948.3693480-1-jsnow@redhat.com>
 <YiJRKKMtK9sdB1+9@redhat.com>
In-Reply-To: <YiJRKKMtK9sdB1+9@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 4 Mar 2022 13:28:27 -0500
Message-ID: <CAFn=p-ZvGQkd51AvBmfDuyXb=mCRS061EOcjk5Hj46wccVVCCA@mail.gmail.com>
Subject: Re: [PATCH 00/10] Python: Fix qmp race condition on accept()
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 4, 2022 at 12:49 PM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 25.02.2022 um 21:59 hat John Snow geschrieben:
> > GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-accept-changes
> > CI: https://gitlab.com/jsnow/qemu/-/pipelines/479795153
> >
> > This redesigns the async QMP interface to allow for race-free
> > connections from the synchronous interface. It should hopefully address
> > the race conditions Peter has been seeing on the NetBSD vm tests.
>
> Acked-by: Kevin Wolf <kwolf@redhat.com>
>

Thanks so much to the both of you!

I was dreading this fix, but it wound up being *pretty* clean in the
end, I think. I really appreciate the double-check here.

--js


