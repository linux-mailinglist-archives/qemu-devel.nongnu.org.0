Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128587029FF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:05:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyV4M-0001AW-99; Mon, 15 May 2023 06:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyV3w-00017J-7W
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:04:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyV3u-0000V8-OX
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684145052;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=cOHUkT3woYFV0ZzUV+4G2B9k0fRw9PXZayiMh3vaJXk=;
 b=iybOhsl4ykNb5cJw5kMOxv7+8XhqVqFVX7hWSVwdJryi9LHkNMMAsQgsIiq+4Cci7GMbPz
 z2aNNzqEURSYHj34YfYHUOM1i2rkcnw56DxbmK3DEYh6H6ID7xxO6hYDgUQG96D7WiZGWl
 w8AnRgqHwywHNHK9SxKvgSeWiY6FmPM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-3VsmAI-gNW-HbUts6lw6dw-1; Mon, 15 May 2023 06:04:11 -0400
X-MC-Unique: 3VsmAI-gNW-HbUts6lw6dw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f41dcf1e28so33493215e9.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 03:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684145050; x=1686737050;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cOHUkT3woYFV0ZzUV+4G2B9k0fRw9PXZayiMh3vaJXk=;
 b=BQ+U7X1U+uVoiTZzYd0QdyLK+IsloeFa0bIRLWlCpsCfPY32HMqrtuxl7xb/e1Kje6
 bXDy3hkVbNDUei52VQP/G6jz2ASrENKa2AlZGEP0qHfLGd6J7wCC72oRBggy1jPzV1hi
 1H6bx0j0i1jGcj4AvO0i5BrK+nlqWxmWUMUfnxE0sVhB2DlPHCeBhoQHDJbq+aPrMJNK
 2rcaSjU5G3GYQxJwYFZm7SDw1DC+bS+OixS5J0Ox6u+tcu5NmvXBW0HiUbEfTNRNc9ej
 g7biB+jYZC8tWQdiTkMouRF9TDQwMSMgf11fYKK/Wzd+vywUdxqqv+S2ZCQQfv34c7Uk
 moCQ==
X-Gm-Message-State: AC+VfDxobyuLyDF9T3Z7ke3fiM8Q+Smgw/PD+k69Z+k9kM606/EDoC+I
 NN0FT1p8E3cnt1SV69jFt5zjWt48H9595XwcsNqa7n+z3B0tuYFoYkqT6jJ/80py6q0x3vMiSmk
 4lkVKNB40mkqW5d0=
X-Received: by 2002:a1c:e908:0:b0:3f4:2b1a:553b with SMTP id
 q8-20020a1ce908000000b003f42b1a553bmr14475451wmc.28.1684145050508; 
 Mon, 15 May 2023 03:04:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7uVCxwiZvja7KKAdaMprea9rhngpnEZD4ud075Fr/fPxcDvUjOv82CM7wRSjROVco+9orFzA==
X-Received: by 2002:a1c:e908:0:b0:3f4:2b1a:553b with SMTP id
 q8-20020a1ce908000000b003f42b1a553bmr14475431wmc.28.1684145050218; 
 Mon, 15 May 2023 03:04:10 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 a6-20020a1cf006000000b003f0aefcc457sm36507921wmb.45.2023.05.15.03.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 03:04:09 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org,  prerna.saxena@nutanix.com,  dgilbert@redhat.com,
 pbonzini@redhat.com,  berrange@redhat.com,  armbru@redhat.com,
 eblake@redhat.com,  manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v4 8/8] migration: Introduced MigrateChannelList struct
 to migration code flow.
In-Reply-To: <20230512143240.192504-9-het.gala@nutanix.com> (Het Gala's
 message of "Fri, 12 May 2023 14:32:40 +0000")
References: <20230512143240.192504-1-het.gala@nutanix.com>
 <20230512143240.192504-9-het.gala@nutanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 15 May 2023 12:04:08 +0200
Message-ID: <87fs7x29nr.fsf@secure.mitica>
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

Het Gala <het.gala@nutanix.com> wrote:
> Integrated MigrateChannelList with all transport backends (socket, exec
> and rdma) for both source and destination migration code flow.
>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>

Nothing especially wrong appears here, will wait for 2nd submission with
the previous fixes done (specially the local_error bits).

And in another order of events, you are not changing
tests/qtest/migration-test.c

My suggestion will be that for things that have more than one test
(i.e. tcp/unix/...) just change some of them to use the new syntax for
channels.

What do you think?

Later, Juan.


