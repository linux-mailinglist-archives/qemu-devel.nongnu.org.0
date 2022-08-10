Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D40658ED26
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:27:45 +0200 (CEST)
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlkO-0002Ix-El
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oLlK1-0005MD-9g
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:00:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oLlJy-0001Nk-RR
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660136426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RWE82wEt0NLN+Hi6RMpYvSN7w5cj4oCUrLspINGG2Nw=;
 b=AONuaSpa79lc3pQ7GN638EUQ5Tp3MlGHdaGBxRcQN7ZwBTMOW3ChgoN41plbtX4+wJVQMT
 7KLNqlpcACS4+/PbW7VI7JrK/vrGUjMrgGtQQu/TUSINmYncQXphLlgQ0L0xUe7I89F/ok
 FkL2aSMkRkwbiTl+phnTDXvu8lEr9FI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-2egKLZ20OqCyEt3VLcwUfw-1; Wed, 10 Aug 2022 09:00:25 -0400
X-MC-Unique: 2egKLZ20OqCyEt3VLcwUfw-1
Received: by mail-wm1-f70.google.com with SMTP id
 f21-20020a1cc915000000b003a3551598a1so586564wmb.0
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=RWE82wEt0NLN+Hi6RMpYvSN7w5cj4oCUrLspINGG2Nw=;
 b=mZ1tPw78j4Li06V9smRnC0nR7qgKiqP/TDADfjva32gx5fzdcy7CJ1DLezgtMe3F+P
 DKZH4ZfyDunO/20SnncEV4ZdwuUhP7ST277Ll8PLtCk1daeeXCNOvSnGGS3RBVGxk2rQ
 rYJVOSW/xiY3xxyRhW7WSUl5USxJY+aBqg5ZcBYZAunhDuBb+uFAsu8OahBwVQuVydRg
 FcG4azOWlD4ai3aHiA+esfhWqIyaKTZSe8LjUc+A5V90qb7wJg2hswq5ZIibTW0Z95qy
 qRbrm2EEGvEJ1Ccizdc+XLNW7NbV2raRVLS8kxY0uujB5dN55er/AizmYcW6HfJbJBxX
 bq1w==
X-Gm-Message-State: ACgBeo2MARFVpCqQh4GhYOVOBath2ptcTVaWnx4jmHgAuV8y3IrdLEYW
 LBIfFzXD/ECHRnlYgB9veplzb+tnsCfDUaBtcvBzo0IQed9u0gfZ3x8+MmpR2DnP3lZSelKC9AT
 dSSHGl27RuTLb/YM=
X-Received: by 2002:a05:6000:10c3:b0:21f:15aa:1b68 with SMTP id
 b3-20020a05600010c300b0021f15aa1b68mr17640318wrx.693.1660136423900; 
 Wed, 10 Aug 2022 06:00:23 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7aQfCY6hAmxx5RUSwnvS7pI2biqHqScDUbeknlUYNCQUQgEnBqxD4eOjA/t41nMyB9QRcznw==
X-Received: by 2002:a05:6000:10c3:b0:21f:15aa:1b68 with SMTP id
 b3-20020a05600010c300b0021f15aa1b68mr17640297wrx.693.1660136423592; 
 Wed, 10 Aug 2022 06:00:23 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:1600:a3ce:b459:ef57:7b93?
 (p200300cbc7071600a3ceb459ef577b93.dip0.t-ipconnect.de.
 [2003:cb:c707:1600:a3ce:b459:ef57:7b93])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c35cc00b003a319bd3278sm2550982wmq.40.2022.08.10.06.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 06:00:23 -0700 (PDT)
Message-ID: <8abea49d-ba14-e712-1f46-fa35b7801e20@redhat.com>
Date: Wed, 10 Aug 2022 15:00:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/3] util/mmap-alloc: Remove qemu_mempath_getpagesize()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
References: <20220810125720.3849835-1-thuth@redhat.com>
 <20220810125720.3849835-4-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220810125720.3849835-4-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 10.08.22 14:57, Thomas Huth wrote:
> The last user of this function has just been removed, so we can
> drop this function now, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>


Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


