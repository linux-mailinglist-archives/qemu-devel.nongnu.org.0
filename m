Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37196E9D80
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 22:56:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppbKV-0007tw-IG; Thu, 20 Apr 2023 16:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbKT-0007tn-4Q
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 16:56:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbKR-00068L-QZ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 16:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682024191;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qb1gcM20At4KrmV1I+ft9p5PsifiHjcD66FZ33/H1Ic=;
 b=R+JKq9vbwX32swgmEwK3vtpxQTUr4Ssd9to6qj8bU1GQcWdOx8guZ1QioOkt5YtxGDWqdk
 9BH0gZY2LX4OU6u4Ubm1HoFg0FZDmlmCIbzh7EbKm9nOjPTDQKOfYQjmZB+wLXzgunjApl
 X4hcc1fxLgK7yHoa1uIIi4i9ELokzO0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-VfMN2ME3PNWfZdYMidsZZg-1; Thu, 20 Apr 2023 16:56:29 -0400
X-MC-Unique: VfMN2ME3PNWfZdYMidsZZg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f16fa91923so5572455e9.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 13:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682024188; x=1684616188;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qb1gcM20At4KrmV1I+ft9p5PsifiHjcD66FZ33/H1Ic=;
 b=ADppFf9WgnbFcoeIYER+fb3Dv1GDhJeDCWLfvoXAdFfHb2htHbzK5SUO6H0KTw3o8v
 pGVTRy6yaceFMuxomza3RR8X/LZnUuWH/ljlqMryb72cZwkEDPn9fcMiHjvj8RIWC1fH
 rTp9ACh7dQ2k17IQZVEWnuz8JsoSVXfloOoZNSSgMl3AKu0UawhnVOq2I2Uyd14RxIC2
 XDbI0t1FGSbhuZABku+LCCbaPGSXMnwMUNScSUDV4We1BCnCl/5qdElsRowxqs/v0fzS
 xrh65SiF9CcVB2FPLOtndcuWsqikWjtP2g3mhfz1WvY2jQVzaw1lX5MUJ3UJM/p7+Xsc
 B/NQ==
X-Gm-Message-State: AAQBX9eXUqTppWhz7PgOJ3dAbTXLlX23lMM+g0mwBjk2HUhZphLBN6C8
 /rnhx1WlSNzBmc0JB51en6f8Z+xviSfmEdcbhnSAuD/Y6goy7PdpDmc70SPCPN/tE41pwL78IL6
 uDcoomTifp8HS7to=
X-Received: by 2002:a7b:c416:0:b0:3ea:d620:570a with SMTP id
 k22-20020a7bc416000000b003ead620570amr155125wmi.38.1682024188330; 
 Thu, 20 Apr 2023 13:56:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z5yB6QyMpAadxxU6d6fEkmZDB/g4YV1LaZD+urIeX2ci2pphcZu1zhPQK0BTH7DbjYOyByUQ==
X-Received: by 2002:a7b:c416:0:b0:3ea:d620:570a with SMTP id
 k22-20020a7bc416000000b003ead620570amr155107wmi.38.1682024188060; 
 Thu, 20 Apr 2023 13:56:28 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c4f1200b003f07ef4e3e0sm8620672wmq.0.2023.04.20.13.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 13:56:27 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 peter.maydell@linaro.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  Alexandre Iooss <erdnaxe@crans.org>,  John G Johnson
 <john.g.johnson@oracle.com>,  Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>,  Richard Henderson
 <richard.henderson@linaro.org>,  Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 6/9] docs/system: remove excessive punctuation from
 guest-loader docs
In-Reply-To: <20230420155723.1711048-7-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Thu, 20 Apr 2023 16:57:20 +0100")
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
 <20230420155723.1711048-7-alex.bennee@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 22:56:26 +0200
Message-ID: <87r0seuvb9.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> A possessive its needs no ' whereas the contraction of it is does.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


