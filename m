Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B6C478C78
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 14:39:43 +0100 (CET)
Received: from localhost ([::1]:54534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myDSY-00058S-BI
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 08:39:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myDPr-0003Oo-OM
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:36:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myDPq-0006yP-Cy
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:36:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639748213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YB8xW5NQZTcPKzIQeKo6XvljUCujRovmOlRMI8EL9cM=;
 b=aNck3jTj6JZSmqG+lVJGZFcYKr/IN+/jO7bzlRRZ8GHkf/huChzQeyF6ELISPyyDBl7mQf
 +eQOmvi29at846om1Wuu8hrKbAUyZPC+5Me++0895a6fGPdqZxffppwpkh5Saemc1ovX8X
 zWKOONLNgH6pe04s7o1we1oIVR/hsOk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-BNbRrYBbOt2d0pS0rx-SgA-1; Fri, 17 Dec 2021 08:36:52 -0500
X-MC-Unique: BNbRrYBbOt2d0pS0rx-SgA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so1059208wms.8
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 05:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YB8xW5NQZTcPKzIQeKo6XvljUCujRovmOlRMI8EL9cM=;
 b=0vZuXk07tSoX49FHOi8pxVEzIkclrVVhjnKT54wTo/Ay0KVcrED5GlPzdeQynmup4t
 Ximyr0/7Ie2o3UKaHFXZMtX7NFSUrvtyX38L7t0oYpV+0NFGOlwgsna87KWhLM76jfR+
 mm/yM0B04unN2WYuhfYNGiUGRz/k611y9O8X4tUIaV9uE+8ZtLSd77nKk+Rbbyj9vVQa
 68etFjmOY0IMboV5GT1XwqhGoVOV6d6l3UzWs58mE9iGC2Jj0NgP41V4Arq9B7Xk3NuZ
 yz1FJTw/V4ADdgRw9kKx6rhZNh/KLlRiyP7YO0hfkl/vEElzU+ZHgAjQf4rRKRz31JYa
 qvbA==
X-Gm-Message-State: AOAM531cbZ0XXevtKY3NLhsTi7gDcRfwpl8GbmUbfQXjUjkoBgtHeAf3
 uiVWXxSyD8MATonnG4Lvv5LnvSiAoJbDccFTvwyeYYZKlOPFCog9DEXnsAAjfHgZOJnMhsUAzVf
 Tu6CcQ0qP9I9FfDE=
X-Received: by 2002:a7b:cd07:: with SMTP id f7mr9680794wmj.6.1639748211680;
 Fri, 17 Dec 2021 05:36:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjE1HUZ413gV1FBs7nbqsa1KYbQUNwyyC44YIGyG5eM3suwCoLefd1WnlARrtpz8A5TmDyUg==
X-Received: by 2002:a7b:cd07:: with SMTP id f7mr9680783wmj.6.1639748211497;
 Fri, 17 Dec 2021 05:36:51 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id v15sm7430893wro.35.2021.12.17.05.36.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 05:36:51 -0800 (PST)
Message-ID: <8e6147c8-db72-311c-2055-09d41a5b64e0@redhat.com>
Date: Fri, 17 Dec 2021 14:36:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 11/37] ui: factor out qemu_console_set_display_gl_ctx()
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
 <20211009210838.2219430-12-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211009210838.2219430-12-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/9/21 23:08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The next patch will make use of this function to dissociate
> DisplayChangeListener from GL context.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/ui/console.h |  3 +++
>  ui/console.c         | 22 ++++++++++++++--------
>  2 files changed, 17 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


