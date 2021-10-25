Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E5E43902F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 09:18:56 +0200 (CEST)
Received: from localhost ([::1]:45708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meuG0-0000nN-3L
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 03:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1meuEu-0007Ue-T1
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 03:17:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1meuEk-0005Ix-Ju
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 03:17:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635146258;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ePR29g8guYG0nmZw2ZgyFLZqEwTIWTw3Hr1LzYFcNZA=;
 b=gloJNUttzVjO/XXo9ds3Q4PTWJVMBYS+tL5L6JagCkmznEVrofMc4mqIz3fnTbiEyNEmjc
 aOT4kfqYOXtH5QH86xkHRdD+42pQNP94TU76al8q3CFuFTkCXM5n8rn036RsuS94YkdBb0
 Op2AOr6jSgpFAR4DT6lSV1s0CBRBYG8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-eRGuoT82MQieqgIOqhSGbA-1; Mon, 25 Oct 2021 03:17:34 -0400
X-MC-Unique: eRGuoT82MQieqgIOqhSGbA-1
Received: by mail-wm1-f69.google.com with SMTP id
 o22-20020a1c7516000000b0030d6f9c7f5fso3323679wmc.1
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 00:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=ePR29g8guYG0nmZw2ZgyFLZqEwTIWTw3Hr1LzYFcNZA=;
 b=ku0tx3hSH0d6cIXAh43l4jefF8nKjX4kQLawOvVHzQ+86ZIjjbSK3NueAstnkCHvIH
 V4JiJC9g3trbXHC4ZpPAchLBRVyOelLRCHEdb8sqxG0CVsSp2Scub1QVlGYNgJrsaQ5y
 Ncsa66kqpdBkaX3BLUSau8coS8AWZX+O+dn32ShekGGyta7nN0exBrb6CmM7i2m88W/K
 gC41Pigqp3OUbM76TJweSwWMOgEezcY3z15abTTDFzCfJK0GA7t44QD9eB0tcwBdcpwK
 EGgTOzIVAxHTTOvs4C10hxGI5Vr0gYKVQskX2B/RSM1dOBqkwzCRoJXar5aVLlKZY5TU
 D/Jw==
X-Gm-Message-State: AOAM531x0sWQ6vGmuRIuUxDjtxG6tnZbcuG4FaZewyMOn9Kt+VTRF+AE
 /IKXszFIt9jmbrcBNDmASs875mejczVhK3ue0yjKYrlHbYjPuFWAEfhrqjjF5t16Aaj9bgMhBdE
 YBZDPkbxGb1OMjjU=
X-Received: by 2002:a05:6000:144a:: with SMTP id
 v10mr609511wrx.161.1635146253479; 
 Mon, 25 Oct 2021 00:17:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRwA1eG6W1/N9oKJY5LEAiulJr7+kqAs8JPPaQ7lUZdlAzwalES+Vxk6WFwN6HjEuK7mo4uw==
X-Received: by 2002:a05:6000:144a:: with SMTP id
 v10mr609492wrx.161.1635146253362; 
 Mon, 25 Oct 2021 00:17:33 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id g5sm4152115wrw.4.2021.10.25.00.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 00:17:32 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 3/9] qapi: Eliminate QCO_NO_OPTIONS for a slight
 simplification
In-Reply-To: <20211025052532.3859634-4-armbru@redhat.com> (Markus Armbruster's
 message of "Mon, 25 Oct 2021 07:25:26 +0200")
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-4-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 25 Oct 2021 09:17:32 +0200
Message-ID: <87ee89375f.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 eblake@redhat.com, mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


