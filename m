Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB13938CB82
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:04:13 +0200 (CEST)
Received: from localhost ([::1]:56210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk8ZJ-0002QI-0N
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk8Xi-0001hh-Eb
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:02:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk8Xg-0007Xr-FO
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621616551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43/aLIhxPUFfO2s7iXW0KpFnZGDBvQ10NCHTIaf18ew=;
 b=htI3l5GDkcfk8LhceST9DSXA+yyxYajZ62eEFFl6KgRr/lfeS86Rkgscjz4mTr8ShDOBpw
 Nhh+nZ20tIdMrsBAVAkCOTIuPS6zzCmCsdFviuk5fIf6xMcoZZ6QkySnYVozD4XHhroCij
 OEByq2CRtEaWgJhXKqcshwrScYmC5vk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-FYzjVBQwOiGp2iwMIO4Ydw-1; Fri, 21 May 2021 13:02:29 -0400
X-MC-Unique: FYzjVBQwOiGp2iwMIO4Ydw-1
Received: by mail-ed1-f69.google.com with SMTP id
 q18-20020a50cc920000b029038cf491864cso11615801edi.14
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 10:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=43/aLIhxPUFfO2s7iXW0KpFnZGDBvQ10NCHTIaf18ew=;
 b=eINZtj/amG4hhJg3dMZtbzMdD4sNourFCQwVqajHOCySO5gZQkbQdefnYTwMtN592T
 wIB2ugb/XiDR/iUekaRIajVXDaawm3wgTFB1Aur24B/FFwkaebLaxGUlaqdlyPkOL15l
 7dRHLeSgzg8mTjKlWGLaLSW15jUU120iKGoUPT9j0g8t8FG2zM3j44efNONiCy0POzBZ
 +izc3WzgVcTvUUcu2WfGRzFbsLCu/ONM8MZtjXkZslEn1kkk7h2GB/At3m/HkuKG3KGR
 GGxCe/OsE0l49OgljDsiJKkA1XxxnrBnFebAc8pyDssxm5G5+QmvJgQuCdQfPQq91CZ6
 lAaw==
X-Gm-Message-State: AOAM533ccgijuP5oOH4CKBEnTbC6btKA0rKGQlxcyXuHvCjmq4YesaHI
 KwsXQ/a96vO8YNVyXjOGKk/Sky1FLjlnbvlycFd5EycmmtzJijJKM2XJxwjFZAh6UWaQ+3t5Q1r
 2ZNkyYif8XXxP66ht4ZcEszBn7yhWEEACQmijonEQ5Bn2M1QPQYz8RVKuqcuPw2DRr9g=
X-Received: by 2002:a17:906:2da1:: with SMTP id
 g1mr11293856eji.47.1621616547680; 
 Fri, 21 May 2021 10:02:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK56k3YspyMnwLetRh7LswXKOJvGUxeDTThw7j7PB9ckLNUx6VZkkTrI5ksvpuDSCUrv154g==
X-Received: by 2002:a17:906:2da1:: with SMTP id
 g1mr11293833eji.47.1621616547442; 
 Fri, 21 May 2021 10:02:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g4sm4374474edm.83.2021.05.21.10.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 10:02:26 -0700 (PDT)
Subject: Re: [RFC PATCH 0/9] Initial support for machine creation via QMP
To: Markus Armbruster <armbru@redhat.com>
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <93ae82d3-f9a7-f347-a013-54ae5cdc95f7@redhat.com>
 <87zgwo5nl2.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8c23c25a-cf5d-c79f-9a88-0c8ea17f872b@redhat.com>
Date: Fri, 21 May 2021 19:02:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87zgwo5nl2.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 Mirela Grujic <mirela.grujic@greensocs.com>, mark.burton@greensocs.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/05/21 13:32, Markus Armbruster wrote:
> PHASE_NO_MACHINE
>    -> machine-set -> PHASE_MACHINE_CREATED ->
>    -> accel-set -> PHASE_ACCEL_CREATED -> PHASE_MACHINE_INITIALIZED ->
>    -> finish-machine-init -> PHASE_MACHINE_READY
>    -> cont
>
> Is machine-set one big command, or a sequence of commands, where each
> command configures just one thing?
> 
> Same for accel-set.

They would be almost 1:1 mappings with -M and -accel.  If we add a third 
command for the CPU model, machine-set and accel-set would be basically 
as big as device_add or object-add.

So the full flow would be

  PHASE_NO_MACHINE
     -> machine-set -> PHASE_MACHINE_CREATED ->
     -> accel-set -> PHASE_ACCEL_CREATED ->
     -> cpu-model-set -> PHASE_MACHINE_INITIALIZED ->
     -> device_add...
     -> finish-machine-init -> PHASE_MACHINE_READY
     -> cont

> Permit me to go off on a tangent: how much and what kind of magic do we
> want in the initialization sequence?

No magic at all, because the QMP configuration would be entirely 
-nodefaults.  Default devices, for boards that need them, can be created 
by setting properties such as serial0, netdev0 in machine-set (and in no 
other way).

Paolo


