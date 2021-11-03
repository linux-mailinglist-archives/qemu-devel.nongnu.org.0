Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D74F443EB5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:54:44 +0100 (CET)
Received: from localhost ([::1]:46650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miC2d-0007mY-DJ
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBvc-0001eF-2y
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:47:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBum-0003nZ-6s
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635929195;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=38Y5ONsaxhcTffTi9m14wYxUriL3XNTe+vTJosE5oVg=;
 b=eGoNGX0zexFnjcUjXkPjBPP8jKbRLSjfWMPLz5aiyuH2iP1lKE89cmZsCUO6W2UY4HGU3K
 EeaDx4xFx0nXl7w761ZuOHy3omZhu2QVinW2vQMRAy4fMZZmHKoxCF3gZeD1OSSGLllgDw
 mhigp0Xe0I4H2d3spjhP8MpZcVUxBhc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-bHHw1K29O8WpMsWRXyhjFA-1; Wed, 03 Nov 2021 04:46:31 -0400
X-MC-Unique: bHHw1K29O8WpMsWRXyhjFA-1
Received: by mail-wm1-f72.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so744738wmb.3
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 01:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=38Y5ONsaxhcTffTi9m14wYxUriL3XNTe+vTJosE5oVg=;
 b=RH3T3i0wiUxjSNKWP5QNxKVBoR9B1nuwEKlrymWNvVoflm5R9+CaMbT7st2kkyu3zk
 aGSWUTwvPEPi+tKNQQj6/LD2ze1SKGZasF7z4S/jMPLrC2A0HZW+mhyaTV4e3w+RaOFB
 PXTvZNiHdUQCw35nxX4Yhv8j1QEjBnzQ8dhf3hkcfGaxKoPgGAX07/sKfhnhDGNPu0uh
 Y6q4L2mnC44cdeHh2V871A5/8MRXCa48Hd5vKFh4exPWd7Eqeqq5zzX6gNtoDFFGwqUl
 3BajPd81yNtrTuQorUaRh0LN5203IlmKPnp3Ks523oZIX7eDrB+i3deMrQoeZDVZd+b4
 HZkg==
X-Gm-Message-State: AOAM533aTtdnlIQITHn1gC/1I8XufRgoUcGDGa01Y+h52acWH5P8fdO6
 udH8OS5hohpD8fMo3Yk0+GynykgHeLCu1kMX1r0Wijas3yBqjQ/NleQm66fkZCg6EHSOg1H1miv
 0ZL7H3sdS+q6sFtQ=
X-Received: by 2002:adf:e482:: with SMTP id i2mr25774957wrm.284.1635929190609; 
 Wed, 03 Nov 2021 01:46:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsNSsXVQjEkbJ43takosW0PbHeLTokGCvRLYlU3E3CoB+/BKIne6H/pJrFZ7YP9eUZH7F/wg==
X-Received: by 2002:adf:e482:: with SMTP id i2mr25774942wrm.284.1635929190488; 
 Wed, 03 Nov 2021 01:46:30 -0700 (PDT)
Received: from localhost ([188.26.219.212])
 by smtp.gmail.com with ESMTPSA id 10sm5616035wme.27.2021.11.03.01.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:46:30 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH v3] Optimized the function of fill_connection_key.
In-Reply-To: <1635906072-10334-1-git-send-email-lei.rao@intel.com> (Lei Rao's
 message of "Wed, 3 Nov 2021 10:21:12 +0800")
References: <1635906072-10334-1-git-send-email-lei.rao@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 03 Nov 2021 09:46:29 +0100
Message-ID: <87o871fwyi.fsf@secure.mitica>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: lukasstraub2@web.de, zhang.zhanghailiang@huawei.com,
 lizhijian@cn.fujitsu.com, jasowang@redhat.com, dgilbert@redhat.com,
 qemu-devel@nongnu.org, chen.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Rao, Lei" <lei.rao@intel.com> wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
>
> Remove some unnecessary code to improve the performance of
> the filter-rewriter module.
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> Reviewed-by: Zhang Chen <chen.zhang@intel.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>

Queued, thanks.


