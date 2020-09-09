Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4099D262FDB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 16:36:35 +0200 (CEST)
Received: from localhost ([::1]:39286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kG1D8-0004W7-Ai
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 10:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kG1CA-0003jU-UW
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 10:35:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20379
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kG1C9-00064f-0i
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 10:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599662131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RclWMaGhxZ2SpCHqsWa3uxIqIeaQFmUJHZywrM88bl0=;
 b=fYoOb20inAEEXxwiqMvG23ybF+JjgwR04uvFquXrSyr9SgmO3xzgRCvt0jA2ENqqUbuE3L
 KiRRk44ICtcDeTWo7qQCAogGOEIh2MDyfKP2br59ojq+S4whbbJLwsFYHxlHfWw52ceSX/
 8wTpyjFCKMiPpIZcEhWHwS8SH3z7QcA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-LljQQW1ANmKo0eKtXuayJg-1; Wed, 09 Sep 2020 10:35:29 -0400
X-MC-Unique: LljQQW1ANmKo0eKtXuayJg-1
Received: by mail-ej1-f70.google.com with SMTP id w27so1370090ejb.12
 for <qemu-devel@nongnu.org>; Wed, 09 Sep 2020 07:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RclWMaGhxZ2SpCHqsWa3uxIqIeaQFmUJHZywrM88bl0=;
 b=Q2OZ23Rv38kYgt0/u3ZGniRlhcGdSKX7A8ay0RbyXqOdPjlzNBtb9qCchmKaicJ5w4
 zOCQTiuqVMhOllbcypPd+8BTdYJtq3Qd1619paTZ5wRrT0d38lanb7w4m9Ryt6RbiWx0
 YuXH8BNB7SNlamV3PyYtLajNpgqMp6UgDvmH1oEgz+CMkAKATGmUjLtVQIuK23hUfHy3
 msCE5gtMsCq9e8/DyYBMsuufIzvwxJ4Q5T9FWwMDZ/Ozo0vQDYxQZPObHLFIXKIHdsCX
 1edkuAfwaeFus+14Dhq5lM5um29G2mum7+Y2dhYwH+Hzezwq2WtMiZh5JaMXt+Mg1/P/
 TnWQ==
X-Gm-Message-State: AOAM533MViC/vYNOxcyKFLmPqhe7h7D0gflwI0+c5mlI3lCp21pi9UJg
 DurDZPu5GUoF7w6tj0WOdJmW8Gb4PzG9fdBE0eOrdiPoIUo1m4tqv3EgI8btvOQL1NfqVXLBeZF
 qZgLydVwHQSGwlbY=
X-Received: by 2002:a50:f1d1:: with SMTP id y17mr4162581edl.231.1599662127687; 
 Wed, 09 Sep 2020 07:35:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcuslIYNTTYxwntkP+HE9bvvTDN2WEN4mOhIQuLgVDJUG4oiZso+9l4UBjxMhHuSA6z/UPoQ==
X-Received: by 2002:a50:f1d1:: with SMTP id y17mr4162556edl.231.1599662127428; 
 Wed, 09 Sep 2020 07:35:27 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id m4sm2747302ejn.31.2020.09.09.07.35.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 07:35:26 -0700 (PDT)
Subject: Re: Meson can't recover from deletion of generated QAPI file(s)
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <87pn6vw2he.fsf@dusky.pond.sub.org>
 <ff7ef6e4-254a-b171-22bf-c5cca4945160@redhat.com>
 <26432e3f-2b22-4966-ebea-8be448636fbb@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2d49cdbb-41e2-ae1d-79cd-3a05678e9b87@redhat.com>
Date: Wed, 9 Sep 2020 16:35:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <26432e3f-2b22-4966-ebea-8be448636fbb@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:13:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.576, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/09/20 15:35, Claudio Fontana wrote:
> On 9/9/20 3:06 PM, Philippe Mathieu-Daudé wrote:
>> Maybe related:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg736135.html
>> and later:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg738777.html
>>
> 
> My use case is this:

Hi Claudio,

unlike Markus's, your issue is a genuine meson.build bug.  It should be
fixed like so:

diff --git a/tests/meson.build b/tests/meson.build
index 998e4c48f9..721641afbb 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -223,7 +223,7 @@ foreach test_name, extra: tests
     src += test_ss.all_sources()
     deps += test_ss.all_dependencies()
   endif
-  exe = executable(test_name, src, dependencies: deps)
+  exe = executable(test_name, src, genh, dependencies: deps)

   test(test_name, exe,
        depends: test_deps.get(test_name, []),


Paolo


