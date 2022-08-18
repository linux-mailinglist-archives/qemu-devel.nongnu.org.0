Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96675981F8
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 13:09:42 +0200 (CEST)
Received: from localhost ([::1]:50812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOdPB-0007bi-A9
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 07:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oOdIK-000587-38
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 07:02:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oOdIF-0003zk-Fb
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 07:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660820550;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=aHw0WHUDjplHhyM2x7z49ozQEApYFi2qNDHdSE7wkJ4=;
 b=Q6bZsIjnhyuKjHcAbtP40IH8dM6Zx5WTBlyaLLKG7pEiDfRC1X+H4XICYxcGBq9AtoEUyz
 TYESVkn3rG4DbkrW5x2KDF12YXU21MHTWjRXxo8ScP2c3o9YvZ2e6bjhODn1iI1Bq5Mnoi
 4KAH20TajLA+dsztfuEQwLqV7BmTnb0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-RY7n7jgQPzmoPxnUsKKvng-1; Thu, 18 Aug 2022 07:02:29 -0400
X-MC-Unique: RY7n7jgQPzmoPxnUsKKvng-1
Received: by mail-wm1-f70.google.com with SMTP id
 az42-20020a05600c602a00b003a552086ba9so2525742wmb.6
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 04:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:subject:to:from
 :x-gm-message-state:from:to:cc;
 bh=aHw0WHUDjplHhyM2x7z49ozQEApYFi2qNDHdSE7wkJ4=;
 b=hicfAP0VJZPQzYg3YbSMa1NpXxlRvgB0CAmrRpwdRohbJm8MD3hwTf/E7FK/9jkadv
 GawnO63kQOLuh6/doly1uOXV0RF5XmpUkWoPFLgntRZ8PRIL32rhhVzakpjb/+Zcz2/Y
 2+Uw5YTZaKWStioIRoYIVySP3CxzEUb4exvkiNpn5Y08rr6p1Q0FgcY+4d8e6g3rKMM7
 joTP3qYbjAzVPTQPLv9sJovcGiJjnrTefxB6lC3Cut3F1wVObWTc+KCo+Ks9gCjoGq8X
 8OHVvOuKvr4496YQmewNmxF4VGePireroVHF3NjPdpc05Kbd90NkYQpTvnN+usohVoFT
 jolA==
X-Gm-Message-State: ACgBeo2nx9r68JEK5Z76hPP3ilZzjUtRbvccirJG/Au/yOi3CgLj6JcG
 DDJhmuzh3mHq99rN09TiVib6BLjUYwUkh8w9tr3ljdP6F3xfhbBj05eS98xItF3tOlWHtEAhD4b
 Z+pqQ0tA6f/bWQ6M=
X-Received: by 2002:a5d:64c1:0:b0:222:ce3e:bd35 with SMTP id
 f1-20020a5d64c1000000b00222ce3ebd35mr1282034wri.520.1660820548131; 
 Thu, 18 Aug 2022 04:02:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR44+Jfvs3ZHgQq+TEikGcHkyQ2Q3MyypepDu4zzVdayLzW0gDPNsDVFT78646zxeRPBclu1zQ==
X-Received: by 2002:a5d:64c1:0:b0:222:ce3e:bd35 with SMTP id
 f1-20020a5d64c1000000b00222ce3ebd35mr1282018wri.520.1660820547862; 
 Thu, 18 Aug 2022 04:02:27 -0700 (PDT)
Received: from localhost (static-205-204-7-89.ipcom.comunitel.net.
 [89.7.204.205]) by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4c8b000000b002252f57865asm1168649wrs.15.2022.08.18.04.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 04:02:27 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
Subject: KVM call for agenda for 2022-08-23
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Thu, 18 Aug 2022 13:02:26 +0200
Message-ID: <87pmgx24sd.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Hi

Please, send any topic that you are interested in covering.

At the end of Monday I will send an email with the agenda or the
cancellation of the call, so hurry up.

After discussions on the QEMU Summit, we are going to have always open a
KVM call where you can add topics.

 Call details:

By popular demand, a google calendar public entry with it

  https://www.google.com/calendar/embed?src=dG9iMXRqcXAzN3Y4ZXZwNzRoMHE4a3BqcXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ

(Let me know if you have any problems with the calendar entry.  I just
gave up about getting right at the same time CEST, CET, EDT and DST).

If you need phone number details,  contact me privately

Thanks, Juan.


