Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D21408A89
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 13:52:17 +0200 (CEST)
Received: from localhost ([::1]:40144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkVU-0001go-P0
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 07:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPkQF-00068Z-5b
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:46:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPkQA-00069e-MV
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631533604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pcJwNQ60RT9EYND6cn/HcUcc90mDzl4XnuJOndlPH0M=;
 b=fagonKlu6DC9IoldzFBhHEwC4fEsK/i2EHJqNBzAQLSehRvL7F1J2Tze0OCzhjM1YJSuBb
 4gtnhh7aysHqVWe3r9fdn+3i+fIgBIYPc2varvolAdS8S4sC6ORxr+YOc5igXdmeyfoL+u
 XGvrTLg/Y/Ijbb51ZGpmHO4gOPSvI5w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-zU67vADUOmmbQRsDfH7VNg-1; Mon, 13 Sep 2021 07:46:43 -0400
X-MC-Unique: zU67vADUOmmbQRsDfH7VNg-1
Received: by mail-wm1-f69.google.com with SMTP id
 y12-20020a1c7d0c000000b003077f64d75fso597088wmc.7
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pcJwNQ60RT9EYND6cn/HcUcc90mDzl4XnuJOndlPH0M=;
 b=0YLwaaG47+DQp5UnLMqLAP/+28x1wCU7Qd71Uhl3HTaB2wsCDlID2P7GEsvQSbViV8
 QioQE+v7t0BtSge3lzGmkOI7BEs5S9Y7tUZYHW7YOT0wr5xR/gfxo+sln567gLUXwPre
 vGbCQyd9fx8WVmsTllzJsihuusG6B5Gp9IXZQpLRFN8f7Ld1QISNJyaNtZ1aGoM6AFOI
 LfZm0FganxKYffGiPz+Ekk7dGMNr1AxejdMlRnWiWjgWb9n7oPly9FU5/jweTN93Uont
 Y/lqyA5Uv9rNeBjYP8scr3jjcbzIAcrAPhiBoNXFFd2cRKFs7pYdlfgFztqrVUHc3Hs5
 5/iw==
X-Gm-Message-State: AOAM530C/iYziYSbydW74r6sQQy/FycPwT68MFvWU+sXpgYX6Cn87i14
 R3OTH4P7zkFYktTDT7tmdgRnK3yLL4Qfzi3sY33OXwRJ2M89xBIrCkPTr8m3x0WaeGqXQn1JKg2
 MqU2v75Lm5Sin8Ss=
X-Received: by 2002:a5d:608e:: with SMTP id w14mr12107843wrt.18.1631533602464; 
 Mon, 13 Sep 2021 04:46:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxpmHUswUzZZIR3Uu0cPjyeAC6wQ8t97dlb7P0XZbAdRIa465jNfTn6xD+1bZG2K79Ktfgew==
X-Received: by 2002:a5d:608e:: with SMTP id w14mr12107833wrt.18.1631533602338; 
 Mon, 13 Sep 2021 04:46:42 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id a6sm6605145wmb.7.2021.09.13.04.46.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 04:46:42 -0700 (PDT)
Subject: Re: [PATCH v2 07/17] iotests.py: filter out successful output of
 qemu-img crate
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
 <20210720113832.586428-8-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <6202691d-c0e6-069f-5e7a-2c984de4ba98@redhat.com>
Date: Mon, 13 Sep 2021 13:46:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720113832.586428-8-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Subject: s/crate/create/

On 20.07.21 13:38, Vladimir Sementsov-Ogievskiy wrote:
> The only "feature" of this "Formatting ..." line is that we have to
> update it every time we add new option. Let's drop it.

Sounds good to me.

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/255.out    |  4 ----
>   tests/qemu-iotests/274.out    | 29 -----------------------------
>   tests/qemu-iotests/280.out    |  1 -
>   tests/qemu-iotests/iotests.py | 10 ++++++++--
>   4 files changed, 8 insertions(+), 36 deletions(-)

Grepping like so:

$ (for f in $(ag -l 'Formatting' | grep '\.out' | sed -e 's/\.out.*//'); 
do \
     echo -n "$f "; \
     head -n 1 $f; \
done) | grep python

yields also 149, 237, and 296 as tests whose reference output needs to 
be adjusted.

(Although 149 just fails for me altogether, seemingly for the same 
reason that makes 210 fail.)

Hanna


