Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E959333AD7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:58:08 +0100 (CET)
Received: from localhost ([::1]:34106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwXX-0002jd-JO
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJwVi-0001vq-W4
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:56:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJwVg-0007pQ-7F
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:56:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615373770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h7jRBOxcKa/xDnSKlkjiQmT6gERezMoaxQYlVVr0oYo=;
 b=TKM2kpjEBrFqVwdmTmwAjDY6WREetC6AmMsrtAdFXP6PF5k2BjosPW/XlomU+3+MnSc4s2
 y9oqOqiqk7XGhGGfmYjtiYekLvYX0KWQpt4IhWT9kDqNnJxvVNg/IG0MF/B1V5MiO+9k/b
 LW5gg46954vsdglKCAYFqcJwvHdUkJY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-TzlF79IcMX-tmjJsKk5xKw-1; Wed, 10 Mar 2021 05:56:08 -0500
X-MC-Unique: TzlF79IcMX-tmjJsKk5xKw-1
Received: by mail-ej1-f70.google.com with SMTP id si4so7083845ejb.23
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:56:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h7jRBOxcKa/xDnSKlkjiQmT6gERezMoaxQYlVVr0oYo=;
 b=LrcvgiLrmpDOF5TxJz8/cbSu3U02x+LnvzJi3SXHhHvmoXkXEvE9MgHRWBsYuOx90o
 Ihxc44C4OFUpm2pxKb7ENSBUFL7q1Gi2Jhx1SfZUP5yY5jVuziD8h69ZEi64brv+SLZF
 OEnfbq6DUaVX9Zk2uDWXAjuZcvkxedBLGcoMrftxohKAM/zqeRf0/FeRIJSKwdeDaet9
 E548U/KOs86cxy9GYAo7fHg+UQ19AlPt0SsKwehr5bdiZPW0rXTPDtlGMirRtKPICfPW
 rXmiK6M+btsKWTZhI1MjeNMOmXeIH3eLXsq/LEOhdSCTaRpFPdhh40dBOgghVW9Wv0Lb
 GX9A==
X-Gm-Message-State: AOAM531OMbQGKAXfO+7b59sUzuSWYICALiVPjaTWo4I8oA/N8eO8ZTUm
 z9zmsV/rvxF5qn38XI+hJW5umsR+a+T043u5VkqgpCMvye/JDuSCRPixnsDP+cLVJsbhH3dzeax
 wvL4xomtQUSuc/tHJUkVGMUJu3qgHwAmghy4u5Vru9HOuhNCBxQYMdBka+4BjjasM
X-Received: by 2002:a05:6402:104c:: with SMTP id
 e12mr2493508edu.108.1615373766955; 
 Wed, 10 Mar 2021 02:56:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlxwdqbdaJ4ImU/pwNi2pXpx22HbjP0XjPeRcwaDZ3VPkvYVp0pxS7QbJX+BQIm+gjwyrUzg==
X-Received: by 2002:a05:6402:104c:: with SMTP id
 e12mr2493493edu.108.1615373766737; 
 Wed, 10 Mar 2021 02:56:06 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d3sm10447611edp.43.2021.03.10.02.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 02:56:06 -0800 (PST)
Subject: Re: [PATCH 1/4] hexagon: do not specify Python scripts as inputs
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210310104937.253532-1-pbonzini@redhat.com>
 <20210310104937.253532-2-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c143c927-1ad8-2564-0230-22b05331e53b@redhat.com>
Date: Wed, 10 Mar 2021 11:56:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310104937.253532-2-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 11:49 AM, Paolo Bonzini wrote:
> Python scripts are not inputs, and putting them in @INPUT@.  This
> puts requirements on the command line format, keeping all inputs
> close to the name of the script.  Avoid that by not including the
> script in the command and not in the inputs.
> 
> Also wrap "PYTHONPATH" usage with "env", since setting the environment
> this way is not valid under Windows.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target/hexagon/meson.build | 30 ++++++++++--------------------
>  1 file changed, 10 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


