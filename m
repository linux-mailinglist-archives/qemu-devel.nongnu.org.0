Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D70244D6F5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 14:01:17 +0100 (CET)
Received: from localhost ([::1]:49532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml9hb-0005IU-Sa
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 08:01:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ml9di-0001hr-Kt
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:57:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ml9dg-000320-Hb
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636635431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MIHfVv4vnuhA7Ix8eIfY31NsoHnwRfQ+AwTgbf6gbX4=;
 b=Yc6VcldB1GLa2nhAyj4EZP2c85d/75O55SiymEidx/nDReFFMTHVbrbUYXHtMlDQ6Rxkdx
 W4ISIvZGl+H+tiY3WURctnXu204IDGSxcE5fvU9V7TbjmccpBOQEYRed9f7s/ujDfPtpkl
 huP49+WmB3o/eXW6NH9TwA/I6/3C/JU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-RZXojT44NPKlwVxNUn1NHg-1; Thu, 11 Nov 2021 07:57:10 -0500
X-MC-Unique: RZXojT44NPKlwVxNUn1NHg-1
Received: by mail-wr1-f71.google.com with SMTP id
 u4-20020a5d4684000000b0017c8c1de97dso989799wrq.16
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 04:57:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MIHfVv4vnuhA7Ix8eIfY31NsoHnwRfQ+AwTgbf6gbX4=;
 b=VhG7A/0BQTykf8cuOUSAAC7RlkybSyGrUMtyIBcpMwHBRuDYe4pORGTK6rr2mindpP
 /uThRUWHIsFmRaT0rnrRaFM32VfIzEhGqT39lnoEGNFK8jLmFGycKhAvey1wHtlRBhi5
 Q9ZyyyI6HXKkD7T6nraq5Luk8nPkAEb26TZa/rjLXrDP6T7TKV8PHGfmy1KFnVXTvg+A
 nuKSzY7/X7NdNq0MJI95vO29hUgWqATkYOdYDAZ1Qy817EbmbaNk8zjdalRYITb8U+xR
 kOdd2bPxSHk7jZfMwtGl8g/Cvk0S61PMcgX5rEFP71dElWIAInho17vc7wMwgZOkHeg9
 jxEg==
X-Gm-Message-State: AOAM531+c/2Yr2/jFUQ37wclfEnc+Vb8shQ7bGvjjEVXTfG6jH4TziQE
 jMfV//KBAye933kbjPpidTdEZjG0q6rhcXsOYZfDvkYcZYKBDuC+8/dUwqS979RusFw372FnIRP
 T46IYTlYzOmFL1ic=
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr8907220wrd.346.1636635429156; 
 Thu, 11 Nov 2021 04:57:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPstmhDSxZKYRyxvdNqjvSxYvVSOtm7jQS2Tid1t2GTewOgu55j1mY2AbkKOorDHzL2iNzqw==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr8907193wrd.346.1636635428966; 
 Thu, 11 Nov 2021 04:57:08 -0800 (PST)
Received: from gator.home (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id r17sm9883331wmq.5.2021.11.11.04.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 04:57:08 -0800 (PST)
Date: Thu, 11 Nov 2021 13:57:06 +0100
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2 v3 0/6] tests/unit: Fix test-smp-parse
Message-ID: <20211111125706.6cvtcultze5ju7fe@gator.home>
References: <20211111100351.2153662-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211111100351.2153662-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 11:03:45AM +0100, Philippe Mathieu-Daudé wrote:
> Yet another approach to fix test-smp-parse.  v2 from Yanan Wang:
> https://lore.kernel.org/qemu-devel/20211111024429.10568-1-wangyanan55@huawei.com/
> 
> Here we use the QOM class_init() to avoid having to deal with
> object_unref() and deinit().
> 
> I suggest to rename smp_parse() -> machine_parse_smp_config()
> after the rc0 more as a documentation change rather than an
> API change, since this method got added last week and doesn't
> follow the rest of the machine API.
> 
> Supersedes: <20211111024429.10568-1-wangyanan55@huawei.com>
> 
> Philippe Mathieu-Daudé (6):
>   tests/unit/test-smp-parse: Restore MachineClass fields after modifying
>   tests/unit/test-smp-parse: QOM'ify smp_machine_class_init()
>   tests/unit/test-smp-parse: Explicit MachineClass name
>   tests/unit/test-smp-parse: Simplify pointer to compound literal use
>   tests/unit/test-smp-parse: Constify some pointer/struct
>   hw/core: Rename smp_parse() -> machine_parse_smp_config()
> 
>  include/hw/boards.h         |   3 +-
>  hw/core/machine-smp.c       |   6 +-
>  hw/core/machine.c           |   2 +-
>  tests/unit/test-smp-parse.c | 123 +++++++++++++++++++-----------------
>  4 files changed, 72 insertions(+), 62 deletions(-)
> 
> -- 
> 2.31.1
> 
>

For the series

Reviewed-by: Andrew Jones <drjones@redhat.com>


