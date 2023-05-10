Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0893C6FE392
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 20:02:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwo8R-0000OY-Ds; Wed, 10 May 2023 14:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwo8K-0000OA-4A
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:01:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwo8G-0007o3-UQ
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:01:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683741704;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=MVfJZBFaiugg/wuTeuISNMByT4dqGCVM5L9uwQU4aIo=;
 b=fCbuWw0jb8Da8tlJdqFwHKMdhensV1adWwwuaHSFnzMCfl4xVxibJAUbzfiYvL4MzL5yGU
 j6TOKqBIsTjelaQ4qHwgEPUlP0BSgTfqjRTriIXaf+vrcEfxsoZv2gVDJiTDWKtvfR4wD9
 O/LYN/3y7RmdY72rJGJCorQfGL8FOQE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-5aR4z68kN7y1f_k8bIKB4A-1; Wed, 10 May 2023 14:01:40 -0400
X-MC-Unique: 5aR4z68kN7y1f_k8bIKB4A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f429072212so13024845e9.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 11:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683741699; x=1686333699;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MVfJZBFaiugg/wuTeuISNMByT4dqGCVM5L9uwQU4aIo=;
 b=i8ug0ZCMfJT8Aj6/cIZukKCrBB0jD3MhN70xsK8R2rS5jOIA0v92TP3nHBt4I8RoC4
 KATrHR0xbgEJHuM9O+bgzdVlRUjuWNYSOlkXH+ULoY/WgwJWL/QXVV/sSytiJGjwYUTM
 kno1f8EucGpxlpn5j4NwS8ac3Jnh1LGwWmcCwFsLOE1awX5rkkje01ugFfiMHP4mIvE1
 o35FN/Ab19tZ1cpcKN1Ee2w91hz41pFvAKEfpjvmXpXyA7B4sPgO/T01Z54rCuZXLAlc
 3BX6srg9hNcJpQIabwLq6GSddsge0Ej66+Y8Sdw1URQbGxKngk+0VJFQhh6JjgZLQ8Q9
 4j8A==
X-Gm-Message-State: AC+VfDyIR2oB/YwGFOJEx/E1o5py2EFiZJTWvGYSJbZN0uByen0DdYpU
 5vAR7EdrcHMNM6Zh7pHum4IGCE/bIcacyTMAY0RKoegYfSWH+yIbU/EjPFG0XTYEXSUWDPzO+MV
 mUIvHlyyka4OFtm8=
X-Received: by 2002:a05:6000:b:b0:306:2fac:377 with SMTP id
 h11-20020a056000000b00b003062fac0377mr11829708wrx.8.1683741699681; 
 Wed, 10 May 2023 11:01:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5XHkVIbw+8KVe3e+3kzY/aFmbknslQApUBq97sd0Xp5Wz3pMoa1ZJksJ8x1gJzZbU0zY2+AQ==
X-Received: by 2002:a05:6000:b:b0:306:2fac:377 with SMTP id
 h11-20020a056000000b00b003062fac0377mr11829696wrx.8.1683741699424; 
 Wed, 10 May 2023 11:01:39 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 n17-20020a5d4211000000b002f9e04459desm18008960wrq.109.2023.05.10.11.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 11:01:38 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Andrei Gudkov <gudkov.andrei@huawei.com>
Cc: <qemu-devel@nongnu.org>,  <eblake@redhat.com>,  <armbru@redhat.com>,
 <berrange@redhat.com>,  <zhengchuan@huawei.com>
Subject: Re: [PATCH v2 4/4] migration/calc-dirty-rate: tool to predict
 migration time
In-Reply-To: <644a9e7f2bff9d36716a3722c729dc88ea40a35a.1682598010.git.gudkov.andrei@huawei.com>
 (Andrei Gudkov's message of "Thu, 27 Apr 2023 15:43:00 +0300")
References: <cover.1682598010.git.gudkov.andrei@huawei.com>
 <644a9e7f2bff9d36716a3722c729dc88ea40a35a.1682598010.git.gudkov.andrei@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 20:01:38 +0200
Message-ID: <87wn1g5am5.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Andrei Gudkov <gudkov.andrei@huawei.com> wrote:
> Signed-off-by: Andrei Gudkov <gudkov.andrei@huawei.com>

my python is very rusty, so I will let someone else to comment here.

Later, Juan.


