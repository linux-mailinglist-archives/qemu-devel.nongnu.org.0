Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F74443227
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:57:39 +0100 (CET)
Received: from localhost ([::1]:41436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwAM-0007Ep-3p
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhw8z-0006XX-DB
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:56:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhw8x-0005zt-Sl
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635868570;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6Dirj0ZR57umRsgbIvF83fpFIWPyEhwVMigQLxFuAVM=;
 b=XTNbmYrzcvOzEwVsYAhX4u9Q1sIvBpwIVdUBTPH67sRuWEZU/1XnU+4ZKa2AxC1fEao0Vn
 GaqGrp54RwYjJn9kkZPOLiuEzcJRK9aDevN8SxBm83o5PgvoawEIFdVmLJX7XSy/WWkDRn
 I8GRHt2rf+B0dy6+vAkk0+tk9VcQEtc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-7DkWpT3EPeC3BjdX4Mcpow-1; Tue, 02 Nov 2021 11:56:09 -0400
X-MC-Unique: 7DkWpT3EPeC3BjdX4Mcpow-1
Received: by mail-wm1-f72.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so746504wmb.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 08:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=6Dirj0ZR57umRsgbIvF83fpFIWPyEhwVMigQLxFuAVM=;
 b=bEXrx5nN0fxj+/Fei3BXE5uWqFKX87s2JDKEts63Wjk3g3yM3PONKL/l8LPbv9dLCM
 SZ9f8r37Mzb3DtmIImuqnosYh0H07Lsy3KLhEchF6257K719/lelzoWuUhgNvL7KLvn4
 TBdk9vFYKbWE3w/XPcXRtZAX6x+Y/tcB7/EvR+FhBILQp8zXg7u0NcDsfuXQQUnGZOpG
 MHGl41sLpXgxwRnSfesFFPTXf3GfqiY7zDArDzjdP6Mw7jrEXzA5BbA39mnBHUUsWfGG
 2O24gLRVK8Spxkh34DMqBeM5GpOWzruVV3N4iqXCT9fw9tK/E60m0RvT3GH74jgGNrtH
 p3EA==
X-Gm-Message-State: AOAM533TYr0hWGCb0K+woTp9i4zgIdLsNsl/RJX2e7MCJqT34fQL3b4X
 RW33Eqckt6zAdpCb/nYCb01gdGco6tH5WSwTqUzGTVMKg6k0qlz4/u/DUx+WXRK7IU1KEy9dQ8c
 WuQrM1wfzak1BDdM=
X-Received: by 2002:a05:600c:1c1a:: with SMTP id
 j26mr8213097wms.28.1635868568700; 
 Tue, 02 Nov 2021 08:56:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdwvQo+CF3jXCcAbr6WJP1fL82ZHRoEhL2nL7k1cFtKPXbtfSv7UhfmYp5+8buigsRcS64TQ==
X-Received: by 2002:a05:600c:1c1a:: with SMTP id
 j26mr8213059wms.28.1635868568473; 
 Tue, 02 Nov 2021 08:56:08 -0700 (PDT)
Received: from localhost ([188.26.219.212])
 by smtp.gmail.com with ESMTPSA id d8sm17887063wrv.80.2021.11.02.08.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 08:56:08 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH v2 1/7] Some minor optimizations for COLO
In-Reply-To: <1635753425-11756-2-git-send-email-lei.rao@intel.com> (Lei Rao's
 message of "Mon, 1 Nov 2021 15:56:59 +0800")
References: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
 <1635753425-11756-2-git-send-email-lei.rao@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 16:56:06 +0100
Message-ID: <877ddqimax.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
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
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


