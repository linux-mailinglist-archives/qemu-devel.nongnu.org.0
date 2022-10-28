Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8379A610BBC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 09:57:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooKEB-0006Km-Kf; Fri, 28 Oct 2022 03:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooKDs-0005SG-Ep
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 03:56:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooKDq-0000Ys-VV
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 03:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666943768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K5jAMQXlJifAdaAhKvsmTfFR0VRbWW4vFRRjHuizDy8=;
 b=cAIrCEmdDCstvBtQ/g5M6bi7SLv/O9D/UlUfdo8AudWvkXZKnQANBa6/MkAAM7fgwFL9pL
 s+vpvYxhL78aYOeXbqsiQz/ND3DzHW81zJ68sUUytVZZLgIqgNbidXbVSaiUGCEIpuOeeu
 04Y6uMR83EJRawBPygC/E6t8JI7SdFU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669--DcqS6NxO8C_2eMfxWDGHQ-1; Fri, 28 Oct 2022 03:56:07 -0400
X-MC-Unique: -DcqS6NxO8C_2eMfxWDGHQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 d23-20020adfa417000000b002364a31b7c9so1047380wra.15
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 00:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K5jAMQXlJifAdaAhKvsmTfFR0VRbWW4vFRRjHuizDy8=;
 b=m+ms4FkRrMqeKqQtWx3paqfCpYVYgTUJm7TgAbTJIj2Yuw6WMlcyMHHJO3bnyKBwyN
 vaJc6l1FIRFs/0SGXby6tyHHjUqVMUC+jBjpMka/6BMUi03ewqcJUebJqKtmlhwUDYh8
 StonUtp1xda1pc8LQuJVTbmmIWf9DDhEI+hsjY2LZQhBpiChE9z9LKTyidhaWI4U5PhK
 4AfLADRWBGojaMdKdCFndAEwK00dojXp8R3Hx7mQZusPbucxWC6t1rIGmk6LbfzIes0f
 5hAnHXm4AH22fATcq1QdGGPoFXBS60QUfzOv8tZVK+3OFmhY/H6+7A8F+7RvwRpRsBkI
 9s1Q==
X-Gm-Message-State: ACrzQf18x6AgdpeqsD90/9mCFWYxSVaO0Bo9BTD+1v2LKRqhenGsOjI4
 hDtLGJ+s7BPaVDMJK7eiHInsK5+x0HDhayMfg+M9PUz3Xc8VBBXerHifx18nEIX5HocXeBkIjlr
 or97PPszl7n6gjSM=
X-Received: by 2002:a05:6000:1843:b0:236:770b:1af with SMTP id
 c3-20020a056000184300b00236770b01afmr14857632wri.486.1666943765855; 
 Fri, 28 Oct 2022 00:56:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6xC0amTvAoOfftIhwJtxjg49IJNCRn+jI5d3Vcol0A/V/s/9aIH3aBy7gGtQxBJxVucbYW3w==
X-Received: by 2002:a05:6000:1843:b0:236:770b:1af with SMTP id
 c3-20020a056000184300b00236770b01afmr14857621wri.486.1666943765633; 
 Fri, 28 Oct 2022 00:56:05 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-14.web.vodafone.de.
 [109.43.177.14]) by smtp.gmail.com with ESMTPSA id
 j3-20020a05600c1c0300b003b4ff30e566sm12739240wms.3.2022.10.28.00.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 00:56:05 -0700 (PDT)
Message-ID: <daa22f82-1c8b-8d25-88a2-dc522bd28831@redhat.com>
Date: Fri, 28 Oct 2022 09:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 08/11] tests/qtest: libqos: Do not build virtio-9p
 unconditionally
Content-Language: en-US
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
 <20221028045736.679903-9-bin.meng@windriver.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221028045736.679903-9-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/2022 06.57, Bin Meng wrote:
> At present the virtio-9p related codes are built into libqos
> unconditionally. Change to build them conditionally by testing
> the 'virtfs' config option.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Thomas Huth <thuth@redhat.com>


