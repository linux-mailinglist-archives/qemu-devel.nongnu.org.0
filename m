Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14943D0116
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 19:59:42 +0200 (CEST)
Received: from localhost ([::1]:49752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5u1t-0004km-Jr
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 13:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5tzy-0002Uj-5t
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:57:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5tzw-0004RT-NW
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626803860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nbbOcOi+fdH5x+m3nWK+EEq26tJEHRgAm0CwsxiVgic=;
 b=Cv2XlEbd7Arq7cvqCarAAxrfC7ETE5caaXhcrAgEio8ekT+jIXdq+JtPot1A2O1LxnrwJ8
 iDOteJYEe+qr3ORXvs4GoCm2evd6aDsN0OIxD0+ebiS3ZJRg8CdLN2sdhTHCaaMSEnNozj
 E1w82lZxdT09NHVZZnWFQdJ3WHqmy8w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-JnGyvBiaO4ikq14KFXB-pQ-1; Tue, 20 Jul 2021 13:57:38 -0400
X-MC-Unique: JnGyvBiaO4ikq14KFXB-pQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 p11-20020a5d59ab0000b02901526f76d738so13582wrr.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 10:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nbbOcOi+fdH5x+m3nWK+EEq26tJEHRgAm0CwsxiVgic=;
 b=GULThKA7STpoD+RnPOu6d/RxwR1sELX4JPz3K2S+gh+gVJmtqI9WBmUzMz1R9Kud/h
 i6O84YmY0yRhhoM7Uoj2cVL51WvUbRDFiw7i+8U5EFCs8oju+bLrLK2c/GAchEwkENYF
 h3WDLNB53wQBTfpUaO4j5HVD6UA1vtgZbadmOHYWzEgtOuGrZkDbh83QGFJDbEZ875Cn
 VgYIjnBGfSCHaHGGE1SH2tkO88ngbzxU107mqDisFIyaIIh3HeKho0kUykjc4CWay9ce
 Auv6bl1W/LJdH11dsQf4OiAqavh7IVe8iX4Ind7P8BECoEFhgB5ra1mx1v6WS44F1tnZ
 biHw==
X-Gm-Message-State: AOAM532PfRWvkfpO3TgGDI7067eOQ6fgbQ32Ch1hSkKIonqeqarrQrWD
 gnXxGBnlvTb6/F53cZDL+4PyypiM0SvrAVF4o4CUrfQYhd2oJGplwideu7prDWKjTlG42JCMBqQ
 yTkzbINIsLlOzw5Y=
X-Received: by 2002:a7b:c108:: with SMTP id w8mr33229956wmi.99.1626803857302; 
 Tue, 20 Jul 2021 10:57:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVP+d/6KngKoK7NemYIyfJhglVUvbq+ozQj8+V3EP7G4/AoD0oAds0M9SG+YHxYk4A5HOBhQ==
X-Received: by 2002:a7b:c108:: with SMTP id w8mr33229940wmi.99.1626803857174; 
 Tue, 20 Jul 2021 10:57:37 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id w18sm2235019wrs.44.2021.07.20.10.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 10:57:36 -0700 (PDT)
Subject: Re: [PATCH v2 03/17] iotests/mirror-top-perms: Adjust import paths
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210720173336.1876937-1-jsnow@redhat.com>
 <20210720173336.1876937-4-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8bc1f4db-0f50-779f-8448-8454c7bd1e35@redhat.com>
Date: Tue, 20 Jul 2021 19:57:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720173336.1876937-4-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 7:33 PM, John Snow wrote:
> Technically AbnormalShutdown isn't exported via
> 'qemu.machine.AbnormalShutdown', but instead from
> 'qemu.machine.machine.AbnormalShutdown'. Odd, I know, and it's on the
> list to fix. For now, change the imports here.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/tests/mirror-top-perms | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


