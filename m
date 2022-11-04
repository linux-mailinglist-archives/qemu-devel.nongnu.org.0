Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40199619759
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 14:17:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqwZF-0003Ue-BD; Fri, 04 Nov 2022 09:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqwYv-0003SB-7l
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 09:16:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqwYs-0007XV-KZ
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 09:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667567801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XyqrqtUya/XkJZ3EbsPOtGnEUVPvx637ZOpOse6nicY=;
 b=U4K4w7cpPNejxHkdzTbA8xmpJShYCZYSSnirn1foqreuJEBaxB3aSz+JVVRmA8ozcghb51
 6nA3us+NMGhcFu9tafCYJV/PsJ8iNMl7OSZlacKqFmybqauxSsi1xdJQV7gbgJmpiZ/Pfc
 fZz+u5vx3qwnWD9i4G7F9jjPhoRJ2Uo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-511-DxLKmcQMM6OC9j5DB7HcEg-1; Fri, 04 Nov 2022 09:16:33 -0400
X-MC-Unique: DxLKmcQMM6OC9j5DB7HcEg-1
Received: by mail-ej1-f69.google.com with SMTP id
 hd11-20020a170907968b00b0078df60485fdso3258801ejc.17
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 06:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XyqrqtUya/XkJZ3EbsPOtGnEUVPvx637ZOpOse6nicY=;
 b=gXEo0pZk3rFe3dkJpYwb8ZJVvc4U3XXIsS97YuykyUMROx/a28zu/omfDVnNcsq2JU
 b2RgwvIpITxTAk6m3ah9bkXJDelJZb64nY/++V1U2XbJ/6rOKTG2x17es7IMjq4ASFfU
 k68TylZk2yqCSXNCucZfZtV4XxsyZsYvp+CG4NQcf6qAxp7f3BFwQLD6CzzRqvrVetoP
 0lNnqR0Dml1eK/iOF6wRR9R2TczmXgrwGUm19ipm8cgee5FHTHMRgKv+MocrEqakF+Zt
 Bms/KVk8cKElSNHVatkXZpLO7vbM2/NlsbK7spyiKJFZOMHASh2VefyrgdRmioEpUVv4
 eeZw==
X-Gm-Message-State: ACrzQf0Pt6l67ZghpkoKmITPy5rCrJ9tsZx6GNbXOxPPm5kL0FTsIcik
 FBYv7aOSjsvIvOCk9cMlWtwoWHO9B3cxUkt5djlqURGkEFayfhGU0dHEDVrsPHXtgzJQ8uNecuV
 n6CyM/mQdzT6X0wA=
X-Received: by 2002:a17:906:7313:b0:78e:c2a:a3fa with SMTP id
 di19-20020a170906731300b0078e0c2aa3famr33105463ejc.581.1667567791006; 
 Fri, 04 Nov 2022 06:16:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6TUcGnrdfbM1UpH9j8sqp04evagu9YhqRCWEXyc+tM22lM/ufIEH+xb7xr3K3Oqld2aVHyLQ==
X-Received: by 2002:a17:906:7313:b0:78e:c2a:a3fa with SMTP id
 di19-20020a170906731300b0078e0c2aa3famr33105433ejc.581.1667567790670; 
 Fri, 04 Nov 2022 06:16:30 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5?
 ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.googlemail.com with ESMTPSA id
 g7-20020a056402320700b004614fd33789sm102259eda.18.2022.11.04.06.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 06:16:30 -0700 (PDT)
Message-ID: <3980e02f-95dc-aa5d-3236-d36f366b4a5b@redhat.com>
Date: Fri, 4 Nov 2022 14:16:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 0/9] Still more coroutine and various fixes in block
 layer
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221104095700.4117433-1-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221104095700.4117433-1-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/4/22 10:56, Emanuele Giuseppe Esposito wrote:
> This is a dump of all minor coroutine-related fixes found while looking
> around and testing various things in the QEMU block layer.
> 
> Patches aim to:
> - add missing coroutine_fn annotation to the functions
> - simplify to avoid the typical "if in coroutine: fn()
>    // else create_coroutine(fn)" already present in generated_co_wraper
>    functions.
> - make sure that if a BlockDriver callback is defined as coroutine_fn, then
>    it is always running in a coroutine.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


