Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380EE2ED304
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 15:50:53 +0100 (CET)
Received: from localhost ([::1]:58716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxWcl-0000Xl-QX
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 09:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxWbh-0008S7-LM
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:49:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxWbd-0004q3-1R
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:49:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610030978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hL/f9Pr/jxNok6OUtCDsWn8bFQbzDWPvEPuebD8tWEw=;
 b=Zm3+5h6LAVvNasM3HuwEldNSlegyy64edQbdEtCWr7hQVBh/ymceTYoSfa+tSuJ7x9WnxG
 vssPQr2SS6sN26OfPJHIpD9Fez73asI/oAhf8FltrfAZhX/UHxpxjXVRBZjTFfnGFs45Zl
 0lQLsSI7KmynofQqMhBgNpWdJ/R/84o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-nHSgDQZTNXatz-eCXnpOrw-1; Thu, 07 Jan 2021 09:49:34 -0500
X-MC-Unique: nHSgDQZTNXatz-eCXnpOrw-1
Received: by mail-wr1-f71.google.com with SMTP id 4so2743151wrb.16
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 06:49:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hL/f9Pr/jxNok6OUtCDsWn8bFQbzDWPvEPuebD8tWEw=;
 b=HtQLLDhJypMyKdyz7UAakWvsLMVNdHwv94v2ny6IiasCLDr91zwrNaErXANlf+btdX
 0Ba/PT9DIL0K8NP1xQYIEMY7Q9lkykdZMDNXmqf+tUuZqaTjpIKGccuLL+QF2NXdjJVM
 GgWPgW7hvJSeyK2dVZT6AGNyFG2knIO+ZCDCOwWH7Y/usehTp/D8UejhT3hgrqKF0Uuz
 X2pa7Kvzdim+5zA9j12IbClPMHPmPZG8lAs5WweoYLbpCzbOl5pAVqE0xf428TlBbiI4
 KPFn14PBeh5QEQHcQSZ8RmBld437j1BCsU5SKYylZduJGz+1oi1O49pwZj7wKewgNj1/
 FKSg==
X-Gm-Message-State: AOAM531pFnbCm3gtEHBQ2UGauCbMD8AvpZTmK0PCFk6B5QbDJ7UMpkQz
 68ErWMvhow8r4pxv9yrv6Hqd3oXtXcZS5gSLXowYYu1bHPq9r3ywoKC4ToL8KM+2Ylby2ZxEwcx
 b4X0GQUN1qGgJR8SmwYq/9G0p5L5agX9alEWzk8Ae8bEBBMyCgKu9yVCoTTxmaNimUGM=
X-Received: by 2002:adf:a3c1:: with SMTP id m1mr9738773wrb.28.1610030973105;
 Thu, 07 Jan 2021 06:49:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHTE7awt4ydUovAFa0UcTA0hR8csEz8heo0hKGtTZsiqRWtA81utVBJ0ftqgtsYgYneaPPQw==
X-Received: by 2002:adf:a3c1:: with SMTP id m1mr9738755wrb.28.1610030972792;
 Thu, 07 Jan 2021 06:49:32 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n189sm8089433wmf.20.2021.01.07.06.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 06:49:32 -0800 (PST)
Subject: Re: [PULL 50/55] virtfs: convert to meson
To: Bruce Rogers <brogers@suse.com>, qemu-devel@nongnu.org
References: <20201221144447.26161-1-pbonzini@redhat.com>
 <20201221144447.26161-51-pbonzini@redhat.com>
 <36869fd5f001f4eab10539839395504fd9fb5f7d.camel@suse.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <24d591d5-fb37-f77a-d8ab-3112dfe35439@redhat.com>
Date: Thu, 7 Jan 2021 15:49:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <36869fd5f001f4eab10539839395504fd9fb5f7d.camel@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/21 14:58, Bruce Rogers wrote:
> I noticed that for me, this broke the building of virtfs-proxy-helper.
> I've not yet figured out what the fix should be, but thought you'd want
> to know.

Possibly:

diff --git a/fsdev/meson.build b/fsdev/meson.build
index 7dd1cc9bfb..65455a179e 100644
--- a/fsdev/meson.build
+++ b/fsdev/meson.build
@@ -8,7 +8,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
  ), if_false: files('qemu-fsdev-dummy.c'))
  softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)

-have_virtfs_proxy_helper = have_tools and libattr.found() and 
libcap_ng.found() and 'CONFIG_VIRTFS' in config_host
+have_virtfs_proxy_helper = have_tools and libattr.found() and 
libcap_ng.found() and have_virtfs
  if have_virtfs_proxy_helper
    executable('virtfs-proxy-helper',
               files('virtfs-proxy-helper.c', '9p-marshal.c', 
'9p-iov-marshal.c'),
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 450af3e51c..b8e19bbc81 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -199,7 +199,9 @@ qos_test_ss.add(
    'virtio-serial-test.c',
    'vmxnet3-test.c',
  )
-qos_test_ss.add(when: 'CONFIG_VIRTFS', if_true: files('virtio-9p-test.c'))
+if have_virtfs
+  qos_test_ss.add(files('virtio-9p-test.c'))
+endif
  qos_test_ss.add(when: 'CONFIG_VHOST_USER', if_true: 
files('vhost-user-test.c'))

  tpmemu_files = ['tpm-emu.c', 'tpm-util.c', 'tpm-tests.c']

Since CONFIG_VIRTFS does not exist anymore.  Sorry.

Paolo


