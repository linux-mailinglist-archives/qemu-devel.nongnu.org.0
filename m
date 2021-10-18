Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B364325BC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 19:57:47 +0200 (CEST)
Received: from localhost ([::1]:60028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcWtN-00088F-O3
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 13:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcWqx-0006dO-P9
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 13:55:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcWqt-0008QG-Hm
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 13:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634579710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2KED4Z+86Ds1aGSVhem32nHzly/kZWwR+2lQyaP6G1c=;
 b=F5OGw91lP5i+ICPXaHiyBT426EVstrGh9mz/eN3+Ef6ZDjVmzp4rEoM4Qp1UsuBvsWD6B7
 F9fa7unvcjiarSwnxixVXZ3q0VoMZ56eU6Z5uTPucYIotm2IyeecOjzeNW0WkjcWSnJ7mo
 ZIjGO0owGUxhlR84uCmHSDmNsEDJy+0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-reQG818iNICiG6_hHi1D2g-1; Mon, 18 Oct 2021 13:55:09 -0400
X-MC-Unique: reQG818iNICiG6_hHi1D2g-1
Received: by mail-ed1-f71.google.com with SMTP id
 d3-20020a056402516300b003db863a248eso15074034ede.16
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 10:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2KED4Z+86Ds1aGSVhem32nHzly/kZWwR+2lQyaP6G1c=;
 b=lZ70rPffJ1fo3swziKklTewVXdjYlgYA+EDl+M+4e7o+4z19SwqSfGvARJEFTVk9wm
 biu4huNVdVL2h4zdasmXiRQxDxkbeMY01tdds850CvioD5vysbDK5tn2TUiDMGPzLjHR
 3qQKzPDtELWfNdRcPsxDrwC+ZZWJA37Qc99dE75kUoEgoHpKixRYap9pNkwtcdWjoRqv
 ma+2ZN9FQRlddFH509obyfZBGid6mq8xdTejRq6awwIwxgfoRvhGMrn+WrDnPEf8FtAV
 oJ16zgaDloIjZuBKfQj+whSiTElOHkTHxZbXq0+OrroMsnIiB87y8ao5RSNcNfW6rQIw
 lwxA==
X-Gm-Message-State: AOAM531u9nwpEX2/TcQEodXM37cp9hDjJXe+qqK1eLYk9sf9BsueGfeN
 EKXOLY+7wNEg+k7AVeE7tgX9IH5XopVbP2QLthhWRX6j8f0nnw6Lt12tLt2VyADOYTW8IyiQZqr
 8nxM6U/w4j6klyeo=
X-Received: by 2002:a17:906:3784:: with SMTP id
 n4mr31627494ejc.129.1634579707993; 
 Mon, 18 Oct 2021 10:55:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpyC0gV3FuBkfoQwg7bmrV/6NyomRCSct+sJkd2r6CbonH5O1LZgvHCI0jLN5ECfZXaYwiew==
X-Received: by 2002:a17:906:3784:: with SMTP id
 n4mr31627468ejc.129.1634579707778; 
 Mon, 18 Oct 2021 10:55:07 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q14sm9122271eji.63.2021.10.18.10.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 10:55:07 -0700 (PDT)
Message-ID: <e6b6d66a-e056-47dd-6b27-219a342a8138@redhat.com>
Date: Mon, 18 Oct 2021 19:55:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH 0/4] Replace custom test harness with "meson test"
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211015100718.17828-1-pbonzini@redhat.com>
 <310bb057-00f4-d5be-e855-775690a723a1@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <310bb057-00f4-d5be-e855-775690a723a1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, marcandre.lureau@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/10/21 11:51, Thomas Huth wrote:
>> * CTRL+C will only interrupt the longest running test.  Pressing
>>    CTRL+C repeatedly three times (which you would likely do anyway,
>>    that's how things work) interrupts the whole run
> 
> I tried this, and while hitting CTRL-C multiple times brought me back to 
> the shell prompt, the remaining tests kept getting started in the 
> background instead of getting stopped ... something is still fishy here, 
> I think.

Ok, I checked that out.  Looks like CTRL+C magic and "make -j" are 
incompatible. :/  So this will have to wait a bit more, but in the 
meanwhile people can already use "meson test" if they want.

>> * Right now "make check-block" only does a single test run just like
>>    "../tests/check-block.sh", but it would be possible to add the 
>> thorough
>>    suite to "meson test --suite block" as well.
> 
> The output of the iotests is also not optimal yet... when running "make 
> check SPEED=slow", the iotests are run multiple times with different 
> target image types, but each run prints the same "▶ 1/1 test 001   OK" 
> etc. to the console, so it's hard to say which target type  is currently 
> exercised. Would it be possible to include the target image type here, 
> e.g. something like:

Yes, that's trivial:

diff --git a/tests/qemu-iotests/testrunner.py 
b/tests/qemu-iotests/testrunner.py
index 3ef14af1fa..45debc1928 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -163,11 +163,11 @@ def test_print_one_line(self, test: str, 
starttime: str,

          if self.tap:
              if status == 'pass':
-                print(f'ok test {test}')
+                print(f'ok {self.env.imgfmt} {test}')
              elif status == 'fail':
-                print(f'not ok test {test}')
+                print(f'not ok {self.env.imgfmt} {test}')
              elif status == 'not run':
-                print(f'ok test {test} # SKIP')
+                print(f'ok {self.env.imgfmt} {test} # SKIP')
              return

          if lasttime:

In fact, that's exactly what was printed in the non-TAP case.  Thanks 
for the feedback, even though it was bad! :)

Paolo


