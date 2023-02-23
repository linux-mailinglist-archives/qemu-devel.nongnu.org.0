Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E076A0CD3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:25:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDSY-0002vr-A8; Thu, 23 Feb 2023 10:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVDSV-0002p6-PG
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:24:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVDSU-0001VA-2Y
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:24:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677165873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9fp7T4hRHYqxm0iAtn2qlz/3VjZJCVwP+6ac253+p/I=;
 b=Lgbh6DuRzk0IqQ48iykhw6mxpUaks84HbyLzYacVyRn2Bo+8HE7KyGyeou32ylshOh9HLm
 42BiiFhU4sGTYr8qc0cfqrNerP9WhKyD5nmtb4FHlKtByx9oiWUrcm9V+KQOAnJ3LsVhXJ
 //QaNW7PN4eYPIn2OT74TLwAWPY+lP4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-427-CT5e6_TQOTSk5lmWNisM-g-1; Thu, 23 Feb 2023 10:24:29 -0500
X-MC-Unique: CT5e6_TQOTSk5lmWNisM-g-1
Received: by mail-wr1-f71.google.com with SMTP id
 l4-20020a5d6d84000000b002c54aaa28dcso2415428wrs.16
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:24:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9fp7T4hRHYqxm0iAtn2qlz/3VjZJCVwP+6ac253+p/I=;
 b=X6DjXy0nXqRmkIRfahH+HapJVdhV9juIwGitazdW0xDxcZlGLi2bK65nY+X0u51Lf+
 Xg0g0Q3/h0MVaR2939fYreM42KFjBdwvVFmVlL1+kaaRNL9ltQrPTm73aEuODkfM9Wyn
 JknQL5yB22LeIjdooZIOcsDkmIVjRHpC4TL/Qu7kRHfhcm4MAovwmx6oiBa8ysg2C1qN
 lZH21xd+5lwiMncYx9Ztyq8YachE990NMyLB9R8Uv3F2kYb7UqkX4iEcuL9/FoCDGJV4
 kfsgfyAkqqsCgcms3rq3D8jX/53qoaowiX4dYThv/0pL0pSO1yO1gTNUvBH1brj/oEba
 k43A==
X-Gm-Message-State: AO0yUKV9f+7jBUxul/CrMJhPFjMkuA8Dy4fn1SZ3HM/6mVgTke4VbxLi
 VVpQjSS/tdSPv8iVTwdc6kuKkPIxtWhzyXdyukwdWnE1RmxOJD/MTTNcTM754nrqZNDPmauUGFh
 Cdkg5l6GnVZUsa+4=
X-Received: by 2002:a5d:6042:0:b0:2c5:803a:1f86 with SMTP id
 j2-20020a5d6042000000b002c5803a1f86mr10996203wrt.67.1677165868640; 
 Thu, 23 Feb 2023 07:24:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/lNiNBl1RXXwQMluXQSq1OwKZpm+RhpGznouOjRYak/ipLDIIQqKf0WOZObKnFEiuP21EUDQ==
X-Received: by 2002:a5d:6042:0:b0:2c5:803a:1f86 with SMTP id
 j2-20020a5d6042000000b002c5803a1f86mr10996185wrt.67.1677165868364; 
 Thu, 23 Feb 2023 07:24:28 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 v17-20020adff691000000b002c70e60eb40sm2881674wrp.11.2023.02.23.07.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 07:24:27 -0800 (PST)
Message-ID: <32d6e42e-40aa-c3ff-6659-29187cde6ec5@redhat.com>
Date: Thu, 23 Feb 2023 16:24:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230207201447.566661-1-thuth@redhat.com>
 <20230207201447.566661-6-thuth@redhat.com> <Y/dx4SHKDfBMTcQm@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 5/5] gitlab-ci.d: Build with --enable-fdt=system by
 default
In-Reply-To: <Y/dx4SHKDfBMTcQm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 23/02/2023 15.02, Daniel P. Berrangé wrote:
> On Tue, Feb 07, 2023 at 09:14:47PM +0100, Thomas Huth wrote:
>> By using --enable-fdt=system we can make sure that the configure
>> script does not try to check out the "dtc" submodule. This should
>> help to safe some precious CI minutes in the long run.
> 
> If our containers have the system dtc installed, I'm pretty
> surprised that configure is choosing to use dtc submodule.
> I thought we won't touch the submodule at all if system dtc
> was sufficiently new.
> 
> IOW, do we have a logic bug in configure making it incorrectly
> use dtc submodules ?

Yes, it sounds weird at the first glance, but it's really this way (look for 
the "Simpler to always update submodule, even if not needed" comment in the 
configure script): The problem is that the initial submodule handling is 
done in configure already, so you have to know the needed submodules there 
already. But the check for usability of libfdt is only done in meson.build, 
so you already need to have the submodule available there in case the 
system's libfdt is not usable.

It could maybe cleaned up somehow, but OTOH, I'm still hoping that we can 
rid of the dtc submodule in the near future, so it's maybe not worth the 
effort to spend too much time with this right now.

  Thomas


