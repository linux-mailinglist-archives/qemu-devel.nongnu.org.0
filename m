Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAA042BACD
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 10:47:29 +0200 (CEST)
Received: from localhost ([::1]:53398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maZv6-00014Z-18
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 04:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maZtK-0008Mt-EK
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:45:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maZtF-0007bk-IO
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634114732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=isGBXbHJDVm2nC4G+CAjiwyRNMzo82kSwEutpZujJE4=;
 b=eaugRVtREutTH6ZIbtjgr0UcVnjc0PT+SF//KVNOvixt0wucLOFNuNmwILsVAgf9ZRa6U6
 j0RPwbgJWAaLgfwv+CWsFcv2tI5d91kUv8VK0LEV4fam3L85bjOA1BiTOGPMojLraqG0cR
 c2bdF2sEoa6pRmSFADBfCX25R81UfFc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-Hy9deU0NOIWxyNRaNvjV_Q-1; Wed, 13 Oct 2021 04:45:30 -0400
X-MC-Unique: Hy9deU0NOIWxyNRaNvjV_Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 41-20020adf812c000000b00160dfbfe1a2so1412511wrm.3
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 01:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=isGBXbHJDVm2nC4G+CAjiwyRNMzo82kSwEutpZujJE4=;
 b=V7XN24AESdP+LCHW6aw0DY06TRfsk/LMWMmOUpieST/2G8NCOsUKCGWqK9X9+WC1Zx
 Y0aWVp00W36VKp+eJ16GK8F9j8DYthks/Jz6402FDEJhUMYsa5rJt73t6PyhGNcETIH2
 TJRSMeby0a7LNQxLNXdh9J3xcSB2rlLsY/XGZbkxFBm2bTkZh0FDoiMOeZhfP+uICQ++
 BQdQxAw8k2n8i2CwRJepVqtdqZsWthSUQZSnQUkLV73Qejxf7if2UdJFZZ1l2sjMr/s5
 obFZh6hxj7TD9NZZT8VF8m2XLeicMl7Hm0NlPaw4wEvwfrDRY1HqrY63SihuNXoDhF9D
 5u+g==
X-Gm-Message-State: AOAM533HvQmY2r+QCDmEpxUspWpwMGYOaib/POd9yTP5xfaN604oV5ul
 2/9MRX2W4QyHsqRlsNIvwG0U5e3pWQnahiLaQZNGBq7S5LO51z0VD5uvX4ZQViQDMevvHB/E2td
 mjV63fAVBj2OH2qA=
X-Received: by 2002:adf:e9c8:: with SMTP id l8mr37635004wrn.188.1634114729288; 
 Wed, 13 Oct 2021 01:45:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmdJ84gll5WKGbfxJc4VbYI40fFT5sW0RLfwMXZ0Q8FXk+qx5bCZPhnMzyJXEk8h5FvRR8JQ==
X-Received: by 2002:adf:e9c8:: with SMTP id l8mr37634980wrn.188.1634114729052; 
 Wed, 13 Oct 2021 01:45:29 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id t3sm4542662wmj.33.2021.10.13.01.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 01:45:28 -0700 (PDT)
Message-ID: <5041f802-0b42-f130-ee68-56cd7464b75d@redhat.com>
Date: Wed, 13 Oct 2021 10:45:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 0/7] Switch iotests to using Async QMP
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211012223445.1051101-1-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211012223445.1051101-1-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.452,
 DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.10.21 00:34, John Snow wrote:
> Based-on: <20211012214152.802483-1-jsnow@redhat.com>
>            [PULL 00/10] Python patches
> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-iotest-wrapper
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/387210591
>
> Hiya,
>
> This series continues where the last two AQMP series left off and adds a
> synchronous 'legacy' wrapper around the new AQMP interface, then drops
> it straight into iotests to prove that AQMP is functional and totally
> cool and fine. The disruption and churn to iotests is pretty minimal.
>
> In the event that a regression happens and I am not physically proximate
> to inflict damage upon, one may set the QEMU_PYTHON_LEGACY_QMP variable
> to any non-empty string as it pleases you to engage the QMP machinery
> you are used to.
>
> I'd like to try and get this committed early in the 6.2 development
> cycle to give ample time to smooth over any possible regressions. I've
> tested it locally and via gitlab CI, across Python versions 3.6 through
> 3.10, and "worksforme". If something bad happens, we can revert the
> actual switch-flip very trivially.

So running iotests locally, I got one failure:

$ TEST_DIR=/tmp/vdi-tests ./check -c writethrough -vdi 300
[...]
300                             fail       [10:28:06] [10:28:11] 
5.1s                 output mismatch (see 300.out.bad)
--- /home/maxx/projects/qemu/tests/qemu-iotests/300.out
+++ 300.out.bad
@@ -1,4 +1,5 @@
-.......................................
+..............ERROR:qemu.aqmp.qmp_client.qemu-b-222963:Task.Reader: 
ConnectionResetError: [Errno 104] Connection reset by peer
+.........................
  ----------------------------------------------------------------------
  Ran 39 tests
[...]


I’m afraid I can’t really give a reproducer or anything.  It feels like 
just some random spurious timing-related error.  Although then again, 
300 does have an `except machine.AbnormalShutdown` clause at one 
point...  So perhaps that’s the culprit, and we need to disable logging 
there.

Hanna


