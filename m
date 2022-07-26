Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852BC58181C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 19:09:04 +0200 (CEST)
Received: from localhost ([::1]:33242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGO3L-0008DC-Cd
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 13:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oGNLQ-0003L4-Ja
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:23:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oGNLN-0007zD-Sn
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:23:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658852616;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=7/nzWOuQD4eosXMQZ80Aoe0SIhJglZ7dAHxPEF4Dm9w=;
 b=JcP3rzkdipK0d7nzAOdARs9LkTISXUzx0i1RL39xC5ykjefnenViAsOSc7y0uLE1f9QXhN
 qqFq1hk1XKgWnIBW5iPOnuQzBY7EdD/zAT6q9CCCK4bk8JHw3O4Huli/+m9JvKExg7EHDr
 WBLWdVhy4ywygVb/IV6XvKbg2oWBwjY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-dbAIV50eO3-jwMHqyQxbcg-1; Tue, 26 Jul 2022 12:23:34 -0400
X-MC-Unique: dbAIV50eO3-jwMHqyQxbcg-1
Received: by mail-wr1-f70.google.com with SMTP id
 i15-20020adfa50f000000b0021ebd499de2so199873wrb.7
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 09:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=7/nzWOuQD4eosXMQZ80Aoe0SIhJglZ7dAHxPEF4Dm9w=;
 b=g9Qh7nb6PP3hKhb0/0Afn62STo/lCaINSDjl+eqzBF1bcCosT+B8uY2WfdWv1FZIrH
 lvwi8A3jTdLHy/8Xo/yDaVkFCIfdbgvqbO4M3iheW7mYDYPacoHOGIYj3rIatjnX7L3k
 9Ar/JbI4kf55weB83IO2XLsS36aOht2kOwjdhaTChSJtOW8Mjju17rZk09Bi9OtTNu42
 L6H+1iOvIxhJC2QDyg/5grJmM5iu4gHIkiGvsUDkPxLCjQMXwXaISxK2dpdAm1pMbctG
 7eX/Ii4Rlf3yMTDNeMLtvAeyRBK/aGdcmbZvbDA/EZY1HIJQXgc2Zct+N3y/pm07GtBW
 53NQ==
X-Gm-Message-State: AJIora/gMUPdBttFWHr1swKDMV7rXgJphaaPh97vqZP6RLLjSbLceVyG
 jX+OA8HdJ0HMPtl0j2UghaaPaI2qwuCvepEhf4YAs9piAybUGORbCTEkoTHzFg5HU7LdJnpmXoy
 wwjxO9IAq8Udy/iM=
X-Received: by 2002:a5d:474f:0:b0:21d:9a9b:a1fb with SMTP id
 o15-20020a5d474f000000b0021d9a9ba1fbmr11880019wrs.115.1658852613702; 
 Tue, 26 Jul 2022 09:23:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uVYTcXyCsm0SaiP5o92poIJmQ5xCnIkAg28tD28wKnTeZ44u/taYuCNWNJiKjED6+ensbCoQ==
X-Received: by 2002:a5d:474f:0:b0:21d:9a9b:a1fb with SMTP id
 o15-20020a5d474f000000b0021d9a9ba1fbmr11879983wrs.115.1658852613216; 
 Tue, 26 Jul 2022 09:23:33 -0700 (PDT)
Received: from localhost (static-110-87-86-188.ipcom.comunitel.net.
 [188.86.87.110]) by smtp.gmail.com with ESMTPSA id
 c23-20020a05600c4a1700b003a3170a7af9sm17085550wmp.4.2022.07.26.09.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 09:23:32 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 4/5] migration: Make find_dirty_block() return a single
 parameter
In-Reply-To: <YsQ0fc67PKePt3rS@work-vm> (David Alan Gilbert's message of "Tue, 
 5 Jul 2022 13:54:21 +0100")
References: <20220621140507.1246-1-quintela@redhat.com>
 <20220621140507.1246-5-quintela@redhat.com> <YsQ0fc67PKePt3rS@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Tue, 26 Jul 2022 18:23:31 +0200
Message-ID: <87sfmnderg.fsf@secure.mitica>
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

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> We used to return two bools, just return a single int with the
>> following meaning:
>> 
>> old return / again / new return
>> false        false   0
>> false        true    1
>> true         true    2  /* We don't care about again at all */
>
> We shouldn't use magic numbers; if you want to return it in a single
> value then it should be an enum so it is clear.

I need to also return an error in the following patches.
I am not sure if it clearer to try to change to an enum.
Will try and see.

Later, Juan.


