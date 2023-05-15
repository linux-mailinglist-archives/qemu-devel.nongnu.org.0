Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B08702E81
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:40:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXqf-000473-Vp; Mon, 15 May 2023 09:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXpx-0003rI-RK
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:02:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXpv-0000pe-6x
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:02:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684155717;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xQ+J9w5+r8QjkeOpO7kXR/gsOKRQR9JsBzIKZXJ+kC4=;
 b=Z++bFJojJljm4DAN7lCeXZTBOw8YQJqP2hdWgLu+RUihpOjCdjJXW8GZbmvjRUJrFF5v9J
 nRnUAnnASKadRY2iicaCo57a3f1C8v7jx6zokEEWBJCrwZWdNmJ+cJeybO0521CyGNMPMy
 uwtCj6w8ymgw4a/XWXYfx9p1qJyRc8c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-Ds5IyBqIMf6wXJdc1OwZgA-1; Mon, 15 May 2023 09:01:56 -0400
X-MC-Unique: Ds5IyBqIMf6wXJdc1OwZgA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3063089cff4so7603240f8f.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 06:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684155715; x=1686747715;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQ+J9w5+r8QjkeOpO7kXR/gsOKRQR9JsBzIKZXJ+kC4=;
 b=QSWt5bGOCGFnUzWyp2rCC8oMr49+MW4Rhq1JGz2GuerKbtfSxaUJBW6YijkUHbWFK2
 oxqnfVdOduhSS995+QrqmzzfgbwAxUaK6HsRJIB3jRP3IkR+GwYHdM+kN8lBpawxMM5m
 TKZeaDzot12V/WYgaj1zwX7PIzBtnlr4yL6525+Vn5cyLe46HJ/yHT+ieVQqtILUG9YK
 5vKzaMmLreoklLSzdvNHoyCGCChmUo3G09Jx6S+1I/Y1OtcB2x4HfW4OOqsocEGwRcr8
 /KZ7sYzHm9kRnlJKI1GwpM3qBBGFs3O2pCpHCunH4Ar9U3U5WYwZtLVorAbE2VxQgIVG
 /Kew==
X-Gm-Message-State: AC+VfDx066oOzXA2Bffdz6B4ORZagDyVBU33tvutl2wZhwi3rTWdIfTu
 cPwpizM0xU4uaPl3b/oyu/QbfXdNCNJFxgZeAi0087N0HhcGhJwwfhtjSbTXePuSLitu5NtK8Bz
 GfP0x16NkhD2x08c=
X-Received: by 2002:a5d:470b:0:b0:306:2ddb:47ab with SMTP id
 y11-20020a5d470b000000b003062ddb47abmr23852593wrq.39.1684155714855; 
 Mon, 15 May 2023 06:01:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ70NdapZ4CHPh4q2RoDpnwImjrNMFsvoP2+e9nlF5siFWXU+RhAEsjbfByvyBg/Y81L6wrbYw==
X-Received: by 2002:a5d:470b:0:b0:306:2ddb:47ab with SMTP id
 y11-20020a5d470b000000b003062ddb47abmr23852557wrq.39.1684155714233; 
 Mon, 15 May 2023 06:01:54 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 a24-20020a5d4578000000b003063938bf7bsm32759192wrc.86.2023.05.15.06.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 06:01:53 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  marcel.apfelbaum@gmail.com,  mst@redhat.com,
 philmd@linaro.org,  david@redhat.com,  peterx@redhat.com,
 pbonzini@redhat.com,  den-plotnikov@yandex-team.ru,  lersek@redhat.com,
 kraxel@redhat.com,  dgilbert@redhat.com,  armbru@redhat.com
Subject: Re: [PATCH v3 2/3] pci: pci_add_option_rom(): refactor: use
 g_autofree for path variable
In-Reply-To: <20230515125229.44836-3-vsementsov@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Mon, 15 May 2023 15:52:28 +0300")
References: <20230515125229.44836-1-vsementsov@yandex-team.ru>
 <20230515125229.44836-3-vsementsov@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 15 May 2023 15:01:53 +0200
Message-ID: <87lehpzr26.fsf@secure.mitica>
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

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

nice.


