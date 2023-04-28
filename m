Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069C46F1DA4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 19:52:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSGF-0001LQ-Qg; Fri, 28 Apr 2023 13:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSG5-0001KQ-Vk
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:51:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSG2-0003kR-G2
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:51:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682704305;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=DXdlrqFO/ZytZNlqgsSTU7tzuqGKJCOaJoAckswEO2E=;
 b=YQprp4Vqzhakx8f3IB0GOSE3dcqdv5D5UQi/OLG+OR1lWMSinsjfxzT6ZyTPweKGC9Rtse
 qW9p5TGTfELPtUqf4T0VmfxLHvzEl2JF0yVzsdYmxR2zcEGZGX6MGBpebPCc7cHP9KKx6n
 FP79mncAG2XaIKe4n10ewoseBL0vlj0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592--j6pHKfON-WuX4pk2BEJMA-1; Fri, 28 Apr 2023 13:51:44 -0400
X-MC-Unique: -j6pHKfON-WuX4pk2BEJMA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2f479aeddc4so7740f8f.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 10:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682704303; x=1685296303;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DXdlrqFO/ZytZNlqgsSTU7tzuqGKJCOaJoAckswEO2E=;
 b=D7lsqNfUWvHpsZCEFipncTLKECDKMaEJvOuErMWaXXWz17KVI9+DqVc38B4h6swzEy
 uK+vlRCctdftstqA47LBxGePVcRj21McugatF5gs1GxMjJWws5Z0Vbm211El4fuBJbk0
 VJxxz8yK8OUi6lvI6AL/huS/5TmQDmkKzJM4yT+GzEUhzrBRglbVmUVwPE8tPnjTtKLG
 xgSWCW/JcnnI5i+lITjMvZkEdDD6cqEdzKmuiXBc159FgIOqpNM4VI6zhYKn1RCLN7Ek
 QQR/AxpHIftVoBb4iYslN+u9IXvNtJ1mq5HkeJ3QlMIGsBPw9GMVv4vVxWjSogh6PgB8
 gOCg==
X-Gm-Message-State: AC+VfDw1tfqBa/9NiKI0VNpJKANUeYKF3JU3v/f0e5qBCqUY+cfGT/OT
 EwaI2eviEXhbTZWuiLHgRKM2DtyhC09MXUAr/ZJ3YqIPbLho7XKAZ5ocP9BCk2zQJ/SOEkT+utX
 e304cz5kqok8nTNc=
X-Received: by 2002:a05:6000:11c5:b0:2fb:600e:55bd with SMTP id
 i5-20020a05600011c500b002fb600e55bdmr4943729wrx.39.1682704302897; 
 Fri, 28 Apr 2023 10:51:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6hLPfCIfShpV1u5iinIwkoh5ZgVZzKE7jj63wraY/zo76tSjjfoOmOlgQSiuvuZjUP5z+nag==
X-Received: by 2002:a05:6000:11c5:b0:2fb:600e:55bd with SMTP id
 i5-20020a05600011c500b002fb600e55bdmr4943715wrx.39.1682704302570; 
 Fri, 28 Apr 2023 10:51:42 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 d13-20020adfe88d000000b002e55cc69169sm21596225wrm.38.2023.04.28.10.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 10:51:42 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  peter.maydell@linaro.org,
 pbonzini@redhat.com,  marcandre.lureau@redhat.com,  berrange@redhat.com,
 thuth@redhat.com,  philmd@linaro.org,  mst@redhat.com,
 imammedo@redhat.com,  anisinha@redhat.com,  eblake@redhat.com,
 kraxel@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 arei.gonglei@huawei.com,  pizhenwei@bytedance.com,  jsnow@redhat.com,
 vsementsov@yandex-team.ru,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  wangyanan55@huawei.com,  peterx@redhat.com,
 leobras@redhat.com,  jasowang@redhat.com,  yuval.shaia.ml@gmail.com,
 pavel.dovgaluk@ispras.ru,  jiri@resnulli.us,  stefanb@linux.vnet.ibm.com,
 stefanha@redhat.com,  lukasstraub2@web.de,  kkostiuk@redhat.com,
 qemu-block@nongnu.org,  victortoso@redhat.com
Subject: Re: [PATCH 17/17] qapi: Reformat doc comments to conform to current
 conventions
In-Reply-To: <20230428105429.1687850-18-armbru@redhat.com> (Markus
 Armbruster's message of "Fri, 28 Apr 2023 12:54:29 +0200")
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-18-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 19:51:41 +0200
Message-ID: <87o7n799oy.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Markus Armbruster <armbru@redhat.com> wrote:
> Change
>
>     # @name: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
>     #        do eiusmod tempor incididunt ut labore et dolore magna aliqua.
>
> to
>
>     # @name: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
>     #     do eiusmod tempor incididunt ut labore et dolore magna aliqua.
>
> See recent commit "qapi: Relax doc string @name: description
> indentation rules" for rationale.
>
> Reflow paragraphs to 70 columns width, and consistently use two spaces
> to separate sentences.
>
> To check the generated documentation does not change, I compared the
> generated HTML before and after this commit with "wdiff -3".  Finds no
> differences.  Comparing with diff is not useful, as the reflown
> paragraphs are visible there.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I am really trusting your run of wdiff -3 O:-)
I haven't read the whole diff.


