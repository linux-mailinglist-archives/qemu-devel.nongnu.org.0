Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEC940F513
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 11:45:03 +0200 (CEST)
Received: from localhost ([::1]:33598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRAQX-0001S7-Md
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 05:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRAPP-0000dQ-0K
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 05:43:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRAPM-0007tv-EN
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 05:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631871826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pMG6BvdsI94ASYIychChwyQH5ZG2MYzPRo4cgvtR2AQ=;
 b=Z1B4u/HbHQsJEBjnj3H+DyTQnsfD0FL0RMoaHT+MXbljcohSmkNHuGyaUsb+wrIEbEu4zd
 +SGiKgw9PyRhs+V/7BnHIcfoR5/Ze6WWh610gLTB/0k3JqiIDJ7AuXLxI62TzOpDXrlbLA
 zLsN7OQ/sWtPjswjsJZtFeFIKVs7Hkc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-9TzeMNtVODuExveOKPlDPA-1; Fri, 17 Sep 2021 05:43:45 -0400
X-MC-Unique: 9TzeMNtVODuExveOKPlDPA-1
Received: by mail-wr1-f69.google.com with SMTP id
 v15-20020adff68f000000b0015df51efa18so3502989wrp.16
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 02:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pMG6BvdsI94ASYIychChwyQH5ZG2MYzPRo4cgvtR2AQ=;
 b=jfT9XofWxLajzsJsj1V/PddLVX/i+FUPHGJE7auVTvM1n6N2tzWTglih1jz59f0NMv
 TYECogeQoMoE8MXDDjiR00rHx6iX20AVW7vvwpTNrbZaALvyYxLYCeMpuev/28imB9pW
 7mhJNqDAx2GUENlAVRBlyAsdyHQ1CKLTSE8T7AAVjhRMJXStXwe/IAMFBzof/FWQ4vbz
 cB52VTtV+pRyUleeXnMYH/k+PsosBsa++y3FI0glckpPRnIOUjhqJXSrvbQn9DjED/dg
 c7VQBY0d3AoZkQjQsABJMxQzJi/MxeRn7csjok/vcTViEMTA93Iamr5y2MCwNyDlO24a
 qiLw==
X-Gm-Message-State: AOAM533kSsNGuPO8x2FKNrwUv4OMEDQGmUhlUclF2FwIPnYD3pIIn16U
 8uQNLk+wDFrwuW92xyE9jM/obCQohkiO1FnIgWtwbzBaPBGiVHpzJn6s3Q9bR2g5wpx+SsTy4u6
 QVBbjkkJxF8tb3ZQ=
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr11143140wrn.111.1631871824576; 
 Fri, 17 Sep 2021 02:43:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhTWndQhoz3e47iQP5qZHeeJ06Gviri1d+gGoi0S+vy1wC8YBknbppCIw03dCrwVTXjPbwSw==
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr11143121wrn.111.1631871824396; 
 Fri, 17 Sep 2021 02:43:44 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id h8sm9778568wmb.35.2021.09.17.02.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 02:43:44 -0700 (PDT)
Subject: Re: [PATCH v3 07/16] iotests/297: Don't rely on distro-specific
 linter binaries
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-8-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <374eff9f-0e9e-a2da-19ab-1c39a63191b0@redhat.com>
Date: Fri, 17 Sep 2021 11:43:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916040955.628560-8-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.09.21 06:09, John Snow wrote:
> 'pylint-3' is another Fedora-ism. Use "python3 -m pylint" or "python3 -m
> mypy" to access these scripts instead. This style of invocation will
> prefer the "correct" tool when run in a virtual environment.
>
> Note that we still check for "pylint-3" before the test begins -- this
> check is now "overly strict", but shouldn't cause anything that was
> already running correctly to start failing.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/qemu-iotests/297 | 45 ++++++++++++++++++++++++------------------
>   1 file changed, 26 insertions(+), 19 deletions(-)

I know it sounds silly, but to be honest I have no idea if replacing 
`mypy` by `python3 -m mypy` is correct, because no mypy documentation 
seems to suggest it.

 From what I understand, that’s generally how Python “binaries” work, 
though (i.e., installed as a module invokable with `python -m`, and then 
providing some stub binary that, well, effectively does this, but kind 
of in a weird way, I just don’t understand it), and none of the 
parameters seem to be hurt in this conversion, so:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


