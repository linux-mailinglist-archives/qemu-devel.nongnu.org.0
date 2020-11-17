Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11B12B6C79
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 19:03:25 +0100 (CET)
Received: from localhost ([::1]:56412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf5K8-0001qD-MQ
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 13:03:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kf5IP-0000fy-1v
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 13:01:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kf5IN-0007VG-DR
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 13:01:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605636094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XMOylijx2tLgLf53xDbr02slPFB9JZzPZ8VQjmiz940=;
 b=ND827d2q2YbgEBPY9sUrHEYkBw2efX4TsiCZ+pOQ+rqfyVfl2uZSVXjnaHTb5COfaFx/1+
 8jj2+yxQVvdN/dIv59++/63l3l/xj8q6ZBYY7Mz+BRpa5qkF1sY13zb363YBWHbu/CMofa
 6f6OBnAzBNzhG225jKTn/KAc4Q+/3vc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-ZFZxwAKRNeGnxuljwQXQQw-1; Tue, 17 Nov 2020 13:01:26 -0500
X-MC-Unique: ZFZxwAKRNeGnxuljwQXQQw-1
Received: by mail-wm1-f71.google.com with SMTP id o203so1762199wmo.3
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 10:01:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XMOylijx2tLgLf53xDbr02slPFB9JZzPZ8VQjmiz940=;
 b=JITFmvW1eS7Q5MNDQs9DVWq8EMyTAZ0zedygwh/IYP+2yssFBb0nOFjtNHqkQTkj2E
 EcQYwjf9Lxu1enPq/NEA2iqqUuOkeNeJqUXLXuJQ7BHPLHivgCo1j+2msHVbet0GnhdN
 wZ/MzUwdEu6id8wbuuRSh7Gi4ly1fBCsfAnLEZp+nAaGzGAY78gvli2XSMqLwKkDz5o5
 KMLsxl/sFYjVbQ7Ab1UQjM66U1eVJWoP3Q8ixO4H3eYYcdPCr+KzeW6NeIEusmS4FQw2
 4IpBV2ph+oejYPLRcSpD4A3+WIpsdCa5vE3tLcMzwWQ5J6P4uaLwCfVriUg8tKO32IHH
 QaEg==
X-Gm-Message-State: AOAM5333qaI34kkkAXYfUBsSxaw9XvSAupj6YB67RgjLMLoU5gwd0YwV
 GsXbpfOYDBrCTH0vzf4bI3367fiIYItr7byQeBLXML5kAtNAe244/03h0NwTiFrTlJ8/NA0uvgI
 MUSFozwDeOwnP4Yg=
X-Received: by 2002:a1c:544c:: with SMTP id p12mr296657wmi.146.1605636084937; 
 Tue, 17 Nov 2020 10:01:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTr1zZziRj2GJEO2F87oVm26qSaax2nRa7mS+U41wXHke79bct48K8t5xdyW1ysmS0auZmnQ==
X-Received: by 2002:a1c:544c:: with SMTP id p12mr296576wmi.146.1605636084185; 
 Tue, 17 Nov 2020 10:01:24 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id u6sm4505392wmj.40.2020.11.17.10.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 10:01:23 -0800 (PST)
Subject: Re: [PATCH for-5.2? 2/2] authz-simple: Check that 'identity' property
 is set
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20201117163045.307451-1-kwolf@redhat.com>
 <20201117163045.307451-3-kwolf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fb35e5a2-9823-5ce5-035a-4f0d983c571b@redhat.com>
Date: Tue, 17 Nov 2020 19:01:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117163045.307451-3-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/20 5:30 PM, Kevin Wolf wrote:
> If the 'identify' property is not set, we'll pass a NULL pointer to
> g_str_equal() and crash. Catch the error condition during the creation
> of the object.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  authz/simple.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


