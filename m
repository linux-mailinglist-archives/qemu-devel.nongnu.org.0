Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01F547BEFE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 12:33:07 +0100 (CET)
Received: from localhost ([::1]:44270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzdOE-0005PK-UZ
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 06:33:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzdM2-0003tT-4n
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:30:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzdLz-0000IM-TD
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640086246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rKAjn8bEqgRpgeer+vFbaZ1g+Yv+w6uVK1j6QgN6npQ=;
 b=D/ckncHsprUEJ4pOFA5HYG91yWAQeAH7rIXChuh+E5FsllICtAxyrc9Fi3vICrlPpycFIn
 5LA1BiP4Jd4qep9AGaBrpgeVRzB6OBMuAKkviPKGgkXBGSNggBXxQ9OeVNce1jN0554iZe
 BYMIzYMQI0ScRkRbZM44y8R2JA2hclI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-N4FAYWSZM3yxaqdOvHKErA-1; Tue, 21 Dec 2021 06:30:45 -0500
X-MC-Unique: N4FAYWSZM3yxaqdOvHKErA-1
Received: by mail-ed1-f71.google.com with SMTP id
 f20-20020a056402355400b003f81df0975bso9121395edd.9
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 03:30:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rKAjn8bEqgRpgeer+vFbaZ1g+Yv+w6uVK1j6QgN6npQ=;
 b=2Mr/CXnPvwQXQI60I1URZf9kgL1NqVHLp3NGMgm+jeMFE/QC0DKXp9UMHoJ/M0oq4X
 s54d+ISSZ3UM2Q86fuCOxgYlkOdJIhWKKzgVaeKkB7MfDYuqyzXVm0qCJK/pWpJSYry+
 ynwHuOkxab54RHRLS4Jlvoc9AtxFK9Gbw70zbp5aa+v/cVDUPMP4xW2GTJFxRUztvF80
 o4PlJ/+qgPXZVnN2ZBeuaqTscMAznQkDqfbqnpVMbU2ytu2JKTG/CSaaH35o9Zr7J5kI
 j7friIy5Dv7NbtN3t0aFZbwrmKS6TtdNUs219ecG9Dzv+4NwAWYC+narWwb/5jEStly/
 sKxw==
X-Gm-Message-State: AOAM530qd+dDXc6xufAE36XtwAwKGhJP50mVXANlehuGG6XpeQFcfcfh
 bJFt38xZl1rfXwWDTkRHUDb7ormmSIG7yoJTKn9Cv1itOaGDea0rlYg5ZS26r3XelvsrEU4dpbk
 ZJ1n6tKbwq9Bw/G8=
X-Received: by 2002:a50:c3c8:: with SMTP id i8mr2674036edf.350.1640086244415; 
 Tue, 21 Dec 2021 03:30:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0g4m5+e7o9hlSJgqs6lO90tWLpegudIJ43zfU0eUDxjHnRfdWSdrH37xgGpClweYHBOsf8g==
X-Received: by 2002:a50:c3c8:: with SMTP id i8mr2674025edf.350.1640086244194; 
 Tue, 21 Dec 2021 03:30:44 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id a3sm6472930ejd.16.2021.12.21.03.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 03:30:43 -0800 (PST)
Message-ID: <b3d31418-5492-4dd0-3b3c-89bc0605a9bc@redhat.com>
Date: Tue, 21 Dec 2021 12:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 5/8] configure: move non-command-line variables away from
 command-line parsing section
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211221110526.351709-1-pbonzini@redhat.com>
 <20211221110526.351709-6-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211221110526.351709-6-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 12:05, Paolo Bonzini wrote:
> This makes it easier to identify candidates for moving to Meson.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


