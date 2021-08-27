Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A173F9959
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 15:07:10 +0200 (CEST)
Received: from localhost ([::1]:57920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJbZI-00036k-LA
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 09:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJbY8-00021l-GT
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 09:05:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJbXv-0008VQ-7s
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 09:05:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630069521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vj+YOxHrzDqrNWskNgEUOJzuOh7+9MXXC7aNBbxamE4=;
 b=QTpk4p6mEZvlsO52ICyhZwdaXRPp03gjcFly1B4jMQH73I6P3Muh/cM+qx0ERYxw4Fos4p
 WjOOATUDMOp6KNqLCzaUxwbH0nC5VscCHuxWmJ05X3yENkx8iz1gKwfWRGdMOrzA6dbbXt
 A4h+JHmUyHeo7ZZgxe1nfvp1HfjWTEg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-mxTcIkkmP9GcTdVAqzzqYw-1; Fri, 27 Aug 2021 09:05:18 -0400
X-MC-Unique: mxTcIkkmP9GcTdVAqzzqYw-1
Received: by mail-wm1-f70.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so2071892wmj.8
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 06:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vj+YOxHrzDqrNWskNgEUOJzuOh7+9MXXC7aNBbxamE4=;
 b=AsvOt0ekQ34kujqVKEFnKj07pcZv6kzuqwsbCVSZit8vUQ4uAZfrxYqDs/Tpsq2x/4
 yDz+S7E4dosoVTwAB2uqiktw9R87LyBGygoT86KFht7g/ETQ+LhzTXf7VQ3siYLuYnF2
 N9HCH/coQfiFtoo2DxWVYj7Ilg3hh/BsYjeF3N5mGm9LJKIgg9VW+CTtacKRDXPs1Z6H
 0GlIpAcsaCd7HtQvjzxAnySw7EAB8eHjwmk4izxWVvLH9iqa3Vtb+DQ/g0ZExi/pSk92
 ni9iniNsJpcDUKpiR3PRER5dXvJ+ubttm2IsYg4e/qD/lOERLdW7WfQwE1NSvAnQWNFd
 Ml8w==
X-Gm-Message-State: AOAM532xyipMNfXof/7U76QClv6NtJO59FNrr4VRaMPwQiqDnNbhvcVD
 bMUcSbDc/S+eViM+1Cm0ps+6nirbLvhFRtyPsmFT156ZFgPn8VOz4vR86uSJNPI4Y3kxh6IdMoV
 ThAnBOXimBX8KNLQ=
X-Received: by 2002:adf:c3c9:: with SMTP id d9mr9058982wrg.339.1630069516971; 
 Fri, 27 Aug 2021 06:05:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSoahi8WhcYo6jDMHcGGxJ6vD7Vj2+ATePfGE3rCCjMFC7uOhXuLUQ4GQNtKkrb9BjGlSVtg==
X-Received: by 2002:adf:c3c9:: with SMTP id d9mr9058945wrg.339.1630069516727; 
 Fri, 27 Aug 2021 06:05:16 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id s12sm6416619wru.41.2021.08.27.06.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 06:05:16 -0700 (PDT)
Subject: Re: [PATCH 2/3] meson.build: Don't use internal libfdt if the user
 requested the system libfdt
To: Thomas Huth <thuth@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-3-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e19371fe-8aa2-f098-be33-1a8251f97fb2@redhat.com>
Date: Fri, 27 Aug 2021 15:05:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827120901.150276-3-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.437, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/27/21 2:09 PM, Thomas Huth wrote:
> If the users ran configure with --enable-libfdt=system, they likely did
> that on purpose. We should not silently fall back to the internal libfdt
> if the system libfdt is not usable, but report the problem with a proper
> message instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  meson.build | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


