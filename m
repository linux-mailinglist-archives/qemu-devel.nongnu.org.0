Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF5C415C21
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:43:17 +0200 (CEST)
Received: from localhost ([::1]:45414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTMCC-0007pL-Cb
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mTM2P-0000YZ-QB
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:33:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mTM2M-0007Oi-EX
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632393185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Z4UdSyME9LH9r3auup6vs/z+5W883K3TIZGjEBW5gA=;
 b=FZk+cRRelwRUkGmd02i5EWk/TOUc8XZs9UDbeZkPlD6bbQ2jSz/m5QUI7V7D6CAaCzOIpc
 KZLN4mLFr998o7NWeCEOPov4S+qJDSuxnleMkZG/mOQimsU7F1hTCqfxQ/qq5sgjVv/McS
 T5eYAmZR8+Erh/SVq3/VzGoAORyw15Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-9D6x_JjSPW2FDZx9f1immQ-1; Thu, 23 Sep 2021 06:33:04 -0400
X-MC-Unique: 9D6x_JjSPW2FDZx9f1immQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 h5-20020a5d6885000000b0015e21e37523so4745154wru.10
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 03:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3Z4UdSyME9LH9r3auup6vs/z+5W883K3TIZGjEBW5gA=;
 b=oz8q3kBo1dtvTBjma2rdgdKICLfeDGU5azY26BfrA4BFVKGD5rlokIgcS9wlm9mcUA
 tX8HG/x1PanY4aeaga85/jE9U+Yw78bz9YvQLhEpvRcq9F86h+b7cAXNHqyNmJleaE46
 2HFv0d8sUKiJ5K0HAi+QPSDSiOIdhFRWAmsnlUBc/uzls8KMd/2uZXk0RU5/fdwIAxtX
 6lta8Ut1EqDCuu1zkjQDN8U/RB/+2z/vlNMpWSvV/asgyBTVX9p3YJ7Di0P72RPg4vei
 8ehYMV0DTKkLnGqQb4E0kzajE6gtbRO9tUNrTUq7ETpnoMNc27MQvPh3P3+kO3sW7j6O
 HqSQ==
X-Gm-Message-State: AOAM531ZjNASEpbbye06Ta1AoJ0hs4AeVQUMn3Ej/Ljhv0U1ZearzILZ
 JAkk++ZLhV7zE2B4BM7pBDBgOgxvsHVSrqY93gAWzSXUmYc9LaUPqYVt25oWMB1SXQ0VS/9p4/F
 pfHQ7NYrKHj3E0sY=
X-Received: by 2002:a7b:cb8c:: with SMTP id m12mr3698556wmi.44.1632393182846; 
 Thu, 23 Sep 2021 03:33:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb0DapmNsX/N/HO1vJVSZvV71mh9J9qt13QiAR5J2EqYdzD+GFRrY9uzEENFr47rpLrrZwyg==
X-Received: by 2002:a7b:cb8c:: with SMTP id m12mr3698546wmi.44.1632393182662; 
 Thu, 23 Sep 2021 03:33:02 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z17sm4541429wml.24.2021.09.23.03.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 03:33:02 -0700 (PDT)
Message-ID: <dabd32b4-f7ce-a5e2-cde6-1cc21a64efa9@redhat.com>
Date: Thu, 23 Sep 2021 12:33:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/6] iotests/linters: check mypy files all at once
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210923001625.3996451-1-jsnow@redhat.com>
 <20210923001625.3996451-4-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210923001625.3996451-4-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/21 02:16, John Snow wrote:
> We can circumvent the '__main__' redefinition problem by passing
> --scripts-are-modules. Take mypy out of the loop per-filename and check
> everything in one go: it's quite a bit faster.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   tests/qemu-iotests/297 | 44 +++++++++++++++++++-----------------------
>   1 file changed, 20 insertions(+), 24 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


