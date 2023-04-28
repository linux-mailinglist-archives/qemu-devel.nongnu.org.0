Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BAA6F1DCA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 20:04:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSRk-0007wZ-Ps; Fri, 28 Apr 2023 14:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSRi-0007ts-6z
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:03:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSRg-0006Ix-RG
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:03:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682705028;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=23AET2dVqhNa24RINfbwFrS7w3VrLkrMGq9jvv2HQDk=;
 b=io9rhZ/h85roMljzokuQSC87eTaphqBcIvZ8Xf5WYDUYR4zmdhDluCmwJ3oMFfbv0SuIs+
 yZxEa/d5uwmGmXdEnmVMa4Tr67RWqiV0Jv5HZVnAVFQ7B9UCQpaFpaRq1jQP7CEpBd6Yuz
 A/Tt9CjkFE+OSXPAbEEqkgfNUinMfZs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-lX1iLzQdOOS3uj9Y2VEclQ-1; Fri, 28 Apr 2023 14:03:46 -0400
X-MC-Unique: lX1iLzQdOOS3uj9Y2VEclQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2fa5d643cd8so6009f8f.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 11:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682705025; x=1685297025;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=23AET2dVqhNa24RINfbwFrS7w3VrLkrMGq9jvv2HQDk=;
 b=gCsFJRWC/Wgi+LXP9YjslwZT4pDzvk8FdQDZnF3spneOir31cb91cbzpIkME74iyos
 9l530Y5B9XDMlqpMsQ+CCx9YWGRGfPQCKp7zsAITjxjk/YSAjtTlDCN+mYGrAmCAGnHg
 hKF8xsF6rQ4PM54Kx17kuqI/s5Yy73H57a6PmsSOeaLlPHyXnnu0JNXZ9WOUJi8E2URC
 cn9kiYbbKhjYajxr9NAJVTYuz+53CV6CLQNOy9xrHd7OCCevB+FEBOG/Q0PH4whWSLQH
 tHXKtZeRUgeAaHGcUn0+thoszQZgN/HcroDD4upfkgnxBBp5YFnGd/ulZy1edaqnZ8hR
 iqSg==
X-Gm-Message-State: AC+VfDzyQSwDsoyDuO0Ms5QpPxOj7uDPv8k+/XIUyfui6/UM+G5WNgbu
 izmvHJGthmwjut5kXxz8DgL0H7AQLVYZgcMazHcvySPJi+6apcpKbOSNY+96iJ2Ukix86kae6M2
 DzdEqsn9iMFuMPdE=
X-Received: by 2002:adf:ef8f:0:b0:2f8:e190:e719 with SMTP id
 d15-20020adfef8f000000b002f8e190e719mr4595491wro.65.1682705025801; 
 Fri, 28 Apr 2023 11:03:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6mzI3ScJL41b5XL8FNPswiG2OF4scNF/ekNee/FAFL7R/+haWBxsdBIVdzaDcu+TCeK/0VFA==
X-Received: by 2002:adf:ef8f:0:b0:2f8:e190:e719 with SMTP id
 d15-20020adfef8f000000b002f8e190e719mr4595470wro.65.1682705025429; 
 Fri, 28 Apr 2023 11:03:45 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 t15-20020adfe44f000000b002f00793bd7asm21584258wrm.27.2023.04.28.11.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 11:03:44 -0700 (PDT)
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
Subject: Re: [PATCH 08/17] qapi/dump: Indent bulleted lists consistently
In-Reply-To: <20230428105429.1687850-9-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 28 Apr 2023 12:54:20 +0200")
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-9-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 20:03:43 +0200
Message-ID: <87mt2r7ukg.fsf@secure.mitica>
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
> Documentation of dump-guest-memory contains two bulleted lists.  The
> first one is indented, the second one isn't.  Delete the first one's
> indentation for a more consistent look.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


