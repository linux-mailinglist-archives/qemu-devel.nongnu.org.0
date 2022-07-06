Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE625681C0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 10:38:24 +0200 (CEST)
Received: from localhost ([::1]:34122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o90YB-0005lM-01
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 04:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o90KP-0005Nc-6p
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o90KL-0000HZ-Kh
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657095844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MQ+5saL54G2RQn5dbKP+GFvlAqpmCm+bJlyqoVmBk/I=;
 b=HONRcyD9aKE1tAh7ER4B4KiufU7UTVAbVMY02ohJDpPToqaW5/t830Ku0MVgcconT/fVhO
 CQtx/KAKbroltw7q2Q8boQNFUU9L2o6unrvt58QSmQc5myBKL963fJKXco9Mws5b1qe+KW
 E0K2HxQqwfF9SPQ8Hh+GZklsji5qXKE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-aP4yU0eCNVeQI7hFaPmZew-1; Wed, 06 Jul 2022 04:24:03 -0400
X-MC-Unique: aP4yU0eCNVeQI7hFaPmZew-1
Received: by mail-qt1-f200.google.com with SMTP id
 fz24-20020a05622a5a9800b0031d5de96774so7248218qtb.7
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MQ+5saL54G2RQn5dbKP+GFvlAqpmCm+bJlyqoVmBk/I=;
 b=wnB7vIlrBpSjKycqP+JlmSj3HUDYoVYciGyOic16p5TExSUq4AmkPcMlWg2JxaR9hs
 4BdERhtlHD6sAcvA1fqw3lGS/kA2eQT2sjI6ZEvEUMHImZpAO2Q60oYLW9PanIKAhubt
 jYzDw4hSN0oJx5X6b85MsSaTHLrSlQ/WbDlR51bo1wIuhonGP5EiEDTMCNUOWjqWtbdy
 PcKHZUmrHlS1csyl+lUn8jVwQEgeiO5hmn9qJ/s5fUStlTZTsgtuXTt9cCsKfpjo7vEm
 48z/n3I6qGfnfB7V74ualnjsJw5z58FYFxkn0K8UqbFDT38SXdsS0SzHk25in2mcnvaX
 f7kA==
X-Gm-Message-State: AJIora8O20MaTQ2fSWK+AOwejoIohAtG7Eo/ggHUagbO8wVXo/YW8oHt
 HkK1XOiBYMPzSzJW3w4EFrJEmZiQ4e72UVGisGO13WLx/kMW1QQUYJXG1dvRsU67f5KywHjybL2
 6kQj7U+ttIuVmlKg=
X-Received: by 2002:ac8:7d4a:0:b0:31d:3616:6a5f with SMTP id
 h10-20020ac87d4a000000b0031d36166a5fmr22420162qtb.105.1657095842896; 
 Wed, 06 Jul 2022 01:24:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u9XFdggOhwOxMTOZwSn/u8UKEXxJZOYEHaUhG5PSpskydXK6bkBO6FuREJek3SCS+4V6jFLw==
X-Received: by 2002:ac8:7d4a:0:b0:31d:3616:6a5f with SMTP id
 h10-20020ac87d4a000000b0031d36166a5fmr22420155qtb.105.1657095842718; 
 Wed, 06 Jul 2022 01:24:02 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a05620a0d8b00b006a32bf19502sm28581077qkl.60.2022.07.06.01.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 01:24:02 -0700 (PDT)
Message-ID: <bc1e575d-08ae-6ea3-e51f-e075812d00f0@redhat.com>
Date: Wed, 6 Jul 2022 10:23:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 06/20] job.h: define functions called without job lock
 held
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-7-eesposit@redhat.com>
 <7e988c67-a15f-cc2a-0370-c665971f19a3@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <7e988c67-a15f-cc2a-0370-c665971f19a3@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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



Am 05/07/2022 um 12:54 schrieb Vladimir Sementsov-Ogievskiy:
> To subject: hmm, the commit don't define any function..
> 
mark functions called without job lock held?


