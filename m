Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA7168D1B3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 09:48:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJdq-0003H1-0K; Tue, 07 Feb 2023 03:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJdc-0003Bv-7B
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:47:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJda-0004JW-OB
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675759657;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+vMJwLKGTq5jNbrwGJAL3MR2145wVM+/AvNiPa+Ql+M=;
 b=H9JZNi4c8jbzgxJ5j9NQF+XjxEpaKpHc/Rhl/u33za2HDnl7viqUJWebiiWq8rnXlbPzAp
 d1Q4phBS4eGnnZTsodxwB9h8zwTUO8cIKEDLf+Kc7vqG2wcmPh/MjyDkkXLX7V0c7m7dXH
 rB6ogLxUapZXD5XiZHPFHzeV7LQvWnQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-ZXrQJe8gMJC5nghDnC2Eew-1; Tue, 07 Feb 2023 03:47:36 -0500
X-MC-Unique: ZXrQJe8gMJC5nghDnC2Eew-1
Received: by mail-wm1-f69.google.com with SMTP id
 d14-20020a05600c34ce00b003dd07ce79c8so7854083wmq.1
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 00:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+vMJwLKGTq5jNbrwGJAL3MR2145wVM+/AvNiPa+Ql+M=;
 b=zwc0zTuoJlgpQfFd7bU18zJy5WqSu2JH7anb+qI2rolCiSTtqfCMjnfyh/7pk8QTeI
 VYccPVktgrEfPeFn9ZTVryL3QfJ2iQx4xy2I7RqPuaMPz9s/sDffr6jMkf71RWGVnUp1
 zgr+EPZ1wOoeDRlrSJhQDoXCG6Q7I3y/LpDIl13bOUqqkjeBLKWBItolax/8tvROSAxF
 dDEB800jFKBQtieYAxxqkf5rNXBeNoNy05g6xcbg1GgZ0XaDLguBFzOaCofv9+900uIG
 E69XIOzTH/LfwJwF89G7tmsbfNsNlTTyXrmBaGdqH0i9cBOAlViEaHgnYfcxab7gPGfm
 klgg==
X-Gm-Message-State: AO0yUKWs81SgNjidY2UJK4hyg5FZCoZZMfCyPT1WuDy4/PvyK7wUbyCH
 /qixHjniB3vlkVaaDUPIHA0whaxf7572Jg9Le46+M6AcAQSxURMzVfElcSz1lZ+nlkxj7S7qS/r
 k/fFmc+NRT7tE9uU=
X-Received: by 2002:a05:600c:4d16:b0:3df:fa96:f670 with SMTP id
 u22-20020a05600c4d1600b003dffa96f670mr2306972wmp.22.1675759655099; 
 Tue, 07 Feb 2023 00:47:35 -0800 (PST)
X-Google-Smtp-Source: AK7set9eCrlpJ/rGHZrZ9h1bieVfKjhlBZrdhmW8qIXdAej6T90VR1L6IvmSI/FfK1hTPc9LV6hWMQ==
X-Received: by 2002:a05:600c:4d16:b0:3df:fa96:f670 with SMTP id
 u22-20020a05600c4d1600b003dffa96f670mr2306953wmp.22.1675759654882; 
 Tue, 07 Feb 2023 00:47:34 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a05600c1c0a00b003dd1c45a7b0sm14434410wms.23.2023.02.07.00.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 00:47:34 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  marcandre.lureau@redhat.com,  mst@redhat.com,
 imammedo@redhat.com,  ani@anisinha.ca,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  philmd@linaro.org,  wangyanan55@huawei.com,
 jiri@resnulli.us,  jasowang@redhat.com,  pavel.dovgaluk@ispras.ru,
 pbonzini@redhat.com,  zhanghailiang@xfusion.com,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com
Subject: Re: [PATCH 04/12] hw/core: Improve error message when machine
 doesn't provide NMIs
In-Reply-To: <20230207075115.1525-5-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 7 Feb 2023 08:51:07 +0100")
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-5-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 07 Feb 2023 09:47:33 +0100
Message-ID: <87mt5pc15m.fsf@secure.mitica>
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
> The QERR_ macros are leftovers from the days of "rich" error objects.
> We've been trying to reduce their remaining use.
>
> Get rid of a use of QERR_UNSUPPORTED, and improve the rather vague
> error message
>
>     (qemu) nmi
>     Error: this feature or command is not currently supported
>
> to
>
>     Error: machine does not provide NMIs
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Much better error message.


