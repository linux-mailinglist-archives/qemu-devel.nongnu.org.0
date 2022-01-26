Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D73149D400
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 22:03:59 +0100 (CET)
Received: from localhost ([::1]:42800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCpSQ-0005tV-7N
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 16:03:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpPi-0004jf-5N
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:01:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpPY-0004RS-Ez
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643230842;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=pnGRIAhii2005dF01CqB1t74u1l7SVK1ypHgeTRvJ8E=;
 b=T8qQtWk5Wv7AKFxZUafHtN3wgyInDSWamm7f8X0xQmXDSXV6hlI9tJ/yJcw1t5CGQNWE0M
 7rbvTjs7+TNU3dfXvgO+x7VTKQ3CKbHJPkdzum1vxDqL16ic+gDelVzHr/nQAmP81IvuQK
 /5JWmCzIDOw1ICJybUHd38zcrfn2ak4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-DHnYE9ihNhCDs3VyaaOu-A-1; Wed, 26 Jan 2022 16:00:40 -0500
X-MC-Unique: DHnYE9ihNhCDs3VyaaOu-A-1
Received: by mail-wr1-f70.google.com with SMTP id
 a6-20020adfbc46000000b001d7370ace6eso172194wrh.9
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:00:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=pnGRIAhii2005dF01CqB1t74u1l7SVK1ypHgeTRvJ8E=;
 b=B4SFo6wcfe1fWx1MT5HL0/ZJy2u9demdHHE6VIW6Y3wiJp8W/Z9/1fmn8oQ0qOiK60
 D18GOfnekQym7A2dELo6L05aSldjccKlu23TzBsCO5iTnI6+EKosng/Ycw68C/ZbNeh9
 tcDQwjWn5PihsD9CeyBXbgHe6GYFj0zym1z/HXasIK3CN3RiLS4p/FyVB48SD1npaTzR
 6TgFGo1KiF7FwrjDI443id+ig+4P/1/W2YCKG/WR30AfdgEH7jLGCqWFBi0AMwobp/QN
 AA6bPVjyrc/h3R6JYpHbw1iO4f/CdCiIPQSclFswE1O2xUy8xkfuTqOeK9rdoB25Kv/p
 U5JQ==
X-Gm-Message-State: AOAM530tcnwfQB5gQ2GLxBzOJOpxBQWDAQjKJZF7m0ae/74dDg+tIXCu
 7ApEUm89IHherWXvmpFcmRr1nmdk9/KsGQUKo5T7SAgJ+9kzQuhkcqJcD9VSKML3AEK0D7oJJ1Y
 I3GHqDHF1FYAgISA=
X-Received: by 2002:a5d:6211:: with SMTP id y17mr295889wru.73.1643230838776;
 Wed, 26 Jan 2022 13:00:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRxAiDypWRtASBHbfW1a4CUTeQ1hf3VqbW4O00OHd8+LtyM4ORwKqmA2CM8Pg0FBIPyZqkdg==
X-Received: by 2002:a5d:6211:: with SMTP id y17mr295880wru.73.1643230838603;
 Wed, 26 Jan 2022 13:00:38 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id u15sm386459wrs.17.2022.01.26.13.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 13:00:38 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Xu Zheng <xuzheng@cmss.chinamobile.com>
Subject: Re: [PATCH] migration/ram: clean up unused comment.
In-Reply-To: <20220117023003.1655917-1-xuzheng@cmss.chinamobile.com> (Xu
 Zheng's message of "Mon, 17 Jan 2022 10:30:03 +0800")
References: <20220117023003.1655917-1-xuzheng@cmss.chinamobile.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 26 Jan 2022 22:00:37 +0100
Message-ID: <87ee4unrey.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
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
Reply-To: quintela@redhat.com
Cc: dgilbert@redhat.com, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Xu Zheng <xuzheng@cmss.chinamobile.com> wrote:
> Just a removal of an unused comment.
> a0a8aa147aa did many fixes and removed the parameter named "ms", but
> forget to remove the corresponding comment in function named
> "ram_save_host_page".
>
> Signed-off-by: Xu Zheng <xuzheng@cmss.chinamobile.com>
> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.

> ---
>  migration/ram.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/migration/ram.c b/migration/ram.c
> index 57efa67f20..96944f0c70 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2188,7 +2188,6 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,

Somehow git diff got confised here, and shows ram_save_target_page where
it is ram_save_host_page().  I fixued it manually.


>   * Returns the number of pages written or negative on error
>   *
>   * @rs: current RAM state
> - * @ms: current migration state
>   * @pss: data about the page we want to send
>   * @last_stage: if we are at the completion stage
>   */


