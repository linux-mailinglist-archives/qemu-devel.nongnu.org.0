Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072E4671CC4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:57:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI7z1-0005U0-Bg; Wed, 18 Jan 2023 07:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI7yv-0005Oq-Hr
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:56:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI7yt-0001iZ-QG
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674046554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p7k7uE8mK99/oxf+NaNwiq6gK6QlZkUwsmd4hcmknPg=;
 b=cNd2ljJIZHGbtqdNtPn5i9JcsfVgc54seA1XWH+Rn/2eA0RD8j35K7rZkq5enLXyHkVRSc
 7UOcEDeuLMoc68Uw5oo+34owVxzblSATzZxAQWl9Bq2akf3AIBZm+DmYV1ZwJuxrBM0Wmx
 39k8fzmMohIzru5jOSL3Gt1rzQhJEhA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-202-AeNWLLmVNq-woA9jDYc9ng-1; Wed, 18 Jan 2023 07:55:53 -0500
X-MC-Unique: AeNWLLmVNq-woA9jDYc9ng-1
Received: by mail-qk1-f199.google.com with SMTP id
 az6-20020a05620a170600b0070689de396dso4687688qkb.18
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 04:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p7k7uE8mK99/oxf+NaNwiq6gK6QlZkUwsmd4hcmknPg=;
 b=1MOMflbYc/2VYq8sK18AuJJXdaSmm5fhkukRa8E8jImfjKrEPYf75peoapj57hfQx9
 3xnTLvlbO+5eZyLDLJsBZgq82q8cvpzVsqeApxl7gCmo8KWVlLTQeojwjCTLwQKy7reD
 02GBD0Xb6K+xGboMmrH3m4DVMCKZOxR9vimhWOXwWnnkmhbxOBWkiQa/PKYeZzu8i4m2
 Pf9YUMHJb0pGPYN9P8e4SfV87vBA1qNLgttnghiCE654tc7RpP1rvlBRC2FZM6IBEmYa
 zZZP6I2Cb1iuIrXMhhGH3iZpc109oZ4TStG2s3E0T3/J4ydhkwkVoEn6gjY7gi8XRgOU
 MUsA==
X-Gm-Message-State: AFqh2krOE3sVKh3Ps4sGdWGrisyBnG7fGe7+v7pKxEhTvLkrNNg4v4p9
 HHBsLnETdqDnDSWMKqzLnUpJs6XEKaZqbexBqKLT10UudSlYTv/R9teFEC8egy05HPT9uxy4bbP
 UsgH2vRLUPcXNxdc=
X-Received: by 2002:a05:622a:6008:b0:3b6:3a8f:d743 with SMTP id
 he8-20020a05622a600800b003b63a8fd743mr8952022qtb.66.1674046553208; 
 Wed, 18 Jan 2023 04:55:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsh4UfRl0hS0T72bGawOJBx3DFXGWJzyz+8IXc9mWgmGHeCY/M+hVQLgdpTt7sV3aSlplmbTQ==
X-Received: by 2002:a05:622a:6008:b0:3b6:3a8f:d743 with SMTP id
 he8-20020a05622a600800b003b63a8fd743mr8952002qtb.66.1674046552984; 
 Wed, 18 Jan 2023 04:55:52 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-5.customers.d1-online.com.
 [80.187.99.5]) by smtp.gmail.com with ESMTPSA id
 r19-20020ae9d613000000b0070617deb4b7sm11026208qkk.134.2023.01.18.04.55.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 04:55:52 -0800 (PST)
Message-ID: <9231dd89-355e-3aa2-c4c7-b462af0ff67f@redhat.com>
Date: Wed, 18 Jan 2023 13:55:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] tests/qtest/qom-test: Do not print tested properties
 by default
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20221215153036.422362-1-thuth@redhat.com>
 <CAFEAcA_EUNGFzLh8d9631WZR+-bR8oVynBs6=FV_kmLWNx2bSg@mail.gmail.com>
 <CAFEAcA80=+dXd5uDfSd8-sAPwbrYMqaPKhLGt7w8vh3MiQwLCQ@mail.gmail.com>
 <43415e4f-c6bf-31c6-3a2e-cea86c511223@redhat.com>
 <Y8Z8CJoFyxB9uHqU@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Y8Z8CJoFyxB9uHqU@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 17/01/2023 11.44, Daniel P. Berrangé wrote:
> On Tue, Jan 17, 2023 at 11:32:42AM +0100, Thomas Huth wrote:
...
>> - Instead of doing "cat meson-logs/testlog.txt" in the CI
>>    scripts, we switch to "tail -n 1000 meson-logs/testlog.txt"
>>    instead
> 
> Tail requires that it has consumed the entire doc before it prints
> anything. This in turn implies that the test suite has finished.
> IOW, we'll get zero output if it hangs IIUC.

I was referring to the places where we are dumping the testlog.txt like this:

  make --output-sync -j`nproc` check
    || { cat meson-logs/testlog.txt; exit 1; }

See .gitlab-ci.d/custom-runners/* or .gitlab-ci.d/windows.yml for example. I 
assume it should be ok to switch to "tail" instead of "cat" there?

  Thomas


