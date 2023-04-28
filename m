Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1996F1DB6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 19:58:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSLi-0004q9-IH; Fri, 28 Apr 2023 13:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSLg-0004on-LJ
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:57:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSLd-0004nc-RC
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:57:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682704653;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ZFspu/IiQvdgJqKpz9hvKYuABAWOMJAV9kCuyDvA3/Q=;
 b=F05w/b/EhQIt2WKUqX+D4mNffT6lZd4Uimf20WAddS9NYY8BzsjTAEC02Ng945sqzjucTk
 JrS/116r6COBPGL0//RjAKZ7zz5YtiABSzoxNbO1GMpEOV4NGNzowl2eLitU8K7vKCz9ZC
 8+JG/bj1MK/ccA+qQHllhYPANh4ZJ5c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-IP2z-dwdNeqora41Zx40gg-1; Fri, 28 Apr 2023 13:57:31 -0400
X-MC-Unique: IP2z-dwdNeqora41Zx40gg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-301110f1756so12157f8f.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 10:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682704650; x=1685296650;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZFspu/IiQvdgJqKpz9hvKYuABAWOMJAV9kCuyDvA3/Q=;
 b=S5+/jxlFOs/A8TgRmXBT2+mqgeEQ+Ob1ryzz/eMUcTcDk8pS8iwG8ZZptGDwy3CIiy
 KbByK2lUwTBo2IAYgeD1GznxYLp85K+IKc2p7HvwjaQRKQW8b0XAwyPtdDnYRLlK5Vhp
 3Q6g1A/vxAPVRTh0DnhL2UXnX9i7u1HYa9JH3NX224wf+5vSuI2WUmq0u0mV1VaJOzfk
 SPLSHmRiBj72vC6A1lL77rC/ChVCqoe78+gG7JW2aOESU4nZt24Va4tfyi1BTkngdur7
 yxMYZQZkSgzv7vREYnbro/pxG3igUztdS7kiahjqN5hf1rj7J840B7ggup1SSx3g8TKx
 ZHHw==
X-Gm-Message-State: AC+VfDwVv7vgMes6Yi4/cVNcaGa62JigKYDiCm40usNEa5mnfztv5IP0
 UyOLpn6FSDt/tbG7PPJf7UK4e/c5QiXnkO183vp9536NNo8T5k5YNHNVRB6PYOvcKDY0J4R+Vjm
 PF5GVLai1zD8Xp8o=
X-Received: by 2002:a5d:4bcb:0:b0:2d0:33aa:26da with SMTP id
 l11-20020a5d4bcb000000b002d033aa26damr4433587wrt.7.1682704650595; 
 Fri, 28 Apr 2023 10:57:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7PcO18xlQjyyVPvitQZgZ5mS9mTzeiH2D9BEPYKWMzHXm/zB8W2jJRv2rgKqC/RPs2Aihk0A==
X-Received: by 2002:a5d:4bcb:0:b0:2d0:33aa:26da with SMTP id
 l11-20020a5d4bcb000000b002d033aa26damr4433573wrt.7.1682704650334; 
 Fri, 28 Apr 2023 10:57:30 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 gw19-20020a05600c851300b003ef5bb63f13sm18691937wmb.10.2023.04.28.10.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 10:57:29 -0700 (PDT)
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
Subject: Re: [PATCH 05/17] Revert "qapi: BlockExportRemoveMode: move
 comments to TODO"
In-Reply-To: <20230428105429.1687850-6-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 28 Apr 2023 12:54:17 +0200")
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-6-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 19:57:28 +0200
Message-ID: <87354j99fb.fsf@secure.mitica>
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
> This reverts commit 97cd74f77231f3897838f8db32b659d94803e01f.
>
> The next commit will hide TODO: sections.  See there for rationale.

Reviewing with forward pointers has its own challenges O:-)

> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


