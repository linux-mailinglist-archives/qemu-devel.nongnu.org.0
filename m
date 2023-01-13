Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5D06694FD
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 12:06:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGHry-0004ds-La; Fri, 13 Jan 2023 06:05:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGHrw-0004dh-Az
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 06:05:08 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGHru-0004gg-8T
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 06:05:07 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so761396wml.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 03:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MAK7A+fVZOFCxLDhRbInL3WE0iZvFWuDW0gU6+y6aHI=;
 b=tDbYR0NUqRSTT3p7Yz2bq5kQFEStBz79DtZftrIqnCHNZzTkuk9CHnLeIgad3OstJ1
 zApaXbDSdOXLmhyxNV8Fcz7k5U5bvXlziUCSR8ykyaHZCi+hHfk38oxfhofcw5KeGDGq
 TMx22w+XTKdfrtupvdqyPdle0RdmfI0sQknvo6ScNaiRBvEFeb1fPQ9aYPb1Lt2s/2nd
 /AO6z0m9t9lGxAzN5Gew2nOQZ2hUMAPSO+JOjb/fmINLf9aAGV9ZFJNOO7yXMYHh/Yqg
 F1GS9EjrYBuIBmSq89Qb0ipsoVVa+SmbYyZ9+BgY3hSYI946FpIf/Y0ufNRrYmbIoaql
 1CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MAK7A+fVZOFCxLDhRbInL3WE0iZvFWuDW0gU6+y6aHI=;
 b=wgZ0wjdSR2aKkYwfypA8Hi6MyvFTj7aF9G1VfirqGEnmQ/3YQ33jDbjkN9caaGChV+
 D0Jid/05K6Xrc4Asob4Z0inupXuiVJ2L3VEJcSidXoNry/1IDE6V2fWYD0zrf8c4zxrO
 3WeMnmnI464Mf2A/PgjTH5ZkNtVEJ6O5rb/DgkZwKt4VhxZTOn/xbbDmFsmqsDLqkmv7
 Cx+ezyujIGVg651+VaxVCu0FdQsGAdpvZlP3BLtnjdLtufYWTd+muvecFqARMc5LaCZz
 /+KPjnUxoejZePn63jGEFvgKgmoM2ZqaeZyXiv4lEpRokFOZNt1lqefzSu/7KzHUuows
 8oFg==
X-Gm-Message-State: AFqh2koXnJ2unFhD7abNrPANqhU/giRwFrypZJVVIK+0lVpj2Ki4hYzI
 aIyF1jgWoqgNzt1SEV/l3hVZOA==
X-Google-Smtp-Source: AMrXdXu94jY+7zIoNzRCdeAeV6f18X+hMt92LFBpQ6QdTIHU1EusEsm/wHhzjw8B+LJl3VrKkdY3Kw==
X-Received: by 2002:a05:600c:3d1b:b0:3d0:6a57:66a5 with SMTP id
 bh27-20020a05600c3d1b00b003d06a5766a5mr56548908wmb.0.1673607904230; 
 Fri, 13 Jan 2023 03:05:04 -0800 (PST)
Received: from [192.168.95.175] (13.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.13]) by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm4837989wmr.8.2023.01.13.03.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 03:05:03 -0800 (PST)
Message-ID: <df446205-d3bc-5c1c-eb3c-bb475590e713@linaro.org>
Date: Fri, 13 Jan 2023 12:05:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] tests/vm: Update haiku test vm to R1/Beta3
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>
Cc: qemu-devel@nongnu.org
References: <20220216154208.2985103-1-kallisti5@unixzen.com>
 <2d548e30-11eb-6f64-b082-25e5ff546309@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <2d548e30-11eb-6f64-b082-25e5ff546309@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 14/12/22 11:47, Thomas Huth wrote:
> On 16/02/2022 16.42, Alexander von Gluck IV wrote:
>> ---
>>   tests/vm/haiku.x86_64 | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
> [...]
>> @@ -48,8 +48,8 @@ class HaikuVM(basevm.BaseVM):
>>       name = "haiku"
>>       arch = "x86_64"
>> -    link = 
>> "https://app.vagrantup.com/haiku-os/boxes/r1beta2-x86_64/versions/20200702/providers/libvirt.box"
>> -    csum = 
>> "41c38b316e0cbdbc66b5dbaf3612b866700a4f35807cb1eb266a5bf83e9e68d5"
>> +    link = 
>> "https://app.vagrantup.com/haiku-os/boxes/r1beta3-x86_64/versions/20220216/providers/libvirt.box"
>> +    csum = 
>> "e67d4aacbcc687013d5cc91990ddd86cc5d70a5d28432ae2691944f8ce5d5041"
> 
>   Hi Alexander!
> 
> The Haiku VM started again to fail, I'm getting these error messages now:
> 
> Encountered problems:
> problem 1: nothing provides haiku>=r1~beta4_hrev56578_4-1 needed by 
> glib2_devel-2.75.0-1
>    solution 1:
>      - do not install "providing devel:libglib_2.0"
> problem 2: nothing provides haiku>=r1~beta4_hrev56578_31-1 needed by 
> gettext-0.21.1-2
>    solution 1:
>      - do not install "providing devel:libintl"
> problem 3: nothing provides haiku>=r1~beta4_hrev56578_31-1 needed by 
> curl-7.85.0-2
>    solution 1:
>      - do not install "providing devel:libcurl"
> problem 4: nothing provides haiku>=r1~beta4_hrev56578_31-1 needed by 
> gnutls-3.7.8-1
>    solution 1:
>      - do not install "providing devel:libgnutls"
> problem 5: nothing provides haiku>=r1~beta4_hrev56578_4-1 needed by 
> glib2-2.75.0-1
>    solution 1:
>      - do not install "providing devel:libslirp"
> 
> Does it need an update to a newer version of Haiku?

Per https://www.haiku-os.org/guides/daily-tasks/updating-system/ we
can keep the box image in sync with its repo by using:

# pkgman add https://eu.hpkg.haiku-os.org/haiku/r1beta3/$(getarch)/current

I will try this:

-- >8 --
diff --git a/tests/vm/haiku.x86_64 b/tests/vm/haiku.x86_64
index 29668bc272..9cbb46cfc1 100755
--- a/tests/vm/haiku.x86_64
+++ b/tests/vm/haiku.x86_64
@@ -112,2 +112,4 @@ class HaikuVM(basevm.BaseVM):
          # Install packages
+        self.ssh_root("pkgman add 
https://eu.hpkg.haiku-os.org/haiku/r1beta3/x86_64/current")
+        self.ssh_root("pkgman full-sync")
          self.ssh_root("pkgman install -y %s" % " 
".join(self.requirements))
---

