Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912526E5CF4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 11:06:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pohHd-0008Or-EN; Tue, 18 Apr 2023 05:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pohHb-0008OL-8O
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 05:05:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pohHZ-00063M-L8
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 05:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681808748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N9WJOmCq/LQBr63uPHRTkZoCSZeLbrUGpPEmumqICoo=;
 b=Ry3GfGeRiWsfeLEgA282Hvd6ph4UEolMwXrugmOojvOJ+czGc2M30dEz9kNT6I9iQDSufK
 01z/klhCrpPi50CU11oASBUq9ykBJzSOuIK5PlL7VFHxJeW+DXAJSt2shgHQItDuRpidvP
 P4L2RSSMQUvC9j7SRCjbp0CfqSTrE+w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-Zi50vU6zMFeXg4zLSBVhiQ-1; Tue, 18 Apr 2023 05:05:46 -0400
X-MC-Unique: Zi50vU6zMFeXg4zLSBVhiQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 k24-20020a508ad8000000b005068d942d3fso5178057edk.2
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 02:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681808746; x=1684400746;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N9WJOmCq/LQBr63uPHRTkZoCSZeLbrUGpPEmumqICoo=;
 b=JPLXympd6iNGcps+C/WnSQYihkXridMJIAFzNUlboUwaUM4h5ottmQWeHJMjdzNo3w
 nI7xQ2CoCGByiSnCxd2fBbMMjZe0WINs4fq/reVX839tECruR0K63zjSLvhNctjTiQag
 kYS2w+bauBL9xi7zkD1aWxUCxOR6CklE6cZQ/cavxRbMbkGVObDQS23VRkadmiMzvtVZ
 O5ofgzlCnd6bJRRERZUFWKlRep7/nlnYCHXQKukVHbmrqjzouqDNpS3sBBloSpedHRLP
 Z2veSsY80hUMcKgMevaweWuHYU4rcqXMk1xNdXNgJmBdbe1UTCglsSwTSv8nIQU+IEsi
 6/mg==
X-Gm-Message-State: AAQBX9ePcd2DNDPZRA/H3x/uvqCpjKaRrkTay4oV1FblfRMMqcVSRmjG
 X7sl0qfz2sTBVeqqA8ruFzhZSzMiQSs/FJ/owFJWNiOOBbx2z14va56GzplWztFxs1Vo7w720UO
 ywmXgvtUzahO4EUM=
X-Received: by 2002:a17:906:3a93:b0:94e:c142:dfb1 with SMTP id
 y19-20020a1709063a9300b0094ec142dfb1mr9431505ejd.61.1681808745917; 
 Tue, 18 Apr 2023 02:05:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350a7u8xurI0qBYaHyQq41mpVot/wAjXJIRHeO+7CvmYerMFtPo+hr+Sngadxsv4G/J++6Sf1zA==
X-Received: by 2002:a17:906:3a93:b0:94e:c142:dfb1 with SMTP id
 y19-20020a1709063a9300b0094ec142dfb1mr9431481ejd.61.1681808745593; 
 Tue, 18 Apr 2023 02:05:45 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 r12-20020a170906c28c00b0094f2f0c9ed9sm4371210ejz.167.2023.04.18.02.05.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 02:05:45 -0700 (PDT)
Message-ID: <da66fcea-3166-a147-58d1-ce58f3c061f0@redhat.com>
Date: Tue, 18 Apr 2023 11:05:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/2] tests: lcitool: Switch to OpenSUSE Leap 15.4
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>, Peter Krempa <pkrempa@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <cover.1681735482.git.pkrempa@redhat.com>
 <a408b7f241ac59e5944db6ae2360a792305c36e0.1681735482.git.pkrempa@redhat.com>
 <20230417163258.65586555.olaf@aepfle.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230417163258.65586555.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/17/23 16:32, Olaf Hering wrote:
> Mon, 17 Apr 2023 14:46:54 +0200 Peter Krempa<pkrempa@redhat.com>:
> 
>> Switch the dockerfile to 15.4.
>
> Given that Leap 15.5 is essentially done, please skip this meanwhile
> stale version of Leap.

The reason to do this update is to be able to update libvirt-ci, if 
needed for other reasons.  Even though 15.4 is already almost-obsolete, 
it doesn't hurt to switch CI to it.

Paolo


