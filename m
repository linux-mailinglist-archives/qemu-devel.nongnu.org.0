Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38E969B260
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 19:31:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT5V5-0007Hw-Ca; Fri, 17 Feb 2023 13:30:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pT5Ut-0007EM-LX
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 13:30:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pT5Ur-0007KC-1y
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 13:30:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676658611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9VOjDRuSwXRfHna+iGkGDUpgDSUg676a6AjhjuLINg=;
 b=E53TjprOGePVHKe0/2K7ZJiKb59c88P6Mh2ThoBwh54y9tAu4atEKK4bqdz6Wtf2NzHCGu
 D1SnBdVIKeKg/l3jGf8xjh/LULm3cv8BI57vFFYGxUJWVCxONz0kbNDWCCyUWTgA7jDRmK
 qgtAb7w3HZLf9Ra3UjhzvIRh3v4LxZw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-4XgOudVSOoSvD0-yQV2cYw-1; Fri, 17 Feb 2023 13:30:09 -0500
X-MC-Unique: 4XgOudVSOoSvD0-yQV2cYw-1
Received: by mail-wr1-f70.google.com with SMTP id
 u1-20020a5d4681000000b002c3f54b828bso256465wrq.21
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 10:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H9VOjDRuSwXRfHna+iGkGDUpgDSUg676a6AjhjuLINg=;
 b=Hm1du0cEWylL2EU5P4xjwJJTp3SaaQIGI0hQ3ByGfJCvyBQHkFiL2OxrMaIzimR57I
 YYdEqdXeUIX/YJ1TJxOe83hdUw4nMWql/xjeA128rZT6g3aA0VadVqVdWnB4jm6evg6D
 /qLsC8l6A/kxA8/XcdtvhefaV4Jq7Oq2j6yRQJVYDDWmi3aAuOUyLPJ2JyeQ8HTFoead
 hiC0Q/Y/yfSk/34myufDGKRpfUn02uPezqih9OsV0yMP4EHPo88jq3b9lmKHkt+f7J7t
 Y2QAUM4uOK8j+gM9FtJqMFdhLVX4cKwjtUiqPD9sOFbgiXkjI1snvPEFsbNm06GH5PkL
 3g1g==
X-Gm-Message-State: AO0yUKVA3vLY1bjzlwitBJTquUC39i+d9ZCO1KyVGN5+7G2xn5DXmQh9
 jnlhHURPUDDozRlq8Thoa+MfatXQmqvcphZmhQTEeBtG6fGx5l2XIPoyT3h59J2lFM1YZ7vrOx3
 akD87AK5KOTmoKTI=
X-Received: by 2002:a5d:6150:0:b0:2c3:f6ff:292c with SMTP id
 y16-20020a5d6150000000b002c3f6ff292cmr211446wrt.55.1676658608814; 
 Fri, 17 Feb 2023 10:30:08 -0800 (PST)
X-Google-Smtp-Source: AK7set8RI1ATCl7XjEjqK55cYGWwzCEt4+LnMSxst0rZweW1HcCb6YTvik16gWLwmxWp9EmBMFXioA==
X-Received: by 2002:a5d:6150:0:b0:2c3:f6ff:292c with SMTP id
 y16-20020a5d6150000000b002c3f6ff292cmr211433wrt.55.1676658608562; 
 Fri, 17 Feb 2023 10:30:08 -0800 (PST)
Received: from [192.168.8.104] (tmo-110-21.customers.d1-online.com.
 [80.187.110.21]) by smtp.gmail.com with ESMTPSA id
 x8-20020a5d54c8000000b002c5503a8d21sm4887375wrv.70.2023.02.17.10.30.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 10:30:07 -0800 (PST)
Message-ID: <b2b54f1a-735c-acab-bd75-3d8cce9fb34d@redhat.com>
Date: Fri, 17 Feb 2023 19:30:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Claudio Fontana <cfontana@suse.de>
References: <20230217132631.403112-1-thuth@redhat.com>
 <Y++X2XtyfJEIzcln@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] docs/about/build-platforms: Refine the distro support
 policy
In-Reply-To: <Y++X2XtyfJEIzcln@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 17/02/2023 16.06, Daniel P. Berrangé wrote:
> On Fri, Feb 17, 2023 at 02:26:31PM +0100, Thomas Huth wrote:
...
> I'm also not so comfortable dropping the only version of SLES that we
> explicitly target, when we don't know when their new major release
> will arrive.

Let's hope that the next major version will show up at least five years 
after the previous one ... but what if it takes many more years? Do we want 
to support very old long term distros for "almost forever"?

Also, should we maybe at least limit the time to 5 years? Otherwise, if 
openSUSE 16 gets released 5 years after v15, we have to support v15 for 7 
years in total due to the "two more years" rule...

> If we allow compilers, libraries to be bumped, then someone stuck on
> RHEL-8 has a significant task to build their own toolchain/libraries
> in order to work with QEMU still. If we only allow python modules to
> be bumped, the solution is just a pip install / virtualenv away.

Honestly, being a Python ignorant, I'm more comfortable with "./configure && 
make && make install" instead of messing up my system with pip like I did in 
the past ... but I guess it's ok if it is properly done automatically under 
the hood with a venv ... I'll get used to it ;-)

  Thomas


