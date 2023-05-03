Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EBA6F5CE6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 19:18:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puG76-00029z-KE; Wed, 03 May 2023 13:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puG73-00029B-P7
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:17:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puG72-0003l9-6Q
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:17:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683134275;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Dg+/CDUzPAOlfiW1nv1hmM+5DwIuK/sUUb1WwIGkdag=;
 b=NHt+U+UfsbMJUvr99Y/4PTn8cx00J5ysTj/9ywbwlTBRQDsIky4PtHhz1ou+XvwKniz4Jo
 x/itfRqtdP4gKz6sR0yTa4I/RCaChobODfoP5A0Fv71OFmVWaYA8EnxU63sBezkMM806E7
 69e+3F6i1qQxrizvkvh2u3LGcpFAoTI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-cjD70NRaPxmafOmc1gFzbQ-1; Wed, 03 May 2023 13:17:53 -0400
X-MC-Unique: cjD70NRaPxmafOmc1gFzbQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3063089cff4so2177266f8f.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 10:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683134273; x=1685726273;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dg+/CDUzPAOlfiW1nv1hmM+5DwIuK/sUUb1WwIGkdag=;
 b=gtI6ykOIkXcYMNuvx5afFqDlDkuErVOZOb7nvKub3IE3TlO6e74uxKGQeKFvNy5q3g
 J4jHNVqSx9LtHYKJkPTOgn09I0lTMS5ldAhJ0dGeAo9IQZN792TCxYsuh3UDL/Q/yML5
 mIKhor7Q0fmL3JJmp8v68UwI6ytGQcEq7VZbYvNNaXrVS149kJg1+qUVLCx3dv+s13dJ
 lP9Yxf2RdHaKGDpiLs7MNURGdaKexLcWYEWmI3stqRCTHgbA34eOGBJnrxhPfJgp+bEd
 zkt3NV1O7ahuchZ4pUPGSAJv7CoEUTVLHbl5bc4gArC6oMkFQFiE8XLUaBFYikmGhpdV
 IEbg==
X-Gm-Message-State: AC+VfDx4U0B9D7e9lQqOSr6Rz6xVdwaP9HK+88HrW7pELLXXK+i6fxCH
 24t48nCIAxqOFPRwmbDtldF8pVxQq+XWMLxr6arF8gi+wUZxgQ9lsy8uARKtY0Hcof7zwSzvc52
 ISAhWzGV2kczKoFo=
X-Received: by 2002:a5d:5942:0:b0:304:8147:f0ba with SMTP id
 e2-20020a5d5942000000b003048147f0bamr633157wri.3.1683134272863; 
 Wed, 03 May 2023 10:17:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ52d+7ikKUqLTowtxActL+MyAVu5+DJMJ9sgfta4VQr6M2rXN+bsc0pBvOJU8LGHbq6+BOxPw==
X-Received: by 2002:a5d:5942:0:b0:304:8147:f0ba with SMTP id
 e2-20020a5d5942000000b003048147f0bamr633143wri.3.1683134272518; 
 Wed, 03 May 2023 10:17:52 -0700 (PDT)
Received: from redhat.com ([188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 q6-20020a5d5746000000b003063db8f45bsm3220095wrw.23.2023.05.03.10.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 10:17:51 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>,  Peter Xu <peterx@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Yanan Wang <wangyanan55@huawei.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Leonardo Bras <leobras@redhat.com>,  Fam Zheng
 <fam@euphon.net>,  Eduardo Habkost <eduardo@habkost.net>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PULL 11/18] migration: Create migrate_block_bitmap_mapping()
 function
In-Reply-To: <ZFKVosOaCSZwizzb@redhat.com> (Kevin Wolf's message of "Wed, 3
 May 2023 19:10:58 +0200")
References: <20230427152234.25400-1-quintela@redhat.com>
 <20230427152234.25400-12-quintela@redhat.com>
 <ZFJw1lSMcQ5sqZBD@redhat.com> <87jzxpqxdz.fsf@secure.mitica>
 <ZFKVosOaCSZwizzb@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 03 May 2023 19:17:46 +0200
Message-ID: <877ctpqqpx.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

Kevin Wolf <kwolf@redhat.com> wrote:
> Am 03.05.2023 um 16:53 hat Juan Quintela geschrieben:
>> Kevin Wolf <kwolf@redhat.com> wrote:
>> > Am 27.04.2023 um 17:22 hat Juan Quintela geschrieben:
>> >> Notice that we changed the test of ->has_block_bitmap_mapping
>> >> for the test that block_bitmap_mapping is not NULL.
>> >> 
>> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> >> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> >> 
>> >> ---
>> >> 
>> >> Make it return const (vladimir)
>> >
>> > (I don't think this part was actually meant for the commit message)
>> >
>> > This commit broke qemu-iotests 300 on master. Please have a look.
>> >
>> > Kevin
>> 
>> grrr
>> 
>> selfNack
>> 
>> Just wondering, make check don't run this?
>> 
>> I run "make check" before I sent the pull request.
>
> "make check" only runs a subset of iotests because it would take too
> long otherwise (especially in the context of CI - it wasn't me who made
> this decision). It comes at the cost that sometimes we catch problems
> only after merging the patch to git master when a block developer first
> runs the full set of tests.

Ahhh.

> So I wouldn't blame your testing, it's just something that happens, and
> when it happens we need to look after it.

Thanks.  I have sent another email.  Found why it is failing.  But I am
not sure what is wrong the test of the change in the code.

Later, Juan.


