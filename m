Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B043B5EDC02
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:49:25 +0200 (CEST)
Received: from localhost ([::1]:39586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odVZ6-0004AC-LX
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odSTs-0002co-3C
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:31:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odSTo-0002M9-Pe
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:31:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664353904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0tnte8GB47Iaiscih8tMy/1EAlW98mgSqI0mKkVXnQA=;
 b=cHtyrp8bWoUGerjnzoPaUsGCjqJjmzqqoeRSzvzm+CCh2xkpE7wix0+lUnPmTRYuZzsCMe
 Y/hWmEW7YISO3/Eu1DZqaJ1sn0Cc0i8ET6KN7rpRlzjVYlWVUtBX7jFHoMWX/VPUp2Rzui
 XnezM+h4igIWG9vaVu1uuNqgfUQidfA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-A22bmuoWOXKgyi3jWuokLA-1; Wed, 28 Sep 2022 04:31:42 -0400
X-MC-Unique: A22bmuoWOXKgyi3jWuokLA-1
Received: by mail-wm1-f72.google.com with SMTP id
 fc12-20020a05600c524c00b003b5054c70d3so6787304wmb.5
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 01:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=0tnte8GB47Iaiscih8tMy/1EAlW98mgSqI0mKkVXnQA=;
 b=XrA5MM5sBSj7xH/qRxGZSzMk3GyHt91fT67qKC8cJlFLuaB3Jyr8HwSpmZHnFmGC/x
 6Bx4xK3/agSagRGEudH9QchgtytiS/gai0xSL8fJqJ98viP5ouB6y4H2AZLe/cVqSNuL
 NsSTKGKfVAqZPF8v4nrIU4IFRBsESQPGDI4yEfrPxmJo9aGmkDniJzrioVj7rovePSI5
 DUo3uUpaDHTTxvnIu1DMKB8Rmy08UkSluBeFcstequyTu3jUONn5vY/uqdmYxlFU+7jd
 +G0Y5SGXH8phdmQkm3F6pDSmwqIZsJ2TYhkKEJEvNCHfuNqgJZLyQI+e64FPhMwlLxFZ
 jxNg==
X-Gm-Message-State: ACrzQf2pL1bey32upTW5hTNSSN65hWik9ZnBGy4Bh+fzKR3oOKLAJzpA
 vOFYsBqJCR/zZeJnpJlyakea6acK5vxrM0F3LcuP5U0rOC1ZERNCvsPhrp0vVU0jX7wYtwEhZ/q
 Q1sshWx9InaZ1ejw=
X-Received: by 2002:adf:fb10:0:b0:22a:f1d8:18d2 with SMTP id
 c16-20020adffb10000000b0022af1d818d2mr19764068wrr.483.1664353901754; 
 Wed, 28 Sep 2022 01:31:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM69xWzhclj0dfUAoO5sKk7Pci98ZfhgaGFfuL21Xqq+eNrCHjxp4IHONLNWaVD20dpn8usPNw==
X-Received: by 2002:adf:fb10:0:b0:22a:f1d8:18d2 with SMTP id
 c16-20020adffb10000000b0022af1d818d2mr19764049wrr.483.1664353901501; 
 Wed, 28 Sep 2022 01:31:41 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-89.web.vodafone.de.
 [109.43.176.89]) by smtp.gmail.com with ESMTPSA id
 m35-20020a05600c3b2300b003b47b913901sm5768433wms.1.2022.09.28.01.31.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 01:31:40 -0700 (PDT)
Message-ID: <2a5c6c18-e0b1-aaf8-78fa-5a12396fef87@redhat.com>
Date: Wed, 28 Sep 2022 10:31:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, jsnow@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
References: <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
 <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
 <20220917162606-mutt-send-email-mst@kernel.org>
 <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
 <YzK1VzoU05vnlxY4@redhat.com>
 <CAARzgwxpm-tF3OwK95gHe+9_6qBebiqPFLug-59RUt85aCnuZQ@mail.gmail.com>
 <YzLN3Y1pNO8SVn9M@redhat.com>
 <CAARzgwx+ZitnYKvmkDGA1+Aq3_yPQFSs5GfTvGaAeNmHxUSNOQ@mail.gmail.com>
 <CAARzgwwLXp9rDkQ4OTW2TUgnp_XDyMTXf6OhsKE9qAL1HTuMRQ@mail.gmail.com>
 <YzMahUpNtsas18rN@redhat.com> <20220927172044-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220927172044-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/09/2022 23.21, Michael S. Tsirkin wrote:
> On Tue, Sep 27, 2022 at 04:45:09PM +0100, Daniel P. Berrangé wrote:
>> On Tue, Sep 27, 2022 at 07:35:13PM +0530, Ani Sinha wrote:
...
>>> Alright, .gitlab-ci.yml is produced and the pipeline succeeds.
>>> However, the question still remains, where do we keep the generated
>>> artifacts?
>>
>> The following link will always reflect the published artifacts from
>> the most recently fully successful CI pipeline, on the 'qemu-bits'
>> branch, and 'qemu-bits-build' CI job:
>>
>> https://gitlab.com/qemu-project/biosbits-bits/-/jobs/artifacts/qemu-bits/download?job=qemu-bits-build
>>
>> Tweak as needed if you push the CI to master branch instead. This
>> link can be considered the permanent home of the artifact. I'd just
>> suggest that the QEMU job automatically skip if it fails to download
>> the artifact, as occassionally transient infra errors can impact
>> it.
> 
> This just means once we change the test old qemu source can no longer use it.
> Why is this a good idea? Are we so short on disk space? I thought CPU
> is the limiting factor?

FYI, we'll soon be short on disk space, gitlab plans to introduce storage 
limits:

  https://about.gitlab.com/pricing/faq-paid-storage-transfer/

  Thomas


