Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F3D4F331E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 15:11:25 +0200 (CEST)
Received: from localhost ([::1]:60160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbixw-0004hm-4G
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 09:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nbiw4-0003eg-26
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:09:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nbiw1-000639-Pc
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:09:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649164164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p+QjAoe9NaO4iB3EVcfvIoB9CgbkW9CYl0IHrgXFBzA=;
 b=E5uhXW/VHYjS1JWEKrIGHWtZenz42JTlqjJKLxg133S5HCvMmCS0YIu6d+9AJviQGNR6Pt
 2coRg+iTmdo8WDXoIcPD5nVfqXoRafSfeaZB5f3rbND8t8RNk6omdTIhE6KIwgVT3NDwDs
 XaLVe4jyFCUyRdG1yRC9zFsilXLnCDY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-Irapsa0FO2-3cHQDs_bBYg-1; Tue, 05 Apr 2022 09:09:23 -0400
X-MC-Unique: Irapsa0FO2-3cHQDs_bBYg-1
Received: by mail-wm1-f69.google.com with SMTP id
 a16-20020a05600c349000b0038e6392a346so1233563wmq.4
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 06:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p+QjAoe9NaO4iB3EVcfvIoB9CgbkW9CYl0IHrgXFBzA=;
 b=KPU9nWhLZEFrds11RIn9J/N5Yy4Cp4sox1TzuESIXT/wsb7RJ+5yx97kwcB2IHNViW
 pKswGIWG+Sf+/+APvayp3HbLa0L/4a9DiFZlyWq3eZ5JvcGxUlnLmz041vYOPfUYdDcG
 AqknR4BpvOs2Q8oU+S0uAkX2u5DfVGgOIS/Pnt+aDwmJ7b1N4p/Surz3yUoGZrHHyKja
 BcwKe4VM4JEaCw+eqnQdEp1I4rD+73VMv12/AHG1kmJcTEJGDosV/00TJpFDEpyoakfr
 /pkvjX6xVq5qufqO2F2m6oQIQuFr+a9bSBPmaR2xRQlALOB6dNQhef0WHQ3FU39aTFlo
 JwvQ==
X-Gm-Message-State: AOAM532zhwOls6GNL3k7ZOyKFcN9L0UGYcAYlbNefdCRltGcC9tNEQKU
 d84wLkriT5/kBSNxoDuiNmPkjSZtSTGMvY0jbgdgjSrpvhLT8Y5BDxfxcBsNO/VBAjqnNz3l22g
 jZl42KESmgWtiXwE=
X-Received: by 2002:adf:e301:0:b0:205:db69:6dba with SMTP id
 b1-20020adfe301000000b00205db696dbamr2777153wrj.605.1649164162305; 
 Tue, 05 Apr 2022 06:09:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL/NwQhHxYEyMQfso6FH3Uth28VysN7AARDz4dzXZ3bymmX7OaY3UN7mp55AV3Yl1hjemUCQ==
X-Received: by 2002:adf:e301:0:b0:205:db69:6dba with SMTP id
 b1-20020adfe301000000b00205db696dbamr2777122wrj.605.1649164161960; 
 Tue, 05 Apr 2022 06:09:21 -0700 (PDT)
Received: from [192.168.149.120]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm2093379wma.21.2022.04.05.06.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 06:09:21 -0700 (PDT)
Message-ID: <87fb6a17-c1e8-cb50-5f0f-3979b8cc5ca6@redhat.com>
Date: Tue, 5 Apr 2022 15:09:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] block/stream: Drain subtree around graph change
To: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
References: <20220324125756.9950-1-hreitz@redhat.com>
 <YkwWbAoYmkVuHlQA@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YkwWbAoYmkVuHlQA@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 05/04/2022 um 12:14 schrieb Kevin Wolf:
> I think all of this is really relevant for Emanuele's work, which
> involves adding AIO_WAIT_WHILE() deep inside graph update functions. I
> fully expect that we would see very similar problems, and just stacking
> drain sections over drain sections that might happen to usually fix
> things, but aren't guaranteed to, doesn't look like a good solution.

Yes, I think at this point we all agreed to drop subtree_drain as
replacement for AioContext.

The alternative is what Paolo proposed in the other thread " Removal of
AioContext lock, bs->parents and ->children: proof of concept"
I am not sure which thread you replied first :)

I think that proposal is not far from your idea, and it avoids to
introduce or even use drains at all.
Not sure why you called it a "step backwards even from AioContext locks".

Emanuele


