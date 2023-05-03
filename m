Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576EA6F5CCF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 19:15:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puG4b-00053T-0h; Wed, 03 May 2023 13:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puG4Y-00050d-HQ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:15:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puG4X-0003Jk-2K
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683134120;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=eUP0q129OlgxpoYze+vv5/7oJZHl2RxiK1e6YDtj3DU=;
 b=GOm69MgnXJUBPKUR7JEByjmiltlmts4EkSTJ6rlbnJTZsLnyaMw6M0MVn3qEjSz2wPpL54
 CIyYXVl6RLGnimPf9Ffdj1BmspKo+UdndK8ef0O/gOWmwSosjNRl0mjJkGePvRtvfJXJuq
 8tpkTTMRjmy8fwxvKI42qFt+NCjqGNc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-6oY3rnPiPLmt3FmBAYPL2w-1; Wed, 03 May 2023 13:15:19 -0400
X-MC-Unique: 6oY3rnPiPLmt3FmBAYPL2w-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f315735edeso20969535e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 10:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683134118; x=1685726118;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eUP0q129OlgxpoYze+vv5/7oJZHl2RxiK1e6YDtj3DU=;
 b=cCiS674Xc7fU0ZmBPxGwrYMCt2BYT0xB6+encaotLRUoMCKtoJJeq6FrvMZmI4qpo8
 6mXqGyTCTR4BCFfLmYAEuRH/0XOEKwdJKi9EQDLQOc0H3aSx39QM6GMzQ9JF1DekxVmV
 /14FQV09w+YmrwSLj+JhrRxZxiwD2k6jdU+VuD3p85FQutQDLr59DB1pzQnaxeN6b58p
 PBUZR+bxZYHu2tITRlUFHjAbQfYs3GS3qliiwql3LDpa9KHX8fkYQXsWSJRDJcrnov3i
 Li7OCIlFTnuFUrxEd5qsatFyCMOEY+ZKRqvnBHsNpX1K3J2Jnr1/mmuJxb06noN3p0T6
 Xszw==
X-Gm-Message-State: AC+VfDxJ96mjuQie/a78gPDSRGAWZ841s5ESTbzzgVbFoPw6NJcLIWly
 o9Yf01ezGU7Pz2W6VjFcKqa5sX20Ke23epeAygRkkLxmWtK6WAuibkolhU8uapWptyNmZz+TU31
 v0IX9CRH2o6B3seQ=
X-Received: by 2002:adf:fd03:0:b0:306:2639:a1a2 with SMTP id
 e3-20020adffd03000000b003062639a1a2mr495323wrr.31.1683134118078; 
 Wed, 03 May 2023 10:15:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4MVnuWnSJYnKPp/42yj3xcnky8vCuv6QU7OZuvXXQ8VMpicVx4kRUn5vKJ0rNQNW1oPh6bOA==
X-Received: by 2002:adf:fd03:0:b0:306:2639:a1a2 with SMTP id
 e3-20020adffd03000000b003062639a1a2mr495302wrr.31.1683134117743; 
 Wed, 03 May 2023 10:15:17 -0700 (PDT)
Received: from redhat.com ([188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 g2-20020a5d5402000000b002da75c5e143sm34233572wrv.29.2023.05.03.10.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 10:15:17 -0700 (PDT)
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
In-Reply-To: <ZFJw1lSMcQ5sqZBD@redhat.com> (Kevin Wolf's message of "Wed, 3
 May 2023 16:33:58 +0200")
References: <20230427152234.25400-1-quintela@redhat.com>
 <20230427152234.25400-12-quintela@redhat.com>
 <ZFJw1lSMcQ5sqZBD@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 03 May 2023 19:15:14 +0200
Message-ID: <87bkj1qqu5.fsf@secure.mitica>
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
> Am 27.04.2023 um 17:22 hat Juan Quintela geschrieben:
>> Notice that we changed the test of ->has_block_bitmap_mapping
>> for the test that block_bitmap_mapping is not NULL.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> 
>> ---
>> 
>> Make it return const (vladimir)
>
> (I don't think this part was actually meant for the commit message)

yeap.  My understandig has always been that this is the way to put
commenst for the email.

> This commit broke qemu-iotests 300 on master. Please have a look.

    if (s->parameters.has_block_bitmap_mapping)
        return s->parameters.block_bitmap_mapping;

The test has a case where s->parameters.has_block_bitmap_mapping is true
but s->parameters.block_bitmap_mapping is false.

If that combination is right, then we need two functions becase the
asumtion that I did is false.

Vladimir?

Later, Juan.

> Kevin


