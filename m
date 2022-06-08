Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676C5542E97
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 13:01:35 +0200 (CEST)
Received: from localhost ([::1]:50490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nytRN-0001Gl-V1
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 07:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nytNx-0000LQ-BI
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 06:58:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nytNv-0003wp-7E
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 06:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654685878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5GI598vWzSc77J0j4ICSVz0BW6BIL6n0bqxe3MDG2R8=;
 b=eM7iJz0N5qPmvK/jEKKozsISIu/cpUKw9Xa98EDp7fBAskzQAgD3r1gaFbg72PiJpiJPhE
 1Uoe6m6YnNt1Hy6RKActxFzDkgTtEiAGdHrCIL993/6pkDOnUhbuOmCk01WUOeyHm3KhvR
 FwV5wp2mW9YjBM21IdJS4PPXd1oP9VI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-zmHEQ0BSOamDIXQLXBCBQQ-1; Wed, 08 Jun 2022 06:57:57 -0400
X-MC-Unique: zmHEQ0BSOamDIXQLXBCBQQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 m6-20020aa7c2c6000000b0042dc237d9e7so14663844edp.15
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 03:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5GI598vWzSc77J0j4ICSVz0BW6BIL6n0bqxe3MDG2R8=;
 b=RdAGAUbbIMuziZGYrve+ve+knTNjy9fMFzXoIZd6k/jz+/5ko+Z2xi7P9Jw+UpaVJt
 K4+EkqT8GB0o6a3oao70HcWQRIz5cXgJT01FzuUaXNc03Yf5DYdKbbIk86l+QnFlq0ID
 on0+ARpZ6Bsr4fv1h2aWocqRuCxY8RpXtwgS6C9fDt8+ie3ZTZJHu4QoZ7T4ngLDLnyl
 Xx4QqRKM4Blivbc3FvV+fArIBJjRCHsJXGTRMHu1cwZ6Blum2QEgAx4vQU2ZU40gVfqo
 yMn846Uv480FUhMGG6GxTfvrFLwtAQg/Owq3opnaHOopE27XQUzUOUCGuq7hohr2APye
 xy8Q==
X-Gm-Message-State: AOAM530QSKqojWiyP6vOAsVDwzTt+2t0kvgy30Sx1jPmoDSVT4A8n2i5
 vdORbwMSC6lg/K8oonqeYtlp0rNHJkqO4N6fOwCGseiV2DZF/F85IdSHcNlmfePuM+OlE6tkgsc
 9T4HFl+wsKbb3p+g=
X-Received: by 2002:a17:907:1310:b0:709:bfa:4f3e with SMTP id
 vj16-20020a170907131000b007090bfa4f3emr24099553ejb.589.1654685875976; 
 Wed, 08 Jun 2022 03:57:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3UZUiogyAFsMIiYIJ/0jB9GrQ7Xj/jZwJanrFSJvuaM2POzs9rmaN8p2GkosF4HcCYTJEAQ==
X-Received: by 2002:a17:907:1310:b0:709:bfa:4f3e with SMTP id
 vj16-20020a170907131000b007090bfa4f3emr24099537ejb.589.1654685875728; 
 Wed, 08 Jun 2022 03:57:55 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 p3-20020aa7c4c3000000b0042db87b5ff4sm12188625edr.88.2022.06.08.03.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 03:57:55 -0700 (PDT)
Message-ID: <1ffd748a-c58f-3030-39f1-f068bf45cb6a@redhat.com>
Date: Wed, 8 Jun 2022 12:57:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 18/45] block: bdrv_refresh_perms(): allow external tran
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-19-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-19-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
> Allow passing external Transaction pointer, stop creating extra
> Transaction objects.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block.c | 31 ++++++++++++++++++++-----------
>   1 file changed, 20 insertions(+), 11 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


