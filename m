Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610525654FB
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 14:18:53 +0200 (CEST)
Received: from localhost ([::1]:47432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8L2S-0004A1-1X
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 08:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8KyT-0001Er-8t
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:14:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8KyQ-0007Vf-Eb
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656936881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkQcXTtIGxBd+EsHSDYLtgh1zOcBjkPakY+mKa/cX3Q=;
 b=Qg1u20opCidgiQc4zp43zDVlnq63HIt0l1cmzr+86lrVvJ/e/D+aprhb1PmbCpR034MiJw
 SlzH3lqm1RYzodL3IE6iJBuk1F0ESdxVZrViQHtrtj0D5iHaQLul0uhHeu3lPhDzoq/jCZ
 wRbNVW8D/uS/xDlWGi4Cv7l8jhiUoTw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-YQ6IVOZuNoOKC2jb6Fh91Q-1; Mon, 04 Jul 2022 08:14:39 -0400
X-MC-Unique: YQ6IVOZuNoOKC2jb6Fh91Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 v16-20020a056402349000b00435a1c942a9so7145356edc.15
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IkQcXTtIGxBd+EsHSDYLtgh1zOcBjkPakY+mKa/cX3Q=;
 b=vsp1ln7LGD4uy/2tmSbAOy3X/5/yIWyA2mXC0tFo083sWYZAS/tcCjHthjNGHQ07Nv
 7bwFVttgjsqnN23skrgmEEuo37qCdz98ziwZ65naYEMCywVyb6dvTk1A28BWlNflIplQ
 F6dMCYHxI0IT2J0vnHFD1Leqa27+5XcPrnJhMJejbu3v/WJliQAZqjbOHzP2j1GHGvCw
 9ohj/o5drD6ocgsgvzY7jm8ndQWz//swRHus5/Gok/0i6T7CfhyYi/1ObzOSuG6QvLLc
 nw6Jlv5gnLu31d998ALFau8RbiHcJ6MjKs+k606nHCt52pGgEKV9pJHPazGu6M0Qt7rA
 d+rA==
X-Gm-Message-State: AJIora+3lrOABtbgrSToMGHt05yu9GlkoTWznAcN8WsWrDnHEqGsGR6D
 b6ctPzgdzpQSnz1A7m53lkVWHEHTQhRCmYlTtudkSPv7neAa83bVJQwI07WBBQz6c1JTJ2qopYy
 pxFKR+1GkbXYEJrA=
X-Received: by 2002:a17:906:29d:b0:6f0:18d8:7be0 with SMTP id
 29-20020a170906029d00b006f018d87be0mr26965371ejf.561.1656936878682; 
 Mon, 04 Jul 2022 05:14:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tbKnhmOWznDAubIsEl5uVOzKUmCQO19M4kzWLuBIIM0UJ/hZ2+uSOG2yeDZnp8/a+b1bLXEQ==
X-Received: by 2002:a17:906:29d:b0:6f0:18d8:7be0 with SMTP id
 29-20020a170906029d00b006f018d87be0mr26965346ejf.561.1656936878478; 
 Mon, 04 Jul 2022 05:14:38 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 bl24-20020a170906c25800b00704757b1debsm13952626ejb.9.2022.07.04.05.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 05:14:38 -0700 (PDT)
Message-ID: <13a091b2-b2b3-0389-9b5c-41adc0fe1f93@redhat.com>
Date: Mon, 4 Jul 2022 14:14:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 08/10] block: Add bdrv_co_pwrite_sync()
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy
 <v.sementsov-og@mail.ru>, Stefan Weil <sw@weilnetz.de>
References: <20220609152744.3891847-1-afaria@redhat.com>
 <20220609152744.3891847-9-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220609152744.3891847-9-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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

On 09.06.22 17:27, Alberto Faria wrote:
> Also convert bdrv_pwrite_sync() to being implemented using
> generated_co_wrapper.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/io.c               | 9 +++++----
>   include/block/block-io.h | 8 ++++++--
>   2 files changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


