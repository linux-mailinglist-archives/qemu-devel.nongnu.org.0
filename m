Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63454565C8F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 19:01:26 +0200 (CEST)
Received: from localhost ([::1]:37076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8PRs-0006SU-To
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 13:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8POn-00048O-TG
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 12:58:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8POm-0000dx-1M
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 12:58:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656953891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yNMrHPrhD++7rFfJ93ETpvBI7HedI2JXjrLcrZljjyo=;
 b=AzPXVt3J/DUHhfE6iRu2ohNmmREf5IQ0BQc2eQy1y0uu6Zv5KmQ8CbXY8blR9M4dBqY5Ov
 mQMRML9FhlXHKCAQWuGLT2GycRuZUW9tY8tM7YEUIDnWltTwKuPq91jltUvtgdA/8Kc6m+
 gCBHpBekZ77rXKVg4zCSm0TcKeUlW3Q=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-wqRans0QM-WJX-KY73IDow-1; Mon, 04 Jul 2022 12:58:08 -0400
X-MC-Unique: wqRans0QM-WJX-KY73IDow-1
Received: by mail-io1-f69.google.com with SMTP id
 h18-20020a5d9712000000b00674f83a60f0so5796017iol.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 09:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yNMrHPrhD++7rFfJ93ETpvBI7HedI2JXjrLcrZljjyo=;
 b=DUxDVCr3bf7d/srVHabKjEsLkgxGYa0jmYrSAxIsSgi4piyNt+pi4aBdCUQJHdlBvI
 LScYDvN8hTrDysT5CUGow/WJxhhHGwC4iRxirxQWWyURabhqnybUSdpWN4IAw6BPc99F
 ykSdWeavKG9Y3Agmjaoupi/y0/Fq7qzQF/0xGagWE8e8hZ7C9OYvcHEjz+fV5GIwTSH+
 X9vuiZasduBp/oxK9nVyreL72W0OGqU1GlkOpGL2iIPKrNSAhuPAYP+6ifRGfTwwZ0XA
 tqduZSOJ3sbeZrSD+RPOWUetwFZmCCSLw0/b8TBHwhH21eyVLRBpToTWrk2puV4rJavL
 sEtQ==
X-Gm-Message-State: AJIora+N08lZp3O3E754DB+1BneWpVe4BjHm/utvJPgYF2KqAFfDwYij
 fM2VKLXCRId8OhO9NMecpJEmMrKnRTcj+8UcdV99VRXTJ61ysmIaU+2btCt4dcDK2yI4i+2QVL8
 FAMTUYsIpYD6BOskDR1nw4J8L6qCCgG4=
X-Received: by 2002:a05:6638:271f:b0:33c:c07e:3034 with SMTP id
 m31-20020a056638271f00b0033cc07e3034mr19045359jav.263.1656953887599; 
 Mon, 04 Jul 2022 09:58:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v39f7VGjOY4g8CScAWZRJeplWnPT6V8zvkIh8KuGmyWWVZzQ7P8cMG1hu6FInPr/Et9JqfQhhnhIl1OIX94/A=
X-Received: by 2002:a05:6638:271f:b0:33c:c07e:3034 with SMTP id
 m31-20020a056638271f00b0033cc07e3034mr19045336jav.263.1656953887409; Mon, 04
 Jul 2022 09:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220702113331.2003820-1-afaria@redhat.com>
 <20220702113331.2003820-6-afaria@redhat.com>
 <ac264c3d-3345-38bf-35e5-ddc1b809c3b4@eldorado.org.br>
In-Reply-To: <ac264c3d-3345-38bf-35e5-ddc1b809c3b4@eldorado.org.br>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 17:57:31 +0100
Message-ID: <CAELaAXyAAfXGrO-NUSrqkU-Kd1hSzanUsz_Mk1fVSCfK9vhN8Q@mail.gmail.com>
Subject: Re: [RFC 5/8] static-analyzer: Enforce coroutine_fn restrictions on
 function pointers
To: =?UTF-8?Q?V=C3=ADctor_Colombo?= <victor.colombo@eldorado.org.br>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Peter Xu <peterx@redhat.com>, Alberto Garcia <berto@igalia.com>,
 John Snow <jsnow@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Markus Armbruster <armbru@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi V=C3=ADctor,

On Mon, Jul 4, 2022 at 3:18 PM V=C3=ADctor Colombo
<victor.colombo@eldorado.org.br> wrote:
> And I receive an exception on the line above saying that node is of type
> NoneType. Seems that `node =3D node.referenced` is setting `node` to None
> in this case.
>
> I was unable to understand the root cause of it. Is this an incorrect
> usage of the tool from my part? Full error message below

Unfortunately there seem to be a lot of corner cases that libclang can
throw at us. I hadn't come across this one before. I expected that
DECL_REF_EXPR/MEMBER_REF_EXPR would always reference something.

This may be due to some build error -- libclang tries to continue
processing a translation unit by dropping subtrees or nodes that have
problems. Is there a "too many errors emitted, stopping now; this may
lead to false positives and negatives" line at the top of the script's
output?

Thanks,
Alberto


