Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841F06FE095
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 16:41:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwkzp-0001uX-9P; Wed, 10 May 2023 10:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwkzb-0001n9-Qt
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:40:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwkzZ-0004Of-Js
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683729633;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gnOV1rNOxIF8Z6PjbXWn+K4UkbW8j0IOQk3svUzTJyY=;
 b=D/LOVt5OCWZ3fsLEFeZFCkCe9qAD9CSJGTQH9XH3wxxi9tNccuuShlaxTsEj5DbcIvQdkk
 Oezcwp7Nu8jcp87aQ5Nqhn1tOxyIL1XKsi27TG7wCLxDuPj0yCQxI+6+5HncKWPGGFc5C9
 wFWyolf94km6v5vRNueM8CLzvS3Xs4c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-cpqKFdK0MqymbsEPMN4Lhw-1; Wed, 10 May 2023 10:40:31 -0400
X-MC-Unique: cpqKFdK0MqymbsEPMN4Lhw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-306286b3573so4485584f8f.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 07:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683729630; x=1686321630;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gnOV1rNOxIF8Z6PjbXWn+K4UkbW8j0IOQk3svUzTJyY=;
 b=WI9m5BnKJkkuIRHyOOnE04T1XZaOHhsjG6W1p2FWSwN1BoQk2WJmi3Nh0qjWVJERJv
 ZjXQM1cdMcAk0RBD2UrmwD2sWjqZlaFnmyb7PE6Bpcos8MZkkG8MQREKvhxOPeudVWi9
 0aj00l1/B1PMLe5tZcMth/KvZBeqf3E+IvXkHbPpMaHljk20tZ3BuhBjsL03CNVUofdH
 ph8w+y5a/cmoBGrNLxwvMLZl2G/4162QbWm/IrkHe6U3j+j8gC0tQRxW2fEKp9G7WiKd
 u1InBTikcZHeMWnd5sSw0NNJOtHjwGCQ5l+GQ3JQveNNOtQWh3KCVGLHIOW/cpoerfiG
 ZfsA==
X-Gm-Message-State: AC+VfDx0wvAIu4XkNsVh3lMY1M+izzS13bhItrZ2VQqTK/yR1LJUOoZR
 L+q0TZDFwOOyA1VJyZBMfX6QkNjKP/ll4sb51zhXbD64TvE1Vm1elFcthyrwNzRdNOet4PH8W1j
 4/TUCqQ0YvkzLlOw=
X-Received: by 2002:a5d:44c7:0:b0:2f9:dfab:1b8c with SMTP id
 z7-20020a5d44c7000000b002f9dfab1b8cmr13358463wrr.50.1683729630666; 
 Wed, 10 May 2023 07:40:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ501zIPESvs3/LHHUYZadAHxyl5ffFz0ZBSV/DWgSGZX7vNC2fGcgz39DTG3FbUIIixFg8jYQ==
X-Received: by 2002:a5d:44c7:0:b0:2f9:dfab:1b8c with SMTP id
 z7-20020a5d44c7000000b002f9dfab1b8cmr13358443wrr.50.1683729630421; 
 Wed, 10 May 2023 07:40:30 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 n18-20020adfe792000000b002f7780eee10sm17670026wrm.59.2023.05.10.07.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 07:40:29 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  jsnow@redhat.com
Subject: Re: [PATCH] qapi: Improve error message for description following
 section
In-Reply-To: <20230510141637.3685080-1-armbru@redhat.com> (Markus Armbruster's
 message of "Wed, 10 May 2023 16:16:37 +0200")
References: <20230510141637.3685080-1-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 16:40:28 +0200
Message-ID: <875y908d2b.fsf@secure.mitica>
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

Markus Armbruster <armbru@redhat.com> wrote:
> The error message is bad when the section is untagged.  For instance,
> test case doc-interleaved-section produces "'@foobar:' can't follow
> 'Note' section", which is okay, but if we drop the "Note:" tag, we get
> "'@foobar:' can't follow 'None' section, which is bad.
>
> Change the error message to "description of '@foobar:' follows a
> section".
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


