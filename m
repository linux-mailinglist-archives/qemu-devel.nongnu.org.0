Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1693140384D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:54:36 +0200 (CEST)
Received: from localhost ([::1]:44550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNvDv-00006A-51
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNv4x-0001Dz-32
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:45:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNv4t-0001np-78
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631097913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aq5MMHXqeWSaiK3BQ3URYkFKRjYZj/6q2PLGDrukLqk=;
 b=fyUydOrF0vmEApp9c5lDrV77RJUTHMzYSr4y5lmqD2NQ4ea3Qm+OFMabbnmHmWKEJo2KJR
 FXi7NuE1p++KMrsRkrOjuMCt+Zg1cpcDStxxB9Yy1poeldQci+4lKxOlr+W25hMHVdmQqn
 j8De37tUrzojA65HF+WXNWXZ10aggWw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-amAeQB_yOlyceapnYaS53A-1; Wed, 08 Sep 2021 06:45:10 -0400
X-MC-Unique: amAeQB_yOlyceapnYaS53A-1
Received: by mail-wr1-f72.google.com with SMTP id
 n1-20020a5d4c41000000b00159305d19baso380243wrt.11
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aq5MMHXqeWSaiK3BQ3URYkFKRjYZj/6q2PLGDrukLqk=;
 b=QTvb4MhjMpyZQvJHZqDpeqMt91RUX+XPDOqNfGzR0tWntLFkdbhWl7IUuROt+kwr5O
 Yjni4fe/nzjObGQ7B+tkbBw0Ps02eIrKtRGSfFYtknL2fBMLO5FuxThvk6078CtwSOaT
 AwMUn9UjVcpNLWEw2bPJVcZoDbxbNfBTOC0jOxKFE8ZhBLU9wohDcBovZqAGfcCA8YEI
 CP8Bfyo/GE8ya8C8Z2qjgXJlPXofNyzXA+CthxXM2o5kLnCnJ4C84cCp86sNQNIKB/EP
 enDe37hfuXPCyAdYdEcmwWXGXq5MzbiFjmsA5bkLm5t2+JPVUN6ibZXBO2TyZTV8trrG
 OE7w==
X-Gm-Message-State: AOAM532+g0G9M4EggGwz3OzdIBhnew9S4sr/jAJfaQfc8vwnx0+3xbrn
 8iMxnhqRcySEm9I51ZswKabPa3Af2gKZK+auW6534AAw/Nu/FTclso9XO0A2Xw4tTBspzKTaCj1
 IzanhClBy+ViQ0PI=
X-Received: by 2002:adf:c54a:: with SMTP id s10mr3278885wrf.125.1631097908906; 
 Wed, 08 Sep 2021 03:45:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaBQeNDyr2kd8Qp+dVumteY+C4VFxcuG946dxxzMTsKzKvq07ZJJFUVnXCNyM9ndfi7MDUaQ==
X-Received: by 2002:adf:c54a:: with SMTP id s10mr3278870wrf.125.1631097908715; 
 Wed, 08 Sep 2021 03:45:08 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id d29sm1879683wrc.6.2021.09.08.03.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 03:45:08 -0700 (PDT)
Subject: Re: [PATCH] meson: remove dead variable
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210908101416.273317-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <439c9e2d-a179-739b-971a-1ad04fdc3910@redhat.com>
Date: Wed, 8 Sep 2021 12:45:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908101416.273317-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 12:14 PM, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  ui/meson.build | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


