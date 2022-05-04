Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1512151AC99
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 20:19:18 +0200 (CEST)
Received: from localhost ([::1]:38378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmJan-0006D3-7H
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 14:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmJZm-0005VT-T8
 for qemu-devel@nongnu.org; Wed, 04 May 2022 14:18:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmJZj-0000Ix-Vd
 for qemu-devel@nongnu.org; Wed, 04 May 2022 14:18:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651688290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwmBD6BiDcpBBOUvjnSKA0ERy01DsPSooU+X4crNQCk=;
 b=c337Qk7yXMvldz7rdhTePoGPRDKi8gDLy2cvco/Jr6YQe5JTHUr+JmOexGUDobPXOJnJHy
 SwkX8bd3njdore/C9Lc31jFAAOmqdWXSWLtZt48dgF3jf80ROp9/0axdNiPscxuby9K3Az
 W5gu3wXvzjoQau9t1RDxhqzmKbCzc4s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-5r5dw-9lMv2p2Ymjjw2EBw-1; Wed, 04 May 2022 14:18:09 -0400
X-MC-Unique: 5r5dw-9lMv2p2Ymjjw2EBw-1
Received: by mail-wm1-f72.google.com with SMTP id
 v184-20020a1cacc1000000b00393e492a398so3349097wme.5
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 11:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gwmBD6BiDcpBBOUvjnSKA0ERy01DsPSooU+X4crNQCk=;
 b=KZ32gIqGIU/U3NDsaaWD9hQ3wu6RMEcTVLhUSZK/LnKQ+KlG9pXMdVg1ZYoFIxXLFX
 uKow1vi4Vcz2iHvKF19V5OIzrQqAKNp3FjfCTURUrtwS0UUPBqNlNM+xZ7SwiW+2iE68
 8Q/UB3OPUMjkbcncqaksRZaQ/Ob5rB/PWm+IkocdnnEh11TB+OHjCy4506l/eJKR2X9i
 1vzKp6GN6lps5apvlRLdp466bV1WxVKOI3n7sqJ1ZeWCrK5lOPC+UJoJk05UHJ55kZOc
 365ABklJOiw6fSX+4fRg0mgF3jzDW/NlRSpLxPumLILtNBQesC6YPuSfE6an3dwnG1vh
 WVFw==
X-Gm-Message-State: AOAM532KImCE/DnzUH/Z/Lema04qF69aTBgHRzSf8iDytmaXUphzc6Aj
 PJTTil7dZIa+1oUtDMxmlXC7Z+hwm8Jro7DwNd6zsIsPtefZNyB2Q6Gsn1YUkbEZyWReRQybO9J
 2C318kN5lpJwBZMY=
X-Received: by 2002:a05:600c:2113:b0:394:54ff:415c with SMTP id
 u19-20020a05600c211300b0039454ff415cmr567258wml.7.1651688288213; 
 Wed, 04 May 2022 11:18:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlBXIbPLUoQch/EM/CaibiTNgTVV3/F5qXYDq7VuMW7y7hy08Ki5SnPeNLCm5Eth0+OG+C/Q==
X-Received: by 2002:a05:600c:2113:b0:394:54ff:415c with SMTP id
 u19-20020a05600c211300b0039454ff415cmr567229wml.7.1651688288003; 
 Wed, 04 May 2022 11:18:08 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 j28-20020a05600c1c1c00b003942a244f39sm4292220wms.18.2022.05.04.11.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 11:18:07 -0700 (PDT)
Message-ID: <c3a3b032-16c9-a2b9-e096-95a7816c2744@redhat.com>
Date: Wed, 4 May 2022 20:18:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 03/16] tests: make libqmp buildable for win32
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Bandan Das <bsd@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>
References: <20220504173025.650167-1-marcandre.lureau@redhat.com>
 <20220504173025.650167-4-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220504173025.650167-4-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 04/05/2022 19.30, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/qtest/libqmp.h |  2 ++
>   tests/qtest/libqmp.c | 35 +++++++++++++++++++++++++++++------
>   2 files changed, 31 insertions(+), 6 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


