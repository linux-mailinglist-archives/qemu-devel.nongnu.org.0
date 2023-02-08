Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A6468F816
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:31:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPqAK-0002e5-3n; Wed, 08 Feb 2023 14:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPqA8-0001iD-Re
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:31:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPq9t-0006qi-2U
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:31:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675884668;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=FcDqR+kF4tw5jrTC3T8r0cMO9RwfADHqUjGsrrIk60M=;
 b=W3YWkVYVwZSRCDAwrMeSZHZ4WQaLEdWpKGganuo6TKb/wV8ue0R7zIbtdxCNS9I9QkHgrw
 TFN1QlNHPspOGHtqp0oxbDSyPjRKJog2s6XoVBlSKOyAsczAGmMOmBCC2BJ5VQFUzrRsEx
 T7n6YJgrPYGYblKfph6Uq2phiwH1Y5A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-671-dXglv-5cOoW4_kgyxZKv0Q-1; Wed, 08 Feb 2023 14:31:06 -0500
X-MC-Unique: dXglv-5cOoW4_kgyxZKv0Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 l21-20020a05600c4f1500b003e00be23a70so1641134wmq.2
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 11:31:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FcDqR+kF4tw5jrTC3T8r0cMO9RwfADHqUjGsrrIk60M=;
 b=gXYRYWSvUjZvbQl4DFW5IgkiH6rR90N7GthgjnSzvS+YqRchDHFL1Qi4AK99Pylosh
 9a+86N9QNfkizeID8wDEBn+l4IhbKffw6ChVe+QdEN4YdqWjn11hypsfmcvtCYMPIjC0
 D7HxguLaRpE2v71ADhlzFinSo4xqs+9nL1/aGgOzuiBRS1agVUdKn7Z5vZkNEj9LTMjn
 f5+QkGlS+gqHEYz7e7+uh6uM/PBzxjFcyOYe4c+ISpMzp1NSuUpqkm6AUYSbjTTuOIGl
 JDGNmOjy0Z57cnLvwMxnR7GMZisCeTRaMFSs3mmqttXrnrwGVwNrGWHAqSEX7fRBcitT
 vcEw==
X-Gm-Message-State: AO0yUKWIeZ2K60G4AWcjFnp78qXE/ayZYcQWp+Skf2sMHAnDhIkAHLqz
 2xAydS3eXIX4DRpxokAsuOE1FKpL3nPXeCRVQQrNzpOBlhxiS52xufX9+KjDKtUywLG2fx6yOKn
 UdiHnOVSzUSMBFEk=
X-Received: by 2002:adf:ce85:0:b0:2c3:ee92:4a9b with SMTP id
 r5-20020adfce85000000b002c3ee924a9bmr7347866wrn.41.1675884665150; 
 Wed, 08 Feb 2023 11:31:05 -0800 (PST)
X-Google-Smtp-Source: AK7set/bgGaxwVeYE1FVzaB1i0wvpellEvaKOFSlDL2BH4Qjrbk/o1Cnnvn7vlpCcYukNSQZL3YR4Q==
X-Received: by 2002:adf:ce85:0:b0:2c3:ee92:4a9b with SMTP id
 r5-20020adfce85000000b002c3ee924a9bmr7347846wrn.41.1675884664934; 
 Wed, 08 Feb 2023 11:31:04 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 h10-20020a5d504a000000b002c3efca57e1sm6371179wrt.110.2023.02.08.11.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 11:31:04 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  pbonzini@redhat.com,
 peterx@redhat.com,  david@redhat.com,  philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [RFC v5 2/3] memory: add depth assert in address_space_to_flatview
In-Reply-To: <20230117115511.3215273-3-xuchuangxclwt@bytedance.com> (Chuang
 Xu's message of "Tue, 17 Jan 2023 19:55:10 +0800")
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
 <20230117115511.3215273-3-xuchuangxclwt@bytedance.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 08 Feb 2023 20:31:03 +0100
Message-ID: <87cz6k9cp4.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Chuang Xu <xuchuangxclwt@bytedance.com> wrote:
> Before using any flatview, sanity check we're not during a memory
> region transaction or the map can be invalid.
>
> Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I am waiting to see what Paolo thinks (specially of patch 1).

Later, JUan.


