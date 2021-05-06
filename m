Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11236374FB8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 09:03:02 +0200 (CEST)
Received: from localhost ([::1]:35274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leY2G-0003s3-VN
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 03:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1leY0Y-00038k-97
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:01:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1leY0S-00078T-9x
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620284466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=usKfPff/4OkH62lX5lQIr91wInFsZmtiBgmhvM7kkMw=;
 b=ePxz+ZpyrTMkRo00ZDV8nSS5jQdoOQ53b7QsT3Ek8J7ZTWJCAAQA8A/85fBGjvMcFRMUHY
 DC1JM5eZflmbFppQruuYVZOAh3s+dHrT6F4Y/HJGVhVZGBBtj7y/U7AzBKmbAIMOwR4a9R
 TGdn/TZcLXNZTZWQ79qZV+QQL6FOB9s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-71RgRgjJPCCzsUgrtuTk4A-1; Thu, 06 May 2021 03:01:02 -0400
X-MC-Unique: 71RgRgjJPCCzsUgrtuTk4A-1
Received: by mail-wr1-f70.google.com with SMTP id
 n10-20020adfb74a0000b029010e1a98fb84so1810438wre.0
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 00:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=usKfPff/4OkH62lX5lQIr91wInFsZmtiBgmhvM7kkMw=;
 b=Ix98G57QfVH5JA6CQ9YVDcWXrowk7tml6YcDlvufQte4+fL7PQHt8Lqo+As/QIKDfe
 ud5ne0yVlGF/McYEQp9OrEfVbXJJBBRw7ZhFdyJ21gLW+p0ieaoKKAW/7caSHxmE1Vjk
 fY4dPqbPVdYqcOgN+MaJPILxHAlU8gdHnvxFnKuk2D9ws899imyziwSP3DqY768Kf1sl
 SEPR9AOi0nN7bzYhf+5oydQjlcjgDaL7R+HaVGGj0zI+oRzWhKFZghKdeiWEjmHiChXp
 t/LXmxYjGohqK3lsHNZ6pzRoBmrDBp/ZJq2uS3sve+sPkX9k25Fa9SWKg6XvPewlkPnU
 J4+A==
X-Gm-Message-State: AOAM531OqZTRY+2LYuW839nYSCzA4ABYxHxERGizAzx9FQSyyXj0Wohq
 u/dUPplD2A9SwW6Cj7bg04c5DGD+cusWReZtv7LdwEiI9WeKLW/EFVTe0Dg0PnYx+byQMlQ18X8
 z9P9mENQ+pPjlletL34ZYEP4oH4RdQZiUIg70mOIEHzXmQwUDpNYSHNcfiLEU/Nw=
X-Received: by 2002:adf:d1c4:: with SMTP id b4mr3147839wrd.301.1620284461619; 
 Thu, 06 May 2021 00:01:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztb1tOlasdVpGtdij2dBsE3/OwCJQNOuz7n/Ct7ltArZ4iCUezt3QJsesXVkqaAiUpvx8EQA==
X-Received: by 2002:adf:d1c4:: with SMTP id b4mr3147814wrd.301.1620284461405; 
 Thu, 06 May 2021 00:01:01 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83394.dip0.t-ipconnect.de.
 [217.232.51.148])
 by smtp.gmail.com with ESMTPSA id c8sm8429498wmr.48.2021.05.06.00.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 00:01:00 -0700 (PDT)
Subject: Re: [PULL 00/10] Gitlab-CI, qtest, moxie removal and misc patches
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210503104456.1036472-1-thuth@redhat.com>
 <CAFEAcA8k1DnOFT+5pjQ4ytene3asVDKB7TUOZgGhucTp_ypz2g@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <66206f67-f3c8-eb1c-fd5d-8c7555fe5316@redhat.com>
Date: Thu, 6 May 2021 09:00:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8k1DnOFT+5pjQ4ytene3asVDKB7TUOZgGhucTp_ypz2g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/05/2021 20.06, Peter Maydell wrote:
> On Mon, 3 May 2021 at 11:45, Thomas Huth <thuth@redhat.com> wrote:
>>
>>   Hi Peter,
>>
>> the following changes since commit 53c5433e84e8935abed8e91d4a2eb813168a0ecf:
>>
>>    Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210501' into staging (2021-05-02 12:02:46 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/thuth/qemu.git tags/pull-request-2021-05-03
>>
>> for you to fetch changes up to 8f582fa290e5d5d0a00db23eaf1ab1bb3d3ae68d:
>>
>>    util/compatfd.c: Replaced a malloc call with g_malloc. (2021-05-03 11:40:40 +0200)
>>
>> ----------------------------------------------------------------
>> * Removal of the deprecated moxie target
>> * Replace some YAML anchors by "extends" in the Gitlab-CI
>> * Some small improvements for using the qtests
>> * Some other small misc patches
> 
> This fails to build as an incremental (not from-clean) build:
[...]
> ../../meson.build:1291:2: ERROR: Failed to load
> /home/ubuntu/qemu/default-configs/targets/moxie-softmmu.mak: [Errno 2]
> No such file or directory:
> '/home/ubuntu/qemu/default-configs/targets/moxie-softmmu.mak'

D'oh! I think I can work-around the problem with a patch like
this on top:

diff a/configure b/configure
--- a/configure
+++ b/configure
@@ -1686,6 +1686,11 @@ fi
  
  for config in $mak_wilds; do
      target="$(basename "$config" .mak)"
+    if [ "$target" = "moxie-softmmu" ]; then
+        # This is a work-around to make incremental builds pass after
+        # moxie-softmmu has been removed. It can be removed later.
+        continue
+    fi
      if echo "$target_list_exclude" | grep -vq "$target"; then
          default_target_list="${default_target_list} $target"
      fi
diff a/default-configs/targets/moxie-softmmu.mak b/default-configs/targets/moxie-softmmu.mak
new file mode 100644
index 0000000000..23fd596b66
--- /dev/null
+++ b/default-configs/targets/moxie-softmmu.mak
@@ -0,0 +1,2 @@
+# This is just a dummy file to avoid that incremental builds are failing.
+# It can be removed as soon as all builders have been updated.

Does that look acceptable? If yes, I'll respin my PR with that
squashed into the moxie patch.

  Thomas


