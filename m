Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA1A59CAF5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 23:39:49 +0200 (CEST)
Received: from localhost ([::1]:59150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQF98-0007ua-Nz
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 17:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oQF5G-0006L1-Df
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 17:35:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oQF57-0005Ok-PV
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 17:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661204131;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=brIonsal9u9HU7J/7gt5nhxPMqkbgVUfzOgipBzocTQ=;
 b=W5sLaeCdunG6UAX03yJH0/yU0biba/sledynG1SQh1WCB8RzDT0F4rL/DrHqf9Nlht30mu
 jzLaCVP/4lQFFhXR9eDXszRJch7hqfCDIOj2RoYSb4BaH3llqI6HMUynL15Zmnws9F5/oC
 lSEUHzFtok9dUvUxrfdJEk9G1iA0jIo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-202-uG8i4dagMzKKp7FEM-CTpw-1; Mon, 22 Aug 2022 17:35:30 -0400
X-MC-Unique: uG8i4dagMzKKp7FEM-CTpw-1
Received: by mail-wm1-f69.google.com with SMTP id
 p19-20020a05600c1d9300b003a5c3141365so9220808wms.9
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 14:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=brIonsal9u9HU7J/7gt5nhxPMqkbgVUfzOgipBzocTQ=;
 b=bcsGSGgR+a0kbr/9BVAbBdXvQlSAVlfWjMpu2rC/FLvJMTrltzB73SGhDPrzN8jwCR
 zEoRIp9MGAdyIvMEsNpKpbCek74B2YK9l/SuJDeGgdjBQvkgUC7H9RRZNuvhKaJTjOK6
 wI/5MnYGwqPNmYutY/G/q+63GUq6u8A0OW4xHr4OvoNm05O3SsgKt+yjRrpsf1ZdaUlr
 p2pPtrPKd9/e/1tZX0CacbL1yVp37++SHOJ4VOwIwKGoWMSZgQmJXpeDPe+3WzlniedR
 6pqEqnNvh66wumtDu30tdRLjH88NjSajf198Sob1A9wVaCJJZDv2EIy4EMT0tavXJi2V
 jQ5g==
X-Gm-Message-State: ACgBeo2RP7CwJlWsBO4JgwE0r1g/Ye3WgfbdZ3GZHAKomygWcfHo26z3
 MhvqO5eNtdeEXrEq4dly1rnl+VqZL0mV3WPpEdK3ECd9lypNcnGnFJQoqnZ3DabHuEYtwVD1LVD
 yo29LFYkosGgjMyQ=
X-Received: by 2002:a1c:7707:0:b0:3a5:d953:838f with SMTP id
 t7-20020a1c7707000000b003a5d953838fmr167305wmi.139.1661204129371; 
 Mon, 22 Aug 2022 14:35:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR59Yk1T3rDyJmhOq42/pFFhpFGSOCcrxiQybP2njLNcH6Izok3Yc6eQDkyiLA5N34StV94aDQ==
X-Received: by 2002:a1c:7707:0:b0:3a5:d953:838f with SMTP id
 t7-20020a1c7707000000b003a5d953838fmr167290wmi.139.1661204129152; 
 Mon, 22 Aug 2022 14:35:29 -0700 (PDT)
Received: from localhost (static-205-204-7-89.ipcom.comunitel.net.
 [89.7.204.205]) by smtp.gmail.com with ESMTPSA id
 j2-20020a5d4522000000b0022546ad3a77sm7666053wra.64.2022.08.22.14.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 14:35:28 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Peter Xu <peterx@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  Yanan
 Wang <wangyanan55@huawei.com>,  Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v7 05/12] migration: Make ram_save_target_page() a pointer
In-Reply-To: <CAJ6HWG4QsPK9y6+HE60BXT+F2bDxrfG4_oNvqgc_a9eMFVm-Dw@mail.gmail.com>
 (Leonardo Bras Soares Passos's message of "Sat, 20 Aug 2022 04:14:03
 -0300")
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-6-quintela@redhat.com>
 <01fcdde9f6246836b4058efc8c298a82e86d1458.camel@redhat.com>
 <87h7281ryc.fsf@secure.mitica>
 <CAJ6HWG4QsPK9y6+HE60BXT+F2bDxrfG4_oNvqgc_a9eMFVm-Dw@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 22 Aug 2022 23:35:27 +0200
Message-ID: <87lergyna8.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Leonardo Bras Soares Passos <leobras@redhat.com> wrote:
> On Fri, Aug 19, 2022 at 6:52 AM Juan Quintela <quintela@redhat.com> wrote:
>>
>> - the value that we receive in ram_save_setup() is a RAMState
>> - We would have to change all the callers form
>>   * ram_save_iterate()
>>   * ram_find_and_save_block()
>>   * ram_save_host_page()
>
> Maybe RAMState could be part of a bigger struct, and we could use
> something like a container_of().
> So whenever you want to use it, it would be available.
>
> What about that?

New struct it is:

typedef struct {
           int (*ram_save_target_page)(RAMState *rs, PageSearchStatus *pss);
} MigrationOps;

And go from there.

Later, Juan.


