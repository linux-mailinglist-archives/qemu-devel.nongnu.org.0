Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981C12CC177
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:59:30 +0100 (CET)
Received: from localhost ([::1]:59134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkUXR-0008Mc-M2
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkUWU-0007df-7A
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:58:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkUWS-00087e-Lt
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:58:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606924708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v038wf4ZStL7X4tAXbU9ekFHO98jMDSrYFCSONu18mc=;
 b=WwlyFoKqRh2imMYG9G5J3VT0StQ1Fjgxu9h/M09KkhUlt1wKXx+KMpJAfzuZGh1LafmV6P
 jJ7MqKlehHYrk6jE2S0HY0o0K0rKi9hnF0h6IvanS11Eq6ZalXEtQRv2bI6MJVNIu9GXu9
 KVMoqBpA+pvHPrXF7NmDeDVpLGK8CqQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-SN1gBTb0NF-7bl0aktooOw-1; Wed, 02 Dec 2020 10:58:26 -0500
X-MC-Unique: SN1gBTb0NF-7bl0aktooOw-1
Received: by mail-ej1-f69.google.com with SMTP id f21so3316969ejf.11
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 07:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v038wf4ZStL7X4tAXbU9ekFHO98jMDSrYFCSONu18mc=;
 b=DtGccg7aMQGBlg94Jw69Vmd5bwE3R/g97Wxwhh1NqqgmYT4koN9S5BzsHa8kb05MEU
 9Fbeik7EhaJ7jCnGbKr+MpDK7nbxC4M3PHXymm5YSGECrojG5zKhLkVpJD2ZA7zDKUDh
 DD0U3+dJ9hCl24IM12PkdLnV+zwY8EG07Qux7A9QPWu0cIB2MuO4jkFKhBUBtMyPabEq
 myEvc3ME/F1GgMkhvokplm6igvkEa99c8mqmtKXfNxxYLAS5lQb3iVB4NEjzIWNr8bfn
 s0A73yHfS0YQnRLL7tSeHwqPkajN9SE7DmGYJEQpnPWF2bn8b+4CYu3AO8hdUcYHsUMi
 aqvA==
X-Gm-Message-State: AOAM530j3RXtP5aSMth6JmcUC83blfHUoYd6NKX47MKHB/vOZWUpUf5R
 U+RRxQelodkJo7foVHRL6uxXvNThhiySYE36h7cMoLopiJKflnUzcDZwJaUhfAxqLgJoK9rYTms
 nA89j6i5wVbMsKeQ=
X-Received: by 2002:aa7:da53:: with SMTP id w19mr566755eds.190.1606924705455; 
 Wed, 02 Dec 2020 07:58:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNZBU2f7h1DAjkcFBDoZopunRa9+gHNLzenwJ/eW4y0DynkcRRj7mh37gbNkXSVJhb2udVRQ==
X-Received: by 2002:aa7:da53:: with SMTP id w19mr566749eds.190.1606924705329; 
 Wed, 02 Dec 2020 07:58:25 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id p35sm242654edd.58.2020.12.02.07.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 07:58:24 -0800 (PST)
Subject: Re: [PATCH v2 4/4] block/export: avoid g_return_val_if() input
 validation
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201202152611.677753-1-stefanha@redhat.com>
 <20201202152611.677753-5-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7d6db583-55c1-2043-8398-85b08ea3d3cf@redhat.com>
Date: Wed, 2 Dec 2020 16:58:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202152611.677753-5-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 4:26 PM, Stefan Hajnoczi wrote:
> Do not validate input with g_return_val_if(). This API is intended for
> checking programming errors and is compiled out with -DG_DISABLE_CHECKS.
> 
> Use an explicit if statement for input validation so it cannot
> accidentally be compiled out.
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/export/vhost-user-blk-server.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


