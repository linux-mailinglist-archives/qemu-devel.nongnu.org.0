Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD60260F175
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 09:49:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onxbZ-0002BM-7H; Thu, 27 Oct 2022 03:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onxbE-00027S-O3
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 03:46:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onxb0-0006LV-VX
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 03:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666856794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A/hnEgElfY7tXFJxvumr9NfQEcCPBy3XJelNczO3UqU=;
 b=QkM8G9u0kKm04NYVT3qEANZal0MgKYaqG0PlPik/M28HKI4BxAZxChRQiA+6Bfv87xSkSg
 +RytwSZQTRXAY2ICrtkvR85yct+bUwa4H1jonwoS/Bi4Eh80VcGVU16ZNDNwML2whhXehW
 b/BcB+q35l5/pZQhisnX+LEEYVpmajk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-404-WP4HGBRKOg238C3sOBS3VA-1; Thu, 27 Oct 2022 03:46:32 -0400
X-MC-Unique: WP4HGBRKOg238C3sOBS3VA-1
Received: by mail-wr1-f69.google.com with SMTP id
 e21-20020adfa455000000b002365c221b59so112579wra.22
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 00:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A/hnEgElfY7tXFJxvumr9NfQEcCPBy3XJelNczO3UqU=;
 b=NYN69B1o9qVL+kSLzyd8gGVXq4BITrOzTtnIPsWY82iwX0i+/tla2tVy1sqJZg3Lpc
 EPQSsAhtUTYPB1SZOOM2N+yQh5Amr+hiZXWelJfFaudPIalxBa7PDpz92gUyiyiegIDE
 Q3Ry0gM6p4Sc5rR/MDTXowj2lcVyh+VoZf8QoA3rrWfk+DO6Fz89ilKBQKKD99+4bADy
 oGIC5s6NgGKfZyxV7TQUhHO6svOO1etY5Lk3g32Y1VPpfe46TtuCXeKsu4UuOTOk0oIc
 5nz/H4GdKVZQUJIdc7edBtFgUtQEqMJRnwDPM4XS3kuWammr/Sy+DD441lHK6nvv14wp
 hl1g==
X-Gm-Message-State: ACrzQf3f404WB8TigybE0DJxq5l2Yt96s+vCwZfgl3bTdTcfvZ1gLTzx
 QjAn1566zZpZscqGMcz1LXWe5Tp0Wn8slp7zEjvpw/fN4d+ReqfsE+cKIno0xXDfHcIg+emgnuA
 577Bsg5oTWR9Cx7w=
X-Received: by 2002:a05:600c:4691:b0:3c6:f154:fdc6 with SMTP id
 p17-20020a05600c469100b003c6f154fdc6mr4860168wmo.195.1666856791821; 
 Thu, 27 Oct 2022 00:46:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5WyaL6lJdw0Jhw/PDs+meRgAFjUAana4LTJKwEEXDfqmSkfMja5uARqI1dqFBvRw58UyTjFQ==
X-Received: by 2002:a05:600c:4691:b0:3c6:f154:fdc6 with SMTP id
 p17-20020a05600c469100b003c6f154fdc6mr4860146wmo.195.1666856791545; 
 Thu, 27 Oct 2022 00:46:31 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-195.web.vodafone.de.
 [109.43.176.195]) by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c4f4d00b003b95ed78275sm819159wmq.20.2022.10.27.00.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 00:46:31 -0700 (PDT)
Message-ID: <8d2d7c90-288f-387f-e474-7eefe47005e8@redhat.com>
Date: Thu, 27 Oct 2022 09:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221022170350.936685-1-danielhb413@gmail.com>
 <Y1ZUsauC6F3yDuny@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] avocado: use sha1 for fc31 imgs to avoid first time
 re-download
In-Reply-To: <Y1ZUsauC6F3yDuny@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/2022 11.02, Daniel P. Berrangé wrote:
> On Sat, Oct 22, 2022 at 02:03:50PM -0300, Daniel Henrique Barboza wrote:
>> 'make check-avocado' will download any images that aren't present in the
>> cache via 'get-vm-images' in tests/Makefile.include. The target that
>> downloads fedora 31 images, get-vm-image-fedora-31, will use 'avocado
>> vmimage get  --distro=fedora --distro-version=31 --arch=(...)' to
>> download the image for each arch. Note that this command does not
>> support any argument to set the hash algorithm used and, based on the
>> avocado source code [1], DEFAULT_HASH_ALGORITHM is set to "sha1". The
>> sha1 hash is stored in a Fedora-Cloud-Base-31-1.9.{ARCH}.qcow2-CHECKSUM
>> in the cache.
> 
>> For now, in QEMU, let's use sha1 for all Fedora 31 images. This will
>> immediately spares us at least one extra download for each Fedora 31
>> image that we're doing in all our CI runs.
>>
>> [1] https://github.com/avocado-framework/avocado.git @ 942a5d6972906
>> [2] https://github.com/avocado-framework/avocado/issues/5496
> 
> Can we just ask Avocado maintainers to fix this problem on their
> side to allow use of a modern hash alg as a priority item. We've
> already had this problem in QEMU for over a year AFAICT, so doesn't
> seem like we need to urgently do a workaround on QEMU side, so we
> can get Avocado devs to commit to fixing it in the next month.

Do we have such a commitment? ... The avocado version in QEMU is completely 
backlevel these days, it's still using version 88.1 from May 2021, i.e. 
there hasn't been any update since more than a year. I recently tried to 
bump it to a newer version on my own (since I'm still suffering from the 
problem that find_free_port() does not work if you don't have a local IPv6 
address), but it's not that straight forward since the recent versions of 
avocado changed a lot of things (e.g. the new nrunner - do we want to run 
tests in parallel? If so it breaks a lot of the timeout settings, I think), 
so an update needs a lot of careful testing...

So unless someone is really committing to spend a lot of time on updating 
Avocado in QEMU in the near future, I don't think that such a fix for the 
hash algorithm will happen any time soon, and thus I think we should 
consider to include this work-around for the time being.

  Thomas


