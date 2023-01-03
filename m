Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEA465C0D7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 14:31:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pChEI-0007dQ-Oy; Tue, 03 Jan 2023 08:21:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pChDi-0007MH-13
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 08:20:54 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pChDS-0002rS-5Q
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 08:20:37 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so26209784wma.1
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 05:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZAwOz3kc/9RSBo9h8xa3JZTDJQ2pKeCHHfYRBL5M+SY=;
 b=w6BTCvFONQCYPX0/nZZCMv4rr29dPxkv98CNXiyLTNiTsQbTli7oCIEorcdwzVRc3Q
 ge3kqsR5GujjPB0TW7Pfp2NU83khk8s3NXWX8wKRV1tIJK8gp6OTTXxCAVEi8dGmp2iE
 lSDbp3a/SWK5od1MJsS6FD+hXAzD4sSwQ9gd/VTBqX31dHDmzyczIf3WwfGAFeCnsVtd
 R4W7sbNJr0jZ+6X6duvmxscybWitengU3/4qw/6wfZC1vSF4TxAx4LbtKYfauDhMGWc8
 9qdRLb6hF7Co+q3ij/HqSwp9UpU0jJhxmDYqusP9482jSljfGackybhTGEO4GzTJm0cC
 xn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZAwOz3kc/9RSBo9h8xa3JZTDJQ2pKeCHHfYRBL5M+SY=;
 b=c4eaTr6GoRcxyOpCqWF/eM6GnPJEHJZ2M+HfpBC9fx/ZrqDIRdPihXe5JTUwrQ6M4+
 +Q0/9m2fOZMHrJYeZpbD8yJkh/f9Kyj9OhD4epSAkQqtkSlhyByTf2psVFvw9eOCZ9qr
 nOkIuJ/I01xom+Dn4XN6toKgzhGMGO7YAuBOz9eD/OovXqxbcS5RlrEtrr11J1x3Bk0Y
 s9fj/deaWxLtlz31IZ9TbfY5nPNZ/ifN5u01AepoaU83RzoCQM0zEhK1LX8nEy5zbiR/
 avLBrFv+H6mBo913pr6FWlD8Oq1hDviJiJnxlruM7qF9Q10FNyptTdTUe8gtOBXO1L3u
 ljWA==
X-Gm-Message-State: AFqh2kr1G+BsfyMS81MoUtySjkwoe3Bbw2qftcY7I+O59VnijU+jN0CK
 3/byEvK7SmheHLgzE7rst+f1+A==
X-Google-Smtp-Source: AMrXdXujUu1mK5FhNhKF64/Kjpk2KVHVVnvRRQsbR6qSJmMKeYk3xlYQ4gde/xnsingH5Bey5hXL1A==
X-Received: by 2002:a05:600c:22cc:b0:3d1:bd81:b1b1 with SMTP id
 12-20020a05600c22cc00b003d1bd81b1b1mr30316821wmg.18.1672752023907; 
 Tue, 03 Jan 2023 05:20:23 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q185-20020a1c43c2000000b003cff309807esm48256372wma.23.2023.01.03.05.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 05:20:23 -0800 (PST)
Message-ID: <cdfe29e9-327b-476b-3343-92216874075a@linaro.org>
Date: Tue, 3 Jan 2023 14:20:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 5/6] hw/isa/piix: Resolve redundant k->config_write
 assignments
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost
 <eduardo@habkost.net>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230102213504.14646-1-shentey@gmail.com>
 <20230102213504.14646-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230102213504.14646-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.103,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/1/23 22:35, Bernhard Beschow wrote:
> The previous patch unified handling of piix_write_config() accross all
> PIIX device models which allows for assigning k->config_write once in the
> base class.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


