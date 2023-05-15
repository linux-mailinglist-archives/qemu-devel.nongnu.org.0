Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25496702E67
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:37:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXyZ-0000hF-DS; Mon, 15 May 2023 09:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXxw-0000aB-Sp
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:10:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXxk-0002QU-Lz
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:10:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684156204;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jr0XvCmYuLPXb7Y51TM5yKF6NS+ixgYeU0M/EvGYCMg=;
 b=GWZcEDg9BpuuoiUDSGWxf2wQC3F9vQoLqC+qcbrFgTA50pd6mPnIP9ZiiUXyt2y6V27tN+
 Oopk5xsBwBm0IFlIfVGajexs6HPaiOWNQyaomxetQN74AUkYBYWkgIVC8rk+66+x6yhKJE
 OsubOPALPy747gcpzUGGdxYEmzUf5tc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-zWVYRmJhMQ2QYjHDgUAJ9Q-1; Mon, 15 May 2023 09:10:02 -0400
X-MC-Unique: zWVYRmJhMQ2QYjHDgUAJ9Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f421cfb4beso35508565e9.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 06:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684156201; x=1686748201;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jr0XvCmYuLPXb7Y51TM5yKF6NS+ixgYeU0M/EvGYCMg=;
 b=UIbPc4FUBmxmJlHeC6hBZ0oQAgdb68brI2KuMIQ7QoGY+H+4+by42fWlOwKlK74m5D
 e+/f3OT0YJca6w2d+F4QDrITb8tdtOF9twouyFU1b6YqS51qDlHX3kS2MgvEsAAZAeTo
 g1hkpFMqCn5qc1bwchS8Eot3AJjArDyauc3Uxklc5bASNJpDGXx1oXBg0icf+Yzm3563
 EkkN+d1QLcTPm1W9C4AOJc6J45cnOyKoQBpwn6ki8hVqphoU+8Ed7UG9zrHmKGJQTB69
 jCm44UnuckjCWiz06g4FVxT8MNTZmgedjPnzEMkLHnAkeOgB6aqZW2lnYnziLgnVyTlm
 Bq8A==
X-Gm-Message-State: AC+VfDxpA/NjivvQK/ns5yMBJ7y0se1n7bgiDET6Yy6qtKR20BMz2sjX
 yHTFPpm3a5uoui8JMa8yiGtkfPgDF79X8901vFIAtgOjtgtyyOjvOMBhOzhHFyzzOerJg057BVy
 V4PMnIy/02P8qCss=
X-Received: by 2002:a5d:58d9:0:b0:2f9:1224:2474 with SMTP id
 o25-20020a5d58d9000000b002f912242474mr24995203wrf.23.1684156201531; 
 Mon, 15 May 2023 06:10:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5hWaXTwLTnGQ3PQSxbL/II0g8YQRSzYCpHBPllD2ejoTZpyKOlmpzZhwkUyJUCTSjNGyDxJg==
X-Received: by 2002:a5d:58d9:0:b0:2f9:1224:2474 with SMTP id
 o25-20020a5d58d9000000b002f912242474mr24995170wrf.23.1684156201202; 
 Mon, 15 May 2023 06:10:01 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 m13-20020a7bcb8d000000b003f50ce4c16dsm2230731wmi.46.2023.05.15.06.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 06:10:00 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: <qemu-devel@nongnu.org>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,  <qemu-block@nongnu.org>,  Eric
 Blake <eblake@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  John Snow <jsnow@redhat.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Peter Xu <peterx@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  David Gibson
 <david@gibson.dropbear.id.au>,  Harsh Prateek Bora
 <harshpb@linux.ibm.com>,  Eric Farman <farman@linux.ibm.com>,  Greg Kurz
 <groug@kaod.org>,  <qemu-ppc@nongnu.org>,  <qemu-s390x@nongnu.org>,  Fam
 Zheng <fam@euphon.net>,  Thomas Huth <thuth@redhat.com>,  Leonardo Bras
 <leobras@redhat.com>,  Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH 10/21] migration: Move rate_limit_max and
 rate_limit_used to migration_stats
In-Reply-To: <4a7fcac1-a8f1-44d2-1a5a-284a80486633@kaod.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Le
 Goater"'s message of "Mon, 15 May 2023 15:02:42 +0200")
References: <20230508130909.65420-1-quintela@redhat.com>
 <20230508130909.65420-11-quintela@redhat.com>
 <4a7fcac1-a8f1-44d2-1a5a-284a80486633@kaod.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 15 May 2023 15:09:59 +0200
Message-ID: <87h6sdzqoo.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 5/8/23 15:08, Juan Quintela wrote:
>> This way we can make them atomic and use this functions from any
>> place.  I also moved all functions that use rate_limit to
>> migration-stats.
>> Functions got renamed, they are not qemu_file anymore.
>> qemu_file_rate_limit -> migration_rate_limit_exceeded
>> qemu_file_set_rate_limit -> migration_rate_limit_set
>> qemu_file_get_rate_limit -> migration_rate_limit_get
>> qemu_file_reset_rate_limit -> migration_rate_limit_reset
>> qemu_file_acct_rate_limit -> migration_rate_limit_account.
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>> If you have any good suggestion for better names, I am all ears.
>
> May be :
>
>  qemu_file_rate_limit -> migration_rate_limit_is_exceeded

I try not to put _is_ in function names.  If it needs to be there, I
think that I need to rename the functino.

migration_rate_limit_exceeded()

seems clear to me.


>  qemu_file_acct_rate_limit -> migration_rate_limit_inc

My problem for this one is that we are not increasing the rate_limit, we
are "decreasing" the amount of data we have for this period.  That is
why I thought about _account(), but who knows.


> Also, migration_rate_limit() would need some prefix to understand what is
> its purpose.

What do you mean here?
This is the only rate_limit that I can think in migration.

> Do we really need "_limit" in the names ?

You have a point here.

If nobody complains/suggest anything else, I will drop the _limit for
the next submission.

Thanks very much.


