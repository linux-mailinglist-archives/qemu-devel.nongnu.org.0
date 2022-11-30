Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B60063D3BC
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:50:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0KfC-0003vQ-Kb; Wed, 30 Nov 2022 05:50:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0Kf9-0003vF-Ot
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:50:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0Kf7-0006Zk-6V
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:49:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669805396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0sW6HB4+D9KvyAgYpSglaIipfIHrUB4FY2xxDRIn9SY=;
 b=Sr2FhL69VWOEfq+qeXUH0r5VAtSrFwdpyFJXcvgPLolGtfqUs4UjRsWXCLmu9QxT1MAilS
 HgZzVyVLaGSYMP8qTUsVmWo0BMXHISBx5OsLbV4U+E6Qm3KOh5+oQAYNlZrsU8BcCdVGVz
 LzVMO92fSaWMfImMMRC8ZyknKXIOdoU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-307-kzAb4iYJPZSlTF4cOqwvLA-1; Wed, 30 Nov 2022 05:49:54 -0500
X-MC-Unique: kzAb4iYJPZSlTF4cOqwvLA-1
Received: by mail-wr1-f69.google.com with SMTP id
 d4-20020adfa404000000b002421ca8cb07so1963596wra.2
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:49:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0sW6HB4+D9KvyAgYpSglaIipfIHrUB4FY2xxDRIn9SY=;
 b=Uny7eGVMrqJrf2jd95QVY0Sywg/nWH5ZM7U1T4indVaRsVU/MKKqRxZ15iHdUHLPcn
 3XhewQpaknt/vR+50xyNpU8ch6OQBekdLFx5CYBOZQAYuFWeY8rRCMqV40eCyRWD/kQL
 LIrUk3VOAob3d3yqpCS6QRRpTV6NlKBQdTDv6j3LrLanPrHnEUb5HR9OTo/7cV4uaZAn
 Hizc2b1JExHvf7Mpg7jCTyLCR/aGjisYcPL1MxjnGzsWv3fYYQQjenDvm3XvHwp5qVZk
 B91U0GDKU9VgQKv42gZLhUGVVN5ruYmT3YlG7dodyFb6bleCsjoAnuZeiYEGY0Bj+60f
 r/Lg==
X-Gm-Message-State: ANoB5pmhU2Xrp9a5BkWjazgmK5BZEThpPTA7Q2cQTLByz2UcWTi5vhRA
 TFMgWpM4JvCnzVtu3w7tOsnVGHI/Oi+VkT2QeIWSpTFE7SVaeNkF0s9CwLhQJmqYTXHmW5OwZT6
 wJI18K46Wpl2mXCE=
X-Received: by 2002:adf:e589:0:b0:242:6a0:74b3 with SMTP id
 l9-20020adfe589000000b0024206a074b3mr16126441wrm.380.1669805393152; 
 Wed, 30 Nov 2022 02:49:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7RqasSWIPij0NeftWU0qFMo+JO5RADAUhC80exE1rZcfpFxfoXeRlegVP8nc6BiDDdB6hRCw==
X-Received: by 2002:adf:e589:0:b0:242:6a0:74b3 with SMTP id
 l9-20020adfe589000000b0024206a074b3mr16126425wrm.380.1669805392943; 
 Wed, 30 Nov 2022 02:49:52 -0800 (PST)
Received: from [192.168.8.102] (tmo-073-221.customers.d1-online.com.
 [80.187.73.221]) by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c2cb000b003c6bbe910fdsm6037167wmc.9.2022.11.30.02.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:49:52 -0800 (PST)
Message-ID: <4bf10f82-03a4-42e6-a66b-e78e182a83a8@redhat.com>
Date: Wed, 30 Nov 2022 11:49:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth
 <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20221128092555.37102-1-thuth@redhat.com>
 <Y4TqEDYs+T4z6PX/@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 for-8.0 0/5] scripts/make-release: Decrease size of the
 release tarballs
In-Reply-To: <Y4TqEDYs+T4z6PX/@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.258, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 28/11/2022 18.04, Daniel P. Berrangé wrote:
> On Mon, Nov 28, 2022 at 10:25:50AM +0100, Thomas Huth wrote:
>> Our release tarballs are huge - qemu-7.2.0-rc2.tar.xz has a size of 116
>> MiB. If you look at the contents, approx. 80% of the size is used for the
>> firmware sources that we ship along to provide the sources for the ROM
>> binaries. This feels very wrong, why do we urge users to download such
>> huge tarballs while 99.9% of them never will rebuilt the firmware sources?
>> We were also struggeling a bit in the past already with server load and
>> costs, so we should really try to decrease the size of our release tarballs
>> to a saner level.
> 
> The main reason for shipping the source in the tarball was to
> guarantee license compliance for anyone who is distributing
> qemu release tarballs, including ourselves.
> 
> Splitting off the firmware source, but not the firmware binaries,
> means people are now at risk of not complying with the license
> but failing to provide complete and corresponding source.
> 
> Technically the license requirement is only critical for GPL
> licenses ROMs, but as good practice we do it for all our ROMs.
> 
>> So let's split the firmware sources into a separate tarball to decrease
>> the size of the main QEMU sources tarball a lot (which should help us
>> to safe a lot of traffic on the server).
> 
> With my distro maintainer hat I would rather QEMU ship neither the
> ROM source, nor the ROM binaries.
> 
> Still the binaries are convenient for people doing their own QEMU
> builds from source.
> 
> How about shipping two distinct options:
> 
>    qemu-x.y.z.tar.xz          (QEMU source only)
>    qemu-bundled-x.y.z.tar.xz  (QEMU source + bundled ROM binaries + ROM sources)
> 
> though I'm not sure how much of an impact that will have on the download
> traffic - depends what is causing the traffic.
> 
> Another option is
> 
>    qemu-x.y.z.tar.xz        (QEMU source only)
>    qemu-roms-x.y.z.tar.xz   (bundled ROM binaries + ROM sources)
> 
> though this is slightly more inconvenient for users, and there's the
> risk they'll use new QEMU with old ROMs.

Maybe that would work for distros, but I don't think that these are good 
options for the average users who just want to download and recompile the 
latest version of QEMU on their own.
I assume that most users don't have an environment with cross-compilers or 
for running things in a container, so I think they still want to use the 
pre-built binaries. Thus, if you bundle the binaries along with their 
sources, people will still continue to download the big tarball and we 
haven't gained anything.

So do you really really think shipping the binaries in the main tarball is a 
problem? Honestly, it's not a problem for us as long as we publish both 
tarballs together - and if someone wants to mirror the main tarball to their 
webserver and fails to mirror the rom-sources tarball, too, it's their 
fault, not ours.

Anyway, what about splitting the binaries into a separate tarball, so we 
would have three tarballs:

     qemu-x.y.z.tar.xz               (QEMU source only)
     qemu-roms-x.y.z.tar.xz          (ROM binaries)
     qemu-roms-sources-x.y.z.tar.xz  (ROM sources)

That should make it hopefully obvious that the two qemu-roms* tarballs 
belong together. Would that be OK for you?

  Thomas


