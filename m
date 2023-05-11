Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFF66FF229
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 15:09:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px61q-0007xK-JK; Thu, 11 May 2023 09:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1px61o-0007uF-Hj
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:08:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1px61n-0007fR-2K
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:08:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683810493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fNO4U0wCi/2j9HTQFbNegUcHNJQ7cyl/eR+aFl7ob5E=;
 b=ViBt6SVHeOWLb2ah/Jtd1hNffQZ5XE1S8GDMyB7mNoS/XvHS0rVSLNOZwkjdzEXKaPr94Z
 4R6FUvZtrJan7uR4LjcoF6MUQ/t9p2SI2CJJo0BgWvo4SoVeOImXZclnkG8aRyzyLRIckm
 71fxuGr2ru8pu2yR5cSMfPRn0zoqyYw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-jS-9fpUQMFuyVUHD5LHdAA-1; Thu, 11 May 2023 09:08:11 -0400
X-MC-Unique: jS-9fpUQMFuyVUHD5LHdAA-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-3f4e4e5c9acso9874961cf.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 06:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683810491; x=1686402491;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fNO4U0wCi/2j9HTQFbNegUcHNJQ7cyl/eR+aFl7ob5E=;
 b=LIp8a8hWxtZbipN50IHZBrcg/aB4+heIX4IMiQ9Z5TnHpGTghgXpzacWrlxej851Vc
 s1bbh6lL6elHucx+SLZtfRzd7lCgxlUaYOku1JmFoIBh60FdrMizlZ2gTrbB8GfDxvlX
 CkhLdjK4bEG8uRUlFFS//Js+U7Q6n+IJRrSo3HDHYX07MEshwlciIFrbSWSA2/YuRd3p
 1CvbfKGwFQtQKaBFV6A26S/IVG/ot3Nq4HC6+4lEicJnYMuUI2F9FELCsJe4zBTfi8HG
 ByjSh5ffjwX+D0k8vS3tfrlW8YGYNcF8H4crnyetkBCUjHektxtpm4gvyIwg+Xl/ueiU
 u/Kg==
X-Gm-Message-State: AC+VfDzzNAHn3Oc1BetzjbHp1kHZ0XYmTA85v6HoLprElAmmTiIxBDYX
 aOAuGnW9DguA7AOJR826Rcvr7kRaP91RYofxGXcJIGK3yixGEYmcLAVQB1CP04HwVjOholi2e9S
 XMAJGOWahDY326wI=
X-Received: by 2002:a05:622a:120b:b0:3e6:55b2:35e with SMTP id
 y11-20020a05622a120b00b003e655b2035emr30302923qtx.26.1683810491103; 
 Thu, 11 May 2023 06:08:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5aJPceybm3Eg71DvX2NCzRKWjS3ubwsrKxH5FdJVVAFrfnqRltsjiNZXyssiZT6eskMgEC2w==
X-Received: by 2002:a05:622a:120b:b0:3e6:55b2:35e with SMTP id
 y11-20020a05622a120b00b003e655b2035emr30302897qtx.26.1683810490778; 
 Thu, 11 May 2023 06:08:10 -0700 (PDT)
Received: from [10.0.0.6] (ip-78-45-66-209.bb.vodafone.cz. [78.45.66.209])
 by smtp.gmail.com with ESMTPSA id
 l12-20020ac8078c000000b003e9c6a4a381sm2204111qth.54.2023.05.11.06.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 06:08:10 -0700 (PDT)
Message-ID: <074a3e88-63fc-8257-44b1-45bc4904edf9@redhat.com>
Date: Thu, 11 May 2023 15:05:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] ui/gtk: fix passing y0_top parameter to scanout
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20230220175605.43759-1-ernunes@redhat.com>
 <CAMxuvawbD+QcSTMZ18wh+J361udTSaVwpZWAtX1LDtntR9ehrQ@mail.gmail.com>
Content-Language: en-US
From: Erico Nunes <ernunes@redhat.com>
In-Reply-To: <CAMxuvawbD+QcSTMZ18wh+J361udTSaVwpZWAtX1LDtntR9ehrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ernunes@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.124, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello,

On 20/02/2023 18:58, Marc-André Lureau wrote:
> 
> 
> On Mon, Feb 20, 2023 at 9:56 PM Erico Nunes <ernunes@redhat.com
> <mailto:ernunes@redhat.com>> wrote:
> 
>     The dmabuf->y0_top flag is passed to .dpy_gl_scanout_dmabuf(), however
>     in the gtk ui both implementations dropped it when doing the next
>     scanout_texture call.
> 
>     Fixes flipped linux console using vhost-user-gpu with the gtk ui
>     display.
> 
>     Signed-off-by: Erico Nunes <ernunes@redhat.com
>     <mailto:ernunes@redhat.com>>
> 
> 
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com
> <mailto:marcandre.lureau@redhat.com>>

Looks like this patch was never applied, could you look at it again please?

Thanks

Erico


