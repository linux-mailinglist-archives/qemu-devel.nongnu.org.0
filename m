Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB05F65BC9D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 10:00:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCd1q-0003uy-Aw; Tue, 03 Jan 2023 03:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCd1n-0003uP-Ji
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 03:52:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCd1m-0008Eo-47
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 03:52:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672735929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4rsyf92RukFU2av97TrVSZthL2zVvnx43RjRVK0NReI=;
 b=KqplUbvdCAveSIrVWnQ7xi5YPFLCY4oFTu0tYK0kRYkgXpaAZOMU4sqGzZ7YOlAxwj+4ld
 EN93+7OqvQRts3/tmDhnyZO3Rk+lTXfCL3ovfMZjyb98KYXj5zqOtJ+Pdn5f1JEWvzxXQX
 4l4dDXOYk9ur9DSsx+NJIYQUg4OaEwM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-347-nNncaCJKMxCSRn0GmVtHhQ-1; Tue, 03 Jan 2023 03:52:08 -0500
X-MC-Unique: nNncaCJKMxCSRn0GmVtHhQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 r10-20020adfa14a000000b0025ba73dff40so3458681wrr.12
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 00:52:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4rsyf92RukFU2av97TrVSZthL2zVvnx43RjRVK0NReI=;
 b=A7sJ/flzRXcstGQXM3X6yBAifCyET0MGn3NQOhqqMR4bPVDkvgdTU0rwy37rpfXGpL
 63VocQRRdNmbipoSV+AEyjNeIbEyeOXhYbyWAGYqNWdAWBaiqwMwcrJ2PwdXUmFfTWwo
 9zzA+AlXJbS7UYGkFgD+6MEDrzb+iXtINLNHd0DIZo4VQ+sMGOGjJrMQns+qYytUS9xh
 9W/wCKoh7YS08gaiSfqDn1FylzkjHStWvfbHArfPYNP3KGRZbftLkE8b868eb47njbXM
 80eyiQ7yfXBgo0ul4iBQOshH92KMRJajymqAR2WiSKTBcFidDsPPV93j7jShCEiyA4D0
 zRyQ==
X-Gm-Message-State: AFqh2kqT/t7XJ3Z5hoTXS+9wLlSI1tWYj7E4H9RilMPck0SvA76GyWrz
 NyIt8yPHwy78LDa1uOIZ7acFGf7sxk8+HXoLKUqVDk+B1leILbfxaLPfqArFiTFqSeH6JeaN/oJ
 OUX7qXpY8u72hJkM=
X-Received: by 2002:a05:600c:1e10:b0:3d1:f496:e25f with SMTP id
 ay16-20020a05600c1e1000b003d1f496e25fmr33172600wmb.16.1672735927019; 
 Tue, 03 Jan 2023 00:52:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtANSZik4vRancU5FeKTNvIIcZFyyG8PWAW09bEuBD5fJwk7UhKKO1o1AckLrFEFaGa9i2vMQ==
X-Received: by 2002:a05:600c:1e10:b0:3d1:f496:e25f with SMTP id
 ay16-20020a05600c1e1000b003d1f496e25fmr33172567wmb.16.1672735926707; 
 Tue, 03 Jan 2023 00:52:06 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 j20-20020a05600c191400b003b4fe03c881sm52864456wmq.48.2023.01.03.00.52.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 00:52:06 -0800 (PST)
Message-ID: <f6634a25-81aa-ccf7-4573-0ac2f005c55c@redhat.com>
Date: Tue, 3 Jan 2023 09:52:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 09/30] hw/i386/pc: No need for rtc_state to be an
 out-parameter
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20221221170003.2929-1-shentey@gmail.com>
 <20221221170003.2929-10-shentey@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221221170003.2929-10-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.142, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/12/2022 17.59, Bernhard Beschow wrote:
> Now that the RTC is created as part of the southbridges it doesn't need
> to be an out-parameter any longer.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-12-shentey@gmail.com>
> ---
>   hw/i386/pc.c         | 12 ++++++------
>   hw/i386/pc_piix.c    |  2 +-
>   hw/i386/pc_q35.c     |  2 +-
>   include/hw/i386/pc.h |  2 +-
>   4 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


