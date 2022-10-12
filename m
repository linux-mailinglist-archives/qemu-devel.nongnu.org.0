Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447305FC713
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:15:47 +0200 (CEST)
Received: from localhost ([::1]:43442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oicWP-0007fO-UF
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oicS1-0004Pt-UA
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:11:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oicRy-0002Qy-Vv
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:11:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665583869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cdw+aTCA95Mo2wZDG2m4FfTuGA7UFlTWbhnQRxnSfC8=;
 b=BqczTg2sVUsrSiTuplmMRYznUAilSLmPN9VlSG0NOxp3UvhP6V2xXw5iDGPTjfr2OFHBt4
 ucHqHKWvB6MgSSCw7bt0usJOsref/yqjil8X1ojgWxMXdbgADf+IMMZTMUIHwiLisbn90Q
 zfv/v6p/1fSCf6mwBJaYEq53fDJSmIk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-125-MvUFzIO0P2GJpJY9JS7wkg-1; Wed, 12 Oct 2022 10:11:08 -0400
X-MC-Unique: MvUFzIO0P2GJpJY9JS7wkg-1
Received: by mail-ed1-f71.google.com with SMTP id
 j20-20020a05640211d400b0045bd72f05d6so8467915edw.11
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 07:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cdw+aTCA95Mo2wZDG2m4FfTuGA7UFlTWbhnQRxnSfC8=;
 b=Byaq8VcjBMtlS2RSiTxYFhYe6n8Qqfq3ZiwTAP8ZY1M/MkwlWLPDuog+BQdmIsHzNp
 yWuccDJft/XZwA6DGgi+IOumVyilUm27kJRZ7CJDBJpmfsNZIVDCBYIEzeppFvIbJMrz
 Lp6mx6Ts5fk/zPHeNYtgRxfTzwGleQEDUzqGAZvUspZ/dZNaf4LjJN8eNVkZwzYMi3n6
 l7POoWSP9LaTQwETLdyZFLors4aGGMM2UNDKx294HECDTIqYFXONWa3g4mEorWPoEl3D
 Oev0zJgf6GuucY/UjwzCZTqVrlr8ppACWCq9w+c6RbTBxQx+1n0WWgsTk+Oy7xL9XURm
 ilrw==
X-Gm-Message-State: ACrzQf2i4xnjT0nHMAiQn/2f59Yi018srMuGrdXj4XBQv5RUdlcdYQuK
 oC3xJLQEA4npsO9lyZXSjjG80N8gh4HYrVudFPRVp+KBDGqjFM8mf3RSRrNxxChbLgfiiAg5Msx
 Jve78pIc20xbLA8Q=
X-Received: by 2002:a17:906:ee89:b0:73d:70c5:1a4e with SMTP id
 wt9-20020a170906ee8900b0073d70c51a4emr22265651ejb.683.1665583867301; 
 Wed, 12 Oct 2022 07:11:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4bSdr/1zNzEJglPvQWzikfgZZOAxGsCgul7+JvfS6ay8c/ugASZVEsRA9UmaKjq6T0D2BVAQ==
X-Received: by 2002:a17:906:ee89:b0:73d:70c5:1a4e with SMTP id
 wt9-20020a170906ee8900b0073d70c51a4emr22265626ejb.683.1665583866966; 
 Wed, 12 Oct 2022 07:11:06 -0700 (PDT)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id
 ig1-20020a1709072e0100b0078dd2f9357fsm1332831ejc.89.2022.10.12.07.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 07:11:06 -0700 (PDT)
Message-ID: <b30292a6-7508-5bc9-ae7f-1a7d4e3ea23a@redhat.com>
Date: Wed, 12 Oct 2022 16:11:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] build: disable container-based cross compilers by default
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20221012090855.359847-1-pbonzini@redhat.com>
 <878rllqlq5.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <878rllqlq5.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.528, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 10/12/22 14:17, Alex Bennée wrote:
>> Container-based cross compilers have some issues which were overlooked
>> when they were only used for TCG tests, but are more visible since
>> firmware builds try to use them:
> We seem to have dropped our gating somewhere. Previously if a user did
> not have docker or podman on their system none of the container stuff
> would run.

It's still there:

container="no"
if test $use_containers = "yes"; then
     case $($python "$source_path"/tests/docker/docker.py probe) in
         *docker) container=docker ;;
         podman) container=podman ;;
         no) container=no ;;
     esac
     if test "$container" != "no"; then
         docker_py="$python $source_path/tests/docker/docker.py --engine $container"
     fi
fi

I think what's happening is that podman is there but there's no support
for rootless containers, so "podman run" fails.

Paolo


