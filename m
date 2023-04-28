Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAEC6F1DAB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 19:54:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSIc-0003Hi-3C; Fri, 28 Apr 2023 13:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSIZ-0003H6-Ga
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSIY-00048N-2G
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682704461;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=sJG0mOpPemXypqoJGoUc3hIsdACMszFsCcG1uLbPIRY=;
 b=chLGsMwJXtw4kQQ08lcjWOf7MFCjDasVV4gRaBF98uLO2zkq/Sb3M/I8STnSap3OgLiGe/
 cxHBRXYKMUlz7BYyox549dz+8CJ8REYTpfHAK9SQBzUqNapn25VuybyY8gIvwlOGXoPDLK
 kE5AOpIJG7AoxL4t38Z4kGLz68udPeI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-MRSDPWhQOmGPbYm0jHU8Eg-1; Fri, 28 Apr 2023 13:54:20 -0400
X-MC-Unique: MRSDPWhQOmGPbYm0jHU8Eg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30479c17304so2453f8f.3
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 10:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682704458; x=1685296458;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sJG0mOpPemXypqoJGoUc3hIsdACMszFsCcG1uLbPIRY=;
 b=dFEVmaxYGAhDpzwVWqecuOIQ1/UDjtOwCEwwpIs480ECJ8iYij6GhGb6QKB5Ti0g0o
 nkLmwZakjE8PRKELHCMAzxw6LBTzTsDeATMvue1Ayws+UOkDwGo3T77EVkMqE/LbI7o/
 WfrPEl8/OQILq0JV15zIfC6VtnUfCZH/lOvs5ba5tj9AZYe/jF8aNimQu1ZRlREYgtbG
 Ksmzs11CHA13FO3rFlpZmOp96XyIbHED/C2QfETsPUWuw/FvRp1CtseQ3qH1maAlXnL+
 B1Uh+oIxpGVH2Aj0DX1AGsAZcAFwnXObtgHz6Ivm8lgvn6JkP29SX4b4c2ESqnBddBIH
 tNVw==
X-Gm-Message-State: AC+VfDwSaLN7RccfJvQ6i4wWGeUabnzFfvwPR9WSG+XY9Ky3URlyI47k
 XoJllVj4mXwGvwpuf+jfBih+EIowBCozERxJ1BMLhMb716Sda724rltJvA3cEiOYwAyvrV4frf3
 xDsTGQfMFu0qhUMY=
X-Received: by 2002:adf:e44e:0:b0:301:81f8:765f with SMTP id
 t14-20020adfe44e000000b0030181f8765fmr4471883wrm.38.1682704458730; 
 Fri, 28 Apr 2023 10:54:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4t1s/9HClTUhBWxo64I9ugRl3bAnXAiSmGCZ0IsMN5gxlxB3+xv50gUFwRrZbsx42obclp9w==
X-Received: by 2002:adf:e44e:0:b0:301:81f8:765f with SMTP id
 t14-20020adfe44e000000b0030181f8765fmr4471861wrm.38.1682704458452; 
 Fri, 28 Apr 2023 10:54:18 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 m7-20020adfe947000000b003011baf89b3sm21601455wrn.40.2023.04.28.10.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 10:54:17 -0700 (PDT)
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
Subject: Re: [PATCH 03/17] qapi: Fix crash on stray double quote character
In-Reply-To: <20230428105429.1687850-4-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 28 Apr 2023 12:54:15 +0200")
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-4-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 19:54:16 +0200
Message-ID: <87bkj799kn.fsf@secure.mitica>
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
> When the lexer chokes on a stray character, its shows the characters
> until the next structural character in the error message.

You have a problem

> It uses a regular expression

You use regular expresions.

Now you have two problems.

Yes, I had to do it.

> to match a non-empty string of non-structural
> characters.  Bug: the regular expression treats '"' as structural.
> When the lexer chokes on '"', the match fails, and trips
> must_match()'s assertion.  Fix the regular expression.
>
> Fixes: 14c32795024c (qapi: Improve reporting of lexical errors)
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


