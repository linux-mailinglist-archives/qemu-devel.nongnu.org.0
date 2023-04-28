Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE1F6F1DF8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 20:26:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSnJ-0001Ry-DS; Fri, 28 Apr 2023 14:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSnI-0001RR-0T
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:26:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSnF-0002S5-IA
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:26:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682706363;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ZuYEjxmr34Pu2ubOiR+2PbU0mTzBECUYjyE1sCH0r8o=;
 b=CeVFZ6dlZ7gdO6pio6IvP3OwQ7dQl6SZ+ptNpP19OCTvQhAW5V2NSgak4MeJQ9lLmvICce
 6ZKvNpG+Pf9cO0+TDedplYNu7BERm6ENKsp61tStfGC30JG+wv7TgU7R8VOh172pwJy9rF
 Xrzi0eBbLRmkA7q6DblZfYq9cdmVF1w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-QyXlL20nMAmC48NAnrChRQ-1; Fri, 28 Apr 2023 14:26:02 -0400
X-MC-Unique: QyXlL20nMAmC48NAnrChRQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f19517536eso34506725e9.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 11:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682706361; x=1685298361;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZuYEjxmr34Pu2ubOiR+2PbU0mTzBECUYjyE1sCH0r8o=;
 b=Lu1KCTUBcdwwE0WfppaldalPY/GsQ8ZLwdBV0Nveq6StFpDwaI15Qi2Prswg1xKH8x
 IJOEgRdu8O9BXh/JJRqfKdDzhDVvsYZSjld/E6vREp1N07cWVEadRygciY1CGw5TqwVr
 2EyayAVUukdbYCBppqQ0iPh19k893h3MJrgmtjIRtNAkJT9vaRA/6p7QaOUrMOM7Djnp
 bbGPzY6JkzdulIgZ6wgR+pBZJ7QyqTNnDy07XMtIUrsKET2fJbaK6lRX0Blmm+sQIigq
 yjDxFWrjJG7wW04Owgyxaaee+maK3n/0NossxqA2Y0xKUyRQXRGiS55uEWN0Is26uvOK
 r2uQ==
X-Gm-Message-State: AC+VfDw5jo+Xo6TuakJ0PdYz979Tz+aaFeOefOnZDEvmyMsfz1z3FjgQ
 OGFzd0eUKwntx7hsAUUfeLeq/1pR2J6colZFevBbp7+xiCvHsxkBK9MN/AGvqkoF7zGd0p8u1xJ
 gQFMiAJ8Y8hjyjq4=
X-Received: by 2002:adf:fccc:0:b0:2f7:8acb:b823 with SMTP id
 f12-20020adffccc000000b002f78acbb823mr4451996wrs.56.1682706361129; 
 Fri, 28 Apr 2023 11:26:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4q3CddR5Zfm7UjARYrgSSW9B3w//jhybC89yoXHX0gzaQCZG5Ik8Ewg80SyAtJHPHn6/OZXQ==
X-Received: by 2002:adf:fccc:0:b0:2f7:8acb:b823 with SMTP id
 f12-20020adffccc000000b002f78acbb823mr4451962wrs.56.1682706360735; 
 Fri, 28 Apr 2023 11:26:00 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 q10-20020a05600c46ca00b003f1957ace1fsm21290159wmo.13.2023.04.28.11.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 11:26:00 -0700 (PDT)
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
Subject: Re: [PATCH 13/17] qapi: Relax doc string @name: description
 indentation rules
In-Reply-To: <20230428105429.1687850-14-armbru@redhat.com> (Markus
 Armbruster's message of "Fri, 28 Apr 2023 12:54:25 +0200")
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-14-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 20:25:59 +0200
Message-ID: <87sfcj6eyw.fsf@secure.mitica>
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
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> The QAPI schema doc comment language provides special syntax for
> command and event arguments, struct and union members, alternate
> branches, enumeration values, and features: descriptions starting with
> "@name:".
>
> By convention, we format them like this:
>
>     # @name: Lorem ipsum dolor sit amet, consectetur adipiscing elit,
>     #        sed do eiusmod tempor incididunt ut labore et dolore
>     #        magna aliqua.
>
> Okay for names as short as "name", but we have much longer ones.  Their
> description gets squeezed against the right margin, like this:
>
>     # @dirty-sync-missed-zero-copy: Number of times dirty RAM synchronization could
>     #                               not avoid copying dirty pages. This is between
>     #                               0 and @dirty-sync-count * @multifd-channels.
>     #                               (since 7.1)
>
> The description text is effectively just 50 characters wide.  Easy
> enough to read, but can be cumbersome to write.
>
> The awkward squeeze against the right margin makes people go beyond it,
> which produces two undesirables: arguments about style, and descriptions
> that are unnecessarily hard to read, like this one:
>
>     # @postcopy-vcpu-blocktime: list of the postcopy blocktime per vCPU.  This is
>     #                           only present when the postcopy-blocktime migration capability
>     #                           is enabled. (Since 3.0)
>
> We could instead format it like
>
>     # @postcopy-vcpu-blocktime:
>     # list of the postcopy blocktime per vCPU.  This is only present
>     # when the postcopy-blocktime migration capability is
>     # enabled. (Since 3.0)
>
> or, since the commit before previous, like
>
>     # @postcopy-vcpu-blocktime:
>     # 	  list of the postcopy blocktime per vCPU.  This is only present
>     # 	  when the postcopy-blocktime migration capability is
>     # 	  enabled. (Since 3.0)
>
> However, I'd rather have
>
>     # @postcopy-vcpu-blocktime: list of the postcopy blocktime per vCPU.
>     #     This is only present when the postcopy-blocktime migration
>     #     capability is enabled.  (Since 3.0)
>
> because this is how rST field and option lists work.
>
> To get this, we need to let the first non-blank line after the
> "@name:" line determine expected indentation.
>
> This fills up the indentation pitfall mentioned in
> docs/devel/qapi-code-gen.rst.  A related pitfall still exists.  Update
> the text to show it.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

> ---
>  docs/devel/qapi-code-gen.rst          | 10 ++--
>  scripts/qapi/parser.py                | 73 +++++++--------------------
>  tests/qapi-schema/doc-bad-indent.err  |  2 +-
>  tests/qapi-schema/doc-bad-indent.json |  3 +-

bad order of files

>  tests/qapi-schema/doc-good.json       |  3 +-
>  tests/qapi-schema/doc-good.out        |  3 +-

good order of files

Should we tweak orderfiles so it displays first the json, and the err or
out files. reviewing json and then output makes things (at least to me)
simpler.


