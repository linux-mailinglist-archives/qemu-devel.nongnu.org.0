Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7524049E4A9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:32:20 +0100 (CET)
Received: from localhost ([::1]:60660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5ox-0007Yk-ID
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:32:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nD5fl-00086z-Dc
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:22:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nD5fj-0003RL-U9
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:22:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643293367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2e25F4zGNccpLlN5y/i2cveDkl06TmAF0xmLS/hkO2k=;
 b=bg7CTKrG4ISeSmCWv0J/8fClFZNGcfc9ir2kVVXIHepxoTmSe3p4DmmskjsiO3Zxhx6Gkv
 J4Q2zbruxKmip2OqhcvLG0F5TXO95B158rJ1LQtu1PqK+aIAz4twdiicdke1YD/mGo68eO
 lYRaMHuISNirpgay0za6foqS5gJqe0o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-PBI2ba2pNgiQ7-43GZ_-Mw-1; Thu, 27 Jan 2022 09:22:44 -0500
X-MC-Unique: PBI2ba2pNgiQ7-43GZ_-Mw-1
Received: by mail-wm1-f69.google.com with SMTP id
 f188-20020a1c1fc5000000b0034d79edde84so696655wmf.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 06:22:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2e25F4zGNccpLlN5y/i2cveDkl06TmAF0xmLS/hkO2k=;
 b=UhaNdO3xhuJYUu9pr3+VXY+cghL5p5uz+LC5zL/l3L8M5RVkhgK0KHQcP87cqxwAH6
 +ec4rf8kEqI6j5yo2VdIE5vWBlOGaHdwjkxP++Cw0LdpiVYEn0cL/bylasvP3SNNAdeU
 57V7Jxo8D4w9QzeSM8hsieo8ivCGWHYL/HODyK3/HB5h+P56EIep1J2CMHmhlJbXSNCW
 WHy6VOCDhkUBVkPXsXq4oclSIhvwAOE2R6pHCCiHPoZJ76TVALQybOWBKcruI37dDOak
 fOP8LTHc4g3s77AhM8vTp7KbW1cKH43cTyCnnErInB0jIcBu2EcBB/X8314f/ue9ver1
 jkvQ==
X-Gm-Message-State: AOAM5308wSEKUg4jFK61yb0tzrCQN3mVconAKcc8v7OxilTek2Vo+5Uy
 ITZ84fzvLrOUzvBmpuj0oPu2RQlnALmdPSivRmM/6FReQn73xL1cpJvG0S15d5lgNikgp5IvJUW
 YoHVazdBG5loxH8Q=
X-Received: by 2002:adf:fdc8:: with SMTP id i8mr3349225wrs.605.1643293363078; 
 Thu, 27 Jan 2022 06:22:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxopXVty6utLIYvd/+TEsY8KysvoBqWpOTI1WF8Mq2VWdMvmsHu2r2YH/7Y6Ivtf2K5Qeem6A==
X-Received: by 2002:adf:fdc8:: with SMTP id i8mr3349202wrs.605.1643293362855; 
 Thu, 27 Jan 2022 06:22:42 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id t5sm2300646wrw.92.2022.01.27.06.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 06:22:42 -0800 (PST)
Message-ID: <fac91fd8-eb97-410d-479e-4086d3355cdb@redhat.com>
Date: Thu, 27 Jan 2022 15:22:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/4] python/aqmp: Fix negotiation with pre-"oob" QEMU
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220124180626.627718-1-jsnow@redhat.com>
 <20220124180626.627718-2-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220124180626.627718-2-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.01.22 19:06, John Snow wrote:
> QEMU versions prior to the "oob" capability *also* can't accept the
> "enable" keyword argument at all. Fix the handshake process with older
> QEMU versions.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/aqmp/qmp_client.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


