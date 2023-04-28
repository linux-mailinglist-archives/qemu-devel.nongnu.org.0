Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACC06F167D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 13:21:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psMA8-0007zD-Fx; Fri, 28 Apr 2023 07:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psMA6-0007yq-GT
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 07:21:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psMA5-0001ZA-5I
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 07:21:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682680872;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=I+xEKcFbTXfSL975ALjqBZ1KwG4NtE8CTuFSDosAyf0=;
 b=UYvUQ4h+mS+qYRLLjsIg98bkY2Q11jONR/gqceUx4jXCUgIN76yWT9Ccobiivhh0kDjxQJ
 Y2hcAL504I5SYYJT2VS6M8FtsYU1fw8o7vZUjA3mZf2AOunKZcrjHkXdeLKqZ4c2MhkzWW
 vH9FXm5kGCg56K+F5Phzldcw+ZMDX44=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-4G08usrpOn2g5a_7VqB4TA-1; Fri, 28 Apr 2023 07:21:11 -0400
X-MC-Unique: 4G08usrpOn2g5a_7VqB4TA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-302cdf5d034so5186418f8f.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 04:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682680870; x=1685272870;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I+xEKcFbTXfSL975ALjqBZ1KwG4NtE8CTuFSDosAyf0=;
 b=g/DHwpN7L9j5VYoLYBTJlzh0LB1Gxmfv+E92f4oBtMPXME2VUQ9NGkxre1KSLKnReQ
 i+8m9k+7Q7Jc5JKj4hW3w65QORsMzEEbCXfcvTmUEth20B+IbW3NSy0wxZjVCqt94MJ8
 CRGsiTCqTmqV8xG6c+JWboHYLkTlj2rCWNQWKZ6WkhibGT6Gyg8Mm/ILMyfPuyFSqRZP
 d2VQrMx+QmTbkSwQJTpPVBV2EsbKF2VTINejNKcXqz6JeySlAZPeygb+KC/Ni+/lapP8
 ck+5Zy17mLWRTOI7lMuQkEzPHr0kLfkoZYVQXrCJm9cbgEvuARX43XedbCRuyC5Y1OG2
 LHHw==
X-Gm-Message-State: AC+VfDxwyPqQI3Q1tCpG4oOOBmdiKLTgFW9PRaYjouuRPq3CR6jWmXiU
 xbaULSZHrAkyHhHkCghX1v1We39I/lnIiRfFlUhquA+8ktM5a92j2CH5BCqUA8nujgVc23rvcbT
 c0uQLCxnJX9rqfGM=
X-Received: by 2002:a05:6000:50f:b0:2f0:442a:2d45 with SMTP id
 a15-20020a056000050f00b002f0442a2d45mr3604667wrf.57.1682680870145; 
 Fri, 28 Apr 2023 04:21:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7w+OJEDztnwLh6r3v3sJ3PY+23k269woeWM7srXS77s4nrYJbHuintcQ+jpfC0+ZzkGaosFQ==
X-Received: by 2002:a05:6000:50f:b0:2f0:442a:2d45 with SMTP id
 a15-20020a056000050f00b002f0442a2d45mr3604625wrf.57.1682680869799; 
 Fri, 28 Apr 2023 04:21:09 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 t15-20020adfe44f000000b002f00793bd7asm20802455wrm.27.2023.04.28.04.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 04:21:09 -0700 (PDT)
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
Subject: Re: [PATCH 01/17] docs/devel/qapi-code-gen: Clean up use of quotes
 a bit
In-Reply-To: <20230428105429.1687850-2-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 28 Apr 2023 12:54:13 +0200")
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-2-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 13:21:07 +0200
Message-ID: <871qk4ckws.fsf@secure.mitica>
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
> Section "Definition documentation" uses both single and double quotes
> around doc text snippets.  Stick to double quotes.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


