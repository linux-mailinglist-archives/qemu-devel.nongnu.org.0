Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488D4535DEA
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 12:08:26 +0200 (CEST)
Received: from localhost ([::1]:50718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuWtM-00051n-Ro
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 06:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nuWoI-0002lS-MR; Fri, 27 May 2022 06:03:11 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:51914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nuWoA-0000kg-Dl; Fri, 27 May 2022 06:03:08 -0400
Received: from sas1-9c28cd37d27b.qloud-c.yandex.net
 (sas1-9c28cd37d27b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:309b:0:640:9c28:cd37])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 16CD72E119E;
 Fri, 27 May 2022 13:02:45 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas1-9c28cd37d27b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 EKAftqca0t-2hJGqLpo; Fri, 27 May 2022 13:02:45 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1653645765; bh=O9KnMLUe6JwmO3vcsngwzbqAFyeISP+bNPziRLmWiJo=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=Io4jxfa3LJNbFPB3n4/QoteuHKkp2Ox4v7KyMNpuUuSAOAIiHIWkqNkHre3NYbNC6
 5BSARJSgXToXyY1H0rgW3iahxsKRhTdDyZf2m02/qlWG6q9Y82OcjjfauKnVyKuWOP
 IoKzpvN63gKX4aNdFdtkLP4TPt0ENFAsFE8T3zoE=
Authentication-Results: sas1-9c28cd37d27b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:b6b0::1:22] (unknown
 [2a02:6b8:b081:b6b0::1:22])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 JviZwoZ57m-2hJCcZEF; Fri, 27 May 2022 13:02:43 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <06a1508b-abf9-6345-8681-67c76c7bf0d0@yandex-team.ru>
Date: Fri, 27 May 2022 13:02:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 01/10] block: Add a 'flags' param to
 bdrv_{pread,pwrite,pwrite_sync}()
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Fam Zheng <fam@euphon.net>, Ari Sundholm <ari@tuxera.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-2-afaria@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220519144841.784780-2-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/22 17:48, Alberto Faria wrote:
> For consistency with other I/O functions, and in preparation to
> implement them using generated_co_wrapper.
> 
> Callers were updated using this Coccinelle script:
> 
>      @@ expression child, offset, buf, bytes; @@
>      - bdrv_pread(child, offset, buf, bytes)
>      + bdrv_pread(child, offset, buf, bytes, 0)
> 
>      @@ expression child, offset, buf, bytes; @@
>      - bdrv_pwrite(child, offset, buf, bytes)
>      + bdrv_pwrite(child, offset, buf, bytes, 0)
> 
>      @@ expression child, offset, buf, bytes; @@
>      - bdrv_pwrite_sync(child, offset, buf, bytes)
>      + bdrv_pwrite_sync(child, offset, buf, bytes, 0)
> 
> Resulting overly-long lines were then fixed by hand.
> 
> Signed-off-by: Alberto Faria<afaria@redhat.com>
> Reviewed-by: Paolo Bonzini<pbonzini@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir

