Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2770E3C197E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:59:31 +0200 (CEST)
Received: from localhost ([::1]:58282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZFC-0005me-6A
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1Z4m-0000mY-I7
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:48:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1Z4j-0006hu-2Y
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:48:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625770120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qHiH1D58kyFdRYkg3QJZ8VZS+Eq1YphmR+xgrZHWLIQ=;
 b=ftMouRfHQLcYJe5EJebPf5CCagm1J429wLoE9KXB19k/gpbiWGG1d2L989RAvjrGkO7itu
 /9j2BKRPzzHbf1cbb+HMdg8F2P5A3EhkVLn+7HElmE/mEs4vx33wB2r75Oc7Er5giqTq4Z
 XumXVnCDfg8WsNCf2wGyJhYceg8Rrog=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-Ih5V1_KeP1GfM0Jp4vhUkQ-1; Thu, 08 Jul 2021 14:48:39 -0400
X-MC-Unique: Ih5V1_KeP1GfM0Jp4vhUkQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 ke6-20020a0562143006b029028b8546bb01so4697000qvb.20
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 11:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qHiH1D58kyFdRYkg3QJZ8VZS+Eq1YphmR+xgrZHWLIQ=;
 b=giwNz/Ujcg/wrGn+Ud0OjzoM8DJKVMmHwh+NOEfcXr9J4qYzZBnZcVxLCW202tdBrJ
 f3bao6qzvPDH9Ku/zAzBz404NRw6o/A30QuBwRfRyKbSONZb7wsVVkhOE7C/4DXUl776
 NaD8dK3blmgdEypy2qJzR8lnXY1zIs33JEo6gyYlVoyvunNjNJdesS90upvO3JiCCf2Z
 ktHAkgu0GQBHvqLJ0tXTOWXa0XVydEQAZ4Z+9BZZjumrbdJxag50iYTgztHyPO5ZvVBM
 sLaulQXNV1h/VMfl/n4ABFpjgAKEhQRlUK2BBSCEfrk4cQT26fcNBIi+zAPkA8kTuaRd
 S6zg==
X-Gm-Message-State: AOAM53003cbWcergJ2V63Reis77UM9cDMA3qhHpjwMr2b9KB/G4pyMf3
 T3xFIkmHSTXgFuVwmlfGj4RzDi1S7Xwl3YL6ZS0z0P/26gWx0XlKZYAT2By8AzeodPtfED98dx5
 He8dxWw79n2yt1Gg=
X-Received: by 2002:a0c:9ac7:: with SMTP id k7mr31864779qvf.49.1625770118625; 
 Thu, 08 Jul 2021 11:48:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxShvFqAFb6rckJQg/X6HBn0m5tS1so+r4aZVl+w1w9vMUinbzOnEV5YcfMRfRbMs1JpvRykA==
X-Received: by 2002:a0c:9ac7:: with SMTP id k7mr31864764qvf.49.1625770118476; 
 Thu, 08 Jul 2021 11:48:38 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id w2sm1366602qkm.65.2021.07.08.11.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 11:48:37 -0700 (PDT)
Date: Thu, 8 Jul 2021 14:48:37 -0400
From: Peter Xu <peterx@redhat.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH] remote/memory: Replace share parameter with ram_flags
Message-ID: <YOdIhX9l4IvOiYjp@t490s>
References: <20210708071216.87862-1-yang.zhong@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210708071216.87862-1-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 03:12:16PM +0800, Yang Zhong wrote:
> The commit(d5015b80) missed the ram_flags to memory_region_init_ram_from_fd()
> in the hw/remote/memory.c.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


