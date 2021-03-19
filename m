Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD21341A4D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:46:07 +0100 (CET)
Received: from localhost ([::1]:54616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCdq-0004CZ-PL
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNCcJ-0003bT-40
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:44:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNCcH-0002Va-I9
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616150668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RUctsDjbfKLPr52wDWxLODLBzC2ZoCpbdoL7U/XHkKE=;
 b=U7QkyzdGNK5Rj4hIKDtirgDxsx+3eFyUrEiRsR3o1HfC3kCE83Pe08adtrfqvx4Jv6qtsG
 Wic3EMIvEhcly+JnDewl4gR6zkBvzx8Zf/kKncFLIkb9YIO5Ntc6/qboyxJ95grN5X8bEZ
 +3V7JG2S44uo1t5M2oQ8+bIX83hJriI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-MgQtacRXOm-hD3FyJV5yEg-1; Fri, 19 Mar 2021 06:44:27 -0400
X-MC-Unique: MgQtacRXOm-hD3FyJV5yEg-1
Received: by mail-wr1-f71.google.com with SMTP id m9so21669774wrx.6
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 03:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=RUctsDjbfKLPr52wDWxLODLBzC2ZoCpbdoL7U/XHkKE=;
 b=bhimKL5FT7hMcQmndEx54ZVLy7IGicp487Bdjq7tXovaDxZnaxfAa1+TXtkHjwH8Vk
 joZPahsLG1c/L6aoW2/HgCAD68tRG8AsLPZxxcktYJCGI5eeI9AxS3yi8++JqPTBRZU3
 prCQelKu81EKQdkbHpJUZ90+eUtgNA7Jb7t9vWliVWcGYz3Z4Lo2sMJgesmL0jqF9vGP
 I3WMqYX043405PZQrkQ0owTqzJVEyJxWAyWhRDztHJsujXGAfazBh9bUpXcce9hx4NLm
 sZiCY3EsWZ3AXkgs/lNbmq9mHEQ8dQPtdik1jB2QMiq17+0M+hCDHtG18mW93xD2we7O
 fnqA==
X-Gm-Message-State: AOAM533ZteX1pk7e4WQe+ecUF/9prkBZ1Sh8qEf8fDZbsb269TZPYh/N
 IQDlRslt5Vo+bw08Y2wn3k98oE1l6R3uRcw7AZVVeI9uIzIjSWiLXbPst5JlGZzCg1TehaocSLP
 K8J2EHh5Ts0uhTLU=
X-Received: by 2002:a1c:2016:: with SMTP id g22mr3116333wmg.137.1616150666070; 
 Fri, 19 Mar 2021 03:44:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1pK05+gJJi1ovP35+5VvSQ99g/MUGJHpFTMIzRDuLbw/PvMDP3VEVHeV5SbCLy72hGNvKtg==
X-Received: by 2002:a1c:2016:: with SMTP id g22mr3116319wmg.137.1616150665919; 
 Fri, 19 Mar 2021 03:44:25 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v7sm5972665wme.47.2021.03.19.03.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 03:44:25 -0700 (PDT)
To: "Daniel P . Berrange" <berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: spurious error in check-dco job?
Message-ID: <fe4d7204-610c-37f2-b928-6a833dcf1e5f@redhat.com>
Date: Fri, 19 Mar 2021 11:44:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel,

I'm getting this error sometimes in the check-dco job:

Using docker image
sha256:96fcfc3ceb2d65689c2918c1c501c45b2bd815d82e7fb3381048c9f252e7b046
for registry.gitlab.com/philmd/qemu2/qemu/centos8:latest with digest
registry.gitlab.com/philmd/qemu2/qemu/centos8@sha256:798eb3e5aa50eb04d60cdf1bfd08bcff5b443e933dcfd902ebda01927e2f6eb0
...
$ .gitlab-ci.d/check-dco.py
Traceback (most recent call last):
  File ".gitlab-ci.d/check-dco.py", line 25, in <module>
    stderr=subprocess.DEVNULL)
  File "/usr/lib64/python3.6/subprocess.py", line 311, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['git', 'fetch', 'check-dco',
'master']' returned non-zero exit status 128.

https://gitlab.com/philmd/qemu2/-/jobs/1108482890


