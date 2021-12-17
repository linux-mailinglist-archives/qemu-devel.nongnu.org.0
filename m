Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8E5478D08
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:06:34 +0100 (CET)
Received: from localhost ([::1]:47126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myDsW-0006J1-Vy
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:06:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myDmm-0000FR-Pi
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:00:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myDmc-0002IS-Pm
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:00:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639749626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=06zGQnoZFrYQrr6cpwhyF76c3tJXrsLgMkX1M9OExQo=;
 b=YU0iU51txK/U0AynA/jIeQ38bsYLYAqOac7QIxy5kazzobTvCC4+M9JwYOnKgrBYAAzFes
 DVmeJzgoM9B/sfzuz/WbqwSmpnEN+DsRlaYZnDXWknEfR9IoZFTx8tedlonAyIanC6ch4r
 b7asKWLJpv5Awmlf3a5HYiD6k2m6uWQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-GwPLw5a-Og-QQ5iSVTakMg-1; Fri, 17 Dec 2021 09:00:24 -0500
X-MC-Unique: GwPLw5a-Og-QQ5iSVTakMg-1
Received: by mail-wm1-f70.google.com with SMTP id
 205-20020a1c00d6000000b003335d1384f1so2996668wma.3
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 06:00:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=06zGQnoZFrYQrr6cpwhyF76c3tJXrsLgMkX1M9OExQo=;
 b=mKkVOvBETfFOa2JmQWlvcqkMNFEKs0WM8p8JVDPFkU0Q0VQS81b5Txj8ECYgaUCEVY
 25gFVG5Cy+fY9lZG3lahAPmvERjtYEtOW+45tsNjutrEiEw+A4LW77eZTLqPR1W1TOtR
 kf0BArHsDLTwHXBk3OFoxGIfVLi19gJ3Gc467hDYX6wjyYJp90NJqQUqnNWHjkpYkVkb
 umWrSdfJgxMJVWFsMvDDo5nJV6m91zSDlTq/wF4uKR/Cme5vaTHxfn6Pwk/INcDJYPLx
 ffd6veBoRks7+pC2Qf0fWyLm/HoR8BV0hfztx8pnBbJ291BQZsYACgGUi6/Ahf5jugbD
 /h0w==
X-Gm-Message-State: AOAM5305BMWgdyl7vyUu3w3uKSgecerO5nbsKC4fMEjTgaqAMFHXw1xR
 esmgiefx2Z4RUG+YTX9Db9FWFpe3wzOcs97Rfd45Fn0TPUk3EPrPiWygzr+SOEzb9paMcxDap63
 FrXRAWOpLsC/qfAQ=
X-Received: by 2002:adf:ec09:: with SMTP id x9mr2739431wrn.111.1639749623771; 
 Fri, 17 Dec 2021 06:00:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztr0SpswbwcDTd2DyK4r3Je66su7xMNBiIKab86nLAChE571U1TeFoesknX+hdPRED93FklA==
X-Received: by 2002:adf:ec09:: with SMTP id x9mr2739420wrn.111.1639749623628; 
 Fri, 17 Dec 2021 06:00:23 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g7sm7145676wrx.104.2021.12.17.06.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 06:00:23 -0800 (PST)
Message-ID: <b2613d5c-7b02-8fd3-7a08-0c5a26805908@redhat.com>
Date: Fri, 17 Dec 2021 15:00:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] meson: add "check" argument to run_command
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211217085320.131533-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211217085320.131533-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 09:53, Paolo Bonzini wrote:
> Meson is planning to change the default of the "check" argument to
> run_command (from false to true).  Be explicit and include it in
> all invocations.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/meson.build | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


