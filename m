Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A42114D9A3E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:19:57 +0100 (CET)
Received: from localhost ([::1]:53164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU5DY-0006JD-OQ
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:19:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU57R-00055n-3N
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:13:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU57O-00076i-R4
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647342800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s5Tzi3pfoeaxtPsoFltDF8SY8Q0fBVWlg4SBSj9OyFQ=;
 b=O87aXYw9r7tZUoecHSZqCJ1Y6WQKLaEisJ4fHYRR/5Vnv3r7h1GtztPc2opKAVLasiZh0o
 Nf356eG7vqbO0zpio5JpHxwuG3OCE/i+ptQsB0fuyo+PC9KdJzRAe4Z76n4ZVJUKgO1fKd
 UJ7BPGy7UcEc1oTjMyKOncUmbIuCkUQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-9lTgXW-xPyOjEiVtmFRYIw-1; Tue, 15 Mar 2022 07:13:19 -0400
X-MC-Unique: 9lTgXW-xPyOjEiVtmFRYIw-1
Received: by mail-wm1-f72.google.com with SMTP id
 f24-20020a1c6a18000000b00388874b17a8so1026957wmc.3
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 04:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s5Tzi3pfoeaxtPsoFltDF8SY8Q0fBVWlg4SBSj9OyFQ=;
 b=eEHAhx3rY/GbPZq259seyzdwoPp2JfxP4EmLCUGM0baOgFlshJrbk1bUGUMyywJ76Y
 53n4qWHaE/TbPmb22cJaC0ZpIIoLOb08xhqdjYpCT8dT7IfFTe22JiWMzaQA3jD6pran
 Px0aXgfOwOgV4m83YiCD6yjhIfm8GeqgvF+bEUwGLXNHSX0zEyOUsFFaOa7V4i7pRp36
 0BQf5HKOIr8UhbAAbkH4p43/pAOXqUNoX8AjVbESN+OaVxCZLzFCqXS6ov5oDhh5qidu
 M0TaCP5P19oyT2YXwK2xKfDCRUefEaZrT/541Z7V4hBknISZ4YIxa+MKBu1mCSUVCRqY
 CaWQ==
X-Gm-Message-State: AOAM5326sqrUSnr0SoptNvgjdjuerx0h85PODEe6gha3Pa0q2zoyRmgp
 NezOrm5Ir+IouJpymVZM5/RArV8i4+IBXFvG/OUI9bsL9oCEImRIpzcTxWm1lAjV4IVSbraBv8i
 CGoe9uMagNWn3qCo=
X-Received: by 2002:a7b:cf30:0:b0:389:89bd:6d32 with SMTP id
 m16-20020a7bcf30000000b0038989bd6d32mr2946785wmg.12.1647342797935; 
 Tue, 15 Mar 2022 04:13:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx52ca5faGMQ0j6TCZdL2c65R+PeQOvC7fJAHPGD6z9aBjdkNEVKsFZqhm2FgGB6waqzKSRjQ==
X-Received: by 2002:a7b:cf30:0:b0:389:89bd:6d32 with SMTP id
 m16-20020a7bcf30000000b0038989bd6d32mr2946766wmg.12.1647342797730; 
 Tue, 15 Mar 2022 04:13:17 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c511300b00389c3a281d7sm3480891wms.0.2022.03.15.04.13.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 04:13:17 -0700 (PDT)
Message-ID: <93d1e0a6-01f2-af15-d43b-0767f8ec4c30@redhat.com>
Date: Tue, 15 Mar 2022 12:13:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH-for-7.0 v3] softmmu: List CPU types again
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220314140108.26222-1-philippe.mathieu.daude@gmail.com>
 <2334bd32-0494-37e1-e0ec-7ccb48928c0d@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <2334bd32-0494-37e1-e0ec-7ccb48928c0d@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/2022 12.11, Philippe Mathieu-Daudé wrote:
> Hi Paolo,
> 
> Could you take this patch?

I'm planning a PR for today ... I can add it there ("-cpu help" also does 
not work on s390x, so I dare to say that it is related) if Paolo does not 
plan a PR for rc0.

  Thomas


