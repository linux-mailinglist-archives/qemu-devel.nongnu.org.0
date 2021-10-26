Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC2143ADD5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 10:13:55 +0200 (CEST)
Received: from localhost ([::1]:46804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfHaj-0002ye-QZ
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 04:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfHYB-0000G1-QF
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:11:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfHYA-0004bF-Ad
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635235872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=160WqBBkkohnKQHUnS122rXjOSrPHcbvnKSZanqWE/E=;
 b=gIVVUESgJqY1thpXE3dJtu4ImuHQVhP8vzu3DxWu8mrYo0i6l1m0dsPqrEP7MdxY7vhXZm
 N1cWbDE9ZuhzSJJFsTF6bzYy1oX2SK7qIeCZknAx4bvHe0ZAD1/f+5m43Ea2brmS77oxWS
 xY8RTx/TyLDEcD5gRcV52bWu+8FP11M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-Cdxh6jqCM4uSBOy9OjDU2Q-1; Tue, 26 Oct 2021 04:11:11 -0400
X-MC-Unique: Cdxh6jqCM4uSBOy9OjDU2Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 f20-20020a05600c155400b0030db7b29174so623115wmg.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 01:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=160WqBBkkohnKQHUnS122rXjOSrPHcbvnKSZanqWE/E=;
 b=cHqBd2AATRm0GlqvB2LHFULbJWiyWw4OkmdgoFhSVxLCiTwRqQeKMUI1di0eFin8me
 EdkhwUIUO64eqexL8nMOki6GacxxlbbzW3iYws/5A52/zccWOp73xnpn+cYRd9ImAW+1
 WBwuh2TPk3ClMXLhdbrAxGFFMWbAWAiDkHi9QLWR8ZzRvtSRb5AOziGL7J0oYo1e6R9A
 bJY+d3c/IIyOZEy7Ezh0elK2zJ+maT9kqBxlI76XnGU2MrnoQKHu9I1YYN4Vv2ASo3tP
 jtcDf5M9UXbB9PdrQyB1VGEfWxA5yCAL1bdEql7LFqZffsMUF4FfIndH/iNGWoGr+Pui
 MMWQ==
X-Gm-Message-State: AOAM530PWZ066a9OzjaG601Q1HmMa81zktYG5AbaMO1R1g7gQdDYD6L9
 B/sQK652lMRwmJjVUKK2s54nJ4dssx18wcHXqKpChi5BAHksCXdF2Pb0Pyz6gfVRFF1HmxzxybP
 p0T2kZgwmI81H6ew=
X-Received: by 2002:a05:6000:51:: with SMTP id
 k17mr30028374wrx.4.1635235870091; 
 Tue, 26 Oct 2021 01:11:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxZFuQbAAO9y2zTCcbmSq37R6+OGLpCbBwRqz+2FA4RQF3As6eRvTM62qUmLLGXNBNULd29A==
X-Received: by 2002:a05:6000:51:: with SMTP id
 k17mr30028346wrx.4.1635235869978; 
 Tue, 26 Oct 2021 01:11:09 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id t8sm606541wrx.47.2021.10.26.01.11.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 01:11:09 -0700 (PDT)
Message-ID: <3dd42500-37a4-55ee-822c-d04caf5d21da@redhat.com>
Date: Tue, 26 Oct 2021 10:11:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/4] qemu-img: add --shallow option for qemu-img compare
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211021101236.1144824-1-vsementsov@virtuozzo.com>
 <20211021101236.1144824-4-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211021101236.1144824-4-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 nsoffer@redhat.com, nikita.lapshin@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.10.21 12:12, Vladimir Sementsov-Ogievskiy wrote:
> Allow compare only top images of backing chains. This is useful to
> compare images with same backing file or to compare incremental images
> from the chain of incremental backups with "--stat" option.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   docs/tools/qemu-img.rst | 9 ++++++++-
>   qemu-img.c              | 8 ++++++--
>   qemu-img-cmds.hx        | 4 ++--
>   3 files changed, 16 insertions(+), 5 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


