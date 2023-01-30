Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C914D6804CD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 05:14:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMLXv-0007rf-Fy; Sun, 29 Jan 2023 23:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLXt-0007rO-07
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:13:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLXr-0001K5-LQ
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:13:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675052006;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=f8LlpqFMBZVRcZHC0EnU984o9h8pM2ZpA8U/VQuUvn0=;
 b=XhXwJ5MF5wMM3MHekY3ytxF3ajh7DAciUvammCAUfevA6pbxy3wmiu2oGmMq6Gqz8NInq0
 y8vhoeTvq6ikMaMu8/Cv5sHcwMdjzFjn+E3pwCpsoE0chV1+mfnVRZ8f97K5H8l0ZhQYur
 g81E4AoqzdrvSSTFTm+vbkvYBOObLhc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-ev-OOOEjPjmXfcetxqRokw-1; Sun, 29 Jan 2023 23:13:25 -0500
X-MC-Unique: ev-OOOEjPjmXfcetxqRokw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r15-20020a05600c35cf00b003d9a14517b2so8852053wmq.2
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 20:13:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f8LlpqFMBZVRcZHC0EnU984o9h8pM2ZpA8U/VQuUvn0=;
 b=fX0sI6Sw3fu8XYwQpWRkEkgoFk+2tG5k4qr9oxWm4jxH26PJbk5sgtOkPDImdqQE1V
 3oNk6tQMM83gB7kWx6x0UtiN8gmsw0IofG/YIDEU/X4u2Wo+aa//EGDHH8umIeJuQ2nu
 uMItgqsYnRZv8x3FVrR6VBzWKq1vgoWrvPFGpY7RKetvxe/Jf1TM2eQRFdmLPsR8Cw6S
 EJj+6XI1Tf8+LisJh5NVZQZjNsKbjtzUnJChvQ248XYAHZIlciG1wQjr+Z/g2f3aOwSo
 R3wELXag2qXxEkWO/An/2IMLKoOY1mHxYFfVYfyyS4xCyBaTd0nF3/e5dWPTRXuFr+a0
 ZW6Q==
X-Gm-Message-State: AO0yUKVjISiqox4AN7qikkrCFdsW9y2b/Q8WCG6T8CRCTXOgMyw1Ehp/
 Xvc/BJr40TCGYf//WVqEzSdU1uQDywGzhItoRfkYFwPSej+urQzTgiPKWNL7LpW4BNcXKm1gD3S
 XCEpIFId4NgN4Nwo=
X-Received: by 2002:a05:600c:b4d:b0:3dc:3f51:c697 with SMTP id
 k13-20020a05600c0b4d00b003dc3f51c697mr9491293wmr.18.1675052004049; 
 Sun, 29 Jan 2023 20:13:24 -0800 (PST)
X-Google-Smtp-Source: AK7set+XglkjkINPW4f9AT1zRF3CVQglpRm0o9aHj+JzjrACrSAbCWbRtNg/iugAEO1yWV5b8lh7ig==
X-Received: by 2002:a05:600c:b4d:b0:3dc:3f51:c697 with SMTP id
 k13-20020a05600c0b4d00b003dc3f51c697mr9491262wmr.18.1675052003885; 
 Sun, 29 Jan 2023 20:13:23 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b003db16770bc5sm3110464wms.6.2023.01.29.20.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:13:23 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  mst@redhat.com,
 philmd@linaro.org,  peter.maydell@linaro.org,  alistair@alistair23.me,
 jasowang@redhat.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com,  tsimpson@quicinc.com,
 palmer@dabbelt.com,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 16/19] Fix non-first inclusions of qemu/osdep.h
In-Reply-To: <20230119065959.3104012-17-armbru@redhat.com> (Markus
 Armbruster's message of "Thu, 19 Jan 2023 07:59:56 +0100")
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-17-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:13:22 +0100
Message-ID: <877cx4psm5.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Markus Armbruster <armbru@redhat.com> wrote:
> This commit was created with scripts/clean-includes.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


