Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FBD621DC7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 21:40:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osVMp-0007XF-Gh; Tue, 08 Nov 2022 15:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1osVMm-0007X3-U9
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 15:38:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1osVMl-0007Pl-5U
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 15:38:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667939917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EHcWW1I8IWjO0Nj+LmXQCp3kA0MCFB/uTFl00xFqWvU=;
 b=ZZZSE5pBA1vAZ51Jcr56JHPe4DXP7Cszf1m7wvUmJ6FSorQXdBarLwl6RpWvX0cPt589XP
 2kRh6nl6K5L0CRHaocXMVcKTBGItC0H0gbo0ew9Cqa4FITzQUGPWra8yQ3c97WJbGKAG31
 vz2IaaNFjcuXmQunbSQA53rwMQOCecY=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-7HSjnMI-N0avMY9cjNVthA-1; Tue, 08 Nov 2022 15:38:36 -0500
X-MC-Unique: 7HSjnMI-N0avMY9cjNVthA-1
Received: by mail-lf1-f72.google.com with SMTP id
 u3-20020a05651220c300b004a4413d37dcso5248800lfr.6
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 12:38:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EHcWW1I8IWjO0Nj+LmXQCp3kA0MCFB/uTFl00xFqWvU=;
 b=4tIftuyu9lEDQol0/s1sijB4XBwYpoE7sp4+d4XLzlb2mL8weAMqsjCou9HH7CLCZF
 NzlDHHTTUJHp1U3a2dJPqbibegpyKo8Mlp65xNTwLy81wjwFxD19Kn2ywaqiet1lgWD/
 dDyvVfud3cAjoS+G4DKfljw+vk9fb0vtSb43GqBagUZjQaY16Y/HVIg3lTE4iWGBx4qI
 MoOwPYgh/4cCNjoEF3yFR96aBjd5RJTatEfmWCYByM1VU0vOer5yiN7YipOLUhNl0iLS
 9scPRwG/bbUWSQ4Mxmtzx3NL2+JT4sUv058QZr6RYoZ6RDlIlZhZvNl7DP4+M6HVoqqj
 vwsg==
X-Gm-Message-State: ACrzQf0eefrAHUb5E8KvfsiJfkTk8NgtZ5hEPsAb0G+mJZYNV2h2wqUs
 egp7rO9Dl7vgnZLx9rnRNg7ZG1nH/vOM+D92kw7JvH0802NpyVV8bae7r6UJg1ojMiZJnDOc6tl
 2TgVtHFhraC6BwHJhKjTwnnZdQkgcTKM=
X-Received: by 2002:ac2:5d4e:0:b0:4b0:830c:3e08 with SMTP id
 w14-20020ac25d4e000000b004b0830c3e08mr20445740lfd.670.1667939914626; 
 Tue, 08 Nov 2022 12:38:34 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5I6pBkNNJ493pQHmfySVP86JrKu3AL1R6EinACyInwSX2YMJbNlvDfv8/3pnqJiAgp3wFfIgMexueX3OoW9LQ=
X-Received: by 2002:ac2:5d4e:0:b0:4b0:830c:3e08 with SMTP id
 w14-20020ac25d4e000000b004b0830c3e08mr20445714lfd.670.1667939914352; Tue, 08
 Nov 2022 12:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20221103102741.11201-1-davydov-max@yandex-team.ru>
 <20221103102741.11201-3-davydov-max@yandex-team.ru>
In-Reply-To: <20221103102741.11201-3-davydov-max@yandex-team.ru>
From: John Snow <jsnow@redhat.com>
Date: Tue, 8 Nov 2022 15:38:21 -0500
Message-ID: <CAFn=p-aMT7Z3ybbuLvpZb2dphn5ybhwN=OBnKP23PYWb5KshVg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] python/qmp: increase read buffer size
To: Maksim Davydov <davydov-max@yandex-team.ru>
Cc: qemu-devel@nongnu.org, vsementsov@yandex-team.ru, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com, 
 crosa@redhat.com, bleal@redhat.com, eblake@redhat.com, armbru@redhat.com, 
 pbonzini@redhat.com, berrange@redhat.com, alxndr@bu.edu, bsd@redhat.com, 
 stefanha@redhat.com, thuth@redhat.com, darren.kenny@oracle.com, 
 Qiuhao.Li@outlook.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

On Thu, Nov 3, 2022 at 6:29 AM Maksim Davydov
<davydov-max@yandex-team.ru> wrote:
>
> After modification of "query-machines" command the buffer size should be
> more than 452kB to contain output with compat-props.
>
> Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  python/qemu/qmp/qmp_client.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/python/qemu/qmp/qmp_client.py b/python/qemu/qmp/qmp_client.py
> index 5dcda04a75..659fe4d98c 100644
> --- a/python/qemu/qmp/qmp_client.py
> +++ b/python/qemu/qmp/qmp_client.py
> @@ -197,8 +197,8 @@ async def run(self, address='/tmp/qemu.socket'):
>      #: Logger object used for debugging messages.
>      logger = logging.getLogger(__name__)
>
> -    # Read buffer limit; large enough to accept query-qmp-schema
> -    _limit = (256 * 1024)
> +    # Read buffer limit; large enough to accept query-machines
> +    _limit = (512 * 1024)

wow :)

>
>      # Type alias for pending execute() result items
>      _PendingT = Union[Message, ExecInterruptedError]
> --
> 2.25.1
>

If you would please submit this to
https://gitlab.com/qemu-project/python-qemu-qmp I can get it merged
there quickly, then backport it to qemu.git.
Or, if you don't have a gitlab account (and do not want one), please
let me know and I'll port it there myself so you don't have to.

thanks,
--js


