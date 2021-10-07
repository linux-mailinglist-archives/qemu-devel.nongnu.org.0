Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FFC42512A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 12:36:20 +0200 (CEST)
Received: from localhost ([::1]:35028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYQl8-0001Z9-Sb
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 06:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYQjH-0000kE-TC
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:34:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYQjF-0000K5-Lp
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633602859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gEkjOwHPW2Qa7IvQufRF8So4ZzmffuQ9FK7jqrrckMc=;
 b=GN3jvayjhcnKu9zdxJYYwocB59e7ZqXoLvbLP+B3EKoPZS33YoGUys18FMzCa4z+0X4CK5
 bHQ63fbDHPsbCXcIMdCbZCxdBu7aXTSYwlcNYdjzIAGb1kC5APQLm4kLm+YWATAHHZL7e7
 +xoKVOsgN0vHDZbM36AtSevRbG4PW50=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-P2se9WIcNeWEK2CEAa5l4Q-1; Thu, 07 Oct 2021 06:34:18 -0400
X-MC-Unique: P2se9WIcNeWEK2CEAa5l4Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 c7-20020a05640227c700b003d27f41f1d4so5422499ede.16
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 03:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gEkjOwHPW2Qa7IvQufRF8So4ZzmffuQ9FK7jqrrckMc=;
 b=DPhVsXA3ycHDJa6BzBeQdklw+bvt4iNvsYgKuV3ObErjfOLLLyW3dReTiaHnAxySzy
 Gk/Afwmyr06JHm6ZZhAQacKfaT5FjWvGizBZd2EW0c39ag5FCSBSI9dAC4f2d2xWvkIq
 tUfhpjUOQ8Y+FGEQ+TywXDy2SBTV3Hd9db7YRBB67OaLefovEa7ArM95s0KmO2PeDyI7
 7+RHLlxMDBGLWAJcvoQO7qCPEJgLf1ANSoU4Ha+QgWPe2RLe7sfSY8C0U616atdZRZUB
 V9fRLf7egFy7J9iJ2MvoZ/9S9UfZraE2/RKSxRWk4LiQWfK+1b6u3Gdkrb0HEvyyfbWf
 oRpQ==
X-Gm-Message-State: AOAM533uTwU93OX8nTlYiDv29Oo/e9uOwqMDH6EIsN8Hi4P5jn5FqlQ0
 Z82egaKZKjznwhKDTNA9gnPEVHMjTEPj7EbjkTPrLvA/Hf8X5s7YvZV6wn1NfqJ8D1Nz5heyrXm
 riaTkCkwd+AlCobnpdudom4axWIFBYDiD2s81QcZ2ZT/eleGfHfzW0nBbG0MLzp3PIZQ=
X-Received: by 2002:a50:cf4d:: with SMTP id d13mr5218219edk.50.1633602856979; 
 Thu, 07 Oct 2021 03:34:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtiGvJzDDSIgjcGpXhj9/FrT+Jn+A9pl+GRdD8oa+ufmum3c6FdX/OwyfiVxGaeULMEo+kQQ==
X-Received: by 2002:a50:cf4d:: with SMTP id d13mr5218073edk.50.1633602855570; 
 Thu, 07 Oct 2021 03:34:15 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 bm1sm9982958ejb.38.2021.10.07.03.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 03:34:15 -0700 (PDT)
Subject: Re: [PATCH 1/2] pylint: fix errors and warnings from qemu-tests test
 297
To: Kevin Wolf <kwolf@redhat.com>
References: <20211006130100.389521-1-eesposit@redhat.com>
 <20211006130100.389521-2-eesposit@redhat.com> <YV3S9N8SnU4W+aYL@redhat.com>
 <3a143653-582e-5b28-f536-bf24c4e45ac8@redhat.com>
 <YV6zwkzPDxgOeIoW@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <6b234a38-1604-ba25-2542-a353e2150c94@redhat.com>
Date: Thu, 7 Oct 2021 12:34:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YV6zwkzPDxgOeIoW@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>> The error is "C0330: Wrong hanging indentation"
>> so it is not about dicts. I guess we can disable the error, but the problem
>> is that we will disable it for the whole file, which doesn't seem right.
> 
> Actually, I would disable it globally in pylintrc because building
> dictionaries for JSON is something that we do a lot.
> 
> But then I'm surprised that this is the only instance that actually
> fails. I wonder what the difference is.
> 
> For example, 129 doesn't seem to be skipped and has this code:


> 
>      result = self.vm.qmp('blockdev-add', **{
>                               'node-name': 'overlay',
>                               'driver': iotests.imgfmt,
>                               'file': {
>                                   'driver': 'file',
>                                   'filename': self.overlay_img
>                               }
>                           })
> 
> Yet you don't report a pylint error for this file.

Well, unless I am misunderstanding something... 129 *is* the file I am 
reporting. And that is exactly the function where pylint complains.

> 
> Oooh... I think I do see a difference: The final line is indented by one
> space more in the case that fails for you. It should be vertically
> aligned with the "'" in the first line, but it is actually aligned with
> the "b" of "blockdev-add"
> 
> Does removing one space of indentation in the last line fix the report?

It's not only the final line, it's from "**{" till the ending ")".
'node-name' is under "ock" of 'blockdev-add'. It is clearly bad 
indented, regardless of the new style and pylint new rules.

Pylint itself suggests to move it 4 spaces more than "result =", ie 21 
spaces before.

Still, applying your suggestion to all the lines and removing 1 space 
from all lines still does not make pylint happy, as it asks to remove 20 
spaces.

To simplify things, this is the error I get:

  === pylint ===
+************* Module 129
+129:91:0: C0330: Wrong hanging indentation (remove 21 spaces).
+                                 'node-name': 'overlay',
+            |                    ^ (bad-continuation)
+129:92:0: C0330: Wrong hanging indentation (remove 21 spaces).
+                                 'driver': iotests.imgfmt,
+            |                    ^ (bad-continuation)
+129:93:0: C0330: Wrong hanging indentation (remove 21 spaces).
+                                 'file': {
+            |                    ^ (bad-continuation)
+129:97:0: C0330: Wrong hanging indentation.
+                             })
+        |   |                ^ (bad-continuation)

So unless you want to disable it overall, one way of fixing 129 is to 
follow what pylint suggests, and do like I wrote in the previous email:

Either:
         result = self.vm.qmp('blockdev-add', **{
             'node-name': 'overlay', 		<-- 21 spaces less
             'driver': iotests.imgfmt,		<-- 21 spaces less
             'file': {				<-- 21 spaces less
                 'driver': 'file',		<-- 21 spaces less
                 'filename': self.overlay_img	<-- 21 spaces less
             }					<-- 21 spaces less
         })					<-- 21 spaces less
	
or (difference is in the last line only):
         result = self.vm.qmp('blockdev-add', **{
             'node-name': 'overlay', 		<-- 21 spaces less
             'driver': iotests.imgfmt,		<-- 21 spaces less
             'file': {				<-- 21 spaces less
                 'driver': 'file',		<-- 21 spaces less
                 'filename': self.overlay_img	<-- 21 spaces less
             }})					<-- 21 spaces less
Emanuele


