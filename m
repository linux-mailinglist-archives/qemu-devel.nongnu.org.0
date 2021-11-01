Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9239E441B5D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 13:51:29 +0100 (CET)
Received: from localhost ([::1]:50202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhWme-000099-FN
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 08:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhWkf-00075v-Ph
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 08:49:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhWke-0000gc-0k
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 08:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635770963;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ZH36NSkEFd4z1Dobe2QULRucsNBqviu0aq3Y+3IBTHA=;
 b=Wow3pSOmBAUF5/X4q8FwCRtyponSBW+v03BaUgoDyqHukhLFuDaxHpgEPdPLrmHvcS6ICG
 EEk28s5kuolXQVrzDkYvVmFCiabVxSWV8ZNp4/5p0qxAFa+NnjkL4YpscR4ApEV1OxUzNQ
 cDBlOrPcvgFPDfpIwge74d2po5UGPGg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-m2REXWBtMI-tXA4tonnhIg-1; Mon, 01 Nov 2021 08:49:22 -0400
X-MC-Unique: m2REXWBtMI-tXA4tonnhIg-1
Received: by mail-wm1-f69.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso3459422wme.8
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 05:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=ZH36NSkEFd4z1Dobe2QULRucsNBqviu0aq3Y+3IBTHA=;
 b=zsti8+/2nXYT88mYtG9Uz5LuL3x2RVWaPSXnrQMcPDPS2GUkheAdpA/Lv/kxh0snb0
 wSJ2Bluxn1d9cBltpenvwfBSFKa5sDmAjA4u5xVlqkZSPzSM3KAW/uXGyYGemi50v06W
 EAS35ss5rsjM9i2vVl5qVoGObdgYYdZwlu/217wL4MsET1npHsJfx539IqHBmLV9hVq0
 VhOOOZAjYWoOqzn17aJ50weT2JEeqfS/NsvUP0P4Jq9uZN6vRNsYs0K1TmFwH3kQghhp
 +HDes/Lyi2+9bDCge6b+k7ep+ee24B5vgCRf+0+xEyG94HRPTMckqrzqeDznnUIcjsXh
 zu/w==
X-Gm-Message-State: AOAM533lNVqeSagtKCeFdhjIoIt80L5fDQfO3LY55rhOJ8GsE5OT1Xa9
 8VMlGUfJG7ItANPmywmJdcszoKVOiJ7IT//1eqD8QZBfCPalzV/PwIdjucRso1wON8qOTX2+q7D
 VOFtEgpmZYcAru9M=
X-Received: by 2002:a1c:2047:: with SMTP id g68mr30957907wmg.181.1635770961275; 
 Mon, 01 Nov 2021 05:49:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCbM7W0lZ9vIAtlNlK27yy2bjZj3Uq/ONk+9Zh/1n+b/t61uv/nfcEYurfPtzBeFFl5EtySw==
X-Received: by 2002:a1c:2047:: with SMTP id g68mr30957885wmg.181.1635770961098; 
 Mon, 01 Nov 2021 05:49:21 -0700 (PDT)
Received: from localhost ([178.139.231.243])
 by smtp.gmail.com with ESMTPSA id v3sm14342077wrg.23.2021.11.01.05.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 05:49:20 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/9] memory: Introduce replay_discarded callback for
 RamDiscardManager
In-Reply-To: <20211011175346.15499-2-david@redhat.com> (David Hildenbrand's
 message of "Mon, 11 Oct 2021 19:53:38 +0200")
References: <20211011175346.15499-1-david@redhat.com>
 <20211011175346.15499-2-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 01 Nov 2021 13:49:19 +0100
Message-ID: <87y268oxbk.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> wrote:
> Introduce replay_discarded callback similar to our existing
> replay_populated callback, to be used my migration code to never migrate
> discarded memory.
>
> Acked-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


