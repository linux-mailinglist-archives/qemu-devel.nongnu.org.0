Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D25480B08
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 17:02:17 +0100 (CET)
Received: from localhost ([::1]:42174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2EvY-000552-6x
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 11:02:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2EsB-0003CK-RL
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 10:58:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2EsA-0006hG-4o
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 10:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640707125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGcJBwijnT6lsW2cmcpAHJRXtPZdbsBzyN25kTDyf1U=;
 b=HV47v1LPfGNb4YOZhvjot/In3MvjffP1diaXwiR6PUeC1meoMmTgyMZv+E3uHrnnG9bEq7
 +66xquNhjJhGjH4YX4OfsBb6rgZQ4/BnO5kjVXn47fG0w8jY0QFaClp66WL2xfjt+UqW92
 AhLL/xcTyeCSeTLLoS9sc1j5u87Sk+M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-QFF0dGwHNWqAWqTqqOtz8Q-1; Tue, 28 Dec 2021 10:58:44 -0500
X-MC-Unique: QFF0dGwHNWqAWqTqqOtz8Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 w25-20020adf8bd9000000b001a255212b7cso3991049wra.18
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 07:58:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZGcJBwijnT6lsW2cmcpAHJRXtPZdbsBzyN25kTDyf1U=;
 b=o3GwLIZRfbXO0JnsohdDAbJKW3knC2kIvd9clfS1xQcSmZqNp5At+DcS9IIndz7zvy
 5LPkcztBwTwX0/AOYxqns8HgnYdlj3v69UmltL8SRjvIC8p7JLZOMfuxdbv3redNO/ZQ
 eGlo+BF4OLyuhu5GPGh3MFelhYGwRQgEC/HZgap3Bsw/1clqA4lAaZrMIGkjz9FbQy6i
 Egv7mR8jeSioxyBZv7zANN1o1YapRSsXWS84uKj77X60gfNiMKeJLS8Bg2le/+1d0Svo
 HMtadQae6t6JTUVwmMNc4sp9QVW3tjYYFrd9mBs9y1qHQNRJy93T1BHwyKTlUckk1Zgv
 sfdQ==
X-Gm-Message-State: AOAM530rCnE9DUty73lkMKYO0XRAKLp4iH8e7PFHalwNlmwg3WvF1LeV
 7maiBLb5nyZ2HU0SZnXdqelbnrKwQEP8dE71yLxuq9DzIvdV8kiaLaqR49YJ/kwwzfKMXQVPwVj
 W8rDausrxTWgQ/ms=
X-Received: by 2002:a5d:6289:: with SMTP id k9mr16550978wru.501.1640707122942; 
 Tue, 28 Dec 2021 07:58:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5zibTLV3NqAoHpLmbvj3BhTyddKxP700LEJ/XGEyQgFCgA/515LP5mN/Ltk7QGDVjxlMhqA==
X-Received: by 2002:a5d:6289:: with SMTP id k9mr16550961wru.501.1640707122821; 
 Tue, 28 Dec 2021 07:58:42 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id j14sm18618460wrn.88.2021.12.28.07.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 07:58:42 -0800 (PST)
Message-ID: <240917f6-f56d-c2ad-39d4-84e0b7530290@redhat.com>
Date: Tue, 28 Dec 2021 16:58:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 07/14] MAINTAINERS: Self-recommended as reviewer of
 "Machine core"
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-8-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211228092221.21068-8-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.573,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/21 10:22, Yanan Wang wrote:
> I've built interests in the generic machine subsystem and
> have also been working on projects related to this part,
> self-recommand myself as a reviewer so that I can help to
> review some patches familiar to me, and have a chance to
> learn more continuously.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


