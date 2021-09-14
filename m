Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8F740AA4A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 11:11:21 +0200 (CEST)
Received: from localhost ([::1]:52500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ4TH-0000bn-OG
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 05:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ4Rd-0008AU-Ix
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:09:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ4RZ-0005Ht-Lm
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631610573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gpUiXCrJxmE46QCKZPmByvQi+gC9v8CyAcw7yNlljDU=;
 b=QBnkDntumt5kU5pb9hjiOFDN1KDC84hyGEoqAMCEfcX2fOY0fJR/su8eQ/UKpwxrFewTAx
 oqtLqfAecRbduRs3iDKfHj5E8jaWKc+zVC7qipjoKYjVYQ+tS3EG0gxBztXBC8Huhi38YT
 0KLev5b9RrV0A6WcikW2KInIMcZN2ck=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-izZ8yvDpMb2vfeHX7Z3hjQ-1; Tue, 14 Sep 2021 05:09:32 -0400
X-MC-Unique: izZ8yvDpMb2vfeHX7Z3hjQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so457321wml.5
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 02:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gpUiXCrJxmE46QCKZPmByvQi+gC9v8CyAcw7yNlljDU=;
 b=ZGcYHhlifPPVMUsdLCOutMqvyx62rNKX855n6TmOHJSf/hjszdSNFFgbu04PLhIQWX
 YIq6+s4eg6cjm0adEtBbB6VkbafwtfwwuFaXuWzaXYbcp/ei9DnSKwlqMX348wHUFesy
 ySU6YKArP6Z56RzBCNCkvfX+uqSPoAJqfdT+feGPRUEXAjbEcEvmRJbySmCMrkCdPOEe
 GKAZg7Qb6LFyfCGKGKe+LvcK5m1EKnzv1gSBmGvqr275WRkqKonV6QpHbwClfFrmgk41
 F+jvOV0n36tw3XxpMxbgX53iGDNEwQ8+1fuCFtXMSsEwwzUz0FveJGfg5G9avlEpAet9
 cjnA==
X-Gm-Message-State: AOAM531Ioa//vIWX5ZSps+fk1VGuW51QqwMg2GG+hoHv6Vaql8m1CkgJ
 /IroTaVyvla9wdGIbdyzwU5kNaratgKhMfbiraAc26oS76QCUi8D9d5p6JBSqfWSs2kfrkQLLUt
 YTWBQ+FFLquMdQ6o=
X-Received: by 2002:a7b:c35a:: with SMTP id l26mr1010616wmj.124.1631610570944; 
 Tue, 14 Sep 2021 02:09:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx610pQZvNZLzBg7CywIdP2rYckVU5cRxOlkInE3AMNd/HqQdup6BbmTb2CXZK+41Zs/u2NYQ==
X-Received: by 2002:a7b:c35a:: with SMTP id l26mr1010591wmj.124.1631610570719; 
 Tue, 14 Sep 2021 02:09:30 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id m4sm11523702wrx.81.2021.09.14.02.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 02:09:30 -0700 (PDT)
Subject: Re: [PATCH v3 08/10] qcow2-refcount: improve style of
 check_refcounts_l1()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
 <20210524142031.142109-9-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <588af1b5-b7b7-3436-b679-6c7bb430dde5@redhat.com>
Date: Tue, 14 Sep 2021 11:09:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210524142031.142109-9-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, ktkhai@virtuozzo.com, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.05.21 16:20, Vladimir Sementsov-Ogievskiy wrote:
>   - use g_autofree for l1_table
>   - better name for size in bytes variable
>   - reduce code blocks nesting
>   - whitespaces, braces, newlines
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/qcow2-refcount.c | 98 +++++++++++++++++++++---------------------
>   1 file changed, 50 insertions(+), 48 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


