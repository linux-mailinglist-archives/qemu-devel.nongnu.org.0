Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252A168D1C7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 09:53:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJj4-00078d-1i; Tue, 07 Feb 2023 03:53:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJir-00077T-Es
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:53:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJip-0005R8-Sp
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:53:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675759983;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vV/HAvRMLW8o2KHkmV4iX9siWh2JSG/T9qDArp5kVKo=;
 b=H5KGGYHG2bi9b1Kolzru0R415zcTjsfEld4u4kYs9V+YqoWgglx2RP/RGcldZFIQzdr/VM
 gKbf9ubq8C2Ct6jFCUTfgLnVy2eQbd0+clxAFzq0YLk6/Bv1iuNQE/4sj8b7U7D2d3KwBW
 Mub4AMoTsfqv51y47HBlTAB6eECw29k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-53-_5kfGUMROH6wXt_59HNjdw-1; Tue, 07 Feb 2023 03:53:01 -0500
X-MC-Unique: _5kfGUMROH6wXt_59HNjdw-1
Received: by mail-wm1-f70.google.com with SMTP id
 s11-20020a05600c384b00b003dffc7343c3so2657890wmr.0
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 00:53:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vV/HAvRMLW8o2KHkmV4iX9siWh2JSG/T9qDArp5kVKo=;
 b=0upjxuRsuOQNd6REL5r9g0FTDbaK0/+woqABD3RAtZ5OymR2Wmxd9YFOp6pRbYzWPQ
 JrvBpUUKNC5vPV3k2rbG/wMwNXSGFLTZcqmpYit5azgj3OpYeEcyey3OObjhRkehd7yi
 qjwKXWNyC2zIKnIGqOjHUfS8ewliFpF0qG7emtvqi0+mv041B5h9RcBusFvrQ22qvXRk
 od/zR+OyhrOGdliAbAaJcWhEEfm93SF5NBLJk8U2qo3c3ZimEB54GIsdKk6nMR2rekFg
 UwkW18QrDrZSJ9M4icqMZpLXqVZandrjBP/GTdnCH3C5LrHzSuRZZ4GhzyRLNt4SRl/0
 Q6Rw==
X-Gm-Message-State: AO0yUKUlF3Rpm4NVaxQlEpeuohfLZGdD8xboYXSRPXodqyJupcbTovNr
 nfDWxOgiz3JRddVHAhTNfUexdlNPrYH7AjVdqlPnkVQdXIPjHmVTNSeS7qMMT6x7LLdVvVq3nt7
 +g1vH7Af320C611Y=
X-Received: by 2002:a05:600c:810:b0:3de:25f2:3aee with SMTP id
 k16-20020a05600c081000b003de25f23aeemr2411418wmp.31.1675759980521; 
 Tue, 07 Feb 2023 00:53:00 -0800 (PST)
X-Google-Smtp-Source: AK7set8NGYJ/7rhqn9qJDB4f4NJiOwjbEgPbDk0pMT4wjAP/b13mTpY+YyRTCJp2it3DXPK23RvANg==
X-Received: by 2002:a05:600c:810:b0:3de:25f2:3aee with SMTP id
 k16-20020a05600c081000b003de25f23aeemr2411395wmp.31.1675759980366; 
 Tue, 07 Feb 2023 00:53:00 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003dc36981727sm20147452wmq.14.2023.02.07.00.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 00:52:59 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  marcandre.lureau@redhat.com,  mst@redhat.com,
 imammedo@redhat.com,  ani@anisinha.ca,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  philmd@linaro.org,  wangyanan55@huawei.com,
 jiri@resnulli.us,  jasowang@redhat.com,  pavel.dovgaluk@ispras.ru,
 pbonzini@redhat.com,  zhanghailiang@xfusion.com,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com
Subject: Re: [PATCH 07/12] hw/acpi: Move QMP command to hw/core/
In-Reply-To: <20230207075115.1525-8-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 7 Feb 2023 08:51:10 +0100")
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-8-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 07 Feb 2023 09:52:58 +0100
Message-ID: <878rh9c0wl.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
> qmp_query_vm_generation_id() in stubs/vmgenid.c is the last user of
> QERR_UNSUPPORTED outside qga/.  Unlike the stubs we just dropped, it
> is actually reachable, namely when CONFIG_ACPI_VMGENID is off.  It
> always fails like
>
>     (qemu) info vm-generation-id
>     Error: this feature or command is not currently supported
>
> Turns out the real qmp_query_vm_generation_id() doesn't actually
> depend on CONFIG_ACPI_VMGENID, and fails safely when it's off.  Move
> it to hw/core/machine-qmp-cmds.c, and drop the stub.  The error
> message becomes
>
>     Error: VM Generation ID device not found
>
> Feels like an improvement to me.

Fully agree.

> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


