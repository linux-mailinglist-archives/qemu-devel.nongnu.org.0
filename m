Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00554547AE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 14:44:51 +0100 (CET)
Received: from localhost ([::1]:58588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnLF4-00036P-ID
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 08:44:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mnL6x-000577-U1
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 08:36:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mnL6w-0005Yh-2p
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 08:36:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637156183;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=JJAl8mr6/4lGsiOO1SpKx6ITxEF9+z7mb7bB9LUxbNQ=;
 b=QygAnpTwU/f96m7/o4rqRCrPxvZ3232zkHHy34Dh4wrxyw2fgmNzHWwXtaGSr1sBNPa7k1
 VyCmgdjcDFMnnjrJGF5fIb9uUxhhOwuT+rgetZB9wj4NJEuRaOgOiJr4Q1yPT0/fA2g2Lz
 KNqlvA3RmcI691J2gh5SuLNqyE6yDyE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-NR1rAomHMq6UlEHqlqPqiA-1; Wed, 17 Nov 2021 08:36:22 -0500
X-MC-Unique: NR1rAomHMq6UlEHqlqPqiA-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso1478325wms.5
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 05:36:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=JJAl8mr6/4lGsiOO1SpKx6ITxEF9+z7mb7bB9LUxbNQ=;
 b=35l9sYvY3+HDgtHPP2mCM/sqYDT6SxWslrVTU72sqH3NBCRYwH6kzdOwt0kFO1UhJ3
 rHWimWNRjWu+wATJbAc4DiayZZTZIJ32xdiBXxZRafFl34IU9ff5DML99hrTaQO4UYcv
 DnXpzExJ6X1yPrGg6qjv5W+DEXuYaB5avpgFB1dZSKbITnyneWVFJFaoneGtumH49uBG
 mbramHjlR4YMo4f/NQAJVOAzMJKt2/RCpXyeCpvf4dCBVHBJbXDLeIva+HastctdCOiE
 hRTj5WMaeUHUsR9uSt9qGJF0okyD/+jBLoNvksX4DUeaTwwMQ5VYUpMTcqChpqIgKT3K
 NQPg==
X-Gm-Message-State: AOAM531qiHiY2VdRqmN3eaoCLPp/YMO/8rl+/HyAhBTRwBAgJqGQbXIH
 t4w4eFLUm5mHc8IBUVgyyg2mGFRVADSjqSRFDgJIQ1AOcKm6Jx4Vd11S3hWvJMzTZaFsHLtwMwG
 e9K0UINrhmjzAKjI=
X-Received: by 2002:adf:d0d0:: with SMTP id z16mr20428500wrh.293.1637156181404; 
 Wed, 17 Nov 2021 05:36:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyymkj/4+LwG2gqOkDTUvuKXenz/IFROjXYDRFwTcZWvXrLrMxIgIfg86thhxmuuhmdpoRThA==
X-Received: by 2002:adf:d0d0:: with SMTP id z16mr20428475wrh.293.1637156181252; 
 Wed, 17 Nov 2021 05:36:21 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id n184sm5403149wme.2.2021.11.17.05.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 05:36:20 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH V2] migration/colo: Optimize COLO primary node start
 code path
In-Reply-To: <20211117083002.206290-1-chen.zhang@intel.com> (Zhang Chen's
 message of "Wed, 17 Nov 2021 16:30:02 +0800")
References: <20211117083002.206290-1-chen.zhang@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 17 Nov 2021 14:36:19 +0100
Message-ID: <87zgq2ucoc.fsf@secure.mitica>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: qemu-dev <qemu-devel@nongnu.org>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zhang Chen <chen.zhang@intel.com> wrote:
> Optimize COLO primary start path from:
> MIGRATION_STATUS_XXX --> MIGRATION_STATUS_ACTIVE --> MIGRATION_STATUS_COLO --> MIGRATION_STATUS_COMPLETED
> To:
> MIGRATION_STATUS_XXX --> MIGRATION_STATUS_COLO --> MIGRATION_STATUS_COMPLETED
> No need to start primary COLO through "MIGRATION_STATUS_ACTIVE".
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


