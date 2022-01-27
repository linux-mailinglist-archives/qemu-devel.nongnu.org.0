Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C194049EC55
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 21:16:09 +0100 (CET)
Received: from localhost ([::1]:56164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDBBg-0008HS-CS
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 15:16:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1nDB6s-0006IW-Mc
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:11:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1nDB6l-00072r-UE
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:11:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643314262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1bo4EbpctiIg5Fh71wDUudbxUFz8wPH1RQpgQC8Mb+E=;
 b=Sw4gvHSAqdJWlIeQ8msveekGGX5E+Lb3dO33MrJ4KZHh/KHbzLNr8CjiWPBd3PC22VZric
 e0cFH7wXlqxj48h15aaNACdgHOEBB0OTHdleJZxYUZUjmgbgvtKyzI/EHX5raMrI5rT1+F
 mXtmVFc8KkRHunn0aj7RF44gzBBm55I=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-dnGLxT4UMlGnJV0sDa6EAA-1; Thu, 27 Jan 2022 15:11:01 -0500
X-MC-Unique: dnGLxT4UMlGnJV0sDa6EAA-1
Received: by mail-io1-f69.google.com with SMTP id
 r4-20020a6b4404000000b00614d5a865f7so1324391ioa.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 12:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1bo4EbpctiIg5Fh71wDUudbxUFz8wPH1RQpgQC8Mb+E=;
 b=xOPG7TjypGMpLCcfC67Wb7iCVD5zkfl8+OXotGBURSiPfO10GZsGxzH1qaAJ9W4MZ5
 xsfcXhv/fct/ZxnHVq59trMvf871GyAkDLA5oD8CIcwrbws1uduGpkTbj6Br/8UDlQBa
 647yW6bTCzxUeojARzQNM9WjSi//XAbs7+sT6n3Ygjj06IIosFOQT6yX0g5e4nbffKYd
 cI6h3aGzjcmHiIl1ONpOFV6ui8V2GiXHgykWFa+nh56Zh7gD+TuXrappcUqBYMFtKd91
 T6EcizTZCilvFSqoWCh3maSI40bAaEMWXLNN+IWv2JGuwr46H5aKKHx2Q5yjRFBwbMKn
 G9wg==
X-Gm-Message-State: AOAM530gPYOyVoSndRco+s4xQIzX13ExoGxtUgoCMXxvq0dPavhtvyP/
 mKZI22BGHxPwX0nH+KhbPYSZnQsKugtHsuFYe742OQRp0EAQKtR8aDGpsNgRfdIrIxCjcU5Dx1x
 osZsuCnV2XRefufo=
X-Received: by 2002:a6b:da11:: with SMTP id x17mr3121064iob.170.1643314260916; 
 Thu, 27 Jan 2022 12:11:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxv152UM6UztnfbywFjbHupjGQk3TGYBzmWhGaaEpsG6a8DkIzoFTKPH8fnwKg6sVLj6FxcfQ==
X-Received: by 2002:a6b:da11:: with SMTP id x17mr3121055iob.170.1643314260701; 
 Thu, 27 Jan 2022 12:11:00 -0800 (PST)
Received: from [10.0.0.97] ([24.225.241.171])
 by smtp.gmail.com with ESMTPSA id c9sm12503553ile.38.2022.01.27.12.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 12:11:00 -0800 (PST)
Message-ID: <7153eadf-3c43-b62c-aaa1-919abf0634ca@redhat.com>
Date: Thu, 27 Jan 2022 15:14:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2 0/2] hw/block/fdc: Fix CVE-2021-3507
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211118115733.4038610-1-philmd@redhat.com>
From: Jon Maloy <jmaloy@redhat.com>
In-Reply-To: <20211118115733.4038610-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jmaloy@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jmaloy@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/18/21 06:57, Philippe Mathieu-Daudé wrote:
> Trivial fix for CVE-2021-3507.
>
> Philippe Mathieu-Daudé (2):
>    hw/block/fdc: Prevent end-of-track overrun (CVE-2021-3507)
>    tests/qtest/fdc-test: Add a regression test for CVE-2021-3507
>
>   hw/block/fdc.c         |  8 ++++++++
>   tests/qtest/fdc-test.c | 20 ++++++++++++++++++++
>   2 files changed, 28 insertions(+)
>
Series
Acked-by: Jon Maloy <jmaloy@redhat.com>


