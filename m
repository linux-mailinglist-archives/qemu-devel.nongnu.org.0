Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5196F40D297
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:36:19 +0200 (CEST)
Received: from localhost ([::1]:59082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQj8E-0005rk-1f
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQizY-0003ms-Tb
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:27:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQizU-0006R3-Pi
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631766435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DbOpVSrZG83cVXbP1yjJsL6areG1JRzyr44IqnXW0y4=;
 b=jOABq26BLrjgbfQM3vArk1+Gl+LwpJOfbA4IyUK3fV2mWKq0rzRkqOEpZwzbkzVr1lLYe2
 xEXrVvNe9CpJRefzZq56qNYRaNq2Xty3Tv5cRvll14UrDoQMwzBWX+gO1qIR+UsfhMLr1c
 HgWIQ5t+MPwv9He0fP/6NJKegVYXJJE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-pDKKi0bWNoCeZM_pGwQLZQ-1; Thu, 16 Sep 2021 00:27:14 -0400
X-MC-Unique: pDKKi0bWNoCeZM_pGwQLZQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 g13-20020a1c200d000000b00308ecd761e8so2547068wmg.2
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 21:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DbOpVSrZG83cVXbP1yjJsL6areG1JRzyr44IqnXW0y4=;
 b=27nASwn1tBV5GOkCUWVCpJLBHvxWWeywnBKCsMcl1AfgPcCwTTfpLmkQL91LB8jII/
 F3kMeI/uy2m5I8hjzrj7Wi4x92Ix9JYRkR1vO0jUmitot3vESulE5W5W6duy9NSVXb6/
 2BE99Y2mpHNWndUTrMJP4BNMvAf5XIA6H3U+GL/saNj5Z+OTFZ+EzB6CY3uwetPUjJsp
 LcLS6eHTDiDpK87Ht/22gkmvYT7EpessYoge98d/1FI9R8grGsRmqelv6/RAho+mI0CM
 4nycfdBqaio1z5oJ/05Gyuj5139bR8F+JmrDtJup9QdaGyenBbD9LrlStWUZetoyh/3x
 u9kQ==
X-Gm-Message-State: AOAM532OfiOECADPliSCaMlZtAlJLmg0SVP7y9y0bp9RqtXIIDR0BwDs
 o2P/VEs/fIudOUIqtTsnVpvBVHnnKzrVtpi8y3MyDbfwM1xcLPkuRNlxS0fMooXgSnqzIrK7/BI
 XmCUn7RyqDgqnA8Q=
X-Received: by 2002:adf:f183:: with SMTP id h3mr3600516wro.32.1631766433185;
 Wed, 15 Sep 2021 21:27:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyKdyx5kA+4KNSakbZ0euxz1WR9k99g0uklyEla5frgAlVUsGyKujKjXUBuArttVeJRi8bDQ==
X-Received: by 2002:adf:f183:: with SMTP id h3mr3600501wro.32.1631766433009;
 Wed, 15 Sep 2021 21:27:13 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id i1sm1840746wrb.93.2021.09.15.21.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 21:27:12 -0700 (PDT)
Subject: Re: [PATCH v3 02/16] iotests/mirror-top-perms: Adjust imports
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-3-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d394079e-b83b-33ce-b137-2e5bbc2213a1@redhat.com>
Date: Thu, 16 Sep 2021 06:27:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916040955.628560-3-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/21 6:09 AM, John Snow wrote:
> We need to import things from the qemu namespace; importing the
> namespace alone doesn't bring the submodules with it -- unless someone
> else (like iotests.py) imports them too.
> 
> Adjust the imports.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/tests/mirror-top-perms | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
> index 2fc8dd66e0..de18182590 100755
> --- a/tests/qemu-iotests/tests/mirror-top-perms
> +++ b/tests/qemu-iotests/tests/mirror-top-perms
> @@ -25,7 +25,8 @@ from iotests import qemu_img
>  
>  # Import qemu after iotests.py has amended sys.path
>  # pylint: disable=wrong-import-order
> -import qemu
> +from qemu import qmp
> +from qemu.machine import machine

Not straight-forward import name...

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


